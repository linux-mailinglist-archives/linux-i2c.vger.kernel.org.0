Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F87C261D8D
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Sep 2020 21:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732355AbgIHTis (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Sep 2020 15:38:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730656AbgIHPzo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Sep 2020 11:55:44 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D448C0612A1;
        Tue,  8 Sep 2020 06:03:26 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id b17so5859490pji.1;
        Tue, 08 Sep 2020 06:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=sf6a+1vn+PmIzZTwltttDMRYJhSjubXwj0sptER78Cg=;
        b=EVypWNpQGe7fdEBP/w3Ex8aHY6qG3F+pzY+HHQ8cvn/RX8uRQ9iYey6zToII+I2HnN
         1ZbXnM+mdjihJr3CCrtVCuH10zw8w4VCBeC30hnqbom+jaZ/b5BDzk+UfWfVbSv88lyx
         R2WYUpfftSEN+a7nDUBXP0FiwLWI+NFOHvTuVND2xKHYp80zzQslIbGctvHIx+/vfp1o
         mCQ5SQaru8CVngU5ePygDORUPi+0+YAryHscMKKK9AVFmboPXrpEePY+nwJyQWLd2xh4
         4YZhTysC0qTL2lPsqEx8/XE82Ojsrv2dRiqpgU/bZqsuBNv8FziKD4RVWz6qf20Jw0er
         6bmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=sf6a+1vn+PmIzZTwltttDMRYJhSjubXwj0sptER78Cg=;
        b=cbBSr0ItA4TgLcTZSTST0E+Zjd9rd6GZjX4zfHCEJLEC7Ae73MiwPTQmrwlTgXAGun
         GoR8vbeHT/eB6aItMCqiAI8PVIR4wYihUY1WMrOwcnGQzDTkjsNOeTXU+qFnsO9S9oNp
         HqrUdW3o3o9+ZJeZ8pEqy6QRY2Uv0bzjtlbr0S8KYSK2ZOKdbD++8KBnx0gfBQEAphJK
         OMAb4T64UZPBygFPAx4+sHDFZ/lprHne/xbrWBMNuHBQ+eFB4A6PXo9LCRsukPtnJo2H
         o6uMXuqb4HYilcgPNx5tPQmCG9SS7t+DzU+2rLXDm4RaC3uhxbiGor5QYJF7+0PV41Yl
         hH1w==
X-Gm-Message-State: AOAM533G7EcFPKk1bERSvvj9ckJTu27a9oEKTdwdYj0sJtAC4y7jKk3c
        ZQQ/u23LvfxVselnXb/GMWr4tl4J0QWMj9ZdpMk=
X-Google-Smtp-Source: ABdhPJxHanwqPAVJ1RW0hDye4bv+gbZ+NxF7HkD04xmpdKJ2ZD7XG60T/1/a6CBN8dwvP8IgYpSTrCwrQqlszx/Fhv4=
X-Received: by 2002:a17:90a:b387:: with SMTP id e7mr4003979pjr.228.1599570205525;
 Tue, 08 Sep 2020 06:03:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200908021021.9123-1-digetx@gmail.com> <20200908021021.9123-17-digetx@gmail.com>
 <CAHp75VefU+iXpngPnzQRBfrg3OgLUBqhOCJpPo8natfCBr6Q5w@mail.gmail.com> <3fce58d0-eac6-bbea-74e3-098cb079e9b5@gmail.com>
In-Reply-To: <3fce58d0-eac6-bbea-74e3-098cb079e9b5@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 8 Sep 2020 16:03:07 +0300
Message-ID: <CAHp75VfR_4KVYL5rYU6XjQuaozT8W=Opy2cHAV4dB_1VcY1g0Q@mail.gmail.com>
Subject: Re: [PATCH v6 16/35] i2c: tegra: Reorder location of functions in the code
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Sep 8, 2020 at 3:55 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> 08.09.2020 11:43, Andy Shevchenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Tue, Sep 8, 2020 at 5:11 AM Dmitry Osipenko <digetx@gmail.com> wrote=
:
> >>
> >> Reorder location of functions in the code in order to have definition
> >> of functions closer to the place of the invocation. This change makes
> >> easier to navigate around the code and removes the need to have a
> >> prototype for tegra_i2c_init().
> >
> > Still seems to have ordering issues (it moves pieces you actually
> > change in the next patches).
>
> It's unavoidable that this patch either touches previous or next
> changes. You actually had an opposite complaint to v5.

Nice :-)

> This diver has a long overdue for the refactoring. I think it's a good
> time to do it right now because driver works stable and it's quite
> unlikely that there will ever be fixes for the older code. Hence it
> should be good to have the code reordered now, so that we could have a
> nicer code base for the future changes.

I agree.

> > Have you considered which one looks neat this variant or if you move
> > it closer to the end of the series?

> This variant should be more logical because changes have this order:
>
> 1. fixes
> 2. features
> 3. code reorder
> 4. more important cleanups
> 5. less important cleanups
>
> The 3 merely shuffles code around without any changes to the code, hence
> it's a safe change.
>
> The 4 has a potential danger since there are cleanups of the outdated
> features and some changes may change semantic in a case of a bug. Hence,
> if in the future we'll happen to find a problem in one of the 4 patches,
> then there is a better chance that the problem could be fixed with a
> simple revert. If 3 is placed after 4, then the chance is completely gone=
.

Thanks for elaboration. If you think so (and I guess you are), go ahead!

--=20
With Best Regards,
Andy Shevchenko
