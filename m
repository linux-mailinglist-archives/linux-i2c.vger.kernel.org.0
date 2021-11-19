Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06DC3456BE6
	for <lists+linux-i2c@lfdr.de>; Fri, 19 Nov 2021 09:54:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234469AbhKSI5j (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 19 Nov 2021 03:57:39 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:54648
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230027AbhKSI5i (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 19 Nov 2021 03:57:38 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AFC4940016
        for <linux-i2c@vger.kernel.org>; Fri, 19 Nov 2021 08:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637312076;
        bh=yVGRl+Nb0p3e6hVqNaBBVXHJCaTivPKnMw6vIRM7mQc=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=dLbHYplwXxObCZ0eoq0qw/qDz+JgsZ2Q95AVMS5DBtYwiIsPaKEq2gx9jd5QcjSLP
         oBPIWTCSylOctTSPx8qz2RpJG8X+xZMsrRSbWjq0WWQ33mnTjbF2oIgFFRfzlDsb9Z
         VFo4ot80CSOJE2CfFURogXHyk+r7HBvqiT/WYU/kreCIT2pilplCY4K73Tio8Gp06v
         VtdQyGbR2m97QduzX5QsK+ZQLQpeWLu+q2rWXX6KtnWyiUpcoqH8s197/8+7C1XvlH
         J4Djccbn4bpH77lElQjnfQnwu1RG3mSHkUhK76J1xm1pGKmCVKLIPdLTgVTNz/DGV4
         ZXXSIY8fOPr/A==
Received: by mail-lf1-f69.google.com with SMTP id h40-20020a0565123ca800b00402514d959fso6129586lfv.7
        for <linux-i2c@vger.kernel.org>; Fri, 19 Nov 2021 00:54:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=yVGRl+Nb0p3e6hVqNaBBVXHJCaTivPKnMw6vIRM7mQc=;
        b=IkpDenAWCfwUqBlRv22vrygMKXBoNrdl8PIHGXruIu2X++F3KletmduBL9u+lL6eyT
         lCEncQIckiNoyt+Czq/5KpbMKAgvUs5Lrs2ApLC2R9yOBLUM3lPodxE3hGNYTtKg/yZt
         j5PsdtrX4JbDIkxxhHqFLWpR3cRzQDd8nosHwUatbX05ZpsApkBLvQo3MwmGRGJ/lata
         s7M4AoCem1VqHFqpJYcGM3CdrOEBb4AyKzLNGS9YBYRN8CshcHVh+KFbsPKIbQKyduwD
         qhcojRfSouxn8HAnYvu8KlLr/gQVNl1NJ4P5d3PczqFGB6X/nXE+xxb7fal4ZtlzEi6H
         bxPw==
X-Gm-Message-State: AOAM533ge+IYK9fGti/BU3440OQ4Q4u9KAgiRASIO/9oLrETmvRNXSI1
        cvzb/61V8/NWkSUAZGRSFII4oS4jbFz/oVZ0Py4sw15EADX2AQEDZnmKbcEuV4ImoItII7DKtRr
        DOkAvYyXYSokUlqNlUyzCYETzLT2hAugmGaxeDw==
X-Received: by 2002:a05:6512:3501:: with SMTP id h1mr30314365lfs.513.1637312076100;
        Fri, 19 Nov 2021 00:54:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwcOvUw9aIEuLVwNctO+vGGjyodK0pCY5hjBM2Wki3lDR+ToIprH/h++eG34SLwM2fbSlbnoA==
X-Received: by 2002:a05:6512:3501:: with SMTP id h1mr30314339lfs.513.1637312075914;
        Fri, 19 Nov 2021 00:54:35 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id br35sm223668lfb.39.2021.11.19.00.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Nov 2021 00:54:35 -0800 (PST)
Message-ID: <773110c9-fc74-6cab-68c0-1c771a3be104@canonical.com>
Date:   Fri, 19 Nov 2021 09:54:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v3 2/2] i2c: exynos5: add support for ExynosAutov9 SoC
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Chanho Park <chanho61.park@samsung.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <CGME20211112010603epcas2p339d1a6ef3df7cdbe61c87c8afa541fd0@epcas2p3.samsung.com>
 <20211112010137.149174-1-jaewon02.kim@samsung.com>
 <20211112010137.149174-3-jaewon02.kim@samsung.com>
 <CAPLW+4==X+irRBKHiDfgJeAb0oDKkzbcWERFs7Y3=PSOg0+qAw@mail.gmail.com>
 <001401d7da86$f7ebd660$e7c38320$@samsung.com>
 <da9bd8cc-9415-6db7-024e-8d50b5f666f7@canonical.com>
 <CAPLW+4kS-pzROC5oyAjW1aJp5cb1e3XK+40HsKwgPdCziSp1ZQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAPLW+4kS-pzROC5oyAjW1aJp5cb1e3XK+40HsKwgPdCziSp1ZQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 18/11/2021 20:59, Sam Protsenko wrote:
> On Tue, 16 Nov 2021 at 11:32, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> On 16/11/2021 02:12, Chanho Park wrote:
>>>> With this patch the Exynos850 HSI2C becomes functional. The only nit-pick
>>>> from my side (just a food for thought): do we want to configure USI
>>>> related config inside of particular drivers (SPI, I2C, UART)? Or it would
>>>> be better design to implement some platform driver for that, so we can
>>>> choose USI configuration (SPI/I2C/UART) in device tree? I think this
>>>> series is good to be merged as is, but we should probably consider all
>>>> upsides and downsides of each option, for the future work.
>>>
>>> I'm also considering how to support this USI configuration gracefully.
>>> Current version of USI is v2 which means there is a v1 version as well. It might be a non-upstream SoC so we don't need to consider it so far.
>>> But, there is a possibility that the USI hw version can be bumped for future SoCs.
>>>
>>> As you probably know, earlier version of the product kernel has a USI SoC driver[1] and it was designed to be configured the USI settings by device tree.
>>>
>>> Option1) Make a USI driver under soc/samsung/ like [1].
>>> Option2) Use more generic driver such as "reset driver"? This might be required to extend the reset core driver.
>>> Option3) Each USI driver(uart/i2c/spi) has its own USI configurations respectively and expose some configurations which can be variable as device tree.
>>>
>>> [1]: https://github.com/ianmacd/d2s/blob/master/drivers/soc/samsung/usi_v2.c
>>
>> I don't have user manuals, so all my knowledge here is based on
>> Exynos9825 vendor source code, therefore it is quite limited. In
>> devicetree the USI devices have their own nodes - but does it mean it's
>> separate SFR range dedicated to USI? Looks like that, especially that
>> address space is just for one register (4 bytes).
>>
>> In such case having separate dedicated driver makes sense and you would
>> only have to care about driver ordering (e.g. via device links or phandles).
>>
>> Option 2 looks interesting - reusing reset framework to set proper USI
>> mode, however this looks more like a hack. As you said Chanho, if there
>> is a USI version 3, this reset framework might not be sufficient.
>>
>> In option 3 each driver (UART/I2C/SPI) would need to receive second IO
>> range and toggle some registers, which could be done via shared
>> function. If USI v3 is coming, all such drivers could get more complicated.
>>
>> I think option 1 is the cleanest and extendable in future. It's easy to
>> add usi-v3 or whatever without modifying the UART/I2C/SPI drivers. It
>> also nicely encapsulates USI-related stuff in separate driver. Probe
>> ordering should not be a problem now.
>>
>> But as I said, I don't have even the big picture here, so I rely on your
>> opinions more.
>>
> 
> Hi Krzysztof,
> 
> Can you please let me know if you're going to apply this series as is,
> or if you want me to submit USIv2 driver first, and then rework this
> patch on top of it? I'm working on some HSI2C related patches right
> now, and thus it'd nice to know about your decision on this series
> beforehand, as some of my patches (like bindings doc patches) might
> depend on it. Basically I'd like to base my patches on the proper
> baseline, so we don't have to rebase those later.

This set won't go via my tree anyway, but I am against it. David pointed
out that his USIv1 is a little bit different and embedding in each of
I2C/UART/SPI drivers the logic of controlling USIv1 and USIv2 looks too
big. The solution with a dedicated driver looks to me more flexible and
encapsulated/cleaner.

Therefore after the discussions I am against this solution, so a
soft-NAK from my side.


Best regards,
Krzysztof
