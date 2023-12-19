Return-Path: <linux-i2c+bounces-873-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7F7818CDA
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 17:49:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 670EBB230B2
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 16:49:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDE6C31A62;
	Tue, 19 Dec 2023 16:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rM3bgyxu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C27B37D1B
	for <linux-i2c@vger.kernel.org>; Tue, 19 Dec 2023 16:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-40c38de1ee4so47867455e9.0
        for <linux-i2c@vger.kernel.org>; Tue, 19 Dec 2023 08:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703004472; x=1703609272; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ztFBBGld7hUI4VJojGgOtomwXDcVxWJSyB/AXHsVeWE=;
        b=rM3bgyxuTe7WH3lNRHboEvU8yLk+bUwdevIW2qvEHTJ/pN9d0K/o+B3V/lVrTeQgvW
         l+J9zICZ6PXl9Yk1eakciRZOeZB3hmtcsxNqgphF1odGps7FpAK1bIGjyGpPiBeC8EXn
         U5ckDtq616u9cc4LLUBjU9py0o3AzhQbAgfPjZMCxSSihEC0RbJeH2AUhuLsLB7COnTz
         ZjvEi0iK2PNzCyqYxdQJRmoBKq5EZe4u47KS5tHYP8vglWov115pinv4Zjejkk22GUfx
         2kv3eiC8SzmP3NVSYZlOTdiSe+5kSrIZ2EEBCzUU2HhrivbxS2Qs/wex6SHcVJMLXQrZ
         niRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703004472; x=1703609272;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ztFBBGld7hUI4VJojGgOtomwXDcVxWJSyB/AXHsVeWE=;
        b=Tf2KeZ/bLROKfzoiZuCmWENdEaW6OSXEl7djDx5QkLfFYvxEOzgAqP5uZDf+ohV3xk
         3fmjNcpd441TjVBN2Eq/nt0DCzqMvl05Wjv/zgJU/0Y6Vo2WEnXFiqJRGqefXfI+1Dwj
         l3sFETkAgvbAQRxTlA/GCteKoHYLGV0jOae7sObnAOV4fHRbESnz9lTbKcvdBRRYRCSz
         YDs2ZjgW+KahjIj61dj6XARu9W/ey6pt5vum4TcOD+1iY7UIaIjrcTWcZJD3XR7xlb5f
         heEr9iacnWHZJ2dDZD9NqmllVthYCguI/wFbo5vJw7gyGM5BIfmfzBlUpe4UjWChoXGZ
         rP5g==
X-Gm-Message-State: AOJu0YyIFj3prfzxNRrPmY+C02osfRYJDcr3x9gfepfni6fq9zhF1l9g
	GVbaZmu4yyYuZ6ML0+pItVDtMQ==
X-Google-Smtp-Source: AGHT+IGhz/xh4s9Fiq1P26HvBCbICpJ/dWKmSEfPAGljDU6uFW5fnogxNp/ELufPScu1+Cb6um9EdA==
X-Received: by 2002:a05:600c:444e:b0:40c:48c2:f69f with SMTP id v14-20020a05600c444e00b0040c48c2f69fmr8079112wmn.12.1703004472071;
        Tue, 19 Dec 2023 08:47:52 -0800 (PST)
Received: from [192.168.2.107] ([79.115.63.202])
        by smtp.gmail.com with ESMTPSA id u10-20020a05600c138a00b0040b45356b72sm3652506wmf.33.2023.12.19.08.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Dec 2023 08:47:51 -0800 (PST)
Message-ID: <4ba80e1e-8fec-4fd2-9140-6da006c9d5f5@linaro.org>
Date: Tue, 19 Dec 2023 16:47:47 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] clk: samsung: gs101: mark PERIC0 IP TOP gate clock
 as critical
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
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <CAPLW+4n-S2jaVPUwKTFC_iabnDd_qDV=ZubMqhz-X9XiZzzJow@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Sam!

On 12/14/23 16:43, Sam Protsenko wrote:
> On Thu, Dec 14, 2023 at 10:15 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>
>>
>>
>> On 12/14/23 16:09, Sam Protsenko wrote:
>>> On Thu, Dec 14, 2023 at 10:01 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>>>
>>>>
>>>>
>>>> On 12/14/23 15:37, Sam Protsenko wrote:
>>>>> On Thu, Dec 14, 2023 at 4:52 AM Tudor Ambarus <tudor.ambarus@linaro.org> wrote:
>>>>>>
>>>>>> Testing USI8 I2C with an eeprom revealed that when the USI8 leaf clock
>>>>>> is disabled it leads to the CMU_TOP PERIC0 IP gate clock disablement,
>>>>>> which then makes the system hang. To prevent this, mark
>>>>>> CLK_GOUT_CMU_PERIC0_IP as critical. Other clocks will be marked
>>>>>> accordingly when tested.
>>>>>>
>>>>>> Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
>>>>>> ---
>>>>>>  drivers/clk/samsung/clk-gs101.c | 2 +-
>>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/clk/samsung/clk-gs101.c b/drivers/clk/samsung/clk-gs101.c
>>>>>> index 3d194520b05e..08d80fca9cd6 100644
>>>>>> --- a/drivers/clk/samsung/clk-gs101.c
>>>>>> +++ b/drivers/clk/samsung/clk-gs101.c
>>>>>> @@ -1402,7 +1402,7 @@ static const struct samsung_gate_clock cmu_top_gate_clks[] __initconst = {
>>>>>>              "mout_cmu_peric0_bus", CLK_CON_GAT_GATE_CLKCMU_PERIC0_BUS,
>>>>>>              21, 0, 0),
>>>>>>         GATE(CLK_GOUT_CMU_PERIC0_IP, "gout_cmu_peric0_ip", "mout_cmu_peric0_ip",
>>>>>> -            CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP, 21, 0, 0),
>>>>>> +            CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP, 21, CLK_IS_CRITICAL, 0),
>>>>>
>>>>> This clock doesn't seem like a leaf clock. It's also not a bus clock.
>>>>> Leaving it always running makes the whole PERIC0 CMU clocked, which
>>>>> usually should be avoided. Is it possible that the system freezes
>>>>> because some other clock (which depends on peric0_ip) gets disabled as
>>>>> a consequence of disabling peric0_ip? Maybe it's some leaf clock which
>>>>> is not implemented yet in the clock driver? Just looks weird to me
>>>>> that the system hangs because of CMU IP clock disablement. It's
>>>>> usually something much more specific.
>>>>
>>>> The system hang happened when I tested USI8 in I2C configuration with an
>>>> eeprom. After the eeprom is read the leaf gate clock that gets disabled
>>>> is the one on PERIC0 (CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK). I assume
>>>> this leads to the CMU_TOP gate (CLK_CON_GAT_GATE_CLKCMU_PERIC0_IP)
>>>> disablement which makes the system hang. Either marking the CMU_TOP gate
>>>> clock as critical (as I did in this patch) or marking the leaf PERIC0
>>>> gate clock as critical, gets rid of the system hang. Did I choose wrong?
>>>>
>>>
>>> Did you already implement 100% of clocks in CMU_PERIC0? If no, there
>>
>> yes.

I checked again all the clocks. I implemented all but one, the one
defined by the CLK_CON_BUF_CLKBUF_PERIC0_IP register. Unfortunately I
don't have any reference on how it should be defined so I won't touch it
yet. But I have some good news too, see below.

> 
> Ok. Are there any other CMUs (perhaps not implemented yet) which
> consume clocks from CMU_PERIC0, specifically PERIC0_IP clock or some
> clocks derived from it? If so, is there a chance some particular leaf
> clock in those CMUs actually renders the system frozen when disabled
> as a consequence of disabling PERIC0_IP, and would explain better why
> the freeze happens?
> 
> For now I think it's ok to have that CLK_IS_CRITICAL flag here,
> because as you said you implemented all clocks in this CMU and neither
> of those looks like a critical one. But I'd advice to add a TODO
> comment saying it's probably a temporary solution before actual leaf
> clock which leads to freeze is identified (which probably resides in
> some other not implemented yet CMU).
> 
>>
>>> is a chance some other leaf clock (which is not implemented yet in
>>> your driver) gets disabled as a result of PERIC0_IP disablement, which
>>> might actually lead to that hang you observe. Usually it's some
>>> meaningful leaf clock, e.g. GIC or interconnect clocks. Please check
>>> clk-exynos850.c driver for CLK_IS_CRITICAL and CLK_IGNORE_UNUSED flags
>>> and the corresponding comments I left there, maybe it'll give you more
>>> particular idea about what to look for. Yes, making the whole CMU
>>> always running without understanding why (i.e. because of which
>>> particular leaf clock) might not be the best way of handling this
>>
>> because of CLK_GOUT_PERIC0_CLK_PERIC0_USI8_USI_CLK
> 
> That's not a root cause here. And I think PERIC0_IP is neither.
> 

you were right!
>>
>>> issue. I might be mistaken, but at least please check if you
>>> implemented all clocks for PERIC0 first and if making some meaningful
>>> leaf clock critical makes more sense.
>>>

I determined which leaf clocks shall be marked as critical. I enabled
the debugfs clock write access. Then I made sure that the parents of the
PERIC0 CMU have at least one user so that they don't get disabled after
an enable-disable sequence on a leaf clock. The I took all the PERIC0
gate clocks and enabled and disabled them one by one. Whichever hang the
system when the clock was disabled was marked as critical. The list of
critical leaf clocks is as following:

"gout_peric0_peric0_cmu_peric0_pclk",
"gout_peric0_lhm_axi_p_peric0_i_clk",
"gout_peric0_peric0_top1_ipclk_0",
"gout_peric0_peric0_top1_pclk_0".

I'll update v2 with this instead. Thanks for the help, Sam!
Cheers,
ta

