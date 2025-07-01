Return-Path: <linux-i2c+bounces-11730-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D3EAEF8A4
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 14:34:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A200D188D0B5
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Jul 2025 12:34:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2783E2459F3;
	Tue,  1 Jul 2025 12:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PZRdLE57"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF5E1DA60D
	for <linux-i2c@vger.kernel.org>; Tue,  1 Jul 2025 12:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751373260; cv=none; b=DSdDZmCgKA4+df5bP9a+lgYxtcGw3w3oPvWbOP8MyuI/HsfvRyIv7jcfx5R1of7UW3Z0m1pAOsKUU6RKKDo7FFLAmYeC6YPE7yC2pAK1z6YXLYD4D/JfVvcu7MbvA5e2YAA67bLEjRQ7U2SlDYa8+VXwvyyrAJg23LSvQMWWE74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751373260; c=relaxed/simple;
	bh=Y8wJ4Lan8IfQv4UhZ5sciMwxfzwoZcrY+0dnQC1guRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UNVYaATL+8Cy5LhDsdVY+KVINL/aw0URQi2xoLh/QGEHJ6QIk6Sb5Evr2rAFhlDADtjtsMT3nNN7XdGl9bkR2yUTHadTuFBSeyGotEMk/UTSNVdsjk7qdNGAagjbn02BDej/RqEAGM280Q1iJqnYfwEFbkx967bDCgbpzmaP0TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PZRdLE57; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3ab112dea41so1742629f8f.1
        for <linux-i2c@vger.kernel.org>; Tue, 01 Jul 2025 05:34:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751373256; x=1751978056; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=a2Y0ZGDpAX0BDJk162IeYNmyG4BlJkbAT8pcen5el0w=;
        b=PZRdLE57rBSRxmKNxZ3956FfGoDHR0AdFyi35m24fTmVqVagiY83osdmiD00mB1/mg
         PujztM7JBhwcQAet+x/Ba0oFHu2wGTKRhMWgheh+yt5QC19vxGDVgorAeOC8VaoXA8tN
         q1/+PO8PHrJZmUZXgf7Zulmr8gR65miSbDuL81Qu38MsetRslPNJ6hYrY2r7N6naN1oD
         AEL+4Fop+n4vEhIP+mgEFOfZG6d5sNmjftG+RE5wjIsNpD03witkC/rmVfO6e7PvAMVx
         l5whpJ+92An2LlRFZeLkj0w2gdZD2+dEQuaxsawJmV2OkKTTgckE82cPknHJtlfvEwqU
         VWKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751373256; x=1751978056;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a2Y0ZGDpAX0BDJk162IeYNmyG4BlJkbAT8pcen5el0w=;
        b=rtiLuGWad5tl+6CjfQAH/bnKKViXVo2NSuvR8i/4XQ8iJWPiVQ6uQFPvJ3/xSuDq72
         khOnybcXXPNoYzaJ6naZ6NlUFH62OhQPhXpyyJGgtB+TljGlmyq5vX8RYe4e86CWRyZF
         mPXWiG9YERA+LpTcoUgpWip4uP2Zb8w126JqwWBJc82/1EclSwKcXdm65i7u+WUwVkG3
         EpxdPt5MCZ59PROj1CAp2FjDrPuTmue6O+5MisWXKqVH40KsLHGuxsGlQgZIohiDu9vC
         vpSX7RmK1TVdPIAvxyD2hvnNnbILzdx8VlDsMlacK2R5bkfynCZ24X3kVAFhh0jh0qln
         j6Ng==
X-Forwarded-Encrypted: i=1; AJvYcCVPk1Y4UrwNXsqc0iAp3uRyZ5/xuIEohFu07GgKC9nUwS8f4KWbcME1oO6ww6wfSRKmaDsYse+t+LE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyuaT8RoRleISnaygxzi7CW/tCjDg8/qHviFKla1cGlzKts724h
	X59fDCmF0ilOimsaKBJfL1eU6iS6j+Ji/SufjOOqcANGEoY+e50bcXtd
X-Gm-Gg: ASbGncvS2FeTwxCjpUMZGrKJn+vLltVmRnWkApd1YL21vQ+txLc/m5nE29s7H7IgOZq
	0hzUmD9IhU56VCv16hrV/eBZBf3II9uslwyorhK4UfhnpwfZuza+4VAQceYypkvRW6S1Ql2CmuM
	JQTpQlTmBQn442Gig5Qb3WeN9NIM9tb5JjlJs3WlJaPiAYZujMOcD/QGqEjmb96i7YCFe1UJCO7
	TduVQn1XAosJL4euwvq9sj8S3w3cfcji6xnRj1Q7Casr+dVyxS8aanxBNWIery9dWlipnMkLpXA
	VpYjnTKPjxpHUpjC8KPVN3NcBseFina/XPU/U00hVyff1f5R6Saz4YNqSGotTGYzgXTdCtvt9tl
	ag0is95B0ICzjtR/g4fISEzlV55UTQ6iH9DVzc/Zz
X-Google-Smtp-Source: AGHT+IEQwqpI7aaU1fGpqIV4xCnLlnfCcieVWAM943uXcp9D0nF+AJLR9yx5TNrVDCgihr1xZ9fYuA==
X-Received: by 2002:a05:6000:400b:b0:3a4:e4ee:4ca9 with SMTP id ffacd0b85a97d-3a8fe5b2bc9mr13962979f8f.23.1751373256108;
        Tue, 01 Jul 2025 05:34:16 -0700 (PDT)
Received: from [192.168.255.3] (253-8-142-46.pool.kielnet.net. [46.142.8.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c8013fesm13339008f8f.38.2025.07.01.05.34.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:34:15 -0700 (PDT)
Message-ID: <ad8d7f0b-1c25-4a1b-89db-6631d918f9a1@gmail.com>
Date: Tue, 1 Jul 2025 14:34:14 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] dt-bindings: i2c: realtek,rtl9301-i2c: extend for
 RTL9310 support
Content-Language: en-GB
To: Krzysztof Kozlowski <krzk@kernel.org>, linux-i2c@vger.kernel.org
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Markus Stockhausen <markus.stockhausen@gmx.de>
References: <20250701091737.3430-1-jelonek.jonas@gmail.com>
 <20250701091737.3430-4-jelonek.jonas@gmail.com>
 <d123375e-48ec-43f1-bc5a-1256c2f377ec@kernel.org>
From: Jonas Jelonek <jelonek.jonas@gmail.com>
In-Reply-To: <d123375e-48ec-43f1-bc5a-1256c2f377ec@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof,


On 01.07.2025 13:33, Krzysztof Kozlowski wrote:
> On 01/07/2025 11:17, Jonas Jelonek wrote:
>> This extends the dt-bindings for the I2C driver for RTL9300 to account
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/submitting-patches.rst#L95
I'll fix this in v2.
>> for the added support for RTL9310 series.
>>
>> A new property is added to explicitly set the SCL num/hardware instance
>> of the controller that is used. In contrast to RTL9300 the driver needs
>> to know that explicitly for RTL9310 because the SCL selection is now in
>> a global register instead of a master-specific register.
>>
>> The regex for child-node address is adjusted to account for the fact
>> that RTL9310 supports 12 instead of 8 SDA lines.
>>
>> A single generic compatible "realtek,rtl9310-i2c" is added. To best
>> knowledge, all existing SoCs of RTL9310 series (RTL9311, RTL9312,
>> RTL9313) have equal I2C capabilities thus don't need special treatment.
>
> You always need specific front compatible (and fallback if applicable).
>
Since I only have RTL9313 variant in my device, I'd be able to add
'realtek,rtl9313-i2c' as a verified compatible. For others, I do not 
have a list
of which variants actually exist, if there are more variants than just 
RTL9311,
RTL9312 and RTL9313. Should I add compatibles for those anyway or just for
that variant I have?

'realtek,rtl9301-i2c' seems to be such a fallback for RTL9300, should 
the one
for RTL9310 be 'realtek,rtl9311-i2c' or is 'realtek,rtl9310-i2c' fine?
Just asking because this isn't obvious to me right now.
>
>> However, in the unlikely case of future differences with specific
>> SoCs within this series, more can be added as needed.
>>
>> Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
>> ---
>>   .../bindings/i2c/realtek,rtl9301-i2c.yaml     | 33 ++++++++++++++++---
>>   1 file changed, 29 insertions(+), 4 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml b/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
>> index eddfd329c67b..3b32da3de2af 100644
>> --- a/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
>> +++ b/Documentation/devicetree/bindings/i2c/realtek,rtl9301-i2c.yaml
>> @@ -10,9 +10,11 @@ maintainers:
>>     - Chris Packham <chris.packham@alliedtelesis.co.nz>
>>   
>>   description:
>> -  The RTL9300 SoC has two I2C controllers. Each of these has an SCL line (which
>> -  if not-used for SCL can be a GPIO). There are 8 common SDA lines that can be
>> -  assigned to either I2C controller.
>> +  The RTL9300 SoCs have two I2C controllers. Each of these has an SCL line
>> +  (which if not-used for SCL can be a GPIO). There are 8 common SDA lines
>> +  that can be assigned to either I2C controller.
>> +  The RTL9310 SoCs have equal capabilities but support 12 common SDA lines
>> +  which can be assigned to either I2C controller.
>>   
>>   properties:
>>     compatible:
>> @@ -24,6 +26,7 @@ properties:
>>                 - realtek,rtl9303-i2c
>>             - const: realtek,rtl9301-i2c
>>         - const: realtek,rtl9301-i2c
>> +      - const: realtek,rtl9310-i2c
>>   
>>     reg:
>>       description: Register offset and size this I2C controller.
>> @@ -34,8 +37,18 @@ properties:
>>     "#size-cells":
>>       const: 0
>>   
>> +  scl-num:
>
> No, you do not get own instance IDs.
Is that meant for the wording/naming of the property and/or its
description or for the general idea of this property?
> <form letter>
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC. It might happen, that command when run on an older
> kernel, gives you outdated entries. Therefore please be sure you base
> your patches on recent Linux kernel.
>
> Tools like b4 or scripts/get_maintainer.pl provide you proper list of
> people, so fix your workflow. Tools might also fail if you work on some
> ancient tree (don't, instead use mainline) or work on fork of kernel
> (don't, instead use mainline). Just use b4 and everything should be
> fine, although remember about `b4 prep --auto-to-cc` if you added new
> patches to the patchset.
>
> You missed at least devicetree list (maybe more), so this won't be
> tested by automated tooling. Performing review on untested code might be
> a waste of time.
>
> Please kindly resend and include all necessary To/Cc entries.
> </form letter>
>
> Best regards,
> Krzysztof

Best regards,
Jonas

