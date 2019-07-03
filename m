Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE345E97F
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jul 2019 18:47:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbfGCQrm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Jul 2019 12:47:42 -0400
Received: from unicorn.mansr.com ([81.2.72.234]:58034 "EHLO unicorn.mansr.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726430AbfGCQrm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 3 Jul 2019 12:47:42 -0400
Received: by unicorn.mansr.com (Postfix, from userid 51770)
        id 7637C1538A; Wed,  3 Jul 2019 17:47:39 +0100 (BST)
From:   Mans Rullgard <mans@mansr.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Subject: [RESEND][PATCH] i2c: imx: add support for I2C_M_STOP flag
Date:   Wed,  3 Jul 2019 17:47:32 +0100
Message-Id: <20190703164732.27973-1-mans@mansr.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
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
index 7bd409eaf0ac..a7f801bb5dc9 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -908,10 +908,17 @@ static int i2c_imx_xfer(struct i2c_adapter *adapter,
 
 	/* read/write data */
 	for (i = 0; i < num; i++) {
-		if (i == num - 1)
-			is_lastmsg = true;
+		if (is_lastmsg) {
+			/* previous message had I2C_M_STOP flag set */
+			temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+			temp |= I2CR_MSTA;
+			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+			result = i2c_imx_bus_busy(i2c_imx, 1);
+			if (result)
+				goto fail0;
+		}
 
-		if (i) {
+		if (i && !is_lastmsg) {
 			dev_dbg(&i2c_imx->adapter.dev,
 				"<%s> repeated start\n", __func__);
 			temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
@@ -921,6 +928,10 @@ static int i2c_imx_xfer(struct i2c_adapter *adapter,
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
@@ -948,6 +959,13 @@ static int i2c_imx_xfer(struct i2c_adapter *adapter,
 				result = i2c_imx_dma_write(i2c_imx, &msgs[i]);
 			else
 				result = i2c_imx_write(i2c_imx, &msgs[i]);
+
+			if (msgs[i].flags & I2C_M_STOP) {
+				temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+				temp &= ~I2CR_MSTA;
+				imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+				i2c_imx_bus_busy(i2c_imx, 0);
+			}
 		}
 		if (result)
 			goto fail0;
@@ -1034,7 +1052,7 @@ static int i2c_imx_init_recovery_info(struct imx_i2c_struct *i2c_imx,
 
 static u32 i2c_imx_func(struct i2c_adapter *adapter)
 {
-	return I2C_FUNC_I2C | I2C_FUNC_SMBUS_EMUL
+	return I2C_FUNC_I2C | I2C_FUNC_PROTOCOL_MANGLING | I2C_FUNC_SMBUS_EMUL
 		| I2C_FUNC_SMBUS_READ_BLOCK_DATA;
 }
 
-- 
2.22.0

