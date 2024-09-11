Return-Path: <linux-i2c+bounces-6529-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 469AE974B60
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 09:30:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C75661F2161B
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 07:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F753155733;
	Wed, 11 Sep 2024 07:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dGoqrUX0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F669154C0F
	for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 07:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726039732; cv=none; b=pKb2PNqaQrqbAo65DZXhzttD7JesPFCW7GLyIZKCX/d2PFsNRC0/V93isCAtWKuUi8T9wUyuIjDadcKU8EywzsFh7LwWlOvetONorMyR2nMBG1VDb25uyzARrmdYNyy03YUYQ0CntlKFYE3RegHPHddDlwutS5gxgyXMB8+bzNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726039732; c=relaxed/simple;
	bh=UnatgJSa9mULbZAmp0Q2lcoBK9WK0uHukrvur3A+0P0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qj6NtueRhY15q8frp2luMTYUJ8uMF0e5LeCX3al7KzzymPGv+TO8Pt8TRwhp4iEw2qLzc8MSvc5txU7wKkncDzD7sn1V/BCzF6rWhzYW0cOwRZCp166+gfJ7r6ML/XM05TiMlDd32oc644xbk26pDIZGiiHcwaxk8TwHXOi81g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=dGoqrUX0; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7d50e7a3652so3705851a12.3
        for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 00:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726039730; x=1726644530; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fr9yV4HGWVMIrGkx9ydigLiwJCnrmGer3in2e1w4xKk=;
        b=dGoqrUX0N81e0+gU0Guty/SoJ9JWMMkH+85bu+Jjh9zDhfNjyPK3jmaW5mTGz93xv9
         g/WW8e19aDgYgOSipFfKYp3WVKT6CJMr3pt68JGHduuY0mbbUD1QyuhYd3QJtvhi8hc1
         73BrgsHIGm48Fb9xfa8o+Mbn/M1RI9no/R5XY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726039730; x=1726644530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fr9yV4HGWVMIrGkx9ydigLiwJCnrmGer3in2e1w4xKk=;
        b=LFhnsl5prDZ0VLQWc/Ar53M1AW4LQbXzTtMZggSx/Z7xmOudozH8ngQHuYIyBACCI+
         C1S6bFDRpnfjlgASwxF+9HRkmGDc1iIgsh5w1KNf92kBu+CAF9arPf0PtjmPLfVYTVXI
         Cwj2SYqvHn159qjjOmjqczQAHkh5aWd89JZOGiv9u5gSFBhNM2iWktuB2pxN/Cfe2lQa
         nx5OcB6txQmX+1gjg9HDCVOIad6OkQLiJOGZdtUnxbPSvJzKOrtDrv9nhr02+yxpSPJl
         4xRYtrE4FFxK9DzsHhj185gfxWWlFD98h6M+B4n5e3CwcVPgVts5fd8Q0cDJ6NKpHdhF
         lISg==
X-Forwarded-Encrypted: i=1; AJvYcCWaCu5ClVk5xTPin23exOHknBtyHq9ZasxLFsE1IP4WZ2YpQndaHXKD4VKnvfDTYEUSMVMMF5nyMSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf9OIjoE14TEG/rmYUKW6KxeZJmDqc+s+c+vElja9GS1oa6/+Y
	9z8gl+gCDqE2qX7pOps34r8aj40ReZGnnxYj4900vn8jFJVm2k1IYIpsaSf8mg==
X-Google-Smtp-Source: AGHT+IEzZ5LA89X7I7aF3pUCsQe4p61WBrpC4obNNheNiGy0SPXWE2Q7sI4QYrZczPaRm66JSqQ2zw==
X-Received: by 2002:a05:6a21:4a4b:b0:1cf:2df6:453f with SMTP id adf61e73a8af0-1cf5de0ef4cmr5867206637.0.1726039730361;
        Wed, 11 Sep 2024 00:28:50 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8398:fe34:eba2:f301])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe4e7esm2399415b3a.80.2024.09.11.00.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 00:28:50 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v7 09/10] platform/chrome: Introduce device tree hardware prober
Date: Wed, 11 Sep 2024 15:27:47 +0800
Message-ID: <20240911072751.365361-10-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240911072751.365361-1-wenst@chromium.org>
References: <20240911072751.365361-1-wenst@chromium.org>
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
set to "failed-needs-probe". This makes it clear that some mechanism is
needed to enable one of them, and also prevents the prober and device
drivers running at the same time.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Acked-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
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
 .../platform/chrome/chromeos_of_hw_prober.c   | 125 ++++++++++++++++++
 3 files changed, 137 insertions(+)
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
index 2dcc6ccc2302..21a9d5047053 100644
--- a/drivers/platform/chrome/Makefile
+++ b/drivers/platform/chrome/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_CHROMEOS_ACPI)		+= chromeos_acpi.o
 obj-$(CONFIG_CHROMEOS_LAPTOP)		+= chromeos_laptop.o
 obj-$(CONFIG_CHROMEOS_PRIVACY_SCREEN)	+= chromeos_privacy_screen.o
 obj-$(CONFIG_CHROMEOS_PSTORE)		+= chromeos_pstore.o
+obj-$(CONFIG_CHROMEOS_OF_HW_PROBER)	+= chromeos_of_hw_prober.o
 obj-$(CONFIG_CHROMEOS_TBMC)		+= chromeos_tbmc.o
 obj-$(CONFIG_CROS_EC)			+= cros_ec.o
 obj-$(CONFIG_CROS_EC_I2C)		+= cros_ec_i2c.o
diff --git a/drivers/platform/chrome/chromeos_of_hw_prober.c b/drivers/platform/chrome/chromeos_of_hw_prober.c
new file mode 100644
index 000000000000..6d9667c40cc7
--- /dev/null
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -0,0 +1,125 @@
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
+#include <linux/platform_device.h>
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
+		.opts = data->opts
+	};
+
+	return i2c_of_probe_component(dev, data->cfg, &ctx);
+}
+
+static const struct chromeos_i2c_probe_data chromeos_i2c_probe_dumb_touchscreen = {
+	.cfg = &(const struct i2c_of_probe_cfg) {
+		.type = "touchscreen"
+	}
+};
+
+static const struct chromeos_i2c_probe_data chromeos_i2c_probe_dumb_trackpad = {
+	.cfg = &(const struct i2c_of_probe_cfg) {
+		.type = "trackpad"
+	}
+};
+
+static const struct hw_prober_entry hw_prober_platforms[] = {
+	{ .compatible = "google,hana", .prober = chromeos_i2c_component_prober, .data = &chromeos_i2c_probe_dumb_touchscreen },
+	{ .compatible = "google,hana", .prober = chromeos_i2c_component_prober, .data = &chromeos_i2c_probe_dumb_trackpad },
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
2.46.0.598.g6f2099f65c-goog


