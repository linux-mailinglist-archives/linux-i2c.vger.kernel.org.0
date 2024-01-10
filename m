Return-Path: <linux-i2c+bounces-1259-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F4182A206
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jan 2024 21:18:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B482E28DA2B
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jan 2024 20:18:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA894EB24;
	Wed, 10 Jan 2024 20:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m5DP4kI0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2464E1BD
	for <linux-i2c@vger.kernel.org>; Wed, 10 Jan 2024 20:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40e5a5b0fb5so5413915e9.3
        for <linux-i2c@vger.kernel.org>; Wed, 10 Jan 2024 12:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704917721; x=1705522521; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zUha32C7Up/DhjYELAbnhrN1gcffSzH1UVEunFTRUz4=;
        b=m5DP4kI0o5eRxJI4usTQCeUXnit0JLJMH030MIzYOJTqO3WGQdJ1b/WvdAm4yg9ZXd
         p+E6kH0G9E5BO5h3xv2Wx6WrEyZGTF2375cKfVyUu0vMqUAeZYmxpfLntsJNBC+dAvWR
         knp4JGYJeSaAako7t7sD0S6pC+HyGUgA76fpGGl85OK6Zbix3GSsyvGS5Jxzv9+rxxt2
         8R4ZiFvUHRiMZRKHm+lXmNsC2rDkNZkeQpOupi5IzR4kB+VG+dztkYjhThF5iG6q7SEO
         oLcuqUZs4JxBM6V2f3Tq4LAVzicQ6pb8XTvVvYGE5F/IpuTlhjOEJbTDzbRN/jTsReZ+
         ALkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704917721; x=1705522521;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zUha32C7Up/DhjYELAbnhrN1gcffSzH1UVEunFTRUz4=;
        b=dgCbZ/PkfEWb/1bzWudWmJISYfeFFGL0KkH8iQnM3tIKfc0YIyTQbNYGKx9/ntwqLI
         khB65701/8xSWBBBQ9Ifphjs7jmo3ZlFfkizIQT3DW8yS756PGJK8fQmvNDAVVfU2+cu
         TTL9fjvWXiwBxtM0rz9hi7F+2joGMnf3zQ0D5XPyRJEiYrZPIoAiGxp3Afv0sS8eNSTD
         ZpSzHckCVzJ+VB8SVjp0cdMCCVWJDF4J0TjcFkKCbV7HA7bi6vYkB3EaDP+0OBJ7FL0z
         ewpFw/srp70ryEdUJTj8iX820ILGj72cGM/8QtBz96bZ1esvWPgU35YucjmeYysSK+VZ
         bKHg==
X-Gm-Message-State: AOJu0YxCuft60jPDcHW4b0DeRJl6L7HuS8yTvEnx4/AXSOKEvQbGTLbV
	2FqV2p/Gy7fgy49rOciyJnmaA+CWOug=
X-Google-Smtp-Source: AGHT+IGo6a9riW8crkjSigpfL2KmpFv5uxUc7rBCSOiMASt0Q3yVAVk6VzvQgbc1YCS8wGQe/SaDwQ==
X-Received: by 2002:a05:600c:4e86:b0:40d:8944:657b with SMTP id f6-20020a05600c4e8600b0040d8944657bmr834627wmq.26.1704917721387;
        Wed, 10 Jan 2024 12:15:21 -0800 (PST)
Received: from ?IPV6:2a01:c23:bd4e:3500:5df0:e74e:ef8d:49d1? (dynamic-2a01-0c23-bd4e-3500-5df0-e74e-ef8d-49d1.c23.pool.telefonica.de. [2a01:c23:bd4e:3500:5df0:e74e:ef8d:49d1])
        by smtp.googlemail.com with ESMTPSA id lk19-20020a170906cb1300b00a2c20c5f444sm264915ejb.6.2024.01.10.12.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jan 2024 12:15:21 -0800 (PST)
Message-ID: <8dadb1d5-bbdb-4e5c-b302-b9be112a3f1b@gmail.com>
Date: Wed, 10 Jan 2024 21:15:20 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/4] i2c: mux: gpio: Allow to call i2c_register_spd on a muxed
 segment
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@the-dreams.de>,
 Peter Korsgaard <peter.korsgaard@barco.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <fc057deb-49f9-49cf-9549-13b2538ed92b@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <fc057deb-49f9-49cf-9549-13b2538ed92b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Allow the gpio-based multiplexer to call i2c_register_spd on
muxed segments. First user will be i801.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/muxes/i2c-mux-gpio.c           | 1 +
 include/linux/platform_data/i2c-mux-gpio.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
index 6b979a0a6..c841407c7 100644
--- a/drivers/i2c/muxes/i2c-mux-gpio.c
+++ b/drivers/i2c/muxes/i2c-mux-gpio.c
@@ -161,6 +161,7 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
 	}
 	mux->gpios = muxc->priv;
 	muxc->priv = mux;
+	muxc->register_spd = mux->data.register_spd;
 
 	platform_set_drvdata(pdev, muxc);
 
diff --git a/include/linux/platform_data/i2c-mux-gpio.h b/include/linux/platform_data/i2c-mux-gpio.h
index 5e4c2c272..cbeb74f92 100644
--- a/include/linux/platform_data/i2c-mux-gpio.h
+++ b/include/linux/platform_data/i2c-mux-gpio.h
@@ -20,6 +20,7 @@
  * @n_values: Number of multiplexer positions (busses to instantiate)
  * @classes: Optional I2C auto-detection classes
  * @idle: Bitmask to write to MUX when idle or GPIO_I2CMUX_NO_IDLE if not used
+ * @register_spd: call i2c_register_spd for the child adapters on muxed segments
  */
 struct i2c_mux_gpio_platform_data {
 	int parent;
@@ -28,6 +29,7 @@ struct i2c_mux_gpio_platform_data {
 	int n_values;
 	const unsigned *classes;
 	unsigned idle;
+	unsigned int register_spd:1;
 };
 
 #endif /* _LINUX_I2C_MUX_GPIO_H */
-- 
2.43.0



