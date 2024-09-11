Return-Path: <linux-i2c+bounces-6528-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92875974B5C
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 09:30:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50C0F28A4C9
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 07:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B5B13D8A4;
	Wed, 11 Sep 2024 07:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Tus4rg+f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B599154433
	for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 07:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726039729; cv=none; b=J4IrnnSldII2aABDr+dmVsTusZcFOv09yTv4ovP362rlVZWdlCwF6AtQr2w5WZe24i6pRKf33pSQdEB4OgWOtqOqUZCLtRahBYvt2Nw00VGe5EnIuz3Pnc1filHqR342ENIBO3nXppsbHg9DBx9NhTVPY0hRGay30sWxs0SwXj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726039729; c=relaxed/simple;
	bh=FSH8K/H/drkMAVejnP3Xi5N5diDIwjBm8OH7GEvV/sE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NmndqCt7du8duivva9WKJKMWOhQNkAT1JK7L5gByKoFNeqU+H5PWhlfoyHwvzIGy7Sn2IZRrv6v8VhtHfFGvyKJ+PmdZF4OyiamzLqoYIRMQ6aCO3qBzlC2vWYpZm+7Sq82T8soi94YboBjbyRy6CbJxOkIlrWBFvmdq6zuAGns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Tus4rg+f; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-7179069d029so4548310b3a.2
        for <linux-i2c@vger.kernel.org>; Wed, 11 Sep 2024 00:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726039727; x=1726644527; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNFQ0+k6gl1kkh3o3uKf0ZEr04CBiZ9w1gp6dXSYFKk=;
        b=Tus4rg+fWJ1kcN8htSdh6MATbUgA17hN57sxfgQSPY7EtmC6CfCbo5NZ7N3ATrxvXA
         7oWPTCWOaEvX9UKHykMMMBX/LVjKoJp0roANw0Dr83l29VgzzxtV/aoTYZ9U7c8JBoKq
         /esHsWzsROkeZwKGyLgAq7awKzw0uF03eZpgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726039727; x=1726644527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RNFQ0+k6gl1kkh3o3uKf0ZEr04CBiZ9w1gp6dXSYFKk=;
        b=OLp2d4Gdwqf+VPFxXv6dEF7MtnbaVa+LRUAvEWb9XrR3RNDEXn8VQXtKYgx19igiJW
         5Mls5rQ3sgaqQWxofrOeD57XD+vXrqL++4Xe02qBSh6dUg6GOR9wr76wu8wcCBeUZMBo
         MkAyx8vKD/GKp8Rsleo932ZkA2f/dsZyBTc3T24nKN3pNDV25zV0o1TCKAupmIY1gcLK
         8+On0830IVzzqbbtXpYq3yjtsHwcdRng1WQCslzO6E3hagcuVhNqLf83ZTI6z1fLCbgb
         GfXegjB987LgVrYXb8aVhRajhik4H0ifVKKiSz4F3KejEB/nNuWrDfgSxk3rkESCJywe
         fdrw==
X-Forwarded-Encrypted: i=1; AJvYcCUrX1+uh/671zDkYbwMXTUKlANf1en3jeHxIFl8LsrwKU6gsI2b8WFp69/44c9NIxS7n3VCMDKD5O0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxlRZVzUg8C5OHP86P+5Ut4Ql7aJ853wTVHwtBMyVqPsD3hpjEf
	7BUd+jRWwAMIVTseeA2bbK5PpAD6r2U7UKPXPS5YtnLl0weSc6inTiR5IDYNAA==
X-Google-Smtp-Source: AGHT+IFFL6/Rj4Gwyc1YxeZ/hABvvBsCQgvzC/UjAY926OKBN27PE9HKTGhU9CwzQureNFH/FVgdIQ==
X-Received: by 2002:a05:6a00:1254:b0:70e:8070:f9d0 with SMTP id d2e1a72fcca58-718d5e16641mr18401634b3a.9.1726039726903;
        Wed, 11 Sep 2024 00:28:46 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8398:fe34:eba2:f301])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71908fe4e7esm2399415b3a.80.2024.09.11.00.28.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 00:28:46 -0700 (PDT)
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
Subject: [PATCH v7 08/10] i2c: of-prober: Add GPIO support to simple helpers
Date: Wed, 11 Sep 2024 15:27:46 +0800
Message-ID: <20240911072751.365361-9-wenst@chromium.org>
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
 drivers/i2c/i2c-core-of-prober.c | 95 +++++++++++++++++++++++++++++++-
 include/linux/i2c-of-prober.h    | 10 ++++
 2 files changed, 104 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 1371ea565556..6794ec749882 100644
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
 
@@ -257,6 +257,64 @@ static void i2c_of_probe_simple_disable_regulator(struct device *dev, struct i2c
 	regulator_disable(ctx->supply);
 }
 
+static int i2c_of_probe_simple_get_gpiod(struct device *dev, struct device_node *node,
+					 struct i2c_of_probe_simple_ctx *ctx)
+{
+	struct fwnode_handle *fwnode = of_fwnode_handle(node);
+	struct gpio_desc *gpiod;
+	const char *con_id = NULL;
+
+	/* NULL signals no GPIO needed */
+	if (!ctx->opts->gpio_name)
+		return 0;
+
+	/* An empty string signals an unnamed GPIO */
+	if (strlen(ctx->opts->gpio_name))
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
+	dev_dbg(dev, "Setting GPIO\n");
+
+	ret = gpiod_direction_output_raw(ctx->gpiod, ctx->opts->gpio_high_to_enable ? 1 : 0);
+	if (ret)
+		return ret;
+
+	msleep(ctx->opts->post_reset_deassert_delay_ms);
+
+	return 0;
+}
+
+static void i2c_of_probe_simple_disable_gpio(struct device *dev, struct i2c_of_probe_simple_ctx *ctx)
+{
+	if (!ctx->gpiod)
+		return;
+
+	dev_dbg(dev, "Setting GPIO to input\n");
+
+	gpiod_direction_input(ctx->gpiod);
+}
+
 /**
  * i2c_of_probe_simple_get_res - Simple helper for I2C OF prober to get resources
  * @dev: Pointer to the &struct device of the caller, only used for dev_printk() messages
@@ -264,6 +322,8 @@ static void i2c_of_probe_simple_disable_regulator(struct device *dev, struct i2c
  * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
  *
  * If &i2c_of_probe_simple_opts->supply_name is given, request the named regulator supply.
+ * If &i2c_of_probe_simple_opts->gpio_name is given, request the named GPIO. Or if it is
+ * the empty string, request the unnamed GPIO.
  *
  * Return: %0 on success or no-op, or a negative error number on failure.
  */
@@ -292,14 +352,36 @@ int i2c_of_probe_simple_get_res(struct device *dev, struct device_node *bus_node
 	if (ret)
 		goto out_put_node;
 
+	ret = i2c_of_probe_simple_get_gpiod(dev, node, ctx);
+	if (ret)
+		goto out_put_supply;
+
 	return 0;
 
+out_put_supply:
+	i2c_of_probe_simple_put_supply(ctx);
 out_put_node:
 	of_node_put(node);
 	return ret;
 }
 EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_get_res, I2C_OF_PROBER);
 
+/**
+ * i2c_of_probe_simple_free_res_early - \
+ *	Simple helper for I2C OF prober to release GPIOs before component is enabled
+ * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
+ *
+ * GPIO descriptors are exclusive and have to be released before the
+ * actual driver probes so that the latter can acquire them.
+ */
+void i2c_of_probe_simple_free_res_early(void *data)
+{
+	struct i2c_of_probe_simple_ctx *ctx = data;
+
+	i2c_of_probe_simple_put_gpiod(ctx);
+}
+EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_free_res_early, I2C_OF_PROBER);
+
 /**
  * i2c_of_probe_simple_free_res_late - Simple helper for I2C OF prober to release all resources.
  * @data: Pointer to &struct i2c_of_probe_simple_ctx helper context.
@@ -308,6 +390,7 @@ void i2c_of_probe_simple_free_res_late(void *data)
 {
 	struct i2c_of_probe_simple_ctx *ctx = data;
 
+	i2c_of_probe_simple_put_gpiod(ctx);
 	i2c_of_probe_simple_put_supply(ctx);
 }
 EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_free_res_late, I2C_OF_PROBER);
@@ -330,7 +413,15 @@ int i2c_of_probe_simple_enable(struct device *dev, void *data)
 	if (ret)
 		return ret;
 
+	ret = i2c_of_probe_simple_set_gpio(dev, ctx);
+	if (ret)
+		goto err;
+
 	return 0;
+
+err:
+	i2c_of_probe_simple_disable_regulator(dev, ctx);
+	return ret;
 }
 EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_enable, I2C_OF_PROBER);
 
@@ -347,6 +438,7 @@ int i2c_of_probe_simple_cleanup(struct device *dev, void *data)
 {
 	struct i2c_of_probe_simple_ctx *ctx = data;
 
+	i2c_of_probe_simple_disable_gpio(dev, ctx);
 	i2c_of_probe_simple_disable_regulator(dev, ctx);
 
 	return 0;
@@ -355,6 +447,7 @@ EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_cleanup, I2C_OF_PROBER);
 
 struct i2c_of_probe_ops i2c_of_probe_simple_ops = {
 	.get_resources = i2c_of_probe_simple_get_res,
+	.free_resources_early = i2c_of_probe_simple_free_res_early,
 	.enable = i2c_of_probe_simple_enable,
 	.cleanup = i2c_of_probe_simple_cleanup,
 	.free_resources_late = i2c_of_probe_simple_free_res_late,
diff --git a/include/linux/i2c-of-prober.h b/include/linux/i2c-of-prober.h
index 541451fbf58d..c5e241163c94 100644
--- a/include/linux/i2c-of-prober.h
+++ b/include/linux/i2c-of-prober.h
@@ -83,6 +83,7 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
  *
  * The following helpers are provided:
  * * i2c_of_probe_simple_get_res()
+ * * i2c_of_probe_simple_free_res_early()
  * * i2c_of_probe_simple_free_res_late()
  * * i2c_of_probe_simple_enable()
  * * i2c_of_probe_simple_cleanup()
@@ -92,24 +93,33 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
  * struct i2c_of_probe_simple_opts - Options for simple I2C component prober callbacks
  * @res_node_compatible: Compatible string of device node to retrieve resources from.
  * @supply_name: Name of regulator supply.
+ * @gpio_name: Name of GPIO.
  * @post_power_on_delay_ms: Delay in ms after regulators are powered on. Passed to msleep().
+ * @post_reset_deassert_delay_ms: Delay in ms after GPIOs are set. Passed to msleep().
+ * @gpio_high_to_enable: %true if GPIO should be set to electrical high to enable component.
  */
 struct i2c_of_probe_simple_opts {
 	const char *res_node_compatible;
 	const char *supply_name;
+	const char *gpio_name;
 	unsigned int post_power_on_delay_ms;
+	unsigned int post_reset_deassert_delay_ms;
+	bool gpio_high_to_enable;
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
 
 int i2c_of_probe_simple_get_res(struct device *dev, struct device_node *bus_node, void *data);
+void i2c_of_probe_simple_free_res_early(void *data);
 void i2c_of_probe_simple_free_res_late(void *data);
 int i2c_of_probe_simple_enable(struct device *dev, void *data);
 int i2c_of_probe_simple_cleanup(struct device *dev, void *data);
-- 
2.46.0.598.g6f2099f65c-goog


