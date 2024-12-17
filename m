Return-Path: <linux-i2c+bounces-8566-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C179F4798
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2024 10:31:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C13491885E2A
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2024 09:31:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9875A1D54D1;
	Tue, 17 Dec 2024 09:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KRuQVkQZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9A82481B1;
	Tue, 17 Dec 2024 09:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734427897; cv=none; b=K6fN1MNvw3U3fKCycCTph9GFPqkOXDfR2Jy+C15jPG5tUpvxtvHppMW5uxlO+uBmVyNAlr0tHPCF7C5ZQbq1iLpnDCRqcjkXLC0bNNbiXYp5Fwgwdl1ROLPZS2P90weK8vsh7zrE/hF4C4vHo2Nv83LHKjnyqiG2aGFdzf6Lbg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734427897; c=relaxed/simple;
	bh=BQx9VBv6KjaGKO3Z7ZsGDIaiPVS9StUXtcp6ErxcTog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MQAx6fM7pX7m5Q63fFv+3V/npgsD7ivhdbMv1OZAOlbtACeZVfFvf2ZWE5sPWixdC3uRjn5CeqTVX4VxADNPKy0sSo3afVXcfqTKD8adOiTRNs5CZapmdHjQ9vH/grKKaNDkOxeRLoxWpdeM6Bpkkp6s7pSnQqbraUwNOzL6Nm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KRuQVkQZ; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43618283dedso49503595e9.3;
        Tue, 17 Dec 2024 01:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734427894; x=1735032694; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T49MJOLV8ESyJTCSjrdtWjc6wkPEGcbyfLqIvLotXMo=;
        b=KRuQVkQZsaZ6gUCQlUlvUbFm2T1GuTByqiHM0Xrm0F5jNm9uCUG9T1N61MXvYoUPa3
         G6H6G9D37n5EEFeDSdhj5mBviAVhcyG367Gkhg3V/rfY6dEWkw6KkFjInc82tOhZ9raW
         WEDckLmGK1E9ospL9abM87TP9006akBEL7XEvAEQpcBTLCr4hdDOSdmZCOCuYRzP2svv
         w/be4jU05a+Q9GeKk9zp83/GX3RoS1MpjLOV/EKutPjqEhuMoG1zvT1+pXER70a2tn/Q
         K0JTXhrJLbHg48s18UIe3woeyDo+qr71LjJ1KFdTXyLf/rXDD0c52/PB+BGIfFsEl5Iw
         9g4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734427894; x=1735032694;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T49MJOLV8ESyJTCSjrdtWjc6wkPEGcbyfLqIvLotXMo=;
        b=dbwHPJ4dbVL+ehn3pBMIkLdLNavP3z0QB8i+7niVs0rZrudbIN00RJzoHCOY1fhgO7
         qOGqol/YAv1YZxpa2uGpxDdTIJ4jfzDnqfzR6kmkhfya4WES/UhvHIwv0tLivGh4yFVJ
         v8y79su0vKxLz+sNocjesbWjV/V7g2rBOvbIPM+1q49ptRaZ2N1Ck0oiV/4KKbg7VKb7
         jntmGzvM4lmVATDSEPPeNpXOAdfDBb19KMVRxNDaJRtPLD0/AGQ4pQ98WYwvE7Q6d6JP
         bfyX9JZF8I9kx/F3jPtoDIF12ZhF6or0lLlAbvFBunxCwklEzvNT0yn9j3g2v9lCtRC6
         uAZA==
X-Forwarded-Encrypted: i=1; AJvYcCV+heLl7kYeXltnk7hR0pX7/33qt3HKpMSv2nlMAeOHjRU8rfHY1g+GnTDaU8/4wIbY50nJf9JwjxdBfzdz@vger.kernel.org, AJvYcCW+XmDmRLMUTnmEl/6NKtK/1zLkWXnnhnp6gYtxXZ8CF/ZsjDIlnCfLVQ9cnrPxV7t9xRwzflTzfL8WTNhNXkxVRbk=@vger.kernel.org, AJvYcCX1rA5CxM11/sAU0qkrb4hPihCtWH5ja5/5VhOIw1YfHgDrQAhHW9Q8HWAubk3rg6hdFHO4P+CEOBwP@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/1s2e/Vrr84z9g8HVKbUwGqkDpc/4spF8qkIV9pcpF7lreOLX
	skuQ2tzSXs+nueclHOnlgLgx9uu/51wxSNbyEjWv7nv23P+LC+u3
X-Gm-Gg: ASbGncvdZnyAN02zewym1XGGrwYnPhunlE4GdypCJ5whcwzu+teLbXZmIYqvLmT1syF
	HpZ26Aow3eQ0F6ImpZ4TeEgXYHDOmul10WEnn+9U53M8qTOWUSU4HF7mX+InvV+hxcxIKr0Ou0z
	XMJGJB0QV3H6DVWgKvUONZdXuiBoRa0aP+mr0/b8z9b4LLiGzr5KHmajYiUk39DoMzOhRR81mWf
	gCgyjQHdEEqtN+XLToEnAqLcobmo+jkEAW6mCyNhNyFDClBzXOlWR7FalQ7YUtQ6Xx6jZxwNoLx
	qN5CVXbKtJFiRiWd95ld7g==
X-Google-Smtp-Source: AGHT+IGsXtjvTI2iQZt474j852R5W0w8BTFwUgVheZ+H6j7bDyIn+pg0qTpB+H2pDDr2MYOaChXPXg==
X-Received: by 2002:a05:600c:1e8a:b0:434:f5d1:f10f with SMTP id 5b1f17b1804b1-4362aa52fa7mr148788375e9.17.1734427893553;
        Tue, 17 Dec 2024 01:31:33 -0800 (PST)
Received: from [172.16.20.173] (62-73-104-42.ip.btc-net.bg. [62.73.104.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362571776asm164546165e9.40.2024.12.17.01.31.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2024 01:31:33 -0800 (PST)
Message-ID: <17fbfcdd-8b79-4907-a4c8-798da0ef0526@gmail.com>
Date: Tue, 17 Dec 2024 11:31:30 +0200
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
 <6e93d59d-71e5-4c09-862f-55b5504121aa@gmail.com>
 <69fd1dbc-a29f-488c-a30f-7e5ea8f01a23@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <69fd1dbc-a29f-488c-a30f-7e5ea8f01a23@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/17/24 11:26, Krzysztof Kozlowski wrote:
> On 17/12/2024 10:08, Ivaylo Ivanov wrote:
>>>>>>        - items:
>>>>>>            - enum:
>>>>>> @@ -94,9 +95,28 @@ allOf:
>>>>>>          - clock-names
>>>>>>  
>>>>>>      else:
>>>>>> -      properties:
>>>>>> -        clocks:
>>>>>> -          maxItems: 1
>>>>>> +      if:
>>>>>> +        properties:
>>>>>> +          compatible:
>>>>>> +            contains:
>>>>>> +              enum:
>>>>>> +                - samsung,exynos8895-hsi2c
>>>>>> +
>>>>>> +      then:
>>>>>> +        properties:
>>>>>> +          clocks:
>>>>> Missing minItems
>>>>>
>>>>>> +            maxItems: 2
>>>>>> +
>>>>>> +          clock-names:
>>>>> Ditto
>>>>>
>>>>>> +            maxItems: 2
>>>>>> +
>>>>>> +        required:
>>>>>> +          - clock-names
>>>>> I don't understand why do you need second, same branch in if, basically
>>>> Because, as I stated in the commit message, we have HSI2C controllers
>>>> both implemented in USIv1 blocks and outside. These that are a part of
>>> On Exynos8895? Where? With the same compatible?
>> hsi2c_0 which has a clock from BUSC and hsi2c_1 to hsi2c_4 which use clocks
>> from PERIC1 (CLK_GOUT_PERIC1_HSI2C_CAM{0,1,2,3}_IPCLK). Why would
>> they need a different compatible though? It's functionally the same i2c design
>> as the one implemented in USIv1 blocks.
> If one block is part of USI and other not, they might not be the same
> I2C blocks, even if interface is similar. If they were the same or even
> functionally the same, they would have the same clock inputs. However

I see, so in such case I should make samsung,exynos8895-hsi2c-nonusi or
something like that?

> user manual also suggests that there is only one clock, not two (for
> both cases), so they could be functionally equivalent but then number of
> clocks looks incorrect.

That'd be weird. Both according to downstream and upstream clk driver,
for the USI-implemented i2cs we have a pclk and an sclk_usi.

Best regards,
Ivo.

>
> Best regards,
> Krzysztof


