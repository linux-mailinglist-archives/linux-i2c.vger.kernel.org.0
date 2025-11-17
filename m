Return-Path: <linux-i2c+bounces-14109-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 247F4C630B0
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 10:07:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id B60AE28A14
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Nov 2025 09:07:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF3E7328629;
	Mon, 17 Nov 2025 09:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HuKgkqeo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D5B32779B
	for <linux-i2c@vger.kernel.org>; Mon, 17 Nov 2025 09:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763370343; cv=none; b=R5yNIkHB2+eC+JPNqXbCC6qESnUAx8TpJlU/8tNOqzm/6WGYOnjMhXG23SElHE6id6WiGXWif3TPDsGwcouirUzhjzTvhuRmgmWGUlKzC+QWq5K0DFARR2ONft0B9LQ45oWiil8vuX54YCFO/9LM8bqjubebqVE935iMKbHXXfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763370343; c=relaxed/simple;
	bh=v2z8hyK1XpH9sRNEh0FTDATeNOoSf0j273yYmUHhCVg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JJ5JiV+HAT1EBKDyyOCSTEltIXTSo+U1mvXJVIclJCuP5dAFw+BuTt0Pf2rzVCkCYXIXrr60fI0P9g8VaxmEK90vYU7wuqKVrRkJ9dVSK9XYeQA49J+RbTvgVzztvOiMBzJkTWOUltNvaXyHyviVx2WcERyHzV5FM6pSb3YCxwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HuKgkqeo; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-37ba781a6c3so29152261fa.0
        for <linux-i2c@vger.kernel.org>; Mon, 17 Nov 2025 01:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763370339; x=1763975139; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPjU1ecCTuWGBAgFie+Qqi/4OOu+1k326jCWsM9etTg=;
        b=HuKgkqeoUBIcTKQoyDUF5wEhVBqvyhJv/hbSGxky+GMr5EY48Q+QyyZxpGbN2tBLPO
         UNvBOeVq/Y2XCtAPxPAJZxufyPn4e8an5qINh1rlf0iapbIQUDZ+fKTkg/qoJoRYpjQe
         1mX/6lNjZWW1yKgCPG+Hrr1xAMut3kZ8tLT91yconaJ+0AmrvSl3VmmpPPT51DClBoUK
         PUZxFvCBjkK3SF2gw56U/DUkXm1pPA+sC7JBAXBb9mWOm7Z22Ae2oAFUfJaktoXMEO/3
         O9hfUVj4LYMqM/hEAw3UVNYuHEv1aAM8NcsEpqVAnW4k/+Gaa0nZsP6GS417OcwJL1r7
         CYUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763370340; x=1763975140;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pPjU1ecCTuWGBAgFie+Qqi/4OOu+1k326jCWsM9etTg=;
        b=VMT4IpBjVE2eOjtT8WysC3GnOw7bsMGQx5U7fpRub19Y25D5hehMICXQ51dmrQQ9r/
         oOpDrWw6qy0vJhbjWx57OIg6IS5BIxeHC3nFxb+ZbEp71F5ntMBzNNqei95gG8cFeIvX
         9O056U1pFBFq74+kjkyPC3UPrreB/XaPPW0mq9RUjjaH6n4FPt46WpprYYemwLGJuFYg
         eeIe1K14zwFVYkWS38ntdH/1v09XUg+Ct58EWyAh1wBr+iKrVI3e/9u0SK7MjWYwSTg3
         BPD7e6TgDWTKM1/2VWxJYHBRaYY9ys0t47bfgDH22ONq64ywJY4zh4zZIKnIZn36yqHw
         ELgQ==
X-Gm-Message-State: AOJu0YxfLErCQN+zwxP+cF6veY0y9WvoeucIwarMMyiC7MA9jyQes3NW
	q1RYg8R7rn3IpA6WJVxiRjYMAfzVPxYHC7ycSmJSJ/Fd8hQQM5P9jv3I
X-Gm-Gg: ASbGncvKaREeP+QVBdm9rXwcJceg8pmjbpB1nvnOy9WG2esN5wuzFR6553ZGNTO+60y
	K8fJnPmH+Bq/FPY8R+yzztqQ14f1xSFZXmOKoDgQseBFmFR2BO9Krr3apw96bgddPOgDBjbtVxY
	mZdu31cHUZrU9va0qHCynMxls5CuSxHQujpb6f8yUq/pCmR3iluv9BKrQk8OwepU7Il1as5S3wr
	wTKddRplbuvFuOUUIb5c7O5n01WqSTSUVcMPNCtP8JC7eIebzXT70jDuM/ywI48sBlQwzPI/HoQ
	3lfWBtNH7AXwrj8vK1qzdCTaachkK6QhCugFJvPUYxVLCpHkdOgBCWbaf5TJIx876fa5vnegwBu
	+6Xa6DgkbVVnWttfxBnaIevYxIwIN7/mOSypCF0DxUEQENGq7cI1UmV49+eEfZ9TadLITcAR7We
	LbuPjGMtGNngo/TdKQJOujV9RRsxLuPGPbNU7pvtJSjWZ5lw==
X-Google-Smtp-Source: AGHT+IEgr0MyDzCKNzHmShjCTLcnecyKiJg3t3ocIhl5DpBA56xE4kTsmmmC7cuP3GGPWmtmaAnAlg==
X-Received: by 2002:a05:6512:3e07:b0:595:81ce:ff83 with SMTP id 2adb3069b0e04-59584209400mr3464795e87.25.1763370339347;
        Mon, 17 Nov 2025 01:05:39 -0800 (PST)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59580405693sm3023727e87.76.2025.11.17.01.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 01:05:38 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 17 Nov 2025 10:05:00 +0100
Subject: [PATCH RESEND v3 3/5] i2c: davinci: calculate bus freq from Hz
 instead of kHz
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-i2c-mux-v3-3-696c83e3505a@gmail.com>
References: <20251117-i2c-mux-v3-0-696c83e3505a@gmail.com>
In-Reply-To: <20251117-i2c-mux-v3-0-696c83e3505a@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2849;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=v2z8hyK1XpH9sRNEh0FTDATeNOoSf0j273yYmUHhCVg=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBpGuVPakARFkpRXLd2kbW0oIVh4Oo/J5FJfs9vS
 anUBgOwm1SJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaRrlTwAKCRCIgE5vWV1S
 MtjHD/9Xc/qHnz2R6dEBP2Ga36wZqa2NXUUudlDk+Xq88nyEhsswUc/TN24vSq3bRmDkGlx6WsM
 nsZTYmDMNmbVMTvVQRMpeYuPYDjaDOhfhq/uZQQnButVC6RQ/ywFiiGjf/jY+Z0DK1vKB2IJkUY
 A3foxz9SXndjYgZ81G4ny6E3iyGRSva38/fq6r188Ky9IyyqARqR132g2fWA/aTPLKJYRq37OjO
 HCocln7DTWZU7OYEC6CzoygWXaoU+wm+PXOiC/85JL7sDNd86s1K2PQPo8tnaRYe+A8mQsK62Ox
 fuQoOd3/R1viHSaBfOT9g8aCAXPDXp9IwB7tIblmFUdQqxWiH/rNCEUtbPbSLS06rS0MWBlzmTT
 We4/6CPlM0MQMd20tYck070c38uZd5VEedWp5P97JyLnwsTutHtBkZJO38khQZdyBvEM53X03Jw
 KsIpMMtNTF6bn4HqNNBh6FCiWFbNpISR1JeKG4ikTX3NEEEBn3BrErWUIWgwqu4lAtWpC97yar8
 KEtYTbIuZo9s//8J3qjgTi/EEnfsxWtdv44/zji41hBHQULvVMoA0+AQ1vLNeGuNfgcFV6b+sJk
 veuAQhZqC+yzlE+MKj7j3RaC3YVDNaZRlC8a2LWDfGFHHQl+9eXcoDjMVKCfTtZEjWcLeScQjTT
 ZTtpcB7zsgCM3uQ==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

The bus frequency is unnecessarily converted between Hz and kHz in
several places.
This is probably an old legacy from the old times (pre-devicetrees)
when the davinci_i2c_platform_data took the bus_freq in kHz.

Stick to Hz.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/busses/i2c-davinci.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 6a3d4e9e07f4..82f295619c4d 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -117,8 +117,6 @@
 /* timeout for pm runtime autosuspend */
 #define DAVINCI_I2C_PM_TIMEOUT	1000	/* ms */
 
-#define DAVINCI_I2C_DEFAULT_BUS_FREQ	100
-
 struct davinci_i2c_dev {
 	struct device           *dev;
 	void __iomem		*base;
@@ -134,8 +132,8 @@ struct davinci_i2c_dev {
 #ifdef CONFIG_CPU_FREQ
 	struct notifier_block	freq_transition;
 #endif
-	/* standard bus frequency (kHz) */
-	unsigned int		bus_freq;
+	/* standard bus frequency */
+	unsigned int		bus_freq_hz;
 	/* Chip has a ICPFUNC register */
 	bool			has_pfunc;
 };
@@ -209,16 +207,16 @@ static void i2c_davinci_calc_clk_dividers(struct davinci_i2c_dev *dev)
 	if (device_is_compatible(dev->dev, "ti,keystone-i2c"))
 		d = 6;
 
-	clk = ((input_clock / (psc + 1)) / (dev->bus_freq * 1000));
+	clk = ((input_clock / (psc + 1)) / (dev->bus_freq_hz));
 	/* Avoid driving the bus too fast because of rounding errors above */
-	if (input_clock / (psc + 1) / clk > dev->bus_freq * 1000)
+	if (input_clock / (psc + 1) / clk > dev->bus_freq_hz)
 		clk++;
 	/*
 	 * According to I2C-BUS Spec 2.1, in FAST-MODE LOW period should be at
 	 * least 1.3uS, which is not the case with 50% duty cycle. Driving HIGH
 	 * to LOW ratio as 1 to 2 is more safe.
 	 */
-	if (dev->bus_freq > 100)
+	if (dev->bus_freq_hz > 100000)
 		clkl = (clk << 1) / 3;
 	else
 		clkl = (clk >> 1);
@@ -269,7 +267,7 @@ static int i2c_davinci_init(struct davinci_i2c_dev *dev)
 		davinci_i2c_read_reg(dev, DAVINCI_I2C_CLKL_REG));
 	dev_dbg(dev->dev, "CLKH = %d\n",
 		davinci_i2c_read_reg(dev, DAVINCI_I2C_CLKH_REG));
-	dev_dbg(dev->dev, "bus_freq = %dkHz\n", dev->bus_freq);
+	dev_dbg(dev->dev, "bus_freq_hz = %dHz\n", dev->bus_freq_hz);
 
 
 	/* Take the I2C module out of reset: */
@@ -761,9 +759,9 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 
 	r = device_property_read_u32(&pdev->dev, "clock-frequency", &prop);
 	if (r)
-		prop = DAVINCI_I2C_DEFAULT_BUS_FREQ;
+		prop = I2C_MAX_STANDARD_MODE_FREQ;
 
-	dev->bus_freq = prop / 1000;
+	dev->bus_freq_hz = prop;
 
 	dev->has_pfunc = device_property_present(&pdev->dev, "ti,has-pfunc");
 

-- 
2.51.2


