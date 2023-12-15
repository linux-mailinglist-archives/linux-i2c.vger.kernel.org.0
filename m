Return-Path: <linux-i2c+bounces-825-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A933381431D
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 09:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CDFF31C20E4F
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 08:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C63A10A17;
	Fri, 15 Dec 2023 08:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hOqU/JrF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A795179AF
	for <linux-i2c@vger.kernel.org>; Fri, 15 Dec 2023 08:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40c3f68b69aso3790825e9.1
        for <linux-i2c@vger.kernel.org>; Fri, 15 Dec 2023 00:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702627266; x=1703232066; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qmihgIcpypovKce3Rw8dyfl+3YaY2Yil6pF5hP9z400=;
        b=hOqU/JrFgkYp9OORf6PRXIKsamX4Mdgkc4gCgAkoPjTxsYk/G73yWyLIWXt6lcP5Oc
         pJxhuhPHY8qbju7rIC+tVHrA91vKfAaPoh5bokzayUcLWky5Oy6VqJGbQ1rEWeAjiAbp
         sMh/QPDycMHCjSPgQg6vkQEXOo7QQmCJMwrEiTniBxEvn0sHcKB4boVnUIPAVz4aAymS
         Z7DqHz8zVnZTJGDgl2rc6P3pPi5wGC9jNlBRTSBjiIUf8gJkof8Gj4MZ6JR+vRC8lFiY
         bqrv+2fJ1MPYxTnHU5Qkcy4/XAEPUgsBLT4tUIH4Lb653nNvyAjn62tdVgJDXRkqWPF3
         gNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702627266; x=1703232066;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qmihgIcpypovKce3Rw8dyfl+3YaY2Yil6pF5hP9z400=;
        b=lw+9Wfu4V7zFB0op1qjJYkD1kuhtgCWdCIq9l1X2yqWbthlSB1J+sVvFyOrvEU6Kq4
         S7kG3SRCtUB5FZh+5z7YuUYx+X4AtEcqV6SwHJoHQNEFtU35XhLLa+Lq6ujjqekMLUCY
         GcJuunxwBB4HBFBv6Ai4DhIPj6MDXdQFCu8pmAhwbhArqf2agFxsgckrt3yBYfbrj824
         P4VMlTgU0pTbkR9Q9iRHD61Q3VW90AmUsr2k1RTOSRSHGFnXLYuSiyPX3HLjelKh1Qc+
         b9f0EJdskABRO6a2vwzR9650rGLpSkawctXE6Y6flPAR3C++DDgpnZsDWPPPcDyhn8W4
         CUrA==
X-Gm-Message-State: AOJu0YwJ8OJaf0HKEXHQxk555hJmdNWxOHe3Eprj8gkS9qXFiV1+S3SG
	67TwvChVoKne1PxxLumrE4geXQ==
X-Google-Smtp-Source: AGHT+IFaizMfmTfk1pBatmtoqvouAfwt3X/BddgE0L3I+FPpPUI4AV4RF34ktreCHSuhfrS0UreFag==
X-Received: by 2002:a05:600c:1d23:b0:40c:6a86:3f2e with SMTP id l35-20020a05600c1d2300b0040c6a863f2emr344569wms.96.1702627266298;
        Fri, 15 Dec 2023 00:01:06 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id q14-20020a05600c46ce00b0040c4c9c52a3sm16259159wmo.12.2023.12.15.00.01.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Dec 2023 00:01:05 -0800 (PST)
Message-ID: <914b634d-444c-4eae-bc7e-0f20d0629470@linaro.org>
Date: Fri, 15 Dec 2023 09:01:03 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] tty: serial: samsung: add gs101 earlycon support
Content-Language: en-US
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Griffin <peter.griffin@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 krzysztof.kozlowski+dt@linaro.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 andi.shyti@kernel.org, Alim Akhtar <alim.akhtar@samsung.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 Sam Protsenko <semen.protsenko@linaro.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 saravanak@google.com, William McVicker <willmcvicker@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
 <20231214105243.3707730-6-tudor.ambarus@linaro.org>
 <1938fcf1-eb5d-4723-a6c6-d2fe2c6dd1c0@app.fastmail.com>
 <8808ceeb-35dc-4094-aec4-f43c7acd6174@linaro.org>
 <6962ac73-2f44-4c9e-8731-152087815454@app.fastmail.com>
 <584e036a-2ae7-4b88-a517-8f79c6baed4a@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <584e036a-2ae7-4b88-a517-8f79c6baed4a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14/12/2023 15:31, Tudor Ambarus wrote:
> 
> 
> On 12/14/23 14:19, Arnd Bergmann wrote:
>> On Thu, Dec 14, 2023, at 13:52, Tudor Ambarus wrote:
>>> On 12/14/23 12:01, Arnd Bergmann wrote:
>>>> On Thu, Dec 14, 2023, at 11:52, Tudor Ambarus wrote:
>>>>> +static int __init gs101_early_console_setup(struct earlycon_device *device,
>>>>
>>>
>>> It works if in device tree one specifies the reg-io-width property and
>>> sets it to 4. If the reg-io-width is not specified, the iotype defaults
>>> to UPIO_MEM causing the SError interrupt on gs101 which makes the system
>>> unusable.
>>
>> In the case of incorrect DT data like a missing reg-io-width property,
>> I would expect it to still fail once the regular console or tty takes
>> over from earlycon.
>>
>>> Also, if the earlycon comes specified from the kernel params, the
>>> of_setup_earlycon() is no longer called and the earlycon will be set
>>> solely based on the kernel params buffer, thus allowing users to crash
>>> the kernel on wrong earlycon definitions.
>>
>> But that in turn is the same as specifying any other incorrect earlycon.
> 
> I don't think you can crash the kernel if you use other earlycon as you
> don't make accesses on the 32bit restricted bus. But I agree that if
> using the correct earlycon name, and mmio instead mmio32, is equivalent
> to not specifying reg-io-width in dt.
> 
>>
>>> If you think the change is fine, I can amend the commit message with the
>>> description from above.
>>
>> I'm still not convinced we need a special case here when everything else
>> just requires passing the correct data.

We shouldn't need any data from DT for this case, because this property
apparently can be inferred from the compatible. IOW, GS101 SoC requires
reg-io-width=4, everywhere, for each node, thus there is no need to
specify this property. It should be deduced from the compatible.

Best regards,
Krzysztof


