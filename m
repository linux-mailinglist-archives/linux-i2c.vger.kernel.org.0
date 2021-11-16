Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 801AF4535D6
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Nov 2021 16:32:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238281AbhKPPey (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Nov 2021 10:34:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238273AbhKPPex (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 Nov 2021 10:34:53 -0500
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F5ACC061764
        for <linux-i2c@vger.kernel.org>; Tue, 16 Nov 2021 07:31:56 -0800 (PST)
Received: by mail-ua1-x92c.google.com with SMTP id p2so43273596uad.11
        for <linux-i2c@vger.kernel.org>; Tue, 16 Nov 2021 07:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tsrV+hfFCVu/lguKxyW5H34AzEuQICjVq9Wuxqx+30s=;
        b=t5/2NAXadqXAMwAiI9RIP3gOoQY4iP2IRi9cf5GQoc3LIoPav3xQzx9O6dh8IWGd+B
         S4VutQCpR3V9WIfTCmveVjh3KKjL7jILRXRqcRBgqReRwrHVt2uwRQJhtE+YbeXvdIcH
         f2K1j30ztG6CwRB/8CgVoxgqEsZqtWFz1GIr7klc9YT1NDQqqUEZXQv4qTAVKo1vUeJ2
         hReZoa+BfBUX7Um1+ZKMr27iclbkoSqEZQ8hk1szDHC6UDhAn9DnMLgoH50ozs4hHzQf
         uEVcJma99XK7xK8meSQ/l9ZRmPmEBq5ylKKP3aGi5tXxKiN7Dk6Zp4qj2lxGtw3r4SQN
         jnwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tsrV+hfFCVu/lguKxyW5H34AzEuQICjVq9Wuxqx+30s=;
        b=N1SPPmnNAQhKRIDoUq8jYCKXXaLXXYP63LYJXnLxf5XX+xgZrA5Y66lLjM33/ecpd7
         wgYlLaqE8FRfrP5pKWdJMgAqZ/YirmS/2mZRjyVK81/TFpb26CTC8JtvgV5PDs1hDYSZ
         o3D8RA0AxdRR5CFVauHk08mQJb8NY+NgR6j3BnT7+U3Ehch2EZzE1u+XyjVDn8US6Qmy
         muNkj21k2JoAZR5mCTGXBKw/1S9C/P7vGbNnRgXd645+7XOiiairYHEF4tKJg7cuo6Js
         z2lyOGMxwdus/Jjtxy7jF15c69Y53YQTs0P0Fh5uFW65q7OPeQxuzdMqvDAJY7yYAiEZ
         +j+g==
X-Gm-Message-State: AOAM530PVi104r3emtbglwRmvuExjslu1LXaSPo5XTTJxTpbylBJCQ+I
        jMZad6L+E/G6cvoVQyHZAfLxQ0Rt5o/O88fQvNR4Ww==
X-Google-Smtp-Source: ABdhPJzI1vYHs3IlbeTAF3zLZ2iugMLFFYsb7zRv/5mdhBpZbcKWUCT8T42LC150nqoSu9alCPYFu2j907jPq57oocE=
X-Received: by 2002:ab0:458e:: with SMTP id u14mr12043487uau.104.1637076715001;
 Tue, 16 Nov 2021 07:31:55 -0800 (PST)
MIME-Version: 1.0
References: <CGME20211112010603epcas2p339d1a6ef3df7cdbe61c87c8afa541fd0@epcas2p3.samsung.com>
 <20211112010137.149174-1-jaewon02.kim@samsung.com> <20211112010137.149174-3-jaewon02.kim@samsung.com>
 <CAPLW+4==X+irRBKHiDfgJeAb0oDKkzbcWERFs7Y3=PSOg0+qAw@mail.gmail.com>
 <001401d7da86$f7ebd660$e7c38320$@samsung.com> <da9bd8cc-9415-6db7-024e-8d50b5f666f7@canonical.com>
In-Reply-To: <da9bd8cc-9415-6db7-024e-8d50b5f666f7@canonical.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 16 Nov 2021 17:31:43 +0200
Message-ID: <CAPLW+4n2hZ1c9BuOo4JtKLZp48fH81xUr0GSaJoc21=ad2vv1Q@mail.gmail.com>
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

To provide more context, USI registers are split across two different
register maps:

    - USI protocol configuration (where we choose which protocol to
use: HSI2C, SPI or UART) is done via *_SW_CONF registers, from System
Register SFR range. To access those SW_CONF registers we need to
either:
        (Option 3) pass System Register registers to corresponding
driver (HSI2C/SPI/UART) via syscon
        (Option 1) or implement separate USI driver, so we can choose
desired protocol in device tree; in that case I guess System Register
registers should be passed via syscon to USI driver
    - USI registers (like USI_CON register, which contains USI_RESET
bit) are contained in the same SFR range as corresponding
HSI2C/SPI/UART IP-core. Or rather HSI2C/SPI/UART IP-cores are
encapsulated within USI block(s). So to access registers like USI_CON
we only need to use memory already passed to corresponding
HSI2C/SPI/UART driver via "reg" property.

So I'd say ideally we should do next:
  - modify USI registers (like USI_CON) in corresponding
HSI2C/SPI/UART drivers; but because all HSI2C/SPI/UART drivers share
the same USI registers, we might want to pull USI register offsets and
bits to some common header file, for example (to not duplicate that
code in drivers)
  - implement separate USI driver to control SW_CONF registers from
System Register module (Option 1), so we can choose desired protocol
in device tree (in some USI node, not in HSI2C node)
  - also, it probably makes sense to group all USI related nodes in
some separate *-usi.dtsi file; that would reduce confusion, given that
we have even more encapsulation in Exynos850 thanks to CMGP (Common
GPIO) block

My suggestion is to take this patch as is, and then we can work on USI
driver implementation/upstreaming. Right now we don't have much of
device tree files that use USI HSI2C driver, so it'll be fairly easy
to fix those dts's once we implemented USI driver. That will also
unblock me with submitting dev board support (dts files) I'm working
on right now. Krzysztof, please let me know if I'm wrong and if we
shouldn't change dts API too much, so it's mandatory to implement USI
driver before accepting this patch.

Thanks!

> Best regards,
> Krzysztof
