Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC1072578E8
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 14:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbgHaMFB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Aug 2020 08:05:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726204AbgHaME5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Aug 2020 08:04:57 -0400
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com [IPv6:2607:f8b0:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D166DC061573;
        Mon, 31 Aug 2020 05:04:56 -0700 (PDT)
Received: by mail-il1-x142.google.com with SMTP id w8so778004ilj.8;
        Mon, 31 Aug 2020 05:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RVDQx/5Q8O0no/oayEfb/rYh2QGwLeWVgd4QIaQ9KVU=;
        b=KOr9Qg+p497+M09E6ouEKz4/321jfNwRllwXVHV7s8tjWJdNSkoOqR7nAFYm7KzZlp
         6sYFJ120y/KYbutta22YjS+bNwKkEY3vszYyEuv1LXnyOX28tLSaw2sEaNFovJZ1pVn7
         hTwokk2isRbexxzrPGkC5J0iu0T/hv2fJCnwcj8300Jl2pR8KfwID7gJoU4Z+wgyLo5W
         fFHT0hSt/5+QVbHorqyIbEnSf1i1hVFSeiGp8G+LltQk3+N5PXh0Ks4yuV1Ki5wXgc+z
         4x3KzQsm0OHZBZa/0wyac1ABifPbjpZs8fv+AsJzJxyz7/8d97ph4ZcaKNEV3Rjx+/ij
         EIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RVDQx/5Q8O0no/oayEfb/rYh2QGwLeWVgd4QIaQ9KVU=;
        b=BDuHVxRA9oMTUbdRVbeMaZw6kQKtnKoPgiCA13YuDyc5/4TT8odwguPTzNtJUGHQNN
         SEAkMkHTpYmYbSd/5FMxmbFfcsbK2EqSk69hSAEEncXwVpyM/OiKZcza/9jnSzcXN4sn
         +m8VWKPJN+4QQdFsDj7cKJVFq8kIe2qblhi+vvMIpkDcfnEauVZDnHWSSiKbrQnPoYNH
         28K9cK8M748treJfiJYe3/EKaq+y9JfTQgT96DsZH8CGXNWXz9yTM2Nmb3sgeyWYZXpb
         vSLgDQxJQ9FvhkPq6vujZaI284MtWOiDlA1OrzuDCOYB82LuNeop5okUxWnVW4o+2wHF
         918g==
X-Gm-Message-State: AOAM533ymwv6Z6QZY1DO+3y36UPzVanVmLjS9RqEgfaWT9e14fX0pkXG
        LbCJ7DmcwUpaJFGnTRJmSOtlrWyXWtmDsGMsCA==
X-Google-Smtp-Source: ABdhPJy/2RxfqWBVbmptzkzs0SLRso+GGnyPPFtOv7Ss3+nNUMZKXxx9jTL+DwuB/dl6lSNIuQm1ZDA8KFbroxwksZA=
X-Received: by 2002:a92:d902:: with SMTP id s2mr968251iln.21.1598875496080;
 Mon, 31 Aug 2020 05:04:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200830122051.197892-1-tali.perry1@gmail.com>
 <CAHp75VeX7OUeF=K_NmtXU4LACS9MxN1=nbSn01rvy-1MXoBL3Q@mail.gmail.com> <CAKKbWA46wSmvRshtMcShg8ka6aR2rYaB9b70EEYdQAHzJ=700g@mail.gmail.com>
In-Reply-To: <CAKKbWA46wSmvRshtMcShg8ka6aR2rYaB9b70EEYdQAHzJ=700g@mail.gmail.com>
From:   Avi Fishman <avifishman70@gmail.com>
Date:   Mon, 31 Aug 2020 15:03:34 +0300
Message-ID: <CAKKbWA71X7BJYPJg+iheaY+qXjc3hmOUb91Hmzr4Y-KZxdM_Jw@mail.gmail.com>
Subject: Re: [PATCH v2] i2c: npcm7xx: bug fix timeout (usec instead of msec)
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Tali Perry <tali.perry1@gmail.com>, kunyi@google.com,
        xqiu@google.com, Benjamin Fair <benjaminfair@google.com>,
        Joel Stanley <joel@jms.id.au>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Please ignore my last mail, Tali already sent v3.

On Mon, Aug 31, 2020 at 10:57 AM Avi Fishman <avifishman70@gmail.com> wrote:
>
> On Sun, Aug 30, 2020 at 9:01 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Sun, Aug 30, 2020 at 3:23 PM Tali Perry <tali.perry1@gmail.com> wrote:
> >
> > >
> > > i2c: npcm7xx: bug fix timeout (usec instead of msec)
> >
> > This commit message is awful. Please read [1] as a tutorial how to
> > write a commit messages.
> >
>
> Would this be better:
> i2c: npcm7xx: Fix microsecond timeout calculation
>
> Inside npcm_i2c_master_xfer() we calculate a timeout for the entire
> transaction in microseconds, the calculation was wrong so big i2c
> massages would timeout before they ended.
> This commit fix that.
>
> > [1]: https://chris.beams.io/posts/git-commit/
> >
> > ...
> >
> > > -       /* Adaptive TimeOut: astimated time in usec + 100% margin */
> > > -       timeout_usec = (2 * 10000 / bus->bus_freq) * (2 + nread + nwrite);
> > > +       /*
> > > +        * Adaptive TimeOut: estimated time in usec + 100% margin:
> > > +        * 2: double the timeout for clock stretching case
> > > +        * 9: bits per transaction (including the ack/nack)
> >
> > > +        * 1000000: micro second in a second
> >
> > No need. See below.
> >
> > > +        */
> >
> > > +       timeout_usec = (2 * 9 * 1000000 / bus->bus_freq) * (2 + nread + nwrite);
> >
> > USEC_PER_SEC
>
> OK
>
> >
> > >         timeout = max(msecs_to_jiffies(35), usecs_to_jiffies(timeout_usec));
> > >         if (nwrite >= 32 * 1024 || nread >= 32 * 1024) {
> > >                 dev_err(bus->dev, "i2c%d buffer too big\n", bus->num);
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
>
>
>
> --
> Regards,
> Avi



-- 
Regards,
Avi
