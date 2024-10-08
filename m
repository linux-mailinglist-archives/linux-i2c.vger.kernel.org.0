Return-Path: <linux-i2c+bounces-7256-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 353479940F2
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 10:17:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AA661C24D98
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Oct 2024 08:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B8681DED6E;
	Tue,  8 Oct 2024 07:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KLzbxAG+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771D51D07B0
	for <linux-i2c@vger.kernel.org>; Tue,  8 Oct 2024 07:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728372918; cv=none; b=QNg2AMqh0719YrpfBaW4/BAMfTWbaCjUwheSplnAL8ePoSVgyZNUcchlUhgOSk8oGQ9Wo0xlliHqEHFhEVsgKin4af3oLtIv9EiXNAAmrM2l/66aisdZSIjcwS+hP590ACrlxtp5+kG5Pj1kN6ncXZC4EjNKYd+D5azw96RUNcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728372918; c=relaxed/simple;
	bh=fUn2SgfURNS6STkbxqmdAqk46PGaFW4PpOWM7Pch5SE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yhp44ITXGRyUdIJrgH13T5lFq3/AuqMP9MfrGpQSdbNRYsLC8Z1s28L6oCD02giUgfiYnx8QQS24hBV8NZ1V5hRQfpt6oYrKeopqkILBVDEg1U6wBYn8s6/yluigwXjerhHDjfeMVj1ZokT2caMJgzciZ26KuPggekIpaVCboiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KLzbxAG+; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-20c56b816faso3259325ad.2
        for <linux-i2c@vger.kernel.org>; Tue, 08 Oct 2024 00:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728372916; x=1728977716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UEuFmft0e4Wtysiszb/Zk0AJE044n2Mq/KZtCEKLxt0=;
        b=KLzbxAG+RMJAbqP0YY7hzc5r4Wonqj0QGVv80q698NnD5QsmgBsm675al0T8MD5nzX
         YiY7kbZaPiyba4ipf9s4qpXKnd/FrZTwtMmyJkVStaPDeeLmms+1e9vBxS6QNa4lBrN8
         bC68pwCnk9gP5EwE0+VEGazBCZ4DCu0c4ZwLE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728372916; x=1728977716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UEuFmft0e4Wtysiszb/Zk0AJE044n2Mq/KZtCEKLxt0=;
        b=oGBlmPThs2QqyQoCjpD75e/ObfSx7qQbBiaMwmJBxNb3AUZaBlds9Je1HMTAtjF/bN
         B8EvhINE8JN/EOtU9wsBWz7zilKEwXpXZjApCAjZuhLOXTf4tgw61K7LlbT7jrPaMmDU
         nCHoo6sqFPdBA5Jc6YGRM0RABjMqxsiebML4VpjgN75Z3/lj+OT18Y2ifiraCLw0M7zC
         HySa2WhoukykFhzgN5Gv9r3jyGeZZqRk+r3/ZMBUDe3dxH8t6cU2Q7O4DD2DO4QPXyJ8
         w29DyxDryytnwzzr16kxiaWAdUb2M6GLfNmTumbsgevGANhMvwHrwBaGUFUCA9OX4eOZ
         k1+g==
X-Forwarded-Encrypted: i=1; AJvYcCV0FbG+iyVPOF1PC8gXJ1xfJMaQudS2OcTgGZN6n7Pf6BYhmRnqD7rqKaGQ/b8UOv3y2cQLn/wU9wA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHRM7oeRWfflQR3tcJ0s4w5LelAYpAg0s7xgFtF6scYgLx9j0m
	hmZXdMPaisQVnQaufKSJwsig4aoDBeRn3o6ZoLTcWf8Lya0A1r3AdJiwNQeGDQ==
X-Google-Smtp-Source: AGHT+IECQ3UIOFmM6QFAAt+c+JKTumdKBApCAqjlUY/FX90R8bDHdQEoCXoGGNBag9iDS4FdnUJ2eg==
X-Received: by 2002:a17:902:ea11:b0:20b:7a31:4522 with SMTP id d9443c01a7336-20bff04a762mr220421285ad.42.1728372915880;
        Tue, 08 Oct 2024 00:35:15 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:10df:d27e:8d4b:6740])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13939bd7sm50121175ad.120.2024.10.08.00.35.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 00:35:15 -0700 (PDT)
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
Subject: [PATCH v8 6/8] i2c: of-prober: Add GPIO support to simple helpers
Date: Tue,  8 Oct 2024 15:34:25 +0800
Message-ID: <20241008073430.3992087-7-wenst@chromium.org>
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

---
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
 drivers/i2c/i2c-core-of-prober.c | 104 ++++++++++++++++++++++++++++++-
 include/linux/i2c-of-prober.h    |  20 ++++++
 2 files changed, 122 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index d7f51ff872b8..b84e88624b63 100644
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
@@ -30,7 +31,6 @@
  * address responds.
  *
  * TODO:
- * - Support handling common GPIOs.
  * - Support I2C muxes
  */
 
@@ -239,6 +239,66 @@ static void i2c_of_probe_simple_disable_regulator(struct device *dev, struct i2c
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
+	if (!ctx->gpiod)
+		return;
+
+	/* Ignore error if GPIO is not in output direction */
+	gpiod_set_value(ctx->gpiod, !ctx->opts->gpio_assert_to_enable);
+}
+
 /**
  * i2c_of_probe_simple_enable - Simple helper for I2C OF prober to get and enable resources
  * @dev: Pointer to the &struct device of the caller, only used for dev_printk() messages
@@ -246,7 +306,11 @@ static void i2c_of_probe_simple_disable_regulator(struct device *dev, struct i2c
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
@@ -275,12 +339,24 @@ int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node,
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
@@ -289,17 +365,40 @@ int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node,
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
 
+	/* GPIO operations here are no-ops if a component was found and enabled. */
+	i2c_of_probe_simple_disable_gpio(dev, ctx);
+	i2c_of_probe_simple_put_gpiod(ctx);
+
 	i2c_of_probe_simple_disable_regulator(dev, ctx);
 	i2c_of_probe_simple_put_supply(ctx);
 }
@@ -307,6 +406,7 @@ EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_cleanup, I2C_OF_PROBER);
 
 struct i2c_of_probe_ops i2c_of_probe_simple_ops = {
 	.enable = i2c_of_probe_simple_enable,
+	.cleanup_early = i2c_of_probe_simple_cleanup_early,
 	.cleanup = i2c_of_probe_simple_cleanup,
 };
 EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_ops, I2C_OF_PROBER);
diff --git a/include/linux/i2c-of-prober.h b/include/linux/i2c-of-prober.h
index c4938a34b901..513ab37b72a5 100644
--- a/include/linux/i2c-of-prober.h
+++ b/include/linux/i2c-of-prober.h
@@ -80,6 +80,7 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
  *
  * The following helpers are provided:
  * * i2c_of_probe_simple_enable()
+ * * i2c_of_probe_simple_cleanup_early()
  * * i2c_of_probe_simple_cleanup()
  */
 
@@ -87,24 +88,43 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
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
 
 struct regulator;
+struct gpio_desc;
 
 struct i2c_of_probe_simple_ctx {
 	/* public: provided by user before helpers are used. */
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
2.47.0.rc0.187.ge670bccf7e-goog


