Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE66479E04
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Dec 2021 23:44:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbhLRWoo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 18 Dec 2021 17:44:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbhLRWoo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 18 Dec 2021 17:44:44 -0500
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D16DC061574;
        Sat, 18 Dec 2021 14:44:44 -0800 (PST)
Received: by mail-yb1-xb36.google.com with SMTP id f9so16957587ybq.10;
        Sat, 18 Dec 2021 14:44:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oR2/g5SHX/7AzDsbBtFtnuNquA0HpFQeJhpGblN2hTQ=;
        b=Y4UFTVGGd/2MCl1XG7InHQnIyQKP8QDPjuYHuFSHw56frLno++pKfhH3sTYSHK9nAB
         SLLy+heNBTUa8e0gyqJcmPlneGyDNjzOfs2K4KgzXvjHyd0+/PM/HO5LLyqWl140sHb2
         /rLmah5dOdlJHp+dYcKIIrNV+R/qY1a9UYr5RkUOkjwFxVGQ6ruN6/Srxu5QMaZpYObg
         TWzP4HPsf5hvmqKsQW+9HZ4m05qYMw4CGMQ8LQfXrY1/hW9WjHDHCqDf99ptkJE6IYVv
         H0WXufNUhviMKXWKF546gdAym8Dh7gA0SQ0VH7iWXNKDIxBS35aUk8FWUpl35dx6LSNs
         gJAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oR2/g5SHX/7AzDsbBtFtnuNquA0HpFQeJhpGblN2hTQ=;
        b=ibGumOj/6dIunTZMQSKFr5aBopSbKEUrdgkQrYYcZcAYi+gFjoXJm/mrK3K6vQHY5q
         v2xwCvBTsXByv8GgWgBXbXizW1YBSJXiwN+A7cbBccU2f6heYefKaArdkMuo2yQ7nv9d
         D5h0NldBFJn82zSpogxy2nrciJrkv2Y7QKTokAADANMnbOUWdyF+msQM29723n13eJAC
         CHTkR8xn5pasrshXZZmQoacntnq9BmNYzLyscdz7L5EVmvp8IPFo3EUYMmSsafa427tP
         nGcMnot7xhw5DbeoQLWGeZgVV9kAddUNW7NoMD4S6m/aOmKYSLOq2Px7sdxe46jRGgT3
         Pivg==
X-Gm-Message-State: AOAM531t/Get8Ds91SjhM+7CIoim1TEXw1ikbOIQsaGBOr2oy9vxGPhm
        Ku9etAwePzr8eI3nBTAOfsReTBNLVZ7lwIJgvQY=
X-Google-Smtp-Source: ABdhPJw0X8nS4pp+fFkVDR9kAgz+FQxNB/i6DsmNLMKD0Xp/0lGJYb8Lei/NQcHsuxK6NZ8eFKl9bKU91Z6oZq8JrqQ=
X-Received: by 2002:a25:abe3:: with SMTP id v90mr12630478ybi.315.1639867483041;
 Sat, 18 Dec 2021 14:44:43 -0800 (PST)
MIME-Version: 1.0
References: <20211218165258.16716-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211218165258.16716-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <a02d76dc-52cc-3ecc-5ef7-825c3167431a@gmail.com>
In-Reply-To: <a02d76dc-52cc-3ecc-5ef7-825c3167431a@gmail.com>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Sat, 18 Dec 2021 22:44:16 +0000
Message-ID: <CA+V-a8ug-7i7H=pc4j+WtL8ARC6UVhxaeJ1Db23s_yEFTSu8pw@mail.gmail.com>
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

Thank you for the review.

On Sat, Dec 18, 2021 at 9:17 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
>
>
>
> On 12/18/2021 8:52 AM, Lad Prabhakar wrote:
> > platform_get_resource(pdev, IORESOURCE_IRQ, ..) relies on static
> > allocation of IRQ resources in DT core code, this causes an issue
> > when using hierarchical interrupt domains using "interrupts" property
> > in the node as this bypasses the hierarchical setup and messes up the
> > irq chaining.
> >
> > In preparation for removal of static setup of IRQ resource from DT core
> > code use platform_get_irq().
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Just one nit below:
> > ---
> >   drivers/i2c/busses/i2c-bcm2835.c | 11 ++++-------
> >   1 file changed, 4 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
> > index 37443edbf754..d63dec5f3cb1 100644
> > --- a/drivers/i2c/busses/i2c-bcm2835.c
> > +++ b/drivers/i2c/busses/i2c-bcm2835.c
> > @@ -402,7 +402,7 @@ static const struct i2c_adapter_quirks bcm2835_i2c_quirks = {
> >   static int bcm2835_i2c_probe(struct platform_device *pdev)
> >   {
> >       struct bcm2835_i2c_dev *i2c_dev;
> > -     struct resource *mem, *irq;
> > +     struct resource *mem;
> >       int ret;
> >       struct i2c_adapter *adap;
> >       struct clk *mclk;
> > @@ -452,12 +452,9 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
> >               return ret;
> >       }
> >
> > -     irq = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> > -     if (!irq) {
> > -             dev_err(&pdev->dev, "No IRQ resource\n");
> > -             return -ENODEV;
> > -     }
> > -     i2c_dev->irq = irq->start;
> > +     i2c_dev->irq = platform_get_irq(pdev, 0);
> > +     if (i2c_dev->irq <= 0)
> > +             return i2c_dev->irq ? i2c_dev->irq : -ENXIO;
>
> Why not just check for a negative return code and propagate it as is?
>
platform_get_irq() may return 0 said that we do get a splat in this
case and further request_irq() will fail so instead check it here.

Cheers,
Prabhakar
