Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F07377711B6
	for <lists+linux-i2c@lfdr.de>; Sat,  5 Aug 2023 21:17:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbjHETR6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Aug 2023 15:17:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230054AbjHETR5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 5 Aug 2023 15:17:57 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EECCC139
        for <linux-i2c@vger.kernel.org>; Sat,  5 Aug 2023 12:17:54 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fe0fe622c3so5240715e87.2
        for <linux-i2c@vger.kernel.org>; Sat, 05 Aug 2023 12:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691263073; x=1691867873;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pLetrPMUxW70aX6gSCrtBgQAGRigxfAIMPJ2cuSXx58=;
        b=jEqhntM5C2UDE4r3yEIdxu+EAMV0lsKAZH2Vikk8WAQYSMcf1RH3hOxV0+bNnkcqHx
         iVeSEEaa0g1RkL1UNSa/tU1RbTf9TEHiT/5TUynNgUkDEZRcH3Q5ROty8UjCU87aDe+G
         yARpxSDZNJ1YcuREslFDQ5CjznPhNk7G15ZbQfKVYUiu257XHbSNkCA36PPs5Q196C2V
         HlfiynFuMucSK/ftPjFYkW/edcihJLq70YKJNbiwGBQGDzZvEAHhBaG2L2FHdrxTHJ0c
         B3IBVSaxWF1jdwOsPKTtIhKIKqQKtvqHUNBGBHczJC0p9NY3jf3+H8kZD1gqjdaho5Ip
         f96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691263073; x=1691867873;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pLetrPMUxW70aX6gSCrtBgQAGRigxfAIMPJ2cuSXx58=;
        b=WpTrpmV2oq9kZ/uQIMmHs4A9laDO4nU+M5rhzMjfafGsKR/Ee1SKGrq/q0Y/Q7k6SV
         ELYQqELYbdkwyhs3//FW4TDJyoHKW0q/cpPaEXP4ZCzY1gB61DnJ6kFKGDF0r0TndJ2/
         CcfnQjON2ZR4A9Ly9tF8/S8oL1IqSd8TvdXCRPUmWuP1DuJVe6vMEjCiRFpGfVV2/dS4
         39DxLj9GZVxb4gnDVvKcMQKyafGLuF3AAvd65Ucjcmaifh0XRwgi/wFDx6iniYHUxU7o
         +0yEiC+uPKlN21BtXGsALvgRqUla3w/zvQQMVIwS5WHS0aUpT3niEZoVBlTL3aBRw6oW
         mVtQ==
X-Gm-Message-State: AOJu0Yw4irZ3E56Q4B0ISvLWuc+e8RFj6wvVqZE/KDe/XWkq7C1H0Vxd
        qTI3zAMLNftH6nfJ7tSX5PEmgaVb34KAxHpUBFg=
X-Google-Smtp-Source: AGHT+IFEPchYkikYDXWX/bM6V8/ADNATXh9hAwIplQ92lgzBUJx3huttmacwaGPL9AloL5E6pW0wTQ==
X-Received: by 2002:a05:6512:3a82:b0:4fb:8bab:48b6 with SMTP id q2-20020a0565123a8200b004fb8bab48b6mr3659917lfu.52.1691263073104;
        Sat, 05 Aug 2023 12:17:53 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.245])
        by smtp.gmail.com with ESMTPSA id n9-20020aa7db49000000b0051e2cde9e3esm2997260edt.75.2023.08.05.12.17.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Aug 2023 12:17:52 -0700 (PDT)
Message-ID: <249e806a-f094-9514-9c83-e74e7b1f00ba@linaro.org>
Date:   Sat, 5 Aug 2023 21:17:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v3 2/2] i2c: Add GPIO-based hotplug gate
Content-Language: en-US
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Svyatoslav Ryhel <clamor95@gmail.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230729160857.6332-1-clamor95@gmail.com>
 <20230729160857.6332-3-clamor95@gmail.com>
 <25858c22-ef92-2136-67ef-0d27364c1600@linaro.org>
 <ZMbcb0yuTz6l6BYh@qmqm.qmqm.pl>
 <b9183dfc-8e8a-9602-f31c-5de9e27acb88@linaro.org>
 <ZMd1qI7RjQhpI8zO@qmqm.qmqm.pl>
 <fdc513a3-c0e0-c57d-5c9a-8da6fa2f54e2@linaro.org>
 <ZMg6m+Dru6rxCRqU@qmqm.qmqm.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZMg6m+Dru6rxCRqU@qmqm.qmqm.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 01/08/2023 00:50, Michał Mirosław wrote:
> On Mon, Jul 31, 2023 at 02:59:41PM +0200, Krzysztof Kozlowski wrote:
>> On 31/07/2023 10:49, Michał Mirosław wrote:
>>> On Mon, Jul 31, 2023 at 08:58:14AM +0200, Krzysztof Kozlowski wrote:
>>>> On 30/07/2023 23:55, Michał Mirosław wrote:
>>>>> On Sun, Jul 30, 2023 at 10:30:56PM +0200, Krzysztof Kozlowski wrote:
>>>>>> On 29/07/2023 18:08, Svyatoslav Ryhel wrote:
>>>>>>> From: Michał Mirosław <mirq-linux@rere.qmqm.pl>
>>>>>>>
>>>>>>> Implement driver for hot-plugged I2C busses, where some devices on
>>>>>>> a bus are hot-pluggable and their presence is indicated by GPIO line.
>>>>> [...] 
>>>>>>> +	priv->irq = platform_get_irq(pdev, 0);
>>>>>>> +	if (priv->irq < 0)
>>>>>>> +		return dev_err_probe(&pdev->dev, priv->irq,
>>>>>>> +				     "failed to get IRQ %d\n", priv->irq);
>>>>>>> +
>>>>>>> +	ret = devm_request_threaded_irq(&pdev->dev, priv->irq, NULL,
>>>>>>> +					i2c_hotplug_interrupt,
>>>>>>> +					IRQF_ONESHOT | IRQF_SHARED,
>>>>>>
>>>>>> Shared IRQ with devm is a recipe for disaster. Are you sure this is a
>>>>>> shared one? You have a remove() function which also points that it is
>>>>>> not safe. You can:
>>>>>> 1. investigate to be sure it is 100% safe (please document why do you
>>>>>> think it is safe)
>>>>>
>>>>> Could you elaborate on what is unsafe in using devm with shared
>>>>> interrupts (as compared to non-shared or not devm-managed)?
>>>>>
>>>>> The remove function is indeed reversing the order of cleanup. The
>>>>> shutdown path can be fixed by removing `remove()` and adding
>>>>> `devm_add_action_or_reset(...deactivate)` before the IRQ is registered.
>>>> Shared interrupt might be triggered easily by other device between
>>>> remove() and irq release function (devm_free_irq() or whatever it is
>>>> called).
>>>
>>> This is no different tham a non-shared interrupt that can be triggered
>>> by the device being removed. Since devres will release the IRQ first,
>>> before freeing the driver data, the interrupt hander will see consistent
>>> driver-internal state. (The difference between remove() and devres
>>> release phase is that for the latter sysfs files are already removed.)
>>
>> True, therefore non-devm interrupts are recommended also in such case.
>> Maybe one of my solutions is actually not recommended.
>>
>> However if done right, driver with non-shared interrupts, is expected to
>> disable interrupts in remove(), thus there is no risk. We have big
>> discussions in the past about it, so feel free to dig through LKML to
>> read more about. Anyway shared and devm is a clear no go.
> 
> Can you share pointers to some of those discussions? Quick search
> about devm_request_irq() and friends found only a thread from 2013

Just look at CONFIG_DEBUG_SHIRQ. Some things lore points:
https://lore.kernel.org/all/1592130544-19759-2-git-send-email-krzk@kernel.org/
https://lore.kernel.org/all/20200616103956.GL4447@sirena.org.uk/

I think pretty clear:
https://lore.kernel.org/all/87mu52ca4b.fsf@nanos.tec.linutronix.de/
https://lore.kernel.org/all/CA+h21hrxQ1fRahyQGFS42Xuop_Q2petE=No1dft4nVb-ijUu2g@mail.gmail.com/

Also:
https://lore.kernel.org/all/651c9a33-71e6-c042-58e2-6ad501e984cd@pengutronix.de/
https://lore.kernel.org/all/36AC4067-78C6-4986-8B97-591F93E266D8@gmail.com/

> about conversions of RTC drivers to use devres. [1] IIRC the issue was
> then that the drivers requested IRQs before fully initializing the state
> (as many still do). Back to the original question: what is the risk
> in using devres with shared interrupts? (Let's assume the probe() is already
> fixed and remove() removed.)



> 
> BTW, We have devres doc [2] in the kernel tree that, among other things,
> lists IRQs as a managed resource and mentions no warnings nor restictions
> for driver authors. I'd expect that if devm_request_threaded_irq() for
> shared iterrupts was indeed deprecated, it should be documented in a way
> easy to refer to.
> 
> [1] https://groups.google.com/g/linux.kernel/c/yi2ueo-sNJs
> [2] Documentation/udriver-api/driver-model/devres.rst

That's not really an argument. For some reason we have
CONFIG_DEBUG_SHIRQ, right? If you think documentation is missing,
everyone is encouraged to fix it, but lack of documentation is not a
proof of some correct code pattern.

Best regards,
Krzysztof

