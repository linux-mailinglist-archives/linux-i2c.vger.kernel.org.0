Return-Path: <linux-i2c+bounces-7664-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD6D9B5CDE
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Oct 2024 08:24:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A36C1C20F10
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Oct 2024 07:24:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 473631D86E8;
	Wed, 30 Oct 2024 07:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="A2awFnYh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A4431DF739
	for <linux-i2c@vger.kernel.org>; Wed, 30 Oct 2024 07:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730272979; cv=none; b=Lgod/80PCuKMGi4NvMVKFCDNzL3EYuuktNA1cCpG6/WYom5hEMyoOLR4tATZpirN74vLe++S8eBcOfnLNhLZdKBq8MHz947Q3ADHlj4SPt/QN5kfYeeeklFfZGzYpCEgXLk3XkOB1Ilw2TlFFbod0XaeTxzKOUH1K04yTV4zkJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730272979; c=relaxed/simple;
	bh=MVxbktHKsCgd75nQHh61VybxXH9vqhNB03dBqclAx7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aqSi9J93OpqXcI5EZIXML9k2GtpsXPjYwm2Atb1x8EsMcDbkAm9ob6/evSJnU+uS6s/a5QANZWixJj3601ymytypN71sS2TSZlftMcgJmxx+pm3gIO6o5636wyZptcaq5lvOCDY0ynXWjoZJnOhT/cNUXyg0QP1xnIap0NJLcBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=A2awFnYh; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20e576dbc42so64230115ad.0
        for <linux-i2c@vger.kernel.org>; Wed, 30 Oct 2024 00:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730272976; x=1730877776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jvmr+awymjJy3SArni79uRZOlAUPBKm1S6yN51pTp04=;
        b=A2awFnYhjiVJWXbhlbU9q5DgDB9Jy0d7/ABHbrRqvyFAsTOpfF0eLDqxLso5qQh6gV
         ZBN165qllCmMGIX3O2uM6U5ia/z8XJtewhMlAc2aaWsxYws/szqRP/ORsKms4GvGJXb1
         h/1JCY+HHxWbqVEV1U6qX9+7T5GqBVWBb2EDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730272976; x=1730877776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jvmr+awymjJy3SArni79uRZOlAUPBKm1S6yN51pTp04=;
        b=t831FRuCcQFNLkNuIVuxHccT2wvy+trk2Q716SkgGazJhwfCxZE7DvdIXFveB+qKDD
         bNH23DYBWP60E3EsH9LH1jDYvUuURapt5nlANKFkiWB3UKM0ob/8PpIt5TiNI41R4Yab
         q4kKK9HbePANOIaFN9NXxOj+OsqSbmUCpDgAF3oSjimAiGeGn7Nkd2CTXjGTaSgZMaTy
         L/v7wFL1zeeaOE8zwpRwvPVyu0llkkVJbEo8y+76DlSb4gnmA8wS+BMjsgqhL28vVIjP
         SBROjN6KuOUc3INBX9gjd2BcKVcZ9FwyCEgkmvTYBNyEII75jILHdOALmGlcJCwDbXY4
         xJvg==
X-Forwarded-Encrypted: i=1; AJvYcCWWJwjLY0gPJp40m+/F5I/B5+yjo0Vb3cIN1iN/881sc7LygDrRgfEChN7BV6WOzQnp70vzm+J+Q6M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhLaDzjzTAQxbnSyLEKDTVfb4KHMap3Z7VupM6WPc1aW4p5zTx
	F7q8QCJ07UXWLtZf++e01hH0bK8Jqf8qc0wYI37ZmbBVEME9XxFah2kJHWee2w==
X-Google-Smtp-Source: AGHT+IH9DpqR7Bg6jAQcm5pohvS7XS9nHNofCi1AUFyKn6o6hKkZ0PKeIzIGwFkXBnVsrYRjU9yWlg==
X-Received: by 2002:a17:903:2a8e:b0:210:f706:dc4b with SMTP id d9443c01a7336-210f706dfdemr31445855ad.13.1730272975817;
        Wed, 30 Oct 2024 00:22:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:d1f3:aa64:657f:d8a8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02e67esm76641445ad.186.2024.10.30.00.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 00:22:55 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v10 6/7] platform/chrome: Introduce device tree hardware prober
Date: Wed, 30 Oct 2024 15:22:27 +0800
Message-ID: <20241030072229.1013235-7-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241030072229.1013235-1-wenst@chromium.org>
References: <20241030072229.1013235-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some devices are designed and manufactured with some components having
multiple drop-in replacement options. These components are often
connected to the mainboard via ribbon cables, having the same signals
and pin assignments across all options. These may include the display
panel and touchscreen on laptops and tablets, and the trackpad on
laptops. Sometimes which component option is used in a particular device
can be detected by some firmware provided identifier, other times that
information is not available, and the kernel has to try to probe each
device.

This change attempts to make the "probe each device" case cleaner. The
current approach is to have all options added and enabled in the device
tree. The kernel would then bind each device and run each driver's probe
function. This works, but has been broken before due to the introduction
of asynchronous probing, causing multiple instances requesting "shared"
resources, such as pinmuxes, GPIO pins, interrupt lines, at the same
time, with only one instance succeeding. Work arounds for these include
moving the pinmux to the parent I2C controller, using GPIO hogs or
pinmux settings to keep the GPIO pins in some fixed configuration, and
requesting the interrupt line very late. Such configurations can be seen
on the MT8183 Krane Chromebook tablets, and the Qualcomm sc8280xp-based
Lenovo Thinkpad 13S.

Instead of this delicate dance between drivers and device tree quirks,
this change introduces a simple I2C component prober. For any given
class of devices on the same I2C bus, it will go through all of them,
doing a simple I2C read transfer and see which one of them responds.
It will then enable the device that responds.

This requires some minor modifications in the existing device tree.
The status for all the device nodes for the component options must be
set to "fail-needs-probe". This makes it clear that some mechanism is
needed to enable one of them, and also prevents the prober and device
drivers running at the same time.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
Maintainer expects this to be merged through I2C tree.

Changes since v9:
- Added inclusion of stddef.h for NULL

Changes since v8:
- Added trailing commas on last field in struct variable declarations
  (Andy)
- Added macros wrapping chromeos_i2c_probe_dumb_* and
  chromeos_i2c_probe_simple_*_cfg variable declarations (Andy)
- Split up hw_prober_platforms into one field per line (Andy)
- Picked up Doug's reviewed-by

Changes since v7:
- Corrected Makefile item order
- Replaced "failed-needs-probe" with "fail-needs-probe" in commit message
- Added include of "linux/of.h" for of_machine_is_compatible()
- Switched to simple probe helpers for trackpads on Hana

Changes since v6:
- Adapted to new I2C OF prober interface
- Collected Acked-by

Changes since v5:
- Adapt to new i2c_of_probe_component() parameters

Changes since v4:
- Fix Kconfig dependency
- Update copyright year
- Drop "linux/of.h" header
- Include "linux/errno.h"
- Move |int ret| declaration to top of block
- Return -ENODEV on no match instead of 0
- Unregister platform driver and device unconditionally after previous
  change

Changes since v3:
- Include linux/init.h
- Rewrite for loop in driver probe function as suggested by Andy
- Make prober driver buildable as module
- Ignore prober errors other than probe deferral

Changes since v2:
- Addressed Rob's comments
  - Move remaining driver code to drivers/platform/chrome/
  - Depend on rather than select CONFIG_I2C
  - Copy machine check to driver init function
- Addressed Andy's comments
  - Explicitly mention "device tree" or OF in driver name, description
    and Kconfig symbol
  - Drop filename from inside the file
  - Switch to passing "struct device *" to shorten lines
  - Move "ret = 0" to just before for_each_child_of_node(i2c_node, node)
  - Make loop variable size_t (instead of unsigned int as Andy asked)
  - Use PLATFORM_DEVID_NONE instead of raw -1
  - Use standard goto error path pattern in hw_prober_driver_init()

- Changes since v1:
  - New patch
---
 drivers/platform/chrome/Kconfig               |  11 ++
 drivers/platform/chrome/Makefile              |   1 +
 .../platform/chrome/chromeos_of_hw_prober.c   | 154 ++++++++++++++++++
 3 files changed, 166 insertions(+)
 create mode 100644 drivers/platform/chrome/chromeos_of_hw_prober.c

diff --git a/drivers/platform/chrome/Kconfig b/drivers/platform/chrome/Kconfig
index 7dbeb786352a..b7dbaf77b6db 100644
--- a/drivers/platform/chrome/Kconfig
+++ b/drivers/platform/chrome/Kconfig
@@ -61,6 +61,17 @@ config CHROMEOS_TBMC
 	  To compile this driver as a module, choose M here: the
 	  module will be called chromeos_tbmc.
 
+config CHROMEOS_OF_HW_PROBER
+	tristate "ChromeOS Device Tree Hardware Prober"
+	depends on OF
+	depends on I2C
+	select OF_DYNAMIC
+	default OF
+	help
+	  This option enables the device tree hardware prober for ChromeOS
+	  devices. The driver will probe the correct component variant in
+	  devices that have multiple drop-in options for one component.
+
 config CROS_EC
 	tristate "ChromeOS Embedded Controller"
 	select CROS_EC_PROTO
diff --git a/drivers/platform/chrome/Makefile b/drivers/platform/chrome/Makefile
index 2dcc6ccc2302..fb8335458a22 100644
--- a/drivers/platform/chrome/Makefile
+++ b/drivers/platform/chrome/Makefile
@@ -6,6 +6,7 @@ CFLAGS_cros_ec_sensorhub_ring.o:=	-I$(src)
 
 obj-$(CONFIG_CHROMEOS_ACPI)		+= chromeos_acpi.o
 obj-$(CONFIG_CHROMEOS_LAPTOP)		+= chromeos_laptop.o
+obj-$(CONFIG_CHROMEOS_OF_HW_PROBER)	+= chromeos_of_hw_prober.o
 obj-$(CONFIG_CHROMEOS_PRIVACY_SCREEN)	+= chromeos_privacy_screen.o
 obj-$(CONFIG_CHROMEOS_PSTORE)		+= chromeos_pstore.o
 obj-$(CONFIG_CHROMEOS_TBMC)		+= chromeos_tbmc.o
diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
new file mode 100644
index 000000000000..297d4704b75f
--- /dev/null
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ChromeOS Device Tree Hardware Prober
+ *
+ * Copyright (c) 2024 Google LLC
+ */
+
+#include <linux/array_size.h>
+#include <linux/errno.h>
+#include <linux/i2c-of-prober.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/stddef.h>
+
+#define DRV_NAME	"chromeos_of_hw_prober"
+
+/**
+ * struct hw_prober_entry - Holds an entry for the hardware prober
+ *
+ * @compatible:	compatible string to match against the machine
+ * @prober:	prober function to call when machine matches
+ * @data:	extra data for the prober function
+ */
+struct hw_prober_entry {
+	const char *compatible;
+	int (*prober)(struct device *dev, const void *data);
+	const void *data;
+};
+
+struct chromeos_i2c_probe_data {
+	const struct i2c_of_probe_cfg *cfg;
+	const struct i2c_of_probe_simple_opts *opts;
+};
+
+static int chromeos_i2c_component_prober(struct device *dev, const void *_data)
+{
+	const struct chromeos_i2c_probe_data *data = _data;
+	struct i2c_of_probe_simple_ctx ctx = {
+		.opts = data->opts,
+	};
+
+	return i2c_of_probe_component(dev, data->cfg, &ctx);
+}
+
+#define DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(_type)					\
+	static const struct i2c_of_probe_cfg chromeos_i2c_probe_simple_ ## _type ## _cfg = {	\
+		.type = #_type,									\
+		.ops = &i2c_of_probe_simple_ops,						\
+	}
+
+#define DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(_type)					\
+	static const struct chromeos_i2c_probe_data chromeos_i2c_probe_dumb_ ## _type = {	\
+		.cfg = &(const struct i2c_of_probe_cfg) {					\
+			.type = #_type,								\
+		},										\
+	}
+
+DEFINE_CHROMEOS_I2C_PROBE_DATA_DUMB_BY_TYPE(touchscreen);
+
+DEFINE_CHROMEOS_I2C_PROBE_CFG_SIMPLE_BY_TYPE(trackpad);
+
+static const struct chromeos_i2c_probe_data chromeos_i2c_probe_hana_trackpad = {
+	.cfg = &chromeos_i2c_probe_simple_trackpad_cfg,
+	.opts = &(const struct i2c_of_probe_simple_opts) {
+		.res_node_compatible = "elan,ekth3000",
+		.supply_name = "vcc",
+		/*
+		 * ELAN trackpad needs 2 ms for H/W init and 100 ms for F/W init.
+		 * Synaptics trackpad needs 100 ms.
+		 * However, the regulator is set to "always-on", presumably to
+		 * avoid this delay. The ELAN driver is also missing delays.
+		 */
+		.post_power_on_delay_ms = 0,
+	},
+};
+
+static const struct hw_prober_entry hw_prober_platforms[] = {
+	{
+		.compatible = "google,hana",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_dumb_touchscreen,
+	}, {
+		.compatible = "google,hana",
+		.prober = chromeos_i2c_component_prober,
+		.data = &chromeos_i2c_probe_hana_trackpad,
+	},
+};
+
+static int chromeos_of_hw_prober_probe(struct platform_device *pdev)
+{
+	for (size_t i = 0; i < ARRAY_SIZE(hw_prober_platforms); i++) {
+		int ret;
+
+		if (!of_machine_is_compatible(hw_prober_platforms[i].compatible))
+			continue;
+
+		ret = hw_prober_platforms[i].prober(&pdev->dev, hw_prober_platforms[i].data);
+		/* Ignore unrecoverable errors and keep going through other probers */
+		if (ret == -EPROBE_DEFER)
+			return ret;
+	}
+
+	return 0;
+}
+
+static struct platform_driver chromeos_of_hw_prober_driver = {
+	.probe	= chromeos_of_hw_prober_probe,
+	.driver	= {
+		.name = DRV_NAME,
+	},
+};
+
+static struct platform_device *chromeos_of_hw_prober_pdev;
+
+static int chromeos_of_hw_prober_driver_init(void)
+{
+	size_t i;
+	int ret;
+
+	for (i = 0; i < ARRAY_SIZE(hw_prober_platforms); i++)
+		if (of_machine_is_compatible(hw_prober_platforms[i].compatible))
+			break;
+	if (i == ARRAY_SIZE(hw_prober_platforms))
+		return -ENODEV;
+
+	ret = platform_driver_register(&chromeos_of_hw_prober_driver);
+	if (ret)
+		return ret;
+
+	chromeos_of_hw_prober_pdev =
+			platform_device_register_simple(DRV_NAME, PLATFORM_DEVID_NONE, NULL, 0);
+	if (IS_ERR(chromeos_of_hw_prober_pdev))
+		goto err;
+
+	return 0;
+
+err:
+	platform_driver_unregister(&chromeos_of_hw_prober_driver);
+
+	return PTR_ERR(chromeos_of_hw_prober_pdev);
+}
+module_init(chromeos_of_hw_prober_driver_init);
+
+static void chromeos_of_hw_prober_driver_exit(void)
+{
+	platform_device_unregister(chromeos_of_hw_prober_pdev);
+	platform_driver_unregister(&chromeos_of_hw_prober_driver);
+}
+module_exit(chromeos_of_hw_prober_driver_exit);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("ChromeOS device tree hardware prober");
+MODULE_IMPORT_NS(I2C_OF_PROBER);
-- 
2.47.0.163.g1226f6d8fa-goog


