Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 580D277B75C
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Aug 2023 13:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbjHNLPv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Aug 2023 07:15:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233029AbjHNLPo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Aug 2023 07:15:44 -0400
Received: from TWMBX03.aspeed.com (mail.aspeedtech.com [211.20.114.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 391DBE58;
        Mon, 14 Aug 2023 04:15:38 -0700 (PDT)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX03.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 14 Aug
 2023 19:15:35 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 14 Aug 2023 19:15:35 +0800
From:   Tommy Huang <tommy_huang@aspeedtech.com>
To:     <brendan.higgins@linux.dev>, <andi.shyti@kernel.org>,
        <p.zabel@pengutronix.de>, <linux-i2c@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>
CC:     <benh@kernel.crashing.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        <BMC-SW@aspeedtech.com>
Subject: [PATCH] drivers:i2c:add controller reset when the timeout occurred
Date:   Mon, 14 Aug 2023 19:15:34 +0800
Message-ID: <20230814111534.2771900-1-tommy_huang@aspeedtech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_FAIL,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

1.Call i2c controller reset when the i2c transfer timeout occurred.
The rest of interrupts and device should be reset avoid unperdicted
controller behavior occurred.

Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 2e5acfeb76c8..1900954deb55 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -699,12 +699,16 @@ static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
 	if (time_left == 0) {
 		/*
 		 * If timed out and bus is still busy in a multi master
-		 * environment, attempt recovery at here.
+		 * environment, attempt recovery at here. Even the bus is
+		 * idle, we still need reset i2c controller avoid rest of
+		 * interrupts.
 		 */
 		if (bus->multi_master &&
 		    (readl(bus->base + ASPEED_I2C_CMD_REG) &
 		     ASPEED_I2CD_BUS_BUSY_STS))
 			aspeed_i2c_recover_bus(bus);
+		else
+			aspeed_i2c_reset(bus);
 
 		/*
 		 * If timed out and the state is still pending, drop the pending
-- 
2.25.1

