Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF342790F9A
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Sep 2023 03:25:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234582AbjIDBZR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 3 Sep 2023 21:25:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230418AbjIDBZQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 3 Sep 2023 21:25:16 -0400
Received: from TWMBX03.aspeed.com (mail.aspeedtech.com [211.20.114.72])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED7EBF0;
        Sun,  3 Sep 2023 18:25:09 -0700 (PDT)
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX03.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 4 Sep
 2023 09:25:06 +0800
Received: from twmbx02.aspeed.com (192.168.10.10) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 4 Sep 2023 09:25:06 +0800
From:   Tommy Huang <tommy_huang@aspeedtech.com>
To:     <brendan.higgins@linux.dev>, <andi.shyti@kernel.org>,
        <p.zabel@pengutronix.de>, <linux-i2c@vger.kernel.org>,
        <openbmc@lists.ozlabs.org>
CC:     <benh@kernel.crashing.org>, <joel@jms.id.au>, <andrew@aj.id.au>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <jae.hyun.yoo@linux.intel.com>,
        <linux-kernel@vger.kernel.org>, <BMC-SW@aspeedtech.com>,
        <stable@vger.kernel.org>
Subject: [PATCH] i2c: aspeed: Reset the i2c controller when timeout occurs
Date:   Mon, 4 Sep 2023 09:25:05 +0800
Message-ID: <20230904012505.340455-1-tommy_huang@aspeedtech.com>
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

Reset the i2c controller when an i2c transfer timeout occurs.
The remaining interrupts and device should be reset to avoid
unpredictable controller behavior.

Fixes: 2e57b7cebb98 ("i2c: aspeed: Add multi-master use case support")
Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: <stable@vger.kernel.org> # v5.1+

Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>
---
 drivers/i2c/busses/i2c-aspeed.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
index 2e5acfeb76c8..5a416b39b818 100644
--- a/drivers/i2c/busses/i2c-aspeed.c
+++ b/drivers/i2c/busses/i2c-aspeed.c
@@ -698,13 +698,16 @@ static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
 
 	if (time_left == 0) {
 		/*
-		 * If timed out and bus is still busy in a multi master
-		 * environment, attempt recovery at here.
+		 * In a multi-master setup, if a timeout occurs, attempt
+		 * recovery. But if the bus is idle, we still need to reset the
+		 * i2c controller to clear the remaining interrupts.
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

