Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A443365D9D
	for <lists+linux-i2c@lfdr.de>; Tue, 20 Apr 2021 18:43:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233205AbhDTQnt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 20 Apr 2021 12:43:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233168AbhDTQns (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 20 Apr 2021 12:43:48 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8ED65C06174A
        for <linux-i2c@vger.kernel.org>; Tue, 20 Apr 2021 09:43:15 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id k18so34633677oik.1
        for <linux-i2c@vger.kernel.org>; Tue, 20 Apr 2021 09:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=76HKox21D3PAezXDwLgf3ueXqnBplo72K4mWz+QQVV0=;
        b=g+4zcji0ZDZ5114QmmtiaR9NdWSbEtVUYp5YM9C1YKaLa8Mva8b/R3MXZXuhUkP5mY
         KQEG5MoeC3KA4PbvQMUjk2KvbvjQRaz8ecwjtmZXC3Q0am0WgxFOedd4p0zRh4Q2xFFU
         Ggtwa4BXSRExKYGJrwZwkIpxZlZoYc/Cc3Lq4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=76HKox21D3PAezXDwLgf3ueXqnBplo72K4mWz+QQVV0=;
        b=c8Ic5dMbwGAHZxlp8OJ9+4sIuPpDvQV521lmOUuXui/HUKY9yEZ9530ymkFgXYHJCT
         AfsiMYl2y1z1qiXPf9rU8WST7WhD7wxrL1ZOd3VYjrx2mHuIkaJxvBE6/SxwkEqmX+ul
         ia7sbOt8iPiP7G0HfUv/usFBhMnfZIxvBqjTiUgclS+XokZ6gnqjudsgduzQdDYoZ1Wk
         6IKS8+RkwYwD0rdz9I/wdKDllkmCe42lW7IXJh9wfWrDEji4DxOnRk/63zrNYERYwwMb
         H0WNvlQq4ktLSLcsRpm8Hv3pRuPEV1hC5CwMMj+ZKmpfEgQMbGepfIQBhUBAdoCEYCv5
         pjAQ==
X-Gm-Message-State: AOAM53351EL/GUYodDlqKMlB6+ozVNtMr/lshKVPUmgTYXbMqa7RMZqN
        0dkQ6Z9/eH1BfKvR+gjzmGRqtDRkOboKpw==
X-Google-Smtp-Source: ABdhPJy8S2gq6yn3ujyRsbBMbikPuttEsf7P4d8Kn4HP0MIMKMkwXVAUr41xKVfbqqxUCNYsS2VQjA==
X-Received: by 2002:aca:75cc:: with SMTP id q195mr3700525oic.88.1618936994668;
        Tue, 20 Apr 2021 09:43:14 -0700 (PDT)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com. [209.85.210.43])
        by smtp.gmail.com with ESMTPSA id c13sm4218464otr.51.2021.04.20.09.43.14
        for <linux-i2c@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Apr 2021 09:43:14 -0700 (PDT)
Received: by mail-ot1-f43.google.com with SMTP id c8-20020a9d78480000b0290289e9d1b7bcso22291066otm.4
        for <linux-i2c@vger.kernel.org>; Tue, 20 Apr 2021 09:43:14 -0700 (PDT)
X-Received: by 2002:a25:d34b:: with SMTP id e72mr25816971ybf.343.1618936983211;
 Tue, 20 Apr 2021 09:43:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210416223950.3586967-1-dianders@chromium.org>
In-Reply-To: <20210416223950.3586967-1-dianders@chromium.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Tue, 20 Apr 2021 09:42:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UjVkh7RHGC49_PGS45xw4bumum52t+sx=FxqqjUE9f8g@mail.gmail.com>
Message-ID: <CAD=FV=UjVkh7RHGC49_PGS45xw4bumum52t+sx=FxqqjUE9f8g@mail.gmail.com>
Subject: Re: [PATCH v4 00/27] drm: Fix EDID reading on ti-sn65dsi86; solve
 some chicken-and-egg problems
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Steev Klimaszewski <steev@kali.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linus W <linus.walleij@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On Fri, Apr 16, 2021 at 3:40 PM Douglas Anderson <dianders@chromium.org> wrote:
>
> The primary goal of this series is to try to properly fix EDID reading
> for eDP panels using the ti-sn65dsi86 bridge.
>
> Previously we had a patch that added EDID reading but it turned out
> not to work at bootup. This caused some extra churn at bootup as we
> tried (and failed) to read the EDID several times and also ended up
> forcing us to use the hardcoded mode at boot. With this patch series I
> believe EDID reading is reliable at boot now and we never use the
> hardcoded mode.
>
> This series is the logical successor to the 3-part series containing
> the patch ("drm/bridge: ti-sn65dsi86: Properly get the EDID, but only
> if refclk") [1] though only one actual patch is the same between the
> two.
>
> This series starts out with some general / obvious fixes and moves on
> to some more specific and maybe controversial ones. I wouldn't object
> to some of the earlier ones landing if they look ready.
>
> This patch was developed agains linuxnext (next-20210416) on a
> sc7180-trogdor-lazor device. To get things booting for me, I had to
> use Stephen's patch [2] to keep from crashing but otherwise all the
> patches I needed were here.
>
> Primary change between v2 and v3 is to stop doing the EDID caching in
> the core. I also added Andrzej's review tags.
>
> Between v3 and v4 this series grew a whole lot. I changed it so that
> the EDID reading is actually driven by the panel driver now as was
> suggested by Andrzej. While I still believe that the old approach
> wasn't too bad I'm still switching. Why?
>
> The main reason is that I think it's useful in general for the panel
> code to have access to the DDC bus and to be able to read the
> EDID. This may allow us to more easily have the panel code support
> multiple sources of panels--it can read the EDID and possibly adjust
> timings based on the model ID. It also allows the panel code (or
> perhaps backlight code?) to send DDC commands if they are need for a
> particular panel.
>
> At the moment, once the panel is provided the DDC bus then existing
> code will assume that it should be in charge of reading the
> EDID. While it doesn't have to work that way, it seems sane to build
> on what's already there.
>
> In order to expose the DDC bus to the panel, I had to solve a bunch of
> chicken-and-egg problems in terms of probe ordering between the bridge
> and the panel. I've broken the bridge driver into several sub drivers
> to make this happen. At the moment the sub-drivers are just there to
> solve the probe problem, but conceivably someone could use them to
> break the driver up in the future if need be.
>
> I apologize in advance for the length of this series. I'm currently
> working through getting commit access to drm-misc [3] so I can land
> the first several patches which are already reviewed. There are still
> a lot of patches even after the first few, but hopefully you can see
> that there are only so many because they're broken up into nice and
> reviewable bite-sized-chunks. :-)
>
> [1] https://lore.kernel.org/r/20210304155144.3.I60a7fb23ce4589006bc95c64ab8d15c74b876e68@changeid/
> [2] https://lore.kernel.org/r/161706912161.3012082.17313817257247946143@swboyd.mtv.corp.google.com/
> [3] https://gitlab.freedesktop.org/freedesktop/freedesktop/-/issues/348
>
> Changes in v4:
> - Reword commit mesage slightly.
>
> Changes in v3:
> - Removed "NOTES" from commit message.
>
> Changes in v2:
> - Removed 2nd paragraph in commit message.
>
> Douglas Anderson (27):
>   drm/bridge: Fix the stop condition of drm_bridge_chain_pre_enable()
>   drm/bridge: ti-sn65dsi86: Simplify refclk handling
>   drm/bridge: ti-sn65dsi86: Remove incorrectly tagged kerneldoc comment
>   drm/bridge: ti-sn65dsi86: Reorder remove()
>   drm/bridge: ti-sn65dsi86: Move drm_panel_unprepare() to post_disable()
>   drm/bridge: ti-sn65dsi86: Get rid of the useless detect() function
>   drm/panel: panel-simple: Use runtime pm to avoid excessive unprepare /
>     prepare

I have pushed the above 7 patches to drm-misc-next now so I don't have
to spam everyone with them for v5. The first patch is technically a
"fix" but I'm not aware of it affecting anyone in mainline and so I
didn't try to direct it to a fixes branch. The next 5 are trivial /
reviewed plenty. The last one is a bigger change but has Laurent's
review on it and it's been up on the lists for a while, so I sent it
in too.

I'll wait a few more days to see if any of the other "trivial" patches
early in the series get reviews and see if there is any other feedback
on the rest of the series. If I get reviews for some of the early
patches I'll likely try to push them before the v5.

-Doug
