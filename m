Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FA9C7A83A6
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Sep 2023 15:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234771AbjITNlt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 Sep 2023 09:41:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234626AbjITNls (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 20 Sep 2023 09:41:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2E27AD
        for <linux-i2c@vger.kernel.org>; Wed, 20 Sep 2023 06:41:42 -0700 (PDT)
Received: from mail.ideasonboard.com (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09E91B75;
        Wed, 20 Sep 2023 15:40:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1695217204;
        bh=4DAnwKdiJcD3tRa/uKhRksrsVpdH55e7eVQWVHpgpNM=;
        h=From:To:Cc:Subject:Date:From;
        b=sr1CHmliMZH5G5oiM21cWFiiZXMzbKOZWYSxZ8ruF9+ypUQYKa08UK2QSKn2cfaoj
         prliP36BKftZ0BK/b/GqFBQKGtd7+dbaOKlXbu0mQiJocFqa6ZM/nhEY/PMNP+/xp1
         acw5m5fdb04tnAAh71Cu0ogJtH2d58k1XFR5RV1k=
From:   Daniel Scally <dan.scally@ideasonboard.com>
To:     Michal Simek <michal.simek@amd.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Cc:     Raviteja Narayanam <raviteja.narayanam@xilinx.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
Subject: [PATCH] i2c: xiic: Correct return value check for xiic_reinit()
Date:   Wed, 20 Sep 2023 14:41:09 +0100
Message-Id: <20230920134109.2232769-1-dan.scally@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The error paths for xiic_reinit() return negative values on failure
and 0 on success - this error message therefore is triggered on
_success_ rather than failure. Correct the condition so it's only
shown on failure as intended.

Fixes: 8fa9c9388053 ("i2c: xiic: return value of xiic_reinit")
Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
---
 drivers/i2c/busses/i2c-xiic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index b3bb97762c85..71391b590ada 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -710,7 +710,7 @@ static irqreturn_t xiic_process(int irq, void *dev_id)
 		 * reset the IP instead of just flush fifos
 		 */
 		ret = xiic_reinit(i2c);
-		if (!ret)
+		if (ret < 0)
 			dev_dbg(i2c->adap.dev.parent, "reinit failed\n");
 
 		if (i2c->rx_msg) {
-- 
2.34.1

