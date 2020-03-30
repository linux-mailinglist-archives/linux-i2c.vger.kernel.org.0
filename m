Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B28E0197BB2
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Mar 2020 14:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729785AbgC3MTZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 30 Mar 2020 08:19:25 -0400
Received: from inva021.nxp.com ([92.121.34.21]:58472 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729705AbgC3MTZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 30 Mar 2020 08:19:25 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id EE1722004B4;
        Mon, 30 Mar 2020 14:19:23 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 8FEF82004AE;
        Mon, 30 Mar 2020 14:19:19 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id D58E140297;
        Mon, 30 Mar 2020 20:19:13 +0800 (SGT)
From:   Biwen Li <biwen.li@oss.nxp.com>
To:     leoyang.li@nxp.com, linux@rempel-privat.de, kernel@pengutronix.de,
        wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        jiafei.pan@nxp.com, Biwen Li <biwen.li@nxp.com>
Subject: [PATCH] i2c: imx: add shutdown interface
Date:   Mon, 30 Mar 2020 20:15:46 +0800
Message-Id: <20200330121546.23872-1-biwen.li@oss.nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Biwen Li <biwen.li@nxp.com>

Add shutdown interface

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
 drivers/i2c/busses/i2c-imx.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 0ab5381aa012..07da42cb0be4 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1281,6 +1281,16 @@ static int i2c_imx_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void i2c_imx_shutdown(struct platform_device *pdev)
+{
+	struct imx_i2c_struct *i2c_imx = platform_get_drvdata(pdev);
+
+	imx_i2c_write_reg(0, i2c_imx, IMX_I2C_IADR);
+	imx_i2c_write_reg(i2c_imx->hwdata->i2cr_ien_opcode ^ I2CR_IEN,
+			i2c_imx, IMX_I2C_I2CR);
+	imx_i2c_write_reg(i2c_imx->hwdata->i2sr_clr_opcode, i2c_imx, IMX_I2C_I2SR);
+}
+
 static int __maybe_unused i2c_imx_runtime_suspend(struct device *dev)
 {
 	struct imx_i2c_struct *i2c_imx = dev_get_drvdata(dev);
@@ -1310,6 +1320,7 @@ static const struct dev_pm_ops i2c_imx_pm_ops = {
 static struct platform_driver i2c_imx_driver = {
 	.probe = i2c_imx_probe,
 	.remove = i2c_imx_remove,
+	.shutdown = i2c_imx_shutdown,
 	.driver = {
 		.name = DRIVER_NAME,
 		.pm = &i2c_imx_pm_ops,
-- 
2.17.1

