Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B6131CD848
	for <lists+linux-i2c@lfdr.de>; Mon, 11 May 2020 13:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729633AbgEKL1l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 May 2020 07:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729493AbgEKL1j (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 11 May 2020 07:27:39 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76313C061A0C;
        Mon, 11 May 2020 04:27:39 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id w20so9056886ljj.0;
        Mon, 11 May 2020 04:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vaB9hU9OmyfFXTQp3Ro8TCS0oJ1JBGJMlLHsQD/icQs=;
        b=B11Pm6i378UfISHZsNk0nzMTp1ytpuFElTXChP5p5rfSBHgFXSvuIWdO9AuSII/v4L
         JoXj8tmU64Sov4ttXUk+utPGxHIq+UsAHzKdC+xfO2pyjaQgU0B8FNCNM1tEE5a6a+Bb
         lVLbbKB5+Drtgyu+Cx6j2yuv4R6xL3Vx83M/2VTvQGYK5L9CGr8jRyKNLN/TGYcESVrg
         fPnZvzpHrNC2Ub7OaStzqBPbwrPL5nuRFb5OH615K8cpdmSNBoRfCYqnn1LNnamAJLVa
         ymOntHstg1G1B2aaxiJSR7DHWzSbohQ93hZO8PTB8Ync9/qLg3Qkf7TZJn0VuMhti5DF
         Dd4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vaB9hU9OmyfFXTQp3Ro8TCS0oJ1JBGJMlLHsQD/icQs=;
        b=bZM+bRI+7C56Qk/3OEBJDXT1zdT5k4hXmGVEBEKW+V9gmrBFO5/983DT74rBf1otrz
         cEGENfIqXj4jLT6z5k0Lr3En3oIAwN398ctLP1sGSJ+u27lYnwiiCoUe0DGGnjimTDKI
         pYnKTk6UOC2ws3d2kL0wjcPxW1cWaX78cq795Uxt4FD1wyUE5BiRH06/ZPSkG09DNjEC
         msk4hz0ffuiCkabO39oKDOioPu+tk8HneyhaO785bu3yZP5L4z39OM4fRsffTLk80cAa
         ngMKL6TYjJ5rxNSgI2c8C55x/SSoVNSDdNXIBinLphQZCCcRcYKsiLdPM4/4rhLmR8qd
         hLwA==
X-Gm-Message-State: AOAM5311qEGiTP2WhYGiptTeoOcN8pwvkj/Me6Iroufp8PL/ATD6pjSk
        pFBd7cYrhVoYKJFrm5BlKH0n/FLzvtuEuZYqmIk=
X-Google-Smtp-Source: ABdhPJxjS7B69iERkJXybN1FRa7Oxd7PZfUVSfeSeQJxEpGjVNnxZ1aHys/mj0Ck3Q4insH6zi+f+AQGU7gf0xFawuI=
X-Received: by 2002:a2e:b6d3:: with SMTP id m19mr6903929ljo.43.1589196457920;
 Mon, 11 May 2020 04:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <20200510102330.66715-1-tali.perry1@gmail.com> <20200510102330.66715-3-tali.perry1@gmail.com>
 <20200511091759.GE185537@smile.fi.intel.com>
In-Reply-To: <20200511091759.GE185537@smile.fi.intel.com>
From:   Tali Perry <tali.perry1@gmail.com>
Date:   Mon, 11 May 2020 14:28:50 +0300
Message-ID: <CAHb3i=tERsM+gwmQN1+vjnML9o5NxRK=uBokEUsd-Ljyje4s3A@mail.gmail.com>
Subject: Re: [PATCH v10 2/3] i2c: npcm7xx: Add Nuvoton NPCM I2C controller driver
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     ofery@google.com, Brendan Higgins <brendanhiggins@google.com>,
        avifishman70@gmail.com, Tomer Maimon <tmaimon77@gmail.com>,
        kfting@nuvoton.com, Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, May 11, 2020 at 12:18 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sun, May 10, 2020 at 01:23:29PM +0300, Tali Perry wrote:
> > Add Nuvoton NPCM BMC I2C controller driver.
>
> Some cosmetic changes needs to be done.
>

Thanks for the review and the comments.
Will fix all, have a few questions (below)

> ...
>
> > +/*
> > + * Nuvoton NPCM7xx I2C Controller driver
> > + *
> > + * Copyright (C) 2020 Nuvoton Technologies tali.perry@nuvoton.com
> > + */
>
> So, entire file has C99 comment style, but this and few other places.
> Any reason of inconsistency?
>
> ...
>
> > +#if IS_ENABLED(CONFIG_DEBUG_FS)
>
> Why?

We wanted to add an optional feature to track i2c slave status.
the NPCM has 16 channels handling multiple devices each. Some of the devices
are polled periodically, and might power down.
The user wanted to implement a health monitoring option
to occasionally check the status of the buses (how many timeouts, recovery etc.)
This feature is optional and depends on CONFIG_DEBUG_FS The counters are exposed
to user through the file system.

....

> ...
>
> > +#define I2C_NUM_OF_ADDR 10
>
> Is it 10-bit address support or what?
>

No, the NPCM has an option to respond to multiple slave addresses
(10 own slave addresses)



...

> > +     // Repeat the following sequence until SDA is released
> > +     do {
> > +             // Issue a single SCL toggle
> > +             iowrite8(NPCM_I2CCST_TGSCL, bus->reg + NPCM_I2CCST);
> > +             udelay(20);
> > +             // If SDA line is inactive (high), stop
> > +             if (npcm_i2c_get_SDA(_adap)) {
> > +                     done = true;
> > +                     status = 0;
> > +             }
> > +     } while (!done && iter--);
>
> readx_poll_timeout() ?

Not exactly, readx_poll_timeout includes only a read operation, here there is a
write in the middle. (iowrite8)


>
> ...
>


...


Thanks!
Tali Perry
Nuvoton Technologies
