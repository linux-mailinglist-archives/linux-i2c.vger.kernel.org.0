Return-Path: <linux-i2c+bounces-8564-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FE8A9F46E2
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2024 10:08:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 679A016C45C
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2024 09:08:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6F61DE3D7;
	Tue, 17 Dec 2024 09:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jShYx6So"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF411DE2B3;
	Tue, 17 Dec 2024 09:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734426513; cv=none; b=EaK52dbYhjuuXdmuQkhY1yG9zYichdkTombUpiJso5mmpbaDyPoBef48FvAY+jWDr0XrEzigV6Rh+RqXf+OVmneKaMuK1952XTP9QHsxgPUcz9VQCjPd4g74dbIQBvcv0HWRrzfjhJhCyHf9RZ0vOzR+l6l4JLcnssGPMyUkfYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734426513; c=relaxed/simple;
	bh=CHyFqO9Srp6ss3rLdTR3OwjKwdFQnlQugV3a49zxFz0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G9UjGOoSHaE4GEIaIemWHOsViHAayubq3KgunLFJ0s4MVLEaPf+xGWxNcmLN/F/ttgl8ZzsyIQ4ggqqfWGY7/jkRAzEwooEJLbGXaztZ/rnfeCl6gDALw6tasUz2/JqOTj2WPW9uB+i0xv0x/evUy5ixaksVmim+G3YlSYecXrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jShYx6So; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385eed29d17so2537531f8f.0;
        Tue, 17 Dec 2024 01:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734426509; x=1735031309; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q5weIQENd/TWSQgQ6aqWujhlJ38EIL0ozLxoFHUkrYE=;
        b=jShYx6SowHf9YNXu3Ln9CRTXmQBMglmoHPXBI8oBfcd16goNWWuej/DfAGOCZSuCby
         o8FcrG1UP+Yh9XOFQSDYEvRVGrZPfIB0jXo1VOYYraE74elGaDMQEo/d68N5ZFGp+IYB
         Hg6nCetPOFoMbp6/m+tBDzzedISjCkZy1AracnS71LUEod9a3pEzXo7kVmUHmNu2Vspu
         u8WlfER8vuwT50hDyUZ+j4uh43n8MvmI7SjmNFdMeNCyXh1lJJ6obqRmRrlf3WC3yZbR
         CE5/7goAigf84F7hsaBag/eNxVDPRqtOSwGV0xaMhd3r8cl1dVDGbAUGh5If8ZrXuPyJ
         n1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734426509; x=1735031309;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q5weIQENd/TWSQgQ6aqWujhlJ38EIL0ozLxoFHUkrYE=;
        b=tNalSb4nOBlfoVUsQ8eEYjV9vhfyBjjOpG0G7DQp8tObvXq2RC54ZVYlWhCycCT6D5
         boyehJVfg3k5mVScojIJKk1UDss4FvBcc+Mt3MJNPhtL/+vy3UHtpRG5a36oz05OXeen
         xJWqrgpopiFCyTSk+DKz6dmz8mWldRfcSmbfJr7FH/QTulWIXaG4fv2QqA8tH7e49Rw4
         yX8fRXeIupsSPG0MbRlvE53kq/DwC7b7Vv/mgV5WYNro1V647c6UTpk1K/XtoqYSYkCO
         sYcE7TtdTOb+ywjY2H8AOu3dEBnGwAL2Jn74P+ihPMzjEuvPHEQhcdfQfZQsNKPhP9HA
         3ucg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ0Dgo1CuQIlVTN4JIKW+SbJysWwH1uhH4bjT8BjcgGWd0aJmzvj4CcEPq7iPunaWmYN19tKYJlZL2EPXaI3Sas3E=@vger.kernel.org, AJvYcCXCQPw7bXckZ2CxmpQrH58u1T5r+oD6QUjrDzhU85SVTvGvNIkDhY/kr4eCBkqWgKpHfWVLnZsJ0UIt@vger.kernel.org, AJvYcCXs311ZlseEShR1ml3zIURXENn4N+mwNh3ur+RdUdc5TJlzECrniVLKerSNNsx523cHmd3WphQX+rDgsm24@vger.kernel.org
X-Gm-Message-State: AOJu0YyZwwK4PymF0yucwRDjCDw8DAJL49lwT3BqbGIC0mnMBjVSewOQ
	5dp+TKPlGCNaauvUKdWlfW2VIB7DiDKN1lLQ9XTHEMCYrxPvA5zs
X-Gm-Gg: ASbGncs3oDZb0c2IvgBO9zarozxYfFr1oGAFY43cvPiaAjTGoGq7CuUuSm3fpwqjIgU
	dXQARiwgPJYyap7x986JtKUqWIsWveUVKUl5AV2tLHyeENSmvmE8PLAJgtYOn7V2qZ8QQqipK+Y
	WEJHnice2E3K4fk9wkkeSXkDWrCrsTXdegr/CxAVReNL3aoM599V7plpfsgfLXRL9y3Blh/0B9c
	t8uRY2XFu1q3R8RibxbfLmz76bcYUd5YBorJirFsDpmP4SxQhbScUayCwPni3gMcLVvhHiEKT8p
	oMEL9h+/iImHgrSRFDRUnA==
X-Google-Smtp-Source: AGHT+IFKUA5hQNQSywoZDLpGUcdLM6zt8M6vh5FswSnswuK4fj51IzxHglfrE9X7z3ZJ7TaFHj1FhQ==
X-Received: by 2002:a05:6000:156f:b0:385:e328:890a with SMTP id ffacd0b85a97d-3888e0c0520mr13813018f8f.49.1734426509180;
        Tue, 17 Dec 2024 01:08:29 -0800 (PST)
Received: from [172.16.20.173] (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c80165c5sm10519556f8f.25.2024.12.17.01.08.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 01:08:28 -0800 (PST)
Message-ID: <6e93d59d-71e5-4c09-862f-55b5504121aa@gmail.com>
Date: Tue, 17 Dec 2024 11:08:26 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] dt-bindings: i2c: exynos5: Add
 samsung,exynos8895-hsi2c compatible
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Andi Shyti
 <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241214220419.723100-1-ivo.ivanov.ivanov1@gmail.com>
 <20241214220419.723100-2-ivo.ivanov.ivanov1@gmail.com>
 <0ebc12ed-fe91-4c8a-a626-b735b0eeecf1@kernel.org>
 <007559c5-f566-4625-99b7-e761a916fba3@gmail.com>
 <cccca881-dd59-43c0-9072-dcd91d01671d@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <cccca881-dd59-43c0-9072-dcd91d01671d@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/17/24 07:24, Krzysztof Kozlowski wrote:
> On 16/12/2024 21:59, Ivaylo Ivanov wrote:
>> On 12/16/24 10:44, Krzysztof Kozlowski wrote:
>>> On 14/12/2024 23:04, Ivaylo Ivanov wrote:
>>>> Add samsung,exynos8895-hsi2c dedicated compatible for representing
>>>> I2C of Exynos8895 SoC. Since there are I2C buses that aren't implemented
>>>> as a part of USIv1 blocks, they only require a single clock.
>>>>
>>>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>>> ---
>>>>  .../devicetree/bindings/i2c/i2c-exynos5.yaml  | 26 ++++++++++++++++---
>>>>  1 file changed, 23 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
>>>> index cc8bba553..b029be88e 100644
>>>> --- a/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
>>>> +++ b/Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
>>>> @@ -25,6 +25,7 @@ properties:
>>>>            - samsung,exynos5250-hsi2c    # Exynos5250 and Exynos5420
>>>>            - samsung,exynos5260-hsi2c    # Exynos5260
>>>>            - samsung,exynos7-hsi2c       # Exynos7
>>>> +          - samsung,exynos8895-hsi2c
>>>>            - samsung,exynosautov9-hsi2c
>>>>        - items:
>>>>            - enum:
>>>> @@ -94,9 +95,28 @@ allOf:
>>>>          - clock-names
>>>>  
>>>>      else:
>>>> -      properties:
>>>> -        clocks:
>>>> -          maxItems: 1
>>>> +      if:
>>>> +        properties:
>>>> +          compatible:
>>>> +            contains:
>>>> +              enum:
>>>> +                - samsung,exynos8895-hsi2c
>>>> +
>>>> +      then:
>>>> +        properties:
>>>> +          clocks:
>>> Missing minItems
>>>
>>>> +            maxItems: 2
>>>> +
>>>> +          clock-names:
>>> Ditto
>>>
>>>> +            maxItems: 2
>>>> +
>>>> +        required:
>>>> +          - clock-names
>>> I don't understand why do you need second, same branch in if, basically
>> Because, as I stated in the commit message, we have HSI2C controllers
>> both implemented in USIv1 blocks and outside. These that are a part of
> On Exynos8895? Where? With the same compatible?

hsi2c_0 which has a clock from BUSC and hsi2c_1 to hsi2c_4 which use clocks
from PERIC1 (CLK_GOUT_PERIC1_HSI2C_CAM{0,1,2,3}_IPCLK). Why would
they need a different compatible though? It's functionally the same i2c design
as the one implemented in USIv1 blocks.

>
>> USIv1 need 2 clocks, and those that aren't have only one. So it's not
>> a duplicate for the previous - autov9 sets a minitems of 2 and the
>> others have a maxitems of 1.
> We talk here about branch that says 2 items. You duplicate that one.

I see. I can just define the clocks for all at this point.

Best regards,
Ivo.

>
> Best regards,
> Krzysztof


