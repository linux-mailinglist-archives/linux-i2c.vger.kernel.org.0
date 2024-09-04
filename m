Return-Path: <linux-i2c+bounces-6132-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C8D96B5DC
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 11:03:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DCE8D1F256D4
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 09:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4881F1D0144;
	Wed,  4 Sep 2024 09:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LeEDUwzC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C44B1D0145
	for <linux-i2c@vger.kernel.org>; Wed,  4 Sep 2024 09:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725440462; cv=none; b=o4C7j9vFdxRh7jkz2WzpK5nL8sODz161Lfc4XsQ/cBGD87WaslkuYcq3IInFXD6cJlhVnCT1sA7nNznt1RrES8Twk2RNZmJIBztLx0trolS0CnlhNqf8lQSR4E1+7hNGG9oxiPQ+ZvQcTv7/rEbn/P2+rqrUkS1zKc2MAMXPRzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725440462; c=relaxed/simple;
	bh=4K305JIRgo5Lt75f2UfKKVi9Egt/vEF85rIFriq9DXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sMkYqCm7fh+99feMiR6+QP6ijfNZtJIvsbkG6Jf2WLPa9x5pDg5/XNMZVG5d2vLEh1zarN4SQv8MgoJX/077EGcy+osGhCNDnqQp4/YarLKFouuMT6MlcD82TcFNYfSIN+177cJ9kSnaiFLByYxsmA4qJIWGV++8fS2YyoJbo74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LeEDUwzC; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7143165f23fso5032531b3a.1
        for <linux-i2c@vger.kernel.org>; Wed, 04 Sep 2024 02:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725440459; x=1726045259; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DwAJluv0Exq9EadYfBSyNeJ8D4Ka/sU/iYmJbm5J4eo=;
        b=LeEDUwzCaIOKV3GR1pJDR0BbLlVGzv7YEmM20hEe87dm7fwZitVx8VO56BZiS8gXEq
         dYeNRAvK33FGpvS/8ev3GUC/ShayTJJVhqggfnZOVGlmQiHLYpCMC+T3j8+Y1TQxGN2A
         vou+TtuI0Ru7HKUV+LaWXlWC3czAMQ8f5umBU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725440459; x=1726045259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DwAJluv0Exq9EadYfBSyNeJ8D4Ka/sU/iYmJbm5J4eo=;
        b=kl8Qs99luaTJn4cfXynUYBvyrc9fh188lhkSfUolqT6dR/zLT3pe0WntNz/oNBayTf
         45MtxTC9aNtZyVykrunjV+tXpzvGABSVb+p2ci0kDcE9h7jG0WqLptFirRAeUUTFVvqN
         WOXqU+p3dRqb43XPlW5xvp/99316CNZrOcejDRqwH+40a/YqZ+u0JJjV06WLr+zdzIn7
         NSCDy/T2fPPTwQP23cT9ieknTQLzrB8qDfVYMklUWH429MONFk5TbwHcD/+ekk1aYS9d
         KNrvlS+orTCJLfH2U6W89/mXUcyY6z85NJoaP4g7gcHPrvQ9hZUcpzg3j0Vda1vsCFyV
         CmNA==
X-Forwarded-Encrypted: i=1; AJvYcCWLAUFurUPY1tkGY+EPn7WXP6MwFyT8kHE6PoC7MoZmM6IzV1NhPhUxNLwRuvee4qb69y4UC/JyPys=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz69T37MTXqINFO8RIRORNYJqNb2N0lyFAYK226v/xIstssxFOM
	QJQnw7YlMSMFGBhrQSS8LXTfmaFpw6PNcskc3PZTSdxBvzBp8Aqpz/O7rXwahg==
X-Google-Smtp-Source: AGHT+IFFqCnmeBWZ9aXSqOpUywkoxinPfwTNU43tOQwWBlrfj1Rm3kLKZ4eIZFoE+WAsIUVUCM7mHQ==
X-Received: by 2002:a05:6a21:1813:b0:1cd:f065:4ef7 with SMTP id adf61e73a8af0-1ced0469052mr12363435637.19.1725440459454;
        Wed, 04 Sep 2024 02:00:59 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:83fc:5c8e:13bd:d165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-717785b5183sm1153279b3a.197.2024.09.04.02.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 02:00:59 -0700 (PDT)
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
Subject: [PATCH v6 10/12] i2c: of-prober: Add GPIO support
Date: Wed,  4 Sep 2024 17:00:12 +0800
Message-ID: <20240904090016.2841572-11-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
In-Reply-To: <20240904090016.2841572-1-wenst@chromium.org>
References: <20240904090016.2841572-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds GPIO management to the I2C OF component prober.
Components that the prober intends to probe likely require their
regulator supplies be enabled, and GPIOs be toggled to enable them or
bring them out of reset before they will respond to probe attempts.
regulator support was added in the previous patch.

Without specific knowledge of each component's resource names or
power sequencing requirements, the prober can only enable the
regulator supplies all at once, and toggle the GPIOs all at once.
Luckily, reset pins tend to be active low, while enable pins tend to
be active high, so setting the raw status of all GPIO pins to high
should work. The wait time before and after resources are enabled
are collected from existing drivers and device trees.

The prober collects resources from all possible components and enables
them together, instead of enabling resources and probing each component
one by one. The latter approach does not provide any boot time benefits
over simply enabling each component and letting each driver probe
sequentially.

The prober will also deduplicate the resources, since on a component
swap out or co-layout design, the resources are always the same.
While duplicate regulator supplies won't cause much issue, shared
GPIOs don't work reliably, especially with other drivers. For the
same reason, the prober will release the GPIOs before the successfully
probed component is actually enabled.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

---
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
 drivers/i2c/i2c-core-of-prober.c | 143 ++++++++++++++++++++++++++++++-
 include/linux/i2c.h              |   2 +
 2 files changed, 144 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 56b06ad7aa64..04242ff86e69 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -5,16 +5,19 @@
  * Copyright (C) 2024 Google LLC
  */
 
+#include <linux/bitmap.h>
 #include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/err.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
+#include <linux/types.h>
 
 /*
  * Some devices, such as Google Hana Chromebooks, are produced by multiple
@@ -29,12 +32,14 @@
  * address responds.
  *
  * TODO:
- * - Support handling common GPIOs.
+ * - Support inverted polarity GPIOs, such as electrical high to "disable".
+ *   Seen on some OmniVision camera sensors.
  * - Support I2C muxes
  */
 
 struct i2c_of_probe_data {
 	const struct i2c_of_probe_opts *opts;
+	struct gpio_descs *gpiods;
 	struct regulator_bulk_data *regulators;
 	unsigned int regulators_num;
 };
@@ -85,10 +90,90 @@ static void i2c_of_probe_free_regulators(struct i2c_of_probe_data *data)
 	regulator_bulk_free(data->regulators_num, data->regulators);
 	data->regulators_num = 0;
 	data->regulators = NULL;
+};
+
+/*
+ * Returns 1 if property is GPIO and GPIO successfully requested,
+ * 0 if not a GPIO property, or error if request for GPIO failed.
+ */
+static int i2c_of_probe_get_gpiod(struct device_node *node, struct property *prop,
+				  struct i2c_of_probe_data *data)
+{
+	struct fwnode_handle *fwnode = of_fwnode_handle(node);
+	struct gpio_descs *gpiods;
+	struct gpio_desc *gpiod;
+	char propname[32]; /* 32 is max size of property name */
+	char *con_id = NULL;
+	size_t new_size;
+	int len, ret;
+
+	len = gpio_get_property_name_length(prop->name);
+	if (len < 0)
+		return 0;
+
+	ret = strscpy(propname, prop->name);
+	if (ret < 0) {
+		pr_err("%pOF: length of GPIO name \"%s\" exceeds current limit\n",
+		       node, prop->name);
+		return -EINVAL;
+	}
+
+	if (len > 0) {
+		/* "len < ARRAY_SIZE(propname)" guaranteed by strscpy() above */
+		propname[len] = '\0';
+		con_id = propname;
+	}
+
+	/*
+	 * GPIO descriptors are not reference counted. GPIOD_FLAGS_BIT_NONEXCLUSIVE
+	 * can't differentiate between GPIOs shared between devices to be probed and
+	 * other devices (which is incorrect). If the initial request fails with
+	 * -EBUSY, retry with GPIOD_FLAGS_BIT_NONEXCLUSIVE and see if it matches
+	 * any existing ones.
+	 */
+	gpiod = fwnode_gpiod_get_index(fwnode, con_id, 0, GPIOD_ASIS, "i2c-of-prober");
+	if (IS_ERR(gpiod)) {
+		if (PTR_ERR(gpiod) != -EBUSY || !data->gpiods)
+			return PTR_ERR(gpiod);
+
+		gpiod = fwnode_gpiod_get_index(fwnode, con_id, 0,
+					       GPIOD_ASIS | GPIOD_FLAGS_BIT_NONEXCLUSIVE,
+					       "i2c-of-prober");
+		for (unsigned int i = 0; i < data->gpiods->ndescs; i++)
+			if (gpiod == data->gpiods->desc[i])
+				return 1;
+
+		return -EBUSY;
+	}
+
+	new_size = struct_size(gpiods, desc, data->gpiods ? data->gpiods->ndescs + 1 : 1);
+	gpiods = krealloc(data->gpiods, new_size, GFP_KERNEL);
+	if (!gpiods) {
+		gpiod_put(gpiod);
+		return -ENOMEM;
+	}
+
+	data->gpiods = gpiods;
+	data->gpiods->desc[data->gpiods->ndescs++] = gpiod;
+
+	return 1;
+}
+
+/*
+ * This is split into two functions because in the normal flow the GPIOs
+ * have to be released before the actual driver probes so that the latter
+ * can acquire them.
+ */
+static void i2c_of_probe_free_gpios(struct i2c_of_probe_data *data)
+{
+	if (data->gpiods)
+		gpiod_put_array(data->gpiods);
+	data->gpiods = NULL;
 }
 
 static void i2c_of_probe_free_res(struct i2c_of_probe_data *data)
 {
+	i2c_of_probe_free_gpios(data);
 	i2c_of_probe_free_regulators(data);
 }
 
@@ -104,6 +189,18 @@ static int i2c_of_probe_get_res(struct device *dev, struct device_node *node,
 		goto err_cleanup;
 	}
 
+	for_each_property_of_node(node, prop) {
+		dev_dbg(dev, "Trying property %pOF/%s\n", node, prop->name);
+
+		/* GPIOs */
+		ret = i2c_of_probe_get_gpiod(node, prop, data);
+		if (ret < 0) {
+			dev_err_probe(dev, ret, "Failed to get GPIO from %pOF/%s\n",
+				      node, prop->name);
+			goto err_cleanup;
+		}
+	}
+
 	return 0;
 
 err_cleanup:
@@ -131,6 +228,37 @@ static void i2c_of_probe_disable_regulators(struct i2c_of_probe_data *data)
 	regulator_bulk_disable(data->regulators_num, data->regulators);
 }
 
+static int i2c_of_probe_set_gpios(struct device *dev, struct i2c_of_probe_data *data)
+{
+	int ret;
+	int gpio_i;
+
+	if (!data->gpiods)
+		return 0;
+
+	for (gpio_i = 0; gpio_i < data->gpiods->ndescs; gpio_i++) {
+		/*
+		 * "reset" GPIOs normally have opposite polarity compared to
+		 * "enable" GPIOs. Instead of parsing the flags again, simply
+		 * set the raw value to high.
+		 */
+		dev_dbg(dev, "Setting GPIO %d\n", gpio_i);
+		ret = gpiod_direction_output_raw(data->gpiods->desc[gpio_i], 1);
+		if (ret)
+			goto disable_gpios;
+	}
+
+	msleep(data->opts->post_reset_deassert_delay_ms);
+
+	return 0;
+
+disable_gpios:
+	for (gpio_i--; gpio_i >= 0; gpio_i--)
+		gpiod_set_raw_value_cansleep(data->gpiods->desc[gpio_i], 0);
+
+	return ret;
+}
+
 static int i2c_of_probe_enable_res(struct device *dev, struct i2c_of_probe_data *data)
 {
 	int ret;
@@ -139,7 +267,15 @@ static int i2c_of_probe_enable_res(struct device *dev, struct i2c_of_probe_data
 	if (ret)
 		return ret;
 
+	ret = i2c_of_probe_set_gpios(dev, data);
+	if (ret)
+		goto err_disable_regulators;
+
 	return 0;
+
+err_disable_regulators:
+	i2c_of_probe_disable_regulators(data);
+	return ret;
 }
 
 static struct device_node *i2c_of_probe_get_i2c_node(struct device *dev, const char *type)
@@ -191,6 +327,8 @@ static int i2c_of_probe_enable_node(struct device *dev, struct device_node *node
 static const struct i2c_of_probe_opts i2c_of_probe_opts_default = {
 	/* largest post-power-on pre-reset-deassert delay seen among drivers */
 	.post_power_on_delay_ms = 500,
+	/* largest post-reset-deassert delay seen in tree for Elan I2C HID */
+	.post_reset_deassert_delay_ms = 300,
 };
 
 /**
@@ -264,6 +402,8 @@ int i2c_of_probe_component(struct device *dev, const char *type, const struct i2
 	}
 
 	dev_dbg(dev, "Resources: # of regulator supplies = %d\n", probe_data.regulators_num);
+	dev_dbg(dev, "Resources: # of GPIOs = %d\n",
+		probe_data.gpiods ? probe_data.gpiods->ndescs : 0);
 
 	/* Enable resources */
 	ret = i2c_of_probe_enable_res(dev, &probe_data);
@@ -283,6 +423,7 @@ int i2c_of_probe_component(struct device *dev, const char *type, const struct i2
 			continue;
 
 		/* Found a device that is responding */
+		i2c_of_probe_free_gpios(&probe_data);
 		ret = i2c_of_probe_enable_node(dev, node);
 		break;
 	}
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index dbcdb8edbf6f..0da1edddb5a2 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -1037,9 +1037,11 @@ int of_i2c_get_board_info(struct device *dev, struct device_node *node,
 /**
  * i2c_of_probe_opts - I2C OF component prober customization options
  * @post_power_on_delay_us: Delay in ms after regulators are powered on. Passed to msleep().
+ * @post_reset_deassert_delay_ms: Delay in ms after GPIOs are set. Passed to msleep().
  */
 struct i2c_of_probe_opts {
 	unsigned int post_power_on_delay_ms;
+	unsigned int post_reset_deassert_delay_ms;
 };
 
 int i2c_of_probe_component(struct device *dev, const char *type, const struct i2c_of_probe_opts *opts);
-- 
2.46.0.469.g59c65b2a67-goog


