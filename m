Return-Path: <linux-i2c+bounces-7865-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD6F9BFAC3
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Nov 2024 01:30:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BC891F22996
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Nov 2024 00:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 063AA610C;
	Thu,  7 Nov 2024 00:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="QkA/XWXt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8075F1372
	for <linux-i2c@vger.kernel.org>; Thu,  7 Nov 2024 00:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730939402; cv=none; b=AcU1LO8vDRJt2HaABL4eJWSK1pbb1UAyuDASYn691xSxdc38uDZBJo53vxoW9HQ4E+h6ARM9eqnUSsyoakEHf42u/Qi5niYG/Y/p1jsQbs9zCyvykKG3Q0iPMiGS9ehb3lxA+h46fXk79SIX8+t+ZlBSbkC/G911+wAGfwH0nU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730939402; c=relaxed/simple;
	bh=McX3HCdht9EKGC5tsGAU7Hm6qKwhCcuRe91FXqG4oNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CiiArPeFa9WfKqQOlaNeRQQAxqtCX+ozT8rm3c74koeOeJlJf37CcXOrpr9tcgF1f/jJ1m7CwffYKPe1zYX17xFUZ0drT2XJSDWP8onRetM4KHhSa2V0Pvran2bU0i+rFdREBl0mfiUmix9Mwymlytm9fQw+By/ojEcT0YoE6jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=QkA/XWXt; arc=none smtp.client-ip=209.85.166.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-82cd93a6617so14742939f.3
        for <linux-i2c@vger.kernel.org>; Wed, 06 Nov 2024 16:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1730939398; x=1731544198; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E3Z19IHRqfxS578Ys483rX+/hvz8ULIan1ekFWOQaVI=;
        b=QkA/XWXtzwhXM/h+5lapcBkGyUj1Kd9xDAp82yQFgBUobK68GRWbXcnq/AZ339PJDU
         PDL0Qn7mPltsobBMfNjvWi+MG5x+69o+dTcDKLn91WC7YbE83+8YXrrHygy1PR5tmPY7
         aTKA7GNAs9wOe6sZyh8CAR6T5oNk2GJi5yNO52fqXmZLwRHIncecKl13x9nkjE1j+Mmg
         3DELnIFwr/JPIanV22FO0SvlJoTKFgvfOMFUkC5i2wAjc10GEO7nWKuLm5ZiFFLLuflY
         4nLMeIKuOgZs1WfV+oXQE+lW3St149+95mlfIunw7jpVP0Sda4KmWUoqgjXO0TQk6r4E
         oi7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730939398; x=1731544198;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E3Z19IHRqfxS578Ys483rX+/hvz8ULIan1ekFWOQaVI=;
        b=B+qvKYJM6iX2Hb/ejMqXsBMDt7w2FCABujlTzzRb2rXfKbFg6+NKOuvdEkbpZdVnWV
         gzWBpFNMuGzCfprBHnB4QVCsh0cS0psih+19HyNt5/il2T42r0ZKT8r0kHL9UX4+a2cx
         rEPY6EhkxX0/T8OmfHnofDjFFS+tu4fnOJyUlmkr54eXb2LH17ehI8XoHSxE1dvtlujV
         UQg25ibzaB+yo1btoodZfodp5oFhK+pudZZZJ9WABZmwqmmmyod2/NH2/uZZJdzZpBUw
         8RwJtnXAXKEZOPN1jYUO0HSfJD3ZnfxEum4EpefhjumgqbZFfVN9cXUjFqW4Rfkb7Gg7
         AHQA==
X-Gm-Message-State: AOJu0Ywtwq2S0rzV8Jw0s+Wg7LwnJ35iAECF5RTNrJVwMOFvcT4aA0X6
	LXO706vh+g0HyselJDJXDYHxyjTK4y3gvwGzoY0qhxsBS8D94HbzzdRCcMwH4PE=
X-Google-Smtp-Source: AGHT+IEHbvezWSNRUJM0X1HoonUf45bTn5xrbNazcCjs5Xe/xtZ22FiANoIgp4EDA+vYIihd3QT+SA==
X-Received: by 2002:a05:6602:3413:b0:83a:b235:2d74 with SMTP id ca18e2360f4ac-83b1c40d531mr4199202539f.7.1730939398525;
        Wed, 06 Nov 2024 16:29:58 -0800 (PST)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4de5f8d0ba8sm64230173.110.2024.11.06.16.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 16:29:58 -0800 (PST)
Message-ID: <a9f59ffb-23e9-4c83-8d44-4c766e32b3bf@sifive.com>
Date: Wed, 6 Nov 2024 18:29:56 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
To: Troy Mitchell <troymitchell988@gmail.com>, andi.shyti@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <20241028053220.346283-2-TroyMitchell988@gmail.com>
 <846b4f2a-602e-431e-affc-0e995db5eee5@sifive.com>
 <9dfb250c-d8a1-4536-8658-48b3a2585abd@gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <9dfb250c-d8a1-4536-8658-48b3a2585abd@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Troy,

On 2024-11-06 1:58 AM, Troy Mitchell wrote:
> On 2024/11/2 11:48, Samuel Holland wrote:
>> On 2024-10-28 12:32 AM, Troy Mitchell wrote:
>>> The I2C of K1 supports fast-speed-mode and high-speed-mode,
>>> and supports FIFO transmission.
>>>
>>> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
>>> ---
>>>  .../bindings/i2c/spacemit,k1-i2c.yaml         | 51 +++++++++++++++++++
>>>  1 file changed, 51 insertions(+)
>>>  create mode 100644 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>>> new file mode 100644
>>> index 000000000000..57af66f494e7
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>>> @@ -0,0 +1,51 @@
>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: I2C controller embedded in SpacemiT's K1 SoC
>>> +
>>> +maintainers:
>>> +  - Troy Mitchell <troymitchell988@gmail.com>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: spacemit,k1-i2c
>>> +
>>> +  reg:
>>> +    maxItems: 2
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>
>> Looking at the K1 user manual (9.1.4.77 RCPU I2C0 CLOCK RESET CONTROL
>> REGISTER(RCPU_I2C0_CLK_RST)), I see two clocks (pclk, fclk) and a reset, which
>> looks to be standard across the peripherals in this SoC. Please be sure that the
>> binding covers all resources needed to use this peripheral.
>
> RCPU stands for Real-time CPU, which is typically used for low power consumption
> applications.
> We should be using the APBC_TWSIx_CLK_RST register, but it's not listed in the
> user manual. However, you can find this register referenced in the K1 clock patch:
> https://lore.kernel.org/all/SEYPR01MB4221AA2CA9C91A695FEFA777D7602@SEYPR01MB4221.apcprd01.prod.exchangelabs.com/

Ah, well that driver is missing most of the bus clocks. For example, from a
quick comparison with the manual, the driver includes sdh_axi_aclk, but misses
all of the PWM APB clocks at APBC_PWMx_CLK_RST bit 0.

If the clock gate exists in the hardware, even if it is enabled by default, it
needs to be modeled in the devicetree.

> Also, to see how to enable the I2C clock in the device tree (note that the
> spacemit,apb_clock property is unused in the driver), check out the example here:
> https://gitee.com/bianbu-linux/linux-6.1/blob/bl-v1.0.y/arch/riscv/boot/dts/spacemit/k1-x.dtsi#L1048

The devicetree describes the hardware, irrespective of which features the driver
may or may not use.

>>> +
>>> +  clock-frequency:
>>> +    description:
>>> +      Desired I2C bus clock frequency in Hz. As only fast and high-speed
>>> +      modes are supported by hardware, possible values are 100000 and 400000.
>>> +    enum: [100000, 400000]
>>
>> This looks wrong. In the manual I see:
>>
>> * Supports standard-mode operation up to 100 Kbps
>> * Supports fast-mode operation up to 400Kbps
>> * Supports high-speed mode (HS mode) slave operation up to 3.4Mbps(High-speed
>> I2C only)
>> * Supports high-speed mode (HS mode) master operation up to 3.3 Mbps (High-speed
>> I2C only)
>>
>> So even ignoring HS mode, 100 kHz and 400 kHz are only the maximums, not fixed
>> frequencies.
> okay. I will fix it in next version.
> and should I keep to ignore high-speed mode here?
> if not, how about this:
> 
>   clock-frequency:
>     description:
>       Desired I2C bus clock frequency in Hz.
>       K1 supports standard, fast, high-speed modes, from 1 to 3300000.
>     default: 100000
>     minimum: 1
>     maximum: 3300000

I don't know if high-speed mode should be included, since it requires some extra
negotiation to use. Assuming it should be, that looks reasonable.

Regards,
Samuel

>>
>> Regards,
>> Samuel
>>
>>> +    default: 100000
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - interrupts
>>> +  - clocks
>>> +
>>> +unevaluatedProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    i2c@d4010800 {
>>> +        compatible = "spacemit,k1-i2c";
>>> +        reg = <0x0 0xd4010800 0x0 0x38>;
>>> +        interrupt-parent = <&plic>;
>>> +        interrupts = <36>;
>>> +        clocks = <&ccu 90>;
>>> +        clock-frequency = <100000>;
>>> +    };
>>> +
>>> +...
>>
> 


