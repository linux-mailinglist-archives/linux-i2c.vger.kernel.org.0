Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4A6C4AD8B1
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 14:15:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243680AbiBHNPh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 08:15:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347086AbiBHMgh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 07:36:37 -0500
X-Greylist: delayed 306 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 08 Feb 2022 04:36:32 PST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A163CC03FEC0;
        Tue,  8 Feb 2022 04:36:32 -0800 (PST)
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MeCd5-1nrZkY0I59-00bKxJ; Tue, 08 Feb 2022 13:31:25 +0100
Received: by mail-wr1-f54.google.com with SMTP id i15so8045233wrb.3;
        Tue, 08 Feb 2022 04:31:24 -0800 (PST)
X-Gm-Message-State: AOAM533fnZdpP2AwchPqGk1Dbv8V5VnCruO3LQjkRqZX4uJOuWdES+Ae
        x3QtpAS4A7jKgoPGlnzmPhCQkD0GVWPC5FFv6is=
X-Google-Smtp-Source: ABdhPJwjh+iPDutKVoomV+unhCPIxYaBfo3+/C6V9s9/YsnzEY7RKbIpI3TmFrilYu/3zyKr/YPI7OskgWVLlPCf7Is=
X-Received: by 2002:a05:6000:3c6:: with SMTP id b6mr3354375wrg.12.1644323484543;
 Tue, 08 Feb 2022 04:31:24 -0800 (PST)
MIME-Version: 1.0
References: <20211218165258.16716-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211218165258.16716-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUg3=q7gyaVHP0XcYUOo3PQUUv8Hc8wp5faVQ+bTBpg4A@mail.gmail.com> <042a2183-3f04-088c-1861-656de870337d@gmail.com>
In-Reply-To: <042a2183-3f04-088c-1861-656de870337d@gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 8 Feb 2022 13:31:08 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3owi7YWmq-tckD-C7NK5HaX+swGNW-QBkWQuQgVsVWrA@mail.gmail.com>
Message-ID: <CAK8P3a3owi7YWmq-tckD-C7NK5HaX+swGNW-QBkWQuQgVsVWrA@mail.gmail.com>
Subject: Re: [PATCH 2/3] i2c: sh_mobile: Use platform_get_irq_optional() to
 get the interrupt
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
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
X-Provags-ID: V03:K1:OW1Lh6CTJ007cKq7X22hpR29N5b9uv6n+9VwIxZK1DM7wwzUNob
 vPVIWoa3wrrTa/U0a+QDJvjUjmfBvH3QI+oUIxVpqyP5XAbeqLNhIGhbj6/jF6RwHTnt3sW
 gkYhtJcZvLODUNSzoR9lWTr31flYOPvSjfokiNaC0uwvG+OAhqdc8QiBX8K2YRCPEY4TPd0
 58TB51npdbZ5KDSlCb25w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vRHoiAS8jqE=:xYejVhw5wpobxIC1gYyBRA
 ER0znej4HBEw1Xan1dD8GNvpukMTiBKmAhJZqtdaCfgufrI7t8ysgoFyUWZqDhOprip2wqSl5
 3Sj+7aeKCCG2VmGAG228oo5CzSp6w9owFrYIR1Cfk8dfSnZMIeeu3hHXLX5KupFMNtBRsoYPJ
 fK0L1pNx/QldLHdYdBUnfcBOKNApG06EKAhlly3up/4D/S9ddjr0/BCCV0e95sTqemx4OB++F
 5jV6XMX4djyYwKap9lYRtXAiqZaUr559nSX/QpTSnshKSBKiQzZhRkCYOwdOTj1d+xWsDM/By
 X5b6UxwCo7oxQMwNuY6g9NeK4+1aspGYDepcCKWcbo7AwkuE9bdmSzrUr+63RADdBB8Q83huk
 j/sYeD0v0sYFrWnGrYtkCiXUi1rbF+GRm0rwYws/XMKd4Y7yYTdvGvDZjY6fzyEW4JToBkkI2
 erQ5/AtuIPr5xuIJPwIJT18sH6PhAA8PX3KhEOX6N2SBOiJuDOu74J0LfGz2o6zydulbvWX/k
 xJlVrD25cfMXmRh31e2tAbKiKsR6W/hK2lobL5GP+Jz7L6GhnJ+jpzqgtarjv4xCCBzlSXoLR
 YFzkEMWgBiLXlD/ZG4/PXRPZ7tkuTLjFmmLilbvlFejOGOd2o4SYJQRSnPSxHACJMmwvT0spo
 ClCbn9S3zbEHHajGzZZuZeyzDvYtyhPnVHz9IsO+MzhGTuz7Jm4qd01qE3cmYQnSclcSMyjfq
 QlysV+lrVSTDfKETnhveMZpRVZcmBYWUwciuQHGQkJaDP/ZouMgKE8Zh1PzXlIaH2cYK8c6ts
 tqsCSQpWReHj+OBbNCb2dWs8wOB8H+dNosmOpt4QbZwKKhwFqE=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Dec 20, 2021 at 12:53 PM Sergei Shtylyov
<sergei.shtylyov@gmail.com> wrote:
> On 20.12.2021 13:17, Geert Uytterhoeven wrote:
>
> > I might have missed something, but it seems the only user of IRQ 0 on
> > SuperH is smsc911x Ethernet in arch/sh/boards/board-apsh4a3a.c and
> > arch/sh/boards/board-apsh4ad0a.c, which use evt2irq(0x200).
> > These should have been seeing the "0 is an invalid IRQ number"
> > warning splat since it was introduced in commit a85a6c86c25be2d2
> > ("driver core: platform: Clarify that IRQ 0 is invalid"). Or not:
>
>     Warning or no warning, 0 is still returned. :-/
>     My attempt to put an end to this has stuck waiting a review from the IRQ
> people...

I had another look at this after you asked about it on IRC. I don't
know much SH assembly, but I suspect IRQ 0 has not been delivered
since 2009 after 1e1030dccb10 ("sh: nmi_debug support."). On a
related note, CONFIG_INTC_BALANCING was broken in 2be6bb0c79c7
("sh: intc: Split up the INTC code.") by inadvertently removing the Kconfig
symbol.

        Arnd
