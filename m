Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3E3272209
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Sep 2020 13:15:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbgIULP2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Sep 2020 07:15:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726347AbgIULP1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Sep 2020 07:15:27 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBFECC061755;
        Mon, 21 Sep 2020 04:15:27 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id 34so8721725pgo.13;
        Mon, 21 Sep 2020 04:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MngPZs8exR/vA7ZNHKQcqmS1MllzhXNLPWSroEcCreo=;
        b=LX0emU0LoPbym8bk1qDg8dvbOd8iXZQmRjJTQ9/DLIivbsbncsGxpcbGsIbIyBYQpk
         lLGjBdH9DDte3Ja2+7j1lkkU7qaVrq1xJd27p2OYMtdMuaPmAGJMGeejyHcKvX8tHgo/
         VKGnGuLucrAoITjLxtWOLn5kJOJ/sPNeuDIIQ4nOkZZ5BJ1gv4IZq7y13s17T8timuKn
         6XRLIszHX5PGmSX58TyJgELBbz2+9LlitWKIWyb06KVdJgeEQjGe/UtcSeY+72VsoQdK
         /vOXtCXfC0H2vaukjh56ML4kn090wXwV2lnky+R3ZcCe9/s8BPT0cUeDRMDYZwtJf82n
         bQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MngPZs8exR/vA7ZNHKQcqmS1MllzhXNLPWSroEcCreo=;
        b=OY0Xon0csdmjcUuwiCUJ0RGUlY87V71LeN1DCE/yv3mxmwvjP39zkT1bRXdD4TX8bE
         pMDr0NPePIPL3Sw7M7hsCjr6uOOttSqV7mdrEmFrNgrOYNUO8k4ytdnSHo7AeW51VYAI
         Y59OkbvwHKRDG3swhcLadABkFJfqd0WL6OAGU5hda6X+bERqVdjl/ZbbD5HuJMoqNWKa
         HHVlidR4BqkDmBf6wSSzD6KjuiJi7DwXcTRvmv3LD78NsuN2bi2tbeIVRSHD7ZZDdr+p
         /Zt2NcQvDnGIn0FJyxai+Ka3wl29tTOMY5z18aHkBkKZVkGXapsU/oLGmYrHQ0VAhFC8
         VBRQ==
X-Gm-Message-State: AOAM533cZzID/JNxmVur7nucFgOMPdVSuVCUpbXgWFyMagTcrkH88K/b
        IH5nRMCylZXcPkoEpLCJ6zRAxkrqj5jqBVS8vgw=
X-Google-Smtp-Source: ABdhPJzey1/Xon9D8NUVucg/ZLX3GIc6RVy5tXjThImNyN3M1IVbLYNwOZJSnpND6kXCkDfQoSrpG57wAsYZlIWIS0g=
X-Received: by 2002:a63:d648:: with SMTP id d8mr36718890pgj.4.1600686927127;
 Mon, 21 Sep 2020 04:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200908224006.25636-1-digetx@gmail.com> <20200908224006.25636-13-digetx@gmail.com>
 <20200917113846.GX3515672@ulmo> <CAHp75Vd_B9WLM99LnN2YiZ045z8SUkD7KwY2wVEUeQ9Mx7fg5g@mail.gmail.com>
 <20200921110159.GD3950626@ulmo>
In-Reply-To: <20200921110159.GD3950626@ulmo>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 21 Sep 2020 14:15:09 +0300
Message-ID: <CAHp75VcpoZ-m2wkJGv4s+KthOVLQR1XBTzMFMmvj-Q82BEh7NQ@mail.gmail.com>
Subject: Re: [PATCH v7 12/34] i2c: tegra: Use clk-bulk helpers
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Sep 21, 2020 at 2:02 PM Thierry Reding <thierry.reding@gmail.com> wrote:
> On Thu, Sep 17, 2020 at 04:54:28PM +0300, Andy Shevchenko wrote:
> > On Thu, Sep 17, 2020 at 2:38 PM Thierry Reding <thierry.reding@gmail.com> wrote:
> > > On Wed, Sep 09, 2020 at 01:39:44AM +0300, Dmitry Osipenko wrote:

...

> > > This is tempting from a diffstat point of view, but the downside is that
> > > we can now no longer validate that all of the necessary clocks are given
> > > in device tree.
> > >
> > > Previously the driver would fail to probe the I2C controller if any of
> > > the expected clocks were not defined in device tree, but now it's just
> > > going to continue without it and not give any indication as to what's
> > > wrong.
> >
> > You may print an error in the error path as previously. Since both
> > clocks are mandatory (as far as I understood the code) user will need
> > to check DT in any case.
>
> The problem is that the number of required clocks depends on the variant
> of the IP block that's implemented. Some require just one clock and
> others require two or three. With this patch the driver is just going to
> pick whatever clocks are given in device tree, but it removes any
> possibility of detecting whether the device trees contain the correct
> clocks. So we may very well run into a situation where the driver now
> successfully probes but then malfunctions because one or more of the
> clocks were not specified in device tree.
>
> Thierry

I still failed to get this. Are you suggesting that CCF bulk
operations are fundamentally broken?

In the above case one may add more checks. AFAICS is_vi won't be
removed, so can be easily checked.
Basically that for-loop for div_clk is questionable. I agree on that.


-- 
With Best Regards,
Andy Shevchenko
