Return-Path: <linux-i2c+bounces-2462-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C38F788191D
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 22:29:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF47DB2382F
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 21:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0F9A4F8B2;
	Wed, 20 Mar 2024 21:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bhmMsx9h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA808594E
	for <linux-i2c@vger.kernel.org>; Wed, 20 Mar 2024 21:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710970133; cv=none; b=ZZ8mcs5JLM1lcM8kTCIEYoNAlDa7SmoPogVt6fIk3WwdL6yBjmGHZSU41uqHMq9f78eT/mrrGcbYNVE8FxrVtM6ksX54HfG5PhKzWjJoyb/7mEq4RohdtXdWtQ8qiHVrOOducwc5s4o0LU7jhK+bd4v+08kkTEvVq1rLLs4vVgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710970133; c=relaxed/simple;
	bh=D6mCONYTbHnrf3zMCG/1NpqEoUrzp8AtYhnjd/+pvTk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=t5VeF0iwKVqbNLupk+I+85ARAb5M0ZoBxPC8Lq1CNCHM6XfeRU01IbF0jdjXsz4BwqudGAgl43zeHyZkcg+ZWLTS8/Ek4ed6lmLfssk2KHwnGxcGazgsfC3II6zHr7KWjJFs6lOkdJtNu1ugewrFvi9zXO78qx+Hz6WZTNvYguA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bhmMsx9h; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-56829f41f81so354785a12.2
        for <linux-i2c@vger.kernel.org>; Wed, 20 Mar 2024 14:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710970130; x=1711574930; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TEht7YnmUJZ8GyBrObrphnVJUwyDyPdgqF88iptSAhQ=;
        b=bhmMsx9hbMGAzw03lyklT7nm4iKmYxLe1ybdBuZ9GuklgaWJG7Sz7MWAMiGdzm80gg
         uaC2besK/d9rPZRxtBPkJaBekdb7XhjxkVKSsplJECpA1/gGeUBzzbfnr4YvXgwmvppb
         XyFVljn0pcVqOJTv+aCySv90Gh+gIm/L+TbMqIluvpDq5jYZhuLIJYkHnvNGGxXCOgVz
         1oIaH+GDkvGNUr+nQYC4Zv6k43tRBaBj1GAXzIRTfkXAszK4/L2IuWB9euJ0AGXsh6RT
         8T8FL9jWAtjdqoALrSk+rjZIcjYGQXuFIPbY5Z7zNBen8lynBa482MvbT1gWZ3KZliXE
         Ynlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710970130; x=1711574930;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TEht7YnmUJZ8GyBrObrphnVJUwyDyPdgqF88iptSAhQ=;
        b=JwEYJuw5ysU/5w+pDZKS54yDxh44R9pZ53Mz4rHcQv6ddRr0SvWHI6gGg5NplXqwgu
         FVXRts5OcKXDnHtkrgY/eDyqlXCDWzJMe8moSB1AQsaJd0bmZzZfIFVM7tiedScCyMMb
         u7lc7I1/9iURjW1V73Ttf/oKpfCZXzXK+UT+dJv21/y/r+1Z4K132n9yFJRd+nFm6sGd
         ziV6sWOsOsGt042JXfkFdC9sQLy6CJpNMuFVLP+0N5UTu6e5OyRO+cP+opozyngFCa4q
         qlW7kBmbO4ndjk7GyTjPpGd3aE0uKIn6xty5T4GgGWZUQRHeSH5ttbeXnfRl0kEDErT9
         ZHHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqOEh3bTal+22HIgpbQYeII2mTUbcQNNM1M1j0xxsuEZCMxz/h6X93iqwDgmOp2b39++sQdEcHxctHoHDMk6dHqd9kt72vFTHA
X-Gm-Message-State: AOJu0Yx2RvImmqlCnqLfot8C7nnVnBp3kzVXf62Aipg4CFrfORPZIWNJ
	Khhfcsdhum12RUHEBxchgKPPWhToy8Fl1LltdwraVDMdI62vOa1/qRdkai+x
X-Google-Smtp-Source: AGHT+IHXaSEdFFzpSJhVOLol0k/87JD9w4M6f2zeRExKMGRqicFx9AAuN5SHIn5KFZv3X0K2J2Mf8w==
X-Received: by 2002:a05:6402:e83:b0:568:b46c:c4ba with SMTP id h3-20020a0564020e8300b00568b46cc4bamr2479009eda.30.1710970129802;
        Wed, 20 Mar 2024 14:28:49 -0700 (PDT)
Received: from ?IPV6:2a01:c22:7ab5:f000:819a:3b4d:1a79:9330? (dynamic-2a01-0c22-7ab5-f000-819a-3b4d-1a79-9330.c22.pool.telefonica.de. [2a01:c22:7ab5:f000:819a:3b4d:1a79:9330])
        by smtp.googlemail.com with ESMTPSA id et5-20020a056402378500b0056ba8b68505sm1402197edb.92.2024.03.20.14.28.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 14:28:49 -0700 (PDT)
Message-ID: <29cf1ae9-a7f8-4ab2-8327-9104e55a8f4d@gmail.com>
Date: Wed, 20 Mar 2024 22:28:50 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: i2c: designware: unhandled interrupt on N100 lpss channel 0
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>
References: <e3f2debf-c762-48d9-876e-bcb60841f909@gmail.com>
 <af839910-2c3d-4559-b8b3-1c6f2372144e@gmail.com>
 <af547aab-e957-4dbf-922d-e2ad13e19877@linux.intel.com>
 <ZfrvhvuW3ZgzWYjt@smile.fi.intel.com>
 <700bbb84-90e1-4505-8ff0-3f17ea8bc631@gmail.com>
 <ZfsHyyrel-d1exxM@smile.fi.intel.com>
 <62500f74-8d73-40f3-80dd-36d3f70084f0@gmail.com>
 <ZftQKXWBKPj3ztYM@smile.fi.intel.com>
 <6d0b7ab5-7864-49f9-92ca-f3413fe6e1f9@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <6d0b7ab5-7864-49f9-92ca-f3413fe6e1f9@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.03.2024 22:26, Heiner Kallweit wrote:
> On 20.03.2024 22:07, Andy Shevchenko wrote:
>> On Wed, Mar 20, 2024 at 09:21:34PM +0100, Heiner Kallweit wrote:
>>> On 20.03.2024 16:59, Andy Shevchenko wrote:
>>>> On Wed, Mar 20, 2024 at 03:56:29PM +0100, Heiner Kallweit wrote:
>>
>> ...
>>
>>>>   grep 0000001b /sys/kernel/debug/pinctrl/*/pins
>>>
>>> pin 3 (GPPC_B_3) 3:INTC1057:00 GPIO 0x80100102 0x0000001b 0x00000000 [LOCKED tx]
>>> pin 82 (GPP_F_7_EMMC_CMD) 135:INTC1057:00 GPIO 0x44000300 0x0000001b 0x00000000 [LOCKED full, ACPI]
>>> pin 182 (GPPC_C_13) 269:INTC1057:00 GPIO 0x44000300 0x0000001b 0x00000000 [LOCKED full, ACPI]
>>
>> I was not correct, the value to grep is '0000[0-3][0-9a-f]1b' as there pull
>> up/down can be enabled.
>>
> Result is the same
> 
>> Nevertheless from the above the pin 3 is one that is enabled as GPIO input with
>> RTE 27 and direct IRQ.  If it's a culprit, try to add in the pinctrl-intel.c at
>> the end of .probe:
>>
>> 	{
>> 		void __iomem *padcfg0;
>> 	        u32 value;
>>
>> 		padcfg0 = intel_get_padcfg(pctrl, 3, PADCFG0);
>>
>> 		value = readl(padcfg0);
>> 		value |= PADCFG0_GPIOTXDIS;
>> 		value |= PADCFG0_GPIORXDIS;
>> 		writel(value, padcfg0);
>> 	}
>>
>> If it helps, it will show the BIOS bug (likely).
>>
> Wow, this indeed fixes the issue for me. Thanks a lot!
> For my understanding: Shall we (kernel driver) rely on the BIOS to configure
> GPIO's properly? Or better assume that GPIO's are in an unknown state on
> driver load and configure them for our needs?
> IOW: If we assume that other systems may have similar issues, should "some driver"
> use e.g. the pinctrl API to configure relevant pins?
> 
By the way: Great support! I wish I could get the same support level everywhere.


