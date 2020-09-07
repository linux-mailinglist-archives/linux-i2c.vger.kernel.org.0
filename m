Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63D7C25FD63
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Sep 2020 17:47:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730182AbgIGPfk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Sep 2020 11:35:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730180AbgIGPfO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Sep 2020 11:35:14 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5F5FC061573;
        Mon,  7 Sep 2020 08:35:13 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id j7so1797050plk.11;
        Mon, 07 Sep 2020 08:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2iFqwT4LVt1GmMyaphEkLC+szKUS+5awlK2tO4HV4yY=;
        b=LRKop/o+FlX1+zxDoN3dyTWIXA9Hufu8ozxbvEaVbPt4avhksSHg9gg9Xdjc2X4jCM
         49L/Y5ssEHT3vyL4oaDQoiL4CwMpfWm8lufVeLBM0b4db9fWZWZdWDSOIUN1oXvajxGr
         9J6CGcp9dg7y11Ag5XIMPKrq41dg5qxYgplmbqKnV4KTdfzzYZIKnTOF6B4mrZolfyU9
         rP5Fp+oau2Ca8t1yKK6tNmDQfErqPodidON7Cq0FLIY/vdwXaMWpT4tFJBLx24MNR92V
         hzzsuTBYphkb+1ndB+gV4FiJPIkVzWzjMRpt7jzevgWi8tTZCttpDSuGzPmI8ruzkF0F
         vvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2iFqwT4LVt1GmMyaphEkLC+szKUS+5awlK2tO4HV4yY=;
        b=rANkHskJXYhSZsMntbyPmdI3emCWNKBZOL+Bd3dWqxEI973rF/H2nZb2/+floUrcHi
         vG+0vCgIR/t2FgUraYSCOEQligGYXd/khU4Zoz8h1XLnxsQQPpc2UCV5wBjNMKTLnYgX
         43v61JXHdi7QYn5Upmqa1AwzxYXEVJP/dUZz2Zr5ovcaI6AYgTPN2u/ju+A/M+ou3t+b
         9jmq+JpJHHgggQ9M9sMwtwUN84CRj/TWh8hiOuxcUR6jxt4735ApWfrx+MLpDcDLm7wW
         cWKLPiSkrX3KbL/jHMZk8/uHZ+Pf4mk/AIZ2nxLAC77h7ec/RjDFqMSUtNcGdGccThdj
         P49w==
X-Gm-Message-State: AOAM530s8Kf4NK4lwFTBqzb7eN8aETCPKESMm2gDPRsCuiBWxX2In753
        n8QcuqlW8ewYPG/25oWLk14CCLWfmQF0fBoDhFw=
X-Google-Smtp-Source: ABdhPJw166M/KQdh5DvSJ2ii7x1eL8g3Lg4xkKxVgvriGvUnalc2cdM9ihP20WgqavU85pKjXWFLcv4Aje1FYx6gK4s=
X-Received: by 2002:a17:902:b289:: with SMTP id u9mr19923485plr.226.1599492913310;
 Mon, 07 Sep 2020 08:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200906185039.22700-1-digetx@gmail.com> <20200906185039.22700-7-digetx@gmail.com>
 <CAHp75VevXe3c2LGF3jZyDfvPpRAz+-GQKvXEO4OKvuur=RgXCQ@mail.gmail.com>
 <f9ec5178-e38e-ed9a-25f8-21e53ccd31d1@gmail.com> <CAHp75Vdj7HYN0SWt9StqB8K6JrUCk7dtDhAUwYDkkBXc1R8ueg@mail.gmail.com>
 <c76f64c8-bd46-36f0-edb4-3ddca281a72b@gmail.com>
In-Reply-To: <c76f64c8-bd46-36f0-edb4-3ddca281a72b@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 7 Sep 2020 18:34:56 +0300
Message-ID: <CAHp75Vf3BirttCnW5KarsL0_MqofpWnEN5K5z+TY2YZV-R9fhQ@mail.gmail.com>
Subject: Re: [PATCH v5 06/36] i2c: tegra: Runtime PM always available on Tegra
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

On Mon, Sep 7, 2020 at 6:25 PM Dmitry Osipenko <digetx@gmail.com> wrote:
> 07.09.2020 18:05, Andy Shevchenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> > On Mon, Sep 7, 2020 at 5:32 PM Dmitry Osipenko <digetx@gmail.com> wrote=
:
> >> 07.09.2020 11:10, Andy Shevchenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

...

> >> Would be great if anyone could put effort into changing the default
> >> get_sync() behaviour and add get_sync_nofail(). Otherwise this will be=
 a
> >> never ending problem.
> >
> > I didn't get this. For time being the API (yes, with its all cons) has
> > the clear usage:
> > a) don't check for errors -- you are fine
> > b) if you start checking errors, keep in mind refcounting.
> >
> > So, I don't see how nofail() can fix b) case.
> >
>
> It's a very unintuitive behaviour which none of other APIs have. I would
> never expect the refcount to be bumped in a case of error, this is a
> clear drawback of the API, IMO.

I agree.

> Perhaps this is not seen as a problem by
> people who have excellent memory and can easily remember about existence
> of such non-standard quirks, or by people who're touching the RPM code
> frequently.

...or by running coccinelle script.

--=20
With Best Regards,
Andy Shevchenko
