Return-Path: <linux-i2c+bounces-431-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7977F68B6
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 22:38:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8B1841C20B18
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 21:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50530156F0;
	Thu, 23 Nov 2023 21:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DYAjoOIA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BA0BD62;
	Thu, 23 Nov 2023 13:37:51 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-a011e9bf336so178163566b.3;
        Thu, 23 Nov 2023 13:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700775470; x=1701380270; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5SiogyRR4wGlp0aCovt/3hIDL7TVNtSyHU8dAkrzsME=;
        b=DYAjoOIAsS0eUJOtbWfYcBDNZct5nzIzhWPiInz7c6jeSZga75Js8W5Uy4+va35JXW
         zPDHvSXyQIKotoYKtJVafyywCPuObQWOvztIAkfICPf/xDOEjC/50E7eC7A8P/7HmKA8
         ILQPq7K5lsDg7ydUZrtlwbp/czk7ZNo/D57nfk9zkppplzB1GqSUWjifoT3yj1SFDIXp
         l9jsEfyodMyaGl6x7drEes4COt8ICNfAJCZCG950Nw3TstYhHoSN/GJqElbdAXCJQYke
         fnKmeBkUNJgKOV5/cw04FYXe+aYcYPak6eRfs4d+54ntFkk8cJcddnP6CkyldyQNp2Lx
         a3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700775470; x=1701380270;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:cc:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5SiogyRR4wGlp0aCovt/3hIDL7TVNtSyHU8dAkrzsME=;
        b=Y19vGLYn3QkNAQI1rbZ6AJxwk0ROGO2kwru2LVWIP9KtTSkTyBGEQhmyTFPxnqBlbJ
         r3trufyLqhtAv6Y2zPyHyhCKP1MEa56aTk9FsoWJTkebRKcNkFTheTE8K295Sw7i1cW1
         32SzXOGBCgPFJSztOhIQ7Br6WDjWCoECoLUONy4HCEH6InW1BlRznFyWbW+M9dd+P+nj
         0BPK+BPRsmlk/+bjoTDzuloDfDSuSCA0Rhc7U8Z4l/sgkN6E3+jrcCPdw2nf5qUEOCfL
         fVEvKw+uYbIM97l3yI6C6nj0dxrYgySu+DyMkzvIfTLHFtbXYCa1S1EoiEb1k1appEpy
         hl2w==
X-Gm-Message-State: AOJu0YzjQqWavQRVcObHW073uvFRbRqvGT/BM3rWV43H8AiaWZJJj0Zj
	EQMhamCA0f/BRyD7G3x4ma8=
X-Google-Smtp-Source: AGHT+IFft/gzlywAE3emkERxnx325iF2U8wYbuxvx58ORM9fMAVvn2JU8OCHOOKxHMvm314Qlv0nzg==
X-Received: by 2002:a17:906:41b:b0:9b2:982e:339a with SMTP id d27-20020a170906041b00b009b2982e339amr425470eja.22.1700775469435;
        Thu, 23 Nov 2023 13:37:49 -0800 (PST)
Received: from ?IPV6:2a01:c23:c0f2:3200:3595:63df:4916:a21d? (dynamic-2a01-0c23-c0f2-3200-3595-63df-4916-a21d.c23.pool.telefonica.de. [2a01:c23:c0f2:3200:3595:63df:4916:a21d])
        by smtp.googlemail.com with ESMTPSA id c24-20020a170906529800b009fe2f96ee9bsm1233238ejm.8.2023.11.23.13.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Nov 2023 13:37:49 -0800 (PST)
Message-ID: <2569273b-2601-422b-a16e-031d7c5b4087@gmail.com>
Date: Thu, 23 Nov 2023 22:37:49 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: exynos4-is: fimc-is-i2c: remove I2C_CLASS_SPD
 support
Content-Language: en-US
To: Wolfram Sang <wsa@kernel.org>
References: <e4395454-c500-4d76-af74-42e29d4b40d8@gmail.com>
 <ZV+9Iauj5y7q8R6H@ninjato>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <ZV+9Iauj5y7q8R6H@ninjato>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.11.2023 21:59, Wolfram Sang wrote:
> On Wed, Nov 08, 2023 at 07:42:37AM +0100, Heiner Kallweit wrote:
>> This I2C bus is used by the firmware only and it seems I2C_CLASS_SPD
>> device auto-detection has never been used. So we can safely remove it.
>> That's one further step towards removing I2C_CLASS_SPD completely.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> As I want to apply this cleanup early in the cycle, could we have an ack
> for me to modify this subsystem via I2C, please?
> 

Today I received the following, patch has been applied via the
linux-media tree already.

[git:media_stage/master] media: exynos4-is: fimc-is-i2c: remove I2C_CLASS_SPD support

This is an automatic generated email to let you know that the following patch were queued:

Subject: media: exynos4-is: fimc-is-i2c: remove I2C_CLASS_SPD support
Author:  Heiner Kallweit <hkallweit1@gmail.com>
Date:    Wed Nov 8 07:42:37 2023 +0100

This I2C bus is used by the firmware only and it seems I2C_CLASS_SPD
device auto-detection has never been used. So we can safely remove it.
That's one further step towards removing I2C_CLASS_SPD completely.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>


>> ---
>>  drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.c b/drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.c
>> index bef6e9b4a..44363c424 100644
>> --- a/drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.c
>> +++ b/drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.c
>> @@ -57,7 +57,6 @@ static int fimc_is_i2c_probe(struct platform_device *pdev)
>>  	strscpy(i2c_adap->name, "exynos4x12-isp-i2c", sizeof(i2c_adap->name));
>>  	i2c_adap->owner = THIS_MODULE;
>>  	i2c_adap->algo = &fimc_is_i2c_algorithm;
>> -	i2c_adap->class = I2C_CLASS_SPD;
>>  
>>  	platform_set_drvdata(pdev, isp_i2c);
>>  	pm_runtime_enable(&pdev->dev);


