Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D38D41DD066
	for <lists+linux-i2c@lfdr.de>; Thu, 21 May 2020 16:44:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729512AbgEUOnp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 May 2020 10:43:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728229AbgEUOnp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 May 2020 10:43:45 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF582C061A0E;
        Thu, 21 May 2020 07:43:44 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id g1so8551581ljk.7;
        Thu, 21 May 2020 07:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tuQ1zvOklpezgOq1qrrrAXi9Q/2zL0O9meBuAgy373s=;
        b=hNauZCE4ZyQrnO0nntQayyVk53MtCYFx0x+QupMIZuQorwHuDn4bhd0+45d7gZ6d8m
         L6FJKZwUbwT0yCAebmlFe/U6MIDVfJOulUCJ9E6SQ5+CZAc5oTbh9r4VX1H+J+9/unKS
         OtVccceu5GPEqBPyaLM8ED/+C7SRnRPsQL+dDOic0gp0369C/z+gCWjmEsqcMLSXWCyR
         xny6xU29xdDdJPSNElcbiaSIP3X8p+JpzsMp8hNSzPEJra2Ys18vzOJkZcgtxG4AIRzr
         r4c9E/zTfdzTR9j8Bx5HE4BOlhs5/j7qSSM0Q7hagrta2JhNIsPXZXw0yNeOAqCIV5hp
         G74g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tuQ1zvOklpezgOq1qrrrAXi9Q/2zL0O9meBuAgy373s=;
        b=nf9WtUNQu5/kwZbTY0UUDsOyIc0GqrM5geapikU22pHO/ksvx9SCnlkKDMHP2I7h2J
         75SD5ekFfD7TZwKik6HS8T5qpEZIfRU7NIZZHHQcbGc8mUCXJ9DS17CKPtdPi2aNOHZV
         ioiZ4H7Lb1M9AvqNKGB68q/iY50io9kVwrx4kHVu8hJ9mPnlEdNfxRU4O4S6TxuNv4Qg
         r4NtwX+7IKjIEd8Vn0mLNDbtbBt7mQyKLDKvNRzSbYIq5a4YR71m4bYwlJdeD8GBdK7Q
         Z725/3/iFoRg4wWyUUWzty9xEsHqYVSbBPgSVxmZWYvmPx14BbmME6z7ZTkMNRdAzR9L
         5NPA==
X-Gm-Message-State: AOAM531JqQV1ngvmiCCMbfa2mKTGBXGu3x9eneLr1I5KVzwmXEh5qjd8
        4hl5+D6IVFO5zOozICpYoEt/p5USK2LieCtfP8w=
X-Google-Smtp-Source: ABdhPJzExRJlbujUemJvxqwrl+G4Cgtl0pUnc8oJA7iFqXep0LQNN0QQax7qtdllV0ZY5aX2u0RW9gWAArQn88T9G+4=
X-Received: by 2002:a2e:6c0c:: with SMTP id h12mr5222291ljc.266.1590072223382;
 Thu, 21 May 2020 07:43:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200521110910.45518-1-tali.perry1@gmail.com> <20200521110910.45518-3-tali.perry1@gmail.com>
 <20200521142340.GM1634618@smile.fi.intel.com> <20200521143100.GA16812@ninjato>
In-Reply-To: <20200521143100.GA16812@ninjato>
From:   Tali Perry <tali.perry1@gmail.com>
Date:   Thu, 21 May 2020 17:45:03 +0300
Message-ID: <CAHb3i=vcVLWHjdiJoNZQrwJCqzszpOL7e9SAjqObsZCRH4ifwg@mail.gmail.com>
Subject: Re: [PATCH v12 2/3] i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ofer Yehielli <ofery@google.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        avifishman70@gmail.com, Tomer Maimon <tmaimon77@gmail.com>,
        kfting@nuvoton.com, Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 21, 2020 at 5:31 PM Wolfram Sang <wsa@the-dreams.de> wrote:
>
> Hi Tali, Andy!
>
> On Thu, May 21, 2020 at 05:23:40PM +0300, Andy Shevchenko wrote:
> > On Thu, May 21, 2020 at 02:09:09PM +0300, Tali Perry wrote:
> > > Add Nuvoton NPCM BMC I2C controller driver.
> >
> > Thanks. My comments below.
> > After addressing them, FWIW,
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>
> Thanks, Andy, for all the review!
>

Highly appreciate your time and patience for a newbie :)

> From a glimpse, this looks good to go. I will have a close look later
> today.
>
> > > +#ifdef CONFIG_DEBUG_FS
> >
> > Again, why is this here?
> >
> > Have you checked debugfs.h for !CONFIG_DEBUG_FS case?

I compiled both options. I removed the ifdef in most places, except in the
struct itself. Users that don't use the debugfs don't need this in the struct.

>
> I wondered also about DEBUG_FS entries. I can see their value when
> developing the driver. But since this is done now, do they really help a
> user to debug a difficult case? I am not sure, and then I wonder if we
> should have that code in upstream. I am open for discussion, though.

The user wanted to have health monitor implemented on top of the driver.
The user has 16 channels connected the multiple devices. All are operated
using various daemons in the system. Sometimes the slave devices are power down.
Therefor the user wanted to track the health status of the devices.

>
> > > +MODULE_VERSION("0.1.3");
> >
> > Module version is defined by kernel commit hash. But it's up to you and
> > subsystem maintainer to decide.
>
> Please drop it. I also think commit id's (or even kernel versions) are a
> more precise description.

will remove.

>
> Regards,
>
>    Wolfram
>

BR,
Tali
