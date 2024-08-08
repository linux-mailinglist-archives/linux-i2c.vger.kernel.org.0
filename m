Return-Path: <linux-i2c+bounces-5210-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB6294BA47
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 12:00:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33AF0B2235B
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Aug 2024 10:00:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2090189F48;
	Thu,  8 Aug 2024 09:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Tt4CwuI3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B053189F4B
	for <linux-i2c@vger.kernel.org>; Thu,  8 Aug 2024 09:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723111189; cv=none; b=tgvy0+JPPbwZPc+vF3Tw1BFdAckrkATMqX+mMNi/PaYpUJmey+kcgh8V7ncuNWhaqg8scjn97CHiwhbgkhGm+XhvjbrZ3f2/c4owX8qlqT9My7/+JFujcZfXiwsvlqxvPZ2+gYSuraBXempQONV/rbATELu7u3/flTgRiUmDCWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723111189; c=relaxed/simple;
	bh=H0FOBfwEBWtywgtjSA1F4rTZQ5wzYjAwhkmuhYnKTxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zwg1wPW1Pzck0mrTdUSc9Uu7XpkPHdFx/cIolLvjKnht24WNPmSvbt1NuKK7rSuiO2GsqHnqKpM3JPsNE1WKy9pjtWnPXZZe1237N7Nlp7S/x47gFNHip+ENvDje9g23xcDzIysaiABV52oxay+zrgm/mu2f7LVAWuyAHbHcnfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Tt4CwuI3; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1fc49c0aaffso7231295ad.3
        for <linux-i2c@vger.kernel.org>; Thu, 08 Aug 2024 02:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1723111187; x=1723715987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lnHNs8RGUpugUdHA2OImjbnnj6+rNsZeKGSTnE9NGbI=;
        b=Tt4CwuI3e8oN6dUEd+n31G+e7XjDnOQpWPt8+RZFq7ifVeVuXJovOlSoXwLBreNhSy
         lfy7WZup8Ouyfz5nMB8epJAGwTzqEHzLgqEUHFu/DAMtjrrl7RUVgls2if1XAtxoAFn8
         HPCSN3+Wd2IVAIwMSSO+b7X0O2sbWsrns/EhM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723111187; x=1723715987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lnHNs8RGUpugUdHA2OImjbnnj6+rNsZeKGSTnE9NGbI=;
        b=jjc4iy1XnqTD402x5iHdbIunvaGdO/SFtqMSoO8cYgf2j4BQ2q0/gtjTUe3AYH9gMt
         TGvStgW/MKk4QlvX6I8BpzGLP1Bz0V5PM3ZvVM2yMFfiAADu3kHER3Vy/hxwVIIwnGo5
         0twxh7JWX4yPzQO8I4hDTyUtuo2BppwV210M0eEtXyBSBJaUskX6edUaCD4RkU7MCMKe
         tQrtCz5sg3F1tUefGyz72Wf8hz4MCKUO2e51MctFeOrjTNrLmfC7Pv7+HmIs3QXW5aXz
         kg1Zr9crRvag0u4TmM9dtghFTg1zF8GVLSUiw1nDhE2ps2t7yUwBMEEdhKSjrb7Fz6T/
         FT4g==
X-Forwarded-Encrypted: i=1; AJvYcCXg/kXU2AHs5zPMiT4p0JWFAIy+V/Bqrc++1W0W3v7293eJXb/Y41RDWPf2bI2+QHogYg/pr1//ZWNpHUBiz64ZKJuD3WJ03X5y
X-Gm-Message-State: AOJu0YwWw0GNCpAF6In1lEFs4aHUzg2Rp0QcMu6xZ9TjqZzobaT1D54y
	tHf2/mlIKaKD7RCkWNfxRf/RuXznPg1LnT9LPJJ0MpavJO5g/gJiR0b0RUcWMCrcpWpkttKB6LI
	=
X-Google-Smtp-Source: AGHT+IFIftWwmlbWRkGBzfDMk0j7k5O8rm8KVgSziXqkMdFzRmZhlp6LCbkz+1PDSOvY9LkVZKP1dQ==
X-Received: by 2002:a17:902:ec8c:b0:1fd:9c2d:2f27 with SMTP id d9443c01a7336-2009524a0edmr15321085ad.24.1723111187412;
        Thu, 08 Aug 2024 02:59:47 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8b53:87e6:914:a00d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ff59297707sm120784985ad.254.2024.08.08.02.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Aug 2024 02:59:47 -0700 (PDT)
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
Subject: [PATCH v4 1/6] of: dynamic: Add of_changeset_update_prop_string
Date: Thu,  8 Aug 2024 17:59:24 +0800
Message-ID: <20240808095931.2649657-2-wenst@chromium.org>
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

Add a helper function to add string property updates to an OF changeset.
This is similar to of_changeset_add_prop_string(), but instead of adding
the property (and failing if it exists), it will update the property.

This shall be used later in the DT hardware prober.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---

Changes since v3:
- Use new __of_prop_free() helper
- Add new line before header declaration

Changes since v2:
- New patch added in v3
---
 drivers/of/dynamic.c | 44 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of.h   |  4 ++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index 110104a936d9..dfd1358d59d5 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -1072,3 +1072,47 @@ int of_changeset_add_prop_bool(struct of_changeset *ocs, struct device_node *np,
 	return of_changeset_add_prop_helper(ocs, np, &prop);
 }
 EXPORT_SYMBOL_GPL(of_changeset_add_prop_bool);
+
+static int of_changeset_update_prop_helper(struct of_changeset *ocs,
+					   struct device_node *np,
+					   const struct property *pp)
+{
+	struct property *new_pp;
+	int ret;
+
+	new_pp = __of_prop_dup(pp, GFP_KERNEL);
+	if (!new_pp)
+		return -ENOMEM;
+
+	ret = of_changeset_update_property(ocs, np, new_pp);
+	if (ret)
+		__of_prop_free(new_pp);
+
+	return ret;
+}
+
+/**
+ * of_changeset_update_prop_string - Add a string property update to a changeset
+ *
+ * @ocs:	changeset pointer
+ * @np:		device node pointer
+ * @prop_name:	name of the property to be updated
+ * @str:	pointer to null terminated string
+ *
+ * Create a string property to be updated and add it to a changeset.
+ *
+ * Return: 0 on success, a negative error value in case of an error.
+ */
+int of_changeset_update_prop_string(struct of_changeset *ocs,
+				    struct device_node *np,
+				    const char *prop_name, const char *str)
+{
+	struct property prop;
+
+	prop.name = (char *)prop_name;
+	prop.length = strlen(str) + 1;
+	prop.value = (void *)str;
+
+	return of_changeset_update_prop_helper(ocs, np, &prop);
+}
+EXPORT_SYMBOL_GPL(of_changeset_update_prop_string);
diff --git a/include/linux/of.h b/include/linux/of.h
index 85b60ac9eec5..046283be1cd3 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -1651,6 +1651,10 @@ static inline int of_changeset_add_prop_u32(struct of_changeset *ocs,
 	return of_changeset_add_prop_u32_array(ocs, np, prop_name, &val, 1);
 }
 
+int of_changeset_update_prop_string(struct of_changeset *ocs,
+				    struct device_node *np,
+				    const char *prop_name, const char *str);
+
 int of_changeset_add_prop_bool(struct of_changeset *ocs, struct device_node *np,
 			       const char *prop_name);
 
-- 
2.46.0.rc2.264.g509ed76dc8-goog


