Return-Path: <linux-i2c+bounces-7417-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BFFEA99FF06
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 04:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9CD41C23C09
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Oct 2024 02:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68C3F14D43D;
	Wed, 16 Oct 2024 02:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CyFz/+z4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E44621E3BC;
	Wed, 16 Oct 2024 02:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729046770; cv=none; b=c//zQIwksJCnhDYCML3zRPwQ1CqqWINjVnNpbW5DEt3vjaNOtRtElng101SbCoheYs1eymTcIklLy67elRj82wq/OiZZ63B9h3pBTIP+xLOXuuSpmqKngsyBUKKdCbQFVGJI+tShlZIANTwCsiVWxTTXVlMt2fGFze2jCF4icMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729046770; c=relaxed/simple;
	bh=+ClEJv2d96EaDDuxT5HXtbh+dZFuKVaIze5Sf6q1hno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SkfgVQb0xXfnvsdmTndQIt4DzWEeNtk7xhfvIrl4RBeQ5ssNRrt57+NUguoeNwAuoeela1v210SkpzB1bEVlLJHKq3nhyOhjqnmCLGfdDFHFmaQ0XJXBxwZel1vqeSFXk1wy11mtIu4g5JAW7cQn+sjFj02+VykBU7/a5KGJRNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CyFz/+z4; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-4311bb9d4beso41573815e9.3;
        Tue, 15 Oct 2024 19:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729046767; x=1729651567; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IKhuCLpSWzQ3wThkPg3OeLrUCbhzX0VrDGaIxU76xXw=;
        b=CyFz/+z4Dcag+ssZIaF/J9lWwhdfkQXK6YAVH+fBH6znhgtZnpkFJyf6ptSweJgj19
         cLONy4lFJntdXxWKHjAgxA3Ju4LjLBi8erkJDASNqQJe4NgVsol2LFVp0XzVH1D2JM3J
         Kj1WUo0PnIacf8iRxjDsrFl2lEFXiTCanyhdTGUqVWhVqENB2btbTm33desO2mcXADBx
         sgiLdiiHw9tqNCy/EMALKSpx59dc/yADIHnEUb2r/YLFnH6WiKi1r0HovZK9FdqRxMSv
         bu9ZYPzd4+n9enNg1gML/VTIQFBh2rKzqvhtptACHlVQiNJdOqCIh87CCtr4t7RYLGo/
         tdZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729046767; x=1729651567;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IKhuCLpSWzQ3wThkPg3OeLrUCbhzX0VrDGaIxU76xXw=;
        b=Sjuyg2IXP+3Bqne+15HrpdFLLQ70StcQhN/ty4YXgpU8UzbYp9IO0ZYkrP+23zFR93
         g0drPyQjjNyk40krtB0C595QncIhj//mMyrd1LjVNCmx/tYsqRYHYvNiaBb+3a0IUlRn
         4VgqtRoFfDbxOg/qGtn5VV2MpYjhzHB8oo/oTatcJi3tRe5fpVhYx4fcwbDwydWS/ye0
         tcV+wq5ZxVtl6IbrbAJuC4c953Rq3r3E4gqtjtbyHBbkok6xS4aO0ccJ0Fhhf0lIaPjf
         aK82dqu+ZCsnLfh9ExKHNjQIL2N+AQV1dsxvtPF9DwH+OUMLVjDokgZImP5Hsuv0950l
         lXRw==
X-Forwarded-Encrypted: i=1; AJvYcCUxpU3cQePSep8TA88r5qLtJw6FmMu0OviuDY1KBwrMm7DNzLH/CAV2Pg8Rd2mbZWuSHKDmhDhipQ8/@vger.kernel.org, AJvYcCXQw36ISBmKMSpIIG2OtfQlE6HvP/o5y2FR9CVvUvkawfwETTWa7LxLK2dCGNRI4g13wVxhrQVzaXB9f1PM@vger.kernel.org
X-Gm-Message-State: AOJu0YzgmBHOt6I1O7nOXt3ad1a9en2P4YDPWolGba9yqvN+T41dwNQC
	rovWa+Bedtu2EQGubPZlkQTYm/IbVUW2UzcespQFNeeAbpBeurKTkfKsLYhksMxJcQ==
X-Google-Smtp-Source: AGHT+IFr35IvsBk0trU/Hiq09s+neAH8S++v5gDJ3H/2DtIT/VH7+BmsyOvrT5+SenT+qai1a5ac0w==
X-Received: by 2002:adf:ef4d:0:b0:374:ba23:4b3f with SMTP id ffacd0b85a97d-37d5fe956e9mr8775147f8f.9.1729046766376;
        Tue, 15 Oct 2024 19:46:06 -0700 (PDT)
Received: from [127.0.0.1] ([94.131.108.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37d7fa7a173sm3028177f8f.15.2024.10.15.19.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Oct 2024 19:46:05 -0700 (PDT)
Message-ID: <611273f9-db44-48a1-a665-6180bed196a9@gmail.com>
Date: Wed, 16 Oct 2024 10:45:57 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>, andi.shyti@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, troymitchell988@gmail.com
References: <20241015075134.1449458-1-TroyMitchell988@gmail.com>
 <20241015075134.1449458-2-TroyMitchell988@gmail.com>
 <1524dbc2-2c9a-476f-a06a-0d998c29534d@kernel.org>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <1524dbc2-2c9a-476f-a06a-0d998c29534d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 2024/10/15 16:02, Krzysztof Kozlowski wrote:
> On 15/10/2024 09:51, Troy Mitchell wrote:
>> The i2c of K1 supports fast-speed-mode and high-speed-mode,
> 
> s/i2c/I2C/
> 
>> and supports FIFO transmission.
>>
>> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
>> ---
>>  .../bindings/i2c/spacemit,k1-i2c.yaml         | 59 +++++++++++++++++++
>>  1 file changed, 59 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>> new file mode 100644
>> index 000000000000..c1460ec2b323
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>> @@ -0,0 +1,59 @@
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
> 
> There is no such vendor prefix.
> 
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  interrupts:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    maxItems: 1
>> +
>> +  clock-frequency:
>> +    description:
>> +      Desired I2C bus clock frequency in Hz. As only fast and high-speed
>> +      modes are supported by hardware, possible values are 100000 and 400000.
>> +    enum: [100000, 400000]
>> +    default: 100000
>> +
>> +  fifo-disable:
> 
> Why is this a property of a board?
> 
> Also, missing vendor prefix.
> 
> 
>> +    type: boolean
>> +    description:
>> +      Whether to disable FIFO. If FIFO is turned on, it will be interrupted
>> +      only when the FIFO depth is reached, which can reduce the frequency
>> +      of interruption.
>> +    default: false
> 
> Drop

It's a hardware FIFO instead of software.
Is it unnecessary in this file?
If is, why dma can be written in dt-binding.

> 
>> +
>> +unevaluatedProperties: false
> 
> This goes after required: block.
> 
> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - interrupts
>> +  - clocks
>> +
>> +examples:
>> +  - |
>> +    i2c0: i2c@d4010800 {
> 
> Drop unused alias
> 
>> +        compatible = "spacemit,k1-i2c";
> 
> Best regards,
> Krzysztof
> 

Best regards,
Troy

