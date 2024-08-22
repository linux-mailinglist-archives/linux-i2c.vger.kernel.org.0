Return-Path: <linux-i2c+bounces-5654-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C044F95B17A
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 11:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 730892869D9
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 09:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920C9185B4A;
	Thu, 22 Aug 2024 09:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="b0aCzI8f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA74818595D
	for <linux-i2c@vger.kernel.org>; Thu, 22 Aug 2024 09:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724318448; cv=none; b=oaLtV1JGdMWDIrQQ9u1iYWro6f1JOjbK+Ceb9gUZhoqSjc2Qk+Pwn4OTiCJWsQBxQecAPILWVOfB/eIOG124iXwEQ9VwNo8B/QAVQebqA8KCSsilMZh8aP0Y2Wsautjg83xmNcVCJj6g1WQ7c9V7rvMJ2gr5PY52ntjT5wZBn6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724318448; c=relaxed/simple;
	bh=piTyNsw3eHoDVnCDv3Hd5LIe3UIXKM9fGlm4l0G6M4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bzRP9Gbx/Jghn/wpNvnotBuoO8Cm2JRTRcxV5RmBIiCFa0X41c/B20c7Jd8CSYAhWw72BxiqMbo/H5ZF8Ef1XN4MkYxit0nFP3gtAaijOS/CRuQE4AhiiekjRkwY58HGXwetsHFqvhqSF2mgWg4iVy8Jcds9z4XAWXX6ZBr7RiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=b0aCzI8f; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-714261089c1so401131b3a.0
        for <linux-i2c@vger.kernel.org>; Thu, 22 Aug 2024 02:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724318446; x=1724923246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nK7RVXbUa73K0O9XTM3cCy4ZRtIeA4akoAuNuVfnhl4=;
        b=b0aCzI8fUfKtdObudEFySP2PcchUWQ183cYvuZRGU/xJUlS8dzR5AGAkhPlIjDJ6mu
         1qvJ6o6BLcYcg4pgNqn35fWhvDOX7Gz+f3zB1u5/JZoTkXw0T8o0cmyYXR3GYbfaD84S
         J9xs/4a8abXHwJMnC+OXbkdzGyXVdG0kv6YcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724318446; x=1724923246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nK7RVXbUa73K0O9XTM3cCy4ZRtIeA4akoAuNuVfnhl4=;
        b=aLB6YP8P5tqReplPofv/ukkWPxIyvAqDVvyJsyR51iHC+JYXZy/126RWD5qpRgPZpH
         sbfDeNHlQmozBg1+uqsrZjWLrk8X9GKZkV1uZU3snlqe+VHNqIZRlN6D26/MNfS1Ift0
         ra4o7toQ2aPOZHNzvN1KQyvjRcJVrihErNH0939fOFmCwzeP3fkZeFAlASacCXj5cl9H
         eyLj/3+u1rF/zKQuzavweecXQ38ghSpkDWb6LdqLF0n9bDgODDOFdN/ggpfVZJPSa1gs
         z5LxBcPXj+JKnSxa584VEcuYVn9P4ILz/lymrKM/U1mDH04AYQ0LlnSnh+6Dy4BFXnt4
         f0yw==
X-Forwarded-Encrypted: i=1; AJvYcCVwXLsyJAs75XerJk0ZBI8XEDfOCixy87oKc17D2IvcJ7j99UDaBP9/PvoCyaIbLDCdfrY9XtVO0AE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT6vpySCOskPs9+KqYHwxcjjD08gNj3teseBv31XBgA1N0dfLD
	hOdZB+eW0WESdA5ITx0a9UJ9RUKiCB4eO7OFgJZFXXJ1AXOXOC6y+TRiMmLbTg==
X-Google-Smtp-Source: AGHT+IFZrknrh60AP+xUNW7G6X8rXlnZ0nYSqqA2Jq4MMQC2PUO1ifpAUkr7X0okzBKnbPbPM0MW6w==
X-Received: by 2002:a05:6a00:2d81:b0:70e:cee8:264a with SMTP id d2e1a72fcca58-7143170e827mr4568474b3a.1.1724318446207;
        Thu, 22 Aug 2024 02:20:46 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8470:6a67:8877:ce2c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434335e69sm951398b3a.194.2024.08.22.02.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:20:45 -0700 (PDT)
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
Subject: [PATCH v5 07/10] i2c: of-prober: Add regulator support
Date: Thu, 22 Aug 2024 17:20:00 +0800
Message-ID: <20240822092006.3134096-8-wenst@chromium.org>
X-Mailer: git-send-email 2.46.0.184.g6999bdac58-goog
In-Reply-To: <20240822092006.3134096-1-wenst@chromium.org>
References: <20240822092006.3134096-1-wenst@chromium.org>
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
Changes since v4:
- Split out GPIO handling to separate patch
- Rewrote using of_regulator_bulk_get_all()
- Replaced "regulators" with "regulator supplies" in debug messages

Changes since v3:
- New patch

This change is kept as a separate patch for now since the changes are
quite numerous.
---
 drivers/i2c/i2c-core-of-prober.c | 114 ++++++++++++++++++++++++++++++-
 1 file changed, 113 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-of-prober.c b/drivers/i2c/i2c-core-of-prober.c
index bb7b231201b0..32184cfd10f6 100644
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
@@ -27,10 +29,93 @@
  * address responds.
  *
  * TODO:
- * - Support handling common regulators and GPIOs.
+ * - Support handling common GPIOs.
  * - Support I2C muxes
  */
 
+struct i2c_of_probe_data {
+	struct regulator_bulk_data *regulators;
+	unsigned int regulators_num;
+};
+
+/* Returns number of regulator supplies found for node, or error. */
+static int i2c_of_probe_get_regulator(struct device *dev, struct device_node *node,
+				      struct i2c_of_probe_data *data)
+{
+	struct regulator_bulk_data *tmp, *new_regulators;
+	int ret;
+
+	ret = of_regulator_bulk_get_all(dev, node, &tmp);
+	if (ret <= 0)
+		return ret;
+
+	if (!data->regulators) {
+		data->regulators = tmp;
+		data->regulators_num = ret;
+		return ret;
+	};
+
+	new_regulators = krealloc(data->regulators,
+				  sizeof(*tmp) * (data->regulators_num + ret),
+				  GFP_KERNEL);
+	if (!new_regulators) {
+		regulator_bulk_free(ret, tmp);
+		return -ENOMEM;
+	}
+
+	data->regulators = new_regulators;
+
+	for (unsigned int i = 0; i < ret; i++)
+		memcpy(&data->regulators[data->regulators_num++], &tmp[i], sizeof(*tmp));
+
+	return ret;
+}
+
+static void i2c_of_probe_free_res(struct i2c_of_probe_data *data)
+{
+	regulator_bulk_free(data->regulators_num, data->regulators);
+}
+
+static int i2c_of_probe_get_res(struct device *dev, struct device_node *node,
+				struct i2c_of_probe_data *data)
+{
+	struct property *prop;
+	int ret;
+
+	ret = i2c_of_probe_get_regulator(dev, node, data);
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
+static int i2c_of_probe_enable_res(struct device *dev, struct i2c_of_probe_data *data)
+{
+	int ret = 0;
+
+	dev_dbg(dev, "Enabling regulator supplies\n");
+
+	ret = regulator_bulk_enable(data->regulators_num, data->regulators);
+	if (ret)
+		return ret;
+
+	/* largest post-power-on pre-reset-deassert delay seen among drivers */
+	msleep(500);
+
+	return 0;
+}
+
+static void i2c_of_probe_disable_regulators(struct i2c_of_probe_data *data)
+{
+	regulator_bulk_disable(data->regulators_num, data->regulators);
+}
+
 static struct device_node *i2c_of_probe_get_i2c_node(struct device *dev, const char *type)
 {
 	struct device_node *node __free(device_node) = of_find_node_by_name(NULL, type);
@@ -110,6 +195,7 @@ static int i2c_of_probe_enable_node(struct device *dev, struct device_node *node
 int i2c_of_probe_component(struct device *dev, const char *type)
 {
 	struct i2c_adapter *i2c;
+	struct i2c_of_probe_data probe_data = {0};
 	int ret;
 
 	struct device_node *i2c_node __free(device_node) = i2c_of_probe_get_i2c_node(dev, type);
@@ -133,6 +219,30 @@ int i2c_of_probe_component(struct device *dev, const char *type)
 	if (!i2c)
 		return dev_err_probe(dev, -EPROBE_DEFER, "Couldn't get I2C adapter\n");
 
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
 	for_each_child_of_node_scoped(i2c_node, node) {
 		union i2c_smbus_data data;
@@ -150,6 +260,8 @@ int i2c_of_probe_component(struct device *dev, const char *type)
 		break;
 	}
 
+	i2c_of_probe_disable_regulators(&probe_data);
+	i2c_of_probe_free_res(&probe_data);
 	i2c_put_adapter(i2c);
 
 	return ret;
-- 
2.46.0.184.g6999bdac58-goog


