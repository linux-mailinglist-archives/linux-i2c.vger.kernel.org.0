Return-Path: <linux-i2c+bounces-2945-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C1D8A5C68
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 22:48:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D1378B2337A
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 20:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30933156966;
	Mon, 15 Apr 2024 20:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fAS73yIE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC64155A24;
	Mon, 15 Apr 2024 20:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713214080; cv=none; b=X8Yktd3/MptThRnOZVuLXiPe5Pv+S/ihl/FNJkrlRDUnwt9kDN06vg93yNW6wYxWXs7ZYGLciOaaUNfeTsfTU/a5Z/4HRm4AprNMaQ45kmog+bx/mUkzzWEEuntKvjConemsTLYteS504qJOFid0A5A96fcJv9jvKdTckvQYvEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713214080; c=relaxed/simple;
	bh=PSFgXq/hQUznULxNDp0ZvbdyEw2cgVGCHJ1Pw1IzsaI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=As59fLfz39RpXaR1eIrONV0MMbRQhemrbHE/G3csurqqI8e8WMsd09WhsbLeZ5AU5So5Bl84RMhRyoatJ3XdcgQau1XhMBlUlS0Vn/17HcDSIgzMYXF1lpuS9gDaIMEeaj5IZ2WbBRM4AvJpDXN5ZbhITHrq9K1HyMCgDrl2rzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fAS73yIE; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-57042f84cabso47254a12.2;
        Mon, 15 Apr 2024 13:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713214077; x=1713818877; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BzHuzNT4F9ZQPnDDFCbsKIememKIktlwJOyiTtiia5k=;
        b=fAS73yIEHcZnHcmjOerbXfS5bi5E58veyKNQ5l4Gsn7bStw2zSPYEV+J7c5DuAHfc4
         hD2JKYJV1nlp4I2ZupWksvawm7W1/o/VCBOxY4GppK677gx7OzvcHnVUlzQAjzJn9h62
         0qTtS4W7+zqAoe283s8O9r9vpTcHgz23qyoN6nzsHLmLu81FRe2MJR0Nw4QcxLbV4BLw
         c7zK+zqEfLvBm9Gf2mvD+BoI0AWyoAuo4aDDP5gJxMjRHDp8+z8CvB8j/3XujXxQIdRq
         ZH0839pFTfjPvTNa4UO0c6KPwWCN3ojlv1Poylddene81M8/F8YcoCdurNO4jG6vR8/d
         0LOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713214077; x=1713818877;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BzHuzNT4F9ZQPnDDFCbsKIememKIktlwJOyiTtiia5k=;
        b=SI+R1DkrBvJ07qYBNo7hwoJKbSJnp0+wvap45q3C6vwNrISFA8ulJsei3J2i8tcf5X
         WHA43Hh/QXrxWb7cdLGeuhGgJshKjT97p7VJlXVOs5+eGdWkHYXfoWJ5m3dm+OjFYomQ
         AATqHM3pj6XM5CMMkHXY7f3FOAOWYzDpCqqoT6wE/CyM1ebls+dheSp8gbJVKB03P5CH
         wwQYAckpNoOHgf2YxDd3AA+tUSHYIfpjfZa/oQOr8Z4Jdp2uOxhPbzepn+v68VLq1DEa
         jHhy0vmfHmHl/PTI9uLmvQpCW9nQUohMKY8HugQ3C1YMX5+h65RRkdRPdkg78yhxswte
         eTEA==
X-Forwarded-Encrypted: i=1; AJvYcCVuEXkwYecQeRbR4IbWkjQNAxdhHkAgyKszlH8MSisTHKCZigTll7akgO9Q7+r61dTNBlBBhd3BBj5Z9VBxWiujbtbwNeLe4LQJni4=
X-Gm-Message-State: AOJu0Yydn1MDeuR20qYUOzZoeH0xryjszuUk3zdsFRYSRNBfS8UfLgRt
	aWecSE5ljY7/y+YXO/6NJRJipk8drum/LHQKeUqhvaGwbkok5Ian
X-Google-Smtp-Source: AGHT+IGBa+KWkXTantrM0I1Bx0j7eGAc1ae2TF0ZSdGMqI9EQMn066ZTXZEeZe4KFjRdUzyo+d6uGA==
X-Received: by 2002:a50:d553:0:b0:56e:2c34:cfec with SMTP id f19-20020a50d553000000b0056e2c34cfecmr6948646edj.7.1713214076491;
        Mon, 15 Apr 2024 13:47:56 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6fba:a100:5c1:bdd1:c074:ea9f? (dynamic-2a01-0c22-6fba-a100-05c1-bdd1-c074-ea9f.c22.pool.telefonica.de. [2a01:c22:6fba:a100:5c1:bdd1:c074:ea9f])
        by smtp.googlemail.com with ESMTPSA id d19-20020a50fe93000000b0056c56d18d07sm5249308edt.48.2024.04.15.13.47.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 13:47:56 -0700 (PDT)
Message-ID: <c54ba6b1-e062-4d82-b663-1060b12f14ab@gmail.com>
Date: Mon, 15 Apr 2024 22:47:55 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/4] i2c: i801: Remove usage of I2C_CLASS_SPD
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Wolfram Sang <wsa@the-dreams.de>, Peter Korsgaard
 <peter.korsgaard@barco.com>, Peter Rosin <peda@axentia.se>,
 Guenter Roeck <linux@roeck-us.net>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <90a0786f-136b-4097-9def-8d52e9e5d3cc@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <90a0786f-136b-4097-9def-8d52e9e5d3cc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Only remaining client driver supporting I2C_CLASS_SPD is jc42. This
type of thermal sensor can be found on several DDR3/DDR4 modules.
i2c_register_spd() instantiates also such thermal sensor i2c devices.
Since 71b494e043d2 ("i2c: i801: Call i2c_register_spd for muxed child
segments") i2c_register_spd() is called also for the remaining use case,
systems with muxed SMBUS segments for SPD EEPROMs.
Therefore I2C_CLASS_SPD class-based instantiation isn't needed any longer
in this driver, so remove it.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index ab17e76e3..e577abc77 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -264,7 +264,6 @@ struct i801_mux_config {
 	char *gpio_chip;
 	unsigned values[3];
 	int n_values;
-	unsigned classes[3];
 	unsigned gpios[2];		/* Relative to gpio_chip->base */
 	int n_gpios;
 };
@@ -1315,7 +1314,6 @@ static struct i801_mux_config i801_mux_config_asus_z8_d12 = {
 	.gpio_chip = "gpio_ich",
 	.values = { 0x02, 0x03 },
 	.n_values = 2,
-	.classes = { I2C_CLASS_SPD, I2C_CLASS_SPD },
 	.gpios = { 52, 53 },
 	.n_gpios = 2,
 };
@@ -1324,7 +1322,6 @@ static struct i801_mux_config i801_mux_config_asus_z8_d18 = {
 	.gpio_chip = "gpio_ich",
 	.values = { 0x02, 0x03, 0x01 },
 	.n_values = 3,
-	.classes = { I2C_CLASS_SPD, I2C_CLASS_SPD, I2C_CLASS_SPD },
 	.gpios = { 52, 53 },
 	.n_gpios = 2,
 };
@@ -1434,7 +1431,6 @@ static void i801_add_mux(struct i801_priv *priv)
 	gpio_data.parent = priv->adapter.nr;
 	gpio_data.values = mux_config->values;
 	gpio_data.n_values = mux_config->n_values;
-	gpio_data.classes = mux_config->classes;
 	gpio_data.idle = I2C_MUX_GPIO_NO_IDLE;
 
 	/* Register GPIO descriptor lookup table */
-- 
2.44.0



