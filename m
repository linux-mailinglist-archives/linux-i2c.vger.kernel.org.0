Return-Path: <linux-i2c+bounces-190-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F437EDFF3
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Nov 2023 12:37:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D3F71F24B26
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Nov 2023 11:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D7952DF87;
	Thu, 16 Nov 2023 11:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OofVp+nU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CB60182
	for <linux-i2c@vger.kernel.org>; Thu, 16 Nov 2023 03:37:51 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7788db95652so39676685a.2
        for <linux-i2c@vger.kernel.org>; Thu, 16 Nov 2023 03:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700134670; x=1700739470; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QKz33fRXGncP/6ISpiMtpAHGGFNNUHHfOEZzGuOATSM=;
        b=OofVp+nUp+XQ97eREPQOFhHLrynRMYl9KF4R3s7b5+B0eVwr0QgQ6CY+OQtERYLTij
         GK0VPlIyUq0rjt060lSQXqOW/OjJw6sE+rqTNrjc+3Rqmzdz6mJnskRAkD0H9J3cXXF+
         bvbqlknt1WtMkfS3PwR8sELKgCUPtSgvQhpwBVLQv3NEpCfLZfWjyUbD63OStcjCd7P0
         CAbwOyTHx8tFM2QOtBdFQA4X4daPnLo2vWpMhxEUQBtIN1/2aEm+uReaR2Lgi8LFVlxz
         RGxXGmNYJNie5JdW1BzT7FgnlSQIabT4JHnvCcfAFblGPwF7S3JFrKpPTGs/ONEsciSX
         epyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700134670; x=1700739470;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QKz33fRXGncP/6ISpiMtpAHGGFNNUHHfOEZzGuOATSM=;
        b=w9a8oAd2YWic4pKsC2VpDpIp8ItaHGf7GPimGOF2r1xD3vBUX0/v79kuFuFpgtAuHI
         5FVARFcTDwLvH/90CSL5cfKKoyyqZduIo3Ja/SXVTAMBJvMFU1f/DvWLJfnQ2u7rAoca
         0edh6EitxxQeTUcWUII8jywr7YjYKI9VwHrjeAASJl91vNcstWy3tZWwkAZXL+kwHmMG
         9VOMMdPdpIe+IfsYVsh7uTD7tTVHTv/q0yPlj1HGH1UoiU1tuKkEHGOsA0KvobSygJNJ
         vTBC0wxI87pxIrpQgi0d8oNBB82JDrGyzgXHGEYp5wYf1d6/Ek5hvfxx//ZOn4yOqStA
         rFMQ==
X-Gm-Message-State: AOJu0YwXAc87KdDkklhe9dudJ3U3NAgsdBlSrTX1jeOhG7Y3pzjsuKQa
	tFHAHiKTdOJSWPt6Kdb7t7RetYMviYUKZlUNzCs=
X-Google-Smtp-Source: AGHT+IEtNVZYcLgGMcL/L+aRBPanl6QL3LrFnGpMv8jNkRAEMs2v2qJgdVd8ouepHLGf4H7i8/xj3A==
X-Received: by 2002:a05:620a:201b:b0:778:8b39:166e with SMTP id c27-20020a05620a201b00b007788b39166emr8783145qka.20.1700134670357;
        Thu, 16 Nov 2023 03:37:50 -0800 (PST)
Received: from [192.168.212.13] ([12.191.197.195])
        by smtp.gmail.com with ESMTPSA id u8-20020a05620a022800b00767da9b6ae9sm3697236qkm.11.2023.11.16.03.37.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Nov 2023 03:37:50 -0800 (PST)
Message-ID: <d1e067a7-81ed-4962-bc38-9db1697514da@linaro.org>
Date: Thu, 16 Nov 2023 12:37:48 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] dt-bindings: i2c: add bus-reset-gpios property
Content-Language: en-US
To: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
 "wsa@kernel.org" <wsa@kernel.org>,
 "andi.shyti@kernel.org" <andi.shyti@kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20231115035753.925534-1-chris.packham@alliedtelesis.co.nz>
 <20231115035753.925534-2-chris.packham@alliedtelesis.co.nz>
 <f24b9b2d-aeb1-47f7-bf21-4383fdcf94aa@linaro.org>
 <5a52b0c9-8858-4f55-8dd7-9269c29c10a7@alliedtelesis.co.nz>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <5a52b0c9-8858-4f55-8dd7-9269c29c10a7@alliedtelesis.co.nz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15/11/2023 22:53, Chris Packham wrote:
> Hi Krystof,
> 
> On 16/11/23 10:29, Krzysztof Kozlowski wrote:
>> On 15/11/2023 04:57, Chris Packham wrote:
>>> Add bus-reset-gpios and bus-reset-duration-us properties to the binding
>>> description for i2c busses. These can be used to describe hardware where
>>> a common reset GPIO is connected to all downstream devices on and I2C
>>> bus. This reset will be asserted then released before the downstream
>>> devices on the bus are probed.
>>>
>>> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>>> ---
>>>
>> ...
>>
>>>   Documentation/devicetree/bindings/i2c/i2c.txt | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/i2c/i2c.txt b/Documentation/devicetree/bindings/i2c/i2c.txt
>>> index fc3dd7ec0445..3f95d71b9985 100644
>>> --- a/Documentation/devicetree/bindings/i2c/i2c.txt
>>> +++ b/Documentation/devicetree/bindings/i2c/i2c.txt
>>> @@ -99,6 +99,14 @@ wants to support one of the below features, it should adapt these bindings.
>>>   	indicates that the system is accessible via this bus as an endpoint for
>>>   	MCTP over I2C transport.
>>>   
>>> +- bus-reset-gpios:
>>> +	GPIO pin providing a common reset for all downstream devices. This GPIO
>>> +	will be asserted then released before the downstream devices are probed.
>> I initially reviewed it, but did not think enough about it. After more
>> consideration, I believe this is not a property of the I2C bus
>> controller. This is a property of each device, even if the GPIO is the same.
>>
>> Linux kernel already supports shared GPIO, so you only need
>> enable-ref-counting on it.
> 
> That's the kind of breadcrumb I need. Although I can't see 
> enable-ref-counting as any kind of DT property. Do you mean 
> GPIOD_FLAGS_BIT_NONEXCLUSIVE?

It's not a feature or property of Devicetree, but missing feature of OS.

Best regards,
Krzysztof


