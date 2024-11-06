Return-Path: <linux-i2c+bounces-7832-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D74689BE2B3
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 10:36:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 34313B22674
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 09:36:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFA8F1DE2A6;
	Wed,  6 Nov 2024 09:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AL+uqRjY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9E71DDC07
	for <linux-i2c@vger.kernel.org>; Wed,  6 Nov 2024 09:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730885669; cv=none; b=YUE7Qiurk++P2O2GmJA0sy09n+C3v/EnVFMird4KySzDMf5fyL8vhyGJdn6GXajyRkU+0PTs7k1DJKtWHI5c4zZI/Dq5+6iy3bt/+K7b78jcCWvM9FYn7l4hUmPRUte0ZhXTPjTGw/GPNYD22+af3H09zVjPy9qb1g75FBFaHgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730885669; c=relaxed/simple;
	bh=g0Ke6cFQPAI//FG8l4hlBZS0GL2ftT1CUxfn+qFrqwE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EppLSgElLkLbJaJNARhOALgXWD4BXyjsXzYnE7Hh4Fdz2NfaOqS9anULdbzcOAA34RtUUqprA11HVsWaXIY4kmHqaKFDmGrJniGcbLGa7D8by+iuw8Uz7ZqRvvX7iloT+TPiDmoEdDiBQwyvHmQh0FWgAg7R+iyKOp8qYPP5J44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=AL+uqRjY; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-20bb39d97d1so62182555ad.2
        for <linux-i2c@vger.kernel.org>; Wed, 06 Nov 2024 01:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730885666; x=1731490466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=huAJvy+H9l+GheA/RC75XQQKkdS5LpAA6/u7dPnX/o0=;
        b=AL+uqRjYtEOP9L/AIHFgpEmUBEOryr4xYDvponCVoArckJ0XsTRp5ATHCyDU3pxJHY
         E0sIcmXsoVm4rt4oTzUvB/7FbuM/4NTm2KIukyx5Oapte6aAcMkj2BDlMSBkCuh3S39J
         SWMSmQ687uFJF+5k6uyMugXdzgBlimvlaFDfY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730885666; x=1731490466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=huAJvy+H9l+GheA/RC75XQQKkdS5LpAA6/u7dPnX/o0=;
        b=VESrYcMLv0G4BeRlUtr6+bwdzmdsscVW1elvUeA/vJEvzs1bPyWFguaxt8juWDLiwD
         UECImdmQCwgx5XuLW/NeL6q4WIw57gAT8RCOGNMFjtZB21vRZPolLs4w8WraewKHGFaR
         OZQdJuc31fw1IRqSOe3lfZsGU0Iqn/mqVVd2bAkl5eRZX26mwbaXYG6Pb8rqNDF5GncM
         2/kKS+7XtrXOkWL9T7lLY7Cy4+PgBRupByd5GZTmPv3LoODfVlcQyiiq0z0jUSUVy0CQ
         8yF3JB+Rmfe+rKPE/Y1vwrdFz8RQ66SeatfmZIPXox9jqeDJbGwq3o8LE4tlS0YOiHna
         giuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLCjMWJNqEsRYI48laoFUVN+vaQy6oONzOBr4+cGWpn6idnpgUAjoxrKYNnymO3qRNuuHPg/rsymE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4ZxoB3xBgyfNGEFI/0gtRYs3hHkHGzctCUFjd1wxcKRQJFchv
	tyCOPFF0COM1JVLbailGbTKfaWR36fsJdzsvPutIwWcAl5v4gQ4A7R1L6pS90Q==
X-Google-Smtp-Source: AGHT+IE8snQcE1SrWqRDKoVNxvdLDszHzzVL8SuvRX5QTD4ROo5gi7GAvwYyTMVyyNbQu2tQSQbmrw==
X-Received: by 2002:a17:902:e852:b0:20b:6458:ec83 with SMTP id d9443c01a7336-210f74f6e5emr384238155ad.4.1730885665976;
        Wed, 06 Nov 2024 01:34:25 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:93fe:1d68:b50:3213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057062b8sm91478665ad.63.2024.11.06.01.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:34:25 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
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
	linux-i2c@vger.kernel.org,
	Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: [PATCH v11 6/7] platform/chrome: Introduce device tree hardware prober
Date: Wed,  6 Nov 2024 17:33:33 +0800
Message-ID: <20241106093335.1582205-7-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
In-Reply-To: <20241106093335.1582205-1-wenst@chromium.org>
References: <20241106093335.1582205-1-wenst@chromium.org>
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
2.47.0.199.ga7371fff76-goog


