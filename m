Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9336A3697AA
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Apr 2021 19:00:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243436AbhDWRAi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Apr 2021 13:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243337AbhDWRA2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Apr 2021 13:00:28 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B062AC06138C
        for <linux-i2c@vger.kernel.org>; Fri, 23 Apr 2021 09:59:51 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id e8-20020a17090a7288b029014e51f5a6baso1522823pjg.2
        for <linux-i2c@vger.kernel.org>; Fri, 23 Apr 2021 09:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iBUj5kQ7X9fmMOQ4CZ8JChILd2WBNcvTtcV/hSGMVvg=;
        b=FdxPxbY7ijX71QBS18OIzi0n9sM2odFgKMp717noKgZ2ye6GMt0SW1OvPd/Rehb+6h
         +GXiaiJfaAVKyM6/PiiioDTEQZ4BDLR2qq0n2pk5tk2gj07eirFILT0zYteJxyt8L1kS
         wiaJkmwfDd19bvqFN19QAtqryqglfaM4jRHOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iBUj5kQ7X9fmMOQ4CZ8JChILd2WBNcvTtcV/hSGMVvg=;
        b=H+FzmozpUn+3j98v7aD8uPaT/l3sPR7InyioEHotkUOtSri3upYw96+Jeq4BWTqVDp
         Av0Igd+Iwo+sUCr5j47eb7CuqQmx8sGP79iiEp/3YNTRsYWXOztPbtsxkUntsWyoGrML
         R0q0fJZuohqcr86IuftF0HvkfpOQK8of2YGRaHivvWQO4ZM+QVZ6bY2xR1QuD+bmg0N+
         RdW226XmCYtsDkSNotvEdLckO9HJ7ImkGJAWm6K1ctz8VX2hVw1cIR+r9d6iMG6jxdKz
         4dLI9BV0cXx33WqXL0vS3BVqfiD8xC2bZ5VTIwxyE+2V2ZBS1dWoRIprD8eRrsIcPXiu
         WkuA==
X-Gm-Message-State: AOAM531SPPOyoG0GUai3hJylxJWcag2eFK4sJRZw/sG9qkvywOvSrNhb
        QKIfjmTBwfKvO5GCkQrUp7x9zA==
X-Google-Smtp-Source: ABdhPJxyF0nN/4vsiL7lk43a0I/qpwpmwLXPqQ05NyVO9W3gD4zw+0dRDftgTSkOcNerASpW3ts8Aw==
X-Received: by 2002:a17:90b:2306:: with SMTP id mt6mr5416893pjb.119.1619197191335;
        Fri, 23 Apr 2021 09:59:51 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:6d86:663d:71f8:6a11])
        by smtp.gmail.com with ESMTPSA id v8sm5123607pfm.128.2021.04.23.09.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 09:59:50 -0700 (PDT)
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
        Thierry Reding <thierry.reding@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 10/20] drm/panel: panel-simple: Get rid of hacky HPD chicken-and-egg code
Date:   Fri, 23 Apr 2021 09:58:56 -0700
Message-Id: <20210423095743.v5.10.I40eeedc23459d1e3fc96fa6cdad775d88c6e706c@changeid>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210423165906.2504169-1-dianders@chromium.org>
References: <20210423165906.2504169-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

When I added support for the hpd-gpio to simple-panel in commit
48834e6084f1 ("drm/panel-simple: Support hpd-gpios for delaying
prepare()"), I added a special case to handle a circular dependency I
was running into on the ti-sn65dsi86 bridge chip. On my board the
hpd-gpio is actually provided by the bridge chip. That was causing
some circular dependency problems that I had to work around by getting
the hpd-gpio late.

I've now reorganized the ti-sn65dsi86 bridge chip driver to be a
collection of sub-drivers. Now the GPIO part can probe separately and
that breaks the chain. Let's get rid of the old code to clean things
up.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

(no changes since v1)

 drivers/gpu/drm/panel/panel-simple.c | 24 +++++-------------------
 1 file changed, 5 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 9746eda6f675..bd208abcbf07 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -366,8 +366,7 @@ static int panel_simple_unprepare(struct drm_panel *panel)
 	return 0;
 }
 
-static int panel_simple_get_hpd_gpio(struct device *dev,
-				     struct panel_simple *p, bool from_probe)
+static int panel_simple_get_hpd_gpio(struct device *dev, struct panel_simple *p)
 {
 	int err;
 
@@ -375,17 +374,10 @@ static int panel_simple_get_hpd_gpio(struct device *dev,
 	if (IS_ERR(p->hpd_gpio)) {
 		err = PTR_ERR(p->hpd_gpio);
 
-		/*
-		 * If we're called from probe we won't consider '-EPROBE_DEFER'
-		 * to be an error--we'll leave the error code in "hpd_gpio".
-		 * When we try to use it we'll try again.  This allows for
-		 * circular dependencies where the component providing the
-		 * hpd gpio needs the panel to init before probing.
-		 */
-		if (err != -EPROBE_DEFER || !from_probe) {
+		if (err != -EPROBE_DEFER)
 			dev_err(dev, "failed to get 'hpd' GPIO: %d\n", err);
-			return err;
-		}
+
+		return err;
 	}
 
 	return 0;
@@ -416,12 +408,6 @@ static int panel_simple_prepare_once(struct panel_simple *p)
 		msleep(delay);
 
 	if (p->hpd_gpio) {
-		if (IS_ERR(p->hpd_gpio)) {
-			err = panel_simple_get_hpd_gpio(dev, p, false);
-			if (err)
-				goto error;
-		}
-
 		if (p->desc->delay.hpd_absent_delay)
 			hpd_wait_us = p->desc->delay.hpd_absent_delay * 1000UL;
 		else
@@ -682,7 +668,7 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 
 	panel->no_hpd = of_property_read_bool(dev->of_node, "no-hpd");
 	if (!panel->no_hpd) {
-		err = panel_simple_get_hpd_gpio(dev, panel, true);
+		err = panel_simple_get_hpd_gpio(dev, panel);
 		if (err)
 			return err;
 	}
-- 
2.31.1.498.g6c1eba8ee3d-goog

