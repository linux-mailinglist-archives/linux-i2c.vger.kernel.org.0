Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7EE13697A5
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Apr 2021 19:00:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243089AbhDWRAc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Apr 2021 13:00:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243284AbhDWRA1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Apr 2021 13:00:27 -0400
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76E30C06138E
        for <linux-i2c@vger.kernel.org>; Fri, 23 Apr 2021 09:59:49 -0700 (PDT)
Received: by mail-pj1-x1035.google.com with SMTP id nk8so10259194pjb.3
        for <linux-i2c@vger.kernel.org>; Fri, 23 Apr 2021 09:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PaR/egwiLTXMp/V4QlaRuOrtKs7oGBmyLwSo5ArZpK0=;
        b=aZPFRpeDad0DFJAa59kkFQtZwo7+BNKMT+alJcwybBsazT/Cnig/UduYNqNWE2aBwO
         Q5PbmhrZ+J8XFHjO5n/Wyi1f8hpsSXqw0GsxA0UWOYdcClq24UozbEsrvtKwd+wRDL8Q
         wnDLDB7nDJGm8ffl4hj74tWRBHMeHj+m+sJbg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PaR/egwiLTXMp/V4QlaRuOrtKs7oGBmyLwSo5ArZpK0=;
        b=f7Ct6CInmfWeB42AUsit8x6VLAClhJaGXICxZSu90fPsi0Akp+PCvlxNLi8yruiReC
         NozXI6Ap8cpHVH9U71punMpCk5FWZTXcERz3KbaquMqdnVoYfEETibDm+UdEKTsNyV1H
         o3m6wX5LgBjVsReSn5C1BOwUS5vx4qx/CeAv4Ggi3QOeI+jbxH4EKspT87dbUeSc9HHh
         Jf/CuCd9cVWOG6O+RStO69fdPKv4ReuTY5cbUpXIH/2b+b2TY8LiNbn8VCndlEOrqqkL
         QUClZdjzxjytPaobwii41054+qFt9EZHQnRWirwnQHcUCpp0AjL+cTjNG8QnNoUUZp67
         kpGA==
X-Gm-Message-State: AOAM532LVJh0dytc43hITD5HumkiQ73DR9cdgjIjTRnWYO4urYYS1SEx
        xOemZIQhUTzhCxVPO2+KD1JMKg==
X-Google-Smtp-Source: ABdhPJyl4eJ4vKH9OKx0CWgwPTyFJfbmpRq+PZblaJpQI/rjjJLT30UQw8KAqa8Vh6G/JI+s3NBHfw==
X-Received: by 2002:a17:902:e289:b029:eb:29e7:beda with SMTP id o9-20020a170902e289b02900eb29e7bedamr4950923plc.78.1619197189070;
        Fri, 23 Apr 2021 09:59:49 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:6d86:663d:71f8:6a11])
        by smtp.gmail.com with ESMTPSA id v8sm5123607pfm.128.2021.04.23.09.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 09:59:48 -0700 (PDT)
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
Subject: [PATCH v5 08/20] drm/bridge: ti-sn65dsi86: Move all the chip-related init to the start
Date:   Fri, 23 Apr 2021 09:58:54 -0700
Message-Id: <20210423095743.v5.8.Ide8ba40feb2e43bc98a11edbb08d696d62dcd83e@changeid>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210423165906.2504169-1-dianders@chromium.org>
References: <20210423165906.2504169-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This is just code motion of the probe routine to move all the things
that are for the "whole chip" (instead of the GPIO parts or the
MIPI-to-eDP parts) together at the start of probe. This is in
preparation for breaking the driver into sub-drivers.

Since we're using devm for all of the "whole chip" stuff this is
actually quite easy now.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 75a41198993f..68673f736b23 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1254,12 +1254,6 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 		return PTR_ERR(pdata->regmap);
 	}
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &pdata->panel, NULL);
-	if (ret) {
-		DRM_ERROR("could not find any panel node\n");
-		return ret;
-	}
-
 	pdata->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
 	if (IS_ERR(pdata->enable_gpio)) {
 		DRM_ERROR("failed to get enable gpio from DT\n");
@@ -1267,8 +1261,6 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 		return ret;
 	}
 
-	ti_sn_bridge_parse_lanes(pdata, dev->of_node);
-
 	ret = ti_sn65dsi86_parse_regulators(pdata);
 	if (ret) {
 		DRM_ERROR("failed to parse regulators\n");
@@ -1279,12 +1271,22 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 	if (IS_ERR(pdata->refclk))
 		return PTR_ERR(pdata->refclk);
 
-	ret = ti_sn_bridge_parse_dsi_host(pdata);
+	pm_runtime_enable(dev);
+	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_runtime_disable, dev);
 	if (ret)
 		return ret;
 
-	pm_runtime_enable(dev);
-	ret = devm_add_action_or_reset(dev, ti_sn65dsi86_runtime_disable, dev);
+	ti_sn65dsi86_debugfs_init(pdata);
+
+	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &pdata->panel, NULL);
+	if (ret) {
+		DRM_ERROR("could not find any panel node\n");
+		return ret;
+	}
+
+	ti_sn_bridge_parse_lanes(pdata, dev->of_node);
+
+	ret = ti_sn_bridge_parse_dsi_host(pdata);
 	if (ret)
 		return ret;
 
@@ -1302,8 +1304,6 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 
 	drm_bridge_add(&pdata->bridge);
 
-	ti_sn65dsi86_debugfs_init(pdata);
-
 	return 0;
 }
 
-- 
2.31.1.498.g6c1eba8ee3d-goog

