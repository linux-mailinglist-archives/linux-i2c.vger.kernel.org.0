Return-Path: <linux-i2c+bounces-5213-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1E194BA51
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 12:01:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A907A1F2192A
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 10:01:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A84DA18A95A;
	Thu,  8 Aug 2024 10:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UXXhKrDg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB67C189F3B
	for <linux-i2c@vger.kernel.org>; Thu,  8 Aug 2024 09:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723111200; cv=none; b=J+RJaAZUZrzZ+53N40aecmIGJOWR4wFr0BHd2vINQ+ptTcqwHbdvWhrB7ugbR64veQMa9tgpe9+s2mzoP4XM3awmZlnPhFFI0rml22XjDBwqRw0ihnfVaPj7HWMeMS1BnyVTMYHBTmc1+KNbTXdY0476Z+IY3NjGJMlfhYE8sJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723111200; c=relaxed/simple;
	bh=3PK3nldhA/CKj5NnjT2jjGHNA0GDUckfr9mIXzTKNgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RyIvAUNKrMTvFEUwRRg7JbE/3hPn4CC5iYyOnnuulWVDVOnh7MxxFVfb9kpyebMJerFnh8dUT0tQs2pyi3WNDkey6DRXqLFsiu1qwIZ8wRdHoFZLeR5lpU8KFoWEr02qWCAWb437hEnOpRcCfHn9Q77e3JQPmVXytryhc4r2g1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UXXhKrDg; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fda7fa60a9so7795385ad.3
        for <linux-i2c@vger.kernel.org>; Thu, 08 Aug 2024 02:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723111198; x=1723715998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMQzDBFwtvtL+uRpCqzQYWzmcXr00tCiZCE6wRprzyk=;
        b=UXXhKrDgvAIjyY6mHenKM5Ptq/1RPbGEsj49clVysPZTYI4FqyxnbR4j1vW8s7ZzvJ
         JgtBUCa9fzF/YhZ2RoBaXHeKPMSCnxkka/QCYnUId7+tUtew+sSeurMiRw63YbYtDPxb
         erCeujaN4199Uimk8HCCKPFs3jtIbYGgc8Bw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723111198; x=1723715998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMQzDBFwtvtL+uRpCqzQYWzmcXr00tCiZCE6wRprzyk=;
        b=davgFimCixfzl/Lok5AETagYi1FaH+VV2TRFaV/uPLdgqBYVyAs1yICAa5FiOdTTdh
         W9Ahg3ARscBtdgNZm/obYccNuP6tPJugHPLEl69JxlHOi4CPwAa2Dkquaei1oYkyXpwn
         Ibp1DpxFm3zsVYfitIQph2cFC0dicBlXDL8YjLsew1bzFVTwxsMj9qa7+A6DUSoZkem+
         aVdLdv0w/PHOddX2UfqOfYbEzBlMwtRAMmbW/Qgy+pg56spIRl4Fp5hyqP4qUIzcR6GB
         wOx+NYqe3+fDTgCEhk4193C4IR53Wk7Knx7LNLGTCSq2Dw6jNwcfbuRgbDQ019wgrACb
         P4tA==
X-Forwarded-Encrypted: i=1; AJvYcCXBspJQ7y/0PhcKsNefn/nKqwAkBLymbN60Ng8waLuwW2rnZfD1dE+iK43qxX3dfNSA1Fw1udhogKOaaaID6Pg0PVyfHvTxuKjy
X-Gm-Message-State: AOJu0YxWzAel1QvMJYry7OOyD8dTuLjpkjWSt/1PyDsmfNCf5xGn+6Tv
	ywxE+kEDHjtIie9E3Txr5E3L9jG/H8K4F6E92QPBuCSCNd/48+U7Cuqhx4KXTg==
X-Google-Smtp-Source: AGHT+IFpIGcwhRChfmS6FgNQKtKkh03/uSPOBA07xstWnAMz5Rv8gBIXh5/7TokHUzCHGoOUlZXHWw==
X-Received: by 2002:a17:903:2288:b0:1fa:2b89:f549 with SMTP id d9443c01a7336-20095224c09mr17452045ad.10.1723111198191;
        Thu, 08 Aug 2024 02:59:58 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8b53:87e6:914:a00d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59297707sm120784985ad.254.2024.08.08.02.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 02:59:57 -0700 (PDT)
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
Subject: [PATCH v4 4/6] i2c: of-prober: Add GPIO and regulator support
Date: Thu,  8 Aug 2024 17:59:27 +0800
Message-ID: <20240808095931.2649657-5-wenst@chromium.org>
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

This adds GPIO and regulator management to the I2C OF component prober.
Components that the prober intends to probe likely require their
regulator supplies be enabled, and GPIOs be toggled to enable them or
bring them out of reset before they will respond to probe attempts.

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
Changes since v3:
- New patch

This change is kept as a separate patch for now since the changes are
quite numerous.
---
 drivers/i2c/i2c-core-of-prober.c | 272 ++++++++++++++++++++++++++++++-
 1 file changed, 271 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index 08aa736cc7a9..76d26768e12c 100644
--- a/drivers/i2c/i2c-core-of-prober.c
+++ b/drivers/i2c/i2c-core-of-prober.c
@@ -5,11 +5,14 @@
  * Copyright (C) 2024 Google LLC
  */
 
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 
 /*
@@ -25,10 +28,242 @@
  * address responds.
  *
  * TODO:
- * - Support handling common regulators and GPIOs.
  * - Support I2C muxes
  */
 
+/*
+ * While 8 seems like a small number, especially when probing many component
+ * options, in practice all the options will have the same resources. The
+ * code getting the resources below does deduplication to avoid conflicts.
+ */
+#define RESOURCE_MAX 8
+
+struct i2c_of_probe_data {
+	struct of_phandle_args gpio_phandles[RESOURCE_MAX];
+	unsigned int gpio_phandles_num;
+	struct gpio_desc *gpiods[RESOURCE_MAX];
+	unsigned int gpiods_num;
+	struct regulator *regulators[RESOURCE_MAX];
+	unsigned int regulators_num;
+};
+
+#define REGULATOR_SUFFIX "-supply"
+
+/* Returns 1 if regulator found for property, 0 if not, or error. */
+static int i2c_of_probe_get_regulator(struct device_node *node, struct property *prop,
+				      struct i2c_of_probe_data *data)
+{
+	struct regulator *regulator = NULL;
+	char con[32]; /* 32 is max size of property name */
+	char *p;
+
+	p = strstr(prop->name, REGULATOR_SUFFIX);
+	if (!p)
+		return 0;
+
+	if (strcmp(p, REGULATOR_SUFFIX))
+		return 0;
+
+	strscpy(con, prop->name, p - prop->name + 1);
+	regulator = regulator_of_get_optional(node, con);
+	/* DT lookup should never return -ENODEV */
+	if (IS_ERR(regulator))
+		return PTR_ERR(regulator);
+
+	for (int i = 0; i < data->regulators_num; i++)
+		if (regulator_is_equal(regulator, data->regulators[i])) {
+			regulator_put(regulator);
+			regulator = NULL;
+			break;
+		}
+
+	if (!regulator)
+		return 1;
+
+	if (data->regulators_num == ARRAY_SIZE(data->regulators)) {
+		regulator_put(regulator);
+		return -ENOMEM;
+	}
+
+	data->regulators[data->regulators_num++] = regulator;
+
+	return 1;
+}
+
+#define GPIO_SUFFIX "-gpio"
+
+/* Returns 1 if GPIO found for property, 0 if not, or error. */
+static int i2c_of_probe_get_gpiod(struct device_node *node, struct property *prop,
+				  struct i2c_of_probe_data *data)
+{
+	struct fwnode_handle *fwnode = of_fwnode_handle(node);
+	struct gpio_desc *gpiod = NULL;
+	char con[32]; /* 32 is max size of property name */
+	char *con_id = NULL;
+	char *p;
+	struct of_phandle_args phargs;
+	int ret;
+	bool duplicate_found;
+
+	p = strstr(prop->name, GPIO_SUFFIX);
+	if (p) {
+		strscpy(con, prop->name, p - prop->name + 1);
+		con_id = con;
+	} else if (strcmp(prop->name, "gpio") && strcmp(prop->name, "gpios")) {
+		return 0;
+	}
+
+	ret = of_parse_phandle_with_args_map(node, prop->name, "gpio", 0, &phargs);
+	if (ret)
+		return ret;
+
+	/*
+	 * GPIO descriptors are not reference counted. GPIOD_FLAGS_BIT_NONEXCLUSIVE
+	 * can't differentiate between GPIOs shared between devices to be probed and
+	 * other devices (which is incorrect). Instead we check the parsed phandle
+	 * for duplicates. Ignore the flags (the last arg) in this case.
+	 */
+	phargs.args[phargs.args_count - 1] = 0;
+	duplicate_found = false;
+	for (int i = 0; i < data->gpio_phandles_num; i++)
+		if (of_phandle_args_equal(&phargs, &data->gpio_phandles[i])) {
+			duplicate_found = true;
+			break;
+		}
+
+	if (duplicate_found) {
+		of_node_put(phargs.np);
+		return 1;
+	}
+
+	gpiod = fwnode_gpiod_get_index(fwnode, con_id, 0, GPIOD_ASIS, "i2c-of-prober");
+	if (IS_ERR(gpiod)) {
+		of_node_put(phargs.np);
+		return PTR_ERR(gpiod);
+	}
+
+	if (data->gpiods_num == ARRAY_SIZE(data->gpiods)) {
+		of_node_put(phargs.np);
+		gpiod_put(gpiod);
+		return -ENOMEM;
+	}
+
+	memcpy(&data->gpio_phandles[data->gpio_phandles_num++], &phargs, sizeof(phargs));
+	data->gpiods[data->gpiods_num++] = gpiod;
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
+	for (int i = data->gpio_phandles_num - 1; i >= 0; i--)
+		of_node_put(data->gpio_phandles[i].np);
+	data->gpio_phandles_num = 0;
+
+	for (int i = data->gpiods_num - 1; i >= 0; i--)
+		gpiod_put(data->gpiods[i]);
+	data->gpiods_num = 0;
+}
+
+static void i2c_of_probe_free_res(struct i2c_of_probe_data *data)
+{
+	i2c_of_probe_free_gpios(data);
+
+	for (int i = data->regulators_num; i >= 0; i--)
+		regulator_put(data->regulators[i]);
+	data->regulators_num = 0;
+}
+
+static int i2c_of_probe_get_res(struct device *dev, struct device_node *node,
+				struct i2c_of_probe_data *data)
+{
+	struct property *prop;
+	int ret;
+
+	for_each_property_of_node(node, prop) {
+		dev_dbg(dev, "Trying property %pOF/%s\n", node, prop->name);
+
+		/* regulator supplies */
+		ret = i2c_of_probe_get_regulator(node, prop, data);
+		if (ret > 0)
+			continue;
+		if (ret < 0) {
+			dev_err_probe(dev, ret, "Failed to get regulator supply from %pOF/%s\n",
+				      node, prop->name);
+			goto err_cleanup;
+		}
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
+	return 0;
+
+err_cleanup:
+	i2c_of_probe_free_res(data);
+	return ret;
+}
+
+static int i2c_of_probe_enable_res(struct device *dev, struct i2c_of_probe_data *data)
+{
+	int ret = 0;
+	int reg_i, gpio_i;
+
+	dev_dbg(dev, "Enabling resources\n");
+
+	for (reg_i = 0; reg_i < data->regulators_num; reg_i++) {
+		dev_dbg(dev, "Enabling regulator %d\n", reg_i);
+		ret = regulator_enable(data->regulators[reg_i]);
+		if (ret)
+			goto disable_regulators;
+	}
+
+	/* largest post-power-on pre-reset-deassert delay seen among drivers */
+	msleep(500);
+
+	for (gpio_i = 0; gpio_i < data->gpiods_num; gpio_i++) {
+		/*
+		 * reset GPIOs normally have opposite polarity compared to
+		 * enable GPIOs. Instead of parsing the flags again, simply
+		 * set the raw value to high.
+		 */
+		dev_dbg(dev, "Setting GPIO %d\n", gpio_i);
+		ret = gpiod_direction_output_raw(data->gpiods[gpio_i], 1);
+		if (ret)
+			goto disable_gpios;
+	}
+
+	/* largest post-reset-deassert delay seen in tree for Elan I2C HID */
+	msleep(300);
+
+	return 0;
+
+disable_gpios:
+	for (gpio_i--; gpio_i >= 0; gpio_i--)
+		gpiod_set_raw_value_cansleep(data->gpiods[gpio_i], 0);
+disable_regulators:
+	for (reg_i--; reg_i >= 0; reg_i--)
+		regulator_disable(data->regulators[reg_i]);
+
+	return ret;
+}
+
+static void i2c_of_probe_disable_regulators(struct i2c_of_probe_data *data)
+{
+	for (int i = data->regulators_num - 1; i >= 0; i--)
+		regulator_disable(data->regulators[i]);
+}
+
 /**
  * i2c_of_probe_component() - probe for devices of "type" on the same i2c bus
  * @dev: &struct device of the caller, only used for dev_* printk messages
@@ -64,6 +299,7 @@ int i2c_of_probe_component(struct device *dev, const char *type)
 	struct device_node *node, *i2c_node;
 	struct i2c_adapter *i2c;
 	struct of_changeset *ocs = NULL;
+	struct i2c_of_probe_data data = {0};
 	int ret;
 
 	node = of_find_node_by_name(NULL, type);
@@ -101,6 +337,34 @@ int i2c_of_probe_component(struct device *dev, const char *type)
 		return dev_err_probe(dev, -EPROBE_DEFER, "Couldn't get I2C adapter\n");
 	}
 
+	/* Grab resources */
+	for_each_child_of_node_scoped(i2c_node, node) {
+		u32 addr;
+
+		if (!of_node_name_prefix(node, type))
+			continue;
+		if (of_property_read_u32(node, "reg", &addr))
+			continue;
+
+		dev_dbg(dev, "Requesting resources for %pOF\n", node);
+		ret = i2c_of_probe_get_res(dev, node, &data);
+		if (ret) {
+			of_node_put(i2c_node);
+			return ret;
+		}
+	}
+
+	dev_dbg(dev, "Resources: # of GPIOs = %d, # of regulator supplies = %d\n",
+		data.gpiods_num, data.regulators_num);
+
+	/* Enable resources */
+	ret = i2c_of_probe_enable_res(dev, &data);
+	if (ret) {
+		i2c_of_probe_free_res(&data);
+		of_node_put(i2c_node);
+		return dev_err_probe(dev, ret, "Failed to enable resources\n");
+	}
+
 	ret = 0;
 	for_each_child_of_node(i2c_node, node) {
 		union i2c_smbus_data data;
@@ -116,6 +380,8 @@ int i2c_of_probe_component(struct device *dev, const char *type)
 		break;
 	}
 
+	i2c_of_probe_free_gpios(&data);
+
 	/* Found a device that is responding */
 	if (node) {
 		dev_info(dev, "Enabling %pOF\n", node);
@@ -137,6 +403,8 @@ int i2c_of_probe_component(struct device *dev, const char *type)
 		of_node_put(node);
 	}
 
+	i2c_of_probe_disable_regulators(&data);
+	i2c_of_probe_free_res(&data);
 	i2c_put_adapter(i2c);
 	of_node_put(i2c_node);
 
@@ -148,6 +416,8 @@ int i2c_of_probe_component(struct device *dev, const char *type)
 	kfree(ocs);
 err_put_node:
 	of_node_put(node);
+	i2c_of_probe_disable_regulators(&data);
+	i2c_of_probe_free_res(&data);
 	i2c_put_adapter(i2c);
 	of_node_put(i2c_node);
 	return ret;
-- 
2.46.0.rc2.264.g509ed76dc8-goog


