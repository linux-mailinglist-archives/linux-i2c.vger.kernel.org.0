Return-Path: <linux-i2c+bounces-7454-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E31B79A1EB2
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 11:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3A6E1C2121D
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Oct 2024 09:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5C0A1DB365;
	Thu, 17 Oct 2024 09:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="J9wCTjnd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79ED1DACAA
	for <linux-i2c@vger.kernel.org>; Thu, 17 Oct 2024 09:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729158171; cv=none; b=r64a4N7zoox4Gll928zOCxNDdNrMDgnN+TsUyFP+hdM8cMYOvdweb4aeE3ZRY/YASuIHeRNtA4oNAlNTUhWZUgsldQe9ZLA0BZH7SJiwc0gOcBsX4t7zkVXvgGea2dyMt6bVyZVQ+SAy9FnkK8DzLm4e9SCU/y48QKH2pHooSL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729158171; c=relaxed/simple;
	bh=ZngF/RnB5xaSJQKpJf40HeUu1rpjBfWjmheg4Z30r9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZD0yAcItMBK/hLHnsDQTOCOJU2MzmHPLJQ18lJEFNkFVpRtHM1H+kvMYKS0mtvBIzxeVnFMjqOqJTAwKIkI070Wm4Ap5a9cL/G+uqcF0Y0eaQIViBGTNyMOLdEi8nubdfZh2Vtmnh0331Wv+Ji7BnOPNO86gIo4NMh6QWumo3xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=J9wCTjnd; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20ca388d242so5407015ad.2
        for <linux-i2c@vger.kernel.org>; Thu, 17 Oct 2024 02:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729158168; x=1729762968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uDJc9f3S4QUsZMtOGZJAoFdk3ut5Kt0+ocLiD6N8xAs=;
        b=J9wCTjndxm7/TXxou2EnzYcFH60pZUTdJVUJyzVhc6bcsWhjiZ7Dnm5PpXhOMMfXWL
         c8FmLZf4W+YYWmdldQAi6dOpIc13ExYxrzWGDWyJwLzhP8JZZYFGfaTef+6yQhe0R7QE
         gxb6Ob8bifswSCIEKMxB82qxGu5q4PuOJjVw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729158168; x=1729762968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uDJc9f3S4QUsZMtOGZJAoFdk3ut5Kt0+ocLiD6N8xAs=;
        b=jaleVzCcEMfN2QPydQDXdMTMu5Jwuwaea3MD0Y6GVQTCpaCrT5ZnRDzs1F1tS4f2QG
         Xu3Jp/8/PQHZKkRs2ZTHr1vk0wYhJHmWj2RUBwBtKuctzSZdkeW3/EqsZoSCJwmdmbF3
         GzV0hIA+113r52ImIjrq18C63uZHPDn1pvyBNVb5h2UXH3jYEkPYdE6xpxOVNT7h72WD
         Bw5zikmAOMyTRz5OhcjH7VDhO8buLDcTY/hALbm+oboyoQQUQHQ+f6wYx4bDXZA5ANAP
         IcCyYP1XZxul4aHSs+f1Un3aih6JqndpWFT+X175ps+oLZxUAgBaRpYBIj/cNZDxrwoR
         Roog==
X-Forwarded-Encrypted: i=1; AJvYcCW7fiTgFQwyQG+L3zl5OekMtIi+varXo6c/wfFmkqJoUiWiBNlWdmBgeGhR4SHa7CVZzyAlD4b6E4E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhPQgmS97LYyA9R0VHwZTFXPy71gMRq5snolMPiMucw+dT+QyX
	YSQy/umXXZkdR4F28D7C2XR03C31oFFOkG3YXwMw/kBtGN/KtPg4ODGihR81Pg==
X-Google-Smtp-Source: AGHT+IEoN1f9LBBrl0kUpeB+a72f9fdz0mPA3zN0+XigVdiVhLovNJ2YH+JMCWuvBfsM9IvwfU1sKg==
X-Received: by 2002:a17:902:e80d:b0:20c:7d7d:7ba8 with SMTP id d9443c01a7336-20cbb22f1e8mr261638925ad.46.1729158168157;
        Thu, 17 Oct 2024 02:42:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:fabb:a7ab:3d7:9aaa])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d17f87ccasm40638655ad.62.2024.10.17.02.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 02:42:47 -0700 (PDT)
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
Subject: [PATCH v9 5/7] i2c: of-prober: Add GPIO support to simple helpers
Date: Thu, 17 Oct 2024 17:34:40 +0800
Message-ID: <20241017094222.1014936-6-wenst@chromium.org>
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
---
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
 include/linux/i2c-of-prober.h    |  20 +++++++
 2 files changed, 118 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index f5982b047240..1d6aeb549c14 100644
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
 
@@ -245,6 +245,62 @@ static void i2c_of_probe_simple_disable_regulator(struct device *dev, struct i2c
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
@@ -252,7 +308,11 @@ static void i2c_of_probe_simple_disable_regulator(struct device *dev, struct i2c
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
@@ -281,12 +341,24 @@ int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node,
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
@@ -295,17 +367,40 @@ int i2c_of_probe_simple_enable(struct device *dev, struct device_node *bus_node,
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
@@ -313,6 +408,7 @@ EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_cleanup, I2C_OF_PROBER);
 
 struct i2c_of_probe_ops i2c_of_probe_simple_ops = {
 	.enable = i2c_of_probe_simple_enable,
+	.cleanup_early = i2c_of_probe_simple_cleanup_early,
 	.cleanup = i2c_of_probe_simple_cleanup,
 };
 EXPORT_SYMBOL_NS_GPL(i2c_of_probe_simple_ops, I2C_OF_PROBER);
diff --git a/include/linux/i2c-of-prober.h b/include/linux/i2c-of-prober.h
index df95aa6ad90e..a232f3cbb252 100644
--- a/include/linux/i2c-of-prober.h
+++ b/include/linux/i2c-of-prober.h
@@ -85,6 +85,7 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
  *
  * The following helpers are provided:
  * * i2c_of_probe_simple_enable()
+ * * i2c_of_probe_simple_cleanup_early()
  * * i2c_of_probe_simple_cleanup()
  */
 
@@ -92,14 +93,31 @@ int i2c_of_probe_component(struct device *dev, const struct i2c_of_probe_cfg *cf
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
@@ -107,9 +125,11 @@ struct i2c_of_probe_simple_ctx {
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
2.47.0.rc1.288.g06298d1525-goog


