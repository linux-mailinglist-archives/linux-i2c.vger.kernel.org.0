Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0186722A1C4
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jul 2020 00:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbgGVWI3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Jul 2020 18:08:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38638 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726642AbgGVWI3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Jul 2020 18:08:29 -0400
Received: from mail-vs1-xe43.google.com (mail-vs1-xe43.google.com [IPv6:2607:f8b0:4864:20::e43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B97EC0619E1
        for <linux-i2c@vger.kernel.org>; Wed, 22 Jul 2020 15:08:29 -0700 (PDT)
Received: by mail-vs1-xe43.google.com with SMTP id m6so2009379vsl.12
        for <linux-i2c@vger.kernel.org>; Wed, 22 Jul 2020 15:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wUNWDv0pMvOxp3f1lq5ubWVgLTQ75vGUx1UyIToohCs=;
        b=kqsyj1xN2xk8GBmQL+ZMGDx/S5h87V9fnQpibUyeZjaONvTDcRgLHjE8PqbBx7DGFp
         Ahbis0yqSTcab9Ul9KNZ7DuQFFmo5+Xvc9Gf6pZeeZTMcywy8m10G6WwlwxkSaH/M+cM
         R4EjCh92aMjx/SlIcpDp8HZuUkRo4KKJkUJKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wUNWDv0pMvOxp3f1lq5ubWVgLTQ75vGUx1UyIToohCs=;
        b=LGJJshYKxS0o9k34oeTOXV0/zvB3t2JQdhdSL8eu6VHwpNG+tYqNggdqoJo0dWRJoJ
         rkkoX/VM1r5EkCufnqr4bpNtbW7ui9kLbE03/iLLPfz+NNrY/XlnnvoAXoBgwdNx8LDw
         e5m5T8b2+1FkRzRcyRUs70KjsMnv0563t73c5Vg6CIeEHJTdT/GzujjZxyTmOtBIQEwN
         9rIB7wwY6QQCL/HdwRHJ+qD48A8WWvaQ3FCFnTXAtadcm73HuBEoXhl92s9Tf9CpygmP
         UnARYEmiGP6njhrfujAHP7JjNXINhbH40aT4BNDJEo+n7bo4LTuHaqsS/wn/jp0vWCg3
         Awbw==
X-Gm-Message-State: AOAM532ahUpPRJIeH3W8zfkTlVbShCqGVxMNO6JqwH1mGSpUjlE7eiuU
        tDAOa7orZzJaf/75Qetp7R58Z6ulUck=
X-Google-Smtp-Source: ABdhPJxMngQoACs93Wo3IO1UWs9OhlqWCDV+g6iGear2++GHaPrdmBKS0MAFaK5ba8gWKjzQu4G1sA==
X-Received: by 2002:a67:fd1a:: with SMTP id f26mr1829674vsr.78.1595455708014;
        Wed, 22 Jul 2020 15:08:28 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id q7sm147462vsp.14.2020.07.22.15.08.26
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2020 15:08:26 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id o25so1173392uar.1
        for <linux-i2c@vger.kernel.org>; Wed, 22 Jul 2020 15:08:26 -0700 (PDT)
X-Received: by 2002:ab0:150c:: with SMTP id o12mr1758711uae.90.1595455706030;
 Wed, 22 Jul 2020 15:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200720172448.1.I7efdf6efaa6edadbb690196cd4fbe3392a582c89@changeid>
 <159531115483.3847286.18280088484118119899@swboyd.mtv.corp.google.com>
 <159531527579.3847286.1254956818647049462@swboyd.mtv.corp.google.com>
 <CAD=FV=X=NDym3V31dQ8c341UwQm9pDybUCR8jFF1JR99XeVKVw@mail.gmail.com>
 <159535775253.3847286.5195740102798837524@swboyd.mtv.corp.google.com> <CAD=FV=WhsPkaB_cLNzGuuBrAEHiyrM9TGGvhUY4+0C=SzWwsHA@mail.gmail.com>
In-Reply-To: <CAD=FV=WhsPkaB_cLNzGuuBrAEHiyrM9TGGvhUY4+0C=SzWwsHA@mail.gmail.com>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 22 Jul 2020 15:08:14 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Vt+0xQ6wpyF2y1TqS8d04nq4x1b_TcLwy2aNO4dn9x4g@mail.gmail.com>
Message-ID: <CAD=FV=Vt+0xQ6wpyF2y1TqS8d04nq4x1b_TcLwy2aNO4dn9x4g@mail.gmail.com>
Subject: Re: [PATCH] i2c: i2c-qcom-geni: Fix DMA transfer race
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Tue, Jul 21, 2020 at 1:26 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Tue, Jul 21, 2020 at 11:55 AM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Doug Anderson (2020-07-21 09:18:35)
> > > On Tue, Jul 21, 2020 at 12:08 AM Stephen Boyd <swboyd@chromium.org> wrote:
> > > >
> > > > Quoting Stephen Boyd (2020-07-20 22:59:14)
> > > > >
> > > > > I worry that we also need a dmb() here to make sure the dma buffer is
> > > > > properly mapped before this write to the device is attempted. But it may
> > > > > only matter to be before the I2C_READ.
> > > > >
> > > >
> > > > I'm suggesting this patch instead where we make geni_se_setup_m_cmd()
> > > > use a writel() so that it has the proper barrier semantics to wait for
> > > > the other memory writes that happened in program order before this point
> > > > to complete before the device is kicked to do a read or a write.
> > >
> > > Are you saying that dma_map_single() isn't guaranteed to have a
> > > barrier or something?  I tried to do some searching and found a thread
> > > [1] where someone tried to add a barrierless variant of them.  To me
> > > that means that the current APIs have barriers.
> > >
> > > ...or is there something else you're worried about?
> >
> > I'm not really thinking about dma_map_single() having a barrier or not.
> > The patch you mention is from 2010. Many things have changed in the last
> > decade. Does it have barrier semantics? The presence of a patch on the
> > mailing list doesn't mean much.
>
> Yes, it's pretty old, but if you follow the thread and look at the
> patch I'm fairly certain it's still relevant.  Specifically, following
> one thread of dma_map_single() on arm64:
>
> dma_map_single()
> -> dma_map_single_attrs()
> --> dma_map_page_attrs()
> ---> dma_direct_map_page()
> ----> arch_sync_dma_for_device()
> -----> __dma_map_area()
> ------> __dma_inv_area() which has a "dsb"
>
> I'm sure there are lots of other possible paths, but one thing pointed
> out by following that path is 'DMA_ATTR_SKIP_CPU_SYNC'.  The
> documentation of that option talks about the normal flow.  It says
> that in the normal flow that dma_map_{single,page,sg} will
> synchronize.  We are in the normal flow here.
>
> As far as I understand, the whole point of dma_map_single() is to take
> a given buffer and get it all ready so that if a device does DMA on it
> right after the function exits that it's all set.
>
>
> > Specifically I'm looking at "KERNEL I/O BARRIER EFFECTS" of
> > Documentation/memory-barriers.txt and noticing that this driver is using
> > relaxed IO accessors meaning that the reads and writes aren't ordered
> > with respect to other memory accesses. They're only ordered to
> > themselves within the same device. I'm concerned that the CPU will issue
> > the IO access to start the write DMA operation before the buffer is
> > copied over due to out of order execution.
>
> I'm not an expert either, but it really looks like dma_map_single()
> does all that we need it to.
>
>
> > I'm not an expert in this area, but this is why we ask driver authors to
> > use the non-relaxed accessors because they have the appropriate
> > semantics built in to make them easy to reason about. They do what they
> > say when they say to do it.
>
> I'm all for avoiding using the relaxed variants too except if it's
> been shown to be a performance problem.  The one hesitation I have,
> though, is that I've spent time poking a bunch at the geni SPI driver.
> We do _a lot_ of very small SPI transfers on our system.  For each of
> these it's gotta setup a lot of commands.  When I was poking I
> definitely noticed the difference between writel() and
> writel_relaxed().  If we can save a few microseconds on each one of
> these transfers it's probably worth it since it's effectively in the
> inner loop of some transfers.
>
> One option I thought of was to track the mode (DMA vs. FIFO) and only
> do writel() for DMA mode.  If you're not convinced by my arguments
> about dma_map_single(), would you be good with just doing the
> non-relaxed version if we're in DMA mode?

OK, so I did some quick benchmarking and I couldn't find any
performance regression with just always using writel() here.  Even if
dma_map_single() does guarantee that things are synced:

* There's no guarantee that all geni users will use dma_map_{xxx}.

* As Stephen says, the writel() is easier to reason about.

The change to a writel() is a bit orthogonal to the issue being
discussed here, though and it wouldn't make sense to have one patch
touch both the geni headers and also the i2c code.  Thus, I have sent
v2 without it (just with the other fixes that Stephen requested) and
also sent out a separate patch to change from writel_relaxed() to
writel().

Breadcrumbs:

[PATCH v2] i2c: i2c-qcom-geni: Fix DMA transfer race
https://lore.kernel.org/r/20200722145948.v2.1.I7efdf6efaa6edadbb690196cd4fbe3392a582c89@changeid/

[PATCH] soc: qcom-geni-se: Don't use relaxed writes when writing commands
https://lore.kernel.org/r/20200722150113.1.Ia50ab5cb8a6d3a73d302e6bdc25542d48ffd27f4@changeid/

As mentioned after the cut in the i2c change, I have kept people's
tested/reviewed tags for v2.

-Doug
