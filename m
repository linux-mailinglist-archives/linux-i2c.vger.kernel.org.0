Return-Path: <linux-i2c+bounces-6124-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AE796B5BD
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 11:01:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 687F62857DC
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 09:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C9891CEE83;
	Wed,  4 Sep 2024 09:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WOIfX3hj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADFE31CEE80
	for <linux-i2c@vger.kernel.org>; Wed,  4 Sep 2024 09:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725440434; cv=none; b=NCzsTU4On0nH23zZMZcIUXOfVPRTgqeei6ktzfb6PpAHQcgv+xq//TaYIqv+5xcgv2PLgNgJ7dtat+lwfCyAY3lmKVYNQHk7qqRArKaQR+erDVLLeRy8y5Wch5eHmWsH22TUVhoqEgpBMKKp9Nq01ZdMCEdx65ZT0nmKxGO7KkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725440434; c=relaxed/simple;
	bh=GK2iV7hMvsjSokJ5lrwH0JIQORr559M1Qg4L1f7m7ec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hVXhFR9Gshs2B6g4fyDr+jSJbbDVrarmMCxDnzudxEND39vhnLox0vFPKGY4Udic098Yxn31jnayxMSycbLPTb18TJABJaINHXIc5ekv1E1d3nw4RaoZoO3LkjEoH2fD+axmwHGq16qjmZeB19Hq4y3UWdnJ23rCVj/y3/oObOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WOIfX3hj; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-717849c0dcaso17767b3a.3
        for <linux-i2c@vger.kernel.org>; Wed, 04 Sep 2024 02:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725440432; x=1726045232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2M921d4gJ85snm6ehV18l9ZU1Po4pieq34BYMUnhsNU=;
        b=WOIfX3hjDg/B6nOWJFqswDzkv7RJSVszP3PIL9DHoaFqKV5rLQRNtrECXlXT2HoxwS
         eJg0sBYagroXd4yEeAofcZC3h/Ncp58ACaS8xXhwKD10S5B0z5vxjBRTibKTmn98yoYB
         s088umVKcgwYX9w+HHCqAW7EtzgUa+qeVl8sc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725440432; x=1726045232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2M921d4gJ85snm6ehV18l9ZU1Po4pieq34BYMUnhsNU=;
        b=g+7rBaQUaJjDUa2EnLTe6QbHE3VRTjjs/q8cmrXdhlWD+Yw2HnKe2BhHiVkr6IpZZM
         DcJqjSa6vz7e5WK/hY7eU3oH1xB7catP/di1V0sC4IssNfZdq1m58cm+xKGtjAeNew6L
         5HVddgKUQpmeQZXU97hbo3AXMfNwTA0/ME41eDvLDOQ1hNeHZCKbVJu0szsn/ehjO3zG
         sc0FjxHDGWpn7wP86tAetdMTJlm0YsXTYPu5Rvu7irScFP31D/Bk5tPQ1fLSi8auMtJg
         1L/XNQwkgIxFDV9kX84RdG1LvdeWgRK6jGPX/sHf4c/UQPtBZk0rzbXaLfCW2C5UUdb1
         eekg==
X-Forwarded-Encrypted: i=1; AJvYcCVW5011VIAoutzfs8QxA7K6339kO9TLUxBZMtGDpUN7resvCqbfdzvOoueHp8isARMuq058EXI85RM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBWs39SVKtv+rxPXWRqhEYsNke92zlSomVUnl9u7G6yzsB7hMz
	KvfCWrYczFc8PK9gDSq5Abj04P+wVEAgyQ+QBAw0XUywnluIDjZXvQ84B4eWzA==
X-Google-Smtp-Source: AGHT+IF/MVW4wrOQrl8cYkGW2jFbuYY69p3WFoLB5FjxApHmcb1+fCtPnl3w/uoQeTGzo0ajB2S9PQ==
X-Received: by 2002:a05:6a00:66d9:b0:710:e4db:a6fc with SMTP id d2e1a72fcca58-7173b6b63demr14365184b3a.27.1725440430497;
        Wed, 04 Sep 2024 02:00:30 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:83fc:5c8e:13bd:d165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-717785b5183sm1153279b3a.197.2024.09.04.02.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 02:00:30 -0700 (PDT)
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
Subject: [PATCH v6 02/12] of: base: Add for_each_child_of_node_with_prefix_scoped()
Date: Wed,  4 Sep 2024 17:00:04 +0800
Message-ID: <20240904090016.2841572-3-wenst@chromium.org>
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

There are cases where drivers would go through child device nodes and
operate on only the ones whose node name starts with a given prefix.

Provide a helper for these users. This will mainly be used in a
subsequent patch that implements a hardware component prober for I2C
busses.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- New patch
---
 drivers/of/base.c  | 35 +++++++++++++++++++++++++++++++++++
 include/linux/of.h |  9 +++++++++
 2 files changed, 44 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 20603d3c9931..d3c123b3261a 100644
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
index 046283be1cd3..acc0d5b98417 100644
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
 
+#define for_each_child_of_node_with_prefix_scoped(parent, child, prefix) \
+	for (struct device_node *child __free(device_node) =		\
+	     of_get_next_child_with_prefix(parent, NULL, prefix);	\
+	     child != NULL;						\
+	     child = of_get_next_child_with_prefix(parent, child, prefix))
+
 #define for_each_available_child_of_node(parent, child) \
 	for (child = of_get_next_available_child(parent, NULL); child != NULL; \
 	     child = of_get_next_available_child(parent, child))
-- 
2.46.0.469.g59c65b2a67-goog


