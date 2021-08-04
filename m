Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B80E3E01EB
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Aug 2021 15:28:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238127AbhHDN2g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Aug 2021 09:28:36 -0400
Received: from mail.kernel.org ([198.145.29.99]:42430 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238119AbhHDN2f (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 4 Aug 2021 09:28:35 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C91260F6F;
        Wed,  4 Aug 2021 13:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1628083703;
        bh=Wfd7R0ApGgOmwN9wt/25NVYqDvQ1vR7xSRygDH3CUiM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=umiYsv1CPiaiJY5d8zSjVtGl+d0rOPGpcC2Ki7x09LSxg4dp54MzfqO7pj6wkd8Y1
         +a8eKVnvyKAJCnbLU948OhVMTP7tbDs5VbvW65b17dEcR214GzXDfB1Q0ZlnOeHB0x
         XPNEIL/1rgUQZstW/oG1i/JHdq3nR2MJyBWfpHur1TV1iOc6W8kX3+O65gzlP2Rxv/
         KfvR7E5w/RgPDc4oDDqNzrNX35Oxh2xUqVeW6M7dM5+t5HOVDK91vLmzJfBXOe0vVJ
         zjhTMMJjKmbJ5h4bZWCSAQqT5Q7WUBORUMAhH+RawS2MpfNDj/NmF4J84ILPEvCyu2
         xHElTJfHl9cWw==
Received: by mail-ej1-f43.google.com with SMTP id h9so3732555ejs.4;
        Wed, 04 Aug 2021 06:28:23 -0700 (PDT)
X-Gm-Message-State: AOAM5336NcVPbVb2sufIfaSfvbVEhdv7P48bplbEYVqI1iEFdlcRaAIq
        Wf4iDz5vs9Se8v+LbPHVG6OuXwomwOyg4z2dMA==
X-Google-Smtp-Source: ABdhPJwyzYTN5irKM6Kf8VGRNhMvW6JRknZ7L0BMgKHrrmuupnTr74hdq3bN+HWkO8eDLdIzsTHpyAF6HgWykC1PzaQ=
X-Received: by 2002:a17:907:766c:: with SMTP id kk12mr25096464ejc.525.1628083701595;
 Wed, 04 Aug 2021 06:28:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210727160315.15575-1-eajames@linux.ibm.com> <20210727160315.15575-3-eajames@linux.ibm.com>
 <YQhZimPDbNJk5nbR@robh.at.kernel.org> <29d72be98ebe3e5761f4c3da7b4daf2f05fbbf3b.camel@linux.ibm.com>
 <209d9f68-e6c4-68c9-d495-d7e3f5050440@axentia.se>
In-Reply-To: <209d9f68-e6c4-68c9-d495-d7e3f5050440@axentia.se>
From:   Rob Herring <robh@kernel.org>
Date:   Wed, 4 Aug 2021 07:28:09 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLFC7vjMvZ3o6ey=thf=ZHsqApdT69e6akLvs0ceb8m1w@mail.gmail.com>
Message-ID: <CAL_JsqLFC7vjMvZ3o6ey=thf=ZHsqApdT69e6akLvs0ceb8m1w@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] i2c: mux: pca954x: Support multiple devices on a
 single reset line
To:     Peter Rosin <peda@axentia.se>
Cc:     Eddie James <eajames@linux.ibm.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 4, 2021 at 1:50 AM Peter Rosin <peda@axentia.se> wrote:
>
> On 2021-08-02 23:51, Eddie James wrote:
> > On Mon, 2021-08-02 at 14:46 -0600, Rob Herring wrote:
> >> On Tue, Jul 27, 2021 at 11:03:15AM -0500, Eddie James wrote:
> >>> Some systems connect several PCA954x devices to a single reset
> >>> GPIO. For
> >>> these devices to get out of reset and probe successfully, each
> >>> device must
> >>> defer the probe until the GPIO has been hogged. Accomplish this by
> >>> attempting to grab a new "reset-shared-hogged" devicetree property,
> >>> but
> >>> expect it to fail with EPROBE_DEFER or EBUSY.
> >>>
> >>> Signed-off-by: Eddie James <eajames@linux.ibm.com>
> >>> ---
> >>>  drivers/i2c/muxes/i2c-mux-pca954x.c | 46 +++++++++++++++++++++++
> >>> ------
> >>>  1 file changed, 37 insertions(+), 9 deletions(-)
> >>>
> >>> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c
> >>> b/drivers/i2c/muxes/i2c-mux-pca954x.c
> >>> index 4ad665757dd8..376b54ffb590 100644
> >>> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> >>> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> >>> @@ -434,15 +434,43 @@ static int pca954x_probe(struct i2c_client
> >>> *client,
> >>>     i2c_set_clientdata(client, muxc);
> >>>     data->client = client;
> >>>
> >>> -   /* Reset the mux if a reset GPIO is specified. */
> >>> -   gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
> >>> -   if (IS_ERR(gpio))
> >>> -           return PTR_ERR(gpio);
> >>> -   if (gpio) {
> >>> -           udelay(1);
> >>> -           gpiod_set_value_cansleep(gpio, 0);
> >>> -           /* Give the chip some time to recover. */
> >>> -           udelay(1);
> >>> +   /*
> >>> +    * Grab the shared, hogged gpio that controls the mux reset. We
> >>> expect
> >>> +    * this to fail with either EPROBE_DEFER or EBUSY. The only
> >>> purpose of
> >>> +    * trying to get it is to make sure the gpio controller has
> >>> probed up
> >>> +    * and hogged the line to take the mux out of reset, meaning
> >>> that the
> >>> +    * mux is ready to be probed up. Don't try and set the line any
> >>> way; in
> >>> +    * the event we actually successfully get the line (if it
> >>> wasn't
> >>> +    * hogged) then we immediately release it, since there is no
> >>> way to
> >>> +    * sync up the line between muxes.
> >>> +    */
> >>> +   gpio = gpiod_get_optional(dev, "reset-shared-hogged", 0);
> >>> +   if (IS_ERR(gpio)) {
> >>> +           ret = PTR_ERR(gpio);
> >>> +           if (ret != -EBUSY)
> >>> +                   return ret;
> >>
> >> Why can't you just do this with the existing 'reset-gpios' property?
> >> What's the usecase where you'd want to fail probe because EBUSY
> >> other
> >> than an error in your DT.
> >
> > Hi, thanks for the reply.
> >
> > Are you suggesting I use "reset-gpios" and change the driver to ignore
> > EBUSY? I don't know any other usecase, I just didn't think it would be
> > acceptable to ignore EBUSY on that, but perhaps it is a better
> > solution.
>
> Hi!
>
> From a device-tree point of view that might seem simple. But it becomes
> a mess when several driver instances need to coordinate. If one instance
> is grabbing the reset line but is then stalled while other instances
> race ahead, they might be clobbered by a late reset from the stalled
> first instance.
>
> And while it might be possible to arrange the code such that those dragons
> are dodged and that the reset is properly coordinated, what if the gpio is
> supposed to be shared with some other totally unrelated driver? It might
> seem to work when everything is normal, but as soon as anything out of the
> ordinary happens, all bets are off. I expect subtle problems in the
> furture.

All of this is true, but a different reset GPIO property name does
nothing to solve it.

> I see no simple solution to this, and I also expect that if gpios need
> to be shared, there will eventually need to be some kind of layer that
> helps with coordination such that it becomes explicit rather than
> implicit and fragile.

Yes, like making the reset subsystem handle 'reset-gpios' properties
as I suggested.

Rob
