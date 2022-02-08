Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBB744AD618
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 12:23:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232758AbiBHLWh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 06:22:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355442AbiBHJjR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 04:39:17 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A1D3C03FEC1
        for <linux-i2c@vger.kernel.org>; Tue,  8 Feb 2022 01:39:16 -0800 (PST)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 230423F1E7
        for <linux-i2c@vger.kernel.org>; Tue,  8 Feb 2022 09:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644313154;
        bh=AD+JYq4vlLNE7/XM0yuo/Yy4HxbXjNKnvOPIiUzX7yQ=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=Ghn+ZM8XROPowTt9snKFshNuqiLq4MmqMg3HJkR3M1ktjZSqLHVGMl8K+T264Mczm
         a655e1vqkz1sRSOReT2C927k5Fpye8CnTihAj9uAd8UxODItjOSUPpfJvbTdmNuLDU
         UeN92Q74qfaxZODsXgnPuHoVFR7To4NQXLar8v5l0BVYOBBQgzCskO2tU3GX9jDps8
         HW9MbN28oOdoaD86C/Jes2NRFegVFI8HuYO+SiW4/LwiLxz8GLVUcKI1YKrc/bJfBf
         stqUNIyTgzpZFiVEXnl0P/xhJjKb4qmSoY95RRz8UIAaL8bt9CMlIkt9NpVgfA+MCx
         gWoKm/2uImDRw==
Received: by mail-ed1-f71.google.com with SMTP id n8-20020a50cc48000000b0040f345d624aso5212612edi.6
        for <linux-i2c@vger.kernel.org>; Tue, 08 Feb 2022 01:39:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=AD+JYq4vlLNE7/XM0yuo/Yy4HxbXjNKnvOPIiUzX7yQ=;
        b=JmNVY3TZhICZ/pALOOdwh2J8Tmes2O73G88itUfplPPViipxHS+b5ArG6mkgv7062y
         QRWXXWM83VJW2bOP7osYe0zjKshI8OeN+4r8Yf7Ify9VTGk2t0oTBlfmXOX0Qgc0rWw4
         fuKQGLlGx2QM+m0RH+0wLX6BlxNfTjayvdNkHDaHPr8BnhAl+u+a3iNfma+AMT1/nKbt
         5tv5JeOrobxlZaBG14zlsIw7MuVAp9DNqO1NLizUnTWK/RwNWCPvBKkfEN4+19IxWSDU
         b4AxBy56bf/tnB4/2vH5KWXtyOPC29TXMVG6+7R144F4KCEIjXdJcZw9qRM4o79LcYyd
         LsXw==
X-Gm-Message-State: AOAM5316kSUOJxq6C1Z7VosJ3UQLQWRUeJxhXNFL+HaJXPDorsuVCop6
        hspMBwGglzkS8fAjnVgRaXkV+78g8eZPovtmX0UfWWG+PtJ0FMPonRguwxDqtFyrRLZ+NbJpr4L
        HeaZ+uuaR/EwLBbWsXQqy94XSwi6Mpaiqow0i0Q==
X-Received: by 2002:a17:907:3f09:: with SMTP id hq9mr1728571ejc.32.1644313153096;
        Tue, 08 Feb 2022 01:39:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVNi8Hcf5UL2UM3LQyY6wyiCukRH7Wjy55MvtQN7Bt0lZ38AXPg0LCF1i3MjzhsdsJiSZ3Yg==
X-Received: by 2002:a17:907:3f09:: with SMTP id hq9mr1728543ejc.32.1644313152859;
        Tue, 08 Feb 2022 01:39:12 -0800 (PST)
Received: from [192.168.0.93] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id p21sm719810edu.107.2022.02.08.01.39.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Feb 2022 01:39:12 -0800 (PST)
Message-ID: <ecb25821-3410-0f0e-5195-ee72c663556b@canonical.com>
Date:   Tue, 8 Feb 2022 10:39:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 6/6] i2c: npcm: Support NPCM845
Content-Language: en-US
To:     Avi Fishman <avifishman70@gmail.com>,
        Tali Perry <tali.perry1@gmail.com>
Cc:     Tyrone Ting <warp5tw@gmail.com>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh+dt@kernel.org>, semen.protsenko@linaro.org,
        yangyicong@hisilicon.com, Wolfram Sang <wsa@kernel.org>,
        jie.deng@intel.com, sven@svenpeter.dev, bence98@sch.bme.hu,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, olof@lixom.net,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tali Perry <tali.perry@nuvoton.com>,
        Avi Fishman <Avi.Fishman@nuvoton.com>,
        Tomer Maimon <tomer.maimon@nuvoton.com>, KWLIU@nuvoton.com,
        JJLIU0@nuvoton.com, kfting@nuvoton.com,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20220207063338.6570-1-warp5tw@gmail.com>
 <20220207063338.6570-7-warp5tw@gmail.com>
 <CAHb3i=vdc_+J4pCBcY--C85ZR1uXO1LG02UsttsfSnsQBDKWAg@mail.gmail.com>
 <CAKKbWA6qZ1ytKS5V6tLxQgzQefhz7mTg3Vi_tPDM2p=N7O+8Vg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAKKbWA6qZ1ytKS5V6tLxQgzQefhz7mTg3Vi_tPDM2p=N7O+8Vg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08/02/2022 10:31, Avi Fishman wrote:
> On Tue, Feb 8, 2022 at 11:22 AM Tali Perry <tali.perry1@gmail.com> wrote:
>>
>>> On 08/02/2022 09:51, Tali Perry wrote:
>>>>> On 08/02/2022 08:14, Tali Perry wrote:
>>>>>>> Subject: Re: [PATCH v1 6/6] i2c: npcm: Support NPCM845
>>>>>>>
>>>>>>> On 07/02/2022 13:00, Jonathan Neuschäfer wrote:
>>>>>>>> Hello,
>>>>>>>>
>>>>>>>> On Mon, Feb 07, 2022 at 02:33:38PM +0800, Tyrone Ting wrote:
>>>>>>>>> From: Tyrone Ting <kfting@nuvoton.com>
>>>>>>>>>
>>>>>>>>> NPCM8XX uses a similar i2c module as NPCM7XX.
>>>>>>>>> The only difference is that the internal HW FIFO is larger.
>>>>>>>>>
>>>>>>>>> Related Makefile and Kconfig files are modified to support as well.
>>>>>>>>>
>>>>>>>>> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller
>>>>>>>>> driver")
>>>>>>>>
>>>>>>>> It's not really a bug fix, but rather an additional feature.
>>>>>>>> Therefore, I suggest removing the Fixes tag from this patch.
>>>>>>>>
>>>>>>>>> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>>>>>>>>> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
>>>>>>>>> ---
>>>>>>>> [...]
>>>>>>>>>  /* init register and default value required to enable module */
>>>>>>>>>  #define NPCM_I2CSEGCTL 0xE4
>>>>>>>>> +#ifdef CONFIG_ARCH_NPCM7XX
>>>>>>>>>  #define NPCM_I2CSEGCTL_INIT_VAL 0x0333F000
>>>>>>>>> +#else
>>>>>>>>> +#define NPCM_I2CSEGCTL_INIT_VAL 0x9333F000
>>>>>>>>> +#endif
>>>>>>>>
>>>>>>>> This is going to cause problems when someone tries to compile a kernel
>>>>>>>> that runs on both NPCM7xx and NPCM8xx (because the driver will then
>>>>>>>> only work on NPCM7xx).
>>>>>>>
>>>>>>> Yes, good catch.
>>>>>>>
>>>>>>> The NPCM7XX is multiplatform, I guess NPCM8xx will be as well, so this looks like an invalid code. How such code is supposed to work on multiplatform kernel?
>>>>>>>
>>>>>>
>>>>>> NPCM7xx and NPCM8xx are very different devices.
>>>>>> They share same driver sources for some of the modules but it's not ABI.
>>>>>> Users cannot compile a single kernel with two separate DTS.
>>>>>> In case of the i2c controller, the npcm7xx has a 16 byte HW FIFO,
>>>>>> and the NPCM8xx has 32 bytes HW FIFO.
>>>>>> This also means that registers fields are slightly different.
>>>>>> For init data we can move it to the DTS, but register field sizes
>>>>>> can't be handled with this approach.
>>>>>>
>>>>>
>>>>> What do you mean they cannot compile a kernel with different DTS? Of
>>>>> course they can - when we talk about multiplatform sub-architectures!
>>>>> Maybe there is something specific in NPCMxxx which stops it but then it
>>>>> should not be marked multiplatform.
>>>>>
>>>>
>>>>
>>>> NCPM7xx is ARM32 bit (dual core Cortex A9)
>>>> NPCM8xx is ARM64 bit (quad core Cortex A35)
>>>>
>>>> They have completely different architecture so not ABI compliant.
>>>> I2C module is similar, but the devices are quite different and have
>>>> separate architectures.
>>>
>>> OK, in such case usually you indeed can't have both. :)
>>>
>>>> Sorry for the confusion.
>>>> This is the first patch we try to upstream for NPCM8xx.
>>>> In the coming weeks we will upstream the architecture of NPCM8xx as well.
>>>
>>> Still, ARCH_XXX should not be hard-coded in the drivers to change the
>>> driver's behavior, even if driver won't be used simultaneously. It
>>> breaks all design principles and prevents any further re-use if a new
>>> use case appears.
>>>
>>> You can use "ifdef ARCH_XXX" to skip building of some parts of the
>>> driver, but it's not the case here.
>>>
>>
>> Correct, the main change is in FIFO size:
>> +#ifdef CONFIG_ARCH_NPCM7XX
>> #define I2C_HW_FIFO_SIZE               16
>> +#else
>> +#define I2C_HW_FIFO_SIZE               32
>> +#endif /* CONFIG_ARCH_NPCM7XX */
>>
>> NPCM7XX will always have 16 bytes, all the next gens will have 32.
>>
>> This impact some registers sizes, like this one:
>>
>> +#ifdef CONFIG_ARCH_NPCM7XX
>> #define NPCM_I2CRXF_STS_RX_BYTES       GENMASK(4, 0)
>> +#else
>> +#define NPCM_I2CRXF_STS_RX_BYTES       GENMASK(5, 0)
>> +#endif /*CONFIG_ARCH_NPCM7XX*/
>>
>> For this, the FIFO size should be defined before compilation.
>> I also don't want to let users select FIFO size per architecture.
>> NPCM7XX has 16, NPCM8XX has 32. This is not a user selection.
>> It's part of the arch.
> 
> Will this be a better approach to add in the Kconfig file a legacy mode:
> config I2C_NPCM_VER_89
>       bool "support legacy i2c version 0x89 of npcm"
>       depends on ARCH_NPCM7XX
>       default y
>       help
>         This limits the support to legacy i2c version 0x89 of npcm
>         Will be only 16 bytes fifo and will not include other new features
> 
> config I2C_NPCM
>       tristate "Nuvoton I2C Controller"
>       depends on ARCH_NPCM || COMPILE_TEST
>       select I2C_NPCM_VER_89 if ARCH_NPCM7XX
>       help
>         If you say yes to this option, support will be included for the
>         Nuvoton I2C controller, which is available on the NPCM BMC
>         controllers.
>         Driver can also support slave mode (select I2C_SLAVE).
> 
> and in the code replace:
> #ifdef CONFIG_ARCH_NPCM7XX
> with
> #ifdef CONFIG_I2C_NPCM_VER_89

This looks better but it is still the same approach - embedding ifdefs
to control the code flow and logic. Only naming is different. Whenever
you come with new I2C block for old or new architecture, you will have
the same problem. We solved such problems this already - quirks or
per-chip-drvdata - so here should be the same.

Even if the code does not end up in the same binary, it should be
designed properly. Because in the future it might end-up in same binary.

Everyone thought there will be no multiplatform ARMv7 so entire
arch/arm/mach-* was written exactly like that. And what? It was a lot of
effort to all of us to fix that mistakes. ARMv8 can work in 32-bit, so
who knows... Just do it properly.

Best regards,
Krzysztof
