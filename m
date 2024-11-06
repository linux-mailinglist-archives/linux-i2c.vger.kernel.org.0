Return-Path: <linux-i2c+bounces-7831-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 656489BE2A9
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 10:35:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2548D28386E
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 09:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8E2B1DDA1E;
	Wed,  6 Nov 2024 09:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SBFfDkuo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454C71DD555
	for <linux-i2c@vger.kernel.org>; Wed,  6 Nov 2024 09:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730885665; cv=none; b=Ncl84zfQtLMic3AxRqilxZODASjALmww/RLIzzqrUqrbLn7q7q337xj5L+L5awZBdfmviEZx/VNN/tRsqJ38JVBeanJfZQgdybflybniEJG5/P92V355iZUCmywrgvS026fUSd1D8bLd8OCvQC7AUfQBy8/LYV5jwyaMOTMxjI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730885665; c=relaxed/simple;
	bh=tBlW6JhLTkyVljLWcXlC4Co0tDocmTG5vfxk3tmF+1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UuZO3bb9cLJbWdjCSGOjv6q+cKhyAHMUDcKxYMUJV8xbk0G7ySi0/7VYfivuezGamfj9VzBMYpb8PLXHvKk9V/919Vl1ipVrH2/k0Upr4U3EwuM6LGkpcO0fAeL577f1Q3ZHvl9ekHcyFkd7Oly3YG0kEcB1/e+tPzL9QR4QmJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SBFfDkuo; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-21145812538so29392975ad.0
        for <linux-i2c@vger.kernel.org>; Wed, 06 Nov 2024 01:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730885663; x=1731490463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BGOV0059hbfeaZFhU219abBt+9+XtBAkRTCfbtRWJD8=;
        b=SBFfDkuo1z56PEXac03FSbEDCddrTP662xBMaIMelQG0KZvRj+L3iBl3zbY1F6UelA
         eVZUI7mzXTcMQTObiAi/IHBXvLfyDEeP5vls0F19OMaq4byo97ZhEadjo+NigGUah3OG
         im96HpvBqIFyGtfAOgwcHJmMavLaqiNpFxUzI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730885663; x=1731490463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BGOV0059hbfeaZFhU219abBt+9+XtBAkRTCfbtRWJD8=;
        b=MTk5m0nxa8MPFPH60kXmDBQZDHt0nB+3IUiZakKjeml99HoiE8GHGAN0YKbXfpvirn
         wEzUE/p0EtIjkQMOwPgA1Z83PD3gVezAZIwGNIzdWFDYFfF86IC4S1h9NaOZ1AiWida7
         jPF3WgCJTgQdtvG9G+vzcWmki3bKlZXeAX0JrB3/UuqRa/zqXBaLLS1c1mIRRryXJZdi
         0WR7A7maiYFHYBc0lb9z3qO84dBt7/2Ik0u/OVQa9HMIXXDeqXg39GdVfvVPKlmelSRa
         f9mCXdLfTqr4qzd9i9YQx9+FUUn4wLRPm19PzVAGUvExUqD6/oKF495dr7+w/Lxu2Ly0
         OKzg==
X-Forwarded-Encrypted: i=1; AJvYcCWxngylA2TQpvtzxVV3j5wfwjDpHa5ve9J2Qy/7LBJszHomgGw8idXq3R+cw6/d8qhcONjiwFHZXBI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8MnwFx4ALYT5m6sKk2n7FBf3NY1qHGCLANti0YZZFoH/lqCKV
	UBqhQedPNyzsqlN/KAWPUiT9mGCkR/WiV5MRlpjDDrsp0C8mt7Q3JS/eX0Z8fg==
X-Google-Smtp-Source: AGHT+IFl9b3g6u4y1B0yH1Dk8Xw9Rm7sTCp3VXmKhlnqKRu3HlwTX6AK1ZHYsqk7u/dW4Fbgz4pB/w==
X-Received: by 2002:a17:903:2bce:b0:20b:9e14:c138 with SMTP id d9443c01a7336-210c6ae4f07mr563185255ad.23.1730885662615;
        Wed, 06 Nov 2024 01:34:22 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:93fe:1d68:b50:3213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057062b8sm91478665ad.63.2024.11.06.01.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:34:22 -0800 (PST)
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
Subject: [PATCH v11 5/7] i2c: of-prober: Add GPIO support to simple helpers
Date: Wed,  6 Nov 2024 17:33:32 +0800
Message-ID: <20241106093335.1582205-6-wenst@chromium.org>
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

Add GPIO support to the simple helpers for the I2C OF component prober.
Components that the prober intends to probe likely require their
regulator supplies be enabled, and GPIOs be toggled to enable them or
bring them out of reset before they will respond to probe attempts.
Regulator supplies were handled in the previous patch.

The assumption is that the same class of components to be probed are
always connected in the same fashion with the same regulator supply
and GPIO. The names may vary due to binding differences, but the
physical layout does not change.

This supports at most one GPIO pin. The user must specify the GPIO name,
the polarity, and the amount of time to wait after the GPIO is toggled.
Devices with more than one GPIO pin likely require specific power
sequencing beyond what generic code can easily support.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
Changes since v10:
- Added include of linux/types.h for |bool|

Changes since v9:
- Picked up Andy's reviewed-by

Changes since v8:
- Moved |struct gpio_desc| forward declaration before |struct regulator|
  (Andy)
- Dropped GPIO descriptor validity check from
  i2c_of_probe_simple_disable_gpio(); GPIO functions check it (Andy)
- Dropped comment from i2c_of_probe_simple_disable_gpio() (Doug)
- Reworded comment in i2c_of_probe_simple_cleanup() (Doug)
- Picked up Doug's reviewed-by

Changes since v7:
- Dropped mention of time unit in struct i2c_of_probe_simple_opts
  kernel doc (Andy)
- Added check for non-zero delay before msleep() (Doug)
- Simplified GPIO name check and reverse conditional branches (Andy)
- Added description about the supported power sequence
- Switched GPIO usage to logical levels (Doug)
  - Changed some variable names and comments to fit
- Added description of power sequence to struct i2c_of_probe_simple_opts
  (Doug)
- Added comment saying i2c_of_probe_simple_put_gpiod() might be no-op
  (Doug)
- Combined callbacks (.get_resources with .enable; .cleanup with
  .free_resources_late); renamed i2c_of_probe_simple_free_res_early() to
  i2c_of_probe_simple_cleanup_early()

Changes since v6:
- Restructured into helpers for the I2C OF component prober
- Reduced to only handle one GPIO
- Set GPIO to input on (failure) cleanup
- Updated commit message

Changes since v5:
- Renamed "con" to "propname" in i2c_of_probe_get_gpiod()
- Copy string first and check return value of strscpy() for overflow in
  i2c_of_probe_get_gpiod()
- Add parenthesis around "enable" and "reset" GPIO names in comments
- Split resource count debug message into two separate lines
- Split out GPIO helper from i2c_of_probe_enable_res() to keep code
  cleaner following the previous patch
- Adopted options for customizing power sequencing delay following
  previous patch

Changes since v4:
- Split out from previous patch
- Moved GPIO property name check to common function in gpiolib.c in new
  patch
- Moved i2c_of_probe_free_gpios() into for_each_child_of_node_scoped()
- Rewrote in gpiod_*_array-esque fashion
---
 drivers/i2c/i2c-core-of-prober.c | 100 ++++++++++++++++++++++++++++++-
 include/linux/i2c-of-prober.h    |  21 +++++++
 2 files changed, 119 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 76df75c51cae..b9ca785f8b17 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -10,6 +10,7 @@
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/err.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/i2c-of-prober.h>
 #include <linux/module.h>
@@ -31,7 +32,6 @@
  * address responds.
  *
  * TODO:
- * - Support handling common GPIOs.
  * - Support I2C muxes
  */
 
@@ -246,6 +246,62 @@ static void i2c_of_probe_simple_disable_regulator(struct device *dev, struct i2c
 	regulator_disable(ctx->supply);
 }
 
+static int i2c_of_probe_simple_get_gpiod(struct device *dev, struct device_node *node,
+					 struct i2c_of_probe_simple_ctx *ctx)
+{
+	struct fwnode_handle *fwnode = of_fwnode_handle(node);
+	struct gpio_desc *gpiod;
+	const char *con_id;
+
+	/* NULL signals no GPIO needed */
+	if (!ctx->opts->gpio_name)
+		return 0;
+
+	/* An empty string signals an unnamed GPIO */
+	if (!ctx->opts->gpio_name[0])
+		con_id = NULL;
+	else
+		con_id = ctx->opts->gpio_name;
+
+	gpiod = fwnode_gpiod_get_index(fwnode, con_id, 0, GPIOD_ASIS, "i2c-of-prober");
+	if (IS_ERR(gpiod))
+		return PTR_ERR(gpiod);
+
+	ctx->gpiod = gpiod;
+
+	return 0;
+}
+
+static void i2c_of_probe_simple_put_gpiod(struct i2c_of_probe_simple_ctx *ctx)
+{
+	gpiod_put(ctx->gpiod);
+	ctx->gpiod = NULL;
+}
+
+static int i2c_of_probe_simple_set_gpio(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
+{
+	int ret;
+
+	if (!ctx->gpiod)
+		return 0;
+
+	dev_dbg(dev, "Configuring GPIO\n");
+
+	ret = gpiod_direction_output(ctx->gpiod, ctx->opts->gpio_assert_to_enable);
+	if (ret)
+		return ret;
+
+	if (ctx->opts->post_gpio_config_delay_ms)
+		msleep(ctx->opts->post_gpio_config_delay_ms);
+
+	return 0;
+}
+
+static void i2c_of_probe_simple_disable_gpio(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
+{
+	gpiod_set_value(ctx->gpiod, !ctx->opts->gpio_assert_to_enable);
+}
+
 /**
  * i2c_of_probe_simple_enable - Simple helper for I2C OF prober to get and enable resources
  * @dev: Pointer to the &struct device of the caller, only used for dev_printk() messages
@@ -253,7 +309,11 @@ static void i2c_of_probe_simple_disable_regulator(struct device *dev, struct i2c
  * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
  *
  * If &i2c_of_probe_simple_opts->supply_name is given, request the named regulator supply.
+ * If &i2c_of_probe_simple_opts->gpio_name is given, request the named GPIO. Or if it is
+ * the empty string, request the unnamed GPIO.
  * If a regulator supply was found, enable that regulator.
+ * If a GPIO line was found, configure the GPIO line to output and set value
+ * according to given options.
  *
  * Return: %0 on success or no-op, or a negative error number on failure.
  */
@@ -282,12 +342,24 @@ int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node,
 	if (ret)
 		goto out_put_node;
 
-	ret = i2c_of_probe_simple_enable_regulator(dev, ctx);
+	ret = i2c_of_probe_simple_get_gpiod(dev, node, ctx);
 	if (ret)
 		goto out_put_supply;
 
+	ret = i2c_of_probe_simple_enable_regulator(dev, ctx);
+	if (ret)
+		goto out_put_gpiod;
+
+	ret = i2c_of_probe_simple_set_gpio(dev, ctx);
+	if (ret)
+		goto out_disable_regulator;
+
 	return 0;
 
+out_disable_regulator:
+	i2c_of_probe_simple_disable_regulator(dev, ctx);
+out_put_gpiod:
+	i2c_of_probe_simple_put_gpiod(ctx);
 out_put_supply:
 	i2c_of_probe_simple_put_supply(ctx);
 out_put_node:
@@ -296,17 +368,40 @@ int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node,
 }
 EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_enable, I2C_OF_PROBER);
 
+/**
+ * i2c_of_probe_simple_cleanup_early - \
+ *	Simple helper for I2C OF prober to release GPIOs before component is enabled
+ * @dev: Pointer to the &struct device of the caller; unused.
+ * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
+ *
+ * GPIO descriptors are exclusive and have to be released before the
+ * actual driver probes so that the latter can acquire them.
+ */
+void i2c_of_probe_simple_cleanup_early(struct device *dev, void *data)
+{
+	struct i2c_of_probe_simple_ctx *ctx = data;
+
+	i2c_of_probe_simple_put_gpiod(ctx);
+}
+EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_cleanup_early, I2C_OF_PROBER);
+
 /**
  * i2c_of_probe_simple_cleanup - Clean up and release resources for I2C OF prober simple helpers
  * @dev: Pointer to the &struct device of the caller, only used for dev_printk() messages
  * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
  *
+ * * If a GPIO line was found and not yet released, set its value to the opposite of that
+ *   set in i2c_of_probe_simple_enable() and release it.
  * * If a regulator supply was found, disable that regulator and release it.
  */
 void i2c_of_probe_simple_cleanup(struct device *dev, void *data)
 {
 	struct i2c_of_probe_simple_ctx *ctx = data;
 
+	/* GPIO operations here are no-ops if i2c_of_probe_simple_cleanup_early was called. */
+	i2c_of_probe_simple_disable_gpio(dev, ctx);
+	i2c_of_probe_simple_put_gpiod(ctx);
+
 	i2c_of_probe_simple_disable_regulator(dev, ctx);
 	i2c_of_probe_simple_put_supply(ctx);
 }
@@ -314,6 +409,7 @@ EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_cleanup, I2C_OF_PROBER);
 
 struct i2c_of_probe_ops i2c_of_probe_simple_ops = {
 	.enable = i2c_of_probe_simple_enable,
+	.cleanup_early = i2c_of_probe_simple_cleanup_early,
 	.cleanup = i2c_of_probe_simple_cleanup,
 };
 EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_ops, I2C_OF_PROBER);
diff --git a/include/linux/i2c-of-prober.h b/include/linux/i2c-of-prober.h
index df95aa6ad90e..bb6d47f50ee5 100644
--- a/include/linux/i2c-of-prober.h
+++ b/include/linux/i2c-of-prober.h
@@ -9,6 +9,7 @@
 #define _LINUX_I2C_OF_PROBER_H
 
 #include <linux/kconfig.h>
+#include <linux/types.h>
 
 struct device;
 struct device_node;
@@ -85,6 +86,7 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
  *
  * The following helpers are provided:
  * * i2c_of_probe_simple_enable()
+ * * i2c_of_probe_simple_cleanup_early()
  * * i2c_of_probe_simple_cleanup()
  */
 
@@ -92,14 +94,31 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
  * struct i2c_of_probe_simple_opts - Options for simple I2C component prober callbacks
  * @res_node_compatible: Compatible string of device node to retrieve resources from.
  * @supply_name: Name of regulator supply.
+ * @gpio_name: Name of GPIO. NULL if no GPIO line is used. Empty string ("") if GPIO
+ *	       line is unnamed.
  * @post_power_on_delay_ms: Delay after regulators are powered on. Passed to msleep().
+ * @post_gpio_config_delay_ms: Delay after GPIO is configured. Passed to msleep().
+ * @gpio_assert_to_enable: %true if GPIO should be asserted, i.e. set to logical high,
+ *			   to enable the component.
+ *
+ * This describes power sequences common for the class of components supported by the
+ * simple component prober:
+ * * @gpio_name is configured to the non-active setting according to @gpio_assert_to_enable.
+ * * @supply_name regulator supply is enabled.
+ * * Wait for @post_power_on_delay_ms to pass.
+ * * @gpio_name is configured to the active setting according to @gpio_assert_to_enable.
+ * * Wait for @post_gpio_config_delay_ms to pass.
  */
 struct i2c_of_probe_simple_opts {
 	const char *res_node_compatible;
 	const char *supply_name;
+	const char *gpio_name;
 	unsigned int post_power_on_delay_ms;
+	unsigned int post_gpio_config_delay_ms;
+	bool gpio_assert_to_enable;
 };
 
+struct gpio_desc;
 struct regulator;
 
 struct i2c_of_probe_simple_ctx {
@@ -107,9 +126,11 @@ struct i2c_of_probe_simple_ctx {
 	const struct i2c_of_probe_simple_opts *opts;
 	/* private: internal fields for helpers. */
 	struct regulator *supply;
+	struct gpio_desc *gpiod;
 };
 
 int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node, void *data);
+void i2c_of_probe_simple_cleanup_early(struct device *dev, void *data);
 void i2c_of_probe_simple_cleanup(struct device *dev, void *data);
 
 extern struct i2c_of_probe_ops i2c_of_probe_simple_ops;
-- 
2.47.0.199.ga7371fff76-goog


