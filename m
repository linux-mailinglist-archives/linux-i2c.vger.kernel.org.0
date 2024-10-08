Return-Path: <linux-i2c+bounces-7255-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A58F59940EE
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 10:16:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 397B5288EE0
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 08:16:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE351C6F41;
	Tue,  8 Oct 2024 07:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e7Tm16QF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296721CDA26
	for <linux-i2c@vger.kernel.org>; Tue,  8 Oct 2024 07:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728372915; cv=none; b=SmbuzXJS/ZUDNIMo8xz8VqJPQ27uB1jC8L1Ps2020vYPmrqUMxEKOfQF//o28fBfEpQxVCzcWnhE0nr8t77YwlDGpd+UswhdA/I9uzhd/JkuV8HykTBq4cbSGh3EuAiaxbujICeTEry6O7sIsHRpA2+QUtnY20gW0v++QoYhB+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728372915; c=relaxed/simple;
	bh=nE/fiUD8wtYRMYbh9flavEhYDKB6VQXqT16/5WJOYZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OknWt+Ww1meRtNhr8FqvCZw7i/k2qz/MYj5walUqBneWccYnhRpLrQnxLQ//+PWLB3O2kY9MYCs6Qwwgov9wE+Qqe0bNST913lLjytMEtNZAYQ2ytAHOU7ZnCpKTJMlf9Ki+nMac3PqykSo9XXy57MJ7zNUO7tdVMw17juDE48g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e7Tm16QF; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-207115e3056so48697285ad.2
        for <linux-i2c@vger.kernel.org>; Tue, 08 Oct 2024 00:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728372912; x=1728977712; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3Urm2Gd9lkx9QpNe5FuUQb3fMaQWiLoID5tgu7U4aA=;
        b=e7Tm16QFPi3pYN4YK11tT3iboYNcQF1BG175tQtto2YutjGofbncemRrkyGjt65EWQ
         jzRjvxcQTry5T6feyJCdiLgMOtSOmcN6AftQsy1RIv3poLAqjKcimH6i4l5qO4CNLkeu
         PrNXI3UMU8QQnzQOuIfqf/H5wqFrIlJEjiP7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728372912; x=1728977712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s3Urm2Gd9lkx9QpNe5FuUQb3fMaQWiLoID5tgu7U4aA=;
        b=isBoC2KbdKXaSg7teLSm0MWU0YM2CCJNLsrPuv0eITnkFT39tvE2S+nb6DFzufw2rC
         r6fmK4JphLA01jzUjkpqI6XkKtaFlyF3ttx2o6RusZFPF6xe5+fGqo0vs9uKa29q+czx
         gvkRJE6f8OyonillfE6ma/HKOTcNhGFaZISVtw965BTAZ+NJIwFQPNXg7hDhO4RvOhar
         52N/hMAgGaiuq+YTGlo7ZO1i4r0tDIp1banjY0GoddOrliPqgG9P+UFyROBYIS7/+MaN
         gADu+JZqzIJV6/tqC5CJQ4ama35Nogr3QNUnh9y1dz5Iq/S8ES6tMp+wNQvvDV3pPyWP
         yB+A==
X-Forwarded-Encrypted: i=1; AJvYcCVNpw96c0J8I9ou68DTOcPOiTMMzIvgnRLZAijrb35Ihpltq51O1z14ZZRY1vc5EQ/ht8RkRvJbuUc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzew5I4VycbfVQULSjXuS/KsqHAEKfcXidoAPh617eZ4vKU9dnF
	1y9z4FEfMRHuxuYTY+2Vd7oAXXRlRXsl5+VZtz4dKh+K1Dh8wgYfa733twPUtw==
X-Google-Smtp-Source: AGHT+IGLgcwc62NvV+1AM3ZYCpmHP4ueOvwdKeYFSYE//DUZfAoGheHLiPeqNZOIemDTbUAS7lwx9A==
X-Received: by 2002:a17:902:f551:b0:20b:8776:4902 with SMTP id d9443c01a7336-20bff047bd5mr213957095ad.38.1728372912577;
        Tue, 08 Oct 2024 00:35:12 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:10df:d27e:8d4b:6740])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13939bd7sm50121175ad.120.2024.10.08.00.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 00:35:12 -0700 (PDT)
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
Subject: [PATCH v8 5/8] i2c: of-prober: Add simple helpers for regulator support
Date: Tue,  8 Oct 2024 15:34:24 +0800
Message-ID: <20241008073430.3992087-6-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
In-Reply-To: <20241008073430.3992087-1-wenst@chromium.org>
References: <20241008073430.3992087-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add helpers to do regulator management for the I2C OF component prober.
Components that the prober intends to probe likely require their
regulator supplies be enabled, and GPIOs be toggled to enable them or
bring them out of reset before they will respond to probe attempts.
GPIOs will be handled in the next patch.

The assumption is that the same class of components to be probed are
always connected in the same fashion with the same regulator supply
and GPIO. The names may vary due to binding differences, but the
physical layout does not change.

This set of helpers supports at most one regulator supply. The user
must specify the node from which the supply is retrieved. The supply
name and the amount of time to wait after the supply is enabled are
also given by the user.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v7:
- Reworded comment in i2c_of_probe_simple_get_supply() as suggested
  (Andy)
- Dropped mention of time unit in struct i2c_of_probe_simple_opts
  kernel doc (Andy)
- Added mention of common GPIO line usages ("enable" or "reset") in I2C
  OF component prober kernel doc (Doug)
- Added check for non-zero delay before msleep() (Doug)
- Combined callback helpers (.get_resources with .enable; .cleanup with
  .free_resources_late)

Changes since v6:
- Moved change of of_get_next_child_scoped() to
  of_get_next_child_with_prefix() to previous patch
- Restructured into helpers for the I2C OF component prober
- Reduced to only handle one regulator
- Commit message updated

Changes since v5:
- Split of_regulator_bulk_get_all() return value check and explain
  "ret == 0" case
- Switched to of_get_next_child_with_prefix_scoped() where applicable
- Used krealloc_array() instead of directly calculating size
- copy whole regulator array in one memcpy() call
- Drop "0" from struct zeroing initializer
- Split out regulator helper from i2c_of_probe_enable_res() to keep
  code cleaner when combined with the next patch
- Added options for customizing power sequencing delay
- Rename i2c_of_probe_get_regulator() to i2c_of_probe_get_regulators()
- Add i2c_of_probe_free_regulator() helper

Changes since v4:
- Split out GPIO handling to separate patch
- Rewrote using of_regulator_bulk_get_all()
- Replaced "regulators" with "regulator supplies" in debug messages

Changes since v3:
- New patch
---
 drivers/i2c/i2c-core-of-prober.c | 138 ++++++++++++++++++++++++++++++-
 include/linux/i2c-of-prober.h    |  44 ++++++++++
 2 files changed, 181 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index cc1aae9fef43..d7f51ff872b8 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/cleanup.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/err.h>
@@ -13,6 +14,7 @@
 #include <linux/i2c-of-prober.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 
 /*
@@ -28,7 +30,6 @@
  * address responds.
  *
  * TODO:
- * - Support handling common regulators.
  * - Support handling common GPIOs.
  * - Support I2C muxes
  */
@@ -174,3 +175,138 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
 	return ret;
 }
 EXPORT_SYMBOL_NS_GPL(i2c_of_probe_component, I2C_OF_PROBER);
+
+static int i2c_of_probe_simple_get_supply(struct device *dev, struct device_node *node,
+					  struct i2c_of_probe_simple_ctx *ctx)
+{
+	const char *supply_name;
+	struct regulator *supply;
+
+	/*
+	 * It's entirely possible for the component's device node to not have the
+	 * regulator supplies. While it does not make sense from a hardware perspective,
+	 * the supplies could be always on or otherwise not modeled in the device tree,
+	 * but the device would still work.
+	 */
+	supply_name = ctx->opts->supply_name;
+	if (!supply_name)
+		return 0;
+
+	supply = of_regulator_get_optional(dev, node, supply_name);
+	if (IS_ERR(supply)) {
+		return dev_err_probe(dev, PTR_ERR(supply),
+				     "Failed to get regulator supply \"%s\" from %pOF\n",
+				     supply_name, node);
+	}
+
+	ctx->supply = supply;
+
+	return 0;
+}
+
+static void i2c_of_probe_simple_put_supply(struct i2c_of_probe_simple_ctx *ctx)
+{
+	regulator_put(ctx->supply);
+	ctx->supply = NULL;
+}
+
+static int i2c_of_probe_simple_enable_regulator(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
+{
+	int ret;
+
+	if (!ctx->supply)
+		return 0;
+
+	dev_dbg(dev, "Enabling regulator supply \"%s\"\n", ctx->opts->supply_name);
+
+	ret = regulator_enable(ctx->supply);
+	if (ret)
+		return ret;
+
+	if (ctx->opts->post_power_on_delay_ms)
+		msleep(ctx->opts->post_power_on_delay_ms);
+
+	return 0;
+}
+
+static void i2c_of_probe_simple_disable_regulator(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
+{
+	if (!ctx->supply)
+		return;
+
+	dev_dbg(dev, "Disabling regulator supply \"%s\"\n", ctx->opts->supply_name);
+
+	regulator_disable(ctx->supply);
+}
+
+/**
+ * i2c_of_probe_simple_enable - Simple helper for I2C OF prober to get and enable resources
+ * @dev: Pointer to the &struct device of the caller, only used for dev_printk() messages
+ * @bus_node: Pointer to the &struct device_node of the I2C adapter.
+ * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
+ *
+ * If &i2c_of_probe_simple_opts->supply_name is given, request the named regulator supply.
+ * If a regulator supply was found, enable that regulator.
+ *
+ * Return: %0 on success or no-op, or a negative error number on failure.
+ */
+int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node, void *data)
+{
+	struct i2c_of_probe_simple_ctx *ctx = data;
+	struct device_node *node;
+	const char *compat;
+	int ret;
+
+	dev_dbg(dev, "Requesting resources for components under I2C bus %pOF\n", bus_node);
+
+	if (!ctx || !ctx->opts)
+		return -EINVAL;
+
+	compat = ctx->opts->res_node_compatible;
+	if (!compat)
+		return -EINVAL;
+
+	node = of_get_compatible_child(bus_node, compat);
+	if (!node)
+		return dev_err_probe(dev, -ENODEV, "No device compatible with \"%s\" found\n",
+				     compat);
+
+	ret = i2c_of_probe_simple_get_supply(dev, node, ctx);
+	if (ret)
+		goto out_put_node;
+
+	ret = i2c_of_probe_simple_enable_regulator(dev, ctx);
+	if (ret)
+		goto out_put_supply;
+
+	return 0;
+
+out_put_supply:
+	i2c_of_probe_simple_put_supply(ctx);
+out_put_node:
+	of_node_put(node);
+	return ret;
+}
+EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_enable, I2C_OF_PROBER);
+
+/**
+ * i2c_of_probe_simple_cleanup - Clean up and release resources for I2C OF prober simple helpers
+ * @dev: Pointer to the &struct device of the caller, only used for dev_printk() messages
+ * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
+ *
+ * * If a regulator supply was found, disable that regulator and release it.
+ */
+void i2c_of_probe_simple_cleanup(struct device *dev, void *data)
+{
+	struct i2c_of_probe_simple_ctx *ctx = data;
+
+	i2c_of_probe_simple_disable_regulator(dev, ctx);
+	i2c_of_probe_simple_put_supply(ctx);
+}
+EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_cleanup, I2C_OF_PROBER);
+
+struct i2c_of_probe_ops i2c_of_probe_simple_ops = {
+	.enable = i2c_of_probe_simple_enable,
+	.cleanup = i2c_of_probe_simple_cleanup,
+};
+EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_ops, I2C_OF_PROBER);
diff --git a/include/linux/i2c-of-prober.h b/include/linux/i2c-of-prober.h
index b771da21a051..c4938a34b901 100644
--- a/include/linux/i2c-of-prober.h
+++ b/include/linux/i2c-of-prober.h
@@ -65,6 +65,50 @@ struct i2c_of_probe_cfg {
 
 int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cfg, void *ctx);
 
+/**
+ * DOC: I2C OF component prober simple helpers
+ *
+ * Components such as trackpads are commonly connected to a devices baseboard
+ * with a 6-pin ribbon cable. That gives at most one voltage supply and one
+ * GPIO (commonly a "enable" or "reset" line) besides the I2C bus, interrupt
+ * pin, and common ground. Touchscreens, while integrated into the display
+ * panel's connection, typically have the same set of connections.
+ *
+ * A simple set of helpers are provided here for use with the I2C OF component
+ * prober. This implementation targets such components, allowing for at most
+ * one regulator supply.
+ *
+ * The following helpers are provided:
+ * * i2c_of_probe_simple_enable()
+ * * i2c_of_probe_simple_cleanup()
+ */
+
+/**
+ * struct i2c_of_probe_simple_opts - Options for simple I2C component prober callbacks
+ * @res_node_compatible: Compatible string of device node to retrieve resources from.
+ * @supply_name: Name of regulator supply.
+ * @post_power_on_delay_ms: Delay after regulators are powered on. Passed to msleep().
+ */
+struct i2c_of_probe_simple_opts {
+	const char *res_node_compatible;
+	const char *supply_name;
+	unsigned int post_power_on_delay_ms;
+};
+
+struct regulator;
+
+struct i2c_of_probe_simple_ctx {
+	/* public: provided by user before helpers are used. */
+	const struct i2c_of_probe_simple_opts *opts;
+	/* private: internal fields for helpers. */
+	struct regulator *supply;
+};
+
+int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node, void *data);
+void i2c_of_probe_simple_cleanup(struct device *dev, void *data);
+
+extern struct i2c_of_probe_ops i2c_of_probe_simple_ops;
+
 #endif /* IS_ENABLED(CONFIG_OF_DYNAMIC) */
 
 #endif /* _LINUX_I2C_OF_PROBER_H */
-- 
2.47.0.rc0.187.ge670bccf7e-goog


