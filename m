Return-Path: <linux-i2c+bounces-5267-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0686494D3A3
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 17:36:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 642BA1C21F25
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 15:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A1B81991AF;
	Fri,  9 Aug 2024 15:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="S2Inyd01"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEF89198E84;
	Fri,  9 Aug 2024 15:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723217752; cv=none; b=CdtP+v8FI6WwnZefuy5pBIPxXZ2lQ77nQsZNatM+V0Fn4PnQ1c3cL/nEjAOtiBq7LIixyo36cF5+JSt+eRQ79YKKpZeM9/jlPW+ibSzKFK2r2+mWrJPepDpEMs1jvejkZCQ+1QsBpyKkgTG2HGz3KuqqtH0zyks6jQn5DpZc2kQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723217752; c=relaxed/simple;
	bh=MLOaxPEP3Zqbbf/WvgKa4cI7Ix3Cs4Kcr+9he5X7UMg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ov88V5c3lvWBGcVMU7J07Qj+vPQvekkQ6qUSOyZ767REXkZh+U3rb1KNT/5ONU6MfV7Jp2LR0UT4EJj0MdC6xjLQO0nSZuyHpuvJLWTfCm65sD7+2ziH/HFH+ipDWV+lwtWzHGeMAMcZpr1Ly1mZHOSEiRq4vCfzedCOpV6UpHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=S2Inyd01; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74A4EC0002;
	Fri,  9 Aug 2024 15:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1723217742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g23z6Hbo0SgdTOHbizvWXJiLCoM2XaylyRrnPRhOxGk=;
	b=S2Inyd01LRcPT1SHqYsJclO17CgYAuRLfxLPQrCp5GuYFF04jFjYmEldcLmyByturxKLhT
	Yq43FbKjiRdqFKKSc8fzoyQyoTByUB3GKq51hX2ENHnKThHH7TuCHkqDyg71r/My5EiKIy
	N1iHpFgsUpyfnI/rvBwEs4hTpiU8M7Z2owWRjsa8kijxDr50c/8/iE4e5qowZfwZ5h1UJ5
	ClJL3veSaT2b1Hm0zO0vReYlOMwSrhH6F7DoIUv6JO2c0k3O2r4jfXQ/rPIGc3cQKAO7h+
	kkvuH39HjiYP6quUz7LRLnAJmfFi+qTnASW8kK4cbvj2dsgpO/KE6zHT6XFgmA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 09 Aug 2024 17:34:50 +0200
Subject: [PATCH v3 2/7] drm/bridge: add bridge notifier to be notified of
 bridge addition and removal
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240809-hotplug-drm-bridge-v3-2-b4c178380bc9@bootlin.com>
References: <20240809-hotplug-drm-bridge-v3-0-b4c178380bc9@bootlin.com>
In-Reply-To: <20240809-hotplug-drm-bridge-v3-0-b4c178380bc9@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Derek Kiernan <derek.kiernan@amd.com>, 
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Paul Kocialkowski <contact@paulk.fr>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-i2c@vger.kernel.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.0
X-GND-Sasl: luca.ceresoli@bootlin.com

From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

In preparation for allowing bridges to be added to and removed from a DRM
card without destroying the whole card, add a DRM bridge notifier. Notified
events are addition and removal to/from the global bridge list.

Co-developed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

---

Changes in v3: none
Changes in v2: none
---
 drivers/gpu/drm/drm_bridge.c | 35 +++++++++++++++++++++++++++++++++++
 include/drm/drm_bridge.h     | 19 +++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index d44f055dbe3e..0728a4e0cbfd 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -25,6 +25,7 @@
 #include <linux/media-bus-format.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
+#include <linux/notifier.h>
 
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
@@ -197,6 +198,36 @@
 
 static DEFINE_MUTEX(bridge_lock);
 static LIST_HEAD(bridge_list);
+static BLOCKING_NOTIFIER_HEAD(bridge_notifier);
+
+/**
+ * drm_bridge_notifier_register - add a DRM bridge notifier
+ * @nb: the notifier block to be registered
+ *
+ * The notifier block will be notified of events defined in
+ * &drm_bridge_notifier_event
+ */
+int drm_bridge_notifier_register(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&bridge_notifier, nb);
+}
+EXPORT_SYMBOL(drm_bridge_notifier_register);
+
+/**
+ * drm_bridge_notifier_unregister - remove a DRM bridge notifier
+ * @nb: the notifier block to be unregistered
+ */
+int drm_bridge_notifier_unregister(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&bridge_notifier, nb);
+}
+EXPORT_SYMBOL(drm_bridge_notifier_unregister);
+
+static void drm_bridge_notifier_notify(unsigned long event,
+				       struct drm_bridge *bridge)
+{
+	blocking_notifier_call_chain(&bridge_notifier, event, bridge);
+}
 
 /**
  * drm_bridge_add - add the given bridge to the global bridge list
@@ -210,6 +241,8 @@ void drm_bridge_add(struct drm_bridge *bridge)
 	mutex_lock(&bridge_lock);
 	list_add_tail(&bridge->list, &bridge_list);
 	mutex_unlock(&bridge_lock);
+
+	drm_bridge_notifier_notify(DRM_BRIDGE_NOTIFY_ADD, bridge);
 }
 EXPORT_SYMBOL(drm_bridge_add);
 
@@ -243,6 +276,8 @@ EXPORT_SYMBOL(devm_drm_bridge_add);
  */
 void drm_bridge_remove(struct drm_bridge *bridge)
 {
+	drm_bridge_notifier_notify(DRM_BRIDGE_NOTIFY_REMOVE, bridge);
+
 	mutex_lock(&bridge_lock);
 	list_del_init(&bridge->list);
 	mutex_unlock(&bridge_lock);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 75019d16be64..3748c1011307 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -43,6 +43,22 @@ struct drm_panel;
 struct edid;
 struct i2c_adapter;
 
+/**
+ * enum drm_bridge_notifier_event - DRM bridge events
+ */
+enum drm_bridge_notifier_event {
+	/**
+	 * @DRM_BRIDGE_NOTIFY_ADD: A bridge has just been added to the
+	 * global bridge list. See drm_bridge_add().
+	 */
+	DRM_BRIDGE_NOTIFY_ADD,
+	/**
+	 * @DRM_BRIDGE_NOTIFY_REMOVE: A bridge is about to be removed from
+	 * the global bridge list. See drm_bridge_remove().
+	 */
+	DRM_BRIDGE_NOTIFY_REMOVE,
+};
+
 /**
  * enum drm_bridge_attach_flags - Flags for &drm_bridge_funcs.attach
  */
@@ -862,6 +878,9 @@ drm_priv_to_bridge(struct drm_private_obj *priv)
 	return container_of(priv, struct drm_bridge, base);
 }
 
+int drm_bridge_notifier_register(struct notifier_block *nb);
+int drm_bridge_notifier_unregister(struct notifier_block *nb);
+
 void drm_bridge_add(struct drm_bridge *bridge);
 int devm_drm_bridge_add(struct device *dev, struct drm_bridge *bridge);
 void drm_bridge_remove(struct drm_bridge *bridge);

-- 
2.34.1


