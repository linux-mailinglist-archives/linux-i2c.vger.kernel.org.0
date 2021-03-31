Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A0843503CA
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Mar 2021 17:49:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235566AbhCaPtW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 31 Mar 2021 11:49:22 -0400
Received: from mga17.intel.com ([192.55.52.151]:46683 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235268AbhCaPss (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 31 Mar 2021 11:48:48 -0400
IronPort-SDR: n+afyRBy1rsQmkwSJ9KWQugf2DwSoL2O/8/5aE673jMvL0zW4Yuwr+2CmmVBt++Bi69lcrCvza
 AHjCgJO3fBXQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9940"; a="172065717"
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="172065717"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2021 08:48:48 -0700
IronPort-SDR: ooAw368G+lzlMcft/5VcAfS12EaqwYFAPvrTWCoGEEQu1lSQYdr9iK+gVrE6g2G4J56LYaioyz
 vu84hBjpuSVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,293,1610438400"; 
   d="scan'208";a="445764408"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 31 Mar 2021 08:48:45 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 28B89199; Wed, 31 Mar 2021 18:49:00 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Lee Jones <lee.jones@linaro.org>, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v1 1/2] =?UTF-8?q?mfd:=20intel=5Fquark=5Fi2c=5Fgpio:=20Con?= =?UTF-8?q?vert=20I=C2=B2C=20to=20use=20software=20nodes?=
Date:   Wed, 31 Mar 2021 18:48:50 +0300
Message-Id: <20210331154851.8456-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331154851.8456-1-andriy.shevchenko@linux.intel.com>
References: <20210331154851.8456-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The driver can provide a software node group instead of
passing legacy platform data. This will allow to drop
the legacy platform data structures along with unifying
a child device driver to use same interface for all
property providers, i.e. Device Tree, ACPI, and board files.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mfd/intel_quark_i2c_gpio.c | 41 +++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 15 deletions(-)

diff --git a/drivers/mfd/intel_quark_i2c_gpio.c b/drivers/mfd/intel_quark_i2c_gpio.c
index 9a5f84b93776..a43993e38b6e 100644
--- a/drivers/mfd/intel_quark_i2c_gpio.c
+++ b/drivers/mfd/intel_quark_i2c_gpio.c
@@ -18,7 +18,7 @@
 #include <linux/dmi.h>
 #include <linux/i2c.h>
 #include <linux/platform_data/gpio-dwapb.h>
-#include <linux/platform_data/i2c-designware.h>
+#include <linux/property.h>
 
 /* PCI BAR for register base address */
 #define MFD_I2C_BAR		0
@@ -50,24 +50,44 @@ struct intel_quark_mfd {
 	struct clk_lookup	*i2c_clk_lookup;
 };
 
+static const struct property_entry intel_quark_i2c_controller_standard_properties[] = {
+	PROPERTY_ENTRY_U32("clock-frequency", I2C_MAX_STANDARD_MODE_FREQ),
+	{ }
+};
+
+static const struct software_node intel_quark_i2c_controller_standard_node = {
+	.name = "intel-quark-i2c-controller",
+	.properties = intel_quark_i2c_controller_standard_properties,
+};
+
+static const struct property_entry intel_quark_i2c_controller_fast_properties[] = {
+	PROPERTY_ENTRY_U32("clock-frequency", I2C_MAX_FAST_MODE_FREQ),
+	{ }
+};
+
+static const struct software_node intel_quark_i2c_controller_fast_node = {
+	.name = "intel-quark-i2c-controller",
+	.properties = intel_quark_i2c_controller_fast_properties,
+};
+
 static const struct dmi_system_id dmi_platform_info[] = {
 	{
 		.matches = {
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "Galileo"),
 		},
-		.driver_data = (void *)I2C_MAX_STANDARD_MODE_FREQ,
+		.driver_data = (void *)&intel_quark_i2c_controller_standard_node,
 	},
 	{
 		.matches = {
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "GalileoGen2"),
 		},
-		.driver_data = (void *)I2C_MAX_FAST_MODE_FREQ,
+		.driver_data = (void *)&intel_quark_i2c_controller_fast_node,
 	},
 	{
 		.matches = {
 			DMI_EXACT_MATCH(DMI_BOARD_NAME, "SIMATIC IOT2000"),
 		},
-		.driver_data = (void *)I2C_MAX_FAST_MODE_FREQ,
+		.driver_data = (void *)&intel_quark_i2c_controller_fast_node,
 	},
 	{}
 };
@@ -162,8 +182,6 @@ static int intel_quark_i2c_setup(struct pci_dev *pdev)
 	struct mfd_cell *cell = &intel_quark_mfd_cells[MFD_I2C_BAR];
 	struct resource *res = intel_quark_i2c_res;
 	const struct dmi_system_id *dmi_id;
-	struct dw_i2c_platform_data *pdata;
-	struct device *dev = &pdev->dev;
 
 	res[INTEL_QUARK_IORES_MEM].start = pci_resource_start(pdev, MFD_I2C_BAR);
 	res[INTEL_QUARK_IORES_MEM].end = pci_resource_end(pdev, MFD_I2C_BAR);
@@ -171,19 +189,12 @@ static int intel_quark_i2c_setup(struct pci_dev *pdev)
 	res[INTEL_QUARK_IORES_IRQ].start = pci_irq_vector(pdev, 0);
 	res[INTEL_QUARK_IORES_IRQ].end = pci_irq_vector(pdev, 0);
 
-	pdata = devm_kzalloc(dev, sizeof(*pdata), GFP_KERNEL);
-	if (!pdata)
-		return -ENOMEM;
-
 	/* Normal mode by default */
-	pdata->i2c_scl_freq = I2C_MAX_STANDARD_MODE_FREQ;
+	cell->swnode = &intel_quark_i2c_controller_standard_node;
 
 	dmi_id = dmi_first_match(dmi_platform_info);
 	if (dmi_id)
-		pdata->i2c_scl_freq = (uintptr_t)dmi_id->driver_data;
-
-	cell->platform_data = pdata;
-	cell->pdata_size = sizeof(*pdata);
+		cell->swnode = (struct software_node *)dmi_id->driver_data;
 
 	return 0;
 }
-- 
2.30.2

