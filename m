Return-Path: <linux-i2c+bounces-1535-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9118424AE
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 13:19:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 40A8D1C2628B
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Jan 2024 12:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F0C67E9D;
	Tue, 30 Jan 2024 12:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="L18Fpe3M"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B70B67E79
	for <linux-i2c@vger.kernel.org>; Tue, 30 Jan 2024 12:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706617163; cv=none; b=XuA0vOcHHt5sV0kH/xeB4wId/fvH6LNGhlX0cRmb1WOrIkpvC+gX5dfhPRBhOyQaUlQK1SVMAxqnJ7wzQVQS4hxuJduwZIom0IR3520kZYIIm1E1ppgmbQrm2yPbriJwaZuooKPZw22gVxuhSXeLlGPI0sI+acw8TdHfkkrQqL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706617163; c=relaxed/simple;
	bh=7+q8GPfVwFO7bpxSjP9H+90yU5XY210jEE+Z+p/ICSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N5Pv0ijVWLLQWtbu0CyxySKh7GRT6ceyQBNGQb5iv7MGh5o2fhf+nLDxN/YOWNMD8SoAPEcBVc/kQcAK7jvYa1yqj8Iu0bXi3UQuhbfjkUVct+2+7zGYWXRzB6OVEuy4gKhMtbh0o+TvNneyhDqdwkjsMKmedscQ+Cq9PPWU8YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=L18Fpe3M; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-33ae3be1c37so1532273f8f.0
        for <linux-i2c@vger.kernel.org>; Tue, 30 Jan 2024 04:19:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1706617160; x=1707221960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLC7OQwXNA+weg5GGKNWBcjnhtbq7adOLjbHLyswK3A=;
        b=L18Fpe3MQQAljD/IvY9uhCEAHEp8gJzchJ80wWiLlzLLd8/5hVcd75Ue9/kYZqNb37
         fHYyYE/r1W6nwE4gJQ2S5mHrnn4e0/9p4RGZoUcbxIpJqc2D7TZmmxUjltlEuWZnsVfg
         fYOKAD3oW7uOLAYGwDzeGgPdAPjUjUPLcS77/Di6QIWu3/i4VSG8lM/Xn+Y9bB7ZeFDR
         hMuvA0siktypJgCNj+ovVN9fBrEp6UBpcVWewlutoVj7XJPav0ZnFujmyik8My8+TYgd
         S56/lrPO3qtP9eIQlAh+XI6ly/fzBHC4zeukMxCT0NDWzx7Aqr409nYJUDoreC7/693o
         1PYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706617160; x=1707221960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PLC7OQwXNA+weg5GGKNWBcjnhtbq7adOLjbHLyswK3A=;
        b=v+aJdXuxx5ukbJhjpoKehGraHXFVF6DByjRLEedU6YnKG8u7A56WiihqopueJ0F6QE
         9ohR4FqZ/PAwk/ZWNfg398Zt5VHlhMqWExVWCuunJ/xtAHBid82A5v2ehfZxHTBRs+A4
         mhVb23MZoy1CpwqaURljjiYr9QHncjQCk9kdpNMBzGSaQZPsPOOC1kT6mtsHXiQE+3tb
         VBIzDh5E6UsvzCIX34B2w+I/x8zTo0V9OzmpZNydYIeQqu80qMhCufjkfC+fMGG+AurN
         fHPvaQNy0J5fB865n1g1ejTVtdJCwj855Yv9r5oJvzwYrIf8/xfFI7rFWUfV19Uy0Yd1
         xZbg==
X-Gm-Message-State: AOJu0YxIEhGaVD6iISY9KBrGTNdb81ms++zhNTeUZWvY2HoidS54Wcun
	5XGmR2ZT3bDQgn9O1S4n0RKhe6sivOh4l5mnVgRZwQspjFaS8AuI5sC8F+umKhs=
X-Google-Smtp-Source: AGHT+IGPDHT5czbJRotrJkVVDimObm4QYo+5LSvJK1xwx6ODiopc4gwaOYkJ3u+SCSYsdlTDlm1a6w==
X-Received: by 2002:adf:e701:0:b0:33a:f48d:1a16 with SMTP id c1-20020adfe701000000b0033af48d1a16mr1235916wrm.22.1706617160310;
        Tue, 30 Jan 2024 04:19:20 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUYKxQzOIuGPD0ZgoGUJkRTt/8/ALVHo1tzgL/IzKEFEpR0cA3UL9H0J3I9C0wXV54kFleZQBansmTGsN4eGH1AK2y8XP7I6MIkGBankPy5soC19//DhfjUTTRwopC5lW2GZl0teIRxpGbS3ztsRPcDNvUCHI7PTzBO8CQIfVT3z6icwdLR8xJCr0HdI8+6soTy9qn1EvsctmQuelPd+QO6vC9avw==
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id n21-20020a05600c4f9500b0040efb503d58sm4049446wmq.28.2024.01.30.04.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jan 2024 04:19:19 -0800 (PST)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Peter Rosin <peda@axentia.se>
Cc: mazziesaccount@gmail.com,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH v5 2/2] i2c: muxes: pca954x: Enable features on MAX7357
Date: Tue, 30 Jan 2024 17:49:01 +0530
Message-ID: <20240130121902.462619-2-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240130121902.462619-1-naresh.solanki@9elements.com>
References: <20240130121902.462619-1-naresh.solanki@9elements.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Patrick Rudolph <patrick.rudolph@9elements.com>

Enable additional features based on DT settings and unconditionally
release the shared interrupt pin after 1.6 seconds and allow to use
it as reset.

These features aren't enabled by default and it's up to board designer
to validate for proper functioning and detection of devices in secondary
bus as sometimes it can cause secondary bus being disabled.

Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>

---
Changes in V5:
- Fix typos
- Update comment
- Add newline in dev_warn
Changes in V4:
- Drop max7358
- Update #define
- Move conf variable
- Print warning when I2C_FUNC_SMBUS_WRITE_BYTE_DATA isn't supported
Changes in V3:
- Delete unused #define
- Update pca954x_init
- Update commit message
Changes in V2:
- Update comments
- Update check for DT properties
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 43 ++++++++++++++++++++++++++++-
 1 file changed, 42 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 2219062104fb..f5dfc33b97c0 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -57,6 +57,20 @@
 
 #define PCA954X_IRQ_OFFSET 4
 
+/*
+ * MAX7357's configuration register is writeable after POR, but
+ * can be locked by setting the basic mode bit. MAX7358 configuration
+ * register is locked by default and needs to be unlocked first.
+ * The configuration register holds the following settings:
+ */
+#define MAX7357_CONF_INT_ENABLE			BIT(0)
+#define MAX7357_CONF_FLUSH_OUT			BIT(1)
+#define MAX7357_CONF_RELEASE_INT		BIT(2)
+#define MAX7357_CONF_DISCON_SINGLE_CHAN		BIT(4)
+#define MAX7357_CONF_PRECONNECT_TEST		BIT(7)
+
+#define MAX7357_POR_DEFAULT_CONF		MAX7357_CONF_INT_ENABLE
+
 enum pca_type {
 	max_7356,
 	max_7357,
@@ -470,7 +484,34 @@ static int pca954x_init(struct i2c_client *client, struct pca954x *data)
 	else
 		data->last_chan = 0; /* Disconnect multiplexer */
 
-	ret = i2c_smbus_write_byte(client, data->last_chan);
+	if (device_is_compatible(&client->dev, "maxim,max7357")) {
+		if (i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_WRITE_BYTE_DATA)) {
+			u8 conf = MAX7357_POR_DEFAULT_CONF;
+			/*
+			 * The interrupt signal is shared with the reset pin. Release the
+			 * interrupt after 1.6 seconds to allow using the pin as reset.
+			 */
+			conf |= MAX7357_CONF_RELEASE_INT;
+
+			if (device_property_read_bool(&client->dev, "maxim,isolate-stuck-channel"))
+				conf |= MAX7357_CONF_DISCON_SINGLE_CHAN;
+			if (device_property_read_bool(&client->dev,
+						      "maxim,send-flush-out-sequence"))
+				conf |= MAX7357_CONF_FLUSH_OUT;
+			if (device_property_read_bool(&client->dev,
+						      "maxim,preconnection-wiggle-test-enable"))
+				conf |= MAX7357_CONF_PRECONNECT_TEST;
+
+			ret = i2c_smbus_write_byte_data(client, data->last_chan, conf);
+		} else {
+			dev_warn(&client->dev, "Write byte data not supported."
+				 "Cannot enable enhanced mode features\n");
+			ret = i2c_smbus_write_byte(client, data->last_chan);
+		}
+	} else {
+		ret = i2c_smbus_write_byte(client, data->last_chan);
+	}
+
 	if (ret < 0)
 		data->last_chan = 0;
 
-- 
2.42.0


