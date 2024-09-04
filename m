Return-Path: <linux-i2c+bounces-6131-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F2396B5DA
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 11:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B06B328507C
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 09:03:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC1231CFEDA;
	Wed,  4 Sep 2024 09:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WWuohgNy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64361CFEC8
	for <linux-i2c@vger.kernel.org>; Wed,  4 Sep 2024 09:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725440458; cv=none; b=drlj5pGSLgPZ4zoJO0Xoj69pYrqq83G1ex5xA9j5xv7XU7Wo6WoBquG8C7/u3slep5h8Se22S1gPy5FMJUxrnG5J7Andg5DP5R/P932H8TxJmgzFFh8aCQdyx8IbUPTWQIXqRYnHOqDIYptnS1UOJo//sB9PwZ3twgzQf8HxJLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725440458; c=relaxed/simple;
	bh=pOfy9XWKQq0nmA1HbtWe5CEuIz1tqY910FIQLNZc0MM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pqdy4vqlAwvpryvNMVFHwJil7CgY6Xc4BNaQuHgfAf6plIghTGmjkvuaZIbXiWOM/0b+pXEA5xS17i6pINHy888aJeI358ywa+Xrx/14oyL1dmToIWCPcDFOPKpAQkX5/AEhaey98/YYwKz8wHhvvOh1gnxKJMcndY7HFvhZVjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WWuohgNy; arc=none smtp.client-ip=209.85.160.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-26fde6117cfso315568fac.1
        for <linux-i2c@vger.kernel.org>; Wed, 04 Sep 2024 02:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725440456; x=1726045256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLn/XE+uDzMxmMKZJAijY6Hl5jp5DWcTMHCPptQeycc=;
        b=WWuohgNyjLMxTNHIAPUYZ9NrjLHnBMp1UGw4+nYVDsQBWMziHP+mDhmYQVuWz4dj1x
         q5g+GBef3cL9IPqblr4tO2bNxaGn7YO37i1mGs57SVTe6Kv9999/zVEEqofmTg8tO7O4
         3nk2xUsbOq15voTsmNqL1y2rtu6Hh2RuyriWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725440456; x=1726045256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qLn/XE+uDzMxmMKZJAijY6Hl5jp5DWcTMHCPptQeycc=;
        b=e/v5DenuzgX70xN8t4au36fP2hHbXBuywCbcprAmAaIMxgLn+XxC2SmUsKUU6ZMzwT
         406Wo6HeG9hIdxO9EJNXvTHUTYDAFJ1/0ieCroEIj3dl7zcvV8TbDK1StTCARxq7YxRq
         1Bf1qDAcWblevTlJ80nJ2NqNdyBJqRS8GF9XQDS5CA2AQSTEc7KzPq0tiTlWKzgMo+8D
         zUfcD2IvK5g7OG9mhiv7t4pIHN7JEWpEHoJrjUnR5D1sX1XwSTNtgx71YRa3lhW+eYhq
         vSUVbYB9rGNUhqUDD20YyRmEYH+LefwJXdl6uETgqRawssQw5qa7nCFIz97GMXCrE3XC
         bQ2w==
X-Forwarded-Encrypted: i=1; AJvYcCVImCsRTLPHvEcGevKsg1+IWxuQyhw3+94ijNi3uQMuTB2gvb7+GuuTaXdFE5SbB7jm4MePA3ZYTjw=@vger.kernel.org
X-Gm-Message-State: AOJu0YySX4vnc4h9XjPlfbMFqxoX8nZjvjt8juGbtlMVHAuhV3kb7DOn
	4Svtk9PBvIo5WYLu/RnrzxrR+S2rR5U8zaizruu02xfZG5auER4QOF3cMtzZgA==
X-Google-Smtp-Source: AGHT+IHzx1FZvOZD6BTlnZiQsDYe4dTxexfmSKVGQ4N7JYcwoXKnticdmTrNQBjnjLU8yqjr9ZcwRA==
X-Received: by 2002:a05:6870:64a9:b0:277:e512:f27a with SMTP id 586e51a60fabf-277e512f84emr11125014fac.16.1725440455782;
        Wed, 04 Sep 2024 02:00:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:83fc:5c8e:13bd:d165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-717785b5183sm1153279b3a.197.2024.09.04.02.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 02:00:55 -0700 (PDT)
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
Subject: [PATCH v6 09/12] i2c: of-prober: Add regulator support
Date: Wed,  4 Sep 2024 17:00:11 +0800
Message-ID: <20240904090016.2841572-10-wenst@chromium.org>
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

This adds regulator management to the I2C OF component prober.
Components that the prober intends to probe likely require their
regulator supplies be enabled, and GPIOs be toggled to enable them or
bring them out of reset before they will respond to probe attempts.
GPIOs will be handled in the next patch.

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

This change is kept as a separate patch for now since the changes are
quite numerous.
---
 drivers/i2c/i2c-core-of-prober.c | 154 +++++++++++++++++++++++++++++--
 include/linux/i2c.h              |  10 +-
 2 files changed, 155 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 64d7631f4885..56b06ad7aa64 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -6,12 +6,14 @@
  */
 
 #include <linux/cleanup.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/dev_printk.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 
 /*
@@ -27,11 +29,119 @@
  * address responds.
  *
  * TODO:
- * - Support handling common regulators.
  * - Support handling common GPIOs.
  * - Support I2C muxes
  */
 
+struct i2c_of_probe_data {
+	const struct i2c_of_probe_opts *opts;
+	struct regulator_bulk_data *regulators;
+	unsigned int regulators_num;
+};
+
+/* Returns number of regulator supplies found for node, or error. */
+static int i2c_of_probe_get_regulators(struct device *dev, struct device_node *node,
+				       struct i2c_of_probe_data *data)
+{
+	struct regulator_bulk_data *tmp, *new_regulators;
+	int ret;
+
+	ret = of_regulator_bulk_get_all(dev, node, &tmp);
+	if (ret < 0) {
+		return ret;
+	} else if (ret == 0) {
+		/*
+		 * It's entirely possible for a device node to not have
+		 * regulator supplies. While it doesn't make sense from
+		 * a hardware perspective, the supplies could be always
+		 * on or otherwise not modeled in the device tree, but
+		 * the device would still work.
+		 */
+		return ret;
+	}
+
+	if (!data->regulators) {
+		data->regulators = tmp;
+		data->regulators_num = ret;
+		return ret;
+	};
+
+	new_regulators = krealloc_array(data->regulators, (data->regulators_num + ret),
+					sizeof(*tmp), GFP_KERNEL);
+	if (!new_regulators) {
+		regulator_bulk_free(ret, tmp);
+		return -ENOMEM;
+	}
+
+	data->regulators = new_regulators;
+	memcpy(&data->regulators[data->regulators_num], tmp, sizeof(*tmp) * ret);
+	data->regulators_num += ret;
+
+	return ret;
+}
+
+static void i2c_of_probe_free_regulators(struct i2c_of_probe_data *data)
+{
+	regulator_bulk_free(data->regulators_num, data->regulators);
+	data->regulators_num = 0;
+	data->regulators = NULL;
+}
+
+static void i2c_of_probe_free_res(struct i2c_of_probe_data *data)
+{
+	i2c_of_probe_free_regulators(data);
+}
+
+static int i2c_of_probe_get_res(struct device *dev, struct device_node *node,
+				struct i2c_of_probe_data *data)
+{
+	struct property *prop;
+	int ret;
+
+	ret = i2c_of_probe_get_regulators(dev, node, data);
+	if (ret < 0) {
+		dev_err_probe(dev, ret, "Failed to get regulator supplies from %pOF\n", node);
+		goto err_cleanup;
+	}
+
+	return 0;
+
+err_cleanup:
+	i2c_of_probe_free_res(data);
+	return ret;
+}
+
+static int i2c_of_probe_enable_regulators(struct device *dev, struct i2c_of_probe_data *data)
+{
+	int ret;
+
+	dev_dbg(dev, "Enabling regulator supplies\n");
+
+	ret = regulator_bulk_enable(data->regulators_num, data->regulators);
+	if (ret)
+		return ret;
+
+	msleep(data->opts->post_power_on_delay_ms);
+
+	return 0;
+}
+
+static void i2c_of_probe_disable_regulators(struct i2c_of_probe_data *data)
+{
+	regulator_bulk_disable(data->regulators_num, data->regulators);
+}
+
+static int i2c_of_probe_enable_res(struct device *dev, struct i2c_of_probe_data *data)
+{
+	int ret;
+
+	ret = i2c_of_probe_enable_regulators(dev, data);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static struct device_node *i2c_of_probe_get_i2c_node(struct device *dev, const char *type)
 {
 	struct device_node *node __free(device_node) = of_find_node_by_name(NULL, type);
@@ -78,10 +188,17 @@ static int i2c_of_probe_enable_node(struct device *dev, struct device_node *node
 	return ret;
 }
 
+static const struct i2c_of_probe_opts i2c_of_probe_opts_default = {
+	/* largest post-power-on pre-reset-deassert delay seen among drivers */
+	.post_power_on_delay_ms = 500,
+};
+
 /**
  * i2c_of_probe_component() - probe for devices of "type" on the same i2c bus
  * @dev: &struct device of the caller, only used for dev_* printk messages
  * @type: a string to match the device node name prefix to probe for
+ * @opts: &struct i2c_of_probe_data containing tweakable options for the prober.
+ *	  Defaults are used if this is %NULL.
  *
  * Probe for possible I2C components of the same "type" on the same I2C bus
  * that have their status marked as "fail".
@@ -108,8 +225,9 @@ static int i2c_of_probe_enable_node(struct device *dev, struct device_node *node
  *         had multiple types of components to probe, and one of them down
  *         the list caused a deferred probe. This is expected behavior.
  */
-int i2c_of_probe_component(struct device *dev, const char *type)
+int i2c_of_probe_component(struct device *dev, const char *type, const struct i2c_of_probe_opts *opts)
 {
+	struct i2c_of_probe_data probe_data = { .opts = opts ?: &i2c_of_probe_opts_default };
 	struct i2c_adapter *i2c;
 	int ret;
 
@@ -117,9 +235,7 @@ int i2c_of_probe_component(struct device *dev, const char *type)
 	if (IS_ERR(i2c_node))
 		return PTR_ERR(i2c_node);
 
-	for_each_child_of_node_scoped(i2c_node, node) {
-		if (!of_node_name_prefix(node, type))
-			continue;
+	for_each_child_of_node_with_prefix_scoped(i2c_node, node, type) {
 		if (!of_device_is_available(node))
 			continue;
 
@@ -134,13 +250,33 @@ int i2c_of_probe_component(struct device *dev, const char *type)
 	if (!i2c)
 		return dev_err_probe(dev, -EPROBE_DEFER, "Couldn't get I2C adapter\n");
 
+	/* Grab resources */
+	for_each_child_of_node_with_prefix_scoped(i2c_node, node, type) {
+		u32 addr;
+
+		if (of_property_read_u32(node, "reg", &addr))
+			continue;
+
+		dev_dbg(dev, "Requesting resources for %pOF\n", node);
+		ret = i2c_of_probe_get_res(dev, node, &probe_data);
+		if (ret)
+			return ret;
+	}
+
+	dev_dbg(dev, "Resources: # of regulator supplies = %d\n", probe_data.regulators_num);
+
+	/* Enable resources */
+	ret = i2c_of_probe_enable_res(dev, &probe_data);
+	if (ret) {
+		i2c_of_probe_free_res(&probe_data);
+		return dev_err_probe(dev, ret, "Failed to enable resources\n");
+	}
+
 	ret = 0;
-	for_each_child_of_node_scoped(i2c_node, node) {
+	for_each_child_of_node_with_prefix_scoped(i2c_node, node, type) {
 		union i2c_smbus_data data;
 		u32 addr;
 
-		if (!of_node_name_prefix(node, type))
-			continue;
 		if (of_property_read_u32(node, "reg", &addr))
 			continue;
 		if (i2c_smbus_xfer(i2c, addr, 0, I2C_SMBUS_READ, 0, I2C_SMBUS_BYTE, &data) < 0)
@@ -151,6 +287,8 @@ int i2c_of_probe_component(struct device *dev, const char *type)
 		break;
 	}
 
+	i2c_of_probe_disable_regulators(&probe_data);
+	i2c_of_probe_free_res(&probe_data);
 	i2c_put_adapter(i2c);
 
 	return ret;
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index c6c16731243d..dbcdb8edbf6f 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -1034,7 +1034,15 @@ int of_i2c_get_board_info(struct device *dev, struct device_node *node,
 			  struct i2c_board_info *info);
 
 #if IS_ENABLED(CONFIG_OF_DYNAMIC)
-int i2c_of_probe_component(struct device *dev, const char *type);
+/**
+ * i2c_of_probe_opts - I2C OF component prober customization options
+ * @post_power_on_delay_us: Delay in ms after regulators are powered on. Passed to msleep().
+ */
+struct i2c_of_probe_opts {
+	unsigned int post_power_on_delay_ms;
+};
+
+int i2c_of_probe_component(struct device *dev, const char *type, const struct i2c_of_probe_opts *opts);
 #endif
 
 #else
-- 
2.46.0.469.g59c65b2a67-goog


