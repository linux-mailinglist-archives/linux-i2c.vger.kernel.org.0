Return-Path: <linux-i2c+bounces-5650-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A797D95B16B
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 11:22:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15A73B20F21
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 09:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C271183CAF;
	Thu, 22 Aug 2024 09:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D3bNgzNz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D73181B8F
	for <linux-i2c@vger.kernel.org>; Thu, 22 Aug 2024 09:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724318433; cv=none; b=I9jqtruHSLAE3WWPrelqQc2/aXaZRXKIhweI1yj3lditFP4wBSCeqe0ZJ1bn6vakA5MXVlLhXS+X9ilLWkK6/T6BlAr2FsYb/GrASrGk7lrwPChFyjx0lkTK6gTfc3wrd5GC0cjMpnvfwjn0kYrpTEl4AEdpbaocb8wjv9lsZf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724318433; c=relaxed/simple;
	bh=F4P2nmGS6A9jyMX3gZMS4FBUKJs6ahBUb0pWZbTHLOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VIit17IYExzkGqbuRJNfjd21SczQl53NGuPDkupZP6IEwJF9VxLbH+FfE3ShP/YhJuJ+q7XtEwB0lL3liRrQzYy3NmdTu0N7Vb3OmoXrZjOmDOsRmHrUSvdWVh4aCueyxQQJ6f6cRdrqQBVp0A9ISls/MoUL9CwWQQFRHXHD+W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=D3bNgzNz; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-714226888dfso519780b3a.1
        for <linux-i2c@vger.kernel.org>; Thu, 22 Aug 2024 02:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1724318432; x=1724923232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQ/ais/DnW2DhkO42fRSNxxKCNt0O583PTfpQXJv2Js=;
        b=D3bNgzNzAG+WeGXfqA9KQXemJQsFfydskP0dW0Xzx2f+K+b3fSXM3u/dphwUnivZsf
         MogL86NL5kXlIyWcZyE2PoNbj8cFAmRrRH6XgTmTbdEVKfoyPfjMcZT6sSkyCMrxVj7P
         kTIhEK/DkD3becfGZEdV8QbVCoaE3vr0Oa/yc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724318432; x=1724923232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dQ/ais/DnW2DhkO42fRSNxxKCNt0O583PTfpQXJv2Js=;
        b=t5c1hLix5dZcj9ad7u9Y56qRDitEw7rA6EWagX6nc1DPbVdXeyMn9WVUnsOAVRjDgh
         CG2BIL0fubgdhoYJLPzq2YVIDRMpfOsY/YGseUezgO1bksH3inHNWoQoelYPqPfbHgpy
         anTK5TLMvD54xfGUNLaE15SD3xIxJjz5/5JWAx4KwqVCHu1nv8pq2Hia+yBYRPG3y0kK
         rMRdPFPbDx6RRneeYxUEVS2DsGFCLysAfr60b3VKEDXBqB9BczGbeDwVx69sgMbYswcw
         CEU8Hi1lThr5ithWMOuW0TaOTVRRpa5EvqROUOWYEoGqYI1hk1NWAIEVRMAqIuapjf5p
         ilww==
X-Forwarded-Encrypted: i=1; AJvYcCWC0SCxa8c3Z3+VYv5TLh9b3mLhoFfmM8KNkfwyh3abbJyL8LhbNVQOaB3BbnRNiDLJDhyZ0l8TOG4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yymq/ZZRZtfbGBFurWJJHBTMeQMGdvomHPte9ot3yeP4KZ5yCnS
	APViyw4uGuG3WRijLLoZkwCulCDIP8F1ui0/TGcuG+ktby9sJaovUj44O37wCQ==
X-Google-Smtp-Source: AGHT+IHNX1mTbdGkDuNm269HAAWFLZMuunhBrLdO555YXJUIWEo+jUShOHk7j43VZg4OPf7/Roe+/g==
X-Received: by 2002:a05:6a21:398c:b0:1c6:f9ea:f2df with SMTP id adf61e73a8af0-1cad7f89598mr5999512637.12.1724318431795;
        Thu, 22 Aug 2024 02:20:31 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:8470:6a67:8877:ce2c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71434335e69sm951398b3a.194.2024.08.22.02.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 02:20:31 -0700 (PDT)
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
Subject: [PATCH v5 03/10] regulator: Split up _regulator_get()
Date: Thu, 22 Aug 2024 17:19:56 +0800
Message-ID: <20240822092006.3134096-4-wenst@chromium.org>
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

_regulator_get() contains a lot of common code doing checks prior to the
regulator lookup and housekeeping work after the lookup. Almost all the
code could be shared with a OF-specific variant of _regulator_get().

Split out the common parts so that they can be reused. The OF-specific
version of _regulator_get() will be added in a subsequent patch.
No functional changes were made.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v4:
- New patch
---
 drivers/regulator/core.c     | 54 ++++++++++++++++++++++++++++--------
 drivers/regulator/internal.h |  4 +++
 2 files changed, 47 insertions(+), 11 deletions(-)

diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
index 361309fcae57..4d1c640cc030 100644
--- a/drivers/regulator/core.c
+++ b/drivers/regulator/core.c
@@ -2093,26 +2093,43 @@ static int regulator_resolve_supply(struct regulator_dev *rdev)
 	return ret;
 }
 
-/* Internal regulator request function */
-struct regulator *_regulator_get(struct device *dev, const char *id,
-				 enum regulator_get_type get_type)
+/* common pre-checks for regulator requests */
+int _regulator_get_common_check(struct device *dev, const char *id,
+				enum regulator_get_type get_type)
 {
-	struct regulator_dev *rdev;
-	struct regulator *regulator;
-	struct device_link *link;
-	int ret;
-
 	if (get_type >= MAX_GET_TYPE) {
 		dev_err(dev, "invalid type %d in %s\n", get_type, __func__);
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 	}
 
 	if (id == NULL) {
 		dev_err(dev, "regulator request with no identifier\n");
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 	}
 
-	rdev = regulator_dev_lookup(dev, id);
+	return 0;
+}
+
+/**
+ * _regulator_get_common - Common code for regulator requests
+ * @rdev: regulator device pointer as returned by *regulator_dev_lookup()
+ *       Its reference count is expected to have been incremented.
+ * @dev: device used for dev_printk messages
+ * @id: Supply name or regulator ID
+ * @get_type: enum regulator_get_type value corresponding to type of request
+ *
+ * Returns a struct regulator corresponding to @rdev,
+ * or IS_ERR() condition containing errno.
+ *
+ * This function should be chained with *regulator_dev_lookup() functions.
+ */
+struct regulator *_regulator_get_common(struct regulator_dev *rdev, struct device *dev,
+					const char *id, enum regulator_get_type get_type)
+{
+	struct regulator *regulator;
+	struct device_link *link;
+	int ret;
+
 	if (IS_ERR(rdev)) {
 		ret = PTR_ERR(rdev);
 
@@ -2228,6 +2245,21 @@ struct regulator *_regulator_get(struct device *dev, const char *id,
 	return regulator;
 }
 
+/* Internal regulator request function */
+struct regulator *_regulator_get(struct device *dev, const char *id,
+				 enum regulator_get_type get_type)
+{
+	struct regulator_dev *rdev;
+	int ret;
+
+	ret = _regulator_get_common_check(dev, id, get_type);
+	if (ret)
+		return ERR_PTR(ret);
+
+	rdev = regulator_dev_lookup(dev, id);
+	return _regulator_get_common(rdev, dev, id, get_type);
+}
+
 /**
  * regulator_get - lookup and obtain a reference to a regulator.
  * @dev: device for regulator "consumer"
diff --git a/drivers/regulator/internal.h b/drivers/regulator/internal.h
index ffeaef22169e..3718459fb0c5 100644
--- a/drivers/regulator/internal.h
+++ b/drivers/regulator/internal.h
@@ -121,6 +121,10 @@ enum regulator_get_type {
 	MAX_GET_TYPE
 };
 
+int _regulator_get_common_check(struct device *dev, const char *id,
+				enum regulator_get_type get_type);
+struct regulator *_regulator_get_common(struct regulator_dev *rdev, struct device *dev,
+					const char *id, enum regulator_get_type get_type);
 struct regulator *_regulator_get(struct device *dev, const char *id,
 				 enum regulator_get_type get_type);
 int _regulator_bulk_get(struct device *dev, int num_consumers,
-- 
2.46.0.184.g6999bdac58-goog


