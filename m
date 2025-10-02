Return-Path: <linux-i2c+bounces-13358-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0CCBB432B
	for <lists+linux-i2c@lfdr.de>; Thu, 02 Oct 2025 16:42:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5F39819E2F40
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Oct 2025 14:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C21131328B;
	Thu,  2 Oct 2025 14:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CMKeQG0P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF6C3128C7
	for <linux-i2c@vger.kernel.org>; Thu,  2 Oct 2025 14:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759416139; cv=none; b=mAHOP4pSvB5+2PYqgZ5kO0Glb3mPoDm0x8nKwg+Q7vJCvY5+6N4+FtJ96wNcZr0zGxEpIgqaBUJGu6zJxJLR+/xpGGANZIddr6YyXCyQHHpIZ9sVeaigO8jZFshAmxu8fMiTnIlpLMiWgbfu4CdoDGQVu2fQPsfZfkR69EwBRf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759416139; c=relaxed/simple;
	bh=w+MZYaVZ02IqzT3KVbIc8v+JL5IabUx7ix7rNxqMcO4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Avpzt6Hqw8uilH7aGgO30RIUvYc4xjAfx2D9RNeT3fvm2aSp2eO2Hr48EyA6wiWOdUAh50/kBxznxY94Dc7OfH1xlJQIxCSzLoQAvTaD09uERn5oF+1zJ/VGfqARk+rI96qgfJi8KAsixDWl3t4VcJYyaf5hzCb1nw+cz+KVZ3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CMKeQG0P; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-57933d3e498so1429565e87.3
        for <linux-i2c@vger.kernel.org>; Thu, 02 Oct 2025 07:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759416136; x=1760020936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b2uUwOXeOx+ZJwhfggQur4FjGWmefpICu6kR9jNyeuE=;
        b=CMKeQG0PlZRSdDX0Om1olTue4VCe3F5imKRjNCLi4YYn9pTMFmjUNs6etY14gUH80w
         A647zT/slVjNtQI/Jfv9WsPQ/6c7G3x2HzwISH+RhN+KK3k8xnnQViv1I4mAb07kHEv+
         BcGaeQERitomkvRihRWdRZVDrBmeSxXWgm8lIyURZgeUWq8TnlmmJARzIVfmd65J63Ap
         gE8eJQkeVWYl21O7uILe0IFBSdQ5kUYPhjjol+ayZXHx5cfqNH2zL0bDf6f8CsQZyuUn
         2S+YKCxPasB+8rjqZgDhGD04Ex4TB2Vo3drxq6+nUFeqNlTf/LN+FUWB+2O1bgB3qPOJ
         HIrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759416136; x=1760020936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b2uUwOXeOx+ZJwhfggQur4FjGWmefpICu6kR9jNyeuE=;
        b=GuRtMrcJqswhaihKDdFvyhMo0U2SVxYX39sv8RiUa7iDnOiIVaEvPvIH3Pv0z966Ki
         wWGn4/ejlyw2hlpbC4nj5KgMTGvlCsQQ+NBDpu4DS1YqRG6v7UPDomK2WQPC9yoUNEIU
         rqE/ihLRmXzFRZhWbXzGX2qN2zibptTvSbdrk2oBCe5iKSsddYQk42eE5RLcUJG8s4J8
         /5vgwbqBmgB2zIapc+5Hvny9kG29UsNXSiNrpp5cWR3K6GYgNLRHkwgSfj/8GOxsiSq2
         KCLQraVmlHtq+5H+lfBA/pWGSWP9YgyuhQRMTZafcR5TIKtXYjW2V3MWIFR6hwpg1SYW
         wcUA==
X-Gm-Message-State: AOJu0Yx/2KmK12JxaOeJUXR8eKD+xmrxatqXG02ov8DZIf+vu+4Uk5Vs
	oaaMyHdVYjgBEKYb+31ZVXjz+qZvXZBv9YVc6WRtGBb/h6kMQHR0KjE1wpANOTP5PII=
X-Gm-Gg: ASbGncupHDDR6xS7SZ9GOKMDGHiDBvC/YOc0cFol4DZuGEqiTgcguhAzt+NVbc8gfOk
	fnuQ8ASLqT0iqvOi6ZLewkv4YL0rKHLeM72EoDrw0fWa6vQnvrBLG38SEOepq50d2BM4xrnK7et
	zpjD8E3/tsonczDmSfSoCaSjLZsLlKY/6QgWTsHwFeQgUzXKZ5P6Q1XzfXyiMKfXBis+bcnTJe6
	aR9C8BriFsJ3IEQA8beSGRopnvOtne9VWSwEvmM9wJwurzSCiBa5siUeTZZ7sn4stgzdhfXJ2Nl
	BKSTyq+ahC8KTISlMddzh6k8nP0ADqksFgONHDuwuS90vCSvHJW5rk1NAbLSow7Tk9iedEHmNG9
	Pxsh2XlpWypVWlq39vyCjvubCVfAKQt+nTTrC+AhR9Abd55XmH2tcap/kyVn42UMx6eugidftPR
	YeP93Y5XhtvQ5LjmyJJkmQjKxtKA==
X-Google-Smtp-Source: AGHT+IGhPnOc8T9NtMczj2X/q8cc3NRXoSP7R5os6ByTZSjWiGkW7WZLddjDX41weWGkosgmQFMyOw==
X-Received: by 2002:a05:6512:2356:b0:57b:8675:e35b with SMTP id 2adb3069b0e04-58af9f0e6d6mr2525880e87.5.1759416135487;
        Thu, 02 Oct 2025 07:42:15 -0700 (PDT)
Received: from [192.168.1.166] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-58b0119e60fsm884712e87.94.2025.10.02.07.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 07:42:14 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Thu, 02 Oct 2025 16:41:34 +0200
Subject: [PATCH v2 3/5] i2c: davinci: calculate bus freq from Hz instead of
 kHz
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-i2c-mux-v2-3-b698564cd956@gmail.com>
References: <20251002-i2c-mux-v2-0-b698564cd956@gmail.com>
In-Reply-To: <20251002-i2c-mux-v2-0-b698564cd956@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2838;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=w+MZYaVZ02IqzT3KVbIc8v+JL5IabUx7ix7rNxqMcO4=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo3o8zNqj3vWMKZsDPeq2WJrbZnQsZi3dBQR9Mo
 6gj5akCgoSJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaN6PMwAKCRCIgE5vWV1S
 MmgTD/9icKEup0hYMJO82jco9VRXMaEsGVKncS5vll1JbZPr8WQ2r4IJnYUWXxqBKADQMZ2U/hk
 V+o3PNP8BlHsaBMwKztFGDfcHgBO/6+wn0e8DWNAF6tAKZsuZW6E6zkjfjDFcuXfiUC5ydl53ym
 iVpyETHBXPuRv5W7GuwzvT5+gr6GES41OtLRiK/Gi1vXMayKzY2nJTjSykw9sqm0xcsuxIqW8/B
 ZGzl2qCIqcwlkhnu1+mCjQend/g6a8D/kdVie8E/NyWPd7ksKbR0vMPPPA653lY8WLwAYJpfifT
 z0xNjGM+YON2rgCpnfiJlnacm0IrDZ+A8eDHwe0xM3RvD/uC88Cn/haIjm8FnyYnT4xleV1/9IA
 4iNhKsnrYiivRvKXL8hIQaLbGmH7lHxK4WrSMHJLjIO38PgUojiz02X/BKGQ8GnO1Ej1wgGQZOA
 NNUvNirR0LynQEehGbyx7EOfXxT6jTqAMLHeA9pAYaxR2a72f5eCzslBktQ2lp3Zz6RzNvR71eo
 /REyhcaxkOQ2n/ngZculFBggFBTcmG4n07/ibjVjpHIsYzbGBtioGjbdtiJF7ljmcEJfpWq3Rsg
 JQrNfVKRru5T5oYP2lcaD7ExPYbdb7M/p+rIbBYUW+6kILoPMH2Ix1gSNiyGmiIZmhqBmBCuHYy
 cVXz3ZtyG79o0Ag==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

The bus frequency is unnecessarily converted between Hz and kHz in
several places.
This is probably an old legacy from the old times (pre-devicetrees)
when the davinci_i2c_platform_data took the bus_freq in kHz.

Stick to Hz.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/busses/i2c-davinci.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 6a3d4e9e07f45ecc228943e877cde1fd9d72e8cb..82f295619c4d0ef108c57d13c10004aa25014cbf 100644
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
2.50.1


