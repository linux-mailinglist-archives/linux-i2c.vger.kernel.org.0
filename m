Return-Path: <linux-i2c+bounces-6526-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF400974B56
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 09:30:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6DEA21C25C6D
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 07:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA0D13D51E;
	Wed, 11 Sep 2024 07:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jpgCg63U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B6D14F12D
	for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 07:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726039722; cv=none; b=Tu2ltywquPjPdJe5hWuvNjW1rcowLeCDc6khgSYzc150KFknfkr6UfenOOWyyoC8niT7GGoSD8piSjwqryH+SdaiUsiLn0e7NQyogGdoK60EGWsrsOvh02M6R2XVvbi1GMTaFEDuQWGO/mxkw+1PjAGt6TcRsePVilE/xs7Hjjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726039722; c=relaxed/simple;
	bh=rkpZP23OkLqpFxIiBdJX7RlIVZude6weDw4hvQOiuKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E4ykolBNWI2HDhmAcYXAJ/T+spuVLPvyqG3u4/hRHxMBjOXAkOhL9A1RJceCumwDayC2kwR16kTSUNhEEAt2sSBDpErL1ygb1HshVZ/uyIWHY99dpqKituMzKZjbusRKv4b/nqBSZ+wC4/LpDgjSk4+9J8SWTOAEm25kAPPzEpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jpgCg63U; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-718d8d6af8fso4206877b3a.3
        for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 00:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726039720; x=1726644520; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YuuJ4IMp8f8RUPgIJJofk3lgpK2gw9f2hR5QsihKIF0=;
        b=jpgCg63UKOkMJMKHPkGfow6H7ds1KKf2VD5W+0bSGXZYiQsIJ7GLinzcTk6pGHadrF
         OBzhjiDawxpl6Oi25d6jB8wZfNmGDNmG4WSFJUucuWV9eQB7h94cwASPkp3T7RrIdAhX
         h+Y1DQurIpFkxTn/RK+DUOykS+0XtQnFJm0N4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726039720; x=1726644520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YuuJ4IMp8f8RUPgIJJofk3lgpK2gw9f2hR5QsihKIF0=;
        b=tlil86HPvThwcrG7aXgZO3NebtLrN+9Qm15LzVxH6sgYNWR3FWy0i44C9QRiupMGsX
         1lHVTQMtrudnQ+Nif06UhKWWVMtGMTaSBanUyo92ZuoumBJA1dERrvTwrB+ctlsJ/gjd
         8el+tPbPV8Rshua0yMMmEm0yzMkdGz9CkXeGifBy3L7V7BTaUchZeg8pkoVfMFDIf5A+
         ISldir9Q2d80AdQsi/My5zOOdmFK+9+3/dnvDUvnVwY9/4PUCvhRNfW9sFj/PxYG+BAe
         0Rn6n2TaD7+tuSRqGQzUz3i/K5u04/hsT0SmejbutsOlFNLFDgPPKIa3/zy5VvMCy1n2
         rsAw==
X-Forwarded-Encrypted: i=1; AJvYcCVr8x0aBNTR1W+xp5HIzlygCYYJgSg60hj1td3/4WAb+GbkDKJdnjjtWtIYUuNDRr1z2OQ9YGY3hU4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2Hci1qYPqKoyJCg/EyCYrB7m3FioIgppU40jwOGrmMJVkIENt
	KS1Enj3ZVM5ZNKv7kf/NcJfwGDoROG80xMmHuhoqcPK01p7z3haZgfWWo/WdvQ==
X-Google-Smtp-Source: AGHT+IGnls1/wySnShGxcSfF4z8WnLnKNAl5aI9lwWWNHkRT83lWy5txFhO7utXp/CZOwDQ3OoJEgw==
X-Received: by 2002:a05:6a00:1a87:b0:717:945e:effd with SMTP id d2e1a72fcca58-718e3f9dd53mr18901401b3a.1.1726039719906;
        Wed, 11 Sep 2024 00:28:39 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8398:fe34:eba2:f301])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe4e7esm2399415b3a.80.2024.09.11.00.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 00:28:39 -0700 (PDT)
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
Subject: [PATCH v7 06/10] i2c: Introduce OF component probe function
Date: Wed, 11 Sep 2024 15:27:44 +0800
Message-ID: <20240911072751.365361-7-wenst@chromium.org>
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
this change introduces a simple I2C component probe. function For a
given class of devices on the same I2C bus, it will go through all of
them, doing a simple I2C read transfer and see which one of them responds.
It will then enable the device that responds.

This requires some minor modifications in the existing device tree. The
status for all the device nodes for the component options must be set
to "failed-needs-probe". This makes it clear that some mechanism is
needed to enable one of them, and also prevents the prober and device
drivers running at the same time.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v6:
- Correctly replaced for_each_child_of_node_scoped() with
  for_each_child_of_node_with_prefix()
- Added namespace for exported symbol
- Made the probe function a framework with hooks
- Split out a new header file
- Added MAINTAINERS entry
- Reworded kernel-doc
- Dropped usage of __free from i2c_of_probe_component() since error
  path cleanup is needed anyway

Changes since v5:
- Fixed indent in Makefile
- Split regulator and GPIO TODO items
- Reversed final conditional in i2c_of_probe_enable_node()

Changes since v4:
- Split code into helper functions
- Use scoped helpers and __free() to reduce error path

Changes since v3:
- Complete kernel-doc
- Return different error if I2C controller is disabled
- Expand comment to explain assumptions and constraints
- Split for-loop finding target node and operations on target node
- Add missing i2c_put_adapter()
- Move prober code to separate file

Rob also asked why there was a limitation of "exactly one touchscreen
will be enabled across the whole tree".

The use case this prober currently targets is a component on consumer
electronics (tablet or laptop) being swapped out due to cost or supply
reasons. Designs with multiple components of the same type are pretty
rare. The way the next patch is written also assumes this for efficiency
reasons.

Changes since v2:
- New patch split out from "of: Introduce hardware prober driver"
- Addressed Rob's comments
  - Move i2c prober to i2c subsystem
  - Use of_node_is_available() to check if node is enabled.
  - Use OF changeset API to update status property
- Addressed Andy's comments
  - Probe function now accepts "struct device *dev" instead to reduce
    line length and dereferences
  - Move "ret = 0" to just before for_each_child_of_node(i2c_node, node)
---
 MAINTAINERS                      |   8 ++
 drivers/i2c/Makefile             |   1 +
 drivers/i2c/i2c-core-of-prober.c | 195 +++++++++++++++++++++++++++++++
 include/linux/i2c-of-prober.h    |  73 ++++++++++++
 4 files changed, 277 insertions(+)
 create mode 100644 drivers/i2c/i2c-core-of-prober.c
 create mode 100644 include/linux/i2c-of-prober.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 927f81c12543..d88646380786 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10645,6 +10645,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/i2c/marvell,mv64xxx-i2c.yaml
 F:	drivers/i2c/busses/i2c-mv64xxx.c
 
+I2C OF COMPONENT PROBER
+M:	Chen-Yu Tsai <wenst@chromium.org>
+L:	linux-i2c@vger.kernel.org
+L:	devicetree@vger.kernel.org
+S:	Maintained
+F:	drivers/i2c/i2c-core-of-prober.c
+F:	include/linux-i2c-of-prober.h
+
 I2C OVER PARALLEL PORT
 M:	Jean Delvare <jdelvare@suse.com>
 L:	linux-i2c@vger.kernel.org
diff --git a/drivers/i2c/Makefile b/drivers/i2c/Makefile
index f12d6b10a85e..c539cdc1e305 100644
--- a/drivers/i2c/Makefile
+++ b/drivers/i2c/Makefile
@@ -9,6 +9,7 @@ i2c-core-objs			:= i2c-core-base.o i2c-core-smbus.o
 i2c-core-$(CONFIG_ACPI)		+= i2c-core-acpi.o
 i2c-core-$(CONFIG_I2C_SLAVE)	+= i2c-core-slave.o
 i2c-core-$(CONFIG_OF)		+= i2c-core-of.o
+i2c-core-$(CONFIG_OF_DYNAMIC)	+= i2c-core-of-prober.o
 
 obj-$(CONFIG_I2C_SMBUS)		+= i2c-smbus.o
 obj-$(CONFIG_I2C_CHARDEV)	+= i2c-dev.o
diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
new file mode 100644
index 000000000000..62ff2f4b6177
--- /dev/null
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Linux I2C core OF component prober code
+ *
+ * Copyright (C) 2024 Google LLC
+ */
+
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/dev_printk.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
+#include <linux/i2c-of-prober.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/slab.h>
+
+/*
+ * Some devices, such as Google Hana Chromebooks, are produced by multiple
+ * vendors each using their preferred components. Such components are all
+ * in the device tree. Instead of having all of them enabled and having each
+ * driver separately try and probe its device while fighting over shared
+ * resources, they can be marked as "fail-needs-probe" and have a prober
+ * figure out which one is actually used beforehand.
+ *
+ * This prober assumes such drop-in parts are on the same I2C bus, have
+ * non-conflicting addresses, and can be directly probed by seeing which
+ * address responds.
+ *
+ * TODO:
+ * - Support handling common regulators.
+ * - Support handling common GPIOs.
+ * - Support I2C muxes
+ */
+
+static struct device_node *i2c_of_probe_get_i2c_node(struct device *dev, const char *type)
+{
+	struct device_node *node __free(device_node) = of_find_node_by_name(NULL, type);
+	if (!node)
+		return dev_err_ptr_probe(dev, -ENODEV, "Could not find %s device node\n", type);
+
+	struct device_node *i2c_node __free(device_node) = of_get_parent(node);
+	if (!of_node_name_eq(i2c_node, "i2c"))
+		return dev_err_ptr_probe(dev, -EINVAL, "%s device isn't on I2C bus\n", type);
+
+	if (!of_device_is_available(i2c_node))
+		return dev_err_ptr_probe(dev, -ENODEV, "I2C controller not available\n");
+
+	return no_free_ptr(i2c_node);
+}
+
+static int i2c_of_probe_enable_node(struct device *dev, struct device_node *node)
+{
+	int ret;
+
+	dev_info(dev, "Enabling %pOF\n", node);
+
+	struct of_changeset *ocs __free(kfree) = kzalloc(sizeof(*ocs), GFP_KERNEL);
+	if (!ocs)
+		return -ENOMEM;
+
+	of_changeset_init(ocs);
+	ret = of_changeset_update_prop_string(ocs, node, "status", "okay");
+	if (ret)
+		return ret;
+
+	ret = of_changeset_apply(ocs);
+	if (ret) {
+		/* ocs needs to be explicitly cleaned up before being freed. */
+		of_changeset_destroy(ocs);
+	} else {
+		/*
+		 * ocs is intentionally kept around as it needs to
+		 * exist as long as the change is applied.
+		 */
+		void *ptr __always_unused = no_free_ptr(ocs);
+	}
+
+	return ret;
+}
+
+static const struct i2c_of_probe_ops i2c_of_probe_dummy_ops;
+
+/**
+ * i2c_of_probe_component() - probe for devices of "type" on the same i2c bus
+ * @dev: Pointer to the &struct device of the caller, only used for dev_printk() messages.
+ * @cfg: Pointer to the &struct i2c_of_probe_cfg containing callbacks and other options
+ *       for the prober.
+ * @ctx: Context data for callbacks.
+ *
+ * Probe for possible I2C components of the same "type" (&i2c_of_probe_cfg->type)
+ * on the same I2C bus that have their status marked as "fail".
+ *
+ * Assumes that across the entire device tree the only instances of nodes
+ * prefixed with "type" are the ones that need handling for second source
+ * components. In other words, if "type" is "touchscreen", then all device
+ * nodes named "touchscreen*" are the ones that need probing. There cannot
+ * be another "touchscreen" node that is already enabled.
+ *
+ * Assumes that for each "type" of component, only one actually exists. In
+ * other words, only one matching and existing device will be enabled.
+ *
+ * Context: Process context only. Does non-atomic I2C transfers.
+ *          Should only be used from a driver probe function, as the function
+ *          can return -EPROBE_DEFER if the I2C adapter or other resources
+ *          are unavailable.
+ * Return: 0 on success or no-op, error code otherwise.
+ *         A no-op can happen when it seems like the device tree already
+ *         has components of the type to be probed already enabled. This
+ *         can happen when the device tree had not been updated to mark
+ *         the status of the to-be-probed components as "fail". Or this
+ *         function was already run with the same parameters and succeeded
+ *         in enabling a component. The latter could happen if the user
+ *         had multiple types of components to probe, and one of them down
+ *         the list caused a deferred probe. This is expected behavior.
+ */
+int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cfg, void *ctx)
+{
+	const struct i2c_of_probe_ops *ops;
+	const char *type;
+	struct device_node *i2c_node;
+	struct i2c_adapter *i2c;
+	int ret;
+
+	if (!cfg)
+		return -EINVAL;
+
+	ops = cfg->ops ?: &i2c_of_probe_dummy_ops;
+	type = cfg->type;
+
+	i2c_node = i2c_of_probe_get_i2c_node(dev, type);
+	if (IS_ERR(i2c_node))
+		return PTR_ERR(i2c_node);
+
+	for_each_child_of_node_with_prefix(i2c_node, node, type) {
+		if (!of_device_is_available(node))
+			continue;
+
+		/*
+		 * Device tree has component already enabled. Either the
+		 * device tree isn't supported or we already probed once.
+		 */
+		ret = 0;
+		goto out_put_i2c_node;
+	}
+
+	i2c = of_get_i2c_adapter_by_node(i2c_node);
+	if (!i2c) {
+		ret = dev_err_probe(dev, -EPROBE_DEFER, "Couldn't get I2C adapter\n");
+		goto out_put_i2c_node;
+	}
+
+	/* Grab resources */
+	ret = 0;
+	if (ops->get_resources)
+		ret = ops->get_resources(dev, i2c_node, ctx);
+	if (ret)
+		goto out_put_i2c_adapter;
+
+	/* Enable resources */
+	if (ops->enable)
+		ret = ops->enable(dev, ctx);
+	if (ret)
+		goto out_release_resources;
+
+	ret = 0;
+	for_each_child_of_node_with_prefix(i2c_node, node, type) {
+		union i2c_smbus_data data;
+		u32 addr;
+
+		if (of_property_read_u32(node, "reg", &addr))
+			continue;
+		if (i2c_smbus_xfer(i2c, addr, 0, I2C_SMBUS_READ, 0, I2C_SMBUS_BYTE, &data) < 0)
+			continue;
+
+		/* Found a device that is responding */
+		if (ops->free_resources_early)
+			ops->free_resources_early(ctx);
+		ret = i2c_of_probe_enable_node(dev, node);
+		break;
+	}
+
+	if (ops->cleanup)
+		ops->cleanup(dev, ctx);
+out_release_resources:
+	if (ops->free_resources_late)
+		ops->free_resources_late(ctx);
+out_put_i2c_adapter:
+	i2c_put_adapter(i2c);
+out_put_i2c_node:
+	of_node_put(i2c_node);
+
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(i2c_of_probe_component, I2C_OF_PROBER);
diff --git a/include/linux/i2c-of-prober.h b/include/linux/i2c-of-prober.h
new file mode 100644
index 000000000000..0f94e7c94310
--- /dev/null
+++ b/include/linux/i2c-of-prober.h
@@ -0,0 +1,73 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * i2c-of-prober.h - definitions for the Linux I2C OF component prober
+ *
+ * Copyright (C) 2024 Google LLC
+ */
+
+#ifndef _LINUX_I2C_OF_PROBER_H
+#define _LINUX_I2C_OF_PROBER_H
+
+#if IS_ENABLED(CONFIG_OF_DYNAMIC)
+
+struct device;
+struct device_node;
+
+/**
+ * struct i2c_of_probe_ops - I2C OF component prober callbacks
+ *
+ * A set of callbacks to be used by i2c_of_probe_component().
+ *
+ * All callbacks are optional. Callbacks are called only once per run, and are
+ * used in the order they are defined in this structure.
+ *
+ * All callbacks that have return values shall return %0 on success,
+ * or a negative error number on failure.
+ *
+ * The @dev parameter passed to the callbacks is the same as @dev passed to
+ * i2c_of_probe_component(). It should only be used for dev_printk() calls
+ * and nothing else, especially not managed device resource (devres) APIs.
+ */
+struct i2c_of_probe_ops {
+	/** @get_resources: Retrieve resources for components. */
+	int (*get_resources)(struct device *dev, struct device_node *bus_node, void *data);
+
+	/** @free_resources_early: Release exclusive resources prior to enabling component. */
+	void (*free_resources_early)(void *data);
+
+	/**
+	 * @enable: Enable resources so that the components respond to probes.
+	 *
+	 * Resources should be reverted to their initial state before returning if this fails.
+	 */
+	int (*enable)(struct device *dev, void *data);
+
+	/**
+	 * @cleanup: Opposite of @enable to balance refcounts after probing.
+	 *
+	 * Can not operate on resources already freed in @free_resources_early.
+	 */
+	int (*cleanup)(struct device *dev, void *data);
+
+	/**
+	 * @free_resources_late: Release all resources, including those that would have
+	 *                       been released by @free_resources_early.
+	 */
+	void (*free_resources_late)(void *data);
+};
+
+/**
+ * struct i2c_of_probe_cfg - I2C OF component prober configuration
+ * @ops: Callbacks for the prober to use.
+ * @type: A string to match the device node name prefix to probe for.
+ */
+struct i2c_of_probe_cfg {
+	const struct i2c_of_probe_ops *ops;
+	const char *type;
+};
+
+int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cfg, void *ctx);
+
+#endif /* IS_ENABLED(CONFIG_OF_DYNAMIC) */
+
+#endif /* _LINUX_I2C_OF_PROBER_H */
-- 
2.46.0.598.g6f2099f65c-goog


