Return-Path: <linux-i2c+bounces-4847-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2B792D6B4
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 18:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D3E7F1C20E98
	for <lists+linux-i2c@lfdr.de>; Wed, 10 Jul 2024 16:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0561194A5E;
	Wed, 10 Jul 2024 16:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S2DQoNGX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF7E3219F9
	for <linux-i2c@vger.kernel.org>; Wed, 10 Jul 2024 16:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720629521; cv=none; b=eGgsoT72hqLlMxRJIRzzf6xEKCwHRINBo5CMIbPgggRxh5vWvNmDtMOrmfQyDDp3EGe4cwlYChKALCCBnU6H85cirhuvVvuHOsic9tfZaPMqs9DAuViV1vC2PTtMXRwfalrJIJCioFXS1K0sRdfhepF+D3ULaOpUJ2BCnNEHNxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720629521; c=relaxed/simple;
	bh=PHDtAT6lLSuPVHw+U7GhPUieHfU7NBwDH6q0NLRE3p8=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=JUIESnCZXJ8r+yLf28rvNZGTSxErRSyuYXuxC+x6KU1NTrvQessc9T9ceRSUNX8Sogf4aimiIVyCc27i45zHee26srwJH0s1rJd7mpjQ8dW2Y7mbO8X4GE2sbI/kdAM4SMog5Kh6sy+jzL7RCsFReCB/yA/n+iTcWyGkDr7fqzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S2DQoNGX; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4266fd395eeso16908845e9.3
        for <linux-i2c@vger.kernel.org>; Wed, 10 Jul 2024 09:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720629518; x=1721234318; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AvGP3/2u4f5ZMtfChWtgDNo/AniA/bJwsSpquHCsSUo=;
        b=S2DQoNGXtfyd/erhlnJLJ+GMEducN6JuUIwtVQZoT+v296kUcXFXyQeOst6Wuz4Kuu
         8LqBpZLGpQucfIYuNU2bJXc+F0Shgb3N2qQ564+RqdFH+hN0IzO9WBE8avNlWqcFpnJB
         dqBrHMcFGp9uEcVMDc41NemGhikFmD8a+NZKLNv/P4Zc/g9UPi/WJsDkr1UzzZ2JQtFJ
         Y5Pp5gKwufbjqaWG6nh/Keaz5pG25nZcWykS6xm8BAxjo4XtrmTIdw797TrEA9dWr63N
         8Mz1+7UcxWD7eAdepOj+YP8DgDAOYKU7QC1O4lQZpRskWuDtw//7//uj3NULs8TdUugk
         /S/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720629518; x=1721234318;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AvGP3/2u4f5ZMtfChWtgDNo/AniA/bJwsSpquHCsSUo=;
        b=WRm+ZEaS9/7ra2LNfj6VxA5UFIv2hui+LexQP4SHLsA+rklHeaYmHNV43MgazTJ610
         buDEA89+DZVX2R+k+vNhFO/rn/UcbNlYlJ2j48AV+k4BDdcaz9KzueIO1qozqCBBEkJX
         C3OzmPY1SVsKI7A0ZAOqM8w04Ay2ML+fTDvCtK2+hgIsZpCfFr8nFOTU/Ztcn85/HfQt
         iiSq225JacE+SBuC+KCKVQHPOWv2DbatgBI5UzleBLZv6IEW+1+EOjWymGjZB+kEoRGY
         0KNRZ6DDNtZTsOEI7qhO14E0rdvzwY6N6P7nUP+BT6IwfW42BXHD6Ci2sujg/l34vqXN
         JTCQ==
X-Gm-Message-State: AOJu0YwfDkZ9pkcT+GIFmCTzhfiXduIi4I3hq+8AyCiaRBOwlVldSoXy
	UaaKQ2tjYMwQV/c6AvpBoUiFuxzkHyA2rMaB6L6F4jOZlerTftSeAZS+VYoUTnY=
X-Google-Smtp-Source: AGHT+IH8cJ5hwT0TYoHdbx0fNaJwAeHXme01NPT2sNru05zKfBy3aVJqAuLdty9e6Fr/3eMVzKSnZg==
X-Received: by 2002:a5d:64c4:0:b0:367:9614:fb9f with SMTP id ffacd0b85a97d-367cea46f7dmr5982534f8f.2.1720629518070;
        Wed, 10 Jul 2024 09:38:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:7e2c:a18f:a783:5c6c? ([2a01:e0a:cad:2140:7e2c:a18f:a783:5c6c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cde84907sm5769245f8f.43.2024.07.10.09.38.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jul 2024 09:38:37 -0700 (PDT)
Message-ID: <fde4a6be-6c6b-4275-a320-85e43f62bddd@linaro.org>
Date: Wed, 10 Jul 2024 18:38:33 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 1/4] dt-bindings: spi: amlogic,a1-spifc: make
 power-domains required
To: George Stark <gnstark@salutedevices.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, robh@kernel.org
Cc: linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org, krzk+dt@kernel.org,
 hkallweit1@gmail.com, glaroque@baylibre.com, khilman@baylibre.com,
 broonie@kernel.org, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 lukasz.luba@arm.com, b.galvani@gmail.com, mmkurbanov@sberdevices.ru,
 rui.zhang@intel.com, rafael@kernel.org, daniel.lezcano@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 kernel@salutedevices.com, conor+dt@kernel.org
References: <20240708194808.1819185-1-gnstark@salutedevices.com>
 <20240708194808.1819185-2-gnstark@salutedevices.com>
 <6add148f-efe7-4444-82b3-20b1198c6d07@kernel.org>
 <3667b7d5-2cca-458b-bdaf-a69cac0309ce@salutedevices.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <3667b7d5-2cca-458b-bdaf-a69cac0309ce@salutedevices.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/07/2024 18:23, George Stark wrote:
> Hello Krzysztof, Neil, Rob
> 
> Thanks for your reviews.
> 
> I'd just like to clarify things a little on that matter. On A1 most of
> periphery has either dedicated power domain (ir, spifc, spi, cpu etc) or
> several peripheries share single PD e.g. pwm, temp sensor, i2c, adc
> share PD 12. Appropriate PD must be turned on before the periphery is
> touched and be on while periphery is used. Experiments confirm it. So
> power-domains property in dts nodes is really required. It makes kernel
> to control PDs when bound periphery is used.
> 
> If I understand bindings thing correctly we should make power-domains
> property required in bindings too in that case, at least for those
> peripheries which has *a1* compatibles (some peripheries use compatible
> from older SoCs without PDs).
> 
> What you think?

Yes, but if the compatible has already been defined without a required
power-domain, then it's too late to mark it as required since it's an ABI
break.

So next time a new compatible is added, it's the appropriate time to mark
it as required.

But in any case it's not a big deal because if the power-domain is not
specified it won't work, like if you use wrong register address or the
wrong interrupt line.

The fact power-domain can be specified is enough.

Neil

> 
> On 7/8/24 22:51, Krzysztof Kozlowski wrote:
>> On 08/07/2024 21:48, George Stark wrote:
>>> SPI Flash Controller has dedicated power domain so make the
>>> corresponding property required.
>>
>> That's an ABI break. Being part of power domain does not necessarily
>> mean it must be required, so your commit msg lacks rationale. Especially
>> on the ABI part.
>>
>>
>>
>> Best regards,
>> Krzysztof
>>
> 


