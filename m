Return-Path: <linux-i2c+bounces-7660-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 39B2F9B5CD0
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Oct 2024 08:23:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B27A81F234C0
	for <lists+linux-i2c@lfdr.de>; Wed, 30 Oct 2024 07:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 988701DFE0C;
	Wed, 30 Oct 2024 07:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SoJ0308w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670D31DFE0D
	for <linux-i2c@vger.kernel.org>; Wed, 30 Oct 2024 07:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730272965; cv=none; b=QiOvIlH5nL5K2s9r0DIlFD2zzLvK+uygf0rLBiTKln7VjBZOSkicZRBfHl6+SfNX5NuwqKBD881x0MUyXwu2Rk2v5HTOTsWMdcmOESVw+AdU8/upaW+tHQXJZNVD9rxmYu+UFrI5hyhhAqa73WG3UzMtF4TY+M2U8wO+XthDPmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730272965; c=relaxed/simple;
	bh=5HbNmM15Ciz+FM9FgNON9FcrIrEEFgqdv7ZqNfQlbvc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HSPRbKuJ/W7SVqLUHSxNi5SzwDrn3Jml2XZCXfc2IGQAa9dQd7qcN6xcVa8FHkCoianlpXWx++7+MOtEhCUHgpwslOf3eT4wQz5/uctw6z/jhwdQ5fVajfDcSM6J47FhcSK8VoSiGgBr0OJC/CnQkVOg2U1GUblR/u8wHKHZgKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SoJ0308w; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20cd76c513cso58367875ad.3
        for <linux-i2c@vger.kernel.org>; Wed, 30 Oct 2024 00:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730272963; x=1730877763; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=02I89/A9qYtjldvjbyC2sOJfVnDSFABqZCnk6WuuKr0=;
        b=SoJ0308wk+PiA2ATfjzFTSuS7V64BTX98UOuhC/6ndJTTYIHLGupcxsTfpguCerOpM
         ZnRRcA5KfImd3+Y9MeTPOvO8LOWJ86L+hIQdWlf7GMyyKL39NtJEWGVGgdAigJrIMYxu
         /gBZzI7U9sMu8/N9AykAOWGSDzLKCmxNnMICQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730272963; x=1730877763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=02I89/A9qYtjldvjbyC2sOJfVnDSFABqZCnk6WuuKr0=;
        b=JvC1XJJK+XVNPJTWS8Uuv9MKcgP65UtqUDegn6/r4GvPQGsxQiE1ad4cpmup/77DxB
         bhogI1M8xzaB3A/DvYs5MvoF215zk6kn9L189e5eDhX/4+CKmAx/aRkrg+FWznYy0ICV
         eYgJLRnNai3VxL+o7XrTjVACKkdz9ERVzbRhWbRXN3RCGIOk64mOJptuEjv8alWHy57C
         AsS8Gwxl6r+erumI6O4kxLZI+/0IDDtI68H3N4UnFL/sBsbBW35Fhj+TNcs6YvW+7WEg
         sXIDBTut73EDBPdsFXVzfENlIPcdq/ROWafcYZKOtIVWgaoH/gNPGezqxmR7gyTu3w97
         AHng==
X-Forwarded-Encrypted: i=1; AJvYcCXXUZ+rQwG3F0UQtBY7EqcTl6gJ4idBpGodugEAX2vfAtFxAjMMg5HLAhahNMIZ6CUjqZbwNsLMd2s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy2EW5UIG+GrmhgjZYXp5MIX8PF9PQObeg6FNfhRvsIr4LBHkn
	z1x0A0NOcEXMfhSQc0HAhHOQ9geSnCGDBx7aBZ4a/2Na8MHkRL20Aq8KtJHhQw==
X-Google-Smtp-Source: AGHT+IGRv+883MbPDyi2+STjJPcbXoBWTOIxB4iDvZKH1B5wRpkiQ+ZAYsXKMtOIPXpNfDDwdLlFAg==
X-Received: by 2002:a17:903:41c4:b0:20f:ab2e:14f9 with SMTP id d9443c01a7336-210f76ff17amr26213175ad.55.1730272962610;
        Wed, 30 Oct 2024 00:22:42 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:d1f3:aa64:657f:d8a8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02e67esm76641445ad.186.2024.10.30.00.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 00:22:42 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Wolfram Sang <wsa@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
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
	linux-i2c@vger.kernel.org
Subject: [PATCH v10 2/7] of: base: Add for_each_child_of_node_with_prefix()
Date: Wed, 30 Oct 2024 15:22:23 +0800
Message-ID: <20241030072229.1013235-3-wenst@chromium.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
In-Reply-To: <20241030072229.1013235-1-wenst@chromium.org>
References: <20241030072229.1013235-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are cases where drivers would go through child device nodes and
operate on only the ones whose node name starts with a given prefix.

Provide a helper for these users. This will mainly be used in a
subsequent patch that implements a hardware component prober for I2C
busses.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes since v7:
- Collected Rob's Reviewed-by
Changes since v6:
- Changed helper name to "for_each_child_of_node_with_prefix()"
Changes since v5:
- New patch
---
 drivers/of/base.c  | 35 +++++++++++++++++++++++++++++++++++
 include/linux/of.h |  9 +++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index d94efee4a7fc..a01e5534c2fd 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -628,6 +628,41 @@ struct device_node *of_get_next_child(const struct device_node *node,
 }
 EXPORT_SYMBOL(of_get_next_child);
 
+/**
+ * of_get_next_child_with_prefix - Find the next child node with prefix
+ * @node:	parent node
+ * @prev:	previous child of the parent node, or NULL to get first
+ *
+ * This function is like of_get_next_child(), except that it automatically
+ * skips any nodes whose name doesn't have the given prefix.
+ *
+ * Return: A node pointer with refcount incremented, use
+ * of_node_put() on it when done.
+ */
+struct device_node *of_get_next_child_with_prefix(const struct device_node *node,
+						  struct device_node *prev,
+						  const char *prefix)
+{
+	struct device_node *next;
+	unsigned long flags;
+
+	if (!node)
+		return NULL;
+
+	raw_spin_lock_irqsave(&devtree_lock, flags);
+	next = prev ? prev->sibling : node->child;
+	for (; next; next = next->sibling) {
+		if (!of_node_name_prefix(next, prefix))
+			continue;
+		if (of_node_get(next))
+			break;
+	}
+	of_node_put(prev);
+	raw_spin_unlock_irqrestore(&devtree_lock, flags);
+	return next;
+}
+EXPORT_SYMBOL(of_get_next_child_with_prefix);
+
 static struct device_node *of_get_next_status_child(const struct device_node *node,
 						    struct device_node *prev,
 						    bool (*checker)(const struct device_node *))
diff --git a/include/linux/of.h b/include/linux/of.h
index d0307e3b093d..f921786cb8ac 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -289,6 +289,9 @@ extern struct device_node *of_get_parent(const struct device_node *node);
 extern struct device_node *of_get_next_parent(struct device_node *node);
 extern struct device_node *of_get_next_child(const struct device_node *node,
 					     struct device_node *prev);
+extern struct device_node *of_get_next_child_with_prefix(const struct device_node *node,
+							 struct device_node *prev,
+							 const char *prefix);
 extern struct device_node *of_get_next_available_child(
 	const struct device_node *node, struct device_node *prev);
 extern struct device_node *of_get_next_reserved_child(
@@ -1468,6 +1471,12 @@ static inline int of_property_read_s32(const struct device_node *np,
 	     child != NULL;						\
 	     child = of_get_next_child(parent, child))
 
+#define for_each_child_of_node_with_prefix(parent, child, prefix)	\
+	for (struct device_node *child __free(device_node) =		\
+	     of_get_next_child_with_prefix(parent, NULL, prefix);	\
+	     child != NULL;						\
+	     child = of_get_next_child_with_prefix(parent, child, prefix))
+
 #define for_each_available_child_of_node(parent, child) \
 	for (child = of_get_next_available_child(parent, NULL); child != NULL; \
 	     child = of_get_next_available_child(parent, child))
-- 
2.47.0.163.g1226f6d8fa-goog


