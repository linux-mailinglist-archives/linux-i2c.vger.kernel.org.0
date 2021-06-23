Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39D7E3B1618
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Jun 2021 10:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229999AbhFWIqP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Jun 2021 04:46:15 -0400
Received: from smtp3.hiworks.co.kr ([121.254.168.205]:34613 "EHLO
        smtp3.hiworks.co.kr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229918AbhFWIqO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Jun 2021 04:46:14 -0400
Received: (qmail 155734 invoked from network); 23 Jun 2021 17:37:15 +0900
Received: from unknown (HELO hiworks.co.kr) (192.168.10.101)
        by 0 (qmail 1.03 + ejcp v14) with SMTP;
        23 Jun 2021 17:37:15 +0900
Received: (qmail 109303 invoked from network); 23 Jun 2021 17:37:15 +0900
Received: from unknown (HELO localhost.localdomain) (tykwon@m2i.co.kr@58.75.176.98)
        by 0 (qmail 1.03 + ejcp v14) with SMTP;
        23 Jun 2021 17:37:15 +0900
X-Authinfo: HIWORKS SMTP authenticated <tykwon@m2i.co.kr|58.75.176.98|tykwon@m2i.co.kr|210623173715_6023108200>
From:   Kwon Tae-young <tykwon@m2i.co.kr>
To:     Oleksij Rempel <linux@rempel-privat.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>
Cc:     Kwon Tae-young <tykwon@m2i.co.kr>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] i2c/imx: Fix some checkpatch warnings
Date:   Wed, 23 Jun 2021 17:36:43 +0900
Message-Id: <20210623083643.395-1-tykwon@m2i.co.kr>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Fix the following warnings reported by checkpatch::
drivers/i2c/busses/i2c-imx.c:173: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
drivers/i2c/busses/i2c-imx.c:175: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
drivers/i2c/busses/i2c-imx.c:176: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
drivers/i2c/busses/i2c-imx.c:177: WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
drivers/i2c/busses/i2c-imx.c:455: WARNING: Unnecessary ftrace-like logging - prefer using ftrace
drivers/i2c/busses/i2c-imx.c:602: WARNING: Unnecessary ftrace-like logging - prefer using ftrace
drivers/i2c/busses/i2c-imx.c:638: WARNING: Unnecessary ftrace-like logging - prefer using ftrace
drivers/i2c/busses/i2c-imx.c:1170: WARNING: Unnecessary ftrace-like logging - prefer using ftrace
drivers/i2c/busses/i2c-imx.c:1374: WARNING: Unnecessary ftrace-like logging - prefer using ftrace
drivers/i2c/busses/i2c-imx.c:1398: WARNING: Prefer strscpy over strlcpy - see: https://lore.kernel.org/r/CAHk-=wgfRnXz0W3D37d01q3JFkr_i_uTL=V6A6G1oUZcprmknw@mail.gmail.com/

Signed-off-by: Kwon Tae-young <tykwon@m2i.co.kr>
---
 drivers/i2c/busses/i2c-imx.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index dc5ca71906db..d5b5f084a27d 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -170,11 +170,11 @@ enum imx_i2c_type {
 
 struct imx_i2c_hwdata {
 	enum imx_i2c_type	devtype;
-	unsigned		regshift;
+	unsigned int		regshift;
 	struct imx_i2c_clk_pair	*clk_div;
-	unsigned		ndivs;
-	unsigned		i2sr_clr_opcode;
-	unsigned		i2cr_ien_opcode;
+	unsigned int		ndivs;
+	unsigned int		i2sr_clr_opcode;
+	unsigned int		i2cr_ien_opcode;
 };
 
 struct imx_i2c_dma {
@@ -452,8 +452,6 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy, bool a
 	unsigned long orig_jiffies = jiffies;
 	unsigned int temp;
 
-	dev_dbg(&i2c_imx->adapter.dev, "<%s>\n", __func__);
-
 	while (1) {
 		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
 
@@ -599,8 +597,6 @@ static int i2c_imx_start(struct imx_i2c_struct *i2c_imx, bool atomic)
 	unsigned int temp = 0;
 	int result;
 
-	dev_dbg(&i2c_imx->adapter.dev, "<%s>\n", __func__);
-
 	imx_i2c_write_reg(i2c_imx->ifdr, i2c_imx, IMX_I2C_IFDR);
 	/* Enable I2C controller */
 	imx_i2c_write_reg(i2c_imx->hwdata->i2sr_clr_opcode, i2c_imx, IMX_I2C_I2SR);
@@ -635,7 +631,6 @@ static void i2c_imx_stop(struct imx_i2c_struct *i2c_imx, bool atomic)
 
 	if (!i2c_imx->stopped) {
 		/* Stop I2C transaction */
-		dev_dbg(&i2c_imx->adapter.dev, "<%s>\n", __func__);
 		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
 		if (!(temp & I2CR_MSTA))
 			i2c_imx->stopped = 1;
@@ -1167,8 +1162,6 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
 	bool is_lastmsg = false;
 	struct imx_i2c_struct *i2c_imx = i2c_get_adapdata(adapter);
 
-	dev_dbg(&i2c_imx->adapter.dev, "<%s>\n", __func__);
-
 	/* Start I2C transfer */
 	result = i2c_imx_start(i2c_imx, atomic);
 	if (result) {
@@ -1371,8 +1364,6 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	dma_addr_t phy_addr;
 	const struct imx_i2c_hwdata *match;
 
-	dev_dbg(&pdev->dev, "<%s>\n", __func__);
-
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
@@ -1395,7 +1386,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
 				platform_get_device_id(pdev)->driver_data;
 
 	/* Setup i2c_imx driver structure */
-	strlcpy(i2c_imx->adapter.name, pdev->name, sizeof(i2c_imx->adapter.name));
+	strscpy(i2c_imx->adapter.name, pdev->name, sizeof(i2c_imx->adapter.name));
 	i2c_imx->adapter.owner		= THIS_MODULE;
 	i2c_imx->adapter.algo		= &i2c_imx_algo;
 	i2c_imx->adapter.dev.parent	= &pdev->dev;
-- 
2.17.1

