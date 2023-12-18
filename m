Return-Path: <linux-i2c+bounces-852-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E8A18166C6
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Dec 2023 07:50:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0425C1F21BFB
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Dec 2023 06:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB177479;
	Mon, 18 Dec 2023 06:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I3FEqCpz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A665A7466
	for <linux-i2c@vger.kernel.org>; Mon, 18 Dec 2023 06:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-336607f4d05so590950f8f.0
        for <linux-i2c@vger.kernel.org>; Sun, 17 Dec 2023 22:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702882215; x=1703487015; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z3fhJN/THXkL3+v4d5FjUzixu9giiwYacPBzyAkvIhY=;
        b=I3FEqCpzZLXNYInEk7v/S1Q/RKpYdm52T5thhZ8EbwwrWMS6c4r6GNgzabzOQc52YV
         LIA1p9BVPFPJupdJ6IpPp2dHtJ8Gl3C6jYMlyyDuOzeRdeEMkzhKjRa7FrYmBWsBXgnx
         mgXbpsf3e88XuzzqOyHJ8N4VbpWjOI9kKdi1jj3tKVmdnqd9NuwQy//mSQE0AgYAdr4c
         Fix7INUa0A5LtMCGU4t5a6Ux36JMdd4lbjfOM++4M0Z8IKsGQym9DqFsA8jhzY0bSivm
         Q9S22v+WfVFhk1n1LUvKgfBwbXn98tnbaqEvAR9GryDTHc+hQU7pqkeATlP+KWgb23+D
         62yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702882215; x=1703487015;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z3fhJN/THXkL3+v4d5FjUzixu9giiwYacPBzyAkvIhY=;
        b=sZwsbpJfRYc7eNsMuJQIXfHRvybw2L8xuN7AYu7Vc4ydhTv6ESbHEH1DJWIPjEIo4d
         4Xmd8sYS0/mYhKoYm7viTidSKoJtcSBJ7S0+QNyFaWsB1wXTeHIeDvLlUfqvWD6+lWO0
         vx3Ajc0gdhY3VEVaAQfAAYh2ShVtgNcOhwAOdEdlezQlM6u8hLbBIv0X7ycI4CRSFpkR
         INGekuEAa3ihz/WnkkPYcADjbUnLvLIdI9exJZRB+QLPltUcxXdEIlYJan8s/fGe7J8V
         E1OSATkEzwTcg5yba/4nPz6lxH5Lk2CamIkMmi627yfv/MkWdoCZMnNJAwCtZjELyij9
         V6lg==
X-Gm-Message-State: AOJu0YzNxJ6W0treIkQPzXOjy9Z3b/+sdNLz8rZeuLkCUxZ7VRg6TSEe
	bgSNPAXclFluWd5qO0bQnHoTOQ==
X-Google-Smtp-Source: AGHT+IHdVQPSG6mkcnfZ8Mm4BRF0KX84CtvZ2huaFfJK8e2C5dAi45ajBpQW4msnoX0tG5ZswNAc/A==
X-Received: by 2002:adf:fa06:0:b0:336:9ec:a25 with SMTP id m6-20020adffa06000000b0033609ec0a25mr7663431wrr.67.1702882214964;
        Sun, 17 Dec 2023 22:50:14 -0800 (PST)
Received: from [172.20.10.10] ([213.233.104.178])
        by smtp.gmail.com with ESMTPSA id i6-20020adff306000000b003364ce25f22sm9455401wro.108.2023.12.17.22.50.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Dec 2023 22:50:14 -0800 (PST)
Message-ID: <877ea38d-a227-43b0-8e91-7e0f1f2059b3@linaro.org>
Date: Mon, 18 Dec 2023 06:50:11 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/13] dt-bindings: clock: google,gs101: fix CMU_TOP gate
 clock names
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
 <5e454300-f1ef-435c-8c4c-16561502196a@linaro.org>
 <9eedae99-cc9a-4c8f-9a09-789b686cd456@linaro.org>
 <7163718b-0a92-4383-b475-aac52354489d@linaro.org>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <7163718b-0a92-4383-b475-aac52354489d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 12/15/23 19:25, Krzysztof Kozlowski wrote:
> On 15/12/2023 20:24, Krzysztof Kozlowski wrote:
>> On 15/12/2023 11:23, Tudor Ambarus wrote:
>>> Hi, Krzysztof,
>>>
>>> On 12/15/23 08:13, Krzysztof Kozlowski wrote:
>>>> On 14/12/2023 11:52, Tudor Ambarus wrote:
>>>>> The gs101 clock names are derived from the clock register names under
>>>>> some certain rules. In particular, for the gate clocks the following is
>>>>> documented and expected in the gs101 clock driver:
>>>>>
>>>>>   Replace CLK_CON_GAT_CLKCMU      with CLK_GOUT_CMU and gout_cmu
>>>>>   Replace CLK_CON_GAT_GATE_CLKCMU with CLK_GOUT_CMU and gout_cmu
>>>>>
>>>>>   For gates remove _UID _BLK _IPCLKPORT and _RSTNSYNC
>>>>
>>>> I don't understand what it has to do with the bindings.
>>>>
>>>>>
>>>>> The CMU TOP gate clock names missed to include the required "CMU"
>>>>> differentiator which will cause name collisions with the gate clock names
>>>>> of other clock units. Fix the TOP gate clock names and include "CMU" in
>>>>> their name.
>>>>
>>>> Neither here. Clock names are not related to defines.
>>>>
>>>
>>> When saying "clock names" I meant the clock symbolic names that are
>>> defined in the bindings, the _id passed in GATE(_id, ) if you want.
>>
>> Please re-phrase the commit message to say that you need to rename the
>> defines in the bindings headers. If you change anything else, like clock
>> names, then it should be separate patch.
> 
> I forgot:
> You can also respin this patch separately, as soon as possible, because
> it has to go this cycle.
> 
Sent here:
https://lore.kernel.org/linux-arm-kernel/20231218064333.479885-1-tudor.ambarus@linaro.org/

Thanks,
ta

