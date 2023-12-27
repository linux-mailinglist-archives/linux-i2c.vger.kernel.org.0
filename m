Return-Path: <linux-i2c+bounces-1018-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE4281EEE7
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Dec 2023 13:38:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 592801F22E35
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Dec 2023 12:38:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FCF44C75;
	Wed, 27 Dec 2023 12:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oR3Zu7tI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99E3944C66
	for <linux-i2c@vger.kernel.org>; Wed, 27 Dec 2023 12:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-336788cb261so4678233f8f.3
        for <linux-i2c@vger.kernel.org>; Wed, 27 Dec 2023 04:38:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703680705; x=1704285505; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K49GFbJ7QYX/aYXf6WBwayoQ+7LGUrfHPfuMV1wfcM8=;
        b=oR3Zu7tIRl7Vrvbp9vVfkJItESCIkjgW+bo+/EHyfjXRtxwnVEighhIxS0UqsRWztg
         e/ei0pz13MGh3F4hrX4Ubx4HDFXNDv993CLVRqS39pwvsNMLqaByg4DLHsUCP6+xVGj5
         DpecqNpgkNVKBvXH6rQXPSxFIEXfkyGcXnpw3MZzoa2cWn/tR6ladUlrlOSUDsPSXYZ6
         RA55S700OIoQx4HXN8sK6gP87A/gAJwAI8fy4vSRGqq8Qs54XdAd1fGdpc5oUuLxO1Ww
         NvC/FG2r+DgJ0cjuuafcnQSaDovXqc3zZ34vkf1p4+TkUFOGaPjGFYdG0A9rdpEpMmIG
         mJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703680705; x=1704285505;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K49GFbJ7QYX/aYXf6WBwayoQ+7LGUrfHPfuMV1wfcM8=;
        b=jLZOxsjJiIBd6QIKC+058ZRO23DvtQADS69YA/lhgYFqLL/dAmOTHWbB8iZXmTmiOb
         PsgsGzb/J5IEMI5Z7A97QFnbLUOTGiYcN9ro6tq43WTwXSKGHSfdBJb4e2kpUL3rhHI6
         ciHDar1k1lLRgxH2DQ8GCboKhjmJBP5kJT/zkwGxkWSiu/EerA7GlsPYZ2gDPNvCPd0W
         mXxnpA1aOahIBC/+g1fYdeqwSLgS54LAMqYhRcAEdESinIPdNLPSYAw0HrJo+dQo4Glu
         Z+2jaVXCvPKJFd3XCvKq6MTuUQHzdCBV862R0365a0cvUP4xJ9GCuiQ5T3Cqsm7pey6g
         O6lw==
X-Gm-Message-State: AOJu0YxXjf92etyUmfhPfilKmtYhITryVtd4SGgKqKoKLKKxsPCwqbnp
	77CmueTgXe/Xq56Pozo9vCkZW64+4bhJ8Q==
X-Google-Smtp-Source: AGHT+IEk8Z5vNZSE+UxA5iIfvuAuQqH01ijY55xsdhRWuCAzSey3tpD2HL7T5Js0WDnprd1CJaMF2w==
X-Received: by 2002:a5d:5744:0:b0:333:5230:ad12 with SMTP id q4-20020a5d5744000000b003335230ad12mr5438335wrw.72.1703680704864;
        Wed, 27 Dec 2023 04:38:24 -0800 (PST)
Received: from [192.168.0.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id q28-20020adfab1c000000b0033690139ea5sm12410133wrc.44.2023.12.27.04.38.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Dec 2023 04:38:23 -0800 (PST)
Message-ID: <425a228e-b2d3-4b19-9bcb-6ee1a90cd2ef@linaro.org>
Date: Wed, 27 Dec 2023 12:38:21 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] dt-bindings: clock: google,gs101-clock: add PERIC0
 clock management unit
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: Rob Herring <robh@kernel.org>,
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
 linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
 <20231214105243.3707730-3-tudor.ambarus@linaro.org>
 <20231220150726.GA223267-robh@kernel.org>
 <173b06ab-2518-49ee-a67f-85256bc5b6a7@linaro.org>
Content-Language: en-US
In-Reply-To: <173b06ab-2518-49ee-a67f-85256bc5b6a7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Rob,

On 12/21/23 07:20, Tudor Ambarus wrote:
> 
> 
> On 12/20/23 15:07, Rob Herring wrote:
>> On Thu, Dec 14, 2023 at 10:52:32AM +0000, Tudor Ambarus wrote:
>>> Add dt-schema documentation for the Connectivity Peripheral 0 (PERIC0)
>>> clock management unit.
>>>
>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>> ---
>>>  .../bindings/clock/google,gs101-clock.yaml    | 25 +++++-
>>>  include/dt-bindings/clock/google,gs101.h      | 86 +++++++++++++++++++
>>>  2 files changed, 109 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
>>> index 3eebc03a309b..ba54c13c55bc 100644
>>> --- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
>>> +++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
>>> @@ -30,14 +30,15 @@ properties:
>>>        - google,gs101-cmu-top
>>>        - google,gs101-cmu-apm
>>>        - google,gs101-cmu-misc
>>> +      - google,gs101-cmu-peric0
>>>  
>>>    clocks:
>>>      minItems: 1
>>> -    maxItems: 2
>>> +    maxItems: 3
>>>  
>>>    clock-names:
>>>      minItems: 1
>>> -    maxItems: 2
>>> +    maxItems: 3
>>>  
>>>    "#clock-cells":
>>>      const: 1
>>> @@ -88,6 +89,26 @@ allOf:
>>>              - const: dout_cmu_misc_bus
>>>              - const: dout_cmu_misc_sss
>>>  
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            const: google,gs101-cmu-peric0
>>> +
>>> +    then:
>>> +      properties:
>>> +        clocks:
>>> +          items:
>>> +            - description: External reference clock (24.576 MHz)
>>> +            - description: Connectivity Peripheral 0 bus clock (from CMU_TOP)
>>> +            - description: Connectivity Peripheral 0 IP clock (from CMU_TOP)
>>> +
>>> +        clock-names:
>>> +          items:
>>> +            - const: oscclk
>>> +            - const: dout_cmu_peric0_bus
>>> +            - const: dout_cmu_peric0_ip
>>
>> 'bus' and 'ip' are sufficient because naming is local to the module. The 
>> same is true on 'dout_cmu_misc_bus'. As that has not made a release, 
>> please fix all of them.
>>
> 
> Ok, will fix them shortly. Thanks, Rob!

I tried your suggestion at
https://lore.kernel.org/linux-arm-kernel/c6cc6e74-6c3d-439b-8dc1-bc50a88a3d8f@linaro.org/

and we noticed that we'd have to update the clock driver as well.
These CMUs set the DT clock-name of the parent clock in the driver in
struct samsung_cmu_info::clk_name[]. The driver then tries to enable the
parent clock based on the clock-name in exynos_arm64_register_cmu().

In order to enable the parent clock of the CMU the following would be
needed in the driver:

diff --git a/drivers/clk/samsung/clk-gs101.c
b/drivers/clk/samsung/clk-gs101.c
index 68a27b78b00b..e91836ea3a98 100644
--- a/drivers/clk/samsung/clk-gs101.c
+++ b/drivers/clk/samsung/clk-gs101.c
@@ -2476,7 +2476,7 @@ static const struct samsung_cmu_info misc_cmu_info
__initconst = {
        .nr_clk_ids             = CLKS_NR_MISC,
        .clk_regs               = misc_clk_regs,
        .nr_clk_regs            = ARRAY_SIZE(misc_clk_regs),
-       .clk_name               = "dout_cmu_misc_bus",
+       .clk_name               = "bus",
 };

I think I lean towards keeping the name as it was because it's clearer
what are the clock dependencies in the driver. "dout_cmu_misc_bus" is
the clock name used when defining the clock:
DIV(CLK_DOUT_CMU_MISC_BUS, "dout_cmu_misc_bus", "gout_cmu_misc_bus",
    CLK_CON_DIV_CLKCMU_MISC_BUS, 0, 4),
The other exynos clock drivers are using too the driver's clock names
for the clock-names device tree property. For consistency I'd keep it
the same.

If you have a stronger opinion than mine, please tell and I'll happily
update the driver.

Thanks,
ta

