Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 788F64563CF
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Nov 2021 21:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230501AbhKRUDH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Nov 2021 15:03:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbhKRUDG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Nov 2021 15:03:06 -0500
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2266EC061574
        for <linux-i2c@vger.kernel.org>; Thu, 18 Nov 2021 12:00:06 -0800 (PST)
Received: by mail-ua1-x933.google.com with SMTP id o1so16379104uap.4
        for <linux-i2c@vger.kernel.org>; Thu, 18 Nov 2021 12:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wTLcbVWrF0jAguOtxvSE2fxFOAqrINCwUvyhsM88wiQ=;
        b=xJgHu5nGTzGq1z1uegZo1b2kDPztDnyOE5CWKBHnexjO9MeJcUxWEDUJJx7CIac2Pe
         x+KzoJXjbNLxH3hcGhU2zf1Bl0YtV/8jA6E2t9CAlwrTzzY8yFwecOv4S6ZXR+Fal7YA
         lQAh3fsQYn9HnhtV85TItabze0KI+BsEzle+LYN8E+99kDn4RkGhvAleItu0rCPTfNxf
         bH8bWKG+/lNG6k1sy6KQF5hozB6lwHn8NefylmcRTFIXxlbyR3QeoKZHxVCr5aFo4glE
         1DOnDPC7M1kQyRq6SIwQCstwEyoHhESaBXI2Gecy7UDXsRisZGGDfgWDPVbaQMU4X6US
         HY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wTLcbVWrF0jAguOtxvSE2fxFOAqrINCwUvyhsM88wiQ=;
        b=xVWNsq9R/gWwq3u38cGJSqEL25adAgtQ6mh4gfc+ZTboBUv9iFTlEz4m7S1/ntZm3k
         EsrrMrsLVE+YeuItTargPuPxwJH1WJhJxvvvURBp4LWihckDtlB5AvgIPFh/s/c4XBlP
         KnZcI/OUhjWnJrDvtMEatEpAe0glKfzr34nwtzKQPaVGwFlfH8jkTcDpyBhwqfN4WOMV
         y//HFOqknJfXqlgAFeT0baMnPEe+ew4XcREam+ejw3fuy6SlYyuttUyvH78FQwqyugxF
         r09aSh5pgNDRVX3E0UAf6Yp+1E+W96kPlNa2HtwWj0lG1AZyHoUpBSLNyjVLUuWjch4z
         qcmg==
X-Gm-Message-State: AOAM532a54HWHPrNFiUDz4IBi5iswq0MA9cPgl40MJldhgcMFU0oZeYd
        CxdSNPHNCIg8jEe7mC8nsZbPmOEiCub28RoSJzd8FA==
X-Google-Smtp-Source: ABdhPJwbE3pupBTAOUQbpkhtvy7vjY7xqzTjlwsvOO4K+rUdArjo9f0XPpSAvOoBNURq4nPOFYSglotNhcYITP9UmEo=
X-Received: by 2002:a05:6102:ac3:: with SMTP id m3mr69022069vsh.1.1637265605012;
 Thu, 18 Nov 2021 12:00:05 -0800 (PST)
MIME-Version: 1.0
References: <CGME20211112010603epcas2p339d1a6ef3df7cdbe61c87c8afa541fd0@epcas2p3.samsung.com>
 <20211112010137.149174-1-jaewon02.kim@samsung.com> <20211112010137.149174-3-jaewon02.kim@samsung.com>
 <CAPLW+4==X+irRBKHiDfgJeAb0oDKkzbcWERFs7Y3=PSOg0+qAw@mail.gmail.com>
 <001401d7da86$f7ebd660$e7c38320$@samsung.com> <da9bd8cc-9415-6db7-024e-8d50b5f666f7@canonical.com>
In-Reply-To: <da9bd8cc-9415-6db7-024e-8d50b5f666f7@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 18 Nov 2021 21:59:53 +0200
Message-ID: <CAPLW+4kS-pzROC5oyAjW1aJp5cb1e3XK+40HsKwgPdCziSp1ZQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] i2c: exynos5: add support for ExynosAutov9 SoC
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Chanho Park <chanho61.park@samsung.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 16 Nov 2021 at 11:32, Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 16/11/2021 02:12, Chanho Park wrote:
> >> With this patch the Exynos850 HSI2C becomes functional. The only nit-pick
> >> from my side (just a food for thought): do we want to configure USI
> >> related config inside of particular drivers (SPI, I2C, UART)? Or it would
> >> be better design to implement some platform driver for that, so we can
> >> choose USI configuration (SPI/I2C/UART) in device tree? I think this
> >> series is good to be merged as is, but we should probably consider all
> >> upsides and downsides of each option, for the future work.
> >
> > I'm also considering how to support this USI configuration gracefully.
> > Current version of USI is v2 which means there is a v1 version as well. It might be a non-upstream SoC so we don't need to consider it so far.
> > But, there is a possibility that the USI hw version can be bumped for future SoCs.
> >
> > As you probably know, earlier version of the product kernel has a USI SoC driver[1] and it was designed to be configured the USI settings by device tree.
> >
> > Option1) Make a USI driver under soc/samsung/ like [1].
> > Option2) Use more generic driver such as "reset driver"? This might be required to extend the reset core driver.
> > Option3) Each USI driver(uart/i2c/spi) has its own USI configurations respectively and expose some configurations which can be variable as device tree.
> >
> > [1]: https://github.com/ianmacd/d2s/blob/master/drivers/soc/samsung/usi_v2.c
>
> I don't have user manuals, so all my knowledge here is based on
> Exynos9825 vendor source code, therefore it is quite limited. In
> devicetree the USI devices have their own nodes - but does it mean it's
> separate SFR range dedicated to USI? Looks like that, especially that
> address space is just for one register (4 bytes).
>
> In such case having separate dedicated driver makes sense and you would
> only have to care about driver ordering (e.g. via device links or phandles).
>
> Option 2 looks interesting - reusing reset framework to set proper USI
> mode, however this looks more like a hack. As you said Chanho, if there
> is a USI version 3, this reset framework might not be sufficient.
>
> In option 3 each driver (UART/I2C/SPI) would need to receive second IO
> range and toggle some registers, which could be done via shared
> function. If USI v3 is coming, all such drivers could get more complicated.
>
> I think option 1 is the cleanest and extendable in future. It's easy to
> add usi-v3 or whatever without modifying the UART/I2C/SPI drivers. It
> also nicely encapsulates USI-related stuff in separate driver. Probe
> ordering should not be a problem now.
>
> But as I said, I don't have even the big picture here, so I rely on your
> opinions more.
>

Hi Krzysztof,

Can you please let me know if you're going to apply this series as is,
or if you want me to submit USIv2 driver first, and then rework this
patch on top of it? I'm working on some HSI2C related patches right
now, and thus it'd nice to know about your decision on this series
beforehand, as some of my patches (like bindings doc patches) might
depend on it. Basically I'd like to base my patches on the proper
baseline, so we don't have to rebase those later.

Thanks!

> Best regards,
> Krzysztof
