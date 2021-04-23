Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 239533697A3
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Apr 2021 19:00:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243257AbhDWRAa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Apr 2021 13:00:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243089AbhDWRA0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Apr 2021 13:00:26 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55EFBC061347
        for <linux-i2c@vger.kernel.org>; Fri, 23 Apr 2021 09:59:48 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id u7so23702876plr.6
        for <linux-i2c@vger.kernel.org>; Fri, 23 Apr 2021 09:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=18NetlXwajgnpGQtVunxvSsH/vFYq/mVRN14SJhebag=;
        b=Ck7dXMTbcXqeGgybSMoVJO8he10e+uD3PDZhu711leqKrmLBpUQUXHTfjVUNGYvep7
         wBw9BaFyMxvm+8ABL/EHL06v2KrcsvmFeZig4SsNT9h3vPzTc5qxpJgd5q6+fB1Xb3kK
         l0QMDHopNz0pzurKAeArFflw0HhvXrjUQQBEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=18NetlXwajgnpGQtVunxvSsH/vFYq/mVRN14SJhebag=;
        b=H7ZsIHRpE8tzdlX2/M1NmiYOXkSWzKpFPJ5PrQcPp4dXJ0jmTjUwtL16Bp3QoQtiTr
         0ZnmV2QuQDyLxbUKwPTYtEnvCDqJ6b25pyxpDoyFe4xvUu6/WHupjUq/6Tvq6NQVuIgV
         uOFFJVls8IFJyejwF1GCII40zX44k2nhXJAeqPIIkwFMYWvNGT0IQVWU73JLBbhquzt5
         4vry1ek6SLPDYeLjvAC24Qz8e/MKeYhXLUzQ6nhYLvotjEF0FvWY+gmSCgiD0NbCsiq7
         /Z7fxFU/Ih48fC5k/0USm7CT8pIxGaKKyrLG3iU/dCUSXFhUhqGUghXHJ9mr3FF/Pw2M
         wdYA==
X-Gm-Message-State: AOAM532W+KhM/WYU1xejo1auoRniC8bFeJeG0zaIIQKxuIDxAIV2yAWY
        RvJRdwygYp2bifXrrSMvJ+VoFw==
X-Google-Smtp-Source: ABdhPJwN39XHiMoFkDUGK/jYMlHhuJ0OnCKc4g/vY5QfA/Nq2SW/ZbIYpEoQf3oJgDhOndPFkJpK4Q==
X-Received: by 2002:a17:90a:540b:: with SMTP id z11mr5459263pjh.133.1619197187959;
        Fri, 23 Apr 2021 09:59:47 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:6d86:663d:71f8:6a11])
        by smtp.gmail.com with ESMTPSA id v8sm5123607pfm.128.2021.04.23.09.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 09:59:47 -0700 (PDT)
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
Subject: [PATCH v5 07/20] drm/bridge: ti-sn65dsi86: Cleanup managing of drvdata
Date:   Fri, 23 Apr 2021 09:58:53 -0700
Message-Id: <20210423095743.v5.7.If5d4d4e22e97bebcd493b76765c1759527705620@changeid>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210423165906.2504169-1-dianders@chromium.org>
References: <20210423165906.2504169-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Let's:
- Set the drvdata as soon as it's allocated. This just sets up a
  pointer so there's no downside here.
- Remove the useless call to i2c_set_clientdata() which is literally
  the same thing as dev_set_drvdata().

No functional changes intended.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index c868193f5b8f..75a41198993f 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1244,6 +1244,8 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 	pdata = devm_kzalloc(dev, sizeof(struct ti_sn65dsi86), GFP_KERNEL);
 	if (!pdata)
 		return -ENOMEM;
+	dev_set_drvdata(dev, pdata);
+	pdata->dev = dev;
 
 	pdata->regmap = devm_regmap_init_i2c(client,
 					     &ti_sn65dsi86_regmap_config);
@@ -1252,16 +1254,12 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 		return PTR_ERR(pdata->regmap);
 	}
 
-	pdata->dev = dev;
-
 	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &pdata->panel, NULL);
 	if (ret) {
 		DRM_ERROR("could not find any panel node\n");
 		return ret;
 	}
 
-	dev_set_drvdata(dev, pdata);
-
 	pdata->enable_gpio = devm_gpiod_get(dev, "enable", GPIOD_OUT_LOW);
 	if (IS_ERR(pdata->enable_gpio)) {
 		DRM_ERROR("failed to get enable gpio from DT\n");
@@ -1294,8 +1292,6 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 	if (ret)
 		return ret;
 
-	i2c_set_clientdata(client, pdata);
-
 	pdata->aux.name = "ti-sn65dsi86-aux";
 	pdata->aux.dev = dev;
 	pdata->aux.transfer = ti_sn_aux_transfer;
-- 
2.31.1.498.g6c1eba8ee3d-goog

