Return-Path: <linux-i2c+bounces-6123-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D02C96B5B8
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 11:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 615381C243E6
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 09:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9396A1CCEE6;
	Wed,  4 Sep 2024 09:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HEJoQ/3S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074B51CCED2
	for <linux-i2c@vger.kernel.org>; Wed,  4 Sep 2024 09:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725440429; cv=none; b=HO08wJvIgEJ4RGk/jWix6DVl3f/wQHK8Cm3yRt+GasBtQexGZ2fQnoNPVC7ERBg4qkTNQ6gXTIHgLljORzkPXiGtlqiVpz/14ABvyS+yHwqtdcBbK1HdPRSOj2aTjWrgiY0lRMR+NRRCMqVlS21EEvqWOBrBPsRE0MaPB2VA+SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725440429; c=relaxed/simple;
	bh=Aeu7pCFnO2BARKJiVMSEYiClHg8V79pM2noeL3Ikwhg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JIuorbb63fH1JM6MFqi+Ugy58XtgzNpAph/y4PHWcK2RPN9dIE4NkR25Hny7LJ3riQpFcgbEB0GPfRfCfufkYjBgWSiYU11XlqjERcvN2w+FDpiOivagRoHFKOkHQWaQZeOtw3QpeC0vbrRNSPcF1l+bWnFtLrbtmyZ/2W9jVRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HEJoQ/3S; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-71767ef16b3so1495640b3a.0
        for <linux-i2c@vger.kernel.org>; Wed, 04 Sep 2024 02:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725440427; x=1726045227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URewZP1CjuEapcOrKzsC3z8bnfBtBnJFc+7fenwYvsw=;
        b=HEJoQ/3St4tqzpLFHA7pmkThP05Xv+ePlQ17QePbLQk6QUcQGjm6KFqz7pwMe5uf83
         8yBnQcSVg41qkLCagWsKtTWan1ea5LKaxpi4ur3KCF0YpOStyx4LgYpLJZQnMX5NGCZA
         TkIN85ihaMnN1UPWJgxInVP6IwXbVhUjjG6hw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725440427; x=1726045227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URewZP1CjuEapcOrKzsC3z8bnfBtBnJFc+7fenwYvsw=;
        b=aOEdYksQF3Q9t5cySZcZAoTtc7Cy46nmBgiV3Sf0X7MR/IVn0fI/KHgsWtkht5ycWJ
         snXQEJEcalgZ/4f26w5R88z2ECbGtVeGDI5yesx98N/Bn4bMvZ/IW247yqwcE20H+S0E
         NxX7qJdbflhglH01JI2uTf271DvxoZesia0CdltEv2OsRPRpq4B23zssJgT9xjRgs93A
         Agj51NZREmbXcHylLk8KTkVRHG6XtlkfSkxxs7+ksQZli5QbbQNCeJE6/QwBwQVzOSoN
         21CmC+hMNfIbAZvUMFWpeedgT36XoEoRB05tgMdgKVu27BvkLgORHBv9wR/AsEu00DJA
         27Ig==
X-Forwarded-Encrypted: i=1; AJvYcCW7LeTon3bmCx/d7x5u85WQMHQ4Gooo9YJfVcibE6/QossA5jX3KWijzJ/OZZqmEE6uWvNL/1GtUzM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrB/KOqcTsViMdfDAYroZ+GsdeRPI2kNiRZEVkiwxIgAWEPCJD
	ddiO2vCxCzdVJ1FNeGqINm3kwFYAZVFOEEQ+db+EZs/IQG1jh74i2MJumYD7qA==
X-Google-Smtp-Source: AGHT+IHf+4oWltICBIad0flKpZyWzPtxz5hqcWd60IFNv00gyZa3rQlflgcNL2YbqnsGxF7j26kYgg==
X-Received: by 2002:a05:6a00:2d05:b0:70a:f65e:b13d with SMTP id d2e1a72fcca58-717449c6427mr11999072b3a.27.1725440426991;
        Wed, 04 Sep 2024 02:00:26 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:83fc:5c8e:13bd:d165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-717785b5183sm1153279b3a.197.2024.09.04.02.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 02:00:26 -0700 (PDT)
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
Subject: [PATCH v6 01/12] of: dynamic: Add of_changeset_update_prop_string
Date: Wed,  4 Sep 2024 17:00:03 +0800
Message-ID: <20240904090016.2841572-2-wenst@chromium.org>
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

Add a helper function to add string property updates to an OF changeset.
This is similar to of_changeset_add_prop_string(), but instead of adding
the property (and failing if it exists), it will update the property.

This shall be used later in the DT hardware prober.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes since v5:
- Collected Rob's tag

Changes since v4:
- Use modern designated initializer for |prop|

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
index 110104a936d9..daa69d160a78 100644
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
+	struct property prop = {
+		.name = (char *)prop_name,
+		.length = strlen(str) + 1,
+		.value = (void *)str,
+	};
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
2.46.0.469.g59c65b2a67-goog


