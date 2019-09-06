Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B623AB3A6
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2019 10:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729217AbfIFIEC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 6 Sep 2019 04:04:02 -0400
Received: from inva021.nxp.com ([92.121.34.21]:55324 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728742AbfIFIEC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 6 Sep 2019 04:04:02 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 042B8200589;
        Fri,  6 Sep 2019 10:03:59 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 321242000EC;
        Fri,  6 Sep 2019 10:03:52 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id E4747402A5;
        Fri,  6 Sep 2019 16:03:43 +0800 (SGT)
From:   Biwen Li <biwen.li@nxp.com>
To:     andy.shevchenko@gmail.com, rafael@kernel.org, leoyang.li@nxp.com,
        meenakshi.aggarwal@nxp.com, udit.kumar@nxp.com, wsa@the-dreams.de,
        rjw@rjwysocki.net
Cc:     chuanhua.han@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Biwen Li <biwen.li@nxp.com>
Subject: [v2] ACPI: support for NXP i2c controller
Date:   Fri,  6 Sep 2019 15:53:19 +0800
Message-Id: <20190906075319.21244-1-biwen.li@nxp.com>
X-Mailer: git-send-email 2.9.5
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Chuanhua Han <chuanhua.han@nxp.com>

Enable NXP i2c controller to boot with ACPI

Signed-off-by: Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>
Signed-off-by: Udit Kumar <udit.kumar@nxp.com>
Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>
Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
Change in v2:
	- Simplify code
	- Adjust header file order
	- Not use ACPI_PTR()

 drivers/acpi/acpi_apd.c      |  7 +++++++
 drivers/i2c/busses/i2c-imx.c | 17 +++++++++++++----
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
index 7cd0c9ac71ea..71511ae2dfcd 100644
--- a/drivers/acpi/acpi_apd.c
+++ b/drivers/acpi/acpi_apd.c
@@ -160,11 +160,17 @@ static const struct apd_device_desc hip08_i2c_desc = {
 	.setup = acpi_apd_setup,
 	.fixed_clk_rate = 250000000,
 };
+
 static const struct apd_device_desc thunderx2_i2c_desc = {
 	.setup = acpi_apd_setup,
 	.fixed_clk_rate = 125000000,
 };
 
+static const struct apd_device_desc nxp_i2c_desc = {
+	.setup = acpi_apd_setup,
+	.fixed_clk_rate = 350000000,
+};
+
 static const struct apd_device_desc hip08_spi_desc = {
 	.setup = acpi_apd_setup,
 	.fixed_clk_rate = 250000000,
@@ -238,6 +244,7 @@ static const struct acpi_device_id acpi_apd_device_ids[] = {
 	{ "HISI02A1", APD_ADDR(hip07_i2c_desc) },
 	{ "HISI02A2", APD_ADDR(hip08_i2c_desc) },
 	{ "HISI0173", APD_ADDR(hip08_spi_desc) },
+	{ "NXP0001", APD_ADDR(nxp_i2c_desc) },
 #endif
 	{ }
 };
diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 15f6cde6452f..a3b61336fe55 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -20,6 +20,7 @@
  *
  */
 
+#include <linux/acpi.h>
 #include <linux/clk.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
@@ -255,6 +256,12 @@ static const struct of_device_id i2c_imx_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, i2c_imx_dt_ids);
 
+static const struct acpi_device_id i2c_imx_acpi_ids[] = {
+	{"NXP0001", .driver_data = (kernel_ulong_t)&vf610_i2c_hwdata},
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, i2c_imx_acpi_ids);
+
 static inline int is_imx1_i2c(struct imx_i2c_struct *i2c_imx)
 {
 	return i2c_imx->hwdata->devtype == IMX1_I2C;
@@ -1048,14 +1055,13 @@ static const struct i2c_algorithm i2c_imx_algo = {
 
 static int i2c_imx_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *of_id = of_match_device(i2c_imx_dt_ids,
-							   &pdev->dev);
 	struct imx_i2c_struct *i2c_imx;
 	struct resource *res;
 	struct imxi2c_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	void __iomem *base;
 	int irq, ret;
 	dma_addr_t phy_addr;
+	const struct imx_i2c_hwdata *match;
 
 	dev_dbg(&pdev->dev, "<%s>\n", __func__);
 
@@ -1075,8 +1081,9 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	if (!i2c_imx)
 		return -ENOMEM;
 
-	if (of_id)
-		i2c_imx->hwdata = of_id->data;
+	match = device_get_match_data(&pdev->dev);
+	if (match)
+		i2c_imx->hwdata = match;
 	else
 		i2c_imx->hwdata = (struct imx_i2c_hwdata *)
 				platform_get_device_id(pdev)->driver_data;
@@ -1089,6 +1096,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	i2c_imx->adapter.nr		= pdev->id;
 	i2c_imx->adapter.dev.of_node	= pdev->dev.of_node;
 	i2c_imx->base			= base;
+	ACPI_COMPANION_SET(&i2c_imx->adapter.dev, ACPI_COMPANION(&pdev->dev));
 
 	/* Get I2C clock */
 	i2c_imx->clk = devm_clk_get(&pdev->dev, NULL);
@@ -1247,6 +1255,7 @@ static struct platform_driver i2c_imx_driver = {
 		.name = DRIVER_NAME,
 		.pm = &i2c_imx_pm_ops,
 		.of_match_table = i2c_imx_dt_ids,
+		.acpi_match_table = i2c_imx_acpi_ids,
 	},
 	.id_table = imx_i2c_devtype,
 };
-- 
2.17.1

