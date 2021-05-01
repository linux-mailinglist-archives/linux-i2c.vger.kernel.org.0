Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD4E37071D
	for <lists+linux-i2c@lfdr.de>; Sat,  1 May 2021 14:07:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231965AbhEAMIJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 1 May 2021 08:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231938AbhEAMIJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 1 May 2021 08:08:09 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D9E9C06138C
        for <linux-i2c@vger.kernel.org>; Sat,  1 May 2021 05:07:19 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id h36so1106109lfv.7
        for <linux-i2c@vger.kernel.org>; Sat, 01 May 2021 05:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cShhxOov7yPyGv2gqNT9J0Wvb5A03fZum4wVgMZcev0=;
        b=bovKm0NsrMUQ92+ShbG6eIgqrhlAYcOckDEUfVkF9aUE77zfmA0yY6m+pLbCntRryr
         xmy6WV+CNWATAVNw548V3+baVqI5Aw1ZD4yWFGZgZCKjp/OolvYQ+zYKPS4eWd4CqbsH
         RNaJmOYvOmdBRpQ8pPqsc69ddxVh6zVjS5jbgLSWXLHypgeucOjGHK2BmGdqDSlZ/hy1
         IAu5Tje2Qaygt85s7veL9m5QZVblRiVtz8wcaTLabRbdUM23JMSNz0U4DKEumaHys10d
         N+fsdhCHPYKuN3fgTdy3cy6CHzWn1jPJs0aGmBAFw8Ps0W/7B1raJyLy4oz1y8osYOMI
         RQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cShhxOov7yPyGv2gqNT9J0Wvb5A03fZum4wVgMZcev0=;
        b=DOtcKbtgrx0Ick5pTRcyZs9PEvfF8Ec3mmxS2h3tWeMQ1KfqMDhTGcnz8A28WhUbSI
         o5oEOY+M3zEFDQjJRD/Er0SpcetLjIeU1GOc4Zc2LyR4x3e2bV3wI3NjqAcRQL7hYUs4
         rNkPNYuUqIWc6+fh965VfpdXZBRWTpdv4oXpqiiA2UIElJXPJL1nVi7Or7aR2fsYBw6h
         XV1jYTul+iZc9v6THPTY/yBIovL4gPhiAMD/buOSDC/4MeQ1NTEF16pYsac8PaE88SjT
         Zn5queZ1L0NIHccMQ6ftXRqcENlac2rqpjxVt0ZH9VQatEqLWjGv3HQ+9k8CfsQJhxtP
         WLgg==
X-Gm-Message-State: AOAM530RpEipPcV4hynrEzdimOMXsgrev/cOmfFB5WdYrM6+8SVnqWlf
        6wj7rTr1kiaqZAeqFwvXrIKNX1Uje/YHznA6om3JGA==
X-Google-Smtp-Source: ABdhPJyBwdw5C0bHiY+W+PETkYMvzi+/Aa+5T0VzdotioKXyHm1/7V5opQjGZkISSW+Ddx6ZdzyULKJ0smN/s3mnWKE=
X-Received: by 2002:a05:6512:149:: with SMTP id m9mr6205501lfo.157.1619870837611;
 Sat, 01 May 2021 05:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165906.2504169-1-dianders@chromium.org>
 <20210423095743.v5.1.I9e6af2529d6c61e5daf86a15a1211121c5223b9a@changeid>
 <CACRpkdYkRFLvCRPSYNzYQG58QgPfhvjtHb+FBQZadyrnjC8=1A@mail.gmail.com>
 <CAD=FV=UX683grZ=poTwKXxSqYBCLdLAOCxOPhE_xVVgKbe36Mw@mail.gmail.com>
 <CACRpkdYfugrJ4WGn=w+viGXE6s5cdHjLC++jHPLVy_QH09KA8Q@mail.gmail.com> <CAD=FV=XXxTz8hi92y6p3hX7iVEHuqKHsrKPSnX_a__WCEQRAKw@mail.gmail.com>
In-Reply-To: <CAD=FV=XXxTz8hi92y6p3hX7iVEHuqKHsrKPSnX_a__WCEQRAKw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 1 May 2021 14:07:06 +0200
Message-ID: <CACRpkdZVH=h37hSjvjcNmRwV-RoBB-nvUbrOT80DoLr7n81R3Q@mail.gmail.com>
Subject: Re: [PATCH v5 01/20] drm/panel: panel-simple: Add missing
 pm_runtime_disable() calls
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Doug,

On Fri, Apr 30, 2021 at 11:04 PM Doug Anderson <dianders@chromium.org> wrote:

> Pushed this one patch. Rest of the series is pending adult
> supervision. Overall summary:
>
> 1. I could probably push some of the early sn65dsi86 cleanup patches
> in this series since they have Bjorn's review and are pretty much
> no-ops / simple cleanups, but there's probably not tons gained for
> shoving those in early.

Those look good to me as well. I'd say just apply them.

To me it looks like up until and including patch 18?
Feel free to add my
Acked-by: Linus Walleij <linus.walleij@linaro.org>

On these.

> 2. The whole concept of breaking up the patch into sub-drivers has no
> official Reviewed-by tags yet. Presumably Bjorn will give those a
> re-review when he has time again.

It looks good to me so I sent an explicit ACK on that patch.

> 3. Laurent and I had a big discussion on #dri-devel yesterday about
> the EDID reading. He's not totally convinced with the idea of doing
> this in the panel when the bridge could just do it by itself, but it
> sounded like he might be coming around. Right now this is waiting on
> Laurent to have time to get back to this.

I dare not speak of this. Laurent has the long and tedious experience
with panels and pretty much anything related so if Laurent is
hesitant then I am hesitant too. His buy-in is absolutely required.

But IIUC that is just for patch 19+20?

It'd be good to apply the rest and get down the stack.

Just to keep you busy and make sure you don't run out of work
(haha) I noticed that the gpio_chip in this driver can use
the new GPIO_REGMAP helper library with the fixes just
landed in Torvald's tree.

At your convenience and when you think there is too little
stuff in your sn65dsi86 TODO, check out
pinctrl-bcm63xx.c for an example of select GPIO_REGMAP
made very simple (this works fine as long as they are bit
offsets starting from 0).

Yours,
Linus Walleij
