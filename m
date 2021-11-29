Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70ED6461B51
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 16:49:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244232AbhK2Pwf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 10:52:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345232AbhK2Pue (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 10:50:34 -0500
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AC7AC061D73
        for <linux-i2c@vger.kernel.org>; Mon, 29 Nov 2021 05:56:23 -0800 (PST)
Received: by mail-vk1-xa2b.google.com with SMTP id 70so11092983vkx.7
        for <linux-i2c@vger.kernel.org>; Mon, 29 Nov 2021 05:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Psq6/38akb6pFI4zFrW/zy31oIimVJgvRRtPizriX/8=;
        b=iyf2Tu45o61YhmukAkmvRRPXYCN8PD/HwC31Ug/gopXsM2RCmehIxo4Hvfchwq9TSQ
         qbP6BU7S/J7nG+PVQmSHYE2L1/WDNq269HIOar97HUQA8KS2NZjmU8Zh7n2TOd8S+v/a
         8RFGSA0/2BM1wgUTEa6UECCiXJC6F7EkwLbkO08oVZtPGuqWTxj9PilPzLcwRn0bUYh0
         /YGLbscV7LKxd//FB6z+5lIpr3MCwDvGtc9JXye75J0u2tuMZUwTgaqBVIqHkSMTzxyY
         vCo+TqQUArbWMYdf0my4u5JXp0f11fotKZjHI3k9XAlrj6Q230YroEBZMxDD0acK7YKn
         ZF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Psq6/38akb6pFI4zFrW/zy31oIimVJgvRRtPizriX/8=;
        b=t36m4r/cgJJu7peqM6cVlroQsvvRAJAFqVJDFTBzgXrTaBwZsITP90jLCtujeiNRez
         TZTPqVxJCxAVHl/4eJHFmo1A/hjHsT2SHDqDhQapCZERqz1mKaTg0FB0zPJJtV1j/pPL
         KvsofO1OI9Wgg9TXMjUcvx+4jDQMpaLDH70dnAAKvVUDzAeNZQF9qqYUixG8j7pIBuzI
         OZlezc2RWftBqzzSm6Hv31lWurdgBUg1aj9iJgAcW5mB5G9ftNZRdh1OavTuwyEoyTqC
         Gpgl1U2jPF7Op7altGNE7r4m5MNMK8X/DNzHu5NSBllml0Q3z293HMVm7xUp62qqPRA2
         afrg==
X-Gm-Message-State: AOAM530yrzs4KmJdcS4frsG8XVWEmAuYmCHoaGbTvbcAtULanTEt9zLX
        TcStTwLF6+3SKXuA7St0irh1EotG0cH0HwRdJKDSBA==
X-Google-Smtp-Source: ABdhPJz2HEiIPCArTkwOkAcHR1Mth6V7WDJcoxwiCj0f+X4ZUcus1I83945wLSi2z05M9/rSGgC4ywY2AEmYZ7h08aI=
X-Received: by 2002:a05:6122:1306:: with SMTP id e6mr36144108vkp.13.1638194182543;
 Mon, 29 Nov 2021 05:56:22 -0800 (PST)
MIME-Version: 1.0
References: <20211127223253.19098-1-semen.protsenko@linaro.org> <b9807fcc69713fb016838958a3df1c4e54309fc4.camel@gmail.com>
In-Reply-To: <b9807fcc69713fb016838958a3df1c4e54309fc4.camel@gmail.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Mon, 29 Nov 2021 15:56:10 +0200
Message-ID: <CAPLW+4kkVNSvEQjVnSWA2BjkWJXzV-4n1i+10a9FCNL0sD0n3A@mail.gmail.com>
Subject: Re: [PATCH 0/8] soc: samsung: Add USIv2 driver
To:     David Virag <virag.david003@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, 28 Nov 2021 at 05:15, David Virag <virag.david003@gmail.com> wrote:
>
> On Sun, 2021-11-28 at 00:32 +0200, Sam Protsenko wrote:
> > USIv2 IP-core provides selectable serial protocol (UART, SPI or
> > High-Speed I2C); only one can be chosen at a time. This series
> > implements USIv2 driver, which allows one to select particular USI
> > function in device tree, and also performs USI block initialization.
> >
> > With that driver implemented, it's not needed to do USI
> > initialization
> > in protocol drivers anymore, so that code is removed from the serial
> > driver.
> >
>
> I think the downstream way of doing this (USI node reg being on the
> SW_CONF register itself rather than an offset from uart/i2c/spi, the
> USI driver only controlling the SW_CONF, and the uart/i2c/spi drivers
> controlling their USI_CON and USI_OPTION regs) is cleaner, better, and
> easier to adapt to USIv1 too.
>

One reason why I think it's better to provide SW_CONF register via
syscon node, is that it helps us to avoid possible register access
conflicts in future, and also conflicts when requesting corresponding
resources. In other words, the System Register block can be used by
many consumers (drivers) in future; those consumers might try to
modify the same registers simultaneously, which might lead to race
conditions (as RMW operation is not atomic), so some kind of
serialization should be done (like locking in regmap), which is
provided by syscon. Also, that wouldn't even come to that: you just
can't request the same I/O area twice in Linux. So if SW_CONF is
passed via "reg" property to USI driver, and then we try to map the
whole System Register (or its portion that includes SW_CONF), that
request would fail.

Although passing one SW_CONF register via "reg" might look easier to
implement, it might also bring us all sort of problems later on. And I
think a good design should account for such pitfalls.

As for the USI registers: I really don't think that duplicating the
code for USI block reset across uart/i2c/spi drivers would help us to
accomplish anything. Why those drivers should be even aware of USI
reset? At least in USIv2 block, the USI registers and uart/i2c/spi
registers are not mixed: they are located at different and always
fixed addresses. We can benefit from that fact, and provide Device
Tree structure which reflects the hardware one, separating USI control
from actual protocol nodes.

> For example: I'm sure this is the case on USIv2 devices too, but on
> Exynos7885, different devices have USI modes configured differently.
> For example a Samsung Galaxy A8 (2018) has all the USI blocks
> configured as SPI while a Samsung Galaxy M20 has the first USI
> configured as dual HSI2C, the second as HSI2C on the first 2 pins and
> the third as HSI2C on the last 2 pins. With this way of doing
> everything on USIv2 we'd need 3 disabled USIv2 nodes in the SoC DTSI
> for one USI block, each for every protocol the USI block can do, all
> having a single child for their protocol and each referencing the same
> sysreg (not even sure if that's even supported). Then the board DTS
> could enable the USI node it needs.
>

If I'm following you correctly, then it's not like that. I guess
Krzysztof already replied to that, so I'll probably just repeat his
words. In that case you'll have something like this in your SoC dtsi
(for your USIv1 case of course, because dual HSI2C is not present in
USIv2):

<<<<<<<<<<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>>>>>>>>
usi1 {
    spi1 {
    };

    hsi2c1_1 {
    };

    hsi2c1_2 {
    };
};

usi2 {
    spi2 {
    };

    hsi2c2_1 {
    };
};


usi3 {
    spi3 {
    };

    hsi2c2_2 {
    };
};
<<<<<<<<<<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>>>>>>>>

and then in your board dts you just have to enable corresponding usi's
with proper modes, and enable chosen protocol nodes, like this:

<<<<<<<<<<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>>>>>>>>
&usi1 {
    status = "okay"
    samsung,mode = <USI_V1_DUAL_I2C>;
};

&hsi2c1_1 {
    status = "okay"
};

&hsi2c1_2 {
    status = "okay"
};
<<<<<<<<<<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>>>>>>>>

> With the downstream way we could have just one USI node and we could
> add the 3 protocols it can do disabled as seperate or child nodes. This
> way the board DTS only needs to set the appropriate mode setting and
> enable the protocol it needs. I'd say much better than having 3 USI
> nodes for the same USI block.
>

Not sure if with downstream USI driver you can actually have protocols
as sub-nodes in USI node though. It doesn't do anything like
of_platform_populate().

Also, with this USIv2 driver you can do the same thing you described:
you can have just one USI node with 3 protocols as sub-nodes (or you
can even have protocol nodes outside of USI node, but I'd not
recommend that).

Actually I can see that it's my fault for not describing that case in
bindings example. I'll make sure to do that in v2. You also got me
thinking about default mode: sometimes SW_CONF reset value chooses
some protocol. In that case maybe it'd useful to have something like
USI_V2_DEFAULT, to tell driver to not touch SW_CONF at all. And also I
can add USI_V2_NONE while at it, so that driver can write 0x0 to
SW_CONF: that way no protocol will be selected. Maybe that can be
beneficial for PM reasons, if some board doesn't use some USI blocks
at all. Do you think it's feasible to add those two values to
dt-bindings header? And is it possible to do so in USIv1?

> Also this way is pretty USIv2 centric. Adding USIv1 support to this
> driver is difficult this way because of the the lack of USI_CON and
> USI_OPTION registers as a whole (so having nowhere to actually set the
> reg of the USI node to, as the only thing USIv1 has is the SW_CONF
> register). In my opinion being able to use the same driver and same
> device tree layout for USIv1 and USIv2 is a definite plus
>

Well, it's USIv2 driver after all. I never expected it can be extended
for USIv1 support. If you think it can be reused for USIv1, it's fine
by me. But we need to consider next things:
  - rename the driver to just "usi.c" (and also its configuration symbol)
  - provide different compatible for USIv1 (and maybe corresponding driver data)
  - rework bindings (header and doc); make sure existing bindings are
intact (we shouldn't change already introduced interfaces)
  - in case of USIv1 compatible; don't try to tinker with USIv2 registers
  - samsung,clkreq-on won't be available in case of USIv1 compatible

Because I don't have USIv1 SoC TRM (and neither do I possess some
USIv1 board which I can use for test), I don't think it's my place to
add USIv1 support. But I think it's possible to do so, using my input
above.

I can see how it might be frustrating having to do some extra work
(comparing to just using the code existing in downstream). But I guess
that's the difference: vendor is mostly concerned about competitive
advantage and getting to market fast, while upstream is more concerned
about quality, considering all use cases, and having proper design.
Anyway, we can work together to make it right, and to have both
IP-cores support. In the worst case, if those are too different, we
can have two separate drivers for those.

> The only real drawback of that way is having to add code for USIv2
> inside the UART, HSI2C, and SPI drivers but in my opinion the benefits
> overweigh the drawbacks greatly. We could even make the uart/spi/hsi2c
> drivers call a helper function in the USI driver to set their USI_CON
> and USI_OPTION registers up so that code would be shared and not
> duplicated. Wether this patch gets applied like this is not my choice
> though, I'll let the people responsible decide
> :-)
>

I'd argue that there are a lot of real drawbacks of using downstream
driver as is. That's why I completely re-designed and re-implemented
it. Downstream driver can't be built and function as a module, it
doesn't respect System Register sharing between consumers, it leads to
USI reset code duplication scattered across protocol drivers (that
arguably shouldn't even be aware of that), it doesn't reflect HW
structure clearly, it's not holding clocks needed for registers access
(btw, sysreg clock can be provided in syscon node, exactly for that
reason). As Krzysztof said, it also can't handle correct probe order
and deferred probes. Downstream driver might work fine for some
particular use-cases the vendor has, but in upstream it's better to
cover more cases we can expect, as upstream kernel is used on more
platforms, with more user space variants, etc.

I don't really think protocol drivers should be aware of USI registers
at all, but if we they do -- we can provide some API from USIv2 driver
later, with EXPORT_SYMBOL(), referencing corresponding USI instance by
phandle or using some other mechanism for inter-driver communication.

Of course, it's not my place to decide on patch acceptance too. But I
was under the impression that maintainers would be ok with this course
of actions. Also, upstream kernel seems to already follow the same
design for some similar drivers. See for example
drivers/soc/qcom/qcom_gsbi.c.

> Anyways, soon enough I can write an USIv1 driver after I submit all the
> 7885 stuff I'm working on currently. If you want to, you can add USIv2
> support to that driver, or if an USIv2 driver is already in upstream at
> that point, if it is written in the downstream way I can add v1 support
> to that, or if it's like this I'll have to make a whole seperate driver
> with a whole seperate DT structure.
>

If it's like you said (USIv1 only touches the SW_CONF register), I
guess USIv2 driver can be extended for USIv1 case. I already provided
my thoughts on such rework above. It's probably better to consult with
Krzysztof first. I guess the only way to figure out if it's feasible
or it's better to have separate exynos-usi-v1.c for USIv1, is to try
and add USIv1 support into USIv2 driver and see how pretty or ugly it
is :) Whatever the way you decide to go with, please add me to Cc list
when sending USIv1 patches.

> Best regards,
> David
