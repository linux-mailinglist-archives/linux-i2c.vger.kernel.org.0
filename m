Return-Path: <linux-i2c+bounces-1038-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9531F81F583
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Dec 2023 08:30:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA5961C21BAF
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Dec 2023 07:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C15935253;
	Thu, 28 Dec 2023 07:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nFWcvAHK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D971463BA
	for <linux-i2c@vger.kernel.org>; Thu, 28 Dec 2023 07:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40d5adef341so17024705e9.3
        for <linux-i2c@vger.kernel.org>; Wed, 27 Dec 2023 23:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703748609; x=1704353409; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wXjd+4bZiZ8Ko7l3VIaHI/vJ/Lj/GLWewcbeMBNDVk4=;
        b=nFWcvAHKBtm3TqHn3JJSrhSCW5oWHii7iLjw1U/JsnYCAkEN2rsfC0msWTEvsf+fYq
         oT/vpo8jxRm1g/xFWhYapNEaHcyrpBQqNhNSei4jouU9E3zHLET7qz+cvKGeg8qs6IaZ
         k0wOdh4sHDRBRaMXMGK+SQGT6M0rfA4ff18Fj2/9lNqnRZD5vXRPq5Nq+dlcaHpb8Cv4
         SRJdGRvUH1bhSjcJOUiwJs8Z6e9pRH/ed841xuZaMuYxkjyM2g5fR1ov7DUyoxUcJO3S
         F6FOTUiJWJZubf3jLWUgf3r6qzfsFDMg+KOqB4eA78z5zUM01SmGuS2hZtE6zaOvmQsB
         k+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703748609; x=1704353409;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wXjd+4bZiZ8Ko7l3VIaHI/vJ/Lj/GLWewcbeMBNDVk4=;
        b=h/GNbPeFYFg28RMIytKXXgzCKzWVzz42kVoYvZqxScXeQGk4xpkHtHl9NIemhFe1jT
         tohuaEKosyQz8S91uhh0w2E8PAO4a/ZVjIfqEzEE8HEg7pKQzClj00BdzMl1b/BAkiPb
         jUCqVusVnP+RrqX6+mJO027+18tGzm6DBMtOrl/XDiOod0XRsH889MJkhlI4ho7VZvZI
         vbEuaWIRnEFt/Wv7QX1rdkEuf78T0LXFiCfIvp7/GRbUsig/lh4RnbLMteOp+UW660ww
         ffSgKzPsYTS5IilBueOc1kLzpr9OOVFAYkCoTV1OdIioQgXNUTR27vGunrdXJlG93N4J
         RLNw==
X-Gm-Message-State: AOJu0YxW7AE5z+nv8IRAmRAzhqYei3Cl/ntgXFsp8WFURB+Z07KtCWnN
	S0BVTtNn08tbGytXghWTHz4+wLSPOtcmyw==
X-Google-Smtp-Source: AGHT+IEI9RO02JQ1Wx+vbQf+CC49MIgZZB+lCDN8Kz7QN+HdlbXYiLvnleR1evrHs5pq1TrxvxaSow==
X-Received: by 2002:a05:600c:a04:b0:40d:68a4:2bca with SMTP id z4-20020a05600c0a0400b0040d68a42bcamr103438wmp.92.1703748609166;
        Wed, 27 Dec 2023 23:30:09 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id iv13-20020a05600c548d00b0040d30af488asm31459820wmb.40.2023.12.27.23.30.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Dec 2023 23:30:08 -0800 (PST)
Message-ID: <7b39f962-8040-48b0-8580-abf5970bfad0@linaro.org>
Date: Thu, 28 Dec 2023 08:30:05 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] dt-bindings: clock: google,gs101-clock: add PERIC0
 clock management unit
Content-Language: en-US
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Peter Griffin <peter.griffin@linaro.org>
Cc: sboyd@kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org,
 alim.akhtar@samsung.com, gregkh@linuxfoundation.org, jirislaby@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, s.nawrocki@samsung.com,
 tomasz.figa@gmail.com, cw00.choi@samsung.com, arnd@arndb.de,
 semen.protsenko@linaro.org, andre.draszik@linaro.org, saravanak@google.com,
 willmcvicker@google.com, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
 <20231214105243.3707730-3-tudor.ambarus@linaro.org>
 <20231220150726.GA223267-robh@kernel.org>
 <173b06ab-2518-49ee-a67f-85256bc5b6a7@linaro.org>
 <425a228e-b2d3-4b19-9bcb-6ee1a90cd2ef@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <425a228e-b2d3-4b19-9bcb-6ee1a90cd2ef@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27/12/2023 13:38, Tudor Ambarus wrote:
> Hi, Rob,
> 
> On 12/21/23 07:20, Tudor Ambarus wrote:
>>
>>
>> On 12/20/23 15:07, Rob Herring wrote:
>>> On Thu, Dec 14, 2023 at 10:52:32AM +0000, Tudor Ambarus wrote:
>>>> Add dt-schema documentation for the Connectivity Peripheral 0 (PERIC0)
>>>> clock management unit.
>>>>
>>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>>> ---
>>>>  .../bindings/clock/google,gs101-clock.yaml    | 25 +++++-
>>>>  include/dt-bindings/clock/google,gs101.h      | 86 +++++++++++++++++++
>>>>  2 files changed, 109 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
>>>> index 3eebc03a309b..ba54c13c55bc 100644
>>>> --- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
>>>> +++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
>>>> @@ -30,14 +30,15 @@ properties:
>>>>        - google,gs101-cmu-top
>>>>        - google,gs101-cmu-apm
>>>>        - google,gs101-cmu-misc
>>>> +      - google,gs101-cmu-peric0
>>>>  
>>>>    clocks:
>>>>      minItems: 1
>>>> -    maxItems: 2
>>>> +    maxItems: 3
>>>>  
>>>>    clock-names:
>>>>      minItems: 1
>>>> -    maxItems: 2
>>>> +    maxItems: 3
>>>>  
>>>>    "#clock-cells":
>>>>      const: 1
>>>> @@ -88,6 +89,26 @@ allOf:
>>>>              - const: dout_cmu_misc_bus
>>>>              - const: dout_cmu_misc_sss
>>>>  
>>>> +  - if:
>>>> +      properties:
>>>> +        compatible:
>>>> +          contains:
>>>> +            const: google,gs101-cmu-peric0
>>>> +
>>>> +    then:
>>>> +      properties:
>>>> +        clocks:
>>>> +          items:
>>>> +            - description: External reference clock (24.576 MHz)
>>>> +            - description: Connectivity Peripheral 0 bus clock (from CMU_TOP)
>>>> +            - description: Connectivity Peripheral 0 IP clock (from CMU_TOP)
>>>> +
>>>> +        clock-names:
>>>> +          items:
>>>> +            - const: oscclk
>>>> +            - const: dout_cmu_peric0_bus
>>>> +            - const: dout_cmu_peric0_ip
>>>
>>> 'bus' and 'ip' are sufficient because naming is local to the module. The 
>>> same is true on 'dout_cmu_misc_bus'. As that has not made a release, 
>>> please fix all of them.
>>>
>>
>> Ok, will fix them shortly. Thanks, Rob!
> 
> I tried your suggestion at
> https://lore.kernel.org/linux-arm-kernel/c6cc6e74-6c3d-439b-8dc1-bc50a88a3d8f@linaro.org/
> 
> and we noticed that we'd have to update the clock driver as well.
> These CMUs set the DT clock-name of the parent clock in the driver in
> struct samsung_cmu_info::clk_name[]. The driver then tries to enable the
> parent clock based on the clock-name in exynos_arm64_register_cmu().
> 
> In order to enable the parent clock of the CMU the following would be
> needed in the driver:
> 
> diff --git a/drivers/clk/samsung/clk-gs101.c
> b/drivers/clk/samsung/clk-gs101.c
> index 68a27b78b00b..e91836ea3a98 100644
> --- a/drivers/clk/samsung/clk-gs101.c
> +++ b/drivers/clk/samsung/clk-gs101.c
> @@ -2476,7 +2476,7 @@ static const struct samsung_cmu_info misc_cmu_info
> __initconst = {
>         .nr_clk_ids             = CLKS_NR_MISC,
>         .clk_regs               = misc_clk_regs,
>         .nr_clk_regs            = ARRAY_SIZE(misc_clk_regs),
> -       .clk_name               = "dout_cmu_misc_bus",
> +       .clk_name               = "bus",

Yes, obviously, the names are used...

The entire point was that a week ago Rob said:
"As that has not made a release,  please fix all of them."
but if you keep waiting, like 8 days for this simple patch, his
statement is not true anymore.

The only point was to send a fix *the next day*, so I would apply it and
send further. You kind of solved that problem by waiting entire week for
a simple driver and DTS change.

Best regards,
Krzysztof


