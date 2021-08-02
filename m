Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D707A3DE28A
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Aug 2021 00:35:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232042AbhHBWgG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Aug 2021 18:36:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:40988 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232037AbhHBWgG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 2 Aug 2021 18:36:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 33C54600D4;
        Mon,  2 Aug 2021 22:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627943756;
        bh=dV1AnulSImJoHeq/Oj7vcQcmAxSTHRiY+VVmgxOokOc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=g0f1FgYwFxpV9YlmUwlrHlrTH1Btu+94pYr50NuhAxd8LUsJagmvrym2Z9DPhvh4h
         IPOCOqo3hjXRT0cYJjpBFuXTNGaTBPnaJ6OEhCWmmaEFZAGGMvYcMSUiHb61kyk9QP
         IPRWLpXmF2xqQVkLPahccYrsJljVRAx1FTbnDuqZWIHDfq2lbdto5zWxRVrIk1ygpq
         44KNev35Q8A2aTNL6UfN03j3UOv8z1Hl8lqQtSpNXdFr1WiZIEh29eSO406budwLUO
         bFbjdt6QC+9F6ll9WCagvugMK9J5lf8jAxW1f6z8bL0J4sCAFSmAxrIT8y+yNmlhCM
         DYAhR6HhwrP7w==
Received: by mail-ej1-f47.google.com with SMTP id h9so17890459ejs.4;
        Mon, 02 Aug 2021 15:35:56 -0700 (PDT)
X-Gm-Message-State: AOAM532lB6l8Yzr2YIpJNMmcGv4ihXAUZBiHAJL1c08SRAufZnaMT4ia
        vxnnu9F3QRDUE0f7qXny5Qp9NWNFoVpyOfuSKA==
X-Google-Smtp-Source: ABdhPJzGGR6l/lWka13Egd+kye5/e/JiU4Ai3E3IImFhuv7yJUP3gpZI6eBZK1sMYOIfAztivaDltBSH+KuuKBVz5GY=
X-Received: by 2002:a17:907:766c:: with SMTP id kk12mr17085479ejc.525.1627943754757;
 Mon, 02 Aug 2021 15:35:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210727160315.15575-1-eajames@linux.ibm.com> <20210727160315.15575-3-eajames@linux.ibm.com>
 <YQhZimPDbNJk5nbR@robh.at.kernel.org> <29d72be98ebe3e5761f4c3da7b4daf2f05fbbf3b.camel@linux.ibm.com>
In-Reply-To: <29d72be98ebe3e5761f4c3da7b4daf2f05fbbf3b.camel@linux.ibm.com>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 2 Aug 2021 16:35:43 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJZ9uktMKywZFTb66-t5uHdDYkS7x_X7ZUQ3=t6nYcu8w@mail.gmail.com>
Message-ID: <CAL_JsqJZ9uktMKywZFTb66-t5uHdDYkS7x_X7ZUQ3=t6nYcu8w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: mux: pca954x: Support multiple devices on a
 single reset line
To:     Eddie James <eajames@linux.ibm.com>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Peter Rosin <peda@axentia.se>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Aug 2, 2021 at 3:51 PM Eddie James <eajames@linux.ibm.com> wrote:
>
> On Mon, 2021-08-02 at 14:46 -0600, Rob Herring wrote:
> > On Tue, Jul 27, 2021 at 11:03:15AM -0500, Eddie James wrote:
> > > Some systems connect several PCA954x devices to a single reset
> > > GPIO. For
> > > these devices to get out of reset and probe successfully, each
> > > device must
> > > defer the probe until the GPIO has been hogged. Accomplish this by
> > > attempting to grab a new "reset-shared-hogged" devicetree property,
> > > but
> > > expect it to fail with EPROBE_DEFER or EBUSY.
> > >
> > > Signed-off-by: Eddie James <eajames@linux.ibm.com>
> > > ---
> > >  drivers/i2c/muxes/i2c-mux-pca954x.c | 46 +++++++++++++++++++++++
> > > ------
> > >  1 file changed, 37 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c
> > > b/drivers/i2c/muxes/i2c-mux-pca954x.c
> > > index 4ad665757dd8..376b54ffb590 100644
> > > --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> > > +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> > > @@ -434,15 +434,43 @@ static int pca954x_probe(struct i2c_client
> > > *client,
> > >     i2c_set_clientdata(client, muxc);
> > >     data->client = client;
> > >
> > > -   /* Reset the mux if a reset GPIO is specified. */
> > > -   gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> > > -   if (IS_ERR(gpio))
> > > -           return PTR_ERR(gpio);
> > > -   if (gpio) {
> > > -           udelay(1);
> > > -           gpiod_set_value_cansleep(gpio, 0);
> > > -           /* Give the chip some time to recover. */
> > > -           udelay(1);
> > > +   /*
> > > +    * Grab the shared, hogged gpio that controls the mux reset. We
> > > expect
> > > +    * this to fail with either EPROBE_DEFER or EBUSY. The only
> > > purpose of
> > > +    * trying to get it is to make sure the gpio controller has
> > > probed up
> > > +    * and hogged the line to take the mux out of reset, meaning
> > > that the
> > > +    * mux is ready to be probed up. Don't try and set the line any
> > > way; in
> > > +    * the event we actually successfully get the line (if it
> > > wasn't
> > > +    * hogged) then we immediately release it, since there is no
> > > way to
> > > +    * sync up the line between muxes.
> > > +    */
> > > +   gpio = gpiod_get_optional(dev, "reset-shared-hogged", 0);
> > > +   if (IS_ERR(gpio)) {
> > > +           ret = PTR_ERR(gpio);
> > > +           if (ret != -EBUSY)
> > > +                   return ret;
> >
> > Why can't you just do this with the existing 'reset-gpios' property?
> > What's the usecase where you'd want to fail probe because EBUSY
> > other
> > than an error in your DT.
>
> Hi, thanks for the reply.
>
> Are you suggesting I use "reset-gpios" and change the driver to ignore
> EBUSY? I don't know any other usecase, I just didn't think it would be
> acceptable to ignore EBUSY on that, but perhaps it is a better
> solution.

Yes. I'm assuming that's the only way EBUSY is returned? A DT already
contains everything needed to know multiple 'reset-gpios' are sharing
a GPIO line. It's a kernel problem to figure that out.

(Really, I'd like to make 'reset-gpios' be handled by the reset
subsystem which handles shared resets already. Then 'reset-gpios' or
'resets' could be used in nodes and drivers don't know the
difference.)

Rob
