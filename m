Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2987521E89
	for <lists+linux-i2c@lfdr.de>; Tue, 10 May 2022 17:26:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345738AbiEJPaj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 May 2022 11:30:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345771AbiEJP36 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 May 2022 11:29:58 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ABA9C41622;
        Tue, 10 May 2022 08:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652196050; x=1683732050;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=s12LKUkRjEyJoTFx4dcKh5X4R2ffOhieOmXwYajE27s=;
  b=QDe+2dCTQ5QHUYnh5Q+ouxAEDc4kUd4yFaHmkt51Ghdb8DCoEQlA0cqy
   gWHu+Dc/+325856ucE/ARnQ1wZ8cQkKedHHqi0OifVf2Mn8ZHqu98OGed
   HDskCczX82uT4ukElCnPONt80+jsAY+5F56APich37vgflA5SxpxAI67O
   ROnO8ggFCKnvhygP0h+/sIDpGgSbhuVwJMHFbTq1Qa9PWEQInfBYY8iJM
   bSbX+bNVDLkNVKAAQvjqK19nEnquik5BAa5PonnZ8H5vmJkOLfhsqbCb+
   6OSOQKWe/BQXLD3cCprwgEh8BUld0L53ERcvvm7s/3/0LOCB+H9RG9h29
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="294638475"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="294638475"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 08:17:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="541817752"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 10 May 2022 08:17:38 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id AAF285C1; Tue, 10 May 2022 18:15:16 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tony Luck <tony.luck@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?q?=C5=81ukasz=20Bartosik?= <lb@semihalf.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Henning Schild <henning.schild@siemens.com>
Subject: [PATCH v5 5/8] mfd: lpc_ich: Add support for pinctrl in non-ACPI system
Date:   Tue, 10 May 2022 18:14:48 +0300
Message-Id: <20220510151451.85561-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510151451.85561-1-andriy.shevchenko@linux.intel.com>
References: <20220510151451.85561-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
Tested-by: Henning Schild <henning.schild@siemens.com>
Acked-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/mfd/lpc_ich.c | 105 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 104 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
index e360651c5406..650951f89f1c 100644
--- a/drivers/mfd/lpc_ich.c
+++ b/drivers/mfd/lpc_ich.c
@@ -8,7 +8,8 @@
  *  Configuration Registers.
  *
  *  This driver is derived from lpc_sch.
-
+ *
+ *  Copyright (c) 2017, 2021-2022 Intel Corporation
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
@@ -142,6 +144,73 @@ static struct mfd_cell lpc_ich_gpio_cell = {
 	.ignore_resource_conflicts = true,
 };
 
+#define APL_GPIO_NORTH		0
+#define APL_GPIO_NORTHWEST	1
+#define APL_GPIO_WEST		2
+#define APL_GPIO_SOUTHWEST	3
+#define APL_GPIO_NR_DEVICES	4
+
+/* Offset data for Apollo Lake GPIO controllers */
+static resource_size_t apl_gpio_offsets[APL_GPIO_NR_DEVICES] = {
+	[APL_GPIO_NORTH]	= 0xc50000,
+	[APL_GPIO_NORTHWEST]	= 0xc40000,
+	[APL_GPIO_WEST]		= 0xc70000,
+	[APL_GPIO_SOUTHWEST]	= 0xc00000,
+};
+
+#define APL_GPIO_RESOURCE_SIZE		0x1000
+
+#define APL_GPIO_IRQ			14
+
+static struct resource apl_gpio_resources[APL_GPIO_NR_DEVICES][2] = {
+	[APL_GPIO_NORTH] = {
+		DEFINE_RES_MEM(0, 0),
+		DEFINE_RES_IRQ(APL_GPIO_IRQ),
+	},
+	[APL_GPIO_NORTHWEST] = {
+		DEFINE_RES_MEM(0, 0),
+		DEFINE_RES_IRQ(APL_GPIO_IRQ),
+	},
+	[APL_GPIO_WEST] = {
+		DEFINE_RES_MEM(0, 0),
+		DEFINE_RES_IRQ(APL_GPIO_IRQ),
+	},
+	[APL_GPIO_SOUTHWEST] = {
+		DEFINE_RES_MEM(0, 0),
+		DEFINE_RES_IRQ(APL_GPIO_IRQ),
+	},
+};
+
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
@@ -1085,6 +1154,34 @@ static int lpc_ich_init_wdt(struct pci_dev *dev)
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
+		resource_size_t offset = apl_gpio_offsets[i];
+
+		/* Fill MEM resource */
+		mem->start = base.start + offset;
+		mem->end = base.start + offset + APL_GPIO_RESOURCE_SIZE - 1;
+		mem->flags = base.flags;
+	}
+
+	return mfd_add_devices(&dev->dev, 0, apl_gpio_devices,
+			       ARRAY_SIZE(apl_gpio_devices), NULL, 0, NULL);
+}
+
 static bool lpc_ich_byt_set_writeable(void __iomem *base, void *data)
 {
 	u32 val;
@@ -1235,6 +1332,12 @@ static int lpc_ich_probe(struct pci_dev *dev,
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
2.35.1

