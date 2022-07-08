Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70B6356B392
	for <lists+linux-i2c@lfdr.de>; Fri,  8 Jul 2022 09:34:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237630AbiGHHcN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 8 Jul 2022 03:32:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237455AbiGHHcL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 8 Jul 2022 03:32:11 -0400
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 397897D1C5;
        Fri,  8 Jul 2022 00:32:08 -0700 (PDT)
Received: by mail-qk1-f171.google.com with SMTP id z12so15131637qki.3;
        Fri, 08 Jul 2022 00:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GyuWdxIYPEX32KTLf4+nqWMB/g4jdV/r/sv49wLRugA=;
        b=O/EhcTLBcdUYcej0PJL9wrq1jdAI3f1er75yakc7c8iLr9dImV91wAInhH6UE1+kIK
         zqJE+jJ+2FmofdDcEzTonAyTwf4/AUJe6ZeWrSUvGlxDEHGP3HQfDiVBk2FuNidKEfjH
         jxKagvlTT/LMmaoX+POKdDYEw2WDsnuNLtfBjXPSZHnC4Ce8dJ0Bi370aRY+VaYyadAo
         vw9EV1QXqoPaXMSHnjIZvRLTph4alJthxD/AB8FTwgs44Hj5Rb/i5upUBaF7nNHvl9+V
         rWkepWOX3JlMZzuU9f48IiDfXdCA6y1gtHVf9m7wte9meRApQOvICqLzM2knxR/uH0L3
         Vf/A==
X-Gm-Message-State: AJIora//+zeHsRLXkBfQR8Z8MC+QWLqIZaM9KHFKW5dPYQXSaBlbEXUE
        Lq0kmQLvAt/tHnOKQ0ntzyAcUoiurcemCA==
X-Google-Smtp-Source: AGRyM1v8atxASgO5r0j+Uh7oAbbEC1ERTW5qINwQKbtZVTWuqtH54DwvdOHRk+SSRFEtDP/Q3UIoaA==
X-Received: by 2002:a05:620a:2624:b0:6b5:3f21:b26d with SMTP id z36-20020a05620a262400b006b53f21b26dmr1316237qko.233.1657265527120;
        Fri, 08 Jul 2022 00:32:07 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id bi13-20020a05620a318d00b006a6c552736asm33620223qkb.119.2022.07.08.00.32.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Jul 2022 00:32:06 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-31caffa4a45so119017057b3.3;
        Fri, 08 Jul 2022 00:32:06 -0700 (PDT)
X-Received: by 2002:a81:1090:0:b0:31c:9be5:6c95 with SMTP id
 138-20020a811090000000b0031c9be56c95mr2513847ywq.384.1657265526102; Fri, 08
 Jul 2022 00:32:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220701163916.111435-1-phil.edworthy@renesas.com>
 <20220701163916.111435-3-phil.edworthy@renesas.com> <YsAxSrcAk4jtRYx4@smile.fi.intel.com>
 <CAMuHMdU1-LQJUCsDAfaC4OhRW7ijcpAG9VEUHu_Gu1qE7LdweA@mail.gmail.com>
 <YsGy2rqk1tKQJJ/b@smile.fi.intel.com> <TYYPR01MB7086921244A6D1B764368A54F5839@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <TYYPR01MB70869DD9107B4A3B2319AF4DF5839@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <CAMuHMdUnR819KRVke=ob21cvsMnOcQHFq3ym-oAg0dKcpWCGtw@mail.gmail.com> <TYYPR01MB7086B6281BCBA67BB6626333F5839@TYYPR01MB7086.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB7086B6281BCBA67BB6626333F5839@TYYPR01MB7086.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 8 Jul 2022 09:31:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX5UN61jZXksBjJs1skudt2B8uMLDVASLyqfnfrOWoS3Q@mail.gmail.com>
Message-ID: <CAMuHMdX5UN61jZXksBjJs1skudt2B8uMLDVASLyqfnfrOWoS3Q@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] i2c: Add Renesas RZ/V2M controller
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>, Sven Peter <sven@svenpeter.dev>,
        Jan Dabros <jsd@semihalf.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Phil,

On Thu, Jul 7, 2022 at 8:47 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> On 07 July 2022 18:46 Geert Uytterhoeven wrote:
> > On Thu, Jul 7, 2022 at 6:37 PM Phil Edworthy wrote:
> > > On 07 July 2022 08:21 Phil Edworthy wrote:
> > > > On 03 July 2022 16:17 Andy Shevchenko wrote:
> > > > > On Sun, Jul 03, 2022 at 10:41:45AM +0200, Geert Uytterhoeven wrote:
> > > > > > On Sat, Jul 2, 2022 at 1:51 PM Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > > > On Fri, Jul 01, 2022 at 05:39:16PM +0100, Phil Edworthy wrote:
> > > > > > > > Yet another i2c controller from Renesas that is found on the
> > > > RZ/V2M
> > > > > > > > (r9a09g011) SoC. It can support only 100kHz and 400KHz
> > operation.
> > > > >
> > > > > ...
> > > > All other suggested changes are ok.
> > > >
> > > >
> > > > > > > > +     pm_runtime_get_sync(dev);
> > > > > >
> > > > > > pm_runtime_resume_and_get() ;-)
> > > > >
> > > > > This makes sense only if we test for error. Otherwise the put might
> > > > > imbalance
> > > > > counter.
> > > > I added code to check the return value and to my surprise it returned
> > > > -EACCES.
> > > > Some digging later, this only happens when I have an i2c controller
> > > > enabled that doesn't have any children.
> > > >
> > > > rpm_resume() returns -EACCES [1] because runtime_status and
> > last_status
> > > > are set to RPM_SUSPENDED.
> > > >
> > > > The i2c controller that does have a child has runtime_status =
> > RPM_ACTIVE
> > > > as there is a call to pm_runtime_resume_and_get() on it due to the i2c
> > > > controller performing an i2c transfer for the slave device.
> > > >
> > > > I am currently struggling to work out why this is happening...
> > >
> > > First pm_suspend() works it's way down to __pm_runtime_disable():
> > >   __pm_runtime_disable+0x134/0x1e0
> > >   __device_suspend_late+0x28/0x1c4
> > >   dpm_suspend_late+0x158/0x230
> > >   suspend_devices_and_enter+0x1c8/0x4b4
> > >   pm_suspend+0x210/0x28c
> > > At the end of which, runtime_status and last_status are both
> > RPM_SUSPENDED,
> > > and disable_depth = 1 [1]
> > >
> > > After that rzv2m_i2c_suspend() is called triggering the EACCES error
> > > condition [2]:
> > >   rpm_resume+0x338/0x630
> > >   __pm_runtime_resume+0x4c/0x80
> > >   rzv2m_i2c_suspend+0x24/0xb0
> > >   pm_generic_suspend_noirq+0x30/0x50
> > >   genpd_finish_suspend+0xb0/0x130
> > >   genpd_suspend_noirq+0x14/0x20
> > >   __device_suspend_noirq+0x68/0x1d0
> > >   dpm_noirq_suspend_devices+0x110/0x1dc
> > >   dpm_suspend_noirq+0x24/0xa0
> > >   suspend_devices_and_enter+0x2f0/0x4b4
> > >   pm_suspend+0x210/0x28c
> > >
> > > I think using runtime PM from within driver suspend/resume is simply not
> > > supported. However I had some difficulty following the runtime PM code,
> > > so I could be wrong.
> >
> > Oh, it's a NOIRQ system sleep op. You indeed cannot use runtime resume
> > from such a callback, as the latter may sleep.
> Thanks for confirming this.
>
> I believe i2c controller driver should use NOIRQ system sleep ops as i2c
> children may need to send I2C messages during suspend, and the noirq
> sleep ops are called after the late sleep ops (used by some i2c children
> drivers).
>
> So should I just use clk_prepare_enable() and clk_prepare_enable()
> within the i2c controller's suspend and resume?

That's one option.
There's also i2c_mark_adapter_suspended().

And if you care about sending messages in atomic/noirq context,
you want to implement i2c_algorithm.master_xfer_atomic().

You may want to have a look at drivers/i2c/busses/i2c-sh_mobile.c,
which is used to control the PMIC on R-Car SoCs.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
