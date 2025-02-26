Return-Path: <linux-i2c+bounces-9595-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F142CA46AC1
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2025 20:17:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6D6316E387
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2025 19:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49A92237A3B;
	Wed, 26 Feb 2025 19:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZjvqWSIn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D81E22540A;
	Wed, 26 Feb 2025 19:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740597473; cv=none; b=u39Galq0nv5hxinROU1Hchf5O6dC/kzF22lc8J3bA91BqetFxa53S2G6IDWa6868dHf7xQtj3otHoOZehC8avfv0VbIFloqELpHMFEl5mzH0hgGi5gtjrmRIVHzcChWZiB7P9U0SHBmDeKkwg6ti414Tzna0X63aHk2LhMZr9eU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740597473; c=relaxed/simple;
	bh=eaSKH/jTLv+t5ki00+FqOpOAblWrAKl7+AJJe9A2raE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dx83eHdXbb1opJNGW2B5exO+Nz4BzB5aj2nIQjZx+3F789vziMSv/K0XFgy5Unf93ZpT77xeNODbch4tHD/7QXfYVm9/hZqP14ULNBYww1UUnXITVznlt+gW901wPHZRXZ8SIc4gYaWNs3b5IPwkktaAaDnhDBGrcldR3U2v3R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZjvqWSIn; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2fc1843495eso336039a91.1;
        Wed, 26 Feb 2025 11:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740597470; x=1741202270; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=o/5oGC2gwViEr1E42MpoynkcAiCKPb0hT6VPo/lC/1g=;
        b=ZjvqWSIn4Exp4aWlRRLkpJh0HTUY2GMI/K+1ZAQ8RUrcWiKWICxWteP2RLtaCFulw0
         W1a2Xgot+YGVjYIS3spSGPGr7RevKM94gt9cVxRYM2PHDQ4SKtZrplvC/oKPNzoL4Yfh
         8lQsgj92OUn4bxNVdyom4nnbrKhIX718RQdQLBzLZ5Q4BmJH1a5cwPjVIY5x+GF3nDkP
         eDfzFGa2tThULkWb7B1OM8jV9R5NQAWw9L4a0Ab59P9avL/Hkw5GQoH4yGvK3YfwuymG
         /3/s7SYfGiSzjT4yi6Px+jlWu7H1QMi10LkYgcB7LALitnlxmFGV+IdGbBTf0XfNrFKZ
         e2vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740597470; x=1741202270;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o/5oGC2gwViEr1E42MpoynkcAiCKPb0hT6VPo/lC/1g=;
        b=pV/gJUUAphD/j9KQGS9au+iDFbsZylssncRMMOF9ub/KvWRCa65CFbf34h4fW5csxX
         txXCDAb+UZYW5fpWbZrUHeSnTz/HL8AH5KdU1+tUpNOm7ZrDP50o1FoZxc0AHg8lhubL
         uiHK4Zqn4LnPg/SlTjLnrAYO2asb9BjKT0rgFY+jn020DB21dimnZr54nURtPgAFZIe3
         q3C8N2vpwAKuFa19hIA1RxcOnGqNbi/gBOMgWZ8F4wbxCLEE2e9qqvDsttmRe0ZNjlO8
         Tw/JieIimrPb2nyUmx1cPODs1AwRS7ooDLp9eSHrcJxsnWq1N+VaK0tgZzqJrtpJVNsR
         7+WQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkob47Npn3nTDW9zKA8WaoGRTry9Fqd7kb4kql1o9S3LlphpIkhha1JQg2RKy22YLmYKeecityY3WjV8U=@vger.kernel.org, AJvYcCUnlFwxMcc/qOH3QIxcgd+h/EJpsan2LyDR8ULNict0e60Pk8c4pDPZYUVLBWsZqTMAsb01Dc2xiwt57DuB@vger.kernel.org, AJvYcCVeEi2C1WtjZC1JgULrw/3eIkdhQQLmmwRuxsFT1I1Fv7oCQOPVuSEdoCpp1/WNDZ2uphZqNF015HJq@vger.kernel.org, AJvYcCXZScmwwBURotbhwtzcBWs9IbU6M5Qpnre9JtdxvbiVtVZmp7HTYKDGT3wjRkr8STiHDMO/oxd2HDgS@vger.kernel.org, AJvYcCXsi9bz/mKntJqCnBboeoEopttjLgPVrva9glIqJ24pHcsw924X73E2bEc/z04TgPEv2+Fw+MiuVmxE@vger.kernel.org
X-Gm-Message-State: AOJu0YykDENCY2HTXiOYsIe9kYR9kTy6JKdyUrPKokMdtxm2+ODxM59R
	PpHzRjW7TzhmLGCULHlOfT0v5cD7gsNQANgVlMvJfL6w8yLpA28a
X-Gm-Gg: ASbGnctyP3ZEDvA0b/AZwUAqJcYmYQ3IqVNyN/XFpINmuj1ZVu8/s1CSLnV4wPgJsHO
	R3X/JELnrNfBLMl1wyYcY4vh7k4l45Y0Ez5K0vTTkxd4h4miSUsQb/UtiHYa97UFzT4mZMtGPmG
	luCyCMytiD7raaKTlNMPrmiF/P5FqQtdIFg8NXdfd9uiOd1D+gPt8DvQ2XCpse7e4SP7L6Kc16Z
	xBw+ssXmtcD7PoHOAh6L9ih34eV1h3g1M1b6k4CsIPXG0GHSBMekcsQR2kNPawt92GSWNMBmM4J
	SgeR4mOCG4ycS06ar8S8XF2cOD+XK+IGFhyqns8X2HA2/7qFB9YUqDdk2/TVATcpi6UYYcjDGv0
	=
X-Google-Smtp-Source: AGHT+IEclQgnSN18rK45AJ0JR9oUISBGuAufErue0m1QR7+Ls2Zf2RFhj7PYEsgvT7Osreo8mZMhzg==
X-Received: by 2002:a17:90b:37c7:b0:2fa:157e:c78e with SMTP id 98e67ed59e1d1-2fce76a26cfmr39006586a91.7.1740597470194;
        Wed, 26 Feb 2025 11:17:50 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2230a095f10sm36690855ad.135.2025.02.26.11.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Feb 2025 11:17:49 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3f7b031d-7b83-4a00-996d-aabb26278b67@roeck-us.net>
Date: Wed, 26 Feb 2025 11:17:48 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add lt3074
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20250225-upstream-lt3074-v2-0-18ad10ba542e@analog.com>
 <20250225-upstream-lt3074-v2-1-18ad10ba542e@analog.com>
 <20250226-gentle-spicy-jacamar-2dd36a@krzk-bin>
 <20250226145931.GA2314060-robh@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250226145931.GA2314060-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/26/25 06:59, Rob Herring wrote:
> On Wed, Feb 26, 2025 at 09:20:40AM +0100, Krzysztof Kozlowski wrote:
>> On Tue, Feb 25, 2025 at 09:01:13PM +0800, Cedric Encarnacion wrote:
>>> Add Analog Devices LT3074 Ultralow Noise, High PSRR Dropout Linear
>>> Regulator.
>>>
>>> Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
>>> ---
>>>   .../bindings/hwmon/pmbus/adi,lt3074.yaml           | 64 ++++++++++++++++++++++
>>>   MAINTAINERS                                        |  7 +++
>>>   2 files changed, 71 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,lt3074.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,lt3074.yaml
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..714426fd655a8daa96e15e1f789743f36001ac7a
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,lt3074.yaml
>>> @@ -0,0 +1,64 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/hwmon/pmbus/adi,lt3074.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: Analog Devices LT3074 voltage regulator
>>> +
>>> +maintainers:
>>> +  - Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
>>> +
>>> +description: |
>>> +  The LT3074 is a low voltage, ultra-low noise and ultra-fast transient
>>> +  response linear regulator. It allows telemetry for input/output voltage,
>>> +  output current and temperature through the PMBus serial interface.
>>> +
>>> +  Datasheet:
>>> +    https://www.analog.com/en/products/lt3074.html
>>> +
>>> +properties:
>>> +  compatible:
>>> +    enum:
>>> +      - adi,lt3074
>>> +
>>> +  reg:
>>> +    maxItems: 1
>>> +
>>> +  regulators:
>>> +    type: object
>>> +    description: |
>>> +      list of regulators provided by this controller.
>>
>> You have only one regulator, so drop the "regulators". vout could be
>> here, but since you do not have any other resources, I doubt it stands
>> on its own either. This is even visible in your DTS - you named the
>> device as regulator, so logically this is the regulator. Regulator does
>> not have regulators (otherwise they could also have regulators... so
>> triple regulator).
>>
>> hwmon code might need some changes, but that's not really relevant for
>> proper hardware description.
> 
> Normally, I would agree, but it seems generic pmbus code expects this
> structure. This just came up with changing another binding maintained by
> 'Not Me' to follow this structure. We're stuck with the existing way, so
> I don't know that it is worth supporting 2 ways forever. OTOH, is it
> guaranteed that these devices will only ever be pmbus devices or that
> other regulator devices which are not handled as pmbus devices currently
> will be in the future. If so, more flexibility in the bindings will be
> needed.
> 

I would appreciate if someone would explain to me what the problems with
the current PMBus code actually are. I have seen several comments claiming
that the code should be changed, but I have no idea what the expected changes
actually are or, in other words, what the PMBus code should be doing
differently.

Thanks,
Guenter


