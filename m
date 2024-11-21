Return-Path: <linux-i2c+bounces-8101-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 953D09D4680
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 05:12:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E397EB23A96
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 04:12:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A293713B787;
	Thu, 21 Nov 2024 04:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LAjronJL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com [209.85.215.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C38570820;
	Thu, 21 Nov 2024 04:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732162340; cv=none; b=ixHJ2AHbdzHwwa4bZHYX9JJ7iuc0IUmOrFRHEjud2hve9E8paZvBVp/nr4fuCnCTsFcOmttWwOpk5nsql5gA9IExyuhouo6xLMYIKC+PEeVCZBbvEWZrwQmHlomJabNsE99vVdUcpRx33FaA2IolMRkR1gD9Jezp4gDqQK27VHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732162340; c=relaxed/simple;
	bh=GlMztYYmcyNEeazAr57ckRUkyI6r4uv5fJqxGe/m/Q8=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=r/AsRoLholaBUROekZtoVJ0LlnV81uJYLG1skZtdBMhtGiYaFmJ77/vUU2PNZpV7tZW3vB0xM2Y+gQSOiddVidYQ0q1KoySMV3re2GC4v8ZOBE+BFWXwo5qutkRn2uY1zihL0y0KXRsqczEWC8j4kqGMUkiQH8OXyUtcm7bFiwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LAjronJL; arc=none smtp.client-ip=209.85.215.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f196.google.com with SMTP id 41be03b00d2f7-7f8095a200eso1259949a12.1;
        Wed, 20 Nov 2024 20:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732162337; x=1732767137; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=exKez1cVDbnXT6rl2hY31i8NAVz7pgT+MF0bJD/FrI8=;
        b=LAjronJLdj5UC+hnlmVP9G0cMrBwbAYPKrmWV9v53PMzjEaeBbFJkT7LWaZqv8c+nC
         LZoMDdo3CFeVvmYP4H2X9hnoX3roEEaIjXAzGFrkbOwO82WL6+C4qJXYGSOVJy9GtQ6x
         MR3CCZ9hPaeRoBLatNFJ3O9N/gf2Dkn3OWLG/QHEXNe3oTayUalc312wa00jqz2xJ89z
         R+rGuM9bLClzoGtPI5SeZxv1x79YIT+n9jX4SKNGbgsLn539QDI+8tkamyoQtioQHcJI
         z2y0Ps/Q0Q1FrKGv9Ckfc4qGK5n3Nb/1DFmVJVRW3g1NDO3aSZnXb/kip4anYXctsWQ9
         /kGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732162337; x=1732767137;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=exKez1cVDbnXT6rl2hY31i8NAVz7pgT+MF0bJD/FrI8=;
        b=TtoCa0n3vDlCnRbWBRvHavOBwhc7JzKMFrtHBH4Y3vl+0LOH4Z447qtBsWoymOTMB+
         88l7PmEDV2htUOqxQdu8ZICS3HaWkZUp8q+NOzc6EQAZvbh574aIqmdUofKtMjcyXWnV
         OH5L3Ox24A2YDrpr3a2f7a/tWisshqV2PG79sTy8yxUdFwsEAhBDmt2eO8tbFKDUMrx3
         p6J9e1FDSfnMWu/umd/c2ZbIP+AROENLKMl8KMgqcj44g9Mat838UaWBvC0S2Xvjng26
         2/cyn59c9ElO08/NCvCmCgbq/RJV1yJtfz9X3AI+4SdYLzMrl6EpxY0b5ux/E9Zbrkep
         DjZw==
X-Forwarded-Encrypted: i=1; AJvYcCUKIHcqFo7OrG64iTBNLmedr3GA2abcKVhIax4a7XWpZB/8pSXBXAB6IUm0Vk6gIsMOgt7veXX0OV+t@vger.kernel.org, AJvYcCUrrwqbZpeZkUVPcrZYgyyWlxod9FPNc4txfXKNSR/nEGp/ddXedf9DoVxd1vXQzkH02t676TuGOjBFoya6@vger.kernel.org, AJvYcCXWb69hVKPxPRMcdjWuoFYFVghr8apE1lQDwd6TwXskXkUhtDCaR5rsK74bEIJV/4R9Wfrh2EovZOto@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4tUi5Iji3a9+mQL9mzpuqJGmJQmgAkeeub7JHHsWx5psnENVi
	ETA0um8r+VpfNdZa3VcnmeEBa+KWstZl6SNe2XZjY9hng6Abwsxbg1feoSZriAY9Sh7oKz4=
X-Google-Smtp-Source: AGHT+IFbBC3R8kywIfLzFXI+0EAqpAjQMEKGdZuXjprw2fRIlUUyKvdgCICLjlTr54Bq/GOwyWWm3g==
X-Received: by 2002:a05:6a21:998f:b0:1d9:dc8:b80d with SMTP id adf61e73a8af0-1dfacc36566mr3164471637.20.1732162337164;
        Wed, 20 Nov 2024 20:12:17 -0800 (PST)
Received: from [127.0.0.1] ([2407:cdc0:8010::ec])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7fbb64ed022sm280846a12.20.2024.11.20.20.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Nov 2024 20:12:16 -0800 (PST)
Message-ID: <9a1e20a0-6a79-4bb3-990c-a1c6dfb22f1c@gmail.com>
Date: Thu, 21 Nov 2024 12:12:04 +0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: troymitchell988@gmail.com, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-riscv@lists.infradead.org,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>, Conor Dooley <conor@kernel.org>
References: <20241112-k1-i2c-master-v3-0-5005b70dc208@gmail.com>
 <20241112-k1-i2c-master-v3-1-5005b70dc208@gmail.com>
 <20241112-aged-trailing-cffda6af0944@spud> <20241114070601-GYA1001363@gentoo>
Content-Language: en-US
From: Troy Mitchell <troymitchell988@gmail.com>
In-Reply-To: <20241114070601-GYA1001363@gentoo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Yixun. Thanks for ur review.

On 2024/11/14 15:06, Yixun Lan wrote:
> On 18:03 Tue 12 Nov     , Conor Dooley wrote:
>> On Tue, Nov 12, 2024 at 11:07:39AM +0800, Troy Mitchell wrote:
>>> From: Troy Mitchell <troymitchell988@gmail.com>
>>>
>>> The I2C of K1 supports fast-speed-mode and high-speed-mode,
>>> and supports FIFO transmission.
>>>
>>> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
>>> ---
>>>  .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   | 52 ++++++++++++++++++++++
>>>  1 file changed, 52 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>>> new file mode 100644
>>> index 000000000000..e8cce360bf03
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
>>> @@ -0,0 +1,52 @@
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
>>> +    maxItems: 1
>>> +
>>> +  interrupts:
>>> +    maxItems: 1
>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +
>>> +  clock-frequency:
>>> +    description:
>>> +      Desired I2C bus clock frequency in Hz.
>>> +      K1 supports standard, fast, high-speed modes, from 1 to 3300000.
> while we are here, I'd suggest rephrase the sentence above to align it better with the doc
> 
> K1 support three different modes which running different frequencies
> standard speed mode: up to 100000 (100Hz)
> fast speed mode    : up to 400000 (400Hz)
> high speed mode    : up to 3300000 (3.3Mhz)>
>>> +    default: 100000
>>> +    minimum: 1
I will modify `description` and drop `minimum` in next version
>>> +    maximum: 3300000
>>
>> It's sufficient to define just default and max btw, the min is set in
>> i2c-controller.yaml (in dt-schema itself). Don't respin for that alone.
> +1, the minimum settings isn't really useful, clearly not apply in the practical case
> 
>>
>> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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
>>> +        reg = <0xd4010800 0x38>;
>>> +        interrupt-parent = <&plic>;
>>> +        interrupts = <36>;
>>> +        clocks = <&ccu 90>;
>>> +        clock-frequency = <100000>;
>>> +    };
>>> +
>>> +...
>>>
>>> -- 
>>> 2.34.1
>>>
> 
> 
> 

-- 
Troy Mitchell

