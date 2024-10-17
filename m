Return-Path: <linux-i2c+bounces-7455-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 087F29A1EB6
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 11:44:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 23D451C2122F
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 09:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79B601D9586;
	Thu, 17 Oct 2024 09:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cR1Aq0ce"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D381DB37C
	for <linux-i2c@vger.kernel.org>; Thu, 17 Oct 2024 09:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729158175; cv=none; b=lZcyAscuLo+5g7zLq/2C/m6AeRlR973JmBpH6d4tmbp50Qm2mU3BxzgNlOmaS63tfAq4dRnLz1XZOrv9Cl7jVUuzfnk7I2Mmo0iZeLNwDMDOdYU1Ws58kP+9AoetHPjlFvX8XsQY3hWaFaaDY/27acdMpvUEROgBwxzu9+ALusg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729158175; c=relaxed/simple;
	bh=xKarPRLNc8aUexaTmt270N+bC2xGRHs/aMWkEFsOXn8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FpLLo0AlDpkNGzLzKg0b5OqlkPSR+UdHDGP2DSMJD9Wqd6AEELaQoSmSHdCE0hFc+0z69MUSqsl37PUd/npdFqRNZyZmtJp5LnLJ0LOXsFsAKXTP5aUH6qgwYC2yGw+WCfOp0P5oRCijOhkAh1MDkocK7ccKgCbqdLvlduBso58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cR1Aq0ce; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20caea61132so6168515ad.2
        for <linux-i2c@vger.kernel.org>; Thu, 17 Oct 2024 02:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729158171; x=1729762971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHZYWnDdCjl7VuE24p56whLRgSRMBYrVWXjyYgamdOs=;
        b=cR1Aq0ceOfQ/G99if6qKJeNkEwohFMMgJDj54VFyRaRXmVN/HW1m6f+rtdNzRH4NoE
         uO5oFKBqH1nCY7ks1TxjsZqPZQuLols50gC81gqSfRUj2pPq1VI9yxjCB2CAJcNWnVdI
         IvJAhAc4Sn7UVDegDp7wri4RJghhmXFtP0wRs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729158171; x=1729762971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eHZYWnDdCjl7VuE24p56whLRgSRMBYrVWXjyYgamdOs=;
        b=EeTSMKPawEYuxNf6tc2laUUaZqoTS4XU6vfVJcrmKk5fgE3NbXK8o8AnQGAz0Aukyl
         hhGRO9C+vnA4LRufVhmvc+pMZZnzjvNKYoPHLD9Ac1WeqDVNaMKAsfZrR2Oy+x5JQ1iv
         tnIGj1SDySeU/p923OwOpC0knWIEpBvmbqyvtOBmsnYbnXz14R75GvqsGGj5rROBTOIA
         G9uo9SqrUG6+JDE7iVzezjGRNQrg520wy/mRzhJOUKjwohpdSymX18rNQhR113GfvfQK
         LGT8CgpXT7FqIm7jn4HZun2XjeLzoE5OCXHT/SqOJTPwNr/qV+f5XKU9zSQaYDui6gzB
         Pr4A==
X-Forwarded-Encrypted: i=1; AJvYcCXcFYDrfqEKVI1LFloRDTo5zSGvEXsar3ZXM7p6U9WXFwgrSuozqV9pv6oceu+TiUFUdmmZgFujJ0g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ8BJ5e7JAQwOCZ+GRh6NC6Fr+PWERLTAFW97mWaDdjgCa+19j
	uVbLlOZLZLgsorum5IhLO0rX5yJnnrAyg14JKQzL8F4oHAxY5HTbJeWEBZtFzQ==
X-Google-Smtp-Source: AGHT+IFCfJ+aR1J8RHUhNSRSjhpkTUZqWVNyVBuDLhUR7GkfWAPX8FX8mZuV7uvErVDA66mkVyEoxQ==
X-Received: by 2002:a17:902:ecc9:b0:20c:9da6:65b0 with SMTP id d9443c01a7336-20cbb21ef43mr297220185ad.35.1729158171456;
        Thu, 17 Oct 2024 02:42:51 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fabb:a7ab:3d7:9aaa])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d17f87ccasm40638655ad.62.2024.10.17.02.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 02:42:51 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
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
Subject: [PATCH v9 6/7] platform/chrome: Introduce device tree hardware prober
Date: Thu, 17 Oct 2024 17:34:41 +0800
Message-ID: <20241017094222.1014936-7-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
In-Reply-To: <20241017094222.1014936-1-wenst@chromium.org>
References: <20241017094222.1014936-1-wenst@chromium.org>
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
 .../platform/chrome/chromeos_of_hw_prober.c   | 153 ++++++++++++++++++
 3 files changed, 165 insertions(+)
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
index 000000000000..2bda787f5270
--- /dev/null
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -0,0 +1,153 @@
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
2.47.0.rc1.288.g06298d1525-goog


