Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39E984628CC
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Nov 2021 01:02:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229446AbhK3AGM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 19:06:12 -0500
Received: from mail-ua1-f50.google.com ([209.85.222.50]:44752 "EHLO
        mail-ua1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230424AbhK3AGM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 19:06:12 -0500
Received: by mail-ua1-f50.google.com with SMTP id p2so37636129uad.11
        for <linux-i2c@vger.kernel.org>; Mon, 29 Nov 2021 16:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HZZygbV7zHiCmGrUMXtbzzqKRXX6tbAL/5OPMq1714E=;
        b=oJCQ/KaJVsHQLKIhT8kk4itVbP+m+S7/9pS73damHBFlR4Cy9JN7I5G4Pk/Mm7U0+c
         EnZpbucbd3Ay4dGISIOaBBscAZoYfqiTK1cDrzdZNfrzml1vQlWUUi/jFunYmvV5k+Eb
         Mk0uHjPpuxK0/isebgZyN6x2zDY7mdFQdi8+t0zoVwKIn+N9AjyNE2V7XOvVo2VPZIe+
         xNArko7IhH/7O6Iz4NdIotvaqWVGaqCsafkwfjw2wHG9Xdb5XeU+QbTiigj8RuCviA+c
         ExSL3kQsusiAlP6V0g3VcsGGeoavMvCNLIBtnR/zHaJcMOaA/J8LSh3jSmhchjUJ6XkZ
         Q+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HZZygbV7zHiCmGrUMXtbzzqKRXX6tbAL/5OPMq1714E=;
        b=UEIJiyiHdWb8F1nvnGJa29MUiEgyxCutdJEJBoTBLohlwoD8Z7wBo4qa2rHAuYUIsV
         2SM6AXjy23hZuPN14rH0iMmBhO39pEf96eIVcqyEBqtJPC7Zj6lvGAC4QAXK/ywto0mq
         WJtKjDHz25A6Jn7LxXO3daQppGzMcn1uxap9eQI375DjgBczeGnCOlAAEPt7551Razi4
         aWLvIRcH4jI+/vypH8A5KSuu0zYdCgeqxQe6lSA11bkbPoXIc4p+CNP6moZUB8Mp24kv
         vlIMK3K7/aWbKi36H0On4tz5pPQ+yM9E2on6mAKBXd8WIrd/qR/YVO8hVj85F6mkWo0r
         WH8g==
X-Gm-Message-State: AOAM5337fXNvEJeDha3e8JIqpaXgssN6+gPv1Ik56avngd5Cgm9zptEb
        lyiIedeaWCp+d4K28OsxlqXFWVdHbQFcdWMsVTx4DA==
X-Google-Smtp-Source: ABdhPJzhgbadz/Hl0DuwolR2Pr9IAPkXYvVqh3xdRefwOraLF3I+ir2hY+/JWz/ZI13Fp1T9ykYi+4docnwwAsi0g3Y=
X-Received: by 2002:a05:6102:f10:: with SMTP id v16mr38425789vss.86.1638230513148;
 Mon, 29 Nov 2021 16:01:53 -0800 (PST)
MIME-Version: 1.0
References: <20211127223253.19098-1-semen.protsenko@linaro.org>
 <b9807fcc69713fb016838958a3df1c4e54309fc4.camel@gmail.com>
 <CAPLW+4kkVNSvEQjVnSWA2BjkWJXzV-4n1i+10a9FCNL0sD0n3A@mail.gmail.com> <97a28ade85f31f709c7848da5ebab0bdc802afd2.camel@gmail.com>
In-Reply-To: <97a28ade85f31f709c7848da5ebab0bdc802afd2.camel@gmail.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 30 Nov 2021 02:01:40 +0200
Message-ID: <CAPLW+4=wfAHRi5CvzcyZf6R2sCQ1WMC11MFwqfLnzPbXMyUTtA@mail.gmail.com>
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

On Mon, 29 Nov 2021 at 21:19, David Virag <virag.david003@gmail.com> wrote:
>
> On Mon, 2021-11-29 at 15:56 +0200, Sam Protsenko wrote:
> > On Sun, 28 Nov 2021 at 05:15, David Virag <virag.david003@gmail.com>
> > wrote:
> > >
> > > On Sun, 2021-11-28 at 00:32 +0200, Sam Protsenko wrote:
> > > > USIv2 IP-core provides selectable serial protocol (UART, SPI or
> > > > High-Speed I2C); only one can be chosen at a time. This series
> > > > implements USIv2 driver, which allows one to select particular USI
> > > > function in device tree, and also performs USI block
> > > > initialization.
> > > >
> > > > With that driver implemented, it's not needed to do USI
> > > > initialization
> > > > in protocol drivers anymore, so that code is removed from the
> > > > serial
> > > > driver.
> > > >
> > >
> > > I think the downstream way of doing this (USI node reg being on the
> > > SW_CONF register itself rather than an offset from uart/i2c/spi, the
> > > USI driver only controlling the SW_CONF, and the uart/i2c/spi drivers
> > > controlling their USI_CON and USI_OPTION regs) is cleaner, better,
> > > and
> > > easier to adapt to USIv1 too.
> > >
> >
> > One reason why I think it's better to provide SW_CONF register via
> > syscon node, is that it helps us to avoid possible register access
> > conflicts in future, and also conflicts when requesting corresponding
> > resources. In other words, the System Register block can be used by
> > many consumers (drivers) in future; those consumers might try to
> > modify the same registers simultaneously, which might lead to race
> > conditions (as RMW operation is not atomic), so some kind of
> > serialization should be done (like locking in regmap), which is
> > provided by syscon. Also, that wouldn't even come to that: you just
> > can't request the same I/O area twice in Linux. So if SW_CONF is
> > passed via "reg" property to USI driver, and then we try to map the
> > whole System Register (or its portion that includes SW_CONF), that
> > request would fail.
>
> I've got to admit, that's something I didn't think about much, partly
> because the lack of TRM on my hand, as I'm working with just vendor
> kernel sources and consumer phones. What other things are in the sysreg
> in your case? Looking at my vendor device tree, the USI SW_CONF
> registers are at 0x10032000-0x10032008 in my case and the DT lacks
> anything else close by (in the 0x1003xxxx region).
>

Just in case, System Register is not a single register, but a register
block. In case of Exynos850 I have all sorts of registers in SYSREG.
Basically I have one SYSREG per domain, e.g. for PERI domain I have
SYSREG_PERI. Registers inside of each SYSREG may vary. SYREG_PERI has
IPCLK control register, SW_CONF registers, APB register, some USER
registers, etc, etc...

You can use something like this to find SYSREG info in your kernel:

    $ find drivers/ -type f -name '*7885*' -exec grep -Hni 'SYSREG' {} \;
    $ git grep -n --all-match -e SYSREG -e 1003 -- drivers/*7885*

Looking at Exynos7885 downstream kernel, you have next SYSREGs:

    SYSREG_PERI    0x10030000
    SYSREG_MIF0    0x10470000
    SYSREG_MIF1    0x10570000
    SYSREG_CPUCL0    0x10910000
    SYSREG_CPUCL1    0x10810000
    SYSREG_CPUCL2    0x10A10000
    SYSREG_APM    0x11C20000
    SYSREG_CORE    0x12010000
    SYSREG_FSYS    0x13420000

Those are base addresses for each sysreg. My wild guess, each SYSREG
size would be at least 0x10000.

SYSREG which contains SW_CONF registers for USI blocks is apparently
SYSREG_PERI. And SW_CONF offsets for each USI (inside of SYSREG_PERIO)
are:

    USI0: 0x2000
    USI1: 0x2004
    USI2: 0x2008

> >
> > Although passing one SW_CONF register via "reg" might look easier to
> > implement, it might also bring us all sort of problems later on. And I
> > think a good design should account for such pitfalls.
> >
> > As for the USI registers: I really don't think that duplicating the
> > code for USI block reset across uart/i2c/spi drivers would help us to
> > accomplish anything. Why those drivers should be even aware of USI
> > reset? At least in USIv2 block, the USI registers and uart/i2c/spi
> > registers are not mixed: they are located at different and always
> > fixed addresses. We can benefit from that fact, and provide Device
> > Tree structure which reflects the hardware one, separating USI control
> > from actual protocol nodes.
> >
> > > For example: I'm sure this is the case on USIv2 devices too, but on
> > > Exynos7885, different devices have USI modes configured differently.
> > > For example a Samsung Galaxy A8 (2018) has all the USI blocks
> > > configured as SPI while a Samsung Galaxy M20 has the first USI
> > > configured as dual HSI2C, the second as HSI2C on the first 2 pins and
> > > the third as HSI2C on the last 2 pins. With this way of doing
> > > everything on USIv2 we'd need 3 disabled USIv2 nodes in the SoC DTSI
> > > for one USI block, each for every protocol the USI block can do, all
> > > having a single child for their protocol and each referencing the
> > > same
> > > sysreg (not even sure if that's even supported). Then the board DTS
> > > could enable the USI node it needs.
> > >
> >
> > If I'm following you correctly, then it's not like that. I guess
> > Krzysztof already replied to that, so I'll probably just repeat his
> > words. In that case you'll have something like this in your SoC dtsi
> > (for your USIv1 case of course, because dual HSI2C is not present in
> > USIv2):
> >
> > <<<<<<<<<<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>>>>>>>>
> > usi1 {
> >     spi1 {
> >     };
> >
> >     hsi2c1_1 {
> >     };
> >
> >     hsi2c1_2 {
> >     };
> > };
> >
> > usi2 {
> >     spi2 {
> >     };
> >
> >     hsi2c2_1 {
> >     };
> > };
> >
> >
> > usi3 {
> >     spi3 {
> >     };
> >
> >     hsi2c2_2 {
> >     };
> > };
> > <<<<<<<<<<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>>>>>>>>
> >
> > and then in your board dts you just have to enable corresponding usi's
> > with proper modes, and enable chosen protocol nodes, like this:
> >
> > <<<<<<<<<<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>>>>>>>>
> > &usi1 {
> >     status = "okay"
> >     samsung,mode = <USI_V1_DUAL_I2C>;
> > };
> >
> > &hsi2c1_1 {
> >     status = "okay"
> > };
> >
> > &hsi2c1_2 {
> >     status = "okay"
> > };
> > <<<<<<<<<<<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>>>>>>>>
>
> What got me confused is the following: Upon checking vendor drivers I
> was under the impression that we have all 3 protocols at seperate
> addresses, and the USI SW_CONF register kind of works like a
> multiplexer for the USI pins to switch between protocols. Now I see
> that I was wrong, and the addresses are in fact the same. Now on a
> hardware level it might still work just as a multiplexer but it
> swithches the entire address space for a whole different protocol
> block. Dumb little misunderstanding on my part, never mind! They are on
> the same address even on USIv1. Not sure how I haven't noticed that
> before, I guess since I never started experimenting with USI before,
> just looked at the code as a reference I assumed a lot of things.
>

Ah, yeah, USI block actually shares most of its internal circuits
within each protocol. So you can only choose one protocol per USI. I
should probably add that info to the bindings doc.

> >
> > > With the downstream way we could have just one USI node and we could
> > > add the 3 protocols it can do disabled as seperate or child nodes.
> > > This
> > > way the board DTS only needs to set the appropriate mode setting and
> > > enable the protocol it needs. I'd say much better than having 3 USI
> > > nodes for the same USI block.
> > >
> >
> > Not sure if with downstream USI driver you can actually have protocols
> > as sub-nodes in USI node though. It doesn't do anything like
> > of_platform_populate().
>
> It can't as far as I'm aware, I was just thinking that did seem like a
> good idea to keep.
>
> >
> > Also, with this USIv2 driver you can do the same thing you described:
> > you can have just one USI node with 3 protocols as sub-nodes (or you
> > can even have protocol nodes outside of USI node, but I'd not
> > recommend that).
> >
> > Actually I can see that it's my fault for not describing that case in
> > bindings example. I'll make sure to do that in v2. You also got me
> > thinking about default mode: sometimes SW_CONF reset value chooses
> > some protocol. In that case maybe it'd useful to have something like
> > USI_V2_DEFAULT, to tell driver to not touch SW_CONF at all.
>
> Not sure if that's useful, I'm thinking we specify some protocol for
> the USIs in board dts anyways, and if we don't, then we probably don't
> use that USI block anyways, so at a minimum all protocols should be
> probably disabled in that case, and probably the USI block as a whole
> too. (SoC dtsi has them disabled, board dts doesn't touch them, so they
> remain disabled). May I know how do you think a defult mode would be
> useful?
>

Yeah, you are right. I'll probably add USI_NONE configuration for 0x0.
Default one is really of no use.

> > And also I
> > can add USI_V2_NONE while at it, so that driver can write 0x0 to
> > SW_CONF: that way no protocol will be selected. Maybe that can be
> > beneficial for PM reasons, if some board doesn't use some USI blocks
> > at all. Do you think it's feasible to add those two values to
> > dt-bindings header? And is it possible to do so in USIv1?
>
> I think I saw some downstream driver do something similiar, that sounds
> like a good idea. In USIv1 I can see the HSI2C driver writing 0 to the
> SW_CONF register at pm suspend. Not sure why that's in the HSI2C driver
> rather than the USI but I'm guessing it should do the same thing as for
> you. I have no TRM though, so not sure. We'll probably just have to
> assume that's how it works here, maybe someone that has access to an
> USIv1 SoC TRM could confirm? Probably won't get any response from
> anyone who has it though.
>

I guess it's enough to have that kernel source code to figure out
essentials. When you set 0x0, no protocol is chosen, so we can imagine
roughly what happens inside of USI IP-core (internal circuits are not
connected, muxes are opened, etc). As I understand, 0x0 might be the
reset value for some SW_CONF registers, so it'll appear on PM resume,
so one should set SW_CONF on resume again (which is done in my driver
already).

> >
> > > Also this way is pretty USIv2 centric. Adding USIv1 support to this
> > > driver is difficult this way because of the the lack of USI_CON and
> > > USI_OPTION registers as a whole (so having nowhere to actually set
> > > the
> > > reg of the USI node to, as the only thing USIv1 has is the SW_CONF
> > > register). In my opinion being able to use the same driver and same
> > > device tree layout for USIv1 and USIv2 is a definite plus
> > >
> >
> > Well, it's USIv2 driver after all. I never expected it can be extended
> > for USIv1 support. If you think it can be reused for USIv1, it's fine
> > by me. But we need to consider next things:
> >   - rename the driver to just "usi.c" (and also its configuration
> > symbol)
> >   - provide different compatible for USIv1 (and maybe corresponding
> > driver data)
> >   - rework bindings (header and doc); make sure existing bindings are
> > intact (we shouldn't change already introduced interfaces)
> >   - in case of USIv1 compatible; don't try to tinker with USIv2
> > registers
> >   - samsung,clkreq-on won't be available in case of USIv1 compatible
> >
> > Because I don't have USIv1 SoC TRM (and neither do I possess some
> > USIv1 board which I can use for test), I don't think it's my place to
> > add USIv1 support. But I think it's possible to do so, using my input
> > above.
> >
> > I can see how it might be frustrating having to do some extra work
> > (comparing to just using the code existing in downstream). But I guess
> > that's the difference: vendor is mostly concerned about competitive
> > advantage and getting to market fast, while upstream is more concerned
> > about quality, considering all use cases, and having proper design.
>
> It's not really the extra work, I just didn't see the benefits of this
> way, and my misunderstanding caused me to not see how this would work.
> I never really wanted to use the downstream driver as is, but in my
> head I was thinking that "layout" should work.
>
> > Anyway, we can work together to make it right, and to have both
> > IP-cores support. In the worst case, if those are too different, we
> > can have two separate drivers for those.
> >
> > > The only real drawback of that way is having to add code for USIv2
> > > inside the UART, HSI2C, and SPI drivers but in my opinion the
> > > benefits
> > > overweigh the drawbacks greatly. We could even make the
> > > uart/spi/hsi2c
> > > drivers call a helper function in the USI driver to set their
> > > USI_CON
> > > and USI_OPTION registers up so that code would be shared and not
> > > duplicated. Wether this patch gets applied like this is not my
> > > choice
> > > though, I'll let the people responsible decide
> > > :-)
> > >
> >
> > I'd argue that there are a lot of real drawbacks of using downstream
> > driver as is. That's why I completely re-designed and re-implemented
> > it. Downstream driver can't be built and function as a module, it
> > doesn't respect System Register sharing between consumers, it leads
> > to
> > USI reset code duplication scattered across protocol drivers (that
> > arguably shouldn't even be aware of that), it doesn't reflect HW
> > structure clearly, it's not holding clocks needed for registers
> > access
> > (btw, sysreg clock can be provided in syscon node, exactly for that
> > reason). As Krzysztof said, it also can't handle correct probe order
> > and deferred probes. Downstream driver might work fine for some
> > particular use-cases the vendor has, but in upstream it's better to
> > cover more cases we can expect, as upstream kernel is used on more
> > platforms, with more user space variants, etc.
>
> I do agree now, as I said a bit of a misunderstanding made me believe
> this was wrong. (as if the addresses were different and the downstream
> drivers worked the same way that would mean each USIv2 would have 3
> sets of USI_CON and USI_OPTION registers for each protocol which would
> definitely have to be handled somewhat differently.
>

I've checked USIv2 driver code in Exynos7885 kernel (publicly
available), and it looks like it would be relatively easy to add that
to the driver I submitted. Please wait for my series to be Acked or
applied, then you can go ahead and send your additions on top of that.
I don't want to do that, as I don't have any HW I can validate that,
so it doesn't make much sense.

> >
> > I don't really think protocol drivers should be aware of USI
> > registers
> > at all, but if we they do -- we can provide some API from USIv2
> > driver
> > later, with EXPORT_SYMBOL(), referencing corresponding USI instance
> > by
> > phandle or using some other mechanism for inter-driver communication.
> >
> > Of course, it's not my place to decide on patch acceptance too. But I
> > was under the impression that maintainers would be ok with this
> > course
> > of actions. Also, upstream kernel seems to already follow the same
> > design for some similar drivers. See for example
> > drivers/soc/qcom/qcom_gsbi.c.
> >
> > > Anyways, soon enough I can write an USIv1 driver after I submit all
> > > the
> > > 7885 stuff I'm working on currently. If you want to, you can add
> > > USIv2
> > > support to that driver, or if an USIv2 driver is already in
> > > upstream at
> > > that point, if it is written in the downstream way I can add v1
> > > support
> > > to that, or if it's like this I'll have to make a whole seperate
> > > driver
> > > with a whole seperate DT structure.
> > >
> >
> > If it's like you said (USIv1 only touches the SW_CONF register), I
> > guess USIv2 driver can be extended for USIv1 case. I already provided
> > my thoughts on such rework above. It's probably better to consult
> > with
> > Krzysztof first. I guess the only way to figure out if it's feasible
> > or it's better to have separate exynos-usi-v1.c for USIv1, is to try
> > and add USIv1 support into USIv2 driver and see how pretty or ugly it
> > is :) Whatever the way you decide to go with, please add me to Cc
> > list
> > when sending USIv1 patches.
>
> Sure, I'll try doing it on top of the final version of your driver
> then! Sorry for the misunderstanding there!
>
> >
> > > Best regards,
> > > David
>
