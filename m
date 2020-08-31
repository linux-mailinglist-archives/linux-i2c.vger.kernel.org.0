Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE8FA2574DB
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Aug 2020 09:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727065AbgHaH7G (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Aug 2020 03:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728197AbgHaH6z (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 31 Aug 2020 03:58:55 -0400
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com [IPv6:2607:f8b0:4864:20::d43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A17BCC061573;
        Mon, 31 Aug 2020 00:58:53 -0700 (PDT)
Received: by mail-io1-xd43.google.com with SMTP id g128so4902639iof.11;
        Mon, 31 Aug 2020 00:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZGpi+5qwZTXlfGi+xb+oDjdA7kPA3G9h6znjI9BQew0=;
        b=AOdCeQxT2jAza4/PKUwlGY32t9Nu7VJ5ktqVkH9a1b+k0F12J3MfmkECzbTg4jufCA
         jCLvQ2XJtHbIS7gI8U9W7STv4m4hPisAQzGqLu7M/q/P0enBWtyOWHIHtgGAufrSB7dg
         tBqkJuASBrVp+c5X0GQPi5qcvxUNK7P/wxe4Vkx+HCr6visW3UrptXnjGezadJCgGNwe
         /W6hhR4r5K9nnR3Rvj9IhbSYddF5UfI0wyYgXi4vjl5iID0mdpVHCiB82Z9WXdLmZvhQ
         eP8hGLezFV+mc0u9s8IQQdaMS43NOxx+B/DkjqKmXCoN3P2VLa1bEwwm+iD/z9qZ3DP+
         d0Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZGpi+5qwZTXlfGi+xb+oDjdA7kPA3G9h6znjI9BQew0=;
        b=tsoctX4Z9NqCE3TYx8pMoknJpAwrcbDBHX2QajuwKxOMB+OhfkNhawsmi8RyQsgPjp
         dYTCAwH1+of1cZnFTEtWEQsu64pJ1PKoiHCnWOvFWqEJJLh9FS/Y5K0SeBsz5Btb6He7
         jbZw0XZeR5hCVQQLis0WljOBxuI6thvPaIcy3ePbkcjRh2WUUIvMyBM6HmxTm14/dLAd
         C1oYPmcqzj95ftChu3koiwvyZiEtLa2bYESNRJTDmLx025OLlJoSFYrS8P7IkhOVmfZ+
         S8P49pPUcKK4ruiLHLaBgE6Jc2aVCGuhg4fRwNI4MihBNCJrj26t/ygaEklBSnMv4LDU
         KvJA==
X-Gm-Message-State: AOAM530K5ffCsnWUyq6d7FEIadEEmFo6pKPAGAyv6xb9h0NONuBihbSe
        /OzqUs60B3Yrr1dA3w3ACa51qJOU8hZGtYyol2fnV6nMcg==
X-Google-Smtp-Source: ABdhPJyzPNmQVuqnQsiy0uTVTWNT0Qbgcw6B7+74VyKPKvBv+1lPzo8yJnHlFDeW92m9d2egkd4N7kv/NrWlfHp+aTI=
X-Received: by 2002:a5d:954f:: with SMTP id a15mr361144ios.53.1598860733041;
 Mon, 31 Aug 2020 00:58:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200830122051.197892-1-tali.perry1@gmail.com> <CAHp75VeX7OUeF=K_NmtXU4LACS9MxN1=nbSn01rvy-1MXoBL3Q@mail.gmail.com>
In-Reply-To: <CAHp75VeX7OUeF=K_NmtXU4LACS9MxN1=nbSn01rvy-1MXoBL3Q@mail.gmail.com>
From:   Avi Fishman <avifishman70@gmail.com>
Date:   Mon, 31 Aug 2020 10:57:31 +0300
Message-ID: <CAKKbWA46wSmvRshtMcShg8ka6aR2rYaB9b70EEYdQAHzJ=700g@mail.gmail.com>
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

On Sun, Aug 30, 2020 at 9:01 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sun, Aug 30, 2020 at 3:23 PM Tali Perry <tali.perry1@gmail.com> wrote:
>
> >
> > i2c: npcm7xx: bug fix timeout (usec instead of msec)
>
> This commit message is awful. Please read [1] as a tutorial how to
> write a commit messages.
>

Would this be better:
i2c: npcm7xx: Fix microsecond timeout calculation

Inside npcm_i2c_master_xfer() we calculate a timeout for the entire
transaction in microseconds, the calculation was wrong so big i2c
massages would timeout before they ended.
This commit fix that.

> [1]: https://chris.beams.io/posts/git-commit/
>
> ...
>
> > -       /* Adaptive TimeOut: astimated time in usec + 100% margin */
> > -       timeout_usec = (2 * 10000 / bus->bus_freq) * (2 + nread + nwrite);
> > +       /*
> > +        * Adaptive TimeOut: estimated time in usec + 100% margin:
> > +        * 2: double the timeout for clock stretching case
> > +        * 9: bits per transaction (including the ack/nack)
>
> > +        * 1000000: micro second in a second
>
> No need. See below.
>
> > +        */
>
> > +       timeout_usec = (2 * 9 * 1000000 / bus->bus_freq) * (2 + nread + nwrite);
>
> USEC_PER_SEC

OK

>
> >         timeout = max(msecs_to_jiffies(35), usecs_to_jiffies(timeout_usec));
> >         if (nwrite >= 32 * 1024 || nread >= 32 * 1024) {
> >                 dev_err(bus->dev, "i2c%d buffer too big\n", bus->num);
>
> --
> With Best Regards,
> Andy Shevchenko



-- 
Regards,
Avi
