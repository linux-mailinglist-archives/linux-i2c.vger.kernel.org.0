Return-Path: <linux-i2c+bounces-6396-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A80C971632
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 13:05:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 42D4C284EC1
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 11:05:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE7961B5327;
	Mon,  9 Sep 2024 11:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="EBK+HVwu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD351B3740
	for <linux-i2c@vger.kernel.org>; Mon,  9 Sep 2024 11:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879881; cv=none; b=ehR2uja0EAQMr5tqCFFf04Fb5TVNs58r7wirJXXiO5uRq5X1GWTMuhVr7MigpAooBqH2MSuTb7FAgDNfi0Zxh0uf6mRcqRUvx4HrYhPhiWFUDLlGeJIlStrTtEpdMZjf1jjwMlL9lmU3GpfvxW//rEZm9AzHGNx1Spz/36nHes8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879881; c=relaxed/simple;
	bh=zF6nNOLaWt6XkEDtLj/07rRlaDuazwntiZeBTXBPocM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZXIJnBGMcuupMOW89ylH57FCZ1pur6B6J/JutdrPYdWysVvTYjgRwhIGUG5S+h8SVU/j6gTYjL/0wqPBgNDCIP/Tfqo61deH6Lkka6P124LL/npYHgb3iX2rsvUAIQ5ARF1GwKoXnbH9tU+5F6yUmFxGa2wGyAxQCnEsKFL4vdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=EBK+HVwu; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=cOLyNcc3iNOFVs
	y9ED1adc21EFOIvSBFTc/nnP+fFbk=; b=EBK+HVwuUCzkIUTufn41ytigAJtR+a
	SN/CvATjQFPEWxKU1UJwftvU26EFlWod3YPjMeyu22JH8QkORmH+XdjtKvTDXIC6
	uGDYtJnff69JrK1Emw8wax6ddwlpF9fy2USIheKGKsygoaKvalWBwRSwpUozKJ8T
	xej5A8y+M3Gi4DToPQOJaL3u6VA+o+DG4j+7yF1Z2MNKJabY3Aa+Ua0AoKemdlre
	yXbfHBCL8gPLbiuk2f/8sd24d5ucGuj6aHj2xCVLMCahDBJ9K+V5TtGRO9rXN9+6
	2Lw7m5cz/hGENu0Fke1KW97sBAVxDCJAslk44Xm0XusR78IE6Poro4KQ==
Received: (qmail 2046826 invoked from network); 9 Sep 2024 13:04:37 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Sep 2024 13:04:37 +0200
X-UD-Smtp-Session: l3s3148p1@jhb/uK0huNYgAwDPXwlaAFpYOMUD2VTJ
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org
Subject: [PATCH] i2c: support gpio-binding for SMBAlerts
Date: Mon,  9 Sep 2024 13:02:56 +0200
Message-ID: <20240909110430.28665-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Most I2C controllers do not have a dedicated pin for SMBus Alerts. Allow
them to define a GPIO as a side-channel.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

The binding addition for dt-schema is here:
https://lore.kernel.org/r/20240909105835.28531-1-wsa+renesas@sang-engineering.com

Tested with a Renesas Lager board (R-Car H2).

 drivers/i2c/i2c-core-smbus.c |  9 ++++++---
 drivers/i2c/i2c-smbus.c      | 22 ++++++++++++++++------
 2 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
index 967bd712c638..fb3d4674be0c 100644
--- a/drivers/i2c/i2c-core-smbus.c
+++ b/drivers/i2c/i2c-core-smbus.c
@@ -712,12 +712,15 @@ int i2c_setup_smbus_alert(struct i2c_adapter *adapter)
 	if (!parent || i2c_verify_adapter(parent))
 		return 0;
 
+	/* Report serious errors */
 	irq = device_property_match_string(parent, "interrupt-names", "smbus_alert");
-	if (irq == -EINVAL || irq == -ENODATA)
-		return 0;
-	else if (irq < 0)
+	if (irq < 0 && irq != -EINVAL && irq != -ENODATA)
 		return irq;
 
+	/* Skip setup when no irq was found */
+	if (irq < 0 && !device_property_present(parent, "smbalert-gpios"))
+		return 0;
+
 	return PTR_ERR_OR_ZERO(i2c_new_smbus_alert_device(adapter, NULL));
 }
 #endif
diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
index bf23e3446123..10198e5efb50 100644
--- a/drivers/i2c/i2c-smbus.c
+++ b/drivers/i2c/i2c-smbus.c
@@ -9,6 +9,7 @@
 #define DEBUG
 #include <linux/device.h>
 #include <linux/dmi.h>
+#include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/i2c-smbus.h>
 #include <linux/interrupt.h>
@@ -168,6 +169,8 @@ static int smbalert_probe(struct i2c_client *ara)
 	struct i2c_smbus_alert_setup *setup = dev_get_platdata(&ara->dev);
 	struct i2c_smbus_alert *alert;
 	struct i2c_adapter *adapter = ara->adapter;
+	unsigned long irqflags = IRQF_SHARED | IRQF_ONESHOT;
+	struct gpio_desc *gpiod;
 	int res, irq;
 
 	alert = devm_kzalloc(&ara->dev, sizeof(struct i2c_smbus_alert),
@@ -180,18 +183,25 @@ static int smbalert_probe(struct i2c_client *ara)
 	} else {
 		irq = fwnode_irq_get_byname(dev_fwnode(adapter->dev.parent),
 					    "smbus_alert");
-		if (irq <= 0)
-			return irq;
+		if (irq <= 0) {
+			gpiod = devm_gpiod_get(adapter->dev.parent, "smbalert", GPIOD_IN);
+			if (IS_ERR(gpiod))
+				return PTR_ERR(gpiod);
+
+			irq = gpiod_to_irq(gpiod);
+			if (irq <= 0)
+				return irq;
+
+			irqflags |= IRQF_TRIGGER_FALLING;
+		}
 	}
 
 	INIT_WORK(&alert->alert, smbalert_work);
 	alert->ara = ara;
 
 	if (irq > 0) {
-		res = devm_request_threaded_irq(&ara->dev, irq,
-						NULL, smbus_alert,
-						IRQF_SHARED | IRQF_ONESHOT,
-						"smbus_alert", alert);
+		res = devm_request_threaded_irq(&ara->dev, irq, NULL, smbus_alert,
+						irqflags, "smbus_alert", alert);
 		if (res)
 			return res;
 	}
-- 
2.43.0


