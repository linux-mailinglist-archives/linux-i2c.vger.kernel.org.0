Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9751477C707
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Aug 2023 07:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234608AbjHOFXo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Aug 2023 01:23:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234734AbjHOFVc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 15 Aug 2023 01:21:32 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C98319B5
        for <linux-i2c@vger.kernel.org>; Mon, 14 Aug 2023 22:20:40 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-317716a4622so4458971f8f.1
        for <linux-i2c@vger.kernel.org>; Mon, 14 Aug 2023 22:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692076838; x=1692681638;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E1iK6gDGnLT6YH6YDnZtvo75txDfUuM4Picw/2uLIh0=;
        b=JVbj6cxuWCQ4fdjUTVThiW9Yn4j9If3QsCX5dlVqGZF5tuQ8Bzg071hgBP4IHNPZkI
         FE/l9sNnzLLIzVG9bo8ex1Nxad+f63t8bXDH4saMDy6SjqPqRLtEJRHCaRJwJ5hHz68o
         I1hzJmZJeBvfXRsBqqF4ljx/euy8s1Zu11yQ4g92+yzWb101bDbmjJgrHcb1tUPTvU8J
         aA6kM3RS/Yk0aJwTtXZCcjzzf6NFVSb6Mjyg3WJRe4krR7pdKlxmutOoCZ6EChZ7z2vr
         nyGc1whQFZVGmdYziMgf59L+JdDaKZeOeozjWz0AomrEbiFeViWSYgcVuO/tD+Y1lCaE
         2Lsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692076838; x=1692681638;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E1iK6gDGnLT6YH6YDnZtvo75txDfUuM4Picw/2uLIh0=;
        b=MqBMVRntLhGkSwBR0PsMCylmV8xXrFhx9biktJZ/FqlBGdda01P1kjCUcuaey5/ZdR
         FODz7PQgXhHKQjRy6zHtH+Q34W5VNeoLKWNWHnQEEGcJJkJPUNMhhAb9dtojOIDMrLuB
         xfRFsS+EeZAr+EdrpXLudvdBDDLKKW0cbLvJXpT3GTPzg+wIIwr3MdGrXDoRgaXa6sKt
         Bls8B/JHaISTrw5jjfxPihXwleX91jY5biQk09Ke40Z1dBehmXbeab6ujf1kpzN+ZEnk
         Al5D8Latjiu3CXkhkeXjVFbnlQxYdBbXDJ1rdrr/K9CfyqLMdkHIEevXWw+OKZ4GWSbt
         lt2Q==
X-Gm-Message-State: AOJu0YximSNHszVejzgA/JJ4iLoRwPtFkcSscyh4fWh/aPkgrWj9pJLH
        ukSWiwul2wmZNjnze60dMe6LTQ==
X-Google-Smtp-Source: AGHT+IFyjkPBJoV+XazQhAjmKyn6CK4hTOt2a3tGZBE3jpKVIpVKhpfJ/wcMf8ugaCQ3TimspEYXXg==
X-Received: by 2002:a5d:554e:0:b0:314:10d8:b491 with SMTP id g14-20020a5d554e000000b0031410d8b491mr6785789wrw.67.1692076838327;
        Mon, 14 Aug 2023 22:20:38 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id l11-20020a05600012cb00b003177f57e79esm4297502wrx.88.2023.08.14.22.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 22:20:37 -0700 (PDT)
Message-ID: <c577a92a-d1e4-df7e-250c-33d47b4d5bcb@linaro.org>
Date:   Tue, 15 Aug 2023 07:20:35 +0200
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
 <249e806a-f094-9514-9c83-e74e7b1f00ba@linaro.org>
 <ZNVcEfNjo0ZZlhIp@qmqm.qmqm.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZNVcEfNjo0ZZlhIp@qmqm.qmqm.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/08/2023 23:52, Michał Mirosław wrote:
>>>>>>>> Shared IRQ with devm is a recipe for disaster. Are you sure this is a
>>>>>>>> shared one? You have a remove() function which also points that it is
>>>>>>>> not safe. You can:
>>>>>>>> 1. investigate to be sure it is 100% safe (please document why do you
>>>>>>>> think it is safe)
> [...]
>>>> True, therefore non-devm interrupts are recommended also in such case.
>>>> Maybe one of my solutions is actually not recommended.
>>>>
>>>> However if done right, driver with non-shared interrupts, is expected to
>>>> disable interrupts in remove(), thus there is no risk. We have big
>>>> discussions in the past about it, so feel free to dig through LKML to
>>>> read more about. Anyway shared and devm is a clear no go.
>>>
>>> Can you share pointers to some of those discussions? Quick search
>>> about devm_request_irq() and friends found only a thread from 2013
>>
>> Just look at CONFIG_DEBUG_SHIRQ. Some things lore points:
>> https://lore.kernel.org/all/1592130544-19759-2-git-send-email-krzk@kernel.org/
>> https://lore.kernel.org/all/20200616103956.GL4447@sirena.org.uk/
>>
>> I think pretty clear:
>> https://lore.kernel.org/all/87mu52ca4b.fsf@nanos.tec.linutronix.de/
>> https://lore.kernel.org/all/CA+h21hrxQ1fRahyQGFS42Xuop_Q2petE=No1dft4nVb-ijUu2g@mail.gmail.com/
>>
>> Also:
>> https://lore.kernel.org/all/651c9a33-71e6-c042-58e2-6ad501e984cd@pengutronix.de/
>> https://lore.kernel.org/all/36AC4067-78C6-4986-8B97-591F93E266D8@gmail.com/
> [...]
> 
> Thanks! It all looks like a proof by example [1]: a broken driver [2]
> was converted to devres [3] and allowed a shared interrupt [4] and now is
> used to back an argument that devres and/or shared IRQs are bad. I have
> a hard time accepting this line of reasoning.
> 
> So: sure, if you disable device's clock, you should first disable the
> interrupt handler one way or another, and if you request a shared interrupt
> then you have to write the handler expecting spurious invocations anytime
> between entry to register_irq() and return from free_irq() (BTW, DEBUG_SHIRQ
> is here to help test exactly this). And, when used correctly, devres can
> release you from having to write remove() and error paths (but I guess it
> might be a challenge to find a single driver that is a complete, good and
> complex-enough example).
> 
> Coming back from the digression: I gathered following items from the
> review of the i2c-hotplug-gpio driver:
> 
>   1. TODO: register i2c_hotplug_deactivate(priv) using
>      devm_add_action_or_reset() before registering the IRQ handler
>      and remove remove();
> 
>   2. shared IRQ: it is expected to be an edge-triggered, rarely
>      signalled interrupt and the handler will work fine if called
>      spuriously; it is not required to be shared for my Transformer,
>      but I can't say much about other hardware. Would a comment help?

We have way too lengthy discussion and now we are circling back. Can you
refer to the first email I wrote?

"You can:
1. investigate to be sure it is 100% safe (please document why do you
think it is safe)
2. drop devm
3. drop shared flag."


Best regards,
Krzysztof

