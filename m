Return-Path: <linux-i2c+bounces-2947-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CF48A5C6E
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 22:49:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C88701C21D7F
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 20:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F1A156969;
	Mon, 15 Apr 2024 20:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J09nI7+Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83957F7FF;
	Mon, 15 Apr 2024 20:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713214179; cv=none; b=HPwm+7SeLaL6Y27yY8L65n8GAmQKAfxwo4I1wo/dbf8CZTBctLWiPB875G4fiuBhmmNPSZ8zkzA0+Z1xpRWUm1MiVwjXd1pQSUcVXpNHEpnz/4NmvNF6Kd6nV6p56xTR2zbTQ0pW8JzFkIsK2uB+3K35SVReY/uUBYjh5U03MjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713214179; c=relaxed/simple;
	bh=UiydVApJesoyrIkizTw+5jXwllRwQoafBXKbTfWQFlQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Zg/8DncHdJ5ol2Mt76Jp4lBrfdSsqojeB5YxyxGegz3/cMzy8LG1rrvXomDFKwFHEUunyvW8rBb2+/VBP6J6nHJhxIOFWK8DFSd4K/E8NLyyFMDbQRmKlrHMKOqCF+7AnZZdsnm8ZUXzMrQugK8ndtvemeaTOeKphc8a+AB/hTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J09nI7+Q; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a44665605f3so389153866b.2;
        Mon, 15 Apr 2024 13:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713214176; x=1713818976; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=g3lMN/A6AFbaLF98HaGAjQE9CvWwVfQFc6zV2xMkvf4=;
        b=J09nI7+Qi40VzRGMjjzS7uS5sNf4bo25KnqmUz/LWSeiCtOqZKdCupgCDHDm0BTCbh
         EzCpWTMx/4aiOOtNzpCEl77TVeHklA5v+49pJC2pfGTu6fs7CyIUIRmbQC8NObR+/8EE
         xgXlS4YNkFAnYh26q21gtJJQpgLmi7HHzpXY4zf6JFa9uQQ/mWF83JShh4Ju8fShrP6S
         boPtyLgmWY1T0b5B8bstMBg4YqWpyKcIM2wTDOSngVA1Fpk8IkT59nVHyCKCttK29Ny3
         cNKUvP7gVkfn7t+fiEUfeqC3tic2+hXKTizYOdAEnR694J+syog9xDzlvECt8xR22kz2
         5NZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713214176; x=1713818976;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g3lMN/A6AFbaLF98HaGAjQE9CvWwVfQFc6zV2xMkvf4=;
        b=Tw4jSuqJ5HdeOClBR57YCnQVt/oVTdNbfzXq9jTL7QJFkbhRgQaZzrT/ed24eV/kJw
         CSEtT9o9QjmH+ZZ4t5MVFtOv9eoLtCbNtwhwS5tY4dOWaSCg6fClFJnhvl/rCn2/WJ+H
         +Y3iCUAifw5H28xDHROipGO9LnE1t/kvz2czeGuQci6yUTR/r89XQGsTc6BGc1AHuLKG
         hMaFewRMSwLSsWsP1mh7JRFbXmZrFcAL8YuQuCcaeTIqYkW50JKrYIB5i1c9fnSENMRP
         PNELsgnukcqdsP60pGr5t+wY03oxLLQa9FbcjL0YkEQ+NCTkI2+q0I0MktEIzGLIcfwy
         kkxg==
X-Forwarded-Encrypted: i=1; AJvYcCV7g4bCQ9OfLkMsy7a4niyaRTJcTO0ZUU0baYcfrB6Rg5/QzAqtia6+S2Mq4i61dbr4cxNbXqsof07QCxtEU6qoSH7ynh22EIRfntE=
X-Gm-Message-State: AOJu0YzrjH62wlJhP8QGfwGybqejZ/JS7dDBEQ1GzNcWHQ/oXUoReFhZ
	iEAD9EPnni90SiG7qSJ8LibpcjPnOttSj9T5tgGBSOIAHwepkcvH
X-Google-Smtp-Source: AGHT+IE4KM3CjhJBHqkhkkLmb2XcdX7VSO+3sfpj0aYmNKwr7rQOtsxzFfvA3mrBMv08Sw29Sqt/Tg==
X-Received: by 2002:a17:907:2d93:b0:a52:274e:4f63 with SMTP id gt19-20020a1709072d9300b00a52274e4f63mr8943555ejc.7.1713214176199;
        Mon, 15 Apr 2024 13:49:36 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6fba:a100:5c1:bdd1:c074:ea9f? (dynamic-2a01-0c22-6fba-a100-05c1-bdd1-c074-ea9f.c22.pool.telefonica.de. [2a01:c22:6fba:a100:5c1:bdd1:c074:ea9f])
        by smtp.googlemail.com with ESMTPSA id gv15-20020a170906f10f00b00a517995c070sm5885138ejb.33.2024.04.15.13.49.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 13:49:35 -0700 (PDT)
Message-ID: <3c4a1715-bfbb-4ae2-b35f-2f20f95e4932@gmail.com>
Date: Mon, 15 Apr 2024 22:49:35 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 3/4] hwmon: jc42: Remove I2C_CLASS_SPD support
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

Last host driver supporting I2C_CLASS_SPD was i801. Now that I2C_CLASS_SPD
support has been removed there, we can remove it here too.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/hwmon/jc42.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/jc42.c b/drivers/hwmon/jc42.c
index 75dc25df0..a00168fe5 100644
--- a/drivers/hwmon/jc42.c
+++ b/drivers/hwmon/jc42.c
@@ -623,7 +623,7 @@ MODULE_DEVICE_TABLE(of, jc42_of_ids);
 #endif
 
 static struct i2c_driver jc42_driver = {
-	.class		= I2C_CLASS_SPD | I2C_CLASS_HWMON,
+	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name	= "jc42",
 		.pm = JC42_DEV_PM_OPS,
-- 
2.44.0



