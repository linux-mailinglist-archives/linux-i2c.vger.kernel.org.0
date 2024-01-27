Return-Path: <linux-i2c+bounces-1490-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BE02A83EDD1
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Jan 2024 16:15:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 48F971F22579
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Jan 2024 15:15:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9267D29410;
	Sat, 27 Jan 2024 15:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fwe53THe"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C251B2940C
	for <linux-i2c@vger.kernel.org>; Sat, 27 Jan 2024 15:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706368512; cv=none; b=D292K8n75uc3yTzA7+zG5CxVJ147fbPka/y5p2hbxFv68tP9AoC471FZR2J7kwaJeFTdzCYNWY2K3ECuVFxgu/oEsnIBl+oHRNBkei5IVMxK8NQ5oP2IXRGYv2gdhG2s5SJpAB7uwqWYA5+b9SYmAZnXbxll4CEG7gqnxkzT96A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706368512; c=relaxed/simple;
	bh=7qX4hB96GF4zN1OHKlcAbEgh+uu0B3vV43MZfwfXGPc=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=dwqkf8BCDsXQ+eena0IOvSp/6F4kbhpdnE5fHlU+IuwpDbJEV53mmcep3LTrLN536w2hyMypYo0nCncfleVAEjBiiErSG6mZTmoGReN/XlPIKIdrE3H9phAUMEc73fCpypWSMvYOX/aSkojVYPZvlpxiuGGLuKtelKpXvjB8CIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fwe53THe; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a34fa0c4bbbso102062466b.1
        for <linux-i2c@vger.kernel.org>; Sat, 27 Jan 2024 07:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706368509; x=1706973309; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nooz5O7xWoBX6xEB7S6cvaVCkubJbclux/Nif5L6HqY=;
        b=Fwe53THeqnLuiT4lhZxYes8WoMlmQXq7UvLD56/YaY7DCut3jvJT9E1Jbm07QnzV+7
         rbOOF5TkIP8d9k12+YEigNE6zDdn6iSeorXx75exfdr4RhF1r0z479DdQ0Wzd1yvpnc7
         JNuyHhaZEAygh2ZAlUIq0zvoV2ACxR5thygOGY8YxFVymb0WGWf1kUvbzoVpxt1TYxjU
         LZBzjyN4aPUuZ7R84blyvf906nxp8ORJ8q3De3Xm9+9nsBWcAmNwY4pjsYcA0gjct75O
         /oOL+Tcuac32aT94D/SbQ0kEKi8M+Y1d0/jwy7k1noRRY6DNNoZIUSn8BjgZoR2nYGLB
         bVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706368509; x=1706973309;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nooz5O7xWoBX6xEB7S6cvaVCkubJbclux/Nif5L6HqY=;
        b=W3Uw/3pwO7TFkowHRPx/RJQikJBzgNJLg9bNj9GXfxqCcmH4pWUSWY9PPh1IXcy3pH
         4C5b9GzkKqQ/9pwE8WbRJByIHlH2beI2xlhYKA3a60WvsA9UlDAByZKchK1+0rldhUAS
         y7tR/DKkVbmQnEJf64fsM+aCsvwm7oTWVHMeqqDghkE9d9jJsfyKH5WGKwB8h6qiCQyW
         rJg7NcX9eeDb1Tax5Mu805TFPj/JxMyM0jO8CKb0QMScAs2z/Dhda0X+t3PFo6Sn6/zv
         lgzFCN5xPgAX4PLgos3fJAvuuo3FQsm3iQpzK6dRKwD1iYeaQtnFLp6CEg/QtnlV2uj+
         803Q==
X-Gm-Message-State: AOJu0YxtL/I4I6yciVi+VFbTe1/UpXkC+97Pr6hn0Ng2ltez/ea2pOTz
	sYTxIQWZi2oWAxDOREcj8EPrf/XJI8jGxPRycm1iGQzNAs3sTWMkMh5TbXEw
X-Google-Smtp-Source: AGHT+IEigGURfhV4t9at+wUksF/2zu95Q9uYsKS6+z8uK+4YEQju6ugC2b2iKVUw/IFb4Ff3XexgQA==
X-Received: by 2002:a17:906:7f8e:b0:a30:dfa9:87ba with SMTP id f14-20020a1709067f8e00b00a30dfa987bamr1129209ejr.53.1706368508658;
        Sat, 27 Jan 2024 07:15:08 -0800 (PST)
Received: from ?IPV6:2a01:c23:b938:5400:11ba:857c:4df8:38b0? (dynamic-2a01-0c23-b938-5400-11ba-857c-4df8-38b0.c23.pool.telefonica.de. [2a01:c23:b938:5400:11ba:857c:4df8:38b0])
        by smtp.googlemail.com with ESMTPSA id n11-20020a1709061d0b00b00a31805b4165sm1860177ejh.11.2024.01.27.07.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Jan 2024 07:15:08 -0800 (PST)
Message-ID: <18568237-0b57-4b74-86ec-a6c358a4e058@gmail.com>
Date: Sat, 27 Jan 2024 16:15:06 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Corey Minyard <minyard@acm.org>
Cc: openipmi-developer@lists.sourceforge.net,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] ipmi: ipmb: Remove I2C_CLASS_HWMON from drivers w/o detect
 and address_list
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Class-based I2C probing requires detect() and address_list to be
set in the I2C client driver, see checks in i2c_detect().
It's misleading to declare I2C_CLASS_HWMON support if this
precondition isn't met.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/char/ipmi/ipmi_ipmb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/char/ipmi/ipmi_ipmb.c b/drivers/char/ipmi/ipmi_ipmb.c
index 4e335832f..9e5c6d682 100644
--- a/drivers/char/ipmi/ipmi_ipmb.c
+++ b/drivers/char/ipmi/ipmi_ipmb.c
@@ -567,7 +567,6 @@ static const struct i2c_device_id ipmi_ipmb_id[] = {
 MODULE_DEVICE_TABLE(i2c, ipmi_ipmb_id);
 
 static struct i2c_driver ipmi_ipmb_driver = {
-	.class		= I2C_CLASS_HWMON,
 	.driver = {
 		.name = DEVICE_NAME,
 		.of_match_table = of_ipmi_ipmb_match,
-- 
2.43.0


