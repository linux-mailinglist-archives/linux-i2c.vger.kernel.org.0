Return-Path: <linux-i2c+bounces-830-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 05370814579
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 11:24:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8744B1F215AA
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Dec 2023 10:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7AC19469;
	Fri, 15 Dec 2023 10:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eRWotJ23"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE1519454
	for <linux-i2c@vger.kernel.org>; Fri, 15 Dec 2023 10:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40c3fe6c1b5so5198765e9.2
        for <linux-i2c@vger.kernel.org>; Fri, 15 Dec 2023 02:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702635836; x=1703240636; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yS+Astco5Bh8/oc41ujRmjEsBCKo5wFUS+A13l4o33Y=;
        b=eRWotJ23Lg58plC5QVSmTCOVCi/HG2B8Xb3NveC21vJdMk2JPknPsApCsbKSrHrOrd
         ul0tCXS8hjyUgsQMXoQjfA8+ZNYo7+Hud+bFA8O3u9VsgIumwOkrjzjUHoQB9MLYdE2F
         PO38bqWBAUcY+7t+PJEy2O78KjG283mteM1NvA3xaQO6us7ZXQVDsv+ASwJJHcD7PMyb
         25o/OwgJA/w/ii2KxyUw7ISppBRWMt7nyTwTBtxNh40uCX5CJhr7TL86QmIdjskl32qd
         aq3tzkcL8aaLLHoOA4V6tMsM1eDYBJHMSF6yBVPzyAIanuhuBDKqUte/8egFc59dt3Fz
         RZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702635836; x=1703240636;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yS+Astco5Bh8/oc41ujRmjEsBCKo5wFUS+A13l4o33Y=;
        b=nrDQA7Yq2q3ItA9dsA7BxaSkPNMtBoWbArFKoM9Cp4hj8/hzNm8UDp7Cjlz/Gv9sYW
         hfy4ppzzI6I96uueva7Sih0Ort9qAtMBgATjNY5Ll2+KA/WnY7JPdF7S1FJN/IBZlfRI
         EOrBwQQuOHkTcNWqSbssUBLJ7bN/a1p3s4x+qbcKbMDVy/fjXcKgj02pec+qAS2K1MXv
         PEVRooPx3FgfcSnsUkHx4E7EDynbEJHRlEhyA66b9dALwp3KjAAgawL+1FirzV3JX8w5
         A+n2YXOIU6AAH9iX3vh7Uh0anjB9OMRCa1qVVNz8Qan6GdlJyl3EXk8gQMY0jWoXw+SU
         7eCA==
X-Gm-Message-State: AOJu0YxCMBmsx2dDiRhYVeYB+Ae5Uz7l5JsVVnWZr3SkIF2NoX9AwNx+
	jrdA8nLbpNi2INUtsVtRO8Gu7g==
X-Google-Smtp-Source: AGHT+IFji3CPmOm1EiJAz9SOQ55L5S6jb323+mQyesxrwYedW1RG8Pkebp4R1SXKe07O1gvfI7ziOw==
X-Received: by 2002:a05:600c:444c:b0:40c:3831:27ee with SMTP id v12-20020a05600c444c00b0040c383127eemr5814657wmn.59.1702635836594;
        Fri, 15 Dec 2023 02:23:56 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id s18-20020a5d4ed2000000b00336421f1818sm5937758wrv.112.2023.12.15.02.23.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Dec 2023 02:23:55 -0800 (PST)
Message-ID: <5e454300-f1ef-435c-8c4c-16561502196a@linaro.org>
Date: Fri, 15 Dec 2023 10:23:53 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] dt-bindings: clock: google,gs101: fix CMU_TOP gate
 clock names
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 peter.griffin@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 sboyd@kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org,
 alim.akhtar@samsung.com, gregkh@linuxfoundation.org, jirislaby@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, s.nawrocki@samsung.com,
 tomasz.figa@gmail.com, cw00.choi@samsung.com, arnd@arndb.de,
 semen.protsenko@linaro.org
Cc: andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
 <20231214105243.3707730-2-tudor.ambarus@linaro.org>
 <050c3119-0431-4400-9052-7a9c0ec67918@linaro.org>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <050c3119-0431-4400-9052-7a9c0ec67918@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Krzysztof,

On 12/15/23 08:13, Krzysztof Kozlowski wrote:
> On 14/12/2023 11:52, Tudor Ambarus wrote:
>> The gs101 clock names are derived from the clock register names under
>> some certain rules. In particular, for the gate clocks the following is
>> documented and expected in the gs101 clock driver:
>>
>>   Replace CLK_CON_GAT_CLKCMU      with CLK_GOUT_CMU and gout_cmu
>>   Replace CLK_CON_GAT_GATE_CLKCMU with CLK_GOUT_CMU and gout_cmu
>>
>>   For gates remove _UID _BLK _IPCLKPORT and _RSTNSYNC
> 
> I don't understand what it has to do with the bindings.
> 
>>
>> The CMU TOP gate clock names missed to include the required "CMU"
>> differentiator which will cause name collisions with the gate clock names
>> of other clock units. Fix the TOP gate clock names and include "CMU" in
>> their name.
> 
> Neither here. Clock names are not related to defines.
> 

When saying "clock names" I meant the clock symbolic names that are
defined in the bindings, the _id passed in GATE(_id, ) if you want.

>>
>> Fixes: 0a910f160638 ("dt-bindings: clock: Add Google gs101 clock management unit bindings")
>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>> ---
>>  drivers/clk/samsung/clk-gs101.c          | 167 ++++++++++++-----------
>>  include/dt-bindings/clock/google,gs101.h | 144 +++++++++----------
> 
> I miss the point why bindings must be changed with driver.

The clock symbolic names that are defined in the bindings file are used
as IDs in the clock driver. Having the changes split per file will
result in compilation errors breaking bisect.
> 
> Really, guys, we are milling the first GS101 patches for entire cycle.
> Almost 3 months. The moment I merge bindings you tell me they are wrong.
> Few days after merging them.

I apologize. It happens when we work in parallel. The clock symbolic
names were mangled just in v6. It was considered that the clock names
used in the datasheet are too long and the dt becomes unreadable. I just
recently updated the peric0 clock symbolic names according to the clock
symbolic name mangling strategy, that's why we spot the inconsistency
and the symbolic name collision so late.

Cheers,
ta

