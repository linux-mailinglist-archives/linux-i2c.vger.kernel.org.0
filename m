Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59237749CD5
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jul 2023 14:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbjGFM6K (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jul 2023 08:58:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229490AbjGFM6K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jul 2023 08:58:10 -0400
Received: from unicorn.mansr.com (unicorn.mansr.com [81.2.72.234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC5F01994;
        Thu,  6 Jul 2023 05:58:07 -0700 (PDT)
Received: from raven.mansr.com (raven.mansr.com [IPv6:2001:8b0:ca0d:1::3])
        by unicorn.mansr.com (Postfix) with ESMTPS id DE08515360;
        Thu,  6 Jul 2023 13:58:03 +0100 (BST)
Received: by raven.mansr.com (Postfix, from userid 51770)
        id CF8DB219FC1; Thu,  6 Jul 2023 13:58:03 +0100 (BST)
From:   Mans Rullgard <mans@mansr.com>
To:     Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>
Cc:     Andi Shyti <andi.shyti@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] i2c: imx: add support for I2C_M_STOP flag
Date:   Thu,  6 Jul 2023 13:57:29 +0100
Message-ID: <20230706125729.17335-1-mans@mansr.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for the I2C_M_STOP flag to the i2c-imx driver.  This allows
devices requiring a stop between messages to work with this controller.

Signed-off-by: Mans Rullgard <mans@mansr.com>
---
 drivers/i2c/busses/i2c-imx.c | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 42189a5f2905..f59d086688ff 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1262,10 +1262,17 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
 
 	/* read/write data */
 	for (i = 0; i < num; i++) {
-		if (i == num - 1)
-			is_lastmsg = true;
+		if (is_lastmsg) {
+			/* previous message had I2C_M_STOP flag set */
+			temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+			temp |= I2CR_MSTA;
+			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+			result = i2c_imx_bus_busy(i2c_imx, 1, atomic);
+			if (result)
+				goto fail0;
+		}
 
-		if (i) {
+		if (i && !is_lastmsg) {
 			dev_dbg(&i2c_imx->adapter.dev,
 				"<%s> repeated start\n", __func__);
 			temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
@@ -1275,6 +1282,10 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
 			if (result)
 				goto fail0;
 		}
+
+		if (i == num - 1 || (msgs[i].flags & I2C_M_STOP))
+			is_lastmsg = true;
+
 		dev_dbg(&i2c_imx->adapter.dev,
 			"<%s> transfer message: %d\n", __func__, i);
 		/* write/read data */
@@ -1304,6 +1315,13 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
 				result = i2c_imx_dma_write(i2c_imx, &msgs[i]);
 			else
 				result = i2c_imx_write(i2c_imx, &msgs[i], atomic);
+
+			if (msgs[i].flags & I2C_M_STOP) {
+				temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+				temp &= ~I2CR_MSTA;
+				imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+				i2c_imx_bus_busy(i2c_imx, 0, atomic);
+			}
 		}
 		if (result)
 			goto fail0;
@@ -1425,7 +1443,7 @@ static int i2c_imx_init_recovery_info(struct imx_i2c_struct *i2c_imx,
 
 static u32 i2c_imx_func(struct i2c_adapter *adapter)
 {
-	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL
+	return I2C_FUNC_I2C | I2C_FUNC_PROTOCOL_MANGLING | I2C_FUNC_SMBUS_EMUL
 		| I2C_FUNC_SMBUS_READ_BLOCK_DATA;
 }
 
-- 
2.41.0

