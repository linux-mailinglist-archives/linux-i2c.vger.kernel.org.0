Return-Path: <linux-i2c+bounces-7827-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FECE9BE29C
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 10:34:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBE5F1F2521D
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 09:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838D61DB34E;
	Wed,  6 Nov 2024 09:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ggpLwaxS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7711DA618
	for <linux-i2c@vger.kernel.org>; Wed,  6 Nov 2024 09:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730885651; cv=none; b=kTJbEjCOha7UHVXBrWXF8pAv7MBxMFAEkQf7J7i5k69+l6S7rrwl+TTfY98F3WSB1pj72wQEAMpVM5ntarcs8YLWs8fYtY+GuCSwVoyUUlVSrXvJp9fBl2zt6OyxQoVvbjx+EKFrcJW1/OEv7kvIz2HqkioD7TozpwIUV6bz2KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730885651; c=relaxed/simple;
	bh=Zz2M0sneWoPuGkYkdOhI3CuKEUZZTQY3lZ2/MbU5e84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hdwtI9m5mYojQPhlc+bcSYtUBTvnEubpLk9JeW0gD/HHPDKEx2GeHyk9KBcgW5Iy52qWIw8OIyFyhLCO+OR/j5tMzHqy1iS7Rtxbuu4U1IwgCuRbMS0zltHoE8dRF/FABAn9X+XDqQP85BCFAVveTvgNQd4Ab5SqJHfJaYU6AHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ggpLwaxS; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20bb39d97d1so62180755ad.2
        for <linux-i2c@vger.kernel.org>; Wed, 06 Nov 2024 01:34:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730885649; x=1731490449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=llYngkqgiFGTwpRX3D7wCxxqCsKOgB9wOxApc/ic0J8=;
        b=ggpLwaxSNqJ6WyfhBTQtUArmNcyxPQaoUBaQScnnuUI+4VF2zsEqIrg1EkE3IMRQ3+
         cnyo4ZYbRCgGhvGtbSkKDotw4mQaZ9DZtSLKH19KibZN5V8hI1yVnHATX16yW1NoicHF
         gxlejT5I9bjdZ7CnaFP3QI85WI4OpkbDJXU04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730885649; x=1731490449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=llYngkqgiFGTwpRX3D7wCxxqCsKOgB9wOxApc/ic0J8=;
        b=sHnVy5XG+4v0zur8c1ZdjqLUE8tXp5cK08FlNtaS+xamavM5BtFNAtc7nippLOj+sN
         u4PPnbVjLkruDoHWswVL6C30Lh/sCMO8l01FzDb3OhKxhwH1CmD34y6Ajs7DChuC8/EY
         WUXp+6Jy3983kQafetvMGQWNXj/vAaHs8uduLyIJAQdjiN1GI4/m8fHAial3Wd8CUcSY
         65wKI0VhznnXcymwqnIY33IxQrsfw9W7nC2SL6FdJr4zqpgCI+0iA5L1yBEQKmQDbSte
         psuZVJAkk0i/ah66xwYWOc63wZlPcFy9jylUlnfznhJWas/pVIQ//aHkwIUrbsmUUgdd
         QtGA==
X-Forwarded-Encrypted: i=1; AJvYcCX0nzPI5/o2RhJWstcd5nuML9Wk46cMagD/80fOB1SfcvWt65toJW2xJuQ6WbeA/nFO95Lhg2CRvjE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMEmzgh6iCEI6kd1juQyeavOcu+47LicnGu8OTyBl86Xn2u+tE
	VuElP6s7DahpNz5JxynLREtLPtx4lSRHgeHnIrGo83+dhNF377FC9sWHkxmIfQ==
X-Google-Smtp-Source: AGHT+IHKOHXdDAUgO9QjYpvJtulYfjKvmKS2PsJrrTevb2UOA/ICT/NZEufa/1uemsVqPCJNroTu4g==
X-Received: by 2002:a17:903:230d:b0:20b:7731:e3df with SMTP id d9443c01a7336-210f76d6780mr400638435ad.43.1730885649028;
        Wed, 06 Nov 2024 01:34:09 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:93fe:1d68:b50:3213])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-211057062b8sm91478665ad.63.2024.11.06.01.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:34:08 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	chrome-platform@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Johan Hovold <johan@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: [PATCH v11 1/7] of: dynamic: Add of_changeset_update_prop_string
Date: Wed,  6 Nov 2024 17:33:28 +0800
Message-ID: <20241106093335.1582205-2-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
In-Reply-To: <20241106093335.1582205-1-wenst@chromium.org>
References: <20241106093335.1582205-1-wenst@chromium.org>
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
Changes since v7:
none

Changes since v6:
none

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
index d45a8df61380..0aba760f7577 100644
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
index 086a60f3b8a6..d0307e3b093d 100644
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
2.47.0.199.ga7371fff76-goog


