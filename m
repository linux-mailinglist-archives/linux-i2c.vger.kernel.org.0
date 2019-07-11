Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 75BCE65491
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jul 2019 12:35:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728252AbfGKKfT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Jul 2019 06:35:19 -0400
Received: from inva020.nxp.com ([92.121.34.13]:40838 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725962AbfGKKfT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 11 Jul 2019 06:35:19 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CBF531A0191;
        Thu, 11 Jul 2019 12:35:16 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4C4811A099D;
        Thu, 11 Jul 2019 12:35:10 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 78CD7402DB;
        Thu, 11 Jul 2019 18:35:02 +0800 (SGT)
From:   Chuanhua Han <chuanhua.han@nxp.com>
To:     rjw@rjwysocki.net, lenb@kernel.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de
Cc:     linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        leoyang.li@nxp.com, Chuanhua Han <chuanhua.han@nxp.com>,
        Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>,
        Udit Kumar <udit.kumar@nxp.com>
Subject: [PATCH] ACPI: support for NXP i2c controller
Date:   Thu, 11 Jul 2019 18:26:01 +0800
Message-Id: <20190711102601.20582-1-chuanhua.han@nxp.com>
X-Mailer: git-send-email 2.9.5
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Enable NXP i2c controller to boot with ACPI

Signed-off-by: Meenakshi Aggarwal <meenakshi.aggarwal@nxp.com>
Signed-off-by: Udit Kumar <udit.kumar@nxp.com>
Signed-off-by: Chuanhua Han <chuanhua.han@nxp.com>
---
 drivers/acpi/acpi_apd.c      |  6 ++++++
 drivers/i2c/busses/i2c-imx.c | 15 +++++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
index ff47317..cf8566c 100644
--- a/drivers/acpi/acpi_apd.c
+++ b/drivers/acpi/acpi_apd.c
@@ -165,6 +165,11 @@ static const struct apd_device_desc thunderx2_i2c_desc = {
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
@@ -238,6 +243,7 @@ static const struct acpi_device_id acpi_apd_device_ids[] = {
 	{ "HISI02A1", APD_ADDR(hip07_i2c_desc) },
 	{ "HISI02A2", APD_ADDR(hip08_i2c_desc) },
 	{ "HISI0173", APD_ADDR(hip08_spi_desc) },
+	{ "NXP0001", APD_ADDR(nxp_i2c_desc) },
 #endif
 	{ }
 };
diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index b1b8b93..99f9b96 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -44,6 +44,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/acpi.h>
 
 /* This will be the driver name the kernel reports */
 #define DRIVER_NAME "imx-i2c"
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
@@ -1052,6 +1059,9 @@ static int i2c_imx_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *of_id = of_match_device(i2c_imx_dt_ids,
 							   &pdev->dev);
+	const struct acpi_device_id *acpi_id =
+			acpi_match_device(i2c_imx_acpi_ids,
+					  &pdev->dev);
 	struct imx_i2c_struct *i2c_imx;
 	struct resource *res;
 	struct imxi2c_platform_data *pdata = dev_get_platdata(&pdev->dev);
@@ -1079,6 +1089,9 @@ static int i2c_imx_probe(struct platform_device *pdev)
 
 	if (of_id)
 		i2c_imx->hwdata = of_id->data;
+	else if (acpi_id)
+		i2c_imx->hwdata = (struct imx_i2c_hwdata *)
+				acpi_id->driver_data;
 	else
 		i2c_imx->hwdata = (struct imx_i2c_hwdata *)
 				platform_get_device_id(pdev)->driver_data;
@@ -1091,6 +1104,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	i2c_imx->adapter.nr		= pdev->id;
 	i2c_imx->adapter.dev.of_node	= pdev->dev.of_node;
 	i2c_imx->base			= base;
+	ACPI_COMPANION_SET(&i2c_imx->adapter.dev, ACPI_COMPANION(&pdev->dev));
 
 	/* Get I2C clock */
 	i2c_imx->clk = devm_clk_get(&pdev->dev, NULL);
@@ -1253,6 +1267,7 @@ static struct platform_driver i2c_imx_driver = {
 		.name = DRIVER_NAME,
 		.pm = &i2c_imx_pm_ops,
 		.of_match_table = i2c_imx_dt_ids,
+		.acpi_match_table = ACPI_PTR(i2c_imx_acpi_ids),
 	},
 	.id_table = imx_i2c_devtype,
 };
-- 
2.9.5

