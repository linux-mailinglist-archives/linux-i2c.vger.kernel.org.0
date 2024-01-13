Return-Path: <linux-i2c+bounces-1289-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DD34782CC7D
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jan 2024 12:28:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4D00FB2327F
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jan 2024 11:28:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D510620DEA;
	Sat, 13 Jan 2024 11:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iqdkTSDq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD8F1EF01
	for <linux-i2c@vger.kernel.org>; Sat, 13 Jan 2024 11:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5590f5fa93cso121981a12.0
        for <linux-i2c@vger.kernel.org>; Sat, 13 Jan 2024 03:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705145281; x=1705750081; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zUha32C7Up/DhjYELAbnhrN1gcffSzH1UVEunFTRUz4=;
        b=iqdkTSDqre3Ye04r93i2FXf6ntx87cGp93Rg/+4lI5xV2WJKqi7HC6UATuJleqV2/N
         z6edpNusYLxej2WUdf/F1tTSRgpPvcegjZIKRxoqxYxYRWtsxwhyhcnfuw8fozVe30VC
         S4a9DlrwdsgZvcTK7ZE1xRC5NXSu6SDCPH/50aEhCk7pk1Ez3v5S4KJikHjglJdbGeFt
         QojSI+ZayZhb7e5bWj2/MtYV2Nu9FPbfS/ZHz526hDOXlmmTJ7Gp1o8MGnEAAXmxs7SZ
         asFmuUOioD/4QdogpOtuKQFJjCCz+TUo02578/UpP7fonMwnQiFs+Mub4PdKF2z0jP4e
         mb0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705145281; x=1705750081;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zUha32C7Up/DhjYELAbnhrN1gcffSzH1UVEunFTRUz4=;
        b=nfkNHGjopjF+Et5CWGcQduLVgd+iR7B6Cq8ucbcTVxirHnwcRk/nAWMVGqMvei8Edj
         m6pFQ9VoJldNpPK499xKut1wLtIXBvTj5Sz4cZqLrNLLTqooksQIh/MS21apBvjb+rth
         mcInzdYAp3GAltZxqelmCOohHIvzXGEQ76n58QDKYIiy791ufbiUgG5tDJvIPIyCeSGD
         WGzPaHMHzKjvKABOgl36eVizS8X5tDsRt0xr58oVVCUiW6qdtJ861sXxkiWdtKNfO4LN
         cFfqCuHbNvjNsNToTnxFcoJedCecqbgkW83Soy4sTpSy8BjNgEeOKwVRe1jTlw4+35OQ
         TRpQ==
X-Gm-Message-State: AOJu0Yxmkh1XhotVSoaKDxfwBOyzWhH5GZ7O7Z1rlMAHqXUzo/7F3wmT
	OwcEBC7gl9v9ZWtGchBXJk4+EjH6ocg=
X-Google-Smtp-Source: AGHT+IH9Jf9k2sxaq/HZ/9IaDk+Z3QJVKg7qjMxx6VzS877/lQGKZdEIWkYs/rKcPb9hiRfdzUrqqA==
X-Received: by 2002:a05:6402:1745:b0:555:3b98:7540 with SMTP id v5-20020a056402174500b005553b987540mr1261975edx.33.1705145281265;
        Sat, 13 Jan 2024 03:28:01 -0800 (PST)
Received: from ?IPV6:2a01:c22:6f53:1400:a4e3:d977:260a:1bdd? (dynamic-2a01-0c22-6f53-1400-a4e3-d977-260a-1bdd.c22.pool.telefonica.de. [2a01:c22:6f53:1400:a4e3:d977:260a:1bdd])
        by smtp.googlemail.com with ESMTPSA id u23-20020a05640207d700b005573b375589sm2833313edy.96.2024.01.13.03.28.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Jan 2024 03:28:00 -0800 (PST)
Message-ID: <a239882a-5181-47a2-be83-44522f5b16cc@gmail.com>
Date: Sat, 13 Jan 2024 12:28:01 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 3/4] i2c: mux: gpio: Allow to call i2c_register_spd on a
 muxed segment
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Peter Rosin <peda@axentia.se>, Wolfram Sang <wsa@kernel.org>,
 Peter Korsgaard <peter.korsgaard@barco.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <9f37f64e-f5b8-4928-8716-6d2846c2688a@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <9f37f64e-f5b8-4928-8716-6d2846c2688a@gmail.com>
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



