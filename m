Return-Path: <linux-i2c+bounces-2114-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC3A86F1C1
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Mar 2024 18:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05CC31F214D4
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Mar 2024 17:45:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF5812B9DC;
	Sat,  2 Mar 2024 17:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VY93DY2H"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E47CC2BCF7;
	Sat,  2 Mar 2024 17:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709401552; cv=none; b=O9qsHnULfGR7zFCQBVCeCPJ/3Xts6wSjDamuHS4w77jfW3HrYMuyUqJ+lWvbfqSRufLLn3i53qwHqBHbqR4B/XAhfE4QUk72zp/frwY6EuSibKv/rtsKcpFHmlRuJ50EZSadzqTmtYwJ1lpAFAVJBhpub3KLdbjrD+NEWHuQ2Oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709401552; c=relaxed/simple;
	bh=X66Ph8DtwKOgV7WhgccW6ba3WD/IxG6oWrlpNrTNJ5M=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=GZoGWhFrryitAq6WMGlXg5IS/oz2iC1z0V1Ftv3LK91k/lVFRr5ApGnBSlNJa/wARtMmS/B98sMOspfXJRnv7cQ5DBUh9qBAn6/izTRVQIAKx1/KBLRrN3imE8UCJAW+iY54rmyUyx9EhyaYR38jk80At+UvQtbkRlXZfv3qFiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VY93DY2H; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-565a3910f86so4966974a12.3;
        Sat, 02 Mar 2024 09:45:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709401549; x=1710006349; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=yrVFJMvetst3Xm/RqXpn850ovd0bJsyoZmCGBSUPBfo=;
        b=VY93DY2Hdan+SAYvQojQT8L1K2aA7VaIzhh+ailUzT2Pd3X//KlnjnGk4Oah33Ak0x
         ps2TVpod10p7G4y9CQpEoZpihlEWAQvuqAsYe2eB3YWGE2oGWd6ctR+5LTsMslBSE6oP
         J2sxXECxc07j4MSddM+m5UFFaZvMXpyGrdySgRGoCbOQMVYyvzgJd81CkKGdLKn5y2JK
         9nztO8s0wmPmiARBk31UAJfEIm/YIytvDOaGAwfbZx9F3tMYnNpM5IuzRlPWJODwPF9G
         hzobiwpRb9/YPpjxnLKKymlCaxBw4QiYAr5830Dxk04HkbjzqYBjwr73HsorJSLq8vgo
         nTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709401549; x=1710006349;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yrVFJMvetst3Xm/RqXpn850ovd0bJsyoZmCGBSUPBfo=;
        b=ZCNM+hUWmke5g43w9r6lkvP25S55q5uJAUeCX0sJQFWTPm8RyD/d4R40/PsQZECUGV
         rL8UOwrMVHZ3NIlj8Q/Kl9kU7b8cUFpCNBeXvF6lj3pL+XtrQ7x04+eQffAmdg3Sxaj8
         UKi+ZwqmLGOm5Rt8qms14sxvlBZiW3WF8jAMcj3QwAJgec7NwOaAklT2ICiRMSn+HJMi
         /Kgqu3/QLZ4mTYKipLMixXZJBAQHzON/D21RoROpuHls1tddJJRxLeG8JMTEQyecsuBP
         prZJHft4/3ad4mD3A/vb5n7GjPUqb1Qyv16X5cj3Kov95oE/foB446l62E/MuzR0vR8p
         Simw==
X-Forwarded-Encrypted: i=1; AJvYcCXP5ss7p2WQMqldy9gKfiW2rVXHOLhoQdFBN/04AIGtFi/0iK5fnMCgHv2ZS1IGgIPSjHG/w5bJlc9qRFnbBdDckEQ79+HLqBkN
X-Gm-Message-State: AOJu0Yw2Dr27yfHUqMBEmyJ2YyzInreDTgrlLXCoL6vqXWQ7vT/tNbRB
	q0DIKbpyrO6mK2iomGV0FHdKKE7/doDUuWN+4nW/PbHPCxGfVgws
X-Google-Smtp-Source: AGHT+IEZDExaejol+XfA1TI0jXVdyJ3KAQ8w5amAiRKO6/bg2867yJeulElFqkAkFQJFoDCquilqAw==
X-Received: by 2002:a17:906:48cf:b0:a45:5c4:852e with SMTP id d15-20020a17090648cf00b00a4505c4852emr231123ejt.28.1709401549090;
        Sat, 02 Mar 2024 09:45:49 -0800 (PST)
Received: from ?IPV6:2a01:c23:bcce:a400:2519:2036:7f0:6005? (dynamic-2a01-0c23-bcce-a400-2519-2036-07f0-6005.c23.pool.telefonica.de. [2a01:c23:bcce:a400:2519:2036:7f0:6005])
        by smtp.googlemail.com with ESMTPSA id d25-20020a1709067f1900b00a440e2ada28sm2893253ejr.201.2024.03.02.09.45.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Mar 2024 09:45:48 -0800 (PST)
Message-ID: <2b88cd6d-8be2-48c4-b779-df40ac0472de@gmail.com>
Date: Sat, 2 Mar 2024 18:45:48 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Input: bma150: remove I2C_CLASS_HWMON from drivers w/o
 detect and address_list
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Wolfram Sang <wsa@kernel.org>
Cc: "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <011ac933-2a45-4a63-895d-d45bfcb8576e@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <011ac933-2a45-4a63-895d-d45bfcb8576e@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.01.2024 16:18, Heiner Kallweit wrote:
> Class-based I2C probing requires detect() and address_list to be
> set in the I2C client driver, see checks in i2c_detect().
> It's misleading to declare I2C_CLASS_HWMON support if this
> precondition isn't met.
> 
Any feedback here? Should this better go through the I2C tree?

> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/input/misc/bma150.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/input/misc/bma150.c b/drivers/input/misc/bma150.c
> index 0fb4cc628..22feaa8c1 100644
> --- a/drivers/input/misc/bma150.c
> +++ b/drivers/input/misc/bma150.c
> @@ -549,7 +549,6 @@ static struct i2c_driver bma150_driver = {
>  		.name	= BMA150_DRIVER,
>  		.pm	= &bma150_pm,
>  	},
> -	.class		= I2C_CLASS_HWMON,
>  	.id_table	= bma150_id,
>  	.probe		= bma150_probe,
>  	.remove		= bma150_remove,


