Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A06B43722BC
	for <lists+linux-i2c@lfdr.de>; Mon,  3 May 2021 23:59:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbhECWAK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 May 2021 18:00:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbhECWAJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 May 2021 18:00:09 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD55FC06174A
        for <linux-i2c@vger.kernel.org>; Mon,  3 May 2021 14:59:15 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id q10so4816933pgj.2
        for <linux-i2c@vger.kernel.org>; Mon, 03 May 2021 14:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7XeQvyBWVKf0skvGUDMoW46+5itY3Fyc7Jw/oYmvtIY=;
        b=H2ea2bGlnrHk4qW8bhoexRGleeKJrdwsxjY0tTeNoasXxX+IKlVRsmEalrXV+m7p8+
         aVHEygDDJi7N4xXnLTikV6Hw9H9SiJhyCTvm8v8ZSj03PJbvAiEp1vXbawBNW7ImJSFA
         be03HIV39CqugEOR2d6Eqgbsfb7QFX5OLns2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7XeQvyBWVKf0skvGUDMoW46+5itY3Fyc7Jw/oYmvtIY=;
        b=UVnk6D35y68sVHsXdWg8i9t0/9k99Vk1/CnNb0nUFCs5cHI+U/Jyuezy4CSihgyIDP
         ZRQCo+NashxpQhWh7Mz6UakGD9oCYpvKtFgE9x6zvXxpyB5tNmryQN0RH5fCcgUY2a5j
         hFaoFBbbTsKStiZGhMYoVJdIMGUGUZr5pHOL9s9dDp1dSKUIeq/BimZWMqpdBj++BkJW
         8WI9JBfsoxcZe7GEXQBe+XliVk3oDtmbNi717bThcsLgZ3IZ0svouXYPQAZZ5DPdXPPB
         6ge5hjn/2WZEHxUXvnR20zH3sEvnmsCxTRXJM11DjTDduk6nveq3T+ntK9ezMCbs2BvF
         odvQ==
X-Gm-Message-State: AOAM532yJrijRczlUDobY/A9y3ydYKSOKj49npBQIlQjx6G2b+K1lWSk
        +/0M0DVDYhIHlSqWSV/poRsAVg==
X-Google-Smtp-Source: ABdhPJwalh66tJUrM/p0Z5iQ0SbnYg85Q29PsA9CRlkQ2sJN+bz79V9/rdyANt1QbA7FDn4F6uZDqg==
X-Received: by 2002:a63:a62:: with SMTP id z34mr19857861pgk.189.1620079155125;
        Mon, 03 May 2021 14:59:15 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:a592:ac50:b17b:5c43])
        by smtp.gmail.com with ESMTPSA id w1sm639186pgp.31.2021.05.03.14.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 14:59:14 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Cc:     Lyude Paul <lyude@redhat.com>, Steev Klimaszewski <steev@kali.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Linus W <linus.walleij@linaro.org>, robdclark@chromium.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>, linux-i2c@vger.kernel.org,
        dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maxime Ripard <mripard@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 0/5] drm: Fix EDID reading on ti-sn65dsi86; solve some chicken-and-egg problems
Date:   Mon,  3 May 2021 14:58:39 -0700
Message-Id: <20210503215844.2996320-1-dianders@chromium.org>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The primary goal of this series is to try to properly fix EDID reading
for eDP panels using the ti-sn65dsi86 bridge.

Previously we had a patch that added EDID reading but it turned out
not to work at bootup. This caused some extra churn at bootup as we
tried (and failed) to read the EDID several times and also ended up
forcing us to use the hardcoded mode at boot. With this patch series I
believe EDID reading is reliable at boot now and we never use the
hardcoded mode.

This series is the logical successor to the 3-part series containing
the patch ("drm/bridge: ti-sn65dsi86: Properly get the EDID, but only
if refclk") [1].

At v6 now, this patch series is smaller as I have landed most of the
cleanup patches. I've previously sent out a summary [2]. Now it just
has the i2c fix and some of the more controversial parts.

This patch was developed agains linuxnext (next-20210416) with
drm-misc-next (as of 20210503) merged in on a sc7180-trogdor-lazor
device. To get things booting for me, I had to use Stephen's patch [3]
to keep from crashing but otherwise all the patches I needed were
here.

Primary change between v2 and v3 is to stop doing the EDID caching in
the core. I also added Andrzej's review tags.

Between v3 and v4 this series grew a whole lot. I changed it so that
the EDID reading is actually driven by the panel driver now as was
suggested by Andrzej. While I still believe that the old approach
wasn't too bad I'm still switching. Why?

The main reason is that I think it's useful in general for the panel
code to have access to the DDC bus and to be able to read the
EDID. This may allow us to more easily have the panel code support
multiple sources of panels--it can read the EDID and possibly adjust
timings based on the model ID. It also allows the panel code (or
perhaps backlight code?) to send DDC commands if they are need for a
particular panel.

At the moment, once the panel is provided the DDC bus then existing
code will assume that it should be in charge of reading the
EDID. While it doesn't have to work that way, it seems sane to build
on what's already there.

In order to expose the DDC bus to the panel, I had to solve a bunch of
chicken-and-egg problems in terms of probe ordering between the bridge
and the panel. I've broken the bridge driver into several sub drivers
to make this happen. At the moment the sub-drivers are just there to
solve the probe problem, but conceivably someone could use them to
break the driver up in the future if need be.

Between v4 and v5, high-level view of changes.
- Some of the early patches landed, so dropped from series.
- New pm_runtime_disable() fix (fixed a patch that already landed).
- Added Bjorn's tags to most patches
- Fixed problems when building as a module.
- Reordered debugfs patch and fixed error handling there.
- Dropped last patch. I'm not convinced it's safe w/out more work.

Between v5 and v6 this patch added the patch ("drm/dp: Allow an early
call to register DDC i2c bus") and only includes the patches that
haven't already landed.

[1] https://lore.kernel.org/r/20210304155144.3.I60a7fb23ce4589006bc95c64ab8d15c74b876e68@changeid/
[2] https://lore.kernel.org/dri-devel/CAD=FV=Vzn0ih_RqR_ySJzFtq0B0x_4a-Uwjk56GeLyUZtTEXrQ@mail.gmail.com/
[3] https://lore.kernel.org/r/161706912161.3012082.17313817257247946143@swboyd.mtv.corp.google.com/

Changes in v6:
- ("drm/dp: Allow an early call to register DDC i2c bus") new for v6.
- Use new drm_dp_aux_register_ddc() calls.

Douglas Anderson (5):
  i2c: i2c-core-of: Fix corner case of finding adapter by node
  drm/dp: Allow an early call to register DDC i2c bus
  drm/bridge: ti-sn65dsi86: Promote the AUX channel to its own sub-dev
  drm/bridge: ti-sn65dsi86: Don't read EDID blob over DDC
  arm64: dts: qcom: Link the panel to the bridge's DDC bus

 arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi |  1 +
 drivers/gpu/drm/bridge/ti-sn65dsi86.c        | 99 +++++++++++++-------
 drivers/gpu/drm/drm_dp_helper.c              | 67 ++++++++++---
 drivers/i2c/i2c-core-of.c                    | 17 ++--
 include/drm/drm_dp_helper.h                  |  2 +
 5 files changed, 134 insertions(+), 52 deletions(-)

-- 
2.31.1.527.g47e6f16901-goog

