Return-Path: <linux-i2c+bounces-13073-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CA8B8F1CE
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 08:22:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0F88716E09C
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Sep 2025 06:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDAD42F1FE3;
	Mon, 22 Sep 2025 06:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/yOXj5n"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A4E2F0681
	for <linux-i2c@vger.kernel.org>; Mon, 22 Sep 2025 06:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758522111; cv=none; b=FR869iOLbaJN9lCU7CXji0Cs20nGbN5ArqUj/4WNerw2hGtI+bJ3UM+UylofTMrL64xtN4IDIdMFn+Ldm8eredLBr/RcRyJQp2m2NBI48LiHoZPlLrcDAxeAczGJQMnVg7on3pAAiH30Iyj/QZo5zUGjVA8Yun+v0XLO/bGqNKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758522111; c=relaxed/simple;
	bh=MjUg8WhC2ePO7Wob4lthvdC2KmnV9Son3CvTOIR4tgM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B3zAV6iY+1Rg+8aNeS+d39NNl60g1pUVZnFXQKMOZYADt5lcYKRIxR7fKrxHzbsYfRWTWOrEZV8e9tSp0GTUiJp2NyQUyEaIienmAjb/NO6MWVDhcr+REDhOdXLRIkS+NuA5grJ3pKzPgjr8YGOita3eI9SvYW82/A2KVs2gWhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/yOXj5n; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3515a0bca13so50144381fa.1
        for <linux-i2c@vger.kernel.org>; Sun, 21 Sep 2025 23:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758522108; x=1759126908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HMp6cqsu59t8PToCUbyQtsreHZbwaZi5QAyb9viAGjk=;
        b=L/yOXj5nQOVjyRVrIUWRbHkuVph6+HTn3TyieHte6AXZxtM+J+ugxxWL4SowKl5QC3
         2U9A0WnDAJWr+/3rahUm+vh9r0RBJ3VCmeDEvA8SVe+SZfraqo/cqZ2t3V38IRZkru/V
         qlFYfmwUTMq8kJIrnTO4dUCA+USJfNAvFLz1u94FdFBVfWj1acmR7ckBKFXxXH8Dguru
         0YUYQZ9+Az7K87RlsfTv6S9yy5mVnRpyYtnQ50+vCZmtDxjBgTUoaB8TsPjqWSSbtCNo
         OwE0OCnojlFwiQiCnMfUkhCaZsvCP13n586z9U8sZkPDeGNKhsd2OcTevs0NFyrfouQr
         ZMpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758522108; x=1759126908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HMp6cqsu59t8PToCUbyQtsreHZbwaZi5QAyb9viAGjk=;
        b=DdMw+W7rYvL4MqZ2cIQK78TXyhj7a3zpfDxHUZqz34aG8CF5/dv3KtY2NbIXk6BSMz
         zG3q9wnv1PR3B/ulCOF5/K5CwL3Arn7fCZPmJn+VnKYwdLbRDVujNnsoPYJiItQnh9bZ
         xxjw/aIWwBcZOg0agr+jTypNwoxEUW80NtmOdF8SKdkUHllytuvItTj8/BNsne/Anukc
         I9sWcb/q+ld+nUhsWhv+LaAF0AXNaRnOUYtLhGfRj85SuGMaQ1IDJ7RqDociEFO0l2/2
         xi31fKCX7ntL27fppZqWROnl21e0CEinpczDHoHEYoPTeSUa+QXdRKlC6GDBpkkZuPKr
         T8NA==
X-Gm-Message-State: AOJu0Yx2M7hMh3MYB8v3m1Lm0k5GX0A6vp9r4LKqb03/SaE8Kq8HUCrC
	5SikDuglpXFw8UgvbJkENti64QW/kdeMhbhgyBgJ3QTglJNQghenusY2
X-Gm-Gg: ASbGncvqUJp2rrswpbonv3Ra2Dy6Wrl59AMPOFYYX3u4GJ8244Bsj5AtKGH/2aoBmds
	KNA2Nui24M9+EUSeQckfvyoUZwiJSpTu+U3a5msHRFB5dUmMsBOsSR63eXdh171vXDYPf6UuNk5
	lVTsT3z6TSp6nD2QPQYDvUIvZ2CAHc7nP7s33Fd/aFrHiEX/tk5o1ljSuXf7/gpCSo3GiCH2M+J
	l13haemUPHB/T/GEtgCX6z3Jir7/9fJJpKZexhN1cwYki6a5o6RxfF+JP9GtViKVc9fXqdNCz4p
	i6PZEDS/dw/xGSa3SSvMEd03/G67gEzfA0O5q2ZfIxOIWpiv+IlsB737dHOmf2tifZ+Tfm2Fp5p
	iuf07Il416AoD3MwPW1U7fkj/zsPM0+tXHHIq7Meu9/Pbf4L5wwOBY2DR0fgj0hLZkes=
X-Google-Smtp-Source: AGHT+IF0vsidL+U2+O4cbI2W93e2V78iTNBrbec39/ev2fwTbSY9pJ2C+RDb5OzOvmi4WTyIjP7dAA==
X-Received: by 2002:a05:651c:4014:b0:336:cf86:d405 with SMTP id 38308e7fff4ca-3640b95714fmr22173211fa.18.1758522107716;
        Sun, 21 Sep 2025 23:21:47 -0700 (PDT)
Received: from [192.168.1.166] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a99e99e6sm26982661fa.56.2025.09.21.23.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 23:21:47 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Mon, 22 Sep 2025 08:21:00 +0200
Subject: [PATCH RFC 5/7] i2c: davinci: calculate bus freq from Hz instead
 of kHz
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-i2c-mux-v1-5-28c94a610930@gmail.com>
References: <20250922-i2c-mux-v1-0-28c94a610930@gmail.com>
In-Reply-To: <20250922-i2c-mux-v1-0-28c94a610930@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Peter Rosin <peda@axentia.se>, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2503;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=MjUg8WhC2ePO7Wob4lthvdC2KmnV9Son3CvTOIR4tgM=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo0OricZTm/oAQ1+OD0EJGMjU7LFDFZX9qnJlff
 VHGUBLiknSJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaNDq4gAKCRCIgE5vWV1S
 MqW5EACBIOGR2Psx5ihNOOXVUpFaHO0xoSUdfph8wVOTYoK4bHA6EJ+dajDjeB81BQiKnzqdROJ
 q5KO8MrXyBQOclZ6ZLUo9ShVbfDBLkmEsMMmgQ1OwCAItwKVGIbWEoMaL2JkaqE1MN3aM9JJMwF
 XiocyRzYo7MfQYcQ9fF2MFW9/s3JjQWxNcOxFtRTQL/uiAvShs7xo1qSd9o1MwuYADaOCf5nxtG
 ok8vGe3ppH1WqTEH2BXlo65q16WaJWibq0cYf2lBoS6pdaXk8AMRZR/S8HqU8riZXZI9Cl6MC3u
 DaAX4ErhFEgocKTATdFujAYb0uEC8yB1C+Flti/MUX1Hq+qCESRlvj3/FxcFZvsHer7BpT8gZ/N
 6ajT1mb+IGjja3U+5vI38z7m+dwvub5O9998V9YxIelT80lQIMQJ84zVAHsJMAm92OBioY/vjyJ
 glvT0P2t+4BzSMhVVYqYfjFA6dMxqO6vJxLOdX5Z/EMO7HvfYMx8YbZCIkC+iH0PBNhXRPBJtng
 RqSEu2UMfmAtM33aYuTmM5iDA3QXxOTzF/YFaS2kiMQQGD1+22KcXDYTAJ8105ixvvyuGiUtWfI
 HyovMLr+YwvPkRfBuTpaCCqEdDM94RAoOo+2BPLHvYOt6Tl3i8r+9UaNtVGyYD2K48gOi4XORrO
 NT1P0BrqB2o4r6Q==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

The bus frequency is unnecessarily converted between Hz and kHz in
several places.
This is probably an old legacy from the old times (pre-devicetrees)
when the davinci_i2c_platform_data took the bus_freq in kHz.

Stick to Hz.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 drivers/i2c/busses/i2c-davinci.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 6a3d4e9e07f45ecc228943e877cde1fd9d72e8cb..6b18938457d0c5cabc323c364d9330c2890df107 100644
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
@@ -209,16 +207,16 @@ static void i2c_davinci_calc_clk_dividers(struct davinci_i2c_dev *dev)
 	if (device_is_compatible(dev->dev, "ti,keystone-i2c"))
 		d = 6;
 
-	clk = ((input_clock / (psc + 1)) / (dev->bus_freq * 1000));
+	clk = ((input_clock / (psc + 1)) / (dev->bus_freq));
 	/* Avoid driving the bus too fast because of rounding errors above */
-	if (input_clock / (psc + 1) / clk > dev->bus_freq * 1000)
+	if (input_clock / (psc + 1) / clk > dev->bus_freq)
 		clk++;
 	/*
 	 * According to I2C-BUS Spec 2.1, in FAST-MODE LOW period should be at
 	 * least 1.3uS, which is not the case with 50% duty cycle. Driving HIGH
 	 * to LOW ratio as 1 to 2 is more safe.
 	 */
-	if (dev->bus_freq > 100)
+	if (dev->bus_freq > 100000)
 		clkl = (clk << 1) / 3;
 	else
 		clkl = (clk >> 1);
@@ -269,7 +267,7 @@ static int i2c_davinci_init(struct davinci_i2c_dev *dev)
 		davinci_i2c_read_reg(dev, DAVINCI_I2C_CLKL_REG));
 	dev_dbg(dev->dev, "CLKH = %d\n",
 		davinci_i2c_read_reg(dev, DAVINCI_I2C_CLKH_REG));
-	dev_dbg(dev->dev, "bus_freq = %dkHz\n", dev->bus_freq);
+	dev_dbg(dev->dev, "bus_freq = %dHz\n", dev->bus_freq);
 
 
 	/* Take the I2C module out of reset: */
@@ -761,9 +759,9 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 
 	r = device_property_read_u32(&pdev->dev, "clock-frequency", &prop);
 	if (r)
-		prop = DAVINCI_I2C_DEFAULT_BUS_FREQ;
+		prop = I2C_MAX_STANDARD_MODE_FREQ;
 
-	dev->bus_freq = prop / 1000;
+	dev->bus_freq = prop;
 
 	dev->has_pfunc = device_property_present(&pdev->dev, "ti,has-pfunc");
 

-- 
2.50.1


