Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6BB436DD8A
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Apr 2021 18:51:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241342AbhD1Qv7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Apr 2021 12:51:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241343AbhD1Qv5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Apr 2021 12:51:57 -0400
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64E8AC06138A
        for <linux-i2c@vger.kernel.org>; Wed, 28 Apr 2021 09:51:12 -0700 (PDT)
Received: by mail-qv1-xf32.google.com with SMTP id x27so31119085qvd.2
        for <linux-i2c@vger.kernel.org>; Wed, 28 Apr 2021 09:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i7bjsRegze0J8KMBLsd6S1kBXzifIu76DMKQBA84MfE=;
        b=H6GvR/jJOzxy5yvUfCUkF+EMKldJel4VTzuxpNzjmhRH8YjlZLt2EzcmEoB9kuRTpp
         J+S1tttlyYfNfXCYv1VnThpaRAKe35vjhUfbxu7lWEsG6xkD6fpttoWrTCDJyaB4s1yh
         qpsFpp1ULXf6O5GRNrGy8VZodsPVr2ptimptY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i7bjsRegze0J8KMBLsd6S1kBXzifIu76DMKQBA84MfE=;
        b=Slq9EVqifOal/qKsJbtXrJ7yvk+U0vyHTBDuur2wahiE2m2SlEonKf6zvGSFIj5MQk
         rtg5rnbZvVn9dTjlv85Z+mP/EaO7X4ip/A6vV+Xcupn4IY+NusZkry3zQGlhYNBFo7ro
         LMZ1O/erp37sRiqb93VzxDYS9qkh8Pswqh0shBCBhHFz9n2wHU27saXsT3rHFScujLax
         upY6xjjry0XjTSVNmwrIQK8E5VCr16pcdh2bZV6iy28R0bvApjMcVq/+7uuXVPMZVvah
         ahwhMcq46309it26H8bhbP7uIV7XAT6LI1FrefN/C3p2/IXAvsmCYS3kkreLsZ5kD+Ny
         /q0g==
X-Gm-Message-State: AOAM530QsfrFC1aRRIOOTQQuXQlMgxk2N+PWgUdnGk+9td3A86HjtLzp
        vvIie1Rz11iiC99FxaTQvOEnA79pv0g8Hw==
X-Google-Smtp-Source: ABdhPJwHtQd1tby5KKhwwCtGIU4t35BazCdhNEZLwYwYw3ruvvF/YSJookCXFX0dqnBMjYnKo1fTUg==
X-Received: by 2002:a05:6214:d6e:: with SMTP id 14mr19302617qvs.34.1619628671185;
        Wed, 28 Apr 2021 09:51:11 -0700 (PDT)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com. [209.85.219.171])
        by smtp.gmail.com with ESMTPSA id 3sm172724qko.120.2021.04.28.09.51.09
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Apr 2021 09:51:10 -0700 (PDT)
Received: by mail-yb1-f171.google.com with SMTP id 130so30951331ybd.10
        for <linux-i2c@vger.kernel.org>; Wed, 28 Apr 2021 09:51:09 -0700 (PDT)
X-Received: by 2002:a25:778d:: with SMTP id s135mr31447093ybc.21.1619628668908;
 Wed, 28 Apr 2021 09:51:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165906.2504169-1-dianders@chromium.org> <20210423095743.v5.18.If050957eaa85cf45b10bcf61e6f7fa61c9750ebf@changeid>
In-Reply-To: <20210423095743.v5.18.If050957eaa85cf45b10bcf61e6f7fa61c9750ebf@changeid>
From:   Sean Paul <seanpaul@chromium.org>
Date:   Wed, 28 Apr 2021 12:50:30 -0400
X-Gmail-Original-Message-ID: <CAOw6vbLtEF4VbhOPEJGNj2PnEE4Jk-BBtpLF_CrxFEhzF4f+Rg@mail.gmail.com>
Message-ID: <CAOw6vbLtEF4VbhOPEJGNj2PnEE4Jk-BBtpLF_CrxFEhzF4f+Rg@mail.gmail.com>
Subject: Re: [PATCH v5 18/20] drm/panel: panel-simple: Cache the EDID as long
 as we retain power
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

On Fri, Apr 23, 2021 at 1:00 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> It doesn't make sense to go out to the bus and read the EDID over and
> over again. Let's cache it and throw away the cache when we turn power
> off from the panel. Autosuspend means that even if there are several
> calls to read the EDID before we officially turn the power on then we
> should get good use out of this cache.
>

I think i915 caches the edid once on init and never refreshes it
(assuming no hotplugs). That said, I think it makes sense for a more
conservative approach in panel-simple.


> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> (no changes since v1)
>
>  drivers/gpu/drm/panel/panel-simple.c | 17 ++++++++++-------
>  1 file changed, 10 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index a12dfe8b8d90..9be050ab372f 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -189,6 +189,8 @@ struct panel_simple {
>         struct gpio_desc *enable_gpio;
>         struct gpio_desc *hpd_gpio;
>
> +       struct edid *edid;
> +
>         struct drm_display_mode override_mode;
>
>         enum drm_panel_orientation orientation;
> @@ -345,6 +347,9 @@ static int panel_simple_suspend(struct device *dev)
>         regulator_disable(p->supply);
>         p->unprepared_time = ktime_get();
>
> +       kfree(p->edid);
> +       p->edid = NULL;
> +
>         return 0;
>  }
>
> @@ -510,15 +515,13 @@ static int panel_simple_get_modes(struct drm_panel *panel,
>
>         /* probe EDID if a DDC bus is available */
>         if (p->ddc) {
> -               struct edid *edid;
> -
>                 pm_runtime_get_sync(panel->dev);
>
> -               edid = drm_get_edid(connector, p->ddc);
> -               if (edid) {
> -                       num += drm_add_edid_modes(connector, edid);
> -                       kfree(edid);
> -               }
> +               if (!p->edid)
> +                       p->edid = drm_get_edid(connector, p->ddc);
> +
> +               if (p->edid)
> +                       num += drm_add_edid_modes(connector, p->edid);

I suppose this would keep banging on the ddc if drm_get_edid()
continuously returns NULL, but maybe that's desireable (it'll succeed
sometime in the future)? At any rate, this is an improvement on
current behavior so it has my vote.

Reviewed-by: Sean Paul <seanpaul@chromium.org>

>
>                 pm_runtime_mark_last_busy(panel->dev);
>                 pm_runtime_put_autosuspend(panel->dev);
> --
> 2.31.1.498.g6c1eba8ee3d-goog
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
