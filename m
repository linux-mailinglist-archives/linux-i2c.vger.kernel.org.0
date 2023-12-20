Return-Path: <linux-i2c+bounces-909-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 448D581A108
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 15:23:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 82F4B281CCB
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 14:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E565338F9A;
	Wed, 20 Dec 2023 14:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lhqwe3bW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3273A280
	for <linux-i2c@vger.kernel.org>; Wed, 20 Dec 2023 14:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a2330a92ae6so516252066b.0
        for <linux-i2c@vger.kernel.org>; Wed, 20 Dec 2023 06:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703082170; x=1703686970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5hTEyNC/eV9SDQwNfWhac/LY/wkwblQO8xjRJeEZESg=;
        b=Lhqwe3bWXMsclxAs04JWHH07R1LgSSrzB7KBQtvoWnxxwYvlbb2tQQGN6X761hFw4p
         cYWD+vYdV1vJtH5oZ5nYkt71GcZn2nzgkwK7gMyHvCjIPbrzntuPEZkgaM7w7fubg0OH
         rwvUv+qDdkeSRVn37PRG09RYzBmZvG4d6U616F3+AIJde+PO01xIB2SVedT8EfXaclYH
         i1/KYB5IEepVzsV7jHf/W6guHSHJ8vz1GbZIWTRNah9LUqVTvscKHOpamGGZv8v8CtEA
         e3OpZUwkmr/SLDlo9e63rf60Pa+qWV1IAHUPeLQu7nLKZ66C9nrJKJBz8Keb9lZRdN8p
         xAaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703082170; x=1703686970;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5hTEyNC/eV9SDQwNfWhac/LY/wkwblQO8xjRJeEZESg=;
        b=nFM3prNM8AdvCohnirzSYIBn+PnhvYC6wmC1rwVvOR8OfZs3o8FM870rn2prCyqqJV
         MgKVJv0mSZjIoW8RglHVu/6Nhs1C0MDp3TYQVdl0goRZXx0QzIvPpm01Kb/JMD3zQLhR
         R6XgCu9PC61lTfR6v4rZ7NpPIG3UsaX+w8uKmXhpJsv8WTVdMRXI8KxVDXUnX4Bt9Ojs
         1nandDB3vXDpb2Gu/hJV7vUWy/YI15OXV17oyrgfFP6RR7zWLWNZ8/aTsxwbhqW/CXAA
         3BOEo3v0GZQ1nUH2GoJXIm2JyAADp2qx/zun3YH6KwO9LbdQHMuOZjWk2ZZgQRlHn1+J
         +LvA==
X-Gm-Message-State: AOJu0YxpSswbuagS7pMgX8buX0Eja23yXgMFXZgvGpNCxXKihewSGsV8
	FPd4R/VftHPR9JmyNVu/RoPp5A==
X-Google-Smtp-Source: AGHT+IH70rXw/5AsGPvboXm71L/G2LVeGrFr0QKcTQEXrZOixg3ynA1OchVE/SBo+n1ow3oGbQS9Dw==
X-Received: by 2002:a17:906:a005:b0:a23:6ba1:e220 with SMTP id p5-20020a170906a00500b00a236ba1e220mr2246183ejy.100.1703082169839;
        Wed, 20 Dec 2023 06:22:49 -0800 (PST)
Received: from [172.20.10.10] ([213.233.104.178])
        by smtp.gmail.com with ESMTPSA id fs14-20020a170907600e00b00a2699a54888sm348635ejc.64.2023.12.20.06.22.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Dec 2023 06:22:49 -0800 (PST)
Message-ID: <c3db7b3e-814c-4afc-b67a-112bce3d38ec@linaro.org>
Date: Wed, 20 Dec 2023 14:22:46 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] clk: samsung: gs101: mark PERIC0 IP TOP gate clock
 as critical
Content-Language: en-US
To: Sam Protsenko <semen.protsenko@linaro.org>
Cc: peter.griffin@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 sboyd@kernel.org, conor+dt@kernel.org, andi.shyti@kernel.org,
 alim.akhtar@samsung.com, gregkh@linuxfoundation.org, jirislaby@kernel.org,
 catalin.marinas@arm.com, will@kernel.org, s.nawrocki@samsung.com,
 tomasz.figa@gmail.com, cw00.choi@samsung.com, arnd@arndb.de,
 andre.draszik@linaro.org, saravanak@google.com, willmcvicker@google.com,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <20231214105243.3707730-1-tudor.ambarus@linaro.org>
 <20231214105243.3707730-8-tudor.ambarus@linaro.org>
 <CAPLW+4mNjCbJ+VbKR66DFSkiXHyxdjgvwjN7azxjJQ6UxQikEw@mail.gmail.com>
 <f3d61c49-1a46-476c-b7a5-6cc6a06a33ed@linaro.org>
 <CAPLW+4=tyr8Pcoe6Wm0Wtmkk4udDpuAiOKy7+C+Fwa6mvt3VoQ@mail.gmail.com>
 <5de5cddd-2bab-4408-b31f-f48bef98f14c@linaro.org>
 <CAPLW+4n-S2jaVPUwKTFC_iabnDd_qDV=ZubMqhz-X9XiZzzJow@mail.gmail.com>
 <4ba80e1e-8fec-4fd2-9140-6da006c9d5f5@linaro.org>
 <CAPLW+4mm8LG=wtJHT5EYhGGiU72qVe70vJv6-JkEGepiXFjcvA@mail.gmail.com>
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAPLW+4mm8LG=wtJHT5EYhGGiU72qVe70vJv6-JkEGepiXFjcvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Sam!

On 12/19/23 17:31, Sam Protsenko wrote:
> On Tue, Dec 19, 2023 at 10:47 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>
>> Hi, Sam!
>>
>> On 12/14/23 16:43, Sam Protsenko wrote:
>>> On Thu, Dec 14, 2023 at 10:15 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>>>
>>>>
>>>>
>>>> On 12/14/23 16:09, Sam Protsenko wrote:
>>>>> On Thu, Dec 14, 2023 at 10:01 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> On 12/14/23 15:37, Sam Protsenko wrote:
>>>>>>> On Thu, Dec 14, 2023 at 4:52 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>>>>>>>
>>>>>>>> Testing USI8 I2C with an eeprom revealed that when the USI8 leaf clock
>>>>>>>> is disabled it leads to the CMU_TOP PERIC0 IP gate clock disablement,
>>>>>>>> which then makes the system hang. To prevent this, mark
>>>>>>>> CLK_GOUT_CMU_PERIC0_IP as critical. Other clocks will be marked
>>>>>>>> accordingly when tested.
>>>>>>>>
>>>>>>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>>>>>>> ---
>>>>>>>>  drivers/clk/samsung/clk-gs101.c | 2 +-
>>>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
>>>>>>>> index 3d194520b05e..08d80fca9cd6 100644
>>>>>>>> --- a/drivers/clk/samsung/clk-gs101.c
>>>>>>>> +++ b/drivers/clk/samsung/clk-gs101.c
>>>>>>>> @@ -1402,7 +1402,7 @@ static const struct samsung_gate_clock cmu_top_gate_clks[] __initconst = {
>>>>>>>>              "mout_cmu_peric0_bus", CLK_CON_GAT_GATE_CLKCMU_PERIC0_BUS,
>>>>>>>>              21, 0, 0),
>>>>>>>>         GATE(CLK_GOUT_CMU_PERIC0_IP, "gout_cmu_peric0_ip", "mout_cmu_peric0_ip",
>>>>>>>> -            CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP, 21, 0, 0),
>>>>>>>> +            CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP, 21, CLK_IS_CRITICAL, 0),
>>>>>>>
>>>>>>> This clock doesn't seem like a leaf clock. It's also not a bus clock.
>>>>>>> Leaving it always running makes the whole PERIC0 CMU clocked, which
>>>>>>> usually should be avoided. Is it possible that the system freezes
>>>>>>> because some other clock (which depends on peric0_ip) gets disabled as
>>>>>>> a consequence of disabling peric0_ip? Maybe it's some leaf clock which
>>>>>>> is not implemented yet in the clock driver? Just looks weird to me
>>>>>>> that the system hangs because of CMU IP clock disablement. It's
>>>>>>> usually something much more specific.
>>>>>>
>>>>>> The system hang happened when I tested USI8 in I2C configuration with an
>>>>>> eeprom. After the eeprom is read the leaf gate clock that gets disabled
>>>>>> is the one on PERIC0 (CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK). I assume
>>>>>> this leads to the CMU_TOP gate (CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP)
>>>>>> disablement which makes the system hang. Either marking the CMU_TOP gate
>>>>>> clock as critical (as I did in this patch) or marking the leaf PERIC0
>>>>>> gate clock as critical, gets rid of the system hang. Did I choose wrong?
>>>>>>
>>>>>
>>>>> Did you already implement 100% of clocks in CMU_PERIC0? If no, there
>>>>
>>>> yes.
>>
>> I checked again all the clocks. I implemented all but one, the one
>> defined by the CLK_CON_BUF_CLKBUF_PERIC0_IP register. Unfortunately I
>> don't have any reference on how it should be defined so I won't touch it
>> yet. But I have some good news too, see below.
>>
>>>
>>> Ok. Are there any other CMUs (perhaps not implemented yet) which
>>> consume clocks from CMU_PERIC0, specifically PERIC0_IP clock or some
>>> clocks derived from it? If so, is there a chance some particular leaf
>>> clock in those CMUs actually renders the system frozen when disabled
>>> as a consequence of disabling PERIC0_IP, and would explain better why
>>> the freeze happens?
>>>
>>> For now I think it's ok to have that CLK_IS_CRITICAL flag here,
>>> because as you said you implemented all clocks in this CMU and neither
>>> of those looks like a critical one. But I'd advice to add a TODO
>>> comment saying it's probably a temporary solution before actual leaf
>>> clock which leads to freeze is identified (which probably resides in
>>> some other not implemented yet CMU).
>>>
>>>>
>>>>> is a chance some other leaf clock (which is not implemented yet in
>>>>> your driver) gets disabled as a result of PERIC0_IP disablement, which
>>>>> might actually lead to that hang you observe. Usually it's some
>>>>> meaningful leaf clock, e.g. GIC or interconnect clocks. Please check
>>>>> clk-exynos850.c driver for CLK_IS_CRITICAL and CLK_IGNORE_UNUSED flags
>>>>> and the corresponding comments I left there, maybe it'll give you more
>>>>> particular idea about what to look for. Yes, making the whole CMU
>>>>> always running without understanding why (i.e. because of which
>>>>> particular leaf clock) might not be the best way of handling this
>>>>
>>>> because of CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK
>>>
>>> That's not a root cause here. And I think PERIC0_IP is neither.
>>>
>>
>> you were right!
>>>>
>>>>> issue. I might be mistaken, but at least please check if you
>>>>> implemented all clocks for PERIC0 first and if making some meaningful
>>>>> leaf clock critical makes more sense.
>>>>>
>>
>> I determined which leaf clocks shall be marked as critical. I enabled
>> the debugfs clock write access. Then I made sure that the parents of the
>> PERIC0 CMU have at least one user so that they don't get disabled after
>> an enable-disable sequence on a leaf clock. The I took all the PERIC0
>> gate clocks and enabled and disabled them one by one. Whichever hang the
>> system when the clock was disabled was marked as critical. The list of
>> critical leaf clocks is as following:
>>
> 
> Nice! I used somehow similar procedure for clk-exynos850, doing
> basically the same thing, but in core clock driver code.
> 
>> "gout_peric0_peric0_cmu_peric0_pclk",
>> "gout_peric0_lhm_axi_p_peric0_i_clk",
>> "gout_peric0_peric0_top1_ipclk_0",
>> "gout_peric0_peric0_top1_pclk_0".
>>
>> I'll update v2 with this instead. Thanks for the help, Sam!
> 
> Glad you weren't discouraged by my meticulousness :) In clk-exynos850
> I usually used CLK_IGNORE_UNUSED for clocks like XXX_CMU_XXX (in your
> case it's PERIC0_CMU_PERIC0), with a corresponding comment. Those
> clocks usually can be used to disable the bus clock for corresponding
> CMU IP-core (in your case CMU_PERIC0), which makes it impossible to
> access the registers from that CMU block, as its register interface is
> not clocked anymore. Guess I saw something similar in Exynos5433 or
> Exynos7 clk drivers, or maybe Sylwester or Krzysztof told me to do so
> -- don't really remember. For AXI clock it also seems logical to keep
> it running (AXI bus might be used for GIC and memory). But again,
> maybe CLK_IGNORE_UNUSED flag would be more appropriate that
> CLK_IS_CRITICAL? For the last two clocks -- it's hard to tell what
> exactly they do. Is TOP1 some other CMU or block name, and is there
> any further users for those clocks?
> 
> Anyways, if you are working on v2, please consider doing next two
> things while at it:
> 
>   1. For each critical clock: add corresponding comment explaining why
> it's marked so

Will do.

>   2. Consider using CLK_IGNORE_UNUSED instead of CLK_IS_CRITICAL when
> appropriate; both have their use in different cases
> 
> Btw, if you check other Exynos clk drivers, there is a lot of examples
> for flags like those.
> 
Thanks for the feedback, it's educative.

I played a little with the clk debugfs and I think all should be marked
as critical. What I did was to make sure that their parents are enabled
already and then I enabled and disabled each. Each time I disabled one
of them the system hung. Thus in case they will be used, if one disable
them on an error path, it will hang the system. We can't disable them at
suspend either. Thus I propose to keep them as critical.

Thanks!
ta

