Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B63B128073D
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Oct 2020 20:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730073AbgJASvl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Oct 2020 14:51:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729047AbgJASvh (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Oct 2020 14:51:37 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF276C0613D0;
        Thu,  1 Oct 2020 11:51:36 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id gm14so2498609pjb.2;
        Thu, 01 Oct 2020 11:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZirwObhtZu4UfQ0RJa0sK4GHQGoD3UYNIxW4BRzyJBM=;
        b=JAKBPF1IKivYr9lonwxZtGB2nRjbKqZPC2XVMe3R8tOwFjBerV2WnT2quoFT0lZm/+
         qoeZV2Ty1jSrtwxPjd28TLgLurrz5PKq2qPuQ25onabfmIpQZ7bOC3h9EhSa503iSqW1
         uJqeWMeXn7UGTRd/235wh5QXCFsppIL5sjn2cGMcMy90ch8ajQvI+2yiJcFhPCxqZvuB
         4RSxzgxti0DsaDY9eV/XPcbYdor6QOxvd+LOJhtI8z5firVojbmo03e5Qh4HDszjdFxr
         m+tdIQ/BlDD6/4LMFqv5ANQkgDyUf8jOC8rdTFonr3oDgWgBpCR/vjxuz2n/uTnMfQBy
         sXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZirwObhtZu4UfQ0RJa0sK4GHQGoD3UYNIxW4BRzyJBM=;
        b=k+miKQXBTtL4AP0BnRcgzkv9HtqYjNRP1vMa2O9NwTF/ovrq/9heMscWhlwZ3o0jKT
         95do0LzZwCx9ykhZYWI5/+8myXcBrVaXHXMOh9Wi0xQvu1D90+FpS993r0XDvvcjwqQG
         byay2HLDjf72rP6GmX6iXd+32DEcjDuW7pI4v4pKh01p5qQ1soCLqtLMQKN+tknCaxge
         dSQl+/l5Ya5FJpfZlj5+0sTfTNAsXNqyFfz0WI6f84WE9UhG9+St5b4q6HyncwmUKd3U
         Gqz6tZpbRSW3TaAeimj/AWJcyIL6VS6RpLn+k/L4pegOuTbDd7y+Bd4HBn6+mMpHWKaV
         W45A==
X-Gm-Message-State: AOAM53094wzH+bizgnrmDe76PXUtMGGlkd056j9diaZTrmfz3mQPGCJM
        YK8oGbGjDB8s4kMOh7iLuhEkYo4LxPZqx+uwWT+2sKwD3/CSRw==
X-Google-Smtp-Source: ABdhPJzapsIspopKkorTGURWoj9w8qxjRcSv9HDQdcXQFsJasJlSM5z2S/HHegz4nZBhIPKdR/o7yxW5y0ipXw8ZG+E=
X-Received: by 2002:a17:90b:fc4:: with SMTP id gd4mr1284026pjb.129.1601578296321;
 Thu, 01 Oct 2020 11:51:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200930071342.98691-1-tali.perry1@gmail.com> <20200930093117.GY3956970@smile.fi.intel.com>
 <CAHb3i=sWxiVLCC0hfY+6-_x92ZEMY7Ctyyuz9CbMYxrH_BqAZQ@mail.gmail.com>
 <CAHp75Vc3Bw-dTpEmpeUpB4n5-8-xGPx+jm_HkB5Pj6Qr8U=CAw@mail.gmail.com>
 <CAKKbWA4gHobXFGi5CiPnawWoMOi0GFrCbzanuOFZ+Aky6=9Mpg@mail.gmail.com>
 <20201001174046.GK3956970@smile.fi.intel.com> <CAA_a9xL+qP3zOy=oKHjCuR+CvsXeoU5EX9WgEhUH0Fza2Vs5DA@mail.gmail.com>
 <CAKKbWA62G+B7p-bc7TRoa22iJNGdTUaopQVj3S3_FHh43ntasA@mail.gmail.com>
In-Reply-To: <CAKKbWA62G+B7p-bc7TRoa22iJNGdTUaopQVj3S3_FHh43ntasA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 1 Oct 2020 21:51:17 +0300
Message-ID: <CAHp75Ver-O8=3eKHsHoKgpdd0sBQhLiC+UAqM=4C-gUfMBteuA@mail.gmail.com>
Subject: Re: [PATCH v1] i2c: npcm7xx: Support changing bus speed using debugfs.
To:     Avi Fishman <avifishman70@gmail.com>
Cc:     Alex Qiu <xqiu@google.com>, Tali Perry <tali.perry1@gmail.com>,
        Wolfram Sang <wsa@kernel.org>, Kun Yi <kunyi@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Joel Stanley <joel@jms.id.au>,
        Tomer Maimon <tmaimon77@gmail.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Oct 1, 2020 at 9:42 PM Avi Fishman <avifishman70@gmail.com> wrote:
>
> Tali indeed pointed our major customers (Alex represent one of them :)
> that this feature must be handled carefully since it may break the
> communication and they are aware of that. Nevertheless they still want
> this feature, they already reviewed this and accepted it (in internal
> mails)
>
> So we will appreciate if this will be accepted.
>
> On Thu, Oct 1, 2020 at 9:27 PM Alex Qiu <xqiu@google.com> wrote:
> >
> > On Thu, Oct 1, 2020 at 10:41 AM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > >
> > > On Thu, Oct 01, 2020 at 08:13:49PM +0300, Avi Fishman wrote:
> > > > Hi Andy,
> > > >
> > > > Customers using BMC with complex i2c topology asked us to support
> > > > changing bus frequency at run time, for example same device will
> > > > communicate with one slave at 100Kbp/s and another with 400kbp/s and
> > > > maybe also with smae device at different speed (for example an i2c
> > > > mux).
> > > > This is not only for debug.
> > >
> > > The above design is fragile to start with. If you have connected peripheral
> > > devices with different speed limitations and you try to access faster one the
> > > slower ones may block and break the bus which will need recovery.
> > >
> >
> > Hi Andy,
> >
> > To clarify, we are using a single read-only image to support multiple
> > configurations, so the supported bus rate of the devices are not known
> > at compile time, but at runtime. We start with 100 kHz, and go 400 kHz
> > if applicable. FYI, we are using 5.1 kernel, however I don't know much
> > about DT overlay.

I see. So, there are following statements:
 - the elaboration is good but I guess needs to be added somewhere in
form of the documentation
 - the internal schedules or so are not crucial for the upstream (it
rather sounds like a bribing the judge)
 - the current approach, if I'm not mistaken, is using debugfs, which
is not ABI and it's good
 - I'm not a maintainer here, but I don't like the approach

Let the maintainer decide.

-- 
With Best Regards,
Andy Shevchenko
