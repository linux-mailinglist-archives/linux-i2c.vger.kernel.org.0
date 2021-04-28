Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B36036DD0D
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Apr 2021 18:33:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235502AbhD1QeQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Apr 2021 12:34:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230470AbhD1QeP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Apr 2021 12:34:15 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDC96C061573
        for <linux-i2c@vger.kernel.org>; Wed, 28 Apr 2021 09:33:29 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id j19so6797834qtx.13
        for <linux-i2c@vger.kernel.org>; Wed, 28 Apr 2021 09:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+bqujsD1CEh1BMsQ6Vfhu0Dtl9EKMPvmnj/WQm5NOQY=;
        b=X5QjYOktKo0SOMzzXCGGEhJ1B+vtKaNQV8NPxuiFMVZI1s8N5Hsv83Svtsg50rgxqV
         Wme5k2pnWmXoL95EzEKY4g5itbI+wPpjl1gJvv8E9H6g6iahugJUDWBiswRZjV0HuMRk
         UKmaoLRN5K1bRs4417u9LHMJfv8sfU53FKwfI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+bqujsD1CEh1BMsQ6Vfhu0Dtl9EKMPvmnj/WQm5NOQY=;
        b=b1w09hjQcJKZluUEqGyl9S9PbFHA4vP9kTpkCw6X5qch5X1fa0slv72hq5JHVAOpjA
         pg1dsT7ugY7XGN9COfbl8le7CWCPBu5aFPS+wX78OnFD6HhOY520f0/2jdd2fmA8Zafb
         01a/li50U3bOTli3vwLOUdQqkqCt+CA9KK2IAp2sDj4w1iyJaReKD1EhJ4vxuejkB6oL
         WhXAoidoVU+R7D/Hg8zP42FmEL6HK/eSAWRLctRtuuVMvgij+bq4WizB8uNgCBnoT3wD
         8YTkorZ3qB9YUKbAuHySSpNL/o3/J+KZKmy0zBbu85eEfr5IF2nfbh+OHQmoAeRWlB0q
         0TAw==
X-Gm-Message-State: AOAM5338l9kC9nZsJgkDdbVi3/8WELHD50SrgBSdiRV3naRfrV8+F2VL
        WnJUtgxKfZwI1bcZIU8/xleSW5PTn0jhiA==
X-Google-Smtp-Source: ABdhPJzBHFeJvNfuKAPdQmjv+9CSb7Y3RnAr7yYALgRtmjrJK6Ekb6msSnDpwFOdWyJz/NV82sOyYA==
X-Received: by 2002:a05:622a:650:: with SMTP id a16mr27439492qtb.316.1619627608855;
        Wed, 28 Apr 2021 09:33:28 -0700 (PDT)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com. [209.85.219.174])
        by smtp.gmail.com with ESMTPSA id t63sm177023qkh.6.2021.04.28.09.33.26
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Apr 2021 09:33:27 -0700 (PDT)
Received: by mail-yb1-f174.google.com with SMTP id y2so72593100ybq.13
        for <linux-i2c@vger.kernel.org>; Wed, 28 Apr 2021 09:33:26 -0700 (PDT)
X-Received: by 2002:a25:382:: with SMTP id 124mr19702977ybd.25.1619627606430;
 Wed, 28 Apr 2021 09:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165906.2504169-1-dianders@chromium.org> <20210423095743.v5.1.I9e6af2529d6c61e5daf86a15a1211121c5223b9a@changeid>
In-Reply-To: <20210423095743.v5.1.I9e6af2529d6c61e5daf86a15a1211121c5223b9a@changeid>
From:   Sean Paul <seanpaul@chromium.org>
Date:   Wed, 28 Apr 2021 12:32:48 -0400
X-Gmail-Original-Message-ID: <CAOw6vb+wgVZVf_uRZCXhHoa+y-dJmd4u4JX2wHjO0jiB5bfujw@mail.gmail.com>
Message-ID: <CAOw6vb+wgVZVf_uRZCXhHoa+y-dJmd4u4JX2wHjO0jiB5bfujw@mail.gmail.com>
Subject: Re: [PATCH v5 01/20] drm/panel: panel-simple: Add missing
 pm_runtime_disable() calls
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>,
        robdclark@chromium.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Steev Klimaszewski <steev@kali.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-i2c@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Apr 23, 2021 at 12:59 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> In commit 3235b0f20a0a ("drm/panel: panel-simple: Use runtime pm to
> avoid excessive unprepare / prepare") we started using pm_runtime, but
> my patch neglected to add the proper pm_runtime_disable(). Doh! Add
> them now.
>
> Fixes: 3235b0f20a0a ("drm/panel: panel-simple: Use runtime pm to avoid excessive unprepare / prepare")
> Reported-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v5:
> - Missing pm_runtime_disable() patch new for v5.
>
>  drivers/gpu/drm/panel/panel-simple.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 6b22872b3281..9746eda6f675 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -797,12 +797,14 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
>
>         err = drm_panel_of_backlight(&panel->base);
>         if (err)
> -               goto free_ddc;
> +               goto disable_pm_runtime;
>
>         drm_panel_add(&panel->base);
>
>         return 0;
>
> +disable_pm_runtime:
> +       pm_runtime_disable(dev);
>  free_ddc:
>         if (panel->ddc)
>                 put_device(&panel->ddc->dev);
> @@ -818,6 +820,7 @@ static int panel_simple_remove(struct device *dev)
>         drm_panel_disable(&panel->base);
>         drm_panel_unprepare(&panel->base);
>
> +       pm_runtime_disable(dev);
>         if (panel->ddc)
>                 put_device(&panel->ddc->dev);
>
> --
> 2.31.1.498.g6c1eba8ee3d-goog
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
