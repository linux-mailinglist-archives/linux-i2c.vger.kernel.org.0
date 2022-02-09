Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CDC6B4B00CC
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Feb 2022 23:58:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236629AbiBIW5V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Feb 2022 17:57:21 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:38772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236730AbiBIW5U (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Feb 2022 17:57:20 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0791E04FF0E;
        Wed,  9 Feb 2022 14:57:17 -0800 (PST)
Received: from mail-wr1-f50.google.com ([209.85.221.50]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MJFpj-1ncUka4Bwp-00Kg3E; Wed, 09 Feb 2022 23:57:16 +0100
Received: by mail-wr1-f50.google.com with SMTP id k1so6462532wrd.8;
        Wed, 09 Feb 2022 14:57:15 -0800 (PST)
X-Gm-Message-State: AOAM531OxbqUDbiD8ccEUA6VLQ5DtT2saq1TFCuWx+hNsGSz0C0UgMO8
        9Rpy7XZpSVSNUwmaSi46bjAW7lkKdUPxKguXHvM=
X-Google-Smtp-Source: ABdhPJx6k5SzHUiKxbi22X3ArFfHWnfD1uhdVPHGLwKUVBYNri0Ph5zCMFRBWOFFi/ShRb6G6dCKxmJXRqnm6B99V9s=
X-Received: by 2002:a05:6000:178d:: with SMTP id e13mr3797888wrg.317.1644447435616;
 Wed, 09 Feb 2022 14:57:15 -0800 (PST)
MIME-Version: 1.0
References: <20211218165258.16716-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211218165258.16716-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUg3=q7gyaVHP0XcYUOo3PQUUv8Hc8wp5faVQ+bTBpg4A@mail.gmail.com>
 <042a2183-3f04-088c-1861-656de870337d@gmail.com> <CAK8P3a3owi7YWmq-tckD-C7NK5HaX+swGNW-QBkWQuQgVsVWrA@mail.gmail.com>
 <d74ab454-9337-d168-9b21-842569431b4a@gmail.com> <CAK8P3a20mwJXN4Mb063zQG+HAevj_Odpj58EzPHkX-p6pbtnGA@mail.gmail.com>
 <7c47ce67-88ee-9cba-3356-a530b0d3e657@gmail.com> <CAK8P3a0gf6TeK2vZ+u3NZ2VrrvrGUohAPz5WiZ4Mbk5QQg9FFg@mail.gmail.com>
 <9a07be5a-914b-cec9-f6bc-8c1b0ecef766@gmail.com>
In-Reply-To: <9a07be5a-914b-cec9-f6bc-8c1b0ecef766@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Wed, 9 Feb 2022 23:56:59 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3wOxRdGJfDx86WiNwFvbK=wXYCtPoS-DQKqyYfHZiMjw@mail.gmail.com>
Message-ID: <CAK8P3a3wOxRdGJfDx86WiNwFvbK=wXYCtPoS-DQKqyYfHZiMjw@mail.gmail.com>
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
X-Provags-ID: V03:K1:iz4osL0LS/CVwD/e5yrQnoMN5iG7QTanvYybME2u+hzIbUJrl8k
 SXJurOPxymVZf+kuK3k8lwyHGylgPOYeAGSXatMOAxPCIn96aBYoB4Qgh2cQIHjghA7uNsp
 UlcLVhcoGpZBirw9Yo12SkJK453F/fRkQ3tcAtNgRBleprYmqdtKHE+f4xjX36ThU14tpGz
 /Kk+J+w4EtklWFEXlJajQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fsFsCFBlECc=:RkXJd5cyMagMVbYd1HFAmX
 VPWo5iFnBW6yuIUnu0wlIx01Lur2D9szeda7iwfPXy7gavOpIk7L2jPgXaUG3Y8B9JzWlsODo
 cwXN/TavqXTZH7rwWN93xxWnpiBEW44Ybf+z4Eo48byU9A6wu2YyfZTiTC94pI6JzNgT2xziL
 vMXnntK6A8Ux1xd4x3aEWGJZa3giFHe0Aso5TgtNUuPs66YmVFuXTGtGV91SEmmYpe4+hH8bA
 sboyRG8ztwE++qAnoK1BMmWTcuwf3bOQfJHUkwReJzcJeRlkePAmEq6dK29wwGXGk82RsFj2Z
 lEeWhOSgWm3YyhdKJinVBOhBbsaimilPafvScJ0Pgb5LapmR4LgWOTykyWMOpGipsUueI7mkO
 9N5Uu6xG8jcpysphDIBupP/z74J0K2k19ZpBjO+6PeWMvXisR1RswYs4EM30khVjjKFAdW3+1
 q7pczo1+T6NFnREnTdo/80fnIhgMZsCWxSy3L9GVosl6SSebQQOoarSeKxrmmgG8QKA6okuCL
 gAfYEGDLoUfJZZzo/73cbZ3t0oLoxZF31aGYD7J2+1hTg9jWm/cxc5LXYwgZQZLJS3QFHOA9l
 ediB0FUmDK3BlRtuxtkfAXHbO02+kBaESaYTCxbXQRo7blTcinhhuxnXWi3kFbEKIA9yrpbgX
 bKOewf6sDaEaKBxOc8+EWDZJk/9hj5r8kVGMAxHkkn8Lr9Sxv3T5/kWfP7JdrSW7IdPY=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Feb 9, 2022 at 5:08 PM Sergei Shtylyov
<sergei.shtylyov@gmail.com> wrote:
> On 2/9/22 7:02 PM, Arnd Bergmann wrote:
> >
> > +       shlr2   r4
> > +       shlr    r4
> > +       mov     r4, r0          ! save vector->jmp table offset for later
> > +
> > +       shlr2   r4              ! vector to IRQ# conversion
> > +       add     #-0x10, r4
> > +
> > +       cmp/pz  r4              ! is it a valid IRQ?
> > +       bt      10f
> >
> > gets the vector (0x200 for this device), shifts it five bits to 0x10,
> > and subtracts 0x10,
> > then branches to do_IRQ if the interrupt number is non-zero, otherwise it goes
> > through the exception_handling_table.
>
>    The SH4 manual I found on my disk (have it from MontaVista times) tells me cmp/pz
> sets T if Rn is >= 0, then bt branches if T = 1. So I do think the code is correct.
>    One more thing: the board code for those boards was added in 2011, we can assume
> it was working back then, right? :-_

Indeed, this does make more sense, I had not realized that the numbers could get
negative here.

         Arnd
