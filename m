Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA64D4AF501
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Feb 2022 16:19:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235673AbiBIPTC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Feb 2022 10:19:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233245AbiBIPTB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Feb 2022 10:19:01 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEC80C0613C9;
        Wed,  9 Feb 2022 07:19:03 -0800 (PST)
Received: from mail-wm1-f42.google.com ([209.85.128.42]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N9MlI-1oMjEg0hU4-015LCk; Wed, 09 Feb 2022 16:19:02 +0100
Received: by mail-wm1-f42.google.com with SMTP id m126-20020a1ca384000000b0037bb8e379feso3380272wme.5;
        Wed, 09 Feb 2022 07:19:02 -0800 (PST)
X-Gm-Message-State: AOAM530QaYBl5zAT8ckwrKkz1/QmgQRB3mUr/fzUDmB+1MtAfTD3R6MD
        6V+9ESz9BFigxlFWZzh8NO54uzg0CMX5t69PsIk=
X-Google-Smtp-Source: ABdhPJxC6yS4pZe2435Qd1HxMwKInn1Oh/ph/XdsG7j7cymhJO/oHhExs7jdnGMMcZ3Rtq95pkF7gsXdKA/mOg/25a0=
X-Received: by 2002:a05:600c:1f06:: with SMTP id bd6mr2495408wmb.98.1644419941772;
 Wed, 09 Feb 2022 07:19:01 -0800 (PST)
MIME-Version: 1.0
References: <20211218165258.16716-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211218165258.16716-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUg3=q7gyaVHP0XcYUOo3PQUUv8Hc8wp5faVQ+bTBpg4A@mail.gmail.com>
 <042a2183-3f04-088c-1861-656de870337d@gmail.com> <CAK8P3a3owi7YWmq-tckD-C7NK5HaX+swGNW-QBkWQuQgVsVWrA@mail.gmail.com>
 <d74ab454-9337-d168-9b21-842569431b4a@gmail.com>
In-Reply-To: <d74ab454-9337-d168-9b21-842569431b4a@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 9 Feb 2022 16:18:45 +0100
X-Gmail-Original-Message-ID: <CAK8P3a20mwJXN4Mb063zQG+HAevj_Odpj58EzPHkX-p6pbtnGA@mail.gmail.com>
Message-ID: <CAK8P3a20mwJXN4Mb063zQG+HAevj_Odpj58EzPHkX-p6pbtnGA@mail.gmail.com>
Subject: Re: [PATCH 2/3] i2c: sh_mobile: Use platform_get_irq_optional() to
 get the interrupt
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Linux-sh list <linux-sh@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:dQBJIFZTK9zwJLYqmqEGtwvJT36W2YcbFpcMZrBBJ0xvhxJUmpA
 hUV34FTZb1X5/+oTtjTILgFEr120S4BaJpvPJVtMzyTXzPd4B9vJPqq0KpuvokCHnEuDQiH
 LY0YIz3LSwTAB8usE4RUEI/4aCU/LBeOG8Kd92GX/CgldDiyQ8lPRWmCkThcDErm3FWBT88
 gbXlkzh0WQLKMiQ8mU6qQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tR737zmlJjw=:0tHcA+TTCFpWfT1uhePcI/
 D2MfeUGm+3phGJpaMQvMwfvV5M/eOHqNrM6fusvtlWnBpy6kcYYbXa07hBlgR+ppWOZ5bveRm
 8Q0osF1hBODDpROXrEQsijM9ECikMHBNkH6JXcHZDr7qFfBiQhtGqUfjv/7yjUD2p0vNksCze
 feJ/4kfP3OkJDKoPTJ+/Yj6//WNv3pgfFmdPnvu/39K2xjm6JgUiE5RSRL54aRXc6ZYyVo0aJ
 PoiDhuoXxBT73WBqhO9srA7tsrlM6aFudYKkZDWSl0M17XYSS1xMF2e16p0ngk5lSK1314R1D
 AMtj/rpnc9sr5SdjxVB8JE0Ng0PaoWjyTQXpN5jkEjPTFiC7OjsezubwbRdlGgz9h++Ns9mil
 YmB0j9ZEoplISzcLp1FplGHYGk6HnwQYfCOk/mQj+uPOjc5OJTyhA63aWoguDyc04NPViHKCA
 sIxcq4v1Mu++PPyRdzOMeyIT/UtCzzMXwOmlzRFIzGy6M3Sej4uxBCF2rOwzDdFavcqp5Qou6
 RxlzCcMdWul6/ZU/JSAaEtHngVuibga8bgcCIsv9AcCSQw9eaoeG+3CJnEISrtVyZGWZdVLyt
 wmk8DRbXqooL+lyTW/LfAOBuh+X0VBcLMaYEwsrsHHO2/73Ubbdc7m+G3V0CEn2u21pA8tMr9
 HfCHLKjyqSpgAq0KG4gJt60THytDeSWgwAj5WT6tu4/596LSMc83iYBt+cJK9EM/7RtQ=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Feb 9, 2022 at 4:11 PM Sergei Shtylyov
<sergei.shtylyov@gmail.com> wrote:
>
> On 2/8/22 3:31 PM, Arnd Bergmann wrote:
>
> [...]
> >>> I might have missed something, but it seems the only user of IRQ 0 on
> >>> SuperH is smsc911x Ethernet in arch/sh/boards/board-apsh4a3a.c and
> >>> arch/sh/boards/board-apsh4ad0a.c, which use evt2irq(0x200).
> >>> These should have been seeing the "0 is an invalid IRQ number"
> >>> warning splat since it was introduced in commit a85a6c86c25be2d2
> >>> ("driver core: platform: Clarify that IRQ 0 is invalid"). Or not:
> >>
> >>     Warning or no warning, 0 is still returned. :-/
> >>     My attempt to put an end to this has stuck waiting a review from the IRQ
> >> people...
> >
> > I had another look at this after you asked about it on IRC. I don't
> > know much SH assembly, but I suspect IRQ 0 has not been delivered
> > since 2009 after 1e1030dccb10 ("sh: nmi_debug support."). On a
>
>    Mhm... this commit changes the SH3 code while SH778x are SH4A, no?

This code is shared between both:

arch/sh/kernel/cpu/sh4/Makefile:common-y        += $(addprefix
../sh3/, entry.o ex.o)

       Arnd
