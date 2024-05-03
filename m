Return-Path: <linux-i2c+bounces-3411-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9BD8BB4FF
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 22:43:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0681F2884F4
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2024 20:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C432BAE9;
	Fri,  3 May 2024 20:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h67Frvsc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFE418EB0
	for <linux-i2c@vger.kernel.org>; Fri,  3 May 2024 20:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714768987; cv=none; b=SBSvDKai2/M1EFVVgJ6lP+WWXybjtecWHFFq/spT4AVH69pcFYlthsFMhocmMgqVCXqKHvmeEV+dzKhLmzEJUV2EdIUY1fvw7qkamCUY2GrMb99NvsYYkOy49MZb83HR5Bmz0vDSLSDOzNXSZ4lXv3Y0D2r7tC0DeVbXXaj6B4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714768987; c=relaxed/simple;
	bh=gIh0BR48EkMNjwITLd3gELiArkEpHR6AdmSFFD+u6RM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dbkqSIsGsGI+mjQV2Zfuz1nUreQ6J4L8uy6Z6A0ZLRT+6asKP/P1EizVSrqduXyJ7xKJ+xR5SfQtSaKzsN+8z2vwWkIDVUv9HV0fdT6ldeCEtQxLusqgvXq5BuSwRQal8UjM8JNNBYHYeRhS0wjAJ3Rp60fDSZ8Vd8xdSqF4oU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h67Frvsc; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a58fbbcd77aso5676666b.2
        for <linux-i2c@vger.kernel.org>; Fri, 03 May 2024 13:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714768984; x=1715373784; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7cHcMulml7cJ4eGrkR96GJiIWh2b5p5Pe3LOG/3quro=;
        b=h67FrvscN1U+y9OzlzMv9kbnrJtJ3y17i5zygaRhoy+L30RiP5nv6B7OJk9GraqDq7
         O37b9UW5xx5JhnIICqmvHitJhH+di2AiNs5hxY8I3m1JWQLRHXXryZNb+2id9ghPdRc3
         WbOk69Ogt7YPYzrOH/NDm1sma/9CflLD6qRyov8UH73MfUAjiuwP8+V7g2qXZGaiOVxf
         RB/VSQVq9fQn9649aMKNRrZKYT7HKIr09S/TrZQA0pdL9LJM+drQpsTyBTu0RyPkqirM
         7eWOcO1X6AjuTjuanmq95jfsA3mG4BIaQFCpiRs0Wxh1J9lgKwTaNjSbYRf3Xkj/Sp7m
         O7jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714768984; x=1715373784;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7cHcMulml7cJ4eGrkR96GJiIWh2b5p5Pe3LOG/3quro=;
        b=Woe1DfmED8oUv8tEbLSdQEfZKjN2L6lpSX+kfUBHZEREXU9tWXroNwKjQwITaoD55W
         RUcOpdEKFghsD1uNAEH4qSYHkCE/qOK2jKgz3YjlVCwruOaGZeBUxHfvkQSuKkmDH2K6
         zVp6GEl6VrHGqGIAi02Bc3yRZiEbg2SdQGWYQIjx6VgQdxeA8PNRx3HbWxldOlvHYQbS
         nGpHq9yQ7c0KSau4yrkj0K63rns5Hr5S5FxsjZTjH7K5hZkPRBmdQaCZFd4UJpe+Yp+a
         LRvDd40QiYUZ94m5lbfvV60/2osqeDzqz3o/lUaKtFW1TF36+fK/8uDAvpMpIz+jWgAq
         d2/Q==
X-Forwarded-Encrypted: i=1; AJvYcCUgxmoZ1udIROY4qFH/HXNC1F9fWRBzmzC2/DIbI8Zpim6LeSL4Enh/x4j+QT6IPL7hXmrnqEqVw5CUTYaZHTvJVhnjZ8fq9hzA
X-Gm-Message-State: AOJu0YwCA2QO7L7/kC/BdwFkYIEV6O/70pb1knDvw+M2PNPkNGE/FNwa
	p2s1wdAHiT7Dd9rDdz9pLlQ/5W+322A8BYxhwcyMo2t/GEVkdHgwkBaPPA==
X-Google-Smtp-Source: AGHT+IHWnCx+2TNPclQWyQmceMBRDmq+BpkkstSh02V73K+cFB+d2ubKNgNlEkaEiVU45zN2OGYFiw==
X-Received: by 2002:a17:906:6d7:b0:a59:a13b:cce4 with SMTP id v23-20020a17090606d700b00a59a13bcce4mr352329ejb.74.1714768984258;
        Fri, 03 May 2024 13:43:04 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6e4f:b700:d39:4c17:4dd6:61cd? (dynamic-2a01-0c22-6e4f-b700-0d39-4c17-4dd6-61cd.c22.pool.telefonica.de. [2a01:c22:6e4f:b700:d39:4c17:4dd6:61cd])
        by smtp.googlemail.com with ESMTPSA id jt21-20020a170906ca1500b00a526e6f5cbdsm2089090ejb.47.2024.05.03.13.43.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 May 2024 13:43:03 -0700 (PDT)
Message-ID: <3e16b1a9-4697-4325-87ce-6d1f57ecac2b@gmail.com>
Date: Fri, 3 May 2024 22:43:03 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT] i2c: i801: Scan for Dell accelerometer i2c address
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Dell.Client.Kernel@dell.com
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa@the-dreams.de>, =?UTF-8?Q?Patrick_H=C3=B6hn?=
 <hoehnp@gmx.de>, "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <cb2e65f8-066a-41ea-ae3b-03950714f33c@gmail.com>
 <20240503143939.xfsxwrcmiflty5fl@pali>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <20240503143939.xfsxwrcmiflty5fl@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.05.2024 16:39, Pali Rohár wrote:
> On Friday 03 May 2024 16:09:03 Heiner Kallweit wrote:
>> So far each new Dell device with an accelerometer requires a patch.
>> All devices, with one older system as an exception, use address 0x29.
>> So I think we can safely scan for the correct address
> 
> This is too risky. Poking random smbus address can lead to the lockup or
> crash of the whole system. I really dislike such change which is going
> to unconditionally on every system to scan or access fixed smbus address.
> Crashing kernel on some new model in future or on some older models is
> the worst user experience which can happen.
> 
The scan is protected by is_dell_system_with_lis3lv02d().
So we know it's a Dell system with an accelerometer.
The only potentially problematic scenario would be:
- It's a Dell system with an accelerometer  and
- Accelerometer is at an address different from 0x29  and
- System has some other device at address 0x29

If there ever should be such a case, we still would have the option to
provide a more specific probe function to i2c_new_scanned_device().
At least for now I don't really see a risk.

> The hardcoded table with model name and address is the safest option to
> prevent crashes or other unexpected behavior.
> 
> Instead, I would suggest to contact Dell if they can provide a way to
> read accelerometer's i2c/smbus address from ACPI/WMI/DMI. And if there

See comment in the driver:
"Accelerometer's I2C address is not specified in DMI nor ACPI"

> is not any way right now then ask Dell to include it for new products.
> So we can avoid having hardcoded table for new products released in
> future.

This is a good point. Not sure whether anybody tried this yet.
Therefore +Dell.Client.Kernel@dell.com


