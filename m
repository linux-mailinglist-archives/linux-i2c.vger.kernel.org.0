Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 990DF37BEDA
	for <lists+linux-i2c@lfdr.de>; Wed, 12 May 2021 15:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230448AbhELNwR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 May 2021 09:52:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbhELNwQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 May 2021 09:52:16 -0400
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66B11C06175F
        for <linux-i2c@vger.kernel.org>; Wed, 12 May 2021 06:51:08 -0700 (PDT)
Received: by mail-vk1-xa29.google.com with SMTP id s2so2961967vkf.13
        for <linux-i2c@vger.kernel.org>; Wed, 12 May 2021 06:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Jowz1jnkMOr3gH5yQSgGMVN6x7Lry8Su5OlE7bU8MPI=;
        b=x8zdvCKn2bNSMcUkWXc+bpIp2E636IiqxMYB9KGWoZUar2n/Bf0XGdc9a+mhfCveWy
         PDPrNaXNtGyqg5Re5lKi11lHdMNdatRwBgV0zPz6wqlPfyc+jsCsdVtB9+Pcaau6VrtM
         mvkwqrCJ0kF44hjW7u0JjznAUBXS3xVIUwz2TEDI4vqBSsSX9EIL8caTXZ5w2+KXanWr
         /2xkp7EmD63TzYJOHRFlYk580hc5jTj6kKnvwBDCPD8r2pNYWruX+1FGR6IJCvfgsy49
         WjqTud2XfJCO4zXEKLRH5eplfPoQtKLzGzf0wpBGxPEgbjJzSATCogbNwsnN7Y4XJSt3
         SWhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Jowz1jnkMOr3gH5yQSgGMVN6x7Lry8Su5OlE7bU8MPI=;
        b=SxrBJf8Be40ckS88XQwHZ6/oW6nPr3vSJg989R4qmXj1kgq73zISAS+5zmrAEXKY6j
         +d6rqyNt3edAzLmcL+Gm+ReakOC0ljJMYJ9U/x9MAnidtwy5N12BfWuez7yYLour+84z
         ywk9uEae7CiztOE5Z/yrvu6laysK77zApfeSvUlNVIWHyeOOMU2zbk0EECqxuSI2++o5
         gIPCncApvnlWWG25xofpCaSQKz9ehQrMVOGEWbV86cfbyax2D8gxGgXcz7am+py7x5Mr
         RbuKESrChjFIxI26ve5zSZnJpOz+aMaOrdbHHpD0MD2zYeBL2OvKhzbX6f7zS2buRAm1
         1ZpQ==
X-Gm-Message-State: AOAM532PVGmKoY8JzYKsN3pnhwIGnfcMAIFo+HW8JbiRDt7igd/Ck9hk
        f+pigl0uuk1iWJezZUUP8007OOVVLee0HrcNaUz+rQ==
X-Google-Smtp-Source: ABdhPJx8zR9ROGiDsPfhddCCRFlE4zhaPq5y1bpybJCuT4h5Kz2qpp6Svv+S8YHJKW2TJ4bd2N59hBdWm2IOHM72cxI=
X-Received: by 2002:a1f:5504:: with SMTP id j4mr28021678vkb.7.1620827467457;
 Wed, 12 May 2021 06:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <20201224111210.1214-1-rojay@codeaurora.org> <20201224111210.1214-4-rojay@codeaurora.org>
 <YAGqKfDfB7EEuZVn@builder.lan> <6bfec3e6-3d26-7ade-d836-032273856ce2@codeaurora.org>
 <CAPDyKFqF0NE3QRAEfiqj5QOXXH2om4CpyyeudeqoovANfvjsaQ@mail.gmail.com>
 <20210429075054.vrotcbldbaivfh2d@vireshk-i7> <3743d729-4287-a389-72e2-2201ee59601d@codeaurora.org>
 <CAPDyKFrVcvXvSHrRyJFZUjTXEeOLk2k7G-36pOSWUKhkWRTftA@mail.gmail.com> <b02be4a9-aae4-62c2-2ef2-5ade683eb1a9@codeaurora.org>
In-Reply-To: <b02be4a9-aae4-62c2-2ef2-5ade683eb1a9@codeaurora.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 12 May 2021 15:50:31 +0200
Message-ID: <CAPDyKFqKw_5Cf8Qb0jEMF2YtFpCRQmHabhWYrAQfQBbkszKUqg@mail.gmail.com>
Subject: Re: [PATCH 3/3] i2c: i2c-qcom-geni: Add support for 'assigned-performance-states'
To:     Rajendra Nayak <rnayak@codeaurora.org>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Roja Rani Yarubandi <rojay@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>, akashast@codeaurora.org,
        msavaliy@qti.qualcomm.com, parashar@codeaurora.org,
        Linux PM <linux-pm@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 10 May 2021 at 08:37, Rajendra Nayak <rnayak@codeaurora.org> wrote:
>
>
>
> On 5/7/2021 2:36 PM, Ulf Hansson wrote:
> > On Tue, 4 May 2021 at 09:18, Rajendra Nayak <rnayak@codeaurora.org> wrote:
> >>
> >>
> >> []...
> >>>>>>
> >>>>>> Ulf, Viresh, I think we discussed this at the time of introducing the
> >>>>>> performance states.
> >>>>>>
> >>>>>> The client's state does not affect if its performance_state should
> >>>>>> be included in the calculation of the aggregated performance_state, so
> >>>>>> each driver that needs to keep some minimum performance state needs to
> >>>>>> have these two snippets.
> >>>>>>
> >>>>>> Would it not make sense to on enable/disable re-evaluate the
> >>>>>> performance_state and potentially reconfigure the hardware
> >>>>>> automatically?
> >>>>>
> >>>>> I agree, this will be repeated across multiple drivers which would
> >>>>> need some minimal vote while they are active, handling this during
> >>>>> genpd enable/disable in genpd core makes sense.
> >>>>
> >>>> Initially that's what we tried out, but we realized that it was
> >>>> difficult to deal with this internally in genpd, but more importantly
> >>>> it also removed some flexibility from consumers and providers. See
> >>>> commit 68de2fe57a8f ("PM / Domains: Make genpd performance states
> >>>> orthogonal to the idlestates").
> >>>>
> >>>> As a matter of fact this was quite recently discussed [1], which also
> >>>> pointed out some issues when using the "required-opps" in combination,
> >>>> but perhaps that got resolved? Viresh?
> >>>
> >>> So I looked again at that thread in detail today. The basic idea was
> >>> to enable/disable the genpd from within the OPP core and there were
> >>> doubts on how to do that efficiently as there are cases where domains
> >>> may be enabled for an OPP, but not for others.. etc. etc.
> >>>
> >>> I am not sure if I consider that thread as part of the discussion we
> >>> are having here, they may be related, but that thread doesn't block
> >>> anything to be done in the genpd core.
> >>
> >> That's true, the 2 threads are different in the sense that one talks
> >> about having OPP core managing power on/off along with setting perf state,
> >> while the other talks about genpd core managing a default perf state
> >> along with power on/off, but they are similar in the sense that both
> >> are related to the discussion whether we should treat powering on and off
> >> a domain related to setting its performance state or if it should be
> >> considered completely orthogonal.
> >>
> >> I think the clock framework treats setting clock rates and turning
> >> on/off a clock orthogonal because there is an inherent assumption that
> >> once the clock is turned off, what rate it was set to should not matter,
> >> and it can be running at the same rate when we turn the clock back on.
> >>
> >> I guess we can have the same assumption here that a perf state of a
> >> power domain should not matter if the power domain is turned off
> >> and hence the perf state need not be dropped explicitly during power off,
> >> atleast that should be true for the qcom power domains supporting perf
> >> state upstream.
> >>
> >> Should that be the approach taken here? I guess that would mean the patch
> >> I had proposed earlier [1] to manage this in the genpd core would have to set the default
> >> perf state at attach and remove it only during a detach of the device to
> >> the pm_domain, and not manage it during the runtime_suspend/resume of the device.
> >
> > Right, I think this would be a step in the right direction, but it's
> > not sufficient to solve the complete problem. As you also point out
> > below.
> >
> >>
> >>>> A consumer driver
> >>>> can no longer make its vote for its device to stick around, when the
> >>>> device becomes runtime suspended - and how do we know that we never
> >>>> need to support such a case?
> >>
> >> The above approach should take care of this but the down side of it would be,
> >> unlike in the case of clocks where the devices assigning a default clock rate
> >> might be doing so on a device specific clock (rarely shared with other devices)
> >> in case of power domain, and especially in the qcom implementation of these
> >> power domains which support perf state, these can be large domains with lots of devices,
> >> and any device being active (not necessarily wanting any default perf state) will keep
> >> the domain at the default perf state, requested by a device which isn't really active.
> >
> > Yep, this certainly sounds suboptimal. To me, this isn't good enough.
> >
> >>
> >>> What about doing this just for the assigned-performance-state case as
> >>> the clients don't want to play with it at all.
> >>
> >> well, thats possible too, but you obviously can't reuse the same bindings
> >> in such cases
> >
> > Not sure I understand the issue with the DT binding? Let me elaborate
> > on how I think we could move forward.
> >
> > It looks like we have two problems to solve:
> >
> > *) We need a new DT binding.
> > If that becomes a generic property along the lines of the
> > "assigned-performance-state" as suggested - or if we decide to add a
> > SoC specific binding via using an additional cell in "power-domains"
> > (suggested by Rob), doesn't really matter much to me. The arguments
> > for the new DT property are very much similar to why we added
> > "assigned-clock-rates" for clocks.
> >
> > **) We want to avoid boiler-plate code in drivers to manage
> > "assigned-performance-state" for their devices.
> > No matter what DT property we decide on (generic or SoC specific), we
> > should be able to manage this from the PM domain (genpd) layer. No
> > changes in the drivers should be needed.
> > If a generic binding is used, we could consider to let genpd
> > internally manage the whole thing (DT parsing and updating performance
> > state votes for assigned-performance-state only).
>
> Sure, so for starters does that mean I should re-spin my series which
> adds the generic 'assigned-performance-states' bindings and see if Rob
> is OK with that? I am guessing you are OK with the way that binding gets
> used within genpd core in that series, or would you want it to be handled
> differently?

A re-spin would definitely move this forward. If we can convince Rob
about the generic DT binding, I will certainly agree to change genpd
to help/manage the DT parsing.

Although, I am not sure yet what is the best. Let genpd to do the
parsing internally in genpd_add_device() or just provide a helper
function that can be called from an ->attach|detach_dev() callback.

In the end it boils done to decide whether we should use the
->start|stop() callbacks or let genpd internally manage the "assigned
performance state". Honestly, I would prefer to look at how the code
would need to  be changed, before answering this.

>
> > If we go for an SoC specific binding, the genpd provider needs to be
> > updated. It can manage DT parsing from the ->attach|detach_dev()
> > callbacks and update performance votes from the ->start|stop()
> > callbacks.
> > We could also consider a hybrid of these two solutions.
> >>
> >> [1] https://lore.kernel.org/patchwork/patch/1284042/

Kind regards
Uffe
