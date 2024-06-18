Return-Path: <linux-i2c+bounces-4098-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C242D90DAA8
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 19:31:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C5F51F22E7F
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2024 17:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF8E149001;
	Tue, 18 Jun 2024 17:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="afWNON3N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB6B479FD;
	Tue, 18 Jun 2024 17:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718731862; cv=none; b=DeVKou4byN1sPUgzVy6XAUD7NMQwDuXOUrHgyIbMiAfSyTtfdfd8+T5cWmP+vQW6skgMr99D2qFY2Q22wWR2jfrXJocjhrYyRmy5tVKUuZmVUBFBrAD0+N6m6iW3kRtlg8OFwfp8cPaNDt1ptDX7KfXNA2ebIHvIKvubHbUPZ0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718731862; c=relaxed/simple;
	bh=/AQZntOEHmAeOiE4QJyncGSod5FVp13d9ADEKStKDuQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KXwVIy2f3VHlBZQfOJbFmE37mJwGH631gE+TWG6Vf8CQVyPGtQh/YU5oJjaIzJtyPdOYqw80lV3RpDXUrJu+wJCruc+Z4VMtF83nnRiZtO/Q6dKDygtv65TjY51/0poTnl6iZPsM3maCbxzEmQAMvlMWjsYDPMusAtYVq9Fb5xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=afWNON3N; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f4a0050b9aso48768935ad.2;
        Tue, 18 Jun 2024 10:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718731860; x=1719336660; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=UqTJDZYhzctseuzM+3YsX5BOkVLM074JPBaxMv1BDQE=;
        b=afWNON3NHN1FH0aImzM1KTg6J1AAuHzGlquc4wD6I/CZBrpEtDdFhKyHo6y19JCZPk
         E111RKC64Hx1UQUl96neh4L67PqXddljVAnVFeYTFhPRRD0WCZsbOVsjm1dCb7oYbAGv
         CacMVBudi6XJ1afZE9URUSSmsgr7sBgUO6Q4C+UjkgCH3CrYGaYLCHTKvIs6ts+0mlOl
         RIYmXX7HTUiCsdFN5zR6dV8e4GgCL5uEImsIxHa6wjVsbHpt4RoCB2eY4htvCgb/LzhJ
         NUakPJqO9qzDEsqlIY31+16/Zy1p59nobfgIqtYSGnsulFLy1Pkbc8PhsTN0gZ6vzNG2
         gc/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718731860; x=1719336660;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UqTJDZYhzctseuzM+3YsX5BOkVLM074JPBaxMv1BDQE=;
        b=oMS8Rg0h42LwwaQfX33jBUei2p0OQBqsdeQqDVqemGZR+ZcrMc9uA/ZUgVkuACtnNq
         5vHjHCNSYTly20MMGtk2aIcl1ctFq0oL9myfgCsqMDtvBSCXmtFcsvZv04h35Hv5pCBU
         eenZwHSpMwDxMYhx36RWHwTKr0KnJ2IY5woazPW69/Ry6akqHJKdO6PqZyLNbKODclAz
         M08re5YSsK3JAxWR/KfK/r4qptciFORJgel6K/humLbtU7nChKe0TkMTCg7XNxlulq0W
         NExFsG9gmj0y6KmfZqBr8qFy56jtS1dmwPzILX36xtrRkh3HPAMjR3lMgwV9aI68DSW5
         Z5kg==
X-Forwarded-Encrypted: i=1; AJvYcCVqsr30BPxXsmi0NB3qs/1wX0MBDmkoBfXmiJIUEVw54AEfOokRfNbUySeQjOtmgAFlvFEfcvlnppPG3slJyfaZwHqwqYYINHZiDUyWO8/KYm2ooaLm/ducV/7TTHH02jLS94U1J6Bn5jKPCXnkDCS0jOgp88xlnGIHUhvWMvciYryOMg==
X-Gm-Message-State: AOJu0YyYf3p0Rls2Ch6sN+JzwfvrnCKOopp5fxg41+lYHtaXUwvvDwK/
	RZZgHiSqtVMfowdvdRv4jJ4bIN7//+FuhfZ4qPjWk4C74RHgvYnlcGrHLw==
X-Google-Smtp-Source: AGHT+IGeAc3WdegYMc0Mx5MrWrXzd451ZIZm/yAoTLvtjgaxjUYBHwS/1UOR//L9zLk8emheL+QD3w==
X-Received: by 2002:a17:903:2449:b0:1f7:3332:65d9 with SMTP id d9443c01a7336-1f9aa3afacbmr3944675ad.9.1718731859905;
        Tue, 18 Jun 2024 10:30:59 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855ee8004sm100201725ad.121.2024.06.18.10.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 10:30:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c2803eed-b4f4-44cf-a7f7-9557d05e798e@roeck-us.net>
Date: Tue, 18 Jun 2024 10:30:56 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/9] Add Mule MFD support
To: Quentin Schulz <quentin.schulz@cherry.de>,
 Farouk Bouabid <farouk.bouabid@cherry.de>, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Peter Rosin <peda@axentia.se>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20240618-dev-mule-i2c-mux-v4-0-5462d28354c8@cherry.de>
 <fdeea79f-4568-4e70-9b49-0c02abc91170@roeck-us.net>
 <4f92528b-8311-4c0b-998b-f0221d7bd474@cherry.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <4f92528b-8311-4c0b-998b-f0221d7bd474@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/18/24 09:51, Quentin Schulz wrote:
> Hi Guenter,
> 
> On 6/18/24 6:29 PM, Guenter Roeck wrote:
>> On 6/18/24 09:06, Farouk Bouabid wrote:
>>> Mule is an MCU that emulates a set of I2C devices which are reachable
>>> through an I2C-mux.
>>>
>>> The mux and amc6821 combined make the Mule multi-function device (@0x18)
>>>
>>
>> I don't think that is appropriate. Those devices should all have separate
>> devicetree entries and be modeled as individual i2c devices.
>>
> 
> I think there is a misunderstanding around the wording. They all have separate devicetree entries and they all are individual i2c devices (from the PoV of the kernel, they all are emulated within the same MCU).
> 
> - AMC6821 on address 0x18 for registers from 0x00 to 0xfe.
> - Mux (paging, however you want to call it) on address 0x18 for register 0xff.
> 
> Note that AMC6821 is **emulated** in the MCU so this is not some HW trickery here.
> 
> This MCU also emulates ISL1208 on 0x6f, as well as a PWM controller (merge request pending) and two small AT24 "protocol" EEPROMs, on that same address. Those are behind a paging/muxing mechanism. You access ISL1208 through page 0, PWM controller through page 1, etc...
> 
> So basically, the point is:
> - 0x18 on i2c is now MFD Mule
>    - two platform devices behind MFD = AMC6821 (reg 0x00 to 0xfe) + Mux (reg 0xff)
> - 0x6f for devices "behind" the Mux
>    - page 0 for device behind adapter 0
>    - page 1 for device behind adapter 1
>    - ...
> 
> All of the above are part of the same MCU.
> 
> Mule MFD is a simple-mfd-i2c device with its own devicetree entry.
> Child nodes of the Mule MFD are AMC6821 as a platform device (but operates over i2c) and Mule Mux. That's what was meant as "The mux and amc6821 combined make the Mule multi-function device (@0x18)".
> 
> The Mule Mux then creates N i2c adapters representing the mux/pages, all of those being represented in DT. Each of those have one device on address 0x6f, all represented in DT as well.
> 
> Nothing hidden or hardcoded, everything in DT.
> 
> Did I miss something here?
> 

If it is properly defined in devicetree, the emulated AMC6821 should be
an i2c device, possibly sitting behind an i2c multiplexer, not a
platform device.

Guenter


