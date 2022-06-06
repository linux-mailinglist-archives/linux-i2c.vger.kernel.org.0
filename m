Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F3EB753E978
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jun 2022 19:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242006AbiFFQqe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jun 2022 12:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230448AbiFFQqc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jun 2022 12:46:32 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4F9E15D30C;
        Mon,  6 Jun 2022 09:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654533990; x=1686069990;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Oy6hz4FBsJzzenRp9uaCweU4htTEAEIuqiuayn5JH1M=;
  b=WBHTJRvBl/iN4Whz+jOBowfJsjts3Qkw+qhWTZNIjljNcYPWz1opJiku
   zm1ODOM1iB1IcfewI7SsyFk/D0QNvE4GNnCZLEdjQtAtzEpoLhOglHZza
   A4AFcRBvdyv55wpS2AQPLaY96L9TGatciUO6FO59MYyNZObC5fQsn2KMy
   /wMufRsNU4g1CvgmwXeOeMKojJfR7a4DBoyWwR/+EbkLpehfXumyQl7U+
   uQ9zAUrmh7A00TWmMsuLIi88yKzELq+inRmbBPoVL16KMC8Z5XD/tlT54
   rwAPgchQJ10tkTeyMr9hRkBbMmhyAP5r50kMGrA3d2yTBt6hj9FhOE7Y2
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="259081518"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="259081518"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 09:42:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="532206889"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 06 Jun 2022 09:41:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id EF63D1222; Mon,  6 Jun 2022 19:41:50 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tony Luck <tony.luck@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Henning Schild <henning.schild@siemens.com>,
        Lee Jones <lee.jones@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Cc:     Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>
Subject: [PATCH v6 12/12] leds: simatic-ipc-leds-gpio: add GPIO version of Siemens driver
Date:   Mon,  6 Jun 2022 19:41:38 +0300
Message-Id: <20220606164138.66535-13-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
References: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Henning Schild <henning.schild@siemens.com>

On Apollo Lake the pinctrl drivers will now come up without ACPI. Use
that instead of open coding it.
Create a new driver for that which can later be filled with more GPIO
based models, and which has different dependencies.

Signed-off-by: Henning Schild <henning.schild@siemens.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/leds/simple/Kconfig                 |   7 +-
 drivers/leds/simple/Makefile                |   1 +
 drivers/leds/simple/simatic-ipc-leds-gpio.c | 105 ++++++++++++++++++++
 drivers/leds/simple/simatic-ipc-leds.c      |  80 +--------------
 drivers/platform/x86/simatic-ipc.c          |   5 +-
 5 files changed, 117 insertions(+), 81 deletions(-)
 create mode 100644 drivers/leds/simple/simatic-ipc-leds-gpio.c

diff --git a/drivers/leds/simple/Kconfig b/drivers/leds/simple/Kconfig
index bbf8cff3c3f6..fd2b8225d926 100644
--- a/drivers/leds/simple/Kconfig
+++ b/drivers/leds/simple/Kconfig
@@ -1,12 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config LEDS_SIEMENS_SIMATIC_IPC
 	tristate "LED driver for Siemens Simatic IPCs"
-	depends on LEDS_CLASS
+	depends on LEDS_GPIO
 	depends on SIEMENS_SIMATIC_IPC
-	select P2SB
 	help
 	  This option enables support for the LEDs of several Industrial PCs
 	  from Siemens.
 
-	  To compile this driver as a module, choose M here: the module
-	  will be called simatic-ipc-leds.
+	  To compile this driver as a module, choose M here: the modules
+	  will be called simatic-ipc-leds and simatic-ipc-leds-gpio.
diff --git a/drivers/leds/simple/Makefile b/drivers/leds/simple/Makefile
index 8481f1e9e360..1c7ef5e1324b 100644
--- a/drivers/leds/simple/Makefile
+++ b/drivers/leds/simple/Makefile
@@ -1,2 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC)	+= simatic-ipc-leds.o
+obj-$(CONFIG_LEDS_SIEMENS_SIMATIC_IPC)	+= simatic-ipc-leds-gpio.o
diff --git a/drivers/leds/simple/simatic-ipc-leds-gpio.c b/drivers/leds/simple/simatic-ipc-leds-gpio.c
new file mode 100644
index 000000000000..4c9e663a90ba
--- /dev/null
+++ b/drivers/leds/simple/simatic-ipc-leds-gpio.c
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Siemens SIMATIC IPC driver for GPIO based LEDs
+ *
+ * Copyright (c) Siemens AG, 2022
+ *
+ * Authors:
+ *  Henning Schild <henning.schild@siemens.com>
+ */
+
+#include <linux/gpio/machine.h>
+#include <linux/gpio/consumer.h>
+#include <linux/leds.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+
+static struct gpiod_lookup_table simatic_ipc_led_gpio_table = {
+	.dev_id = "leds-gpio",
+	.table = {
+		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 51, NULL, 0, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 52, NULL, 1, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 53, NULL, 2, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 57, NULL, 3, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 58, NULL, 4, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 60, NULL, 5, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 56, NULL, 6, GPIO_ACTIVE_LOW),
+		GPIO_LOOKUP_IDX("apollolake-pinctrl.0", 59, NULL, 7, GPIO_ACTIVE_HIGH),
+	},
+};
+
+static const struct gpio_led simatic_ipc_gpio_leds[] = {
+	{ .name = "green:" LED_FUNCTION_STATUS "-3" },
+	{ .name = "red:" LED_FUNCTION_STATUS "-1" },
+	{ .name = "green:" LED_FUNCTION_STATUS "-1" },
+	{ .name = "red:" LED_FUNCTION_STATUS "-2" },
+	{ .name = "green:" LED_FUNCTION_STATUS "-2" },
+	{ .name = "red:" LED_FUNCTION_STATUS "-3" },
+};
+
+static const struct gpio_led_platform_data simatic_ipc_gpio_leds_pdata = {
+	.num_leds	= ARRAY_SIZE(simatic_ipc_gpio_leds),
+	.leds		= simatic_ipc_gpio_leds,
+};
+
+static struct platform_device *simatic_leds_pdev;
+
+static int simatic_ipc_leds_gpio_remove(struct platform_device *pdev)
+{
+	gpiod_remove_lookup_table(&simatic_ipc_led_gpio_table);
+	platform_device_unregister(simatic_leds_pdev);
+
+	return 0;
+}
+
+static int simatic_ipc_leds_gpio_probe(struct platform_device *pdev)
+{
+	struct gpio_desc *gpiod;
+	int err;
+
+	gpiod_add_lookup_table(&simatic_ipc_led_gpio_table);
+	simatic_leds_pdev = platform_device_register_resndata(NULL,
+		"leds-gpio", PLATFORM_DEVID_NONE, NULL, 0,
+		&simatic_ipc_gpio_leds_pdata,
+		sizeof(simatic_ipc_gpio_leds_pdata));
+	if (IS_ERR(simatic_leds_pdev)) {
+		err = PTR_ERR(simatic_leds_pdev);
+		goto out;
+	}
+
+	/* PM_BIOS_BOOT_N */
+	gpiod = gpiod_get_index(&simatic_leds_pdev->dev, NULL, 6, GPIOD_OUT_LOW);
+	if (IS_ERR(gpiod)) {
+		err = PTR_ERR(gpiod);
+		goto out;
+	}
+	gpiod_put(gpiod);
+
+	/* PM_WDT_OUT */
+	gpiod = gpiod_get_index(&simatic_leds_pdev->dev, NULL, 7, GPIOD_OUT_LOW);
+	if (IS_ERR(gpiod)) {
+		err = PTR_ERR(gpiod);
+		goto out;
+	}
+	gpiod_put(gpiod);
+
+	return 0;
+out:
+	simatic_ipc_leds_gpio_remove(pdev);
+
+	return err;
+}
+
+static struct platform_driver simatic_ipc_led_gpio_driver = {
+	.probe = simatic_ipc_leds_gpio_probe,
+	.remove = simatic_ipc_leds_gpio_remove,
+	.driver = {
+		.name = KBUILD_MODNAME,
+	}
+};
+module_platform_driver(simatic_ipc_led_gpio_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:" KBUILD_MODNAME);
+MODULE_SOFTDEP("pre: platform:leds-gpio");
+MODULE_AUTHOR("Henning Schild <henning.schild@siemens.com>");
diff --git a/drivers/leds/simple/simatic-ipc-leds.c b/drivers/leds/simple/simatic-ipc-leds.c
index 2e7597c143d8..4894c228c165 100644
--- a/drivers/leds/simple/simatic-ipc-leds.c
+++ b/drivers/leds/simple/simatic-ipc-leds.c
@@ -15,7 +15,6 @@
 #include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/pci.h>
-#include <linux/platform_data/x86/p2sb.h>
 #include <linux/platform_data/x86/simatic-ipc-base.h>
 #include <linux/platform_device.h>
 #include <linux/sizes.h>
@@ -24,7 +23,7 @@
 #define SIMATIC_IPC_LED_PORT_BASE	0x404E
 
 struct simatic_ipc_led {
-	unsigned int value; /* mask for io and offset for mem */
+	unsigned int value; /* mask for io */
 	char *name;
 	struct led_classdev cdev;
 };
@@ -39,21 +38,6 @@ static struct simatic_ipc_led simatic_ipc_leds_io[] = {
 	{ }
 };
 
-/* the actual start will be discovered with p2sb, 0 is a placeholder */
-static struct resource simatic_ipc_led_mem_res = DEFINE_RES_MEM_NAMED(0, 0, KBUILD_MODNAME);
-
-static void __iomem *simatic_ipc_led_memory;
-
-static struct simatic_ipc_led simatic_ipc_leds_mem[] = {
-	{0x500 + 0x1A0, "red:" LED_FUNCTION_STATUS "-1"},
-	{0x500 + 0x1A8, "green:" LED_FUNCTION_STATUS "-1"},
-	{0x500 + 0x1C8, "red:" LED_FUNCTION_STATUS "-2"},
-	{0x500 + 0x1D0, "green:" LED_FUNCTION_STATUS "-2"},
-	{0x500 + 0x1E0, "red:" LED_FUNCTION_STATUS "-3"},
-	{0x500 + 0x198, "green:" LED_FUNCTION_STATUS "-3"},
-	{ }
-};
-
 static struct resource simatic_ipc_led_io_res =
 	DEFINE_RES_IO_NAMED(SIMATIC_IPC_LED_PORT_BASE, SZ_2, KBUILD_MODNAME);
 
@@ -89,28 +73,6 @@ static enum led_brightness simatic_ipc_led_get_io(struct led_classdev *led_cd)
 	return inw(SIMATIC_IPC_LED_PORT_BASE) & led->value ? LED_OFF : led_cd->max_brightness;
 }
 
-static void simatic_ipc_led_set_mem(struct led_classdev *led_cd,
-				    enum led_brightness brightness)
-{
-	struct simatic_ipc_led *led = cdev_to_led(led_cd);
-	void __iomem *reg = simatic_ipc_led_memory + led->value;
-	u32 val;
-
-	val = readl(reg);
-	val = (val & ~1) | (brightness == LED_OFF);
-	writel(val, reg);
-}
-
-static enum led_brightness simatic_ipc_led_get_mem(struct led_classdev *led_cd)
-{
-	struct simatic_ipc_led *led = cdev_to_led(led_cd);
-	void __iomem *reg = simatic_ipc_led_memory + led->value;
-	u32 val;
-
-	val = readl(reg);
-	return (val & 1) ? LED_OFF : led_cd->max_brightness;
-}
-
 static int simatic_ipc_leds_probe(struct platform_device *pdev)
 {
 	const struct simatic_ipc_platform *plat = pdev->dev.platform_data;
@@ -118,9 +80,7 @@ static int simatic_ipc_leds_probe(struct platform_device *pdev)
 	struct simatic_ipc_led *ipcled;
 	struct led_classdev *cdev;
 	struct resource *res;
-	void __iomem *reg;
-	int err, type;
-	u32 val;
+	int err;
 
 	switch (plat->devmode) {
 	case SIMATIC_IPC_DEVICE_227D:
@@ -135,51 +95,19 @@ static int simatic_ipc_leds_probe(struct platform_device *pdev)
 			}
 			ipcled = simatic_ipc_leds_io;
 		}
-		type = IORESOURCE_IO;
 		if (!devm_request_region(dev, res->start, resource_size(res), KBUILD_MODNAME)) {
 			dev_err(dev, "Unable to register IO resource at %pR\n", res);
 			return -EBUSY;
 		}
 		break;
-	case SIMATIC_IPC_DEVICE_127E:
-		res = &simatic_ipc_led_mem_res;
-		ipcled = simatic_ipc_leds_mem;
-		type = IORESOURCE_MEM;
-
-		err = p2sb_bar(NULL, 0, res);
-		if (err)
-			return err;
-
-		/* do the final address calculation */
-		res->start = res->start + (0xC5 << 16);
-		res->end = res->start + SZ_4K - 1;
-
-		simatic_ipc_led_memory = devm_ioremap_resource(dev, res);
-		if (IS_ERR(simatic_ipc_led_memory))
-			return PTR_ERR(simatic_ipc_led_memory);
-
-		/* initialize power/watchdog LED */
-		reg = simatic_ipc_led_memory + 0x500 + 0x1D8; /* PM_WDT_OUT */
-		val = readl(reg);
-		writel(val & ~1, reg);
-
-		reg = simatic_ipc_led_memory + 0x500 + 0x1C0; /* PM_BIOS_BOOT_N */
-		val = readl(reg);
-		writel(val | 1, reg);
-		break;
 	default:
 		return -ENODEV;
 	}
 
 	while (ipcled->value) {
 		cdev = &ipcled->cdev;
-		if (type == IORESOURCE_MEM) {
-			cdev->brightness_set = simatic_ipc_led_set_mem;
-			cdev->brightness_get = simatic_ipc_led_get_mem;
-		} else {
-			cdev->brightness_set = simatic_ipc_led_set_io;
-			cdev->brightness_get = simatic_ipc_led_get_io;
-		}
+		cdev->brightness_set = simatic_ipc_led_set_io;
+		cdev->brightness_get = simatic_ipc_led_get_io;
 		cdev->max_brightness = LED_ON;
 		cdev->name = ipcled->name;
 
diff --git a/drivers/platform/x86/simatic-ipc.c b/drivers/platform/x86/simatic-ipc.c
index 26c35e1660cb..ca3647b751d5 100644
--- a/drivers/platform/x86/simatic-ipc.c
+++ b/drivers/platform/x86/simatic-ipc.c
@@ -51,6 +51,7 @@ static int register_platform_devices(u32 station_id)
 {
 	u8 ledmode = SIMATIC_IPC_DEVICE_NONE;
 	u8 wdtmode = SIMATIC_IPC_DEVICE_NONE;
+	char *pdevname = KBUILD_MODNAME "_leds";
 	int i;
 
 	platform_data.devmode = SIMATIC_IPC_DEVICE_NONE;
@@ -64,10 +65,12 @@ static int register_platform_devices(u32 station_id)
 	}
 
 	if (ledmode != SIMATIC_IPC_DEVICE_NONE) {
+		if (ledmode == SIMATIC_IPC_DEVICE_127E)
+			pdevname = KBUILD_MODNAME "_leds_gpio";
 		platform_data.devmode = ledmode;
 		ipc_led_platform_device =
 			platform_device_register_data(NULL,
-				KBUILD_MODNAME "_leds", PLATFORM_DEVID_NONE,
+				pdevname, PLATFORM_DEVID_NONE,
 				&platform_data,
 				sizeof(struct simatic_ipc_platform));
 		if (IS_ERR(ipc_led_platform_device))
-- 
2.35.1

