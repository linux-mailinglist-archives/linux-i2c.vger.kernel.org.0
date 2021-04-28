Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DEF536DD8F
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Apr 2021 18:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241287AbhD1Qw4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 28 Apr 2021 12:52:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241339AbhD1Qw4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 28 Apr 2021 12:52:56 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7D62C061573
        for <linux-i2c@vger.kernel.org>; Wed, 28 Apr 2021 09:52:09 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id z20-20020a0568301294b02902a52ecbaf18so6590347otp.8
        for <linux-i2c@vger.kernel.org>; Wed, 28 Apr 2021 09:52:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rrj3UlBlJ91qMWs4IlTPGuw8X2L/oNKhyyRLTCh8fWE=;
        b=lf++hd/X6bQjKPClgG4WlPiLlx0SEPhHDHsu8w5ZyHb/uz+XduZNY+A0zluRDDQxjc
         L2fOBYoKdVMfh8CB6Dxs6hGNXdaO+l98nAg/bwFcadAUV1wPG3qXuF3ERBWSvSCt0Zrg
         UiDRc/2MnqpGGBT99Roig9k+c6ycmYY0gP8j8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rrj3UlBlJ91qMWs4IlTPGuw8X2L/oNKhyyRLTCh8fWE=;
        b=pTbjci2wuTVOoJf0EHacblBCqdlEv/P/WHYucp9T53x6yE4d3c3Ia/LubZ9W61x0g7
         H21wKdBzYrND1puzBQ4tc/VzJjttJ68RE3L5qAahKHIQYzfsIIik47Xe3lwL6yS4MoBQ
         51vcq7i20HB7517Xv+RMb0Ee1RdXEQnwh4ubJh7gmewAESmAYRnyaViYa8wONU/zPd07
         aKooG0e59W6FMRwEuDV+i9q3Jjua7duvAahMLacA0TpfnLz0apX+OF998ZodiFchz0KI
         FD7+XZA6Gdls96f/0IrG+5X9TH+uzLg2PgViBzwDuIgpG3hKA7k2+VS1Q60lHQVTR/ub
         CVyg==
X-Gm-Message-State: AOAM531U0I8W7Sz8l3L9AiVlgbheG5KgAha2Abv7jggG8XLGMNcUX3XE
        vDR+LyJPHmK/ccUwKSVorDzv4hACzehZ8Cv4
X-Google-Smtp-Source: ABdhPJyo+NXYFc9Wnu1wwziOSJKJh9sJHwJo9pf3Yz+hcLUM278Rhc0hr+1gOu+GkJ8SMc+5qlzn1w==
X-Received: by 2002:a9d:2f24:: with SMTP id h33mr25672592otb.128.1619628729087;
        Wed, 28 Apr 2021 09:52:09 -0700 (PDT)
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com. [209.85.210.49])
        by smtp.gmail.com with ESMTPSA id k16sm127690ooa.36.2021.04.28.09.52.08
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Apr 2021 09:52:08 -0700 (PDT)
Received: by mail-ot1-f49.google.com with SMTP id v23-20020a9d60570000b02902a53bac99a3so4185334otj.5
        for <linux-i2c@vger.kernel.org>; Wed, 28 Apr 2021 09:52:08 -0700 (PDT)
X-Received: by 2002:a25:7157:: with SMTP id m84mr42521872ybc.175.1619628324558;
 Wed, 28 Apr 2021 09:45:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210423165906.2504169-1-dianders@chromium.org> <20210423095743.v5.17.Ibd31b8f7c73255d68c5c9f5b611b4bfaa036f727@changeid>
In-Reply-To: <20210423095743.v5.17.Ibd31b8f7c73255d68c5c9f5b611b4bfaa036f727@changeid>
From:   Sean Paul <seanpaul@chromium.org>
Date:   Wed, 28 Apr 2021 12:44:45 -0400
X-Gmail-Original-Message-ID: <CAOw6vbLqDgqhXH8pUZqfhKCZk68SfzLf76Z4au3g83=Uw_8z2Q@mail.gmail.com>
Message-ID: <CAOw6vbLqDgqhXH8pUZqfhKCZk68SfzLf76Z4au3g83=Uw_8z2Q@mail.gmail.com>
Subject: Re: [PATCH v5 17/20] drm/panel: panel-simple: Power the panel when
 reading the EDID
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
> I don't believe that it ever makes sense to read the EDID when a panel
> is not powered and the powering on of the panel is the job of
> prepare(). Let's make sure that this happens before we try to read the
> EDID. We use the pm_runtime functions directly rather than directly
> calling the normal prepare() function because the pm_runtime functions
> are definitely refcounted whereas it's less clear if the prepare() one
> is.
>
> NOTE: I'm not 100% sure how EDID reading was working for folks in the
> past, but I can only assume that it was failing on the initial attempt
> and then working only later. This patch, presumably, will fix that. If
> some panel out there really can read the EDID without powering up and
> it's a big advantage to preserve the old behavior we can add a
> per-panel flag. It appears that providing the DDC bus to the panel in
> the past was somewhat uncommon in any case.
>

Maybe some combination of drivers caching the EDID for panels while
they're already powered and overly broad pm runtime references?

At any rate, this makes sense to me,

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> (no changes since v1)
>
>  drivers/gpu/drm/panel/panel-simple.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
> index 4de33c929a59..a12dfe8b8d90 100644
> --- a/drivers/gpu/drm/panel/panel-simple.c
> +++ b/drivers/gpu/drm/panel/panel-simple.c
> @@ -510,12 +510,18 @@ static int panel_simple_get_modes(struct drm_panel *panel,
>
>         /* probe EDID if a DDC bus is available */
>         if (p->ddc) {
> -               struct edid *edid = drm_get_edid(connector, p->ddc);
> +               struct edid *edid;
>
> +               pm_runtime_get_sync(panel->dev);
> +
> +               edid = drm_get_edid(connector, p->ddc);
>                 if (edid) {
>                         num += drm_add_edid_modes(connector, edid);
>                         kfree(edid);
>                 }
> +
> +               pm_runtime_mark_last_busy(panel->dev);
> +               pm_runtime_put_autosuspend(panel->dev);
>         }
>
>         /* add hard-coded panel modes */
> --
> 2.31.1.498.g6c1eba8ee3d-goog
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
