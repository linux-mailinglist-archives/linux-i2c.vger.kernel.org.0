Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A58354AD4DC
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 10:30:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237208AbiBHJ3v (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 04:29:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237344AbiBHJ3v (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 04:29:51 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 714EAC03FEC5
        for <linux-i2c@vger.kernel.org>; Tue,  8 Feb 2022 01:29:50 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EF79A3F1F0
        for <linux-i2c@vger.kernel.org>; Tue,  8 Feb 2022 09:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1644312588;
        bh=Ui/6owStfQRYY+YD9HVYrRMZ2Sy2yY8RPY3JJ3hVfCQ=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=aMkxK1uEQsxaK/7peR0onjb7Mhj24OibpC4DvgujfsMwY/l52Oc+se79O1LC3ojFz
         fvxCN3K2wdSM02R86k/YaREQrx6i780bs4DSjUL0SuW4YXnLAAz/uPOa1EB+AS+auZ
         cF5Bvd6Sf6MSIdH4mGzG2PFtmEIgNunZzbFZIfCagfKW8bYCPqP2sjIwmvE0fy+r2O
         if+PgMwWZDgLCcwdXVXp+JTly0/8tR6du/djkZPKtCoH8xoN+3iPXRpFmwOzyZPz2n
         ypLTzX1ibGYumwvOoKdN/9M0WNQSyDSMELOyr5034rN+wtudwvMzwF1x+NykFJ9E37
         1b9SD9oNNCiTQ==
Received: by mail-ed1-f69.google.com with SMTP id dn20-20020a05640222f400b0040f8cdfb542so1909701edb.3
        for <linux-i2c@vger.kernel.org>; Tue, 08 Feb 2022 01:29:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Ui/6owStfQRYY+YD9HVYrRMZ2Sy2yY8RPY3JJ3hVfCQ=;
        b=ruYIoIuDXqxxi2TWhUUZW1/suZe+ggKAvFwY5N1XTDqeeUgTkh1ZCiVWqxTLXtEKGO
         7xGjnenRWrPjanPusy7XhlPIRgSVJ2s9z53uCm0RSfBBB3j/9hkbd36GrEB5vW4zF+zV
         yYS7enhPHULquMHUO1yOEMGqJG7kWvomT4MhARbQmm3F/TMO258UYRtI14G8e0dxlMEg
         HtUm7we9v+tHbAZuXmAgRaJQ+xyCCGR9PTdZu4XQu2/+Fn4gIeppOuqV8y26n2Uj+6I3
         WXpPl+tmcf5MbisHTvkdomA/P23GaENyeP47v7zCWIJSSRA8/XnFmnJ+nRLlFzaFW9eq
         /MWQ==
X-Gm-Message-State: AOAM530HMG5KPnQ/kNQgPAh0mXNhYvqInV87mT+bFuSVY0A9YHAB86bx
        shBJZ9XBY9ofHZAezs9UsDeRrFxENHxgxALYcH4csL4C+2tGSSr0ZiJf8NRiNWdCOamCRrIDRt2
        NJ93rJP66BtZMdxd0rNxAGaO0xylF0khlJFs4gw==
X-Received: by 2002:a17:907:7246:: with SMTP id ds6mr2993390ejc.762.1644312588547;
        Tue, 08 Feb 2022 01:29:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIIcu9utR18wxFBpEWYCI6O+IiGR9UvBn6XHif4bRYF5ZPoy1sYBX8oCI5IIrFXAlpCxsc7w==
X-Received: by 2002:a17:907:7246:: with SMTP id ds6mr2993375ejc.762.1644312588328;
        Tue, 08 Feb 2022 01:29:48 -0800 (PST)
Received: from [192.168.0.93] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id t22sm6339403edv.105.2022.02.08.01.29.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Feb 2022 01:29:47 -0800 (PST)
Message-ID: <36cc734d-2120-5834-27a9-5bd37e14d862@canonical.com>
Date:   Tue, 8 Feb 2022 10:29:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v1 6/6] i2c: npcm: Support NPCM845
Content-Language: en-US
To:     Tali Perry <tali.perry1@gmail.com>, Tyrone Ting <warp5tw@gmail.com>
Cc:     avifishman70@gmail.com, Tomer Maimon <tmaimon77@gmail.com>,
        Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh+dt@kernel.org>, semen.protsenko@linaro.org,
        yangyicong@hisilicon.com, Wolfram Sang <wsa@kernel.org>,
        jie.deng@intel.com, sven@svenpeter.dev, bence98@sch.bme.hu,
        lukas.bulwahn@gmail.com, arnd@arndb.de, olof@lixom.net,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tali Perry <tali.perry@nuvoton.com>,
        Avi Fishman <Avi.Fishman@nuvoton.com>,
        tomer.maimon@nuvoton.com, KWLIU@nuvoton.com, JJLIU0@nuvoton.com,
        kfting@nuvoton.com, OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20220207063338.6570-1-warp5tw@gmail.com>
 <20220207063338.6570-7-warp5tw@gmail.com>
 <CAHb3i=vdc_+J4pCBcY--C85ZR1uXO1LG02UsttsfSnsQBDKWAg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAHb3i=vdc_+J4pCBcY--C85ZR1uXO1LG02UsttsfSnsQBDKWAg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 08/02/2022 10:22, Tali Perry wrote:
>> On 08/02/2022 09:51, Tali Perry wrote:
>>>> On 08/02/2022 08:14, Tali Perry wrote:
>>>>>> Subject: Re: [PATCH v1 6/6] i2c: npcm: Support NPCM845
>>>>>>
>>>>>> On 07/02/2022 13:00, Jonathan Neuschäfer wrote:
>>>>>>> Hello,
>>>>>>>
>>>>>>> On Mon, Feb 07, 2022 at 02:33:38PM +0800, Tyrone Ting wrote:
>>>>>>>> From: Tyrone Ting <kfting@nuvoton.com>
>>>>>>>>
>>>>>>>> NPCM8XX uses a similar i2c module as NPCM7XX.
>>>>>>>> The only difference is that the internal HW FIFO is larger.
>>>>>>>>
>>>>>>>> Related Makefile and Kconfig files are modified to support as well.
>>>>>>>>
>>>>>>>> Fixes: 56a1485b102e ("i2c: npcm7xx: Add Nuvoton NPCM I2C controller
>>>>>>>> driver")
>>>>>>>
>>>>>>> It's not really a bug fix, but rather an additional feature.
>>>>>>> Therefore, I suggest removing the Fixes tag from this patch.
>>>>>>>
>>>>>>>> Signed-off-by: Tyrone Ting <kfting@nuvoton.com>
>>>>>>>> Signed-off-by: Tali Perry <tali.perry1@gmail.com>
>>>>>>>> ---
>>>>>>> [...]
>>>>>>>>  /* init register and default value required to enable module */
>>>>>>>>  #define NPCM_I2CSEGCTL 0xE4
>>>>>>>> +#ifdef CONFIG_ARCH_NPCM7XX
>>>>>>>>  #define NPCM_I2CSEGCTL_INIT_VAL 0x0333F000
>>>>>>>> +#else
>>>>>>>> +#define NPCM_I2CSEGCTL_INIT_VAL 0x9333F000
>>>>>>>> +#endif
>>>>>>>
>>>>>>> This is going to cause problems when someone tries to compile a kernel
>>>>>>> that runs on both NPCM7xx and NPCM8xx (because the driver will then
>>>>>>> only work on NPCM7xx).
>>>>>>
>>>>>> Yes, good catch.
>>>>>>
>>>>>> The NPCM7XX is multiplatform, I guess NPCM8xx will be as well, so this looks like an invalid code. How such code is supposed to work on multiplatform kernel?
>>>>>>
>>>>>
>>>>> NPCM7xx and NPCM8xx are very different devices.
>>>>> They share same driver sources for some of the modules but it's not ABI.
>>>>> Users cannot compile a single kernel with two separate DTS.
>>>>> In case of the i2c controller, the npcm7xx has a 16 byte HW FIFO,
>>>>> and the NPCM8xx has 32 bytes HW FIFO.
>>>>> This also means that registers fields are slightly different.
>>>>> For init data we can move it to the DTS, but register field sizes
>>>>> can't be handled with this approach.
>>>>>
>>>>
>>>> What do you mean they cannot compile a kernel with different DTS? Of
>>>> course they can - when we talk about multiplatform sub-architectures!
>>>> Maybe there is something specific in NPCMxxx which stops it but then it
>>>> should not be marked multiplatform.
>>>>
>>>
>>>
>>> NCPM7xx is ARM32 bit (dual core Cortex A9)
>>> NPCM8xx is ARM64 bit (quad core Cortex A35)
>>>
>>> They have completely different architecture so not ABI compliant.
>>> I2C module is similar, but the devices are quite different and have
>>> separate architectures.
>>
>> OK, in such case usually you indeed can't have both. :)
>>
>>> Sorry for the confusion.
>>> This is the first patch we try to upstream for NPCM8xx.
>>> In the coming weeks we will upstream the architecture of NPCM8xx as well.
>>
>> Still, ARCH_XXX should not be hard-coded in the drivers to change the
>> driver's behavior, even if driver won't be used simultaneously. It
>> breaks all design principles and prevents any further re-use if a new
>> use case appears.
>>
>> You can use "ifdef ARCH_XXX" to skip building of some parts of the
>> driver, but it's not the case here.
>>
> 
> Correct, the main change is in FIFO size:
> +#ifdef CONFIG_ARCH_NPCM7XX
> #define I2C_HW_FIFO_SIZE               16
> +#else
> +#define I2C_HW_FIFO_SIZE               32
> +#endif /* CONFIG_ARCH_NPCM7XX */
> 
> NPCM7XX will always have 16 bytes, all the next gens will have 32.
> 
> This impact some registers sizes, like this one:
> 
> +#ifdef CONFIG_ARCH_NPCM7XX
> #define NPCM_I2CRXF_STS_RX_BYTES       GENMASK(4, 0)
> +#else
> +#define NPCM_I2CRXF_STS_RX_BYTES       GENMASK(5, 0)
> +#endif /*CONFIG_ARCH_NPCM7XX*/
> 
> For this, the FIFO size should be defined before compilation.

No, it does not have to. We solved it numerous time with quirks or
per-chip-drvdata. It's common.

> I also don't want to let users select FIFO size per architecture.
> NPCM7XX has 16, NPCM8XX has 32. This is not a user selection.
> It's part of the arch.

I understand it is part of the architecture but why Nuvoton is different
than other architectures and requires special treatment here? With most
of the drivers, regardless of possibility of running same build on
different hardware, we strive to make it ifdef-independent.

Please run:
  git grep ARCH -- drivers/i2c/busses/*c
and see how many of such ifdef patterns you see. You also won't find
them if you grep for CONFIG...

The driver should be designed in portable way. The driver should not
have architecture-dependent code.

Best regards,
Krzysztof
