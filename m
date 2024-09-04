Return-Path: <linux-i2c+bounces-6125-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C71296B5C6
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 11:02:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F11381F225D2
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 09:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C41A1CF2A8;
	Wed,  4 Sep 2024 09:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TfnOFDwA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4121119EEA8
	for <linux-i2c@vger.kernel.org>; Wed,  4 Sep 2024 09:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725440438; cv=none; b=dXuKOOAFYnefCmcL9U+gW4RtkEEtIFm0nwXg6+kHjNu8mc/H9AY/gCPFAlY0FTtGPBEL0j9KR6X4hyzsEK2dbKKHQwfa3A8xb+ORo6UJDsdSeogqPdw7sFTwrrTlWLLywGlkUQ8OIEoQkzHPaEmNK3eI0WVuxFx9ij+pb65kD+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725440438; c=relaxed/simple;
	bh=Kq99wCwKnrmROs7j2F9SwrXOEeU8PJm4BQ0fEyd7tr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=anHDWJ1GLppCbY8eH2vIx6wa08Cho5MPamb1MQS/HcCZSXEcLT+U9A+ZwnrQIfR0o4P6rbA399GF3dQC4jjGRK/ypGJHB4wNyxgAfgEd7aVUbZU+658WTkqIrH8FLUKwuq2QTwZnPa7aPpcRhBf/5RvMOU3BMMRq/q23Um1Q9n0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TfnOFDwA; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-70f73ca989aso2490762a34.2
        for <linux-i2c@vger.kernel.org>; Wed, 04 Sep 2024 02:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725440434; x=1726045234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=il2QfOTiET8rjOcFBiZisnVGS1vYYZiPRBoWVegvz3I=;
        b=TfnOFDwAd4mSIxhJVopa5vs77V71bKjx24Ly+d/9HZBZCjn8QYyAnrov8kSmEcz0YS
         XYH6euqug6vYqKasTU7D9uQOHDllKSfUaUPIaY2wJq9A6/Qu2mPR8lkMiK0zvVl5Cp14
         bmjbLZIDHkmIwENeMUi/HT0ljDECnWKdUS6FI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725440434; x=1726045234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=il2QfOTiET8rjOcFBiZisnVGS1vYYZiPRBoWVegvz3I=;
        b=sfqpSP+PDOAiPZr5sXgwMckgzPQDwEtKm4kDztrcm98kLCiP/GOnBNOAW25CPrlDKl
         mQJcB5rObc6oKSWrVcoyR0zo0IT7s6cBDTOOxpo2/J1tKk+hr1l1S5ug/Ks6A6zTbdiH
         Bv55hUlKBZyZOnwuGFZ9sUU4CyqgdIcSBpZ1AhIQHknzswuV47oQva3/gLhSvAD0WxbP
         OAoUD/5YrxwuegIsD6ZyKbQDjCJ4likQ2sCfNFiulKmqVtZL/IKIWf6fOogmZlWF9WVm
         IE1akKdUgTLMgTehsR7A8uy0XwkwKvSej7XTyPY8n8ojrVO53ItzLBnLbMnYEgW/SamL
         NPiw==
X-Forwarded-Encrypted: i=1; AJvYcCXipYex41CGX0z5fk4DCZWYcbSIhmhI9Sp+MLUQ1GKMIU5rIUAGzjNbY2usgun/Ivjfn3IMGxm9rXg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbZwm/qJesGjVEqBpwGo2GuIbvBZzHRE+ucTcSM9JRqtZNKIuL
	V+50ROKwX9f3//yzXMcMcPz8CfwpmnwEIidYEtfzP5TYO5Qj6KX5e76Ksv/cOw==
X-Google-Smtp-Source: AGHT+IFjPAH4gu4wNsG/hc91RRvJC5dzdd5l+iIjQEyefCsJA13TtrMy0WEpFbhOCDltsCruxjjIJA==
X-Received: by 2002:a05:6358:5e1b:b0:1b1:ac2e:af69 with SMTP id e5c5f4694b2df-1b603c48228mr2349782555d.17.1725440434102;
        Wed, 04 Sep 2024 02:00:34 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:83fc:5c8e:13bd:d165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-717785b5183sm1153279b3a.197.2024.09.04.02.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 02:00:33 -0700 (PDT)
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
Subject: [PATCH v6 03/12] regulator: Move OF-specific regulator lookup code to of_regulator.c
Date: Wed,  4 Sep 2024 17:00:05 +0800
Message-ID: <20240904090016.2841572-4-wenst@chromium.org>
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

There's still a bit of OF-specific code in the regulator device lookup
function.

Move those bits of code over to of_regulator.c, and create a new
function of_regulator_dev_lookup() to encapsulate the code moved out of
regulator_dev_lookup().

Also mark of_find_regulator_by_node() as static, since there are no
other users in other compile units.

There are no functional changes. A line alignment was also fixed.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- Fix kerneldoc format of of_regulator_dev_lookup()
- Fix stub compile error for !CONFIG_OF in drivers/regulator/internal.h

Changes since v4:
- New patch
---
 drivers/regulator/core.c         |  87 ++----------------------
 drivers/regulator/internal.h     |   9 +--
 drivers/regulator/of_regulator.c | 110 ++++++++++++++++++++++++++++++-
 3 files changed, 119 insertions(+), 87 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index c1d11924d892..835a5531d045 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -421,74 +421,6 @@ static void regulator_lock_dependent(struct regulator_dev *rdev,
 	mutex_unlock(&regulator_list_mutex);
 }
 
-/**
- * of_get_child_regulator - get a child regulator device node
- * based on supply name
- * @parent: Parent device node
- * @prop_name: Combination regulator supply name and "-supply"
- *
- * Traverse all child nodes.
- * Extract the child regulator device node corresponding to the supply name.
- *
- * Return: Pointer to the &struct device_node corresponding to the regulator
- *	   if found, or %NULL if not found.
- */
-static struct device_node *of_get_child_regulator(struct device_node *parent,
-						  const char *prop_name)
-{
-	struct device_node *regnode = NULL;
-	struct device_node *child = NULL;
-
-	for_each_child_of_node(parent, child) {
-		regnode = of_parse_phandle(child, prop_name, 0);
-
-		if (!regnode) {
-			regnode = of_get_child_regulator(child, prop_name);
-			if (regnode)
-				goto err_node_put;
-		} else {
-			goto err_node_put;
-		}
-	}
-	return NULL;
-
-err_node_put:
-	of_node_put(child);
-	return regnode;
-}
-
-/**
- * of_get_regulator - get a regulator device node based on supply name
- * @dev: Device pointer for the consumer (of regulator) device
- * @supply: regulator supply name
- *
- * Extract the regulator device node corresponding to the supply name.
- *
- * Return: Pointer to the &struct device_node corresponding to the regulator
- *	   if found, or %NULL if not found.
- */
-static struct device_node *of_get_regulator(struct device *dev, const char *supply)
-{
-	struct device_node *regnode = NULL;
-	char prop_name[64]; /* 64 is max size of property name */
-
-	dev_dbg(dev, "Looking up %s-supply from device tree\n", supply);
-
-	snprintf(prop_name, 64, "%s-supply", supply);
-	regnode = of_parse_phandle(dev->of_node, prop_name, 0);
-
-	if (!regnode) {
-		regnode = of_get_child_regulator(dev->of_node, prop_name);
-		if (regnode)
-			return regnode;
-
-		dev_dbg(dev, "Looking up %s property in node %pOF failed\n",
-				prop_name, dev->of_node);
-		return NULL;
-	}
-	return regnode;
-}
-
 /* Platform voltage constraint check */
 int regulator_check_voltage(struct regulator_dev *rdev,
 			    int *min_uV, int *max_uV)
@@ -2021,7 +1953,6 @@ static struct regulator_dev *regulator_dev_lookup(struct device *dev,
 						  const char *supply)
 {
 	struct regulator_dev *r = NULL;
-	struct device_node *node;
 	struct regulator_map *map;
 	const char *devname = NULL;
 
@@ -2029,19 +1960,11 @@ static struct regulator_dev *regulator_dev_lookup(struct device *dev,
 
 	/* first do a dt based lookup */
 	if (dev && dev->of_node) {
-		node = of_get_regulator(dev, supply);
-		if (node) {
-			r = of_find_regulator_by_node(node);
-			of_node_put(node);
-			if (r)
-				return r;
-
-			/*
-			 * We have a node, but there is no device.
-			 * assume it has not registered yet.
-			 */
-			return ERR_PTR(-EPROBE_DEFER);
-		}
+		r = of_regulator_dev_lookup(dev, supply);
+		if (!IS_ERR(r))
+			return r;
+		if (PTR_ERR(r) == -EPROBE_DEFER)
+			return r;
 	}
 
 	/* if not found, try doing it non-dt way */
diff --git a/drivers/regulator/internal.h b/drivers/regulator/internal.h
index 77a502141089..8e5506c5ee94 100644
--- a/drivers/regulator/internal.h
+++ b/drivers/regulator/internal.h
@@ -66,7 +66,8 @@ static inline struct regulator_dev *dev_to_rdev(struct device *dev)
 }
 
 #ifdef CONFIG_OF
-struct regulator_dev *of_find_regulator_by_node(struct device_node *np);
+struct regulator_dev *of_regulator_dev_lookup(struct device *dev,
+					      const char *supply);
 struct regulator_init_data *regulator_of_get_init_data(struct device *dev,
 			         const struct regulator_desc *desc,
 				 struct regulator_config *config,
@@ -80,10 +81,10 @@ int of_get_n_coupled(struct regulator_dev *rdev);
 bool of_check_coupling_data(struct regulator_dev *rdev);
 
 #else
-static inline struct regulator_dev *
-of_find_regulator_by_node(struct device_node *np)
+static inline struct regulator_dev *of_regulator_dev_lookup(struct device *dev,
+							    const char *supply)
 {
-	return NULL;
+	return ERR_PTR(-ENODEV);
 }
 
 static inline struct regulator_init_data *
diff --git a/drivers/regulator/of_regulator.c b/drivers/regulator/of_regulator.c
index cec8c3647a00..d5dd7a9e577b 100644
--- a/drivers/regulator/of_regulator.c
+++ b/drivers/regulator/of_regulator.c
@@ -552,7 +552,75 @@ struct regulator_init_data *regulator_of_get_init_data(struct device *dev,
 	return NULL;
 }
 
-struct regulator_dev *of_find_regulator_by_node(struct device_node *np)
+/**
+ * of_get_child_regulator - get a child regulator device node
+ * based on supply name
+ * @parent: Parent device node
+ * @prop_name: Combination regulator supply name and "-supply"
+ *
+ * Traverse all child nodes.
+ * Extract the child regulator device node corresponding to the supply name.
+ *
+ * Return: Pointer to the &struct device_node corresponding to the regulator
+ *	   if found, or %NULL if not found.
+ */
+static struct device_node *of_get_child_regulator(struct device_node *parent,
+						  const char *prop_name)
+{
+	struct device_node *regnode = NULL;
+	struct device_node *child = NULL;
+
+	for_each_child_of_node(parent, child) {
+		regnode = of_parse_phandle(child, prop_name, 0);
+
+		if (!regnode) {
+			regnode = of_get_child_regulator(child, prop_name);
+			if (regnode)
+				goto err_node_put;
+		} else {
+			goto err_node_put;
+		}
+	}
+	return NULL;
+
+err_node_put:
+	of_node_put(child);
+	return regnode;
+}
+
+/**
+ * of_get_regulator - get a regulator device node based on supply name
+ * @dev: Device pointer for the consumer (of regulator) device
+ * @supply: regulator supply name
+ *
+ * Extract the regulator device node corresponding to the supply name.
+ *
+ * Return: Pointer to the &struct device_node corresponding to the regulator
+ *	   if found, or %NULL if not found.
+ */
+static struct device_node *of_get_regulator(struct device *dev, const char *supply)
+{
+	struct device_node *regnode = NULL;
+	char prop_name[64]; /* 64 is max size of property name */
+
+	dev_dbg(dev, "Looking up %s-supply from device tree\n", supply);
+
+	snprintf(prop_name, 64, "%s-supply", supply);
+	regnode = of_parse_phandle(dev->of_node, prop_name, 0);
+
+	if (!regnode) {
+		regnode = of_get_child_regulator(dev->of_node, prop_name);
+		if (regnode)
+			return regnode;
+
+		dev_dbg(dev, "Looking up %s property in node %pOF failed\n",
+			prop_name, dev->of_node);
+		return NULL;
+	}
+	return regnode;
+}
+
+static struct regulator_dev *of_find_regulator_by_node(struct device_node *np)
 {
 	struct device *dev;
 
@@ -561,6 +629,46 @@ struct regulator_dev *of_find_regulator_by_node(struct device_node *np)
 	return dev ? dev_to_rdev(dev) : NULL;
 }
 
+/**
+ * of_regulator_dev_lookup - lookup a regulator device with device tree only
+ * @dev: Device pointer for regulator supply lookup.
+ * @supply: Supply name or regulator ID.
+ *
+ * Return: Pointer to the &struct regulator_dev on success, or ERR_PTR()
+ *	   encoded value on error.
+ *
+ * If successful, returns a pointer to the &struct regulator_dev that
+ * corresponds to the name @supply and with the embedded &struct device
+ * refcount incremented by one. The refcount must be dropped by calling
+ * put_device().
+ *
+ * On failure one of the following ERR_PTR() encoded values is returned:
+ * * -%ENODEV if lookup fails permanently.
+ * * -%EPROBE_DEFER if lookup could succeed in the future.
+ */
+struct regulator_dev *of_regulator_dev_lookup(struct device *dev,
+					      const char *supply)
+{
+	struct regulator_dev *r;
+	struct device_node *node;
+
+	node = of_get_regulator(dev, supply);
+	if (node) {
+		r = of_find_regulator_by_node(node);
+		of_node_put(node);
+		if (r)
+			return r;
+
+		/*
+		 * We have a node, but there is no device.
+		 * assume it has not registered yet.
+		 */
+		return ERR_PTR(-EPROBE_DEFER);
+	}
+
+	return ERR_PTR(-ENODEV);
+}
+
 /*
  * Returns number of regulators coupled with rdev.
  */
-- 
2.46.0.469.g59c65b2a67-goog


