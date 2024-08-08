Return-Path: <linux-i2c+bounces-5212-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 668E094BA4E
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 12:00:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2C03B22593
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 10:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23EA918A933;
	Thu,  8 Aug 2024 09:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KcyJpvoI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4203D189F32
	for <linux-i2c@vger.kernel.org>; Thu,  8 Aug 2024 09:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723111196; cv=none; b=fVaZgyX1/wzCpHQaWS8z84lYOZezwoV31KfcOxhbkDD1jF01sfgyvjXvB4C1xfmIkD4FHKO21af1ddC/svoNYKjkrsnyGqf9GPFbHSaz/f2BK21iUEbU0FhNtHOep0TArCpxQ8Dad4rTr99CBdH4pA6hFF4IsMAEtsuplIZCiOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723111196; c=relaxed/simple;
	bh=py16IRx3ZkhAud/YioWOf8kFrqTw6bFMSUXkOiTxpPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YaxYIAHFb3CEqhUd7haFuVNorBIvYRazoBfUYYjbt2RLbH/sO9t2NrJIoTqXVHXYxqLWJmqGJmMuIqxh0BGCmP3nkuNKkDmsfz6KCFL5Hwku/WpyitknioqczrDuFNa6kVWHV1gs2jEas3Cxy5ZPz7lHdklkEWn5aJl2zTqOVG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KcyJpvoI; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fd6ed7688cso8193135ad.3
        for <linux-i2c@vger.kernel.org>; Thu, 08 Aug 2024 02:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723111195; x=1723715995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8qgCZ39zaMZ1pHgoNfFZBo55h8VlLpIWFFJKzWV3ijA=;
        b=KcyJpvoILBTgeup5ng6u1qrB1vgIHMQWppO+zMx8HyQvsHqCPDeJJ3dAQ+rJLoErpU
         lANO26nciRLAfJvLa1bNuwxENt0rye1Dyite/GJ61RtgKTMyt6Rq5r5XK9MG8zwiG2rk
         gLKD0RZFmPfnPYsGqxLqStWKxDPMz6R/LBRUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723111195; x=1723715995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8qgCZ39zaMZ1pHgoNfFZBo55h8VlLpIWFFJKzWV3ijA=;
        b=eanM/T94i0Wl1kDn30eil6+JIYVjx7DBz1jzsnZ/LbNjRMKeFgwjPFKGmyPDK+VppK
         x4hoEyZcgNTA/v+c3ZEcfzBly6PEQQAiudysvPYDHjhczt3mDRn6honxiW8Icyp6aifU
         96/bX+qdm+1Ag9Ro68aN4B0D09RvF1pzPodP+CsJPAAA2/26rgeXiR75YVfBh3FpedLs
         qJN9m1LPXrGdBlW7iR/94M1qDK+ApEC/fgVJMH8JM/Xz8uIRcwzdZGcbKIqEvc+TNIkk
         JnYySfQpWdYqv4uBM+2rnWkthiZqpw83lgvLuArAuunAxOiR+zfORYZb0WVKK26abFgs
         OlUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAjm/yZuWWq/n+Q2Lz/Ic1+E/J29BKiPwhnZeKaGBmPJhazMELJL+u+3ipfFxd6+1I/8qOXm8FFvxzFhuM7OznGqCXX02/vPdN
X-Gm-Message-State: AOJu0YzwWzVqMzOJzLCttR3776v/t9tXspqPrhYbfTfNyXBPwnQqgKme
	UeemlHE1nHzQlKNyQMaaAq/1xgp0xvqiyIxyft+PJEaCkTPJp0IMq84OYvUo5g==
X-Google-Smtp-Source: AGHT+IEKKGr+vmamMIgjjXNkXa4rHYEBsgcb5kjNPWWGBvxBXx4ElZWMNIirkJNIPkRsY8kGV6DcSg==
X-Received: by 2002:a17:903:8ce:b0:1fb:7530:30be with SMTP id d9443c01a7336-2009527d432mr18198885ad.38.1723111194535;
        Thu, 08 Aug 2024 02:59:54 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8b53:87e6:914:a00d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59297707sm120784985ad.254.2024.08.08.02.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 02:59:54 -0700 (PDT)
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
Subject: [PATCH v4 3/6] i2c: Introduce OF component probe function
Date: Thu,  8 Aug 2024 17:59:26 +0800
Message-ID: <20240808095931.2649657-4-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.rc2.264.g509ed76dc8-goog
In-Reply-To: <20240808095931.2649657-1-wenst@chromium.org>
References: <20240808095931.2649657-1-wenst@chromium.org>
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
 drivers/i2c/Makefile             |   1 +
 drivers/i2c/i2c-core-of-prober.c | 155 +++++++++++++++++++++++++++++++
 include/linux/i2c.h              |   4 +
 3 files changed, 160 insertions(+)
 create mode 100644 drivers/i2c/i2c-core-of-prober.c

diff --git a/drivers/i2c/Makefile b/drivers/i2c/Makefile
index 3f71ce4711e3..0c543c742895 100644
--- a/drivers/i2c/Makefile
+++ b/drivers/i2c/Makefile
@@ -9,6 +9,7 @@ i2c-core-objs 			:= i2c-core-base.o i2c-core-smbus.o
 i2c-core-$(CONFIG_ACPI)		+= i2c-core-acpi.o
 i2c-core-$(CONFIG_I2C_SLAVE) 	+= i2c-core-slave.o
 i2c-core-$(CONFIG_OF) 		+= i2c-core-of.o
+i2c-core-$(CONFIG_OF_DYNAMIC) 	+= i2c-core-of-prober.o
 
 obj-$(CONFIG_I2C_SMBUS)		+= i2c-smbus.o
 obj-$(CONFIG_I2C_CHARDEV)	+= i2c-dev.o
diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
new file mode 100644
index 000000000000..08aa736cc7a9
--- /dev/null
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -0,0 +1,155 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Linux I2C core OF component prober code
+ *
+ * Copyright (C) 2024 Google LLC
+ */
+
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/i2c.h>
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
+ * - Support handling common regulators and GPIOs.
+ * - Support I2C muxes
+ */
+
+/**
+ * i2c_of_probe_component() - probe for devices of "type" on the same i2c bus
+ * @dev: &struct device of the caller, only used for dev_* printk messages
+ * @type: a string to match the device node name prefix to probe for
+ *
+ * Probe for possible I2C components of the same "type" on the same I2C bus
+ * that have their status marked as "fail".
+ *
+ * Assumes that across the entire device tree the only instances of nodes
+ * prefixed with "type" are the ones that need handling for second source
+ * components. In other words, if type is "touchscreen", then all device
+ * nodes named "touchscreen*" are the ones that need probing. There cannot
+ * be another "touchscreen" node that is already enabled.
+ *
+ * Assumes that for each "type" of component, only one actually exists. In
+ * other words, only one matching and existing device will be enabled.
+ *
+ * Context: Process context only. Does non-atomic I2C transfers.
+ *          Should only be used from a driver probe function, as the function
+ *          can return -EPROBE_DEFER if the I2C adapter is unavailable.
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
+int i2c_of_probe_component(struct device *dev, const char *type)
+{
+	struct device_node *node, *i2c_node;
+	struct i2c_adapter *i2c;
+	struct of_changeset *ocs = NULL;
+	int ret;
+
+	node = of_find_node_by_name(NULL, type);
+	if (!node)
+		return dev_err_probe(dev, -ENODEV, "Could not find %s device node\n", type);
+
+	i2c_node = of_get_next_parent(node);
+	if (!of_node_name_eq(i2c_node, "i2c")) {
+		of_node_put(i2c_node);
+		return dev_err_probe(dev, -EINVAL, "%s device isn't on I2C bus\n", type);
+	}
+
+	if (!of_device_is_available(i2c_node)) {
+		of_node_put(i2c_node);
+		return dev_err_probe(dev, -ENODEV, "I2C controller not available\n");
+	}
+
+	for_each_child_of_node(i2c_node, node) {
+		if (!of_node_name_prefix(node, type))
+			continue;
+		if (of_device_is_available(node)) {
+			/*
+			 * Device tree has component already enabled. Either the
+			 * device tree isn't supported or we already probed once.
+			 */
+			of_node_put(node);
+			of_node_put(i2c_node);
+			return 0;
+		}
+	}
+
+	i2c = of_get_i2c_adapter_by_node(i2c_node);
+	if (!i2c) {
+		of_node_put(i2c_node);
+		return dev_err_probe(dev, -EPROBE_DEFER, "Couldn't get I2C adapter\n");
+	}
+
+	ret = 0;
+	for_each_child_of_node(i2c_node, node) {
+		union i2c_smbus_data data;
+		u32 addr;
+
+		if (!of_node_name_prefix(node, type))
+			continue;
+		if (of_property_read_u32(node, "reg", &addr))
+			continue;
+		if (i2c_smbus_xfer(i2c, addr, 0, I2C_SMBUS_READ, 0, I2C_SMBUS_BYTE, &data) < 0)
+			continue;
+
+		break;
+	}
+
+	/* Found a device that is responding */
+	if (node) {
+		dev_info(dev, "Enabling %pOF\n", node);
+
+		ocs = kzalloc(sizeof(*ocs), GFP_KERNEL);
+		if (!ocs) {
+			ret = -ENOMEM;
+			goto err_put_node;
+		}
+
+		of_changeset_init(ocs);
+		ret = of_changeset_update_prop_string(ocs, node, "status", "okay");
+		if (ret)
+			goto err_free_ocs;
+		ret = of_changeset_apply(ocs);
+		if (ret)
+			goto err_destroy_ocs;
+
+		of_node_put(node);
+	}
+
+	i2c_put_adapter(i2c);
+	of_node_put(i2c_node);
+
+	return 0;
+
+err_destroy_ocs:
+	of_changeset_destroy(ocs);
+err_free_ocs:
+	kfree(ocs);
+err_put_node:
+	of_node_put(node);
+	i2c_put_adapter(i2c);
+	of_node_put(i2c_node);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(i2c_of_probe_component);
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 7eedd0c662da..0415d5d0f6ac 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -1030,6 +1030,10 @@ const struct of_device_id
 int of_i2c_get_board_info(struct device *dev, struct device_node *node,
 			  struct i2c_board_info *info);
 
+#if IS_ENABLED(CONFIG_OF_DYNAMIC)
+int i2c_of_probe_component(struct device *dev, const char *type);
+#endif
+
 #else
 
 static inline struct i2c_client *of_find_i2c_device_by_node(struct device_node *node)
-- 
2.46.0.rc2.264.g509ed76dc8-goog


