Return-Path: <linux-i2c+bounces-7820-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB0939BDFD5
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 08:58:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B1C52851F6
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 07:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4B51D278C;
	Wed,  6 Nov 2024 07:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fhs8BLBx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oa1-f66.google.com (mail-oa1-f66.google.com [209.85.160.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399CA1D1724;
	Wed,  6 Nov 2024 07:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730879899; cv=none; b=ljG4CTufOF8Nw8jYfJ6Nm1KariQx9oQaXAprULTR3bCqEOz2fx90Y3jqAXnLrH2O0gMnMNie6ZeB1jJvf5CvSpDgN1mJGKUtv/rvI9EHEUZzcWzfUhBUOS5OoYVetlh/+QwuQpYbWbhA+k7SZT4S3GHpdJNeh9JBpswDJOKBSCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730879899; c=relaxed/simple;
	bh=cG56ojKp+7Sv9hp5yeYK757jED2UppJUiiYSTfv7bh0=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cRXvrY9WSax1HstMGuVBsi5IwUSHL1I4pINAfBGILDjK9lM8p+SO8+McrfZpbfvuSsu6n3V+clSE8Vk1kVFgoNHQCGKLmAAsaurfXBS+2jn+rXlazWnkhECNc2Hxk7SjK5Iuc5oYuwOzDnF/sfWq5mgAh0H6nBkIt+1O9c5L1to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fhs8BLBx; arc=none smtp.client-ip=209.85.160.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f66.google.com with SMTP id 586e51a60fabf-288d4da7221so3050407fac.1;
        Tue, 05 Nov 2024 23:58:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730879897; x=1731484697; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q8psUYuHR9az8zgJ1oylNVLYOsPxn1uHhNIMrELt9TE=;
        b=Fhs8BLBx/S3e3mZOkHBLRNpbtDodPmJHQnMnngpoiav/w671A3xdJhdd0flfez+461
         C8JKDvfMEl7/7cNw/7aG/0gDOI7gIAEWzDXsFxldDK3sKnikRSIllGfcIYZknSL3UIxx
         ViQR9vRZE59NSfAXComyLeBhnu8SuQ/9EBK3Y5zvcLFz78Rq/ZJVyUmAipq4SHCiy1vQ
         pEMrAJ56bOV4HZKtsVAXI77Ywvi8CQ7l2oEkDLvrqWzysLNF7EBvaCz+c1PJj5dnvY+/
         GhsqbvJz1Z4+z4djG2JaEshVv7u7cr3jjD2d2l9fxPgK1YAY5pTZS3mztXAxahRcW029
         nK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730879897; x=1731484697;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8psUYuHR9az8zgJ1oylNVLYOsPxn1uHhNIMrELt9TE=;
        b=urqrjpFHsxO54yVCykaky5eeMcTX4/WORODz6B6EdSL0LhGT8pb5ZnmfQh/SsIXTzB
         JTlFOCEGpvG7KxmXR+lX/zTs9M7ectkfijZWGNf3d7LpEmtNtimMxQAXmZdIUJa7YPkF
         gr+G6/mjuGrh7tkHNNeNxGHDq4LT4euvBlofuGeueKla3vbjcEQsBomyS0KQR4f7WX06
         CH2ujlhiY3eh0znyR4Mat/lB1bcP5di1JKfzD+xMjzE8lEg+QmN9rvOXUvTpKgFcXrCh
         g5mnXxWQN8VPAgkHPL24FKp3avSGsnNaaD5wLI59uslE7izWt0YBvOJgOubTmP+/7lX5
         ZFXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyOmjZ4SalHKRZLd1DnvnaR6YIU7s2isQC0SfwTLgf7X1McPgpUMFREBwxjSvAV1AN2nUxpwHnWfbdGjfp@vger.kernel.org, AJvYcCUzWDP683Vum65s+Cuvxw9SQHJz73F4YxzZB+g1fZIgGB8ned/lI/4eGxDQK/tAEScCDNkTHmEdvyw5@vger.kernel.org, AJvYcCXqrH/Zj3H6akgd6C8KyNzJGymMeCpLtrmlneln6OmErycrfctULAY3KzeI0s3+8X2FmJVr6c7C5kjl@vger.kernel.org
X-Gm-Message-State: AOJu0YzqS/29WIelR9rr20+lYrvGOSozgXef0CY97sOWK3+JTEyIuHzd
	bo7nrEdzP5V+sNzw/+rPUzWPQnPYgyyJwvEY0pDgjzPiV9Diit74
X-Google-Smtp-Source: AGHT+IFrXzaetGUAe+PmZoXe7bpi2F9Ja9fYIYo6kVRm/kL2GR7CSdjt1a7AGE7QuPTp7+nmhzcSLw==
X-Received: by 2002:a05:6871:72b:b0:260:eb3a:1be with SMTP id 586e51a60fabf-29051db9bdcmr34104242fac.34.1730879897165;
        Tue, 05 Nov 2024 23:58:17 -0800 (PST)
Received: from [127.0.0.1] ([2602:f919:100::2b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc20f494sm11369627b3a.93.2024.11.05.23.58.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Nov 2024 23:58:16 -0800 (PST)
Message-ID: <9dfb250c-d8a1-4536-8658-48b3a2585abd@gmail.com>
Date: Wed, 6 Nov 2024 15:58:10 +0800
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
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <846b4f2a-602e-431e-affc-0e995db5eee5@sifive.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 2024/11/2 11:48, Samuel Holland wrote:
> Hi Troy,
> 
> On 2024-10-28 12:32 AM, Troy Mitchell wrote:
>> The I2C of K1 supports fast-speed-mode and high-speed-mode,
>> and supports FIFO transmission.
>>
>> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
>> ---
>>  .../bindings/i2c/spacemit,k1-i2c.yaml         | 51 +++++++++++++++++++
>>  1 file changed, 51 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>> new file mode 100644
>> index 000000000000..57af66f494e7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>> @@ -0,0 +1,51 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: I2C controller embedded in SpacemiT's K1 SoC
>> +
>> +maintainers:
>> +  - Troy Mitchell <troymitchell988@gmail.com>
>> +
>> +properties:
>> +  compatible:
>> +    const: spacemit,k1-i2c
>> +
>> +  reg:
>> +    maxItems: 2
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
> 
> Looking at the K1 user manual (9.1.4.77 RCPU I2C0 CLOCK RESET CONTROL
> REGISTER(RCPU_I2C0_CLK_RST)), I see two clocks (pclk, fclk) and a reset, which
> looks to be standard across the peripherals in this SoC. Please be sure that the
> binding covers all resources needed to use this peripheral.RCPU stands for Real-time CPU, which is typically used for low power consumption
applications.
We should be using the APBC_TWSIx_CLK_RST register, but it's not listed in the
user manual. However, you can find this register referenced in the K1 clock patch:
https://lore.kernel.org/all/SEYPR01MB4221AA2CA9C91A695FEFA777D7602@SEYPR01MB4221.apcprd01.prod.exchangelabs.com/

Also, to see how to enable the I2C clock in the device tree (note that the
spacemit,apb_clock property is unused in the driver), check out the example here:
https://gitee.com/bianbu-linux/linux-6.1/blob/bl-v1.0.y/arch/riscv/boot/dts/spacemit/k1-x.dtsi#L1048

> 
>> +
>> +  clock-frequency:
>> +    description:
>> +      Desired I2C bus clock frequency in Hz. As only fast and high-speed
>> +      modes are supported by hardware, possible values are 100000 and 400000.
>> +    enum: [100000, 400000]
> 
> This looks wrong. In the manual I see:
> 
> * Supports standard-mode operation up to 100 Kbps
> * Supports fast-mode operation up to 400Kbps
> * Supports high-speed mode (HS mode) slave operation up to 3.4Mbps(High-speed
> I2C only)
> * Supports high-speed mode (HS mode) master operation up to 3.3 Mbps (High-speed
> I2C only)
> 
> So even ignoring HS mode, 100 kHz and 400 kHz are only the maximums, not fixed
> frequencies.
okay. I will fix it in next version.
and should I keep to ignore high-speed mode here?
if not, how about this:

  clock-frequency:
    description:
      Desired I2C bus clock frequency in Hz.
      K1 supports standard, fast, high-speed modes, from 1 to 3300000.
    default: 100000
    minimum: 1
    maximum: 3300000

> 
> Regards,
> Samuel
> 
>> +    default: 100000
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c@d4010800 {
>> +        compatible = "spacemit,k1-i2c";
>> +        reg = <0x0 0xd4010800 0x0 0x38>;
>> +        interrupt-parent = <&plic>;
>> +        interrupts = <36>;
>> +        clocks = <&ccu 90>;
>> +        clock-frequency = <100000>;
>> +    };
>> +
>> +...
> 

-- 
Troy Mitchell

