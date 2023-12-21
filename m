Return-Path: <linux-i2c+bounces-925-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4D981AF4E
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Dec 2023 08:20:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8EE061C22590
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Dec 2023 07:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EB691401C;
	Thu, 21 Dec 2023 07:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K2fjoXIZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5018DD29F
	for <linux-i2c@vger.kernel.org>; Thu, 21 Dec 2023 07:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-336755f1688so400593f8f.0
        for <linux-i2c@vger.kernel.org>; Wed, 20 Dec 2023 23:20:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703143238; x=1703748038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GKgaUl17rtgLH3n5Nekpmxk62rNTTUXnQZ16qpZCttA=;
        b=K2fjoXIZY8+9Mb+HnansQ8TclG5/mU+IypXhIHjQ6TeyiEBqk5leQy7pWHIuwxYnsv
         sL4eyaBzs/JaPymTqDv2SMebwuLTYTeFkzOdr4PwsCIcltu1FL6zlHrAUkcZ0ZdJaXsd
         5D/cjK8I4yrzpwcXUs9Zt2njub5qnRbFq6Yl1TcAN4C1JtJnOTZH4d1zdZJxWvl1Myno
         P9Fnb5rYK/onQ6Yg5P3hjzMH8uMQfh2q6tUA98qGilRHgECpeIGV14m9kxk6f2MbgWgI
         hKnlMCDx3zLzumTqMeMGjdPxjX32FT3+znu55rwj3XU8WGniWjb8O+KpHo9mW4HdCXbK
         uGQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703143238; x=1703748038;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GKgaUl17rtgLH3n5Nekpmxk62rNTTUXnQZ16qpZCttA=;
        b=l5SLtl6JNqFeWWjTkMzbkmxsV7PYeRurrzrW+5vB/YCRENRlJLyW9i+r+VjMT+LXVv
         sXWGlwMrPBDs069hKMUq/815GxdBTJM2Zc0gOWv/jBIq8d8T2QvxIuy7UYRDDOGySx8z
         9N+7L/CV8nOo5F01Yr3pRV7Sjru87s9vMewMShWq9We/K3fnrhcbcPJT5XGuCHNkGtdd
         vIzpGXWj2Z4HAz6AcBo2rZUeTNzv1Z/r119Kv1yXPsurEYsTFrveQl+taPX5qqNeguiy
         T4W1b+piDhinpaOnpkTDTurIbmtqK2zitKOwg43U2Crkz4yV9dpko9BCOR6N+jtVh3+V
         IuSA==
X-Gm-Message-State: AOJu0YydceQigTJo9gCz1bVrrPGwaIOo2XEsoT5JsY7/u2sy5FVPmwVx
	BCHUg8W2cfx5YF+IZ8kVvoABYg==
X-Google-Smtp-Source: AGHT+IFwrccjq4OlxK7GpmI32IQnSqqd4iZqJH5Arxx9LuH27eRxzL6EpPLkfL0R+/1RZBQgSya6rA==
X-Received: by 2002:a5d:5918:0:b0:336:8af1:5127 with SMTP id v24-20020a5d5918000000b003368af15127mr161271wrd.97.1703143238648;
        Wed, 20 Dec 2023 23:20:38 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id w9-20020a5d6809000000b00336768f52fesm1310663wru.63.2023.12.20.23.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Dec 2023 23:20:38 -0800 (PST)
Message-ID: <173b06ab-2518-49ee-a67f-85256bc5b6a7@linaro.org>
Date: Thu, 21 Dec 2023 07:20:34 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/13] dt-bindings: clock: google,gs101-clock: add PERIC0
 clock management unit
To: Rob Herring <robh@kernel.org>
Cc: peter.griffin@linaro.org, krzysztof.kozlowski+dt@linaro.org,
 mturquette@baylibre.com, sboyd@kernel.org, conor+dt@kernel.org,
 andi.shyti@kernel.org, alim.akhtar@samsung.com, gregkh@linuxfoundation.org,
 jirislaby@kernel.org, catalin.marinas@arm.com, will@kernel.org,
 s.nawrocki@samsung.com, tomasz.figa@gmail.com, cw00.choi@samsung.com,
 arnd@arndb.de, semen.protsenko@linaro.org, andre.draszik@linaro.org,
 saravanak@google.com, willmcvicker@google.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
 <20231214105243.3707730-3-tudor.ambarus@linaro.org>
 <20231220150726.GA223267-robh@kernel.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20231220150726.GA223267-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/20/23 15:07, Rob Herring wrote:
> On Thu, Dec 14, 2023 at 10:52:32AM +0000, Tudor Ambarus wrote:
>> Add dt-schema documentation for the Connectivity Peripheral 0 (PERIC0)
>> clock management unit.
>>
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  .../bindings/clock/google,gs101-clock.yaml    | 25 +++++-
>>  include/dt-bindings/clock/google,gs101.h      | 86 +++++++++++++++++++
>>  2 files changed, 109 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
>> index 3eebc03a309b..ba54c13c55bc 100644
>> --- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
>> +++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
>> @@ -30,14 +30,15 @@ properties:
>>        - google,gs101-cmu-top
>>        - google,gs101-cmu-apm
>>        - google,gs101-cmu-misc
>> +      - google,gs101-cmu-peric0
>>  
>>    clocks:
>>      minItems: 1
>> -    maxItems: 2
>> +    maxItems: 3
>>  
>>    clock-names:
>>      minItems: 1
>> -    maxItems: 2
>> +    maxItems: 3
>>  
>>    "#clock-cells":
>>      const: 1
>> @@ -88,6 +89,26 @@ allOf:
>>              - const: dout_cmu_misc_bus
>>              - const: dout_cmu_misc_sss
>>  
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: google,gs101-cmu-peric0
>> +
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: External reference clock (24.576 MHz)
>> +            - description: Connectivity Peripheral 0 bus clock (from CMU_TOP)
>> +            - description: Connectivity Peripheral 0 IP clock (from CMU_TOP)
>> +
>> +        clock-names:
>> +          items:
>> +            - const: oscclk
>> +            - const: dout_cmu_peric0_bus
>> +            - const: dout_cmu_peric0_ip
> 
> 'bus' and 'ip' are sufficient because naming is local to the module. The 
> same is true on 'dout_cmu_misc_bus'. As that has not made a release, 
> please fix all of them.
>

Ok, will fix them shortly. Thanks, Rob!

