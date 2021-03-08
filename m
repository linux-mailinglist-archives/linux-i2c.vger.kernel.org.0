Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5418B330D47
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Mar 2021 13:21:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230490AbhCHMUw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Mar 2021 07:20:52 -0500
Received: from mga09.intel.com ([134.134.136.24]:50394 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229899AbhCHMUp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 8 Mar 2021 07:20:45 -0500
IronPort-SDR: zIGAmOx867xjMHvY+EbgcAeNLZMsDSbrf32CxupRQpkIjuhZFvIBtwfHisgcn98GWy/mxL1xB0
 mu9rla0PyU4w==
X-IronPort-AV: E=McAfee;i="6000,8403,9916"; a="188123992"
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="188123992"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 04:20:45 -0800
IronPort-SDR: k+ZwVv0GBZN4dfhCEeyImvenxb0htCvn0NC5N0Egd6QiQ1mhjPY2+kda1cAOaFkbmeWlPbS8I9
 eHmuda2rPqHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="376069693"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 08 Mar 2021 04:20:41 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 381D356B; Mon,  8 Mar 2021 14:20:38 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Lee Jones <lee.jones@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Jim Quinlan <james.quinlan@broadcom.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Peter Tyser <ptyser@xes-inc.com>,
        hdegoede@redhat.com, henning.schild@siemens.com
Subject: [PATCH v1 6/7] mfd: lpc_ich: Add support for pinctrl in non-ACPI system
Date:   Mon,  8 Mar 2021 14:20:19 +0200
Message-Id: <20210308122020.57071-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com>
References: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Tan Jui Nee <jui.nee.tan@intel.com>

Add support for non-ACPI systems, such as system that uses
Advanced Boot Loader (ABL) whereby a platform device has to be created
in order to bind with pin control and GPIO.

At the moment, Intel Apollo Lake In-Vehicle Infotainment (IVI) system
requires a driver to hide and unhide P2SB to lookup P2SB BAR and pass
the PCI BAR address to GPIO.

Signed-off-by: Tan Jui Nee <jui.nee.tan@intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mfd/lpc_ich.c | 100 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 99 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
index 8e9bd6813287..959247b6987a 100644
--- a/drivers/mfd/lpc_ich.c
+++ b/drivers/mfd/lpc_ich.c
@@ -8,7 +8,8 @@
  *  Configuration Registers.
  *
  *  This driver is derived from lpc_sch.
-
+ *
+ *  Copyright (C) 2017, 2021 Intel Corporation
  *  Copyright (c) 2011 Extreme Engineering Solution, Inc.
  *  Author: Aaron Sierra <asierra@xes-inc.com>
  *
@@ -43,6 +44,7 @@
 #include <linux/acpi.h>
 #include <linux/pci.h>
 #include <linux/pci-p2sb.h>
+#include <linux/pinctrl/pinctrl.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/lpc_ich.h>
 #include <linux/platform_data/itco_wdt.h>
@@ -140,6 +142,73 @@ static struct mfd_cell lpc_ich_gpio_cell = {
 	.ignore_resource_conflicts = true,
 };
 
+/* Offset data for Apollo Lake GPIO controllers */
+#define APL_GPIO_SOUTHWEST_OFFSET	0xc00000
+#define APL_GPIO_SOUTHWEST_SIZE		0x654
+#define APL_GPIO_NORTHWEST_OFFSET	0xc40000
+#define APL_GPIO_NORTHWEST_SIZE		0x764
+#define APL_GPIO_NORTH_OFFSET		0xc50000
+#define APL_GPIO_NORTH_SIZE		0x76c
+#define APL_GPIO_WEST_OFFSET		0xc70000
+#define APL_GPIO_WEST_SIZE		0x674
+
+#define APL_GPIO_NR_DEVICES		4
+#define APL_GPIO_IRQ			14
+
+static struct resource apl_gpio_resources[APL_GPIO_NR_DEVICES][2] = {
+	{
+		DEFINE_RES_MEM(APL_GPIO_NORTH_OFFSET, APL_GPIO_NORTH_SIZE),
+		DEFINE_RES_IRQ(APL_GPIO_IRQ),
+	},
+	{
+		DEFINE_RES_MEM(APL_GPIO_NORTHWEST_OFFSET, APL_GPIO_NORTHWEST_SIZE),
+		DEFINE_RES_IRQ(APL_GPIO_IRQ),
+	},
+	{
+		DEFINE_RES_MEM(APL_GPIO_WEST_OFFSET, APL_GPIO_WEST_SIZE),
+		DEFINE_RES_IRQ(APL_GPIO_IRQ),
+	},
+	{
+		DEFINE_RES_MEM(APL_GPIO_SOUTHWEST_OFFSET, APL_GPIO_SOUTHWEST_SIZE),
+		DEFINE_RES_IRQ(APL_GPIO_IRQ),
+	},
+};
+
+/* The order must be in sync with apl_pinctrl_soc_data */
+static const struct mfd_cell apl_gpio_devices[APL_GPIO_NR_DEVICES] = {
+	{
+		/* North */
+		.name = "apollolake-pinctrl",
+		.id = 0,
+		.num_resources = ARRAY_SIZE(apl_gpio_resources[0]),
+		.resources = apl_gpio_resources[0],
+		.ignore_resource_conflicts = true,
+	},
+	{
+		/* NorthWest */
+		.name = "apollolake-pinctrl",
+		.id = 1,
+		.num_resources = ARRAY_SIZE(apl_gpio_resources[1]),
+		.resources = apl_gpio_resources[1],
+		.ignore_resource_conflicts = true,
+	},
+	{
+		/* West */
+		.name = "apollolake-pinctrl",
+		.id = 2,
+		.num_resources = ARRAY_SIZE(apl_gpio_resources[2]),
+		.resources = apl_gpio_resources[2],
+		.ignore_resource_conflicts = true,
+	},
+	{
+		/* SouthWest */
+		.name = "apollolake-pinctrl",
+		.id = 3,
+		.num_resources = ARRAY_SIZE(apl_gpio_resources[3]),
+		.resources = apl_gpio_resources[3],
+		.ignore_resource_conflicts = true,
+	},
+};
 
 static struct mfd_cell lpc_ich_spi_cell = {
 	.name = "intel-spi",
@@ -1082,6 +1151,29 @@ static int lpc_ich_init_wdt(struct pci_dev *dev)
 	return ret;
 }
 
+static int lpc_ich_init_pinctrl(struct pci_dev *dev)
+{
+	struct resource base;
+	unsigned int i;
+	int ret;
+
+	ret = pci_p2sb_bar(dev, PCI_DEVFN(13, 0), &base);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < ARRAY_SIZE(apl_gpio_devices); i++) {
+		struct resource *mem = &apl_gpio_resources[i][0];
+
+		/* Fill MEM resource */
+		mem->start += base.start;
+		mem->end += base.start;
+		mem->flags = base.flags;
+	}
+
+	return mfd_add_devices(&dev->dev, 0, apl_gpio_devices,
+			       ARRAY_SIZE(apl_gpio_devices), NULL, 0, NULL);
+}
+
 static void lpc_ich_test_spi_write(struct pci_dev *dev, unsigned int devfn,
 				   struct intel_spi_boardinfo *info)
 {
@@ -1198,6 +1290,12 @@ static int lpc_ich_probe(struct pci_dev *dev,
 			cell_added = true;
 	}
 
+	if (priv->chipset == LPC_APL) {
+		ret = lpc_ich_init_pinctrl(dev);
+		if (!ret)
+			cell_added = true;
+	}
+
 	if (lpc_chipset_info[priv->chipset].spi_type) {
 		ret = lpc_ich_init_spi(dev);
 		if (!ret)
-- 
2.30.1

