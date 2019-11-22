Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08FDB1068A5
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2019 10:10:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfKVJKZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Nov 2019 04:10:25 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:34888 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726100AbfKVJKZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Nov 2019 04:10:25 -0500
Received: by mail-ed1-f65.google.com with SMTP id r16so5348530edq.2;
        Fri, 22 Nov 2019 01:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xJF8jXeg6xvlTusMZZszgFmib3HFwE1D3cegxFqQ0JU=;
        b=WjDEp/NdqbL/aK7NWSKTsFWoaBkW9t2+kFeqjbWn3wnzJsb4AgY6XDAFn2cDZdcQrQ
         HlQO5Ta2E1ZQOyuh2N24tocZTEE87wdHHKW7KDoTZARsiG2XN2cNz6cW9ngLmuOIIZnW
         tF2Uw7wYGIiBLlVMp1U1wfstnEWssmtXLARFb8K3u58zexVHSSABpCbzUYL4VyX48Ao0
         KGyzs+ZHBq3eAdS0RO0Wap48y0hXo5+uvLWh95imJWykIDWizSqh2FCJf0bBUsNbYxe5
         SSC32tS0JXqoKuzZr0EohqZV86hQKtGGtXaSohgyzR6nzL3D9/8UaVUOBSx5YixWMMO6
         X5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xJF8jXeg6xvlTusMZZszgFmib3HFwE1D3cegxFqQ0JU=;
        b=nlcngwRSAdgRUF1vwE8jLvX80r0dt03EGKOuP/T//4THqHVLZ751oQodmVSOOChyOa
         8dbmQRAuKw9/3QUG+7GcKBr2T5UZLAdtI8yLNZafgGQW8mNvCIeW6P+4caYmkSO0Jw+l
         ZdBn1Nq67rXnx5TFLhOu+wbXEFogRbnUbGteXJNRC9gqiioZ7z0g+bUcyAOoAP5KZecV
         8GXS1qeYHH3Og0/G9oSWfM3g/SF3mZ/dbREZbfexQjwRrbHMKP+y50MmxNx1h1XbgIHI
         oRSh4U1Z3Y+nJh70hY6SACvuxZTvtODVnJ/HgHDhJ7sWpHXiVo/D3LrpGqs/eYhRwb00
         taKw==
X-Gm-Message-State: APjAAAVoIztylibngQMyIr3VWM0yYv+zAk//3fji1ym4Hu/6E64Lp2ou
        eWhg/LMFPFfNwccz74DeXbPCl+eft/HLtvuBtWVBGg==
X-Google-Smtp-Source: APXvYqxwyuOc14aMFvMq0SVA6m5mbpFCLy5mif6Nx2xn+USp4UQDt1qTnW7pdA9rReGLSxKVsGoHIlFv+iKx5O7Fcgs=
X-Received: by 2002:a17:906:698b:: with SMTP id i11mr20495989ejr.97.1574413822609;
 Fri, 22 Nov 2019 01:10:22 -0800 (PST)
MIME-Version: 1.0
References: <1573719422-7414-1-git-send-email-shubhrajyoti.datta@gmail.com>
 <6d135b8a-cdba-e6a6-7738-cbc94cdb7ec0@axentia.se> <CAKfKVtE=ufzc=_EjPR2WKt4qf0sdOB=a7f-BRP-ZffMaemxGBw@mail.gmail.com>
 <b9eaaba2-dcfd-0c97-f088-21acf269a92f@axentia.se> <CAKfKVtHuzWqH4Su1vC2oMMxvUPiGjvZsBJtYSXxx+rG7Ub1pSQ@mail.gmail.com>
 <9408fca3-8673-0a1d-0ba7-8bfca0c028be@axentia.se>
In-Reply-To: <9408fca3-8673-0a1d-0ba7-8bfca0c028be@axentia.se>
From:   Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Fri, 22 Nov 2019 14:40:11 +0530
Message-ID: <CAKfKVtHCuJEpd2JnqTREt-AR91C8UEi7UY9-hadgEO+eWNH6Cw@mail.gmail.com>
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

On Fri, Nov 22, 2019 at 2:13 PM Peter Rosin <peda@axentia.se> wrote:
>
> On 2019-11-22 05:38, Shubhrajyoti Datta wrote:
> > On Fri, Nov 22, 2019 at 6:23 AM Peter Rosin <peda@axentia.se> wrote:
> >>
> >> On 2019-11-20 10:21, Shubhrajyoti Datta wrote:
> >>> Hi Peter ,
> >>> thanks for the review,
> >>>
> >>> On Tue, Nov 19, 2019 at 4:35 AM Peter Rosin <peda@axentia.se> wrote:
> >>>>
> >>>> On 2019-11-14 09:17, shubhrajyoti.datta@gmail.com wrote:
> >>>>> From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> >>>>>
> >>>>> In case of multimaster configuration the last channel cached value is
> >>>>> not reliable. Basically the first processor/master does a write to the
> >>>>> mux and then to the intended slave, it caches the value.
> >>>>> Now the second processor/processor does a write to mux on another
> >>>>> channel and writes to another slave.
> >>>>> The first processor/master when it attempts to write the slave
> >>>>> skips the mux as it relies on the mux channel being the same as the
> >>>>> intended. This causes an issue.
> >>>>>
> >>>>> To fix that write always to the mux address.
> >>>>
> >>>> Thanks for your patch.
> >>>>
> >>>> However, I don't really see how this fixes anything. If you have
> >>>> multiple masters competing for the same mux, all bets are off and any
> >>>> solution not involving an out-of-band channel where the masters can
> >>>> coordinate will be racy, broken and dangerous.
> >>>> And since you need that
> >>>> extra channel anyway, it might as well also be used to coordinate when
> >>>> the cache needs to be invalidated.
> >>>>
> >>>> At the very least, all limitations needs to be carefully documented,
> >>>> but that does not mean that I will ever like it. In short, I'm extremely
> >>>> reluctant to add a glgllike this.
> >>>>
> >>>> Cheers,
> >>>> Peter
> >>>
> >>> I agree does the below patch make sense.
> >>
> >> This patch is severely white-space damaged and I have a hard time reading
> >> the details so please fix your setup. However, I gather the idea is to
> >> rely on having all masters configured to idle the mux when they don't use
> >> it. That's also racy since multiple masters can all read the zero, and
> >> deduce that the mux is free, then all of them write their thing to the
> >> mux, and proceed as if they own it. That spells disaster.
> > However since the bus is locked when the master is transacting others
> > will get bus
> > busy or an arbitration lost if they start together.
>
> Not necessarily, since a muxed transaction with some slave on the other
> side of the mux will consist of (at least) four independent transfers (with
> this patch).
>
> 1. check that the mux state is idle
> 2. set the mux to the intended child bus
> 3. do the "useful" transfer to the slave on the child bus
> 4. reset the mux to idle
>
> Two masters might very well get past 1 without noticing each other, which
> is the big fail in your patch. They might also very well get past 2 without
> running into arbitration. You cannot be sure that a master is able to put
> these four transactions on the bus back-to-back, at least not in the Linux
> case (there might e.g. be a reschedule to some totally unrelated work). And
> even if you could, two masters could in theory be completely in sync so that
> both masters think they have succeeded right until they want to set some bit
> in the mux register differently. So, it's just fragile. And even if they do
> run into each other on 1 or 2 on the I2C bus level, you have no code for
> handling that so they will probably just retry a bit later. In other words,
> the race is on, and getting more than one master past 1 before any of them
> hit 2 is enough to get into trouble.
>
> The problem is that, without coordination, the other masters do not see
> these four transactions as a unit. You *need* arbitration on a higher
> level than individual transfers.
I agree will get back once I check some arbitration mechanism like
hardware spinlock
or gpio stuff thanks.

>
> Cheers,
> Peter
