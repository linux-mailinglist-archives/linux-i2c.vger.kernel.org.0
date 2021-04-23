Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFD953697AB
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Apr 2021 19:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243448AbhDWRAi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Apr 2021 13:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243346AbhDWRA3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Apr 2021 13:00:29 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED492C061574
        for <linux-i2c@vger.kernel.org>; Fri, 23 Apr 2021 09:59:52 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id lr7so7279982pjb.2
        for <linux-i2c@vger.kernel.org>; Fri, 23 Apr 2021 09:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gV3qYwahIARQiQrXn6qcnB2XNtIx8vMB6/KiYYZ2Nu0=;
        b=ODW8f2PHl6os3mSPPZkE6MzhNedNFfpKM5Cll2rpPJj/CieenT2TJvOrCFLAddwT7H
         h34InzeviKqXtD5UwhSUPmp7/7PwMZumIXib+w6JAqGZrl+xK93wv3tzjpFrL0kZZIXN
         DVRIqdDSLKIzD/YTMGLJCvaciUqvedx6Ary0M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gV3qYwahIARQiQrXn6qcnB2XNtIx8vMB6/KiYYZ2Nu0=;
        b=MuZBoK927jD4YoPcbH+LK0eCPW4AcVRh/8KIiU5aPYIxc9XedLFU19uh32cz0cXjq0
         HtUkPAetD3XaAKrXgPM8H716YHX+NLPfD3klXEmMIHkb1IU/BCJPz3VpgSZcLhZFXk0G
         rt5kAGxQuxDUlehoDQpEEF4YxwBeifzTZtl+QadSvRQCTymZ11J8IuxVGfAinRTC2ZPJ
         uTVaLXZ8KnsGqRltINPyIc+NhP5XAsws1D4F8LNnWtq+kG4pKjRy0L9vAES+RFypwrEq
         8wOO40D81zPP+TEHs7IUzidIiOr5KwiPMsXkIaz/TsccnwxwYRMuVctGTx/5niBlUX0m
         kW3w==
X-Gm-Message-State: AOAM532iCnMTooYVi8BDeC+5L73bLb1vpO5HPFNEykomfI7YkaE7KZ6I
        7FDITSiNiG9UPp5o9NrnJXEHgA==
X-Google-Smtp-Source: ABdhPJxlBL9L1zQOEo1208W4LdTrk3u3cxg+rADQcsddskPPxY8toqxStFbKWD53qfQjCXP5FGOXDQ==
X-Received: by 2002:a17:90a:88e:: with SMTP id v14mr5347003pjc.107.1619197192542;
        Fri, 23 Apr 2021 09:59:52 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:6d86:663d:71f8:6a11])
        by smtp.gmail.com with ESMTPSA id v8sm5123607pfm.128.2021.04.23.09.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 09:59:52 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Sam Ravnborg <sam@ravnborg.org>, Wolfram Sang <wsa@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, robdclark@chromium.org,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Linus W <linus.walleij@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        dri-devel@lists.freedesktop.org,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Robert Foss <robert.foss@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 11/20] drm/bridge: ti-sn65dsi86: Use pm_runtime autosuspend
Date:   Fri, 23 Apr 2021 09:58:57 -0700
Message-Id: <20210423095743.v5.11.I4c0b4a87e4dc19e5023b4d0a21bbfa6d9c09ebd8@changeid>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210423165906.2504169-1-dianders@chromium.org>
References: <20210423165906.2504169-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Let's make the bridge use autosuspend with a 500ms delay. This is in
preparation for promoting DP AUX transfers to their own sub-driver so
that we're not constantly powering up and down the device as we
transfer all the chunks.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 0bd1a1d1453e..49b76b2ffe25 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -243,7 +243,7 @@ static int status_show(struct seq_file *s, void *data)
 		seq_printf(s, "[0x%02x] = 0x%08x\n", reg, val);
 	}
 
-	pm_runtime_put(pdata->dev);
+	pm_runtime_put_autosuspend(pdata->dev);
 
 	return 0;
 }
@@ -293,7 +293,7 @@ static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
 	if (!edid) {
 		pm_runtime_get_sync(pdata->dev);
 		edid = pdata->edid = drm_get_edid(connector, &pdata->aux.ddc);
-		pm_runtime_put(pdata->dev);
+		pm_runtime_put_autosuspend(pdata->dev);
 	}
 
 	if (edid && drm_edid_is_valid(edid)) {
@@ -419,7 +419,7 @@ static int ti_sn_bridge_attach(struct drm_bridge *bridge,
 	/* check if continuous dsi clock is required or not */
 	pm_runtime_get_sync(pdata->dev);
 	regmap_read(pdata->regmap, SN_DPPLL_SRC_REG, &val);
-	pm_runtime_put(pdata->dev);
+	pm_runtime_put_autosuspend(pdata->dev);
 	if (!(val & DPPLL_CLK_SRC_DSICLK))
 		dsi->mode_flags |= MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
@@ -1050,7 +1050,7 @@ static int ti_sn_bridge_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	 */
 	pm_runtime_get_sync(pdata->dev);
 	ret = regmap_read(pdata->regmap, SN_GPIO_IO_REG, &val);
-	pm_runtime_put(pdata->dev);
+	pm_runtime_put_autosuspend(pdata->dev);
 
 	if (ret)
 		return ret;
@@ -1101,7 +1101,7 @@ static int ti_sn_bridge_gpio_direction_input(struct gpio_chip *chip,
 	 * it off and when it comes back it will have lost all state, but
 	 * that's OK because the default is input and we're now an input.
 	 */
-	pm_runtime_put(pdata->dev);
+	pm_runtime_put_autosuspend(pdata->dev);
 
 	return 0;
 }
@@ -1127,7 +1127,7 @@ static int ti_sn_bridge_gpio_direction_output(struct gpio_chip *chip,
 				 SN_GPIO_MUX_OUTPUT << shift);
 	if (ret) {
 		clear_bit(offset, pdata->gchip_output);
-		pm_runtime_put(pdata->dev);
+		pm_runtime_put_autosuspend(pdata->dev);
 	}
 
 	return ret;
@@ -1418,6 +1418,8 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_runtime_disable, dev);
 	if (ret)
 		return ret;
+	pm_runtime_set_autosuspend_delay(pdata->dev, 500);
+	pm_runtime_use_autosuspend(pdata->dev);
 
 	ti_sn65dsi86_debugfs_init(pdata);
 
-- 
2.31.1.498.g6c1eba8ee3d-goog

