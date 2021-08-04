Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03AD23E0603
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Aug 2021 18:35:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbhHDQfm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Aug 2021 12:35:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:54516 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229912AbhHDQfl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 4 Aug 2021 12:35:41 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EE35C60FC4;
        Wed,  4 Aug 2021 16:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628094929;
        bh=ZiiDEhR2LOIcPd/6Phi/U+sJK+O+1mkNZ8aCcbOJpT4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hl519HE5lVVI3Wla/X7yRIbgWlUc5zA4sXTYFcALz+uJCqLilPHkN8ti+Y88gDdTP
         62lU0FOV4pCoVBtqi+NQh4re09ohqqsBhmNTTOKwZZ+ChC1gRQk/ddz8+/wpx9RhPU
         HouPxjV0s69Fx8yiakwjzFR6dNaC0ZL8vYapnax8xbM5L05lx8jg8DlI0pf2t50P2s
         sbk+HeQQYF+msf+0gaH0vvhE1rw8FRFmsVI8JgTNlgysTh9rbsShlMovUubCjW0sO8
         UkDPbYxa3nVNi9YW3thntAr++SsGGbKg9E1JwndNY9PDQvskv5RCJIiCOoGGunptNd
         S97U2y4Y/9jfg==
Received: by mail-ed1-f45.google.com with SMTP id y12so4333266edo.6;
        Wed, 04 Aug 2021 09:35:28 -0700 (PDT)
X-Gm-Message-State: AOAM530yfQUkPmKnlsLgHINJRSs1hUdjVsgnaCOvnKjbjORXKUcAqdIC
        bGiJP9ZRPBvoZ76y/ShvOmghfyCXkmjP/mzrHA==
X-Google-Smtp-Source: ABdhPJyLltRHiJUHDShCQfQpCNb3aMYPOGVtFSrX1w/GZ2S95G11LI5x9+Qyip9GIogZrHXjJXyVl+09iOfK8fUZOiI=
X-Received: by 2002:a05:6402:291d:: with SMTP id ee29mr712131edb.289.1628094927462;
 Wed, 04 Aug 2021 09:35:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210727160315.15575-1-eajames@linux.ibm.com> <20210727160315.15575-3-eajames@linux.ibm.com>
 <YQhZimPDbNJk5nbR@robh.at.kernel.org> <29d72be98ebe3e5761f4c3da7b4daf2f05fbbf3b.camel@linux.ibm.com>
 <209d9f68-e6c4-68c9-d495-d7e3f5050440@axentia.se> <CAL_JsqLFC7vjMvZ3o6ey=thf=ZHsqApdT69e6akLvs0ceb8m1w@mail.gmail.com>
 <8b4fc37178449e99c2f7a9d23429b7fb4bc13de4.camel@linux.ibm.com>
In-Reply-To: <8b4fc37178449e99c2f7a9d23429b7fb4bc13de4.camel@linux.ibm.com>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 4 Aug 2021 10:35:14 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJf_9QJf=tvb6r5xWTe+idAEB+sMyUa-f4Ts-De90FyCQ@mail.gmail.com>
Message-ID: <CAL_JsqJf_9QJf=tvb6r5xWTe+idAEB+sMyUa-f4Ts-De90FyCQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: mux: pca954x: Support multiple devices on a
 single reset line
To:     Eddie James <eajames@linux.ibm.com>
Cc:     Peter Rosin <peda@axentia.se>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 4, 2021 at 9:12 AM Eddie James <eajames@linux.ibm.com> wrote:
>
> On Wed, 2021-08-04 at 07:28 -0600, Rob Herring wrote:
> > On Wed, Aug 4, 2021 at 1:50 AM Peter Rosin <peda@axentia.se> wrote:
> > > On 2021-08-02 23:51, Eddie James wrote:
> > > > On Mon, 2021-08-02 at 14:46 -0600, Rob Herring wrote:
> > > > > On Tue, Jul 27, 2021 at 11:03:15AM -0500, Eddie James wrote:
> > > > > > Some systems connect several PCA954x devices to a single
> > > > > > reset
> > > > > > GPIO. For
> > > > > > these devices to get out of reset and probe successfully,
> > > > > > each
> > > > > > device must
> > > > > > defer the probe until the GPIO has been hogged. Accomplish
> > > > > > this by
> > > > > > attempting to grab a new "reset-shared-hogged" devicetree
> > > > > > property,
> > > > > > but
> > > > > > expect it to fail with EPROBE_DEFER or EBUSY.
> > > > > >
> > > > > > Signed-off-by: Eddie James <eajames@linux.ibm.com>
> > > > > > ---
> > > > > >  drivers/i2c/muxes/i2c-mux-pca954x.c | 46
> > > > > > +++++++++++++++++++++++
> > > > > > ------
> > > > > >  1 file changed, 37 insertions(+), 9 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c
> > > > > > b/drivers/i2c/muxes/i2c-mux-pca954x.c
> > > > > > index 4ad665757dd8..376b54ffb590 100644
> > > > > > --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> > > > > > +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> > > > > > @@ -434,15 +434,43 @@ static int pca954x_probe(struct
> > > > > > i2c_client
> > > > > > *client,
> > > > > >     i2c_set_clientdata(client, muxc);
> > > > > >     data->client = client;
> > > > > >
> > > > > > -   /* Reset the mux if a reset GPIO is specified. */
> > > > > > -   gpio = devm_gpiod_get_optional(dev, "reset",
> > > > > > GPIOD_OUT_HIGH);
> > > > > > -   if (IS_ERR(gpio))
> > > > > > -           return PTR_ERR(gpio);
> > > > > > -   if (gpio) {
> > > > > > -           udelay(1);
> > > > > > -           gpiod_set_value_cansleep(gpio, 0);
> > > > > > -           /* Give the chip some time to recover. */
> > > > > > -           udelay(1);
> > > > > > +   /*
> > > > > > +    * Grab the shared, hogged gpio that controls the mux
> > > > > > reset. We
> > > > > > expect
> > > > > > +    * this to fail with either EPROBE_DEFER or EBUSY. The
> > > > > > only
> > > > > > purpose of
> > > > > > +    * trying to get it is to make sure the gpio controller
> > > > > > has
> > > > > > probed up
> > > > > > +    * and hogged the line to take the mux out of reset,
> > > > > > meaning
> > > > > > that the
> > > > > > +    * mux is ready to be probed up. Don't try and set the
> > > > > > line any
> > > > > > way; in
> > > > > > +    * the event we actually successfully get the line (if it
> > > > > > wasn't
> > > > > > +    * hogged) then we immediately release it, since there is
> > > > > > no
> > > > > > way to
> > > > > > +    * sync up the line between muxes.
> > > > > > +    */
> > > > > > +   gpio = gpiod_get_optional(dev, "reset-shared-hogged", 0);
> > > > > > +   if (IS_ERR(gpio)) {
> > > > > > +           ret = PTR_ERR(gpio);
> > > > > > +           if (ret != -EBUSY)
> > > > > > +                   return ret;
> > > > >
> > > > > Why can't you just do this with the existing 'reset-gpios'
> > > > > property?
> > > > > What's the usecase where you'd want to fail probe because EBUSY
> > > > > other
> > > > > than an error in your DT.
> > > >
> > > > Hi, thanks for the reply.
> > > >
> > > > Are you suggesting I use "reset-gpios" and change the driver to
> > > > ignore
> > > > EBUSY? I don't know any other usecase, I just didn't think it
> > > > would be
> > > > acceptable to ignore EBUSY on that, but perhaps it is a better
> > > > solution.
> > >
> > > Hi!
> > >
> > > From a device-tree point of view that might seem simple. But it
> > > becomes
> > > a mess when several driver instances need to coordinate. If one
> > > instance
> > > is grabbing the reset line but is then stalled while other
> > > instances
> > > race ahead, they might be clobbered by a late reset from the
> > > stalled
> > > first instance.
>
> Hi,
>
> Well this isn't a concern if the line is hogged - once it's hogged it
> shouldn't change, and all driver instances should get the same thing -
> EBUSY. Before it's hogged all driver instances should get EPROBE_DEFER.
>
> > >
> > > And while it might be possible to arrange the code such that those
> > > dragons
> > > are dodged and that the reset is properly coordinated, what if the
> > > gpio is
> > > supposed to be shared with some other totally unrelated driver? It
> > > might
> > > seem to work when everything is normal, but as soon as anything out
> > > of the
> > > ordinary happens, all bets are off. I expect subtle problems in the
> > > furture.
>
> Unless another driver uses the non-exclusive flag (which can cause many
> subtle problems in all sorts of areas anyway), the GPIO shouldn't
> change. Now, the driver that does the GPIO hogging might go away, which
> definitely would be a problem. I suppose I feel it's an error path
> anyway, so all bets are off for dependent devices.
>
> >
> > All of this is true, but a different reset GPIO property name does
> > nothing to solve it.
>
> This is part of why I chose a new property that specifically indicates
> that it's hogged.

I'm not really a fan of GPIO hog stuff and using it here definitely
seems like a hack. I thought the purpose was for GPIOs not controlled
elsewhere... Regardless, you still have all the information you need
in DT already. We don't need to duplicate it. You know it is a hog and
can also tell it is shared. Information doesn't have to be in the node
associated with a driver.

Rob
