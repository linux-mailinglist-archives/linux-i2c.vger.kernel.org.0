Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0C7479175
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 17:26:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239110AbhLQQ0b convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Fri, 17 Dec 2021 11:26:31 -0500
Received: from mail-0301.mail-europe.com ([188.165.51.139]:50599 "EHLO
        mail-0301.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238005AbhLQQ0a (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Dec 2021 11:26:30 -0500
Date:   Fri, 17 Dec 2021 16:26:24 +0000
Authentication-Results: mail-4018.proton.ch; dkim=none
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
From:   conor dooley <mail@conchuod.ie>
Cc:     Conor.Dooley@microchip.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, a.zummo@towertech.it,
        alexandre.belloni@bootlin.com, broonie@kernel.org,
        gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-crypto@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        geert@linux-m68k.org, bin.meng@windriver.com, heiko@sntech.de,
        Lewis.Hanly@microchip.com, Daire.McNamara@microchip.com,
        Ivan.Griffin@microchip.com, atish.patra@wdc.com
Reply-To: conor dooley <mail@conchuod.ie>
Subject: Re: [PATCH v2 06/17] dt-bindings: rng: add bindings for microchip mpfs rng
Message-ID: <r3tVOER8Xt_7UX5NRWualG_an6bcx-_uljhXh9_GUny45ZcO_G-dpv98jWXwKpuvSp-uTvNFSdqsLHFbYGl0Qdv_q7ZqegBHWWcgnAZUA5A=@conchuod.ie>
In-Reply-To: <2e7588e5-9dc5-571f-d7e9-0ee5c89ab39e@canonical.com>
References: <20211217093325.30612-1-conor.dooley@microchip.com> <20211217093325.30612-7-conor.dooley@microchip.com> <e59a60d5-4397-1f7f-66ab-3dd522e166a0@canonical.com> <19cbe2ba-7df5-7c7c-289f-6dc419d9f477@canonical.com> <422126ac-ce26-2940-5b4d-fe79a1fa89c5@microchip.com> <2e7588e5-9dc5-571f-d7e9-0ee5c89ab39e@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-1.0 required=10.0 tests=ALL_TRUSTED shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

‐‐‐‐‐‐‐ Original Message ‐‐‐‐‐‐‐

On Friday, December 17th, 2021 at 15:47, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:

> On 17/12/2021 16:22, Conor.Dooley@microchip.com wrote:
>
> > On 17/12/2021 15:07, Krzysztof Kozlowski wrote:
> >
> > > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> > >
> > > On 17/12/2021 15:53, Krzysztof Kozlowski wrote:
> > >
> > > > On 17/12/2021 10:33, conor.dooley@microchip.com wrote:
> > > >
> > > > > From: Conor Dooley conor.dooley@microchip.com
> > > > >
> > > > > Add device tree bindings for the hardware rng device accessed via
> > > > >
> > > > > the system services on the Microchip PolarFire SoC.
> > > > >
> > > > > Signed-off-by: Conor Dooley conor.dooley@microchip.com
> > > > > ------------------------------------------------------
> > > >
> > > > Three topics:
> > > >
> > > > 1.  Node name (as most of others are using): rng
> > > > 2.  skip the label, not helping in example.
> > > > 3.  This looks very simple, so I wonder if the bindings are complete. No
> > > >
> > > >     IO space/address... How is it going to be instantiated?
> > > OK, now I saw the usage in DTS. I have doubts this makes sense as
> > > separate bindings. It looks like integrated part of syscontroller, so
> > > maybe make it part of that binding? Or at least add ref to syscontroller
> > > bindings that such child is expected.
> > Acking the rest of this, re: adding the ref: is what is being done in
> > patch 03/17 insufficient?
> Ops, I missed the 03/17. Yeah, it looks it is sufficient and in such
> case I think you do not need this patch. The compatible is documented in
> 03/17. The same for sysserv.
Grand, that makes things easier.
Conor.
>
> Best regards,
>
> Krzysztof
>
> linux-riscv mailing list
>
> linux-riscv@lists.infradead.org
>
> http://lists.infradead.org/mailman/listinfo/linux-riscv
