Return-Path: <linux-i2c+bounces-10193-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1C4A7F090
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Apr 2025 00:59:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC1C47A3007
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 22:58:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD49225419;
	Mon,  7 Apr 2025 22:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kxqkPHxh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1C7B665;
	Mon,  7 Apr 2025 22:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744066756; cv=none; b=NLxJ43+93taIIFSC3jeJ7A+gfLtFYJDWsGf0Ul1Bywcf1MvadnrwF99ytNYKaeu6WF3He8yuBb+IM9x0+Aa2rTkQCIVD9gh8x3Mzo9/tJqnOSyvLRdLSJ9MVcueqI5TiC2G9bPsIB7KnIUYRIrOg1/nWXg0E5iqjhRUoFTChXB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744066756; c=relaxed/simple;
	bh=uwIVbqWOlBI+A5PvDHwYhzOd6ILeyJlFz/Z9gidM1Gc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RQeCIrOYtCzIAu+BI04NsR2n/krdiGXFQOUbWVinXhYaEw5i2Nk0SC8wX4IyrJ3H5TMjlFfwawotJjE0vqX202TIKvm4ZWIjifD5IruIXCciiWJiUinbSp3smTaVWaP4BMjpysgNthIe8Orth1wD/fynOcW7mqcLX+/ZcL5iFLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kxqkPHxh; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-73972a54919so4548063b3a.3;
        Mon, 07 Apr 2025 15:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744066754; x=1744671554; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=jR0WXFRM7Vk5WYK13Usylw7mhUx1NGUVnPqUZ+6CvfA=;
        b=kxqkPHxhOQNJRYFWfgTJQyHzdbd/uSlzS20x5EIBfjraGRt0ijSV4xDV7eHY8AkKYi
         YBhN8T2i7/IcDRdYEhdr3DCDgX7gPe8XBtMDMYJxCtCbpIbG+yD8KIEVl4OfsDjTRWvt
         ICFvMXJUWJI8gbVFwt/dQ3pyrK5IHNfQTerbjnrOgZHZY4bIVq0LBI2yGMrbzpJBqgG3
         G2hjBMG4xeaHztqFEftCxEdwiKI6ZzOv+U6Sq2VuFJ5BhqpVLCYloQUju/Ur9WDb93VZ
         eNheB0gB5b3qt6FDTijULA5noyWj9pQfObfzPzxbs+9oenvWlvKaqIFUH71g4FFMivpP
         d2nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744066754; x=1744671554;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jR0WXFRM7Vk5WYK13Usylw7mhUx1NGUVnPqUZ+6CvfA=;
        b=vlUp6kcBoUg2JPcbe3IiWKWSBbpFMeUf3iAhVi/MJBFhxjd3D9aUfZ0Vww5GZDsWPB
         k3ctzF59WnSNf9kW8K2KF4pQkir0nWoniDjskAyJmRQ+Y+y2Z6vyvWaenWc6AUjlskRo
         nBA1lDXvezzVFGDCqOMbM16b/+H0BncigSMxWJ5nwXPmiP0VSHOEJ1nn2lSwJALHYsk5
         4TCDpDlqUxWOqMxnbSbF20574qt87U6yK4tuwzxOvw53FJm1d5PsA/+LQRHMbfjYmvcs
         6fOtBNYKxY+yMMrABfD0efAd7BflycPkEz6LH6CDiofneuR0RyepKGkpeKjFV5CXfTX/
         eqmg==
X-Forwarded-Encrypted: i=1; AJvYcCUvDGV8e8FENBXPpvFhp1LzMsLD1Z84Q7F5m/l43KN4e1gLSb+K1uO+IzAHkJ2MWo/8oSbCw5K8ll17@vger.kernel.org, AJvYcCWRhhNKMVtjvhufSTNHfTgjN4/XHY1urAvU8Y9j+MiyfcjsOpFTuonw+2gmxAlArQINdrp1c02KKaeu@vger.kernel.org, AJvYcCWkv6PeoaRgShubBV20P/7B543F+8r6vEStMvs11S01Xz5h25ti6equHJePz0V0mFZbdqOzwidL87uEXDIq@vger.kernel.org, AJvYcCWtni5MeuTyzh5SdByXGUp+9jxxQ34i0m9YbmePcTsRBUcSs1Yqe1I7e+ozClFxpjCfOZr8VAWsaxGf@vger.kernel.org, AJvYcCXMqRIYcf7Iyn4jtBBN8zjm7JPrGK36tBoEIThw1PCqT29wbPl6pJvnW/txUpAdcX/UxjDM+kBoutFIfc4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg99BPnQyMMb0HOEn7UMUPmedW9lh+K8cnOnaf+ZBRbtklj7F9
	LPANNVMCFFIiB6ZIxbDeagdRgavxkZ4zL8PhNEEYlDIr6xHe8KhL
X-Gm-Gg: ASbGncv5Cj+36aqk5GbsBoQJ+F8Dj/yopwUOTEX5AU5S8acfPp0gUij7c14g+B5zUEP
	R1JlwHjHPKcNFnWlxpZIA4IJzU/kTcQKh6tqRULF8YgDx5fQwj6PVNVyv0ds4GEuYyA9sJ16wdh
	2Dnle3OGaXsOHv6Q8RcKgBgKakVMYX0vSx1E0X3AMob9w59n74mG7Ku0EeVTb6tqiGaB+UdHZ/E
	SFJpbru/AI87EUyaQURMIVNt/XPHlT0w4hCdVMdU7kK0ptT1vqgub+PiPQtWjdVcyYfT+ZSEo/2
	5qKPuVhmHq1EJLvn9H/Wr65CIlw0E0RWTeUxDOjb5oAWrZfp3ph9FKiwx30latvOoEqfk6NWgkE
	LbrLF9uD3Yn07L6ERtw==
X-Google-Smtp-Source: AGHT+IE95HC4K5DouVEpPZq5zVHT76lfaYFHXqL2rfZBYjZgr6wnWvnJ0NJCS/wk1mWeOiWnWFrhVw==
X-Received: by 2002:a05:6a20:9f8c:b0:1f5:6f61:a0ac with SMTP id adf61e73a8af0-20107ea25ffmr17952347637.5.1744066753988;
        Mon, 07 Apr 2025 15:59:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af9bc2cfa92sm7952319a12.1.2025.04.07.15.59.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 15:59:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0898bd3f-a613-491d-a5e4-a66019aa72e2@roeck-us.net>
Date: Mon, 7 Apr 2025 15:59:09 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: pmbus: add lt3074
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20250225-upstream-lt3074-v2-0-18ad10ba542e@analog.com>
 <20250225-upstream-lt3074-v2-1-18ad10ba542e@analog.com>
 <20250226-gentle-spicy-jacamar-2dd36a@krzk-bin>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250226-gentle-spicy-jacamar-2dd36a@krzk-bin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/26/25 00:20, Krzysztof Kozlowski wrote:
> On Tue, Feb 25, 2025 at 09:01:13PM +0800, Cedric Encarnacion wrote:
>> Add Analog Devices LT3074 Ultralow Noise, High PSRR Dropout Linear
>> Regulator.
>>
>> Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
>> ---
>>   .../bindings/hwmon/pmbus/adi,lt3074.yaml           | 64 ++++++++++++++++++++++
>>   MAINTAINERS                                        |  7 +++
>>   2 files changed, 71 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/adi,lt3074.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/adi,lt3074.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..714426fd655a8daa96e15e1f789743f36001ac7a
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/adi,lt3074.yaml
>> @@ -0,0 +1,64 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/hwmon/pmbus/adi,lt3074.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Analog Devices LT3074 voltage regulator
>> +
>> +maintainers:
>> +  - Cedric Encarnacion <cedricjustine.encarnacion@analog.com>
>> +
>> +description: |
>> +  The LT3074 is a low voltage, ultra-low noise and ultra-fast transient
>> +  response linear regulator. It allows telemetry for input/output voltage,
>> +  output current and temperature through the PMBus serial interface.
>> +
>> +  Datasheet:
>> +    https://www.analog.com/en/products/lt3074.html
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - adi,lt3074
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  regulators:
>> +    type: object
>> +    description: |
>> +      list of regulators provided by this controller.
> 
> You have only one regulator, so drop the "regulators". vout could be
> here, but since you do not have any other resources, I doubt it stands
> on its own either. This is even visible in your DTS - you named the
> device as regulator, so logically this is the regulator. Regulator does
> not have regulators (otherwise they could also have regulators... so
> triple regulator).
> 
> hwmon code might need some changes, but that's not really relevant for
> proper hardware description.
> 

With the changes in the hwmon pmbus code now in linux-next, this should
be ready for another revision with non-nested regulator support.

Thanks,
Guenter


