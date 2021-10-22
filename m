Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D1D7437B26
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Oct 2021 18:54:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231893AbhJVQ4R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Oct 2021 12:56:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230340AbhJVQ4Q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Oct 2021 12:56:16 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C45C6C061766
        for <linux-i2c@vger.kernel.org>; Fri, 22 Oct 2021 09:53:58 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id r7so3218204wrc.10
        for <linux-i2c@vger.kernel.org>; Fri, 22 Oct 2021 09:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XBYpLCzxBp4dnqMRtudEayqwtt6586cSrD3vD1zTYK4=;
        b=ZQa2TulqQuJs13cEwGzAmwTNflFa//aAb1TCujoiZ3w++2Fm+ghOs28w0Zg9izrxc7
         rz3m+09fm4EdrFzNrqlEfGtjItSLd4+5zUG4JG5QcODmXXFSIxUygRlpx1i2xm/O1hw0
         Xw2h0a2npU42wE3Ofld/9C6Yr5Ww4gWzFPdXWaMSl6FhfGxtYQRy2Amp02WB1np/6oSd
         RKiuHAQaEPNmJaTwYCcC9FFUohrTq/yhgkVcE2JKyrqPCf5A2a4nxwwoEn9TvQ3cGAWF
         nCiUyKJmWHKFtBvTmcwFq8rskye4uu6Fva8HAZUUAhAhKF5Fi7E87+DuDj3ka2oX4yoQ
         TZvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XBYpLCzxBp4dnqMRtudEayqwtt6586cSrD3vD1zTYK4=;
        b=ilChbFgccXEGBnfiUY9CtJPZ9FLfqiqEheoTP3Eq24iSzRxhCi9Sce2mDavbvUlxeH
         Ca508+c2gIzKA7NjW/H+2KoHEedoj3CFpiOSj+mK3Q5DXhZSLjblWR1s8TFHMUoU1gR3
         J787V2XfyUWLTrAk2zlbODjubd7m4p5ja540kOPA9MNTZ361Fugml4bhbZNXytK1Jpyf
         TtzB0kSi7Vd/j65zwD0PzbpB+tB9XsNriCf4nUkFH61Z26mGXdzKc5m9jxSaAwiMF5vB
         mxI6pg2/+KZpz4JnMhQcOdsjTeX2VQdeIcyyqeVY2LNK29kRBJdp7cCRRnBvNih2nOPZ
         ssCA==
X-Gm-Message-State: AOAM5327GM3eRqz+HIj9Elm7dlKGSykVgz8SSGC3iS9JiwG63u+f0jmH
        o52WjaC++5uThe1oPKfpTRDkJ6ARL6RYzfatxbL6IA==
X-Google-Smtp-Source: ABdhPJyD3xwrnY7QjdqI3oOap5Bt2wrcAdc89XNctOI16iX51jdRgWFta04EIVXopHJrE0LrTBL/4vDEiv73SO9v3pw=
X-Received: by 2002:adf:f305:: with SMTP id i5mr1180523wro.155.1634921637042;
 Fri, 22 Oct 2021 09:53:57 -0700 (PDT)
MIME-Version: 1.0
References: <20211022022859.1888836-1-rajatja@google.com> <20211022022859.1888836-2-rajatja@google.com>
 <7d94d015-ebff-ee46-3726-9091fe3cdff4@linux.intel.com>
In-Reply-To: <7d94d015-ebff-ee46-3726-9091fe3cdff4@linux.intel.com>
From:   Dmitry Torokhov <dtor@google.com>
Date:   Fri, 22 Oct 2021 09:53:40 -0700
Message-ID: <CAE_wzQ8nBBHMr4c=SXVpDq2iz=eu0RbJgTHrKkU1_Hsdj9SLzQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] i2c: designware: Enable async suspend / resume of
 designware devices
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Rajat Jain <rajatja@google.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        rajatxjain@gmail.com, dbasehore@chromium.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jarkko,

On Fri, Oct 22, 2021 at 4:37 AM Jarkko Nikula
<jarkko.nikula@linux.intel.com> wrote:
>
> On 10/22/21 5:28 AM, Rajat Jain wrote:
> > Mark the designware devices for asynchronous suspend. With this, the
> > resume for designware devices does not get stuck behind other unrelated
> > devices (e.g. intel_backlight that takes hundreds of ms to resume,
> > waiting for its parent devices).
> >
> > Signed-off-by: Rajat Jain <rajatja@google.com>
> > ---
> >   drivers/i2c/busses/i2c-designware-platdrv.c | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> > index 21113665ddea..2bd81abc86f6 100644
> > --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> > +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> > @@ -293,6 +293,8 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
> >                                       DPM_FLAG_MAY_SKIP_RESUME);
> >       }
> >
> > +     device_enable_async_suspend(&pdev->dev);
> > +
> >       /* The code below assumes runtime PM to be disabled. */
> >       WARN_ON(pm_runtime_enabled(&pdev->dev));
> >
> I guess same can be done to i2c_dw_pci_probe() too. I don't have any
> strong opinion should it be done in this patch or somewhere in the future.

All PCI devices are marked for asynchronous suspend/resume by default.
See drivers/pci/pci.c::pci_pm_init().

Thanks,
Dmitry
