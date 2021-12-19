Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E0E547A018
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Dec 2021 10:53:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235519AbhLSJxK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 19 Dec 2021 04:53:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbhLSJxJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 19 Dec 2021 04:53:09 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CBAEC061574;
        Sun, 19 Dec 2021 01:53:09 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id v203so19670673ybe.6;
        Sun, 19 Dec 2021 01:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rQy98157VCXxailMB3OKe9xQTqZtJID4MSHHuD+ZMVE=;
        b=k8ttBwJ2ch3L2ku9kNpnsqC0Q7NVHZkdCSDqx5MBe8p1PYZK4kZzrWzDBj8H3QM0ds
         cdXWEH5/8o7OSWBkek22dihzqEraLEdZ+D35IYe4p/tu2IVrJu5YdHtS1EBdBfSscoJt
         +BcxXnXFhkEBedL5IZGJ1aYAWhVkn24OoqGSEox6rPUDgh8fcspsk0AT+qhMIX/wljG6
         njKvaY/jdMsmvjE3gTf79QjdaXXzdmHFD4Z2rMnx48V0n95gl6j0lLubsWisxJkPlRT/
         d1ETb3UpMBsV9tprKzXFyxmosTeO9qqKKrfA8AFcRQ4Fl6cktId6JeqUmqRr+3usFZ+r
         F4nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rQy98157VCXxailMB3OKe9xQTqZtJID4MSHHuD+ZMVE=;
        b=zz2ReTUSqFch8y9oiDOnbkdcRwh2Lm0vveA3jSlPrDcnOK0F73jnNvK5nApeZ7xuzF
         F92TbCE8RGMuml/6wrkIbYmA93bPy7pIUfE6zvAmQd+8vSjult2MvHDQQPRGiFgWXvPK
         ACKdPsFsggmNxFba640GlkQpuCb4yZuPXFT/luOpWLZiMeXb3KAFIteVE6jEnbYss1Sp
         DMNtlS0S/+28Tvgc2pM3xdY8ptO3r+NLVQchgnSIPyGgAq7hNU9aiNMNRj/MbXGMGVPp
         Q9dszMTeBOSxc9GPRzj2PnPD6ewK8cVxtLvZHJRXAwfmRJFm74LZawv8oMrHf+MkoWo2
         F4tQ==
X-Gm-Message-State: AOAM530nX9lCZn7D6FtUKSAAl43HtNIIGuTFEB+v2uXxqaU0l0EEU/bM
        WjF4v5HAsCnVLPkCVJpVQXODbkkJqRc/tdtYZjo=
X-Google-Smtp-Source: ABdhPJwwUMaZimLMR3lbhPwW2EQ9i0quXz8lr7P5fHsQ8RE+4mqp6h3fkS59sK3CJW40LYkyT0rzyyh3Mf/Asodxpr0=
X-Received: by 2002:a25:dc4d:: with SMTP id y74mr15202812ybe.422.1639907588560;
 Sun, 19 Dec 2021 01:53:08 -0800 (PST)
MIME-Version: 1.0
References: <20211218165258.16716-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211218165258.16716-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <a02d76dc-52cc-3ecc-5ef7-825c3167431a@gmail.com> <CA+V-a8ug-7i7H=pc4j+WtL8ARC6UVhxaeJ1Db23s_yEFTSu8pw@mail.gmail.com>
In-Reply-To: <CA+V-a8ug-7i7H=pc4j+WtL8ARC6UVhxaeJ1Db23s_yEFTSu8pw@mail.gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sun, 19 Dec 2021 09:52:42 +0000
Message-ID: <CA+V-a8v8RLCEphjyNxCn+BRaqudwoLxJibjp1ZG5GEv4htNK9g@mail.gmail.com>
Subject: Re: [PATCH 1/3] i2c: bcm2835: Use platform_get_irq() to get the interrupt
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Chris Brandt <chris.brandt@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        linux-rpi-kernel@lists.infradead.org,
        LAK <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Florian,

On Sat, Dec 18, 2021 at 10:44 PM Lad, Prabhakar
<prabhakar.csengg@gmail.com> wrote:
>
> Hi Florian,
>
> Thank you for the review.
>
> On Sat, Dec 18, 2021 at 9:17 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
> >
> >
> >
> > On 12/18/2021 8:52 AM, Lad Prabhakar wrote:
> > > platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> > > allocation of IRQ resources in DT core code, this causes an issue
> > > when using hierarchical interrupt domains using "interrupts" property
> > > in the node as this bypasses the hierarchical setup and messes up the
> > > irq chaining.
> > >
> > > In preparation for removal of static setup of IRQ resource from DT core
> > > code use platform_get_irq().
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Just one nit below:
> > > ---
> > >   drivers/i2c/busses/i2c-bcm2835.c | 11 ++++-------
> > >   1 file changed, 4 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
> > > index 37443edbf754..d63dec5f3cb1 100644
> > > --- a/drivers/i2c/busses/i2c-bcm2835.c
> > > +++ b/drivers/i2c/busses/i2c-bcm2835.c
> > > @@ -402,7 +402,7 @@ static const struct i2c_adapter_quirks bcm2835_i2c_quirks = {
> > >   static int bcm2835_i2c_probe(struct platform_device *pdev)
> > >   {
> > >       struct bcm2835_i2c_dev *i2c_dev;
> > > -     struct resource *mem, *irq;
> > > +     struct resource *mem;
> > >       int ret;
> > >       struct i2c_adapter *adap;
> > >       struct clk *mclk;
> > > @@ -452,12 +452,9 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
> > >               return ret;
> > >       }
> > >
> > > -     irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> > > -     if (!irq) {
> > > -             dev_err(&pdev->dev, "No IRQ resource\n");
> > > -             return -ENODEV;
> > > -     }
> > > -     i2c_dev->irq = irq->start;
> > > +     i2c_dev->irq = platform_get_irq(pdev, 0);
> > > +     if (i2c_dev->irq <= 0)
> > > +             return i2c_dev->irq ? i2c_dev->irq : -ENXIO;
> >
> > Why not just check for a negative return code and propagate it as is?
> >
> platform_get_irq() may return 0 said that we do get a splat in this
> case and further request_irq() will fail so instead check it here.
>
My bad, just the negative check should suffice.

Cheers,
Prabhakar
