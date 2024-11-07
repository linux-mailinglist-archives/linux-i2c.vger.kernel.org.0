Return-Path: <linux-i2c+bounces-7868-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D0929BFC08
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Nov 2024 02:58:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E7AF0284012
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Nov 2024 01:58:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 495BC11712;
	Thu,  7 Nov 2024 01:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VPhM06Zo"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A6871119A;
	Thu,  7 Nov 2024 01:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730944684; cv=none; b=c+lsXT5lo5uOeBxFMbOjfEC+Orkc87LK3rBjiMfeWvbiimZDY9T2IPJVKFBQTv2aeTEhix4uRr+/Qn2X9dzlY5oiqsHU/WjOa3hCUeFZQAUPYj5JTJ5AX5AkGVERO9IAUog4+khzCrN0ME6eBH5PuE9iFNnMsyg5YX5j3/CBNNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730944684; c=relaxed/simple;
	bh=RxbFHrsIJAMGLKYx/komtiZBCIMx/JxWiIK3RsGXsdY=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MepCbcU4OgMDkHc2xCH2DpQNR6x/A1PmPcywm1BnqvEVJ5uC21/OUR6oJ6M5Vu9fxIYGDXZoUGWWYAHyJfdzHROhwk2GS2KJU0tbPihxFL9IaNHcllz0fUyXjj5Qd/yumf6gNy7pC7HLjMcumpMHthSbHaAfqiYJPej6L0/py04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VPhM06Zo; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-720e94d36c8so1428963b3a.1;
        Wed, 06 Nov 2024 17:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730944682; x=1731549482; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=md8qGmUwucZsJOoKZLKFBDyoljb1kwIRUfgiJbBH7Io=;
        b=VPhM06ZorCVe8JeVAWSq4rrUDbxUWEQObExSu5dAfvJhvNtks5MwXkOW+Hov6iBh91
         iTKNunv89T3nI1aqUCCKv0UXpLpK1Kl+O/1Yxng+TgLovIFTWWJCWOE3g6DCUJKXjrw9
         lbiTlSRBHCbr/b1s8XO2btqQQ+Zp+FSD7uGWrIht411PmtapTV3j+JyeINVDDeVZtL3B
         5Gshm1Y6sS6ky4GJBXPJYGbiW20bi6EINc099LBfazDfPkXG9kEh6kb7A/i3TLhLx1QR
         gXPpmMWX/0mYOaDHSRZSF8fICmzP944D4OGZJoYQkznfI6HwrnA5yvMdcWxMbI73KHCI
         uBzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730944682; x=1731549482;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=md8qGmUwucZsJOoKZLKFBDyoljb1kwIRUfgiJbBH7Io=;
        b=KBM5u1QSJRchia3I6nv5WmcQDdhNTVnde0Cqs2s6iqiwnqo2qQdvkZqoU4GOMpszyt
         AG5aOJP2s7oEZ9vsk3p7jklQg2xgxaT4MfAKcx/RT23zJ4BiSQh0zl8N4bP46XbMyxNi
         qVhp/LzJnxflctVtgEYDZ9UP4u/d8q4gIQses2N8+QB9P5A7+uEtBsOQCbM+L2BZO0H9
         9AXuEcVjAaJbwmAQjYhV/jH9wGjfOwlIaTSNyywmExqPGXqkNbg1T3asf/aEjeT7CTSw
         UyK6sHpSRD4+GiP0QPpCI85TL4Y3spPUsyfLorfeSopW44VEOy4r751fCJeBPiFaVY9D
         MNsA==
X-Forwarded-Encrypted: i=1; AJvYcCUcaqKrRTdxcePxnHGQ71kD2jSegIL2XWH/pQ52q1MOoQitwlzPI98oey7UPVFiEHYXlaevoQu2s363UvME@vger.kernel.org, AJvYcCWbStVkLIYHk1ILdmtNCMMoxlWcCGfk6po2QqTJR2kJTpVjmj9U8130eKaIFB8DY4pcA3fldvjl7RGV@vger.kernel.org, AJvYcCWr5uXggcQKZyuaIQx/bdEG/UC9Y/DBuspdyncuVZ/27gLavQc4wjGKGA2O/1A7Rv+LWIacxn+2A8sP@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+hu7EAdJuTtdf8ucE01X32VROgW29NmPt9551ip45TadGx3DV
	4kz+jAXO6C6Kqt5wiIuN4fWVYVOdLldqfAgJ0TBeG5uBC1VSnSH+
X-Google-Smtp-Source: AGHT+IGKzsYST9dTy5KUaBfUjEUHF7tB0ZZbVmni7Y8Yv6eVCopLlqVpmaqigbKcWQMobr4L/irIOg==
X-Received: by 2002:a05:6a00:b93:b0:71e:41a6:a0c6 with SMTP id d2e1a72fcca58-72404352136mr2116162b3a.13.1730944681646;
        Wed, 06 Nov 2024 17:58:01 -0800 (PST)
Received: from [127.0.0.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f41f5c26a6sm202567a12.30.2024.11.06.17.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 17:58:01 -0800 (PST)
Message-ID: <53898c38-1ae4-476b-9782-fdef41a5c932@gmail.com>
Date: Thu, 7 Nov 2024 09:57:53 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
To: Samuel Holland <samuel.holland@sifive.com>, andi.shyti@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
 <20241028053220.346283-2-TroyMitchell988@gmail.com>
 <846b4f2a-602e-431e-affc-0e995db5eee5@sifive.com>
 <9dfb250c-d8a1-4536-8658-48b3a2585abd@gmail.com>
 <a9f59ffb-23e9-4c83-8d44-4c766e32b3bf@sifive.com>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <a9f59ffb-23e9-4c83-8d44-4c766e32b3bf@sifive.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 2024/11/7 08:29, Samuel Holland wrote:
> Hi Troy,
> 
> On 2024-11-06 1:58 AM, Troy Mitchell wrote:
>> On 2024/11/2 11:48, Samuel Holland wrote:
>>> On 2024-10-28 12:32 AM, Troy Mitchell wrote:
>>>> The I2C of K1 supports fast-speed-mode and high-speed-mode,
>>>> and supports FIFO transmission.
>>>>
>>>> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
>>>> ---
>>>>  .../bindings/i2c/spacemit,k1-i2c.yaml         | 51 +++++++++++++++++++
>>>>  1 file changed, 51 insertions(+)
>>>>  create mode 100644 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>>>> new file mode 100644
>>>> index 000000000000..57af66f494e7
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>>>> @@ -0,0 +1,51 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: I2C controller embedded in SpacemiT's K1 SoC
>>>> +
>>>> +maintainers:
>>>> +  - Troy Mitchell <troymitchell988@gmail.com>
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: spacemit,k1-i2c
>>>> +
>>>> +  reg:
>>>> +    maxItems: 2
>>>> +
>>>> +  interrupts:
>>>> +    maxItems: 1
>>>> +
>>>> +  clocks:
>>>> +    maxItems: 1
>>>
>>> Looking at the K1 user manual (9.1.4.77 RCPU I2C0 CLOCK RESET CONTROL
>>> REGISTER(RCPU_I2C0_CLK_RST)), I see two clocks (pclk, fclk) and a reset, which
>>> looks to be standard across the peripherals in this SoC. Please be sure that the
>>> binding covers all resources needed to use this peripheral.
>>
>> RCPU stands for Real-time CPU, which is typically used for low power consumption
>> applications.
>> We should be using the APBC_TWSIx_CLK_RST register, but it's not listed in the
>> user manual. However, you can find this register referenced in the K1 clock patch:
>> https://lore.kernel.org/all/SEYPR01MB4221AA2CA9C91A695FEFA777D7602@SEYPR01MB4221.apcprd01.prod.exchangelabs.com/
> 
> Ah, well that driver is missing most of the bus clocks. For example, from a
> quick comparison with the manual, the driver includes sdh_axi_aclk, but misses
> all of the PWM APB clocks at APBC_PWMx_CLK_RST bit 0.
> 
> If the clock gate exists in the hardware, even if it is enabled by default, it
> needs to be modeled in the devicetree.
I think you mean `APBCSCR`? It will keep enable all time.Just a difference in
frequency.

Should I add it in clockc property? If yes, how about this:
    clocks:
        maxItems: 1

and in dts example:
    i2c@d4010800 {
	...
        clocks = <&clk_apbc>, <&ccu 90>;
	clock-names = "clk_apbc", "clk_twsi";
        ...
    };
But one thing is, apbc_twsi is the sub-clock of clk_apbc, is this a duplicate
listing?
> 
>> Also, to see how to enable the I2C clock in the device tree (note that the
>> spacemit,apb_clock property is unused in the driver), check out the example here:
>> https://gitee.com/bianbu-linux/linux-6.1/blob/bl-v1.0.y/arch/riscv/boot/dts/spacemit/k1-x.dtsi#L1048
> 
> The devicetree describes the hardware, irrespective of which features the driver
> may or may not use.
> 
>>>> +
>>>> +  clock-frequency:
>>>> +    description:
>>>> +      Desired I2C bus clock frequency in Hz. As only fast and high-speed
>>>> +      modes are supported by hardware, possible values are 100000 and 400000.
>>>> +    enum: [100000, 400000]
>>>
>>> This looks wrong. In the manual I see:
>>>
>>> * Supports standard-mode operation up to 100 Kbps
>>> * Supports fast-mode operation up to 400Kbps
>>> * Supports high-speed mode (HS mode) slave operation up to 3.4Mbps(High-speed
>>> I2C only)
>>> * Supports high-speed mode (HS mode) master operation up to 3.3 Mbps (High-speed
>>> I2C only)
>>>
>>> So even ignoring HS mode, 100 kHz and 400 kHz are only the maximums, not fixed
>>> frequencies.
>> okay. I will fix it in next version.
>> and should I keep to ignore high-speed mode here?
>> if not, how about this:
>>
>>   clock-frequency:
>>     description:
>>       Desired I2C bus clock frequency in Hz.
>>       K1 supports standard, fast, high-speed modes, from 1 to 3300000.
>>     default: 100000
>>     minimum: 1
>>     maximum: 3300000
> 
> I don't know if high-speed mode should be included, since it requires some extra
> negotiation to use. Assuming it should be, that looks reasonable.
thanks.
> 
> Regards,
> Samuel
> 
>>>
>>> Regards,
>>> Samuel
>>>
>>>> +    default: 100000
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - interrupts
>>>> +  - clocks
>>>> +
>>>> +unevaluatedProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    i2c@d4010800 {
>>>> +        compatible = "spacemit,k1-i2c";
>>>> +        reg = <0x0 0xd4010800 0x0 0x38>;
>>>> +        interrupt-parent = <&plic>;
>>>> +        interrupts = <36>;
>>>> +        clocks = <&ccu 90>;
>>>> +        clock-frequency = <100000>;
>>>> +    };
>>>> +
>>>> +...
>>>
>>
> 

-- 
Troy Mitchell

