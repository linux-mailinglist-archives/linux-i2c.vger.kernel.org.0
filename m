Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 471D2461CD8
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 18:38:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349645AbhK2RlT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 12:41:19 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:52214
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1349337AbhK2RjT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 12:39:19 -0500
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2FB3F3F1B9
        for <linux-i2c@vger.kernel.org>; Mon, 29 Nov 2021 17:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638207354;
        bh=iK3riauy7r4LiWngeJOokJxhZZPLu5etYNKqwE1epw0=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=LS2LaSBCKz4bkvVqvJ8ua7GA5+5R6U4AFL6HSLOeIRXkn7OM5VZXwB+hg0HpFPqQT
         Gw3XUSBBJ83GLJqlwtXFZzKGA6+eFRLuilhAQdoYKacUNzfa0lHl1joOvMeiB/J1ce
         PbCLo6nhr0TwjNcyLwydZovdN8vrcAFPBVXBhukajvFwH21N8LK9hyVmSWiYnAliNq
         tRE1JeRx0gb2o+6lQlI4VKlVCNYjoGZBWb4yEhPTEdzBxQbrGK2Hzn46ogluwDRDS6
         qFYTraome7P99+Fw5NVX9U9nfv1aRGOBR88vNyxC7WFwfmXdPWM28TVn2E2DTGKlxH
         f/9FgDSsluHbA==
Received: by mail-lf1-f71.google.com with SMTP id g38-20020a0565123ba600b004036147023bso6388835lfv.10
        for <linux-i2c@vger.kernel.org>; Mon, 29 Nov 2021 09:35:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iK3riauy7r4LiWngeJOokJxhZZPLu5etYNKqwE1epw0=;
        b=Sow7r+Q4zB9vncwxHDZF3bmgQb7olfwww0za8jIpYn3tlVAozjoOiCXdJHusgqBH6i
         rGALVYulSndhd95QNyDPDVOy2y9ssaDVddFTzGo1iq9YiVLVsCYVvWibJYZQMF06FM0L
         /0Wcou56jJ7uqpwiOVfOyvFavDklJmB1HSXwYl70pdqWatYFNz2pc9x+SL6d+oVCB83Y
         PA+X0hWClEgVcVnQ90xrGBqKfTJqnNOXl++yofGd5irdZgTV2btGcMH9AwgFwERzEVYp
         8dGaBlPDtrcpkGgSUHIJIPUkSlP7zMR+cn+orBSwuU9gVv2nLdNIBnOBBL6M3W1Hqq8w
         ZfzA==
X-Gm-Message-State: AOAM530Qi+jSBO/sgEPOxv1PsFy6UgbO8IoY4qNkIjy+CvrFFEhjVCfk
        WKCFfPuxK+WGJUvkSfcV0X0p68D/gwCldgWrtiGQ3fsS/W8TpPXSY4QFm6k596DjAFiv7ztrdSb
        47IzMz57bVlMwhQXlDIqMR14kuiG2LBN85IaUdA==
X-Received: by 2002:a05:651c:545:: with SMTP id q5mr48531717ljp.202.1638207353499;
        Mon, 29 Nov 2021 09:35:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCdgVQtvrXN9pR82hH5Jlf+5Oj6LFpV+QeH8GC4DH4X/4Agtjois4piKytzHJd5SDX416Alg==
X-Received: by 2002:a05:651c:545:: with SMTP id q5mr48531704ljp.202.1638207353283;
        Mon, 29 Nov 2021 09:35:53 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id w14sm1339120ljj.7.2021.11.29.09.35.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Nov 2021 09:35:52 -0800 (PST)
Message-ID: <5687bb27-973e-b774-b876-46c8dffc1176@canonical.com>
Date:   Mon, 29 Nov 2021 18:35:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 0/8] soc: samsung: Add USIv2 driver
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        David Virag <virag.david003@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20211127223253.19098-1-semen.protsenko@linaro.org>
 <b9807fcc69713fb016838958a3df1c4e54309fc4.camel@gmail.com>
 <CAPLW+4kkVNSvEQjVnSWA2BjkWJXzV-4n1i+10a9FCNL0sD0n3A@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAPLW+4kkVNSvEQjVnSWA2BjkWJXzV-4n1i+10a9FCNL0sD0n3A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 29/11/2021 14:56, Sam Protsenko wrote:
> On Sun, 28 Nov 2021 at 05:15, David Virag <virag.david003@gmail.com> wrote:
>>
>> Also this way is pretty USIv2 centric. Adding USIv1 support to this
>> driver is difficult this way because of the the lack of USI_CON and
>> USI_OPTION registers as a whole (so having nowhere to actually set the
>> reg of the USI node to, as the only thing USIv1 has is the SW_CONF
>> register). In my opinion being able to use the same driver and same
>> device tree layout for USIv1 and USIv2 is a definite plus
>>
> 
> Well, it's USIv2 driver after all. I never expected it can be extended
> for USIv1 support. If you think it can be reused for USIv1, it's fine
> by me. But we need to consider next things:
>   - rename the driver to just "usi.c" (and also its configuration symbol)
>   - provide different compatible for USIv1 (and maybe corresponding driver data)
>   - rework bindings (header and doc); make sure existing bindings are
> intact (we shouldn't change already introduced interfaces)
>   - in case of USIv1 compatible; don't try to tinker with USIv2 registers
>   - samsung,clkreq-on won't be available in case of USIv1 compatible

I expect this driver to be in future extended for USIv1 and I do not see
any problems in doing that for current Sam's approach. Most of our
drivers support several devices, sometimes with differences, and we
already have patterns solving it, e.g. ops structure or quirks bitmap.
Driver for new USIv1 compatible would skip setting USI_CON (or any other
unrelated register). Modification of SW_CONF could be shared or could be
also split, depending on complexity.

> 
> Because I don't have USIv1 SoC TRM (and neither do I possess some
> USIv1 board which I can use for test), I don't think it's my place to
> add USIv1 support. But I think it's possible to do so, using my input
> above.
> 
> I can see how it might be frustrating having to do some extra work
> (comparing to just using the code existing in downstream). But I guess
> that's the difference: vendor is mostly concerned about competitive
> advantage and getting to market fast, while upstream is more concerned
> about quality, considering all use cases, and having proper design.
> Anyway, we can work together to make it right, and to have both
> IP-cores support. In the worst case, if those are too different, we
> can have two separate drivers for those.
> 
>> The only real drawback of that way is having to add code for USIv2
>> inside the UART, HSI2C, and SPI drivers but in my opinion the benefits
>> overweigh the drawbacks greatly. We could even make the uart/spi/hsi2c
>> drivers call a helper function in the USI driver to set their USI_CON
>> and USI_OPTION registers up so that code would be shared and not
>> duplicated. Wether this patch gets applied like this is not my choice
>> though, I'll let the people responsible decide
>> :-)
>>
> 
> I'd argue that there are a lot of real drawbacks of using downstream
> driver as is. That's why I completely re-designed and re-implemented
> it. Downstream driver can't be built and function as a module, it
> doesn't respect System Register sharing between consumers, it leads to
> USI reset code duplication scattered across protocol drivers (that
> arguably shouldn't even be aware of that), it doesn't reflect HW
> structure clearly, it's not holding clocks needed for registers access
> (btw, sysreg clock can be provided in syscon node, exactly for that
> reason). As Krzysztof said, it also can't handle correct probe order
> and deferred probes. Downstream driver might work fine for some
> particular use-cases the vendor has, but in upstream it's better to
> cover more cases we can expect, as upstream kernel is used on more
> platforms, with more user space variants, etc.

Implementing USI in each of I2C/SPI/UART drivers is a big minus. Current
approach nicely encapsulates USI in dedicated driver without polluting
the other drivers with unrelated bus/protocol stuff.

Best regards,
Krzysztof
