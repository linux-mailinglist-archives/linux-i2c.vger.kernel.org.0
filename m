Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D293356AA09
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Jul 2022 19:52:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235892AbiGGRwR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 7 Jul 2022 13:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235801AbiGGRwQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 7 Jul 2022 13:52:16 -0400
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3C2559253;
        Thu,  7 Jul 2022 10:52:15 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id g14so23839980qto.9;
        Thu, 07 Jul 2022 10:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y4yV5HHKbO1opktHoXPqxBu+ZNPPa7vz6WkZ9AN0KN4=;
        b=mI7RCR41bUJczfiwZBbgMtj79iWdYnp0glfKo9pDnhffP5yDXVS/yoMwVkIPaZOeP8
         Th3nM5nUETso6FibIvPqkh4RFBYRPhDNiJy48zYui/T9o6f5v1IYaJ5ArZVaRWPzdNeV
         eO9c4W33m9Tm9y9s/uvYE5d3qiGg75e+DL9PC0RTMxWpdLF7uq3RjHDS4lpRDHcE+20v
         TIS/WZeA3M2RhBIQogtcVkESCv/RR9JMMk3eCtSDrssgv+MM4GUNEEV/iII/haBXtYSD
         5540RalqVcrMn0MrwCA2OuWMm6f8xM3CRq7LfawwUJl4WBlvHej5/D9noV0QjRKeSioF
         xIHA==
X-Gm-Message-State: AJIora+phiK9XG7duhRUbycsUNJQJ8P3UEFYOljIEXKLFxT1uLe1zt8K
        SFdEdwuxUTkfnAcKbsbm1wfq2dzGpfspFA==
X-Google-Smtp-Source: AGRyM1tJkCyB9socbM+lJbOENc7pkQbbzBmHKdNM/aflNGcFASr3nGOqCe3CfvARZkW8ih8UESyDcw==
X-Received: by 2002:ac8:7d90:0:b0:31d:32ae:b352 with SMTP id c16-20020ac87d90000000b0031d32aeb352mr32243614qtd.649.1657216334701;
        Thu, 07 Jul 2022 10:52:14 -0700 (PDT)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com. [209.85.219.181])
        by smtp.gmail.com with ESMTPSA id s11-20020a05622a1a8b00b003196e8eda26sm21704435qtc.69.2022.07.07.10.52.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 10:52:14 -0700 (PDT)
Received: by mail-yb1-f181.google.com with SMTP id g4so33818476ybg.9;
        Thu, 07 Jul 2022 10:52:14 -0700 (PDT)
X-Received: by 2002:a0d:c787:0:b0:31b:a963:e1de with SMTP id
 j129-20020a0dc787000000b0031ba963e1demr53415058ywd.283.1657215950691; Thu, 07
 Jul 2022 10:45:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220701163916.111435-1-phil.edworthy@renesas.com>
 <20220701163916.111435-3-phil.edworthy@renesas.com> <YsAxSrcAk4jtRYx4@smile.fi.intel.com>
 <CAMuHMdU1-LQJUCsDAfaC4OhRW7ijcpAG9VEUHu_Gu1qE7LdweA@mail.gmail.com>
 <YsGy2rqk1tKQJJ/b@smile.fi.intel.com> <TYYPR01MB7086921244A6D1B764368A54F5839@TYYPR01MB7086.jpnprd01.prod.outlook.com>
 <TYYPR01MB70869DD9107B4A3B2319AF4DF5839@TYYPR01MB7086.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB70869DD9107B4A3B2319AF4DF5839@TYYPR01MB7086.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 7 Jul 2022 19:45:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUnR819KRVke=ob21cvsMnOcQHFq3ym-oAg0dKcpWCGtw@mail.gmail.com>
Message-ID: <CAMuHMdUnR819KRVke=ob21cvsMnOcQHFq3ym-oAg0dKcpWCGtw@mail.gmail.com>
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
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Phil,

On Thu, Jul 7, 2022 at 6:37 PM Phil Edworthy <phil.edworthy@renesas.com> wrote:
> On 07 July 2022 08:21 Phil Edworthy wrote:
> > On 03 July 2022 16:17 Andy Shevchenko wrote:
> > > On Sun, Jul 03, 2022 at 10:41:45AM +0200, Geert Uytterhoeven wrote:
> > > > On Sat, Jul 2, 2022 at 1:51 PM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > > On Fri, Jul 01, 2022 at 05:39:16PM +0100, Phil Edworthy wrote:
> > > > > > Yet another i2c controller from Renesas that is found on the
> > RZ/V2M
> > > > > > (r9a09g011) SoC. It can support only 100kHz and 400KHz operation.
> > >
> > > ...
> > All other suggested changes are ok.
> >
> >
> > > > > > +     pm_runtime_get_sync(dev);
> > > >
> > > > pm_runtime_resume_and_get() ;-)
> > >
> > > This makes sense only if we test for error. Otherwise the put might
> > > imbalance
> > > counter.
> > I added code to check the return value and to my surprise it returned
> > -EACCES.
> > Some digging later, this only happens when I have an i2c controller
> > enabled that doesn't have any children.
> >
> > rpm_resume() returns -EACCES [1] because runtime_status and last_status
> > are set to RPM_SUSPENDED.
> >
> > The i2c controller that does have a child has runtime_status = RPM_ACTIVE
> > as there is a call to pm_runtime_resume_and_get() on it due to the i2c
> > controller performing an i2c transfer for the slave device.
> >
> > I am currently struggling to work out why this is happening...
>
> First pm_suspend() works it's way down to __pm_runtime_disable():
>   __pm_runtime_disable+0x134/0x1e0
>   __device_suspend_late+0x28/0x1c4
>   dpm_suspend_late+0x158/0x230
>   suspend_devices_and_enter+0x1c8/0x4b4
>   pm_suspend+0x210/0x28c
> At the end of which, runtime_status and last_status are both RPM_SUSPENDED,
> and disable_depth = 1 [1]
>
> After that rzv2m_i2c_suspend() is called triggering the EACCES error
> condition [2]:
>   rpm_resume+0x338/0x630
>   __pm_runtime_resume+0x4c/0x80
>   rzv2m_i2c_suspend+0x24/0xb0
>   pm_generic_suspend_noirq+0x30/0x50
>   genpd_finish_suspend+0xb0/0x130
>   genpd_suspend_noirq+0x14/0x20
>   __device_suspend_noirq+0x68/0x1d0
>   dpm_noirq_suspend_devices+0x110/0x1dc
>   dpm_suspend_noirq+0x24/0xa0
>   suspend_devices_and_enter+0x2f0/0x4b4
>   pm_suspend+0x210/0x28c
>
> I think using runtime PM from within driver suspend/resume is simply not
> supported. However I had some difficulty following the runtime PM code,
> so I could be wrong.

Oh, it's a NOIRQ system sleep op. You indeed cannot use runtime resume
from such a callback, as the latter may sleep.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
