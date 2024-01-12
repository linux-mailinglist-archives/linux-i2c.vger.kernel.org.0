Return-Path: <linux-i2c+bounces-1279-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C1582C3B6
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jan 2024 17:37:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C6D61F22C75
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jan 2024 16:37:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4659C7E793;
	Fri, 12 Jan 2024 16:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SJAM6Zhq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677367E768
	for <linux-i2c@vger.kernel.org>; Fri, 12 Jan 2024 16:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40e68ca8e27so2799705e9.1
        for <linux-i2c@vger.kernel.org>; Fri, 12 Jan 2024 08:36:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705077390; x=1705682190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+tAwGTFBvrjSR+D7qo0JkBwlnmAMUSdISzHDQJb3VJ8=;
        b=SJAM6ZhqX5sQrxdeKesiLB2E7w0LvCgHKx799uY5OLzvjo4NxuzDGrBLhPq9BPHVdI
         Z++P/Rah05n4B9lWwAR2+RA1/j9dKLQ1Yu74L6X+sx6eighuBIgINITPXCwGUqZycIAv
         b7NUMuNA+hnOTUNoJz+xNwvfechsPnBh3M4vdYxOAF5q8mzeT0VYXxOsy+fjApbmvzy1
         4TW3mGl7GGzcrqpfQM1hWEKqP8OjOYKPUmhKevd/XPabFaYHDDOnc/GCo9rvvvddM176
         CKWfvGzBtaAk9txmeG+//CrjiT96qxRt1mZv78RjSMdfNlToQXQLHtt5cBc89f4W/s6a
         ZFzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705077390; x=1705682190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+tAwGTFBvrjSR+D7qo0JkBwlnmAMUSdISzHDQJb3VJ8=;
        b=XWM7iVj472jTRPBBTutLpjtxezdwp1eK/yrWP93KK0U0RXeCRdQxmK5snth0LlNIZX
         osaEwYGsBd57jG/6mQenZRTv/bnOgQTN/u3bZy+TCHQOjWmld1yPuozezfpr/Y6OPni/
         Tm2LYIASw+lMsTUmmXBbDq9rGZHqBRyppjFUVZTHekIl7603xkWNtOzMKMwjDDi6wv6v
         QXyuZGgtLe1BWPQZhKNgRnH3BePMP4PSqEVtddNVr92D+2tf42mjNCR7O3wMw2zMDBo1
         E7YvijZzDFbre7b+YZI9p5igBrpsP647mrJH0qygZezEdvqDOL5hXaOpsKbLtfsEtFPt
         JKpA==
X-Gm-Message-State: AOJu0YwJsveSUqika1PjA6gqwU6VHJXwkN1rgCaHODIBfqCOEKuKgXZG
	XBeUakzX6J+5K+oGEHIc9F9whDbcFUh/mw==
X-Google-Smtp-Source: AGHT+IHwVLaqmPFUtKT7wAZTbrdSc8zyHUbK1fQIZbWvd0QlBC1T6c9jlGWVdUy5gdVHgvbYuB/lxQ==
X-Received: by 2002:a05:600c:1c25:b0:40e:4613:daae with SMTP id j37-20020a05600c1c2500b0040e4613daaemr1033231wms.30.1705077389852;
        Fri, 12 Jan 2024 08:36:29 -0800 (PST)
Received: from krzk-bin.. ([178.197.223.112])
        by smtp.gmail.com with ESMTPSA id bd16-20020a05600c1f1000b0040e5a93ae53sm6573195wmb.22.2024.01.12.08.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 08:36:29 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Rosin <peda@axentia.se>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Sean Anderson <sean.anderson@seco.com>
Subject: [PATCH v3 5/5] i2c: muxes: pca954x: Allow sharing reset GPIO
Date: Fri, 12 Jan 2024 17:36:08 +0100
Message-Id: <20240112163608.528453-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org>
References: <20240112163608.528453-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chris Packham <chris.packham@alliedtelesis.co.nz>

Some hardware designs with multiple PCA954x devices use a reset GPIO
connected to all the muxes. Support this configuration by making use of
the reset controller framework which can deal with the shared reset
GPIOs. Fall back to the old GPIO descriptor method if the reset
controller framework is not enabled.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
Acked-by: Peter Rosin <peda@axentia.se>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Link: https://lore.kernel.org/r/20240108041913.7078-1-chris.packham@alliedtelesis.co.nz
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

If previous patches are fine, then this commit is independent and could
be taken via I2C.

Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sean Anderson <sean.anderson@seco.com>
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 46 ++++++++++++++++++++++++-----
 1 file changed, 38 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 2219062104fb..1702e8d49b91 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -49,6 +49,7 @@
 #include <linux/pm.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 #include <dt-bindings/mux/mux.h>
@@ -102,6 +103,9 @@ struct pca954x {
 	unsigned int irq_mask;
 	raw_spinlock_t lock;
 	struct regulator *supply;
+
+	struct gpio_desc *reset_gpio;
+	struct reset_control *reset_cont;
 };
 
 /* Provide specs for the MAX735x, PCA954x and PCA984x types we know about */
@@ -477,6 +481,35 @@ static int pca954x_init(struct i2c_client *client, struct pca954x *data)
 	return ret;
 }
 
+static int pca954x_get_reset(struct device *dev, struct pca954x *data)
+{
+	data->reset_cont = devm_reset_control_get_optional_shared(dev, NULL);
+	if (IS_ERR(data->reset_cont))
+		return dev_err_probe(dev, PTR_ERR(data->reset_cont),
+				     "Failed to get reset\n");
+	else if (data->reset_cont)
+		return 0;
+
+	/*
+	 * fallback to legacy reset-gpios
+	 */
+	data->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
+	if (IS_ERR(data->reset_gpio)) {
+		return dev_err_probe(dev, PTR_ERR(data->reset_gpio),
+				     "Failed to get reset gpio");
+	}
+
+	return 0;
+}
+
+static void pca954x_reset_deassert(struct pca954x *data)
+{
+	if (data->reset_cont)
+		reset_control_deassert(data->reset_cont);
+	else
+		gpiod_set_value_cansleep(data->reset_gpio, 0);
+}
+
 /*
  * I2C init/probing/exit functions
  */
@@ -485,7 +518,6 @@ static int pca954x_probe(struct i2c_client *client)
 	const struct i2c_device_id *id = i2c_client_get_device_id(client);
 	struct i2c_adapter *adap = client->adapter;
 	struct device *dev = &client->dev;
-	struct gpio_desc *gpio;
 	struct i2c_mux_core *muxc;
 	struct pca954x *data;
 	int num;
@@ -513,15 +545,13 @@ static int pca954x_probe(struct i2c_client *client)
 		return dev_err_probe(dev, ret,
 				     "Failed to enable vdd supply\n");
 
-	/* Reset the mux if a reset GPIO is specified. */
-	gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
-	if (IS_ERR(gpio)) {
-		ret = PTR_ERR(gpio);
+	ret = pca954x_get_reset(dev, data);
+	if (ret)
 		goto fail_cleanup;
-	}
-	if (gpio) {
+
+	if (data->reset_cont || data->reset_gpio) {
 		udelay(1);
-		gpiod_set_value_cansleep(gpio, 0);
+		pca954x_reset_deassert(data);
 		/* Give the chip some time to recover. */
 		udelay(1);
 	}
-- 
2.34.1


