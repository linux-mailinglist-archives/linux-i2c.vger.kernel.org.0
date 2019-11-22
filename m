Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57E72105F47
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2019 05:39:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726541AbfKVEjL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Nov 2019 23:39:11 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:43630 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726500AbfKVEjL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Nov 2019 23:39:11 -0500
Received: by mail-ed1-f65.google.com with SMTP id w6so4790226edx.10;
        Thu, 21 Nov 2019 20:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oVbtyTf0O21olBXtoVa67tn52x/gau87u57+ZUKiFCw=;
        b=Fp5JWwTDey1hM7mH2XB8MuD6VR0KDOTg0cLbRUM35zpzhaaNX44fwGDaNKeJn/hx1/
         L1vtZfPZCetcMTtqnjzjVHlluwg5qsPfkmQGseVLVd0JQ/RcpcF2d2ASLmzSXG6kT8WJ
         Cd+kx0ylYFFMpt4vCFQUaiJS7Q6Oyh/QxEdzNeGz0Hh1k92d7mjZKmi6RtdQOFJQj25K
         shP2TrGmr5/Zh969AmsONmDaEwtStfC7FErI/IFX6PzDim+/XrLOc7/j4+9Ao+IJHbcS
         AUwgUxhrL/q8IEtt7jy6LOGl297/m6eUFDUBbXEXU9J+rezI7kyFrg554GSDvA8z5cWc
         SKFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oVbtyTf0O21olBXtoVa67tn52x/gau87u57+ZUKiFCw=;
        b=X+i4vJOk0xtmtrcz6xnl34O0qcSYvS/r2KmSBWbJpkFAClR9gDJyrDhCiHpSdCBPsl
         fTuBPvSa3BwCcEZ4Nhe+xaCdeMStzEH8KrCVixVR1fqO22AAM4wa3VKd6xM0mfgps9F4
         im4Yg1MFMmk+glye1xc4qpz7zW/ZlfbFSyKaeAzVXMxu7L7oI7BIwQh5VssZqEKAp/lv
         F3mrtAKbKaCGfmRst6IyrJXgtvk37zwHHNyY4o5d1uS6aRuFexM28l6zkpU83A+OXi5P
         GoqVmlke5tynEEsU966fe5sQyyRDp1w09jdXE7q6SZIGvMofA0VBSaADNyhWRUT5WdJg
         2F6g==
X-Gm-Message-State: APjAAAVvtwCCwMrkgdEcNYSHDYmWTIk8In3t8vZvthLhIxvXweeJqLqy
        EagfyZWg1gbFmfZgKofDzX8/x6T3JPJiPipWEP7ppg==
X-Google-Smtp-Source: APXvYqwRCdlfSFWp8fgaVDv7u2vny5wMSbJYBbFmyvw3LmPibX8n8t12SQw67TzKwoFw1NDLh5BDs/DCwq7IBS6pMQE=
X-Received: by 2002:a17:906:f0c9:: with SMTP id dk9mr19349100ejb.56.1574397548207;
 Thu, 21 Nov 2019 20:39:08 -0800 (PST)
MIME-Version: 1.0
References: <1573719422-7414-1-git-send-email-shubhrajyoti.datta@gmail.com>
 <6d135b8a-cdba-e6a6-7738-cbc94cdb7ec0@axentia.se> <CAKfKVtE=ufzc=_EjPR2WKt4qf0sdOB=a7f-BRP-ZffMaemxGBw@mail.gmail.com>
 <b9eaaba2-dcfd-0c97-f088-21acf269a92f@axentia.se>
In-Reply-To: <b9eaaba2-dcfd-0c97-f088-21acf269a92f@axentia.se>
From:   Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Fri, 22 Nov 2019 10:08:56 +0530
Message-ID: <CAKfKVtHuzWqH4Su1vC2oMMxvUPiGjvZsBJtYSXxx+rG7Ub1pSQ@mail.gmail.com>
Subject: Re: [PATCH] i2c: mux: pca954x: Disable cacheing of the last channel
To:     Peter Rosin <peda@axentia.se>
Cc:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 22, 2019 at 6:23 AM Peter Rosin <peda@axentia.se> wrote:
>
> On 2019-11-20 10:21, Shubhrajyoti Datta wrote:
> > Hi Peter ,
> > thanks for the review,
> >
> > On Tue, Nov 19, 2019 at 4:35 AM Peter Rosin <peda@axentia.se> wrote:
> >>
> >> On 2019-11-14 09:17, shubhrajyoti.datta@gmail.com wrote:
> >>> From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> >>>
> >>> In case of multimaster configuration the last channel cached value is
> >>> not reliable. Basically the first processor/master does a write to the
> >>> mux and then to the intended slave, it caches the value.
> >>> Now the second processor/processor does a write to mux on another
> >>> channel and writes to another slave.
> >>> The first processor/master when it attempts to write the slave
> >>> skips the mux as it relies on the mux channel being the same as the
> >>> intended. This causes an issue.
> >>>
> >>> To fix that write always to the mux address.
> >>
> >> Thanks for your patch.
> >>
> >> However, I don't really see how this fixes anything. If you have
> >> multiple masters competing for the same mux, all bets are off and any
> >> solution not involving an out-of-band channel where the masters can
> >> coordinate will be racy, broken and dangerous.
> >> And since you need that
> >> extra channel anyway, it might as well also be used to coordinate when
> >> the cache needs to be invalidated.
> >>
> >> At the very least, all limitations needs to be carefully documented,
> >> but that does not mean that I will ever like it. In short, I'm extremely
> >> reluctant to add a glgllike this.
> >>
> >> Cheers,
> >> Peter
> >
> > I agree does the below patch make sense.
>
> This patch is severely white-space damaged and I have a hard time reading
> the details so please fix your setup. However, I gather the idea is to
> rely on having all masters configured to idle the mux when they don't use
> it. That's also racy since multiple masters can all read the zero, and
> deduce that the mux is free, then all of them write their thing to the
> mux, and proceed as if they own it. That spells disaster.
However since the bus is locked when the master is transacting others
will get bus
busy or an arbitration lost if they start together.

> Also, I'm not
> sure the 1 second timeout is OK since the the root adapter (along with
> the mux) are potentially locked for this duration, thus blocking all other
> I2C traffic.
We are checking if the mux value is non-zero this will happen when
someone else is
transacting on the bus.

>
> Also, if you are relying on the mux being idle when unused, then you will
> effectively not have a cache regardless of this patch, and the driver will
> set the desired value on each transaction, which mean that the naming of
> this new feature is wrong. Maybe name it something with "coordination" (a
> bit long) or "arbitration" or something such instead?

I agree.

>
> It seems your hardware designers didn't think things through properly,
> because I can't see a sane way to fix the race. Not without a separate
> communications channel where the masters can coordinate. But I bet that
> channel, if it even exists, is pretty damn hard to use if it wasn't
> designed in from the start.
>
> I think the traditional way to solve your problem is to have the masters
> coordinate via some i2c arbitrator such as the i2c-arb-gpio-challenge
> driver or a pca9541 chip or something. Then the muxing transactions,
> which consist of multiple I2C transfers, can be handled as a unit.
>
> I.e. with i2c-arb-gpio-challenge, you have two gpio lines where two
> masters can coordinate, and even if they are both on the same I2C bus,
> they can actually use the mux if and only if it is known to be free.
>
>                                .-------.
>         master 1  ------.      |       |----->
>          |  ^           |      |       |----->
>          |  |           |----->|  mux  |  .
>          V  |           |      |       |  .
>         master 2  ------'      |       |----->
>                                '-------'
>
I would explore that.

> The pca9541 can also handle two masters, but in that case the masters are
> not really on the same I2C bus, at least not at the same time.
>
>                         .-----------.      .-------.
>         master 1  ----->|           |      |       |----->
>                         |           |      |       |----->
>                         |  pca9541  |----->|  mux  |  .
>                         |           |      |       |  .
>         master 2  ----->|           |      |       |----->
>                         '-----------'      '-------'
>
> If you don't have something like that in your schematics, I think you
> are just SOL, and anything you try will be broken in one way or another.
>
> Trying to use the register in the mux for the needed coordination seems
> very difficult. Maybe if there was a pair of unused registers in some
> other device on the bus, or a couple of memory locations in an eeprom or
> something, then that could perhaps be used as the i2c-arb-gpio-challenge
> uses the gpios. I.e. write a new i2c-arb-reg-challenge driver or
> something, if you see what I mean. Hmm, on second thought, eeproms might
> not be so good if you expect to mux frequently...
>
> Finally, I noticed a couple of spelling mistakes below.
>
> > From 0ca65420b65514594a8252d1e9eeba64bea01da6 Mon Sep 17 00:00:00 2001
> > From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> > Date: Fri, 30 Aug 2019 11:15:25 +0530
> > Subject: [PATCH] i2c: mux: pca954x: Disable cacheing of the last channel
>
> "caching", as someone else already mentioned.
will fix.

>
> >
> > In case of multimaster configuration the last channel cached value is
> > not reliable. To fix that write always to the mux address.
> > Also use the 0 channel disable to arbitrate. If disabled only then write.
> > Else wait for it to be disabled.
> >
> > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> > ---
> >
> >  .../devicetree/bindings/i2c/i2c-mux-pca954x.txt    |  1 +
> >  drivers/i2c/muxes/i2c-mux-pca954x.c                | 49 +++++++++++++++++++---
> >  2 files changed, 45 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c
> > b/drivers/i2c/muxes/i2c-mux-pca954x.c
> > index 923aa3a..a7e3aa9 100644
> > --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> > +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> > @@ -42,6 +42,7 @@
> >  #include <linux/i2c-mux.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/irq.h>
> > +#include <linux/jiffies.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> >  #include <linux/of_device.h>
> > @@ -55,6 +56,8 @@
> >
> >  #define PCA954X_IRQ_OFFSET 4
> >
> > +#define MUX_CHAN_TIMEOUT_US 1000000
> > +
> >  enum pca_type {
> >   pca_9540,
> >   pca_9542,
> > @@ -85,6 +88,8 @@ struct pca954x {
> >   const struct chip_desc *chip;
> >
> >   u8 last_chan; /* last register value */
> > + u8 last_chan_unchached; /* write channel register always */
>
> ..._uncached
>
> But, since a rename might be in order, I don't know how relevant that
> is...
>
Will consider renaming.

> Cheers,
> Peter
>
> > + bool channel_sel;
> >   /* MUX_IDLE_AS_IS, MUX_IDLE_DISCONNECT or >= 0 for channel */
> >   s8 idle_state;
> >
> > @@ -229,6 +234,23 @@ static int pca954x_reg_write(struct i2c_adapter *adap,
> >   I2C_SMBUS_BYTE, &dummy);
> >  }
> >
> > +/*
> > + * Read from chip register. Don't use i2c_transfer()/i2c_smbus_xfer()
> > + * as they will try to lock adapter a second time.
> > + */
> > +static int pca954x_reg_read(struct i2c_adapter *adap,
> > +     struct i2c_client *client, u8 val)
> > +{
> > + union i2c_smbus_data data;
> > + int ret;
> > +
> > + ret = __i2c_smbus_xfer(adap, client->addr, client->flags,
> > +        I2C_SMBUS_READ, val,
> > +        I2C_SMBUS_BYTE, &data);
> > +
> > + return ret ? ret :  data.byte;
> > +}
> > +
> >  static int pca954x_select_chan(struct i2c_mux_core *muxc, u32 chan)
> >  {
> >   struct pca954x *data = i2c_mux_priv(muxc);
> > @@ -236,6 +258,7 @@ static int pca954x_select_chan(struct i2c_mux_core
> > *muxc, u32 chan)
> >   const struct chip_desc *chip = data->chip;
> >   u8 regval;
> >   int ret = 0;
> > + unsigned long timeout = jiffies + usecs_to_jiffies(MUX_CHAN_TIMEOUT_US);
> >
> >   /* we make switches look like muxes, not sure how to be smarter */
> >   if (chip->muxtype == pca954x_ismux)
> > @@ -243,13 +266,26 @@ static int pca954x_select_chan(struct
> > i2c_mux_core *muxc, u32 chan)
> >   else
> >   regval = 1 << chan;
> >
> > + if (!data->last_chan_unchached) {
> >   /* Only select the channel if its different from the last channel */
> > - if (data->last_chan != regval) {
> > - ret = pca954x_reg_write(muxc->parent, client, regval);
> > - data->last_chan = ret < 0 ? 0 : regval;
> > + if (data->last_chan != regval) {
> > + ret = pca954x_reg_write(muxc->parent, client, regval);
> > + data->last_chan = ret < 0 ? 0 : regval;
> > + }
> > + return ret;
> >   }
> >
> > - return ret;
> > + do {
> > + ret = pca954x_reg_read(muxc->parent, client, 0);
> > + if (ret == 0) {
> > + ret = pca954x_reg_write(muxc->parent, client, regval);
> > + data->channel_sel = true;
> > + return ret;
> > + }
> > + msleep(20);
> > + } while (time_is_after_eq_jiffies(timeout));
> > + data->channel_sel = false;
> > + return -ETIMEDOUT;
> >  }
> >
> >  static int pca954x_deselect_mux(struct i2c_mux_core *muxc, u32 chan)
> > @@ -259,7 +295,7 @@ static int pca954x_deselect_mux(struct
> > i2c_mux_core *muxc, u32 chan)
> >   s8 idle_state;
> >
> >   idle_state = READ_ONCE(data->idle_state);
> > - if (idle_state >= 0)
> > + if (idle_state >= 0 &&  data->channel_sel)
> >   /* Set the mux back to a predetermined channel */
> >   return pca954x_select_chan(muxc, idle_state);
> >
> > @@ -479,6 +515,9 @@ static int pca954x_probe(struct i2c_client *client,
> >   if (idle_disconnect_dt)
> >   data->idle_state = MUX_IDLE_DISCONNECT;
> >
> > + data->last_chan_unchached = np &&
> > + of_property_read_bool(np, "no-channel-cache");
> > +
> >   ret = pca954x_irq_setup(muxc);
> >   if (ret)
> >   goto fail_cleanup;
> >
>
