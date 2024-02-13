Return-Path: <linux-i2c+bounces-1703-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BEBCB853300
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Feb 2024 15:23:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F151B1C22919
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Feb 2024 14:23:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBB6758AA4;
	Tue, 13 Feb 2024 14:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="TP/yR7VR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14F5158220
	for <linux-i2c@vger.kernel.org>; Tue, 13 Feb 2024 14:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707834158; cv=none; b=WaQjpnmnFNW6nEOoYeIRKcmaR83hHz+z4PWsU4sOERWlsH3TVI6lgaObvh7mMWMpnIZMDEazlH2o7jqkTI+hzraSWoeTCD2Ps+6gEMrcSYOfGA8k3sI+TnByYq44tQoZABGq0VEdIzzP44+NKyyCTJY5pe/NItVZqfNT6X6hscA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707834158; c=relaxed/simple;
	bh=cGDhgb9JjmXcz1B7VT0bk/gyC+uEs/PtygXq4+otMW8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tAUVMLMFlDjGFHmrmFZNL+kUUHtGnJMUU/S1k/c20LAMkvXqgwEKSZS87vdXWqxV5GU/i60aXJjmkgD/f6ji6Hrpo/IkT+auCzFm14nbuf2G9n+9hKM2sMDgFKjcjqRwn2oQVbkp0pVRroepVRE/UcekqCvML1f1PqECZXPnGb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=TP/yR7VR; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a271a28aeb4so559419466b.2
        for <linux-i2c@vger.kernel.org>; Tue, 13 Feb 2024 06:22:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1707834154; x=1708438954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FCYSTKoBxU4qe92Ir9ZfO3GMV6uHY4MYfHL/wqf2edA=;
        b=TP/yR7VRXLPX0OG5HSbNrYzroOXb7VcjRpJDaRdrn9WIW/OUGhkdvYsI95ApApjX8l
         tUlKoi4/YCSAmMW+qe86UQTyY9TynLLj923Qzl0JL5QiznNdlv8YEv3sauq3EgPeJhlE
         MCMwwOP7eFLKFg8HKYD34hvDoA1SfOdn8fa8l0rEjSRBu0hZ2ZOQTuyofct24v81YNXC
         N1qYxTmqte1Vw6lJSucgipRSFi6am6F98gxUEA5fdT3EIvkDdks1iLo6/L7HKnqO7LIP
         tewCHKb01eiYaP1Ir3UnC0mHlxzhCRHyEq0BcZov3b+qFFXpiJ01agQQqWSHzfCqARJb
         gWTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707834154; x=1708438954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FCYSTKoBxU4qe92Ir9ZfO3GMV6uHY4MYfHL/wqf2edA=;
        b=Bdt826SI33+IE6SNtTNcjIYusp8ppOc6FWrL2VhaW3mxiCMzyWB+Br1TscouoaiK8p
         R/0qpGHvVaxjqBEDvp5ja6CWgt4i6dohepnZoaWm28jvotddNal5v87ih3yAw5QCOAUg
         4k6JhWngexrpP5eq5WZickqJhZ6tj2nF5IphPMaKSXDqCL+oTfrTHxSMkORvi4Fgc6bC
         SF89+muQ1mIjJeSGN85sl+jnYP+pDYoECZv3AmEMAA4nj+l7noFows2lchimcAs1ew4d
         bz6jSOSUJUlL4PWGITY1qyV1FwiVyoCvHkbsyA7nMm7W6KxRFMrXE51XuPNDxoEJiMZw
         5KUA==
X-Forwarded-Encrypted: i=1; AJvYcCUSGTrXFl0nhA9WPHKQb3oGgIP2wX8rx600J0NPWL9dDwC9cgWSJnG+zrVaBGa1hYmj4fB2I85gdPIE7tGZ7x9X8vuzJLDgCCCw
X-Gm-Message-State: AOJu0YwgPcMOUmdJUm5LdsgNn8J1A4ZtnIQwGeDC4GpNg+wpXhZqIWHB
	j0Qg9a+donxl3IS0r1jEpG3EWu2G5/eLcrCxEpa3eHd2B31Ib/nnNTt4i1mYU8E=
X-Google-Smtp-Source: AGHT+IHAm5yBpKrrKAQM0NVFE3L0ONc7OAUE4TZQLYXUEswIWkYHS4muNrhIi6ltgFhBibdGbdKPkg==
X-Received: by 2002:a17:906:8417:b0:a38:7541:36f6 with SMTP id n23-20020a170906841700b00a38754136f6mr7924946ejx.21.1707834154387;
        Tue, 13 Feb 2024 06:22:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW+2fap3g67K+xlSpRgqPTfNeRFPdzmmy/1Sx9FWajc48LBob+MvxXHOnI+Ei/e5oZegJo4x8nh8raGGIC4NyDVAx/TYdDm0DRRf/MIBxmzzQinnbYgCdihQfg11itAXNObnDMKWMSuRULKdzFPimF/I4XLscPtOntuY5iyXPD/3VYuNrAhtJgFBfUD7FNQj68SO6a8UkPfoyzmqyVewj1cCfsgkh+Ows8ZsjYy2jsw6TiVd6Yixmb9ZLRB
Received: from stroh80.sec.9e.network (ip-078-094-000-051.um19.pools.vodafone-ip.de. [78.94.0.51])
        by smtp.gmail.com with ESMTPSA id lu1-20020a170906fac100b00a3c97e49bc9sm1322671ejb.218.2024.02.13.06.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 06:22:33 -0800 (PST)
From: Naresh Solanki <naresh.solanki@9elements.com>
To: Peter Rosin <peda@axentia.se>
Cc: mazziesaccount@gmail.com,
	Patrick Rudolph <patrick.rudolph@9elements.com>,
	Naresh Solanki <naresh.solanki@9elements.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/2] i2c: muxes: pca954x: Enable features on MAX7357
Date: Tue, 13 Feb 2024 19:52:27 +0530
Message-ID: <20240213142228.2146218-2-naresh.solanki@9elements.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240213142228.2146218-1-naresh.solanki@9elements.com>
References: <20240213142228.2146218-1-naresh.solanki@9elements.com>
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
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

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


