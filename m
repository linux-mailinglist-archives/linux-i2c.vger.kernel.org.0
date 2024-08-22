Return-Path: <linux-i2c+bounces-5656-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D385895B181
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 11:24:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 463B7B2516C
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 09:24:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B453185B7C;
	Thu, 22 Aug 2024 09:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FyhsGKCc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B05C185B7F
	for <linux-i2c@vger.kernel.org>; Thu, 22 Aug 2024 09:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724318455; cv=none; b=oUIgdWFzwr3WTphHTr/LqfEgZD7lUl7EAmjg+58crFz2+woY2IS9sgVo/aB5uNABmrILVLDq3UoeBt4YLl/4hcUr0s2f9rnucwVtq2ygH4jR5nb4uB9+RKtoC3tyqLY2sz+yVFTLIPXX7NXXb/uYBteJTM8Nfg1Y91EvqKlCUQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724318455; c=relaxed/simple;
	bh=yw39hontu2rPsw2Dfc+BlHwqRCTi/IleBZWbIffDIlg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iX9dFknT6tV1eelmrXike0Pw4YxdowJeefADe/zqpZTKLSJTNJErrIUzd7MI/jHu4mQTrA1J00DA1EIaHOrFYaMEuE/u5mqlGbpKJ8SgyJvSMmGB2qIXnA4D7msGynv6RJXEuP1n9jyQifJD0DZuWOcyjJSRN3VOFLL/VhTl/4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FyhsGKCc; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-714263cb074so514951b3a.1
        for <linux-i2c@vger.kernel.org>; Thu, 22 Aug 2024 02:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724318453; x=1724923253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQmK8T4bq0VH3g9O2efQWUIbRipH0PsfI9tyjRvqgic=;
        b=FyhsGKCcDsgGTniFDBB4K2RlidUSGRH+85KVFRmAL9EVHTEWvWlIil+17ZRs38FRa+
         NCq4wqqYqKmaY+ULJP7xWK5PY22z1dAJdgTQDjbH5KS9dcG2gXVzhZyN4PWEXJV4wQVu
         uO5WfoQGZ4+89dUAbIvgmnIxT0COngZQbaQEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724318453; x=1724923253;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQmK8T4bq0VH3g9O2efQWUIbRipH0PsfI9tyjRvqgic=;
        b=Y+2VcyKQKtx0N4Y8iBl+dIsiCM4Vt2Jdqg/EFnDjhIWl0i+5xllx2C98e7JciGecvD
         +iqLd1kgwOXY+tUWCthHc03RPymKMRxonnXaIOJG7QwHHx6vAGFw7BSa6q6sZyDJsHQ3
         04Wqph59n2fjj0pc0gml4W4+kJM0peN1OYnoDMOX5An/YZK0ikVm4rd1pYbwcoqifdGn
         XfgCGVAb3It+uYzCxi1LQKkCJWNIm/IhYFt/Ut7lOPtA4TihkLJRbxWDpxFhPGq4sNyK
         5H/tb3TLU4CgStfBY+50/G5nzoyWUEaOzmQ4l5Y9/NvQSN/jS+Px5GdcPro2Huunan0l
         kxpw==
X-Forwarded-Encrypted: i=1; AJvYcCXIm9k43oM6CLL7amcr78lM20C9+CncShKQzFzGL7TN7AlyWWuZ1vvVg82Fyzan9bkXC3uansn6qAg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxU/G781DDpzSpvzyNkF5WjzDADgWtxNTKwTYdWx65+KFtK2UBE
	Nna5nQNnELzIqoRRYbqkdJdp8OXzBnEkcxVDVj8qVWHsURuXa7h9UYjJwnna8w==
X-Google-Smtp-Source: AGHT+IH/kwtT/Qw1863OxoM8Pwh9F7kQ2eVlIqLy6rBTQ85cFpmTCAX1lJy/jdi51ORwhwbRPiou2Q==
X-Received: by 2002:a05:6a00:6f29:b0:70e:98e2:fdb5 with SMTP id d2e1a72fcca58-7143676376dmr1111472b3a.29.1724318453372;
        Thu, 22 Aug 2024 02:20:53 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8470:6a67:8877:ce2c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434335e69sm951398b3a.194.2024.08.22.02.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:20:53 -0700 (PDT)
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
Subject: [PATCH v5 09/10] platform/chrome: Introduce device tree hardware prober
Date: Thu, 22 Aug 2024 17:20:02 +0800
Message-ID: <20240822092006.3134096-10-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240822092006.3134096-1-wenst@chromium.org>
References: <20240822092006.3134096-1-wenst@chromium.org>
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
---
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
 .../platform/chrome/chromeos_of_hw_prober.c   | 104 ++++++++++++++++++
 3 files changed, 116 insertions(+)
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
index 000000000000..acf643a9eebe
--- /dev/null
+++ b/drivers/platform/chrome/chromeos_of_hw_prober.c
@@ -0,0 +1,104 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * ChromeOS Device Tree Hardware Prober
+ *
+ * Copyright (c) 2024 Google LLC
+ */
+
+#include <linux/array_size.h>
+#include <linux/errno.h>
+#include <linux/i2c.h>
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
+static int chromeos_i2c_component_prober(struct device *dev, const void *data)
+{
+	const char *type = data;
+
+	return i2c_of_probe_component(dev, type);
+}
+
+static const struct hw_prober_entry hw_prober_platforms[] = {
+	{ .compatible = "google,hana", .prober = chromeos_i2c_component_prober, .data = "touchscreen" },
+	{ .compatible = "google,hana", .prober = chromeos_i2c_component_prober, .data = "trackpad" },
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
-- 
2.46.0.184.g6999bdac58-goog


