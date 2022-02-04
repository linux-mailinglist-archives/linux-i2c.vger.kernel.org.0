Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 133534A959D
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Feb 2022 09:52:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357236AbiBDIw2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Feb 2022 03:52:28 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:36930
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1357218AbiBDIw0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 4 Feb 2022 03:52:26 -0500
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 83E33405B3
        for <linux-i2c@vger.kernel.org>; Fri,  4 Feb 2022 08:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1643964744;
        bh=iqZrLHxxMKYXcwDk+JH/xBRKoG0uPSeGw2pYz3/v6kY=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=qnPp9d4xFaxTg3mjbDdwampcBXqqfo8DgkBf3yT/Edg/I4LN6PG/4BlRLSTKOk+yL
         iMlPX/FYl0tcjL790Q2ZD8tAn8JF4m4GJo2fMB4GVQg4DDH0dFtu0Le3/tE3FBel/5
         AKBrh1u8NG9PLNOvZOWPZHfsb8YJtRl7G4w3fDgf+gFCAntwq26Ef43atxjovTutxJ
         wEc7NH1a5pVVQ59uIG1n7f840Ywhyr6HeOuQ68NyCo+ziLdt8raXl9UVhQmAC+jrSF
         TXTsfNhWA28SR38YNHj26zj03cekT0C9/iwbiBx4c+qcvQXtWF85t/v+dt5swWFz5G
         CY8qwSYtILxkw==
Received: by mail-wm1-f71.google.com with SMTP id l16-20020a7bcf10000000b0034ffdd81e7aso2104725wmg.4
        for <linux-i2c@vger.kernel.org>; Fri, 04 Feb 2022 00:52:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=iqZrLHxxMKYXcwDk+JH/xBRKoG0uPSeGw2pYz3/v6kY=;
        b=pQ0F6fstSnD8gV5X3OCxf8RPo95skmlkRnsjcjTC2blnUK2OsEB7gN71KrCfH9MXKl
         8YEQgHRAqrYhmjgKs8viIL2vJOStw0HgqC4qoVI09NQuRs3J8CckRC/3tCuD2FxsyVtW
         c6+UgjO2HOTnvKZTuI5BdakLvFEJqKk4J45Cw9EJ3nC6uLgzsqUHK5a+c3JWCKw6iHII
         KRU+nG1zSgzEBzPfj+RIvFDyqKfGxW1msCfjQGDhStvPafily9UMHo69I6yy73unPpaF
         qUo8RXB6duqJew7RzloL7ZVALMvg3nhoZ9wrnG8rE0UKZq5pOwiPly6xKhQT8eVzvfvo
         FHkA==
X-Gm-Message-State: AOAM532R3jhjvThMydmzvsspHwREtwuaPc7tkloIeULHLpvGd+yRbs1l
        sfnpCoMFIsg+jOM+Mgiy7ULeaffXIvLoTNA9H8vuNBeofwTIkGQ6zqxEnkDYw/Pv/rRmJGzFHn1
        9idGKFCVRmoFCBR7k7ZnHJuxUAFMLozKbOMEPvA==
X-Received: by 2002:a05:6402:3492:: with SMTP id v18mr1976652edc.345.1643964732839;
        Fri, 04 Feb 2022 00:52:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwVcZDvspQCzKUyW5YG8zjDVQmYqY/DEAG3sfjKSfnQIzLHqmc3NlVf9LlkkFskfuUgLPJavA==
X-Received: by 2002:a05:6402:3492:: with SMTP id v18mr1976597edc.345.1643964732578;
        Fri, 04 Feb 2022 00:52:12 -0800 (PST)
Received: from [192.168.0.81] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id z8sm418238ejc.197.2022.02.04.00.52.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Feb 2022 00:52:11 -0800 (PST)
Message-ID: <ed615fdb-5c30-697e-f197-a3a93c5336b9@canonical.com>
Date:   Fri, 4 Feb 2022 09:52:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] HPE BMC GXP SUPPORT
Content-Language: en-US
To:     "Verdun, Jean-Marie" <verdun@hpe.com>,
        Rob Herring <robh+dt@kernel.org>,
        "Hawkins, Nick" <nick.hawkins@hpe.com>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Corey Minyard <minyard@acm.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        SoC Team <soc@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Stanislav Jakubek <stano.jakubek@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Hao Fang <fanghao11@huawei.com>,
        "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
        Mark Rutland <mark.rutland@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Wang Kefeng <wangkefeng.wang@huawei.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "openipmi-developer@lists.sourceforge.net" 
        <openipmi-developer@lists.sourceforge.net>,
        MTD Maling List <linux-mtd@lists.infradead.org>,
        netdev <netdev@vger.kernel.org>,
        Linux PWM List <linux-pwm@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        "open list:THERMAL" <linux-pm@vger.kernel.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        LINUX-WATCHDOG <linux-watchdog@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
References: <nick.hawkins@hpe.com>
 <20220202165315.18282-1-nick.hawkins@hpe.com>
 <CAL_Jsq+K2t5WYE056so1iZgZr7CBKvDEjAwnJVTyUFQcK-VFSA@mail.gmail.com>
 <e79133f2-f872-3ed6-4038-526e94e84909@canonical.com>
 <1FEAAC19-1DD7-40D7-98FD-30C2659E7C0F@hpe.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <1FEAAC19-1DD7-40D7-98FD-30C2659E7C0F@hpe.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 03/02/2022 18:07, Verdun, Jean-Marie wrote:
> 
>    > Maybe it does not look like, but this is actually a v2. Nick was asked
>    > to change the naming for the nodes already in v1. Unfortunately it did
>    > not happen, so we have vuart, spifi, vic and more.
> 
>    > It is a waste of reviewers' time to ask them to perform the same review
>    > twice or to ignore their comments.
> 
>     Hi Krysztof,
> 
>     Accept our apologies if you think you lose your time, it is clearly not our
>     intent. 
> 
>     This is the first time that we (I mean the team) introduce a new arch into
>     the linux kernel and I must admit that we had hard time to understand
>     from which angle we needed to start.
> 
>     I will probably write a Documentation afterward, as it is easy to find doc
>     on how to introduce a patch or a driver, but not when you want to 
>     introduce a new chip. 
> 
>     We are trying to do our best, and clearly want to follow all of your inputs.
>     Mistakes happen and they are clearly not intentional and not driven in 
>     a way to make you lose your time.
> 
>     Helping others, and teaching something new is definitely a way to 
>     optimize your time and this is what you are currently doing with us.
> 
>     We appreciate it and hope you will too.

I understand, I also maybe over-reacted on this. Just please go through
the comments you got for first submission and either apply them or
respond why you disagree.

The next submissions (patchset split into several commits) should be a
v3, preferably with cover letter (git format-patch --cover-letter -v3
...) where you can document also changes you did to the patchset.

It looks for example like this:
https://lore.kernel.org/linux-samsung-soc/31da451b-a36c-74fb-5667-d4193284c6cd@canonical.com/T/#mf98d2ac27a8481dc69dd110f9861c8318cade252

or like this (where changelogs are in each patch, although ordering is
not correct because dt-bindings should be the first in the series):
https://lore.kernel.org/all/20220103233948.198119-1-Mr.Bossman075@gmail.com/


Best regards,
Krzysztof
