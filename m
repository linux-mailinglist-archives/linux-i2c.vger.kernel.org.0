Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 988B047C670
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Dec 2021 19:22:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241234AbhLUSWr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Dec 2021 13:22:47 -0500
Received: from mga18.intel.com ([134.134.136.126]:1346 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231459AbhLUSWq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Dec 2021 13:22:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640110966; x=1671646966;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3DqlyHFNaDBMcquaHNTfzmoeBsD/R1tWDi1GcZhi78c=;
  b=Mb58/Gj33mPnJpR+iXjR013sZf69C9sIhnt8+/o3cjk7enpNI/cCm9eG
   8fwNTB25Vfh5f7/ONTmgdiwiSn5SQjH4+yprmuq0E4/4JsTZCOhQy4pI9
   n9fuli0kvB74p9dZ7u+bnFUvvhleN+MOyrOKibyur0Oiu0YntLV5HQeTs
   H7n1V4/sTMsKxg6sZ5VEOk8Ua+Mxa2yyRBVNJxJ/0hvVw1bMMohMDpBuX
   klZ7eSW8PpWN+6iO8gnrg7nflmGBqydYXqg1pGyy8qEgoXCIrgkE3nCa9
   35oh+WHEDNvRnFagrEaxZDcBGNlN9RBFmsWLB9NmMQS5AwCXb9whApfn3
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="227313390"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="227313390"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2021 10:15:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="484502686"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 21 Dec 2021 10:15:37 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 380D623E; Tue, 21 Dec 2021 20:15:40 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
Subject: [PATCH v3 7/8] mfd: lpc_ich: Add support for pinctrl in non-ACPI system
Date:   Tue, 21 Dec 2021 20:15:25 +0200
Message-Id: <20211221181526.53798-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211221181526.53798-1-andriy.shevchenko@linux.intel.com>
References: <20211221181526.53798-1-andriy.shevchenko@linux.intel.com>
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
Co-developed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/mfd/lpc_ich.c | 101 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 100 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
index 95dca5434917..563e4ed251fd 100644
--- a/drivers/mfd/lpc_ich.c
+++ b/drivers/mfd/lpc_ich.c
@@ -8,7 +8,8 @@
  *  Configuration Registers.
  *
  *  This driver is derived from lpc_sch.
-
+ *
+ *  Copyright (c) 2017, 2021 Intel Corporation
  *  Copyright (c) 2011 Extreme Engineering Solution, Inc.
  *  Author: Aaron Sierra <asierra@xes-inc.com>
  *
@@ -42,6 +43,7 @@
 #include <linux/errno.h>
 #include <linux/acpi.h>
 #include <linux/pci.h>
+#include <linux/pinctrl/pinctrl.h>
 #include <linux/mfd/core.h>
 #include <linux/mfd/lpc_ich.h>
 #include <linux/platform_data/itco_wdt.h>
@@ -140,6 +142,70 @@ static struct mfd_cell lpc_ich_gpio_cell = {
 	.ignore_resource_conflicts = true,
 };
 
+#define APL_GPIO_NORTH		0
+#define APL_GPIO_NORTHWEST	1
+#define APL_GPIO_WEST		2
+#define APL_GPIO_SOUTHWEST	3
+#define APL_GPIO_NR_DEVICES	4
+
+/* Offset data for Apollo Lake GPIO controllers */
+#define APL_GPIO_NORTH_OFFSET		0xc50000
+#define APL_GPIO_NORTHWEST_OFFSET	0xc40000
+#define APL_GPIO_WEST_OFFSET		0xc70000
+#define APL_GPIO_SOUTHWEST_OFFSET	0xc00000
+
+#define APL_GPIO_IRQ			14
+
+static struct resource apl_gpio_resources[APL_GPIO_NR_DEVICES][2] = {
+	[APL_GPIO_NORTH] = {
+		DEFINE_RES_MEM(APL_GPIO_NORTH_OFFSET, 0x1000),
+		DEFINE_RES_IRQ(APL_GPIO_IRQ),
+	},
+	[APL_GPIO_NORTHWEST] = {
+		DEFINE_RES_MEM(APL_GPIO_NORTHWEST_OFFSET, 0x1000),
+		DEFINE_RES_IRQ(APL_GPIO_IRQ),
+	},
+	[APL_GPIO_WEST] = {
+		DEFINE_RES_MEM(APL_GPIO_WEST_OFFSET, 0x1000),
+		DEFINE_RES_IRQ(APL_GPIO_IRQ),
+	},
+	[APL_GPIO_SOUTHWEST] = {
+		DEFINE_RES_MEM(APL_GPIO_SOUTHWEST_OFFSET, 0x1000),
+		DEFINE_RES_IRQ(APL_GPIO_IRQ),
+	},
+};
+
+/* The order must be in sync with apl_pinctrl_soc_data */
+static const struct mfd_cell apl_gpio_devices[APL_GPIO_NR_DEVICES] = {
+	[APL_GPIO_NORTH] = {
+		.name = "apollolake-pinctrl",
+		.id = APL_GPIO_NORTH,
+		.num_resources = ARRAY_SIZE(apl_gpio_resources[APL_GPIO_NORTH]),
+		.resources = apl_gpio_resources[APL_GPIO_NORTH],
+		.ignore_resource_conflicts = true,
+	},
+	[APL_GPIO_NORTHWEST] = {
+		.name = "apollolake-pinctrl",
+		.id = APL_GPIO_NORTHWEST,
+		.num_resources = ARRAY_SIZE(apl_gpio_resources[APL_GPIO_NORTHWEST]),
+		.resources = apl_gpio_resources[APL_GPIO_NORTHWEST],
+		.ignore_resource_conflicts = true,
+	},
+	[APL_GPIO_WEST] = {
+		.name = "apollolake-pinctrl",
+		.id = APL_GPIO_WEST,
+		.num_resources = ARRAY_SIZE(apl_gpio_resources[APL_GPIO_WEST]),
+		.resources = apl_gpio_resources[APL_GPIO_WEST],
+		.ignore_resource_conflicts = true,
+	},
+	[APL_GPIO_SOUTHWEST] = {
+		.name = "apollolake-pinctrl",
+		.id = APL_GPIO_SOUTHWEST,
+		.num_resources = ARRAY_SIZE(apl_gpio_resources[APL_GPIO_SOUTHWEST]),
+		.resources = apl_gpio_resources[APL_GPIO_SOUTHWEST],
+		.ignore_resource_conflicts = true,
+	},
+};
 
 static struct mfd_cell lpc_ich_spi_cell = {
 	.name = "intel-spi",
@@ -1083,6 +1149,33 @@ static int lpc_ich_init_wdt(struct pci_dev *dev)
 	return ret;
 }
 
+static int lpc_ich_init_pinctrl(struct pci_dev *dev)
+{
+	struct resource base;
+	unsigned int i;
+	int ret;
+
+	/* Check, if GPIO has been exported as an ACPI device */
+	if (acpi_dev_present("INT3452", NULL, -1))
+		return -EEXIST;
+
+	ret = p2sb_bar(dev->bus, 0, &base);
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
@@ -1199,6 +1292,12 @@ static int lpc_ich_probe(struct pci_dev *dev,
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
2.34.1

