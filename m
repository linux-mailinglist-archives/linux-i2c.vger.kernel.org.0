Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33E5636F359
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Apr 2021 02:59:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbhD3A7q (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Apr 2021 20:59:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbhD3A7q (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 29 Apr 2021 20:59:46 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B491C06138D
        for <linux-i2c@vger.kernel.org>; Thu, 29 Apr 2021 17:58:57 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id b21so6252902ljf.11
        for <linux-i2c@vger.kernel.org>; Thu, 29 Apr 2021 17:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ug9+khgowmMqU2OH1VgDimh2CfwPCpiExOxiCSc2h0I=;
        b=UxYUIpC8zsej/AXMWEHLS+xgrFyIWrbe7S8c1+dqc6mKLDjUldq5OrdhSuTcgwyGvX
         EKur9XF+1qsoYmcQmJdKijXOXA5igWdz5sgsZ7NURwA0CR0W3b1Jl2E9pixlRFIfjyLn
         it+7n6Dz5UefHeJ3m1vDdsE2T22SE+/8blWlA6RTpDRqmlxsX8wPwlRRsSnVtBcxMXsp
         RELuSlLchmV/w47kuL3vicmHMyaRa6u36BXD3257xyrLaRtMPNwkYDNbDQ+XT4n+4Ktl
         K1viEypW8UvyiH61oVCc3HvBUjmC4UUWD+hkdEW3HwU3Jkc5lkk4pbfoeT4ytnx+7Rp/
         cbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ug9+khgowmMqU2OH1VgDimh2CfwPCpiExOxiCSc2h0I=;
        b=rXOJVQiNF8Ygdf+alLmFiQhmr7wpIsvV26z5JR8VcKV8JgIzmQDdNd+qNtqMsEeG1q
         OqAZYvE9xU8yACd3YPWXpvHe7Uju+EwdLbu/RYy9+XASj8/znk8mPN0b7d5Ejm/L+/9j
         cM3tcgC2VmZFfxGJjxhMVpCN00pkqCo/+0gt5NlF5gUSGrVSXPVAlBWWfJ5tOn0m3sNu
         Uk6M3v2wl6kaf0I6KCS7QNEE8755Gk61tuhSLeukrlvvnw5JnaX50hgfa1cRFQw1PoB6
         z9IN23D2d+1140oVwGYUMqRQ+SgGbANtGctU0OdHC7S6e3waevHqckHzapGWFeok+FE1
         38PA==
X-Gm-Message-State: AOAM531X5P7aP/bQLrKwHikzbAQ1ozV1/QScCE8zKj2J1cySws07SNIe
        HhibzicEgtnFXMBLBxwVv+ld2iNIFrWaJtvOqJHLAQ==
X-Google-Smtp-Source: ABdhPJwlDZuKaqC8sT7GBS1lf5GJl0FtZXQZiW32Kva3RDd+ccG2UGF9RZliYJHFvIg1Ax8Qelrh/y+Im6KaZthl1FQ=
X-Received: by 2002:a05:651c:503:: with SMTP id o3mr1774994ljp.368.1619744336001;
 Thu, 29 Apr 2021 17:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165906.2504169-1-dianders@chromium.org> <20210423095743.v5.1.I9e6af2529d6c61e5daf86a15a1211121c5223b9a@changeid>
In-Reply-To: <20210423095743.v5.1.I9e6af2529d6c61e5daf86a15a1211121c5223b9a@changeid>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Apr 2021 02:58:45 +0200
Message-ID: <CACRpkdYkRFLvCRPSYNzYQG58QgPfhvjtHb+FBQZadyrnjC8=1A@mail.gmail.com>
Subject: Re: [PATCH v5 01/20] drm/panel: panel-simple: Add missing
 pm_runtime_disable() calls
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
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
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Apr 23, 2021 at 6:59 PM Douglas Anderson <dianders@chromium.org> wrote:

> In commit 3235b0f20a0a ("drm/panel: panel-simple: Use runtime pm to
> avoid excessive unprepare / prepare") we started using pm_runtime, but
> my patch neglected to add the proper pm_runtime_disable(). Doh! Add
> them now.
>
> Fixes: 3235b0f20a0a ("drm/panel: panel-simple: Use runtime pm to avoid excessive unprepare / prepare")
> Reported-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

This patch as such:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Notice however: you turn on pm runtime pm_runtime_enable()
in panel_simple_probe() but are you ever turning it off in
panel_simple_remove()?

I think pm_runtime_disable(); need to be added there?

Yours,
Linus Walleij
