Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CD943697C4
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Apr 2021 19:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243546AbhDWRAt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Apr 2021 13:00:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243444AbhDWRAi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Apr 2021 13:00:38 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0D85C061350
        for <linux-i2c@vger.kernel.org>; Fri, 23 Apr 2021 09:59:59 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id i190so34448071pfc.12
        for <linux-i2c@vger.kernel.org>; Fri, 23 Apr 2021 09:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2irDBnkqmM3wv0GuRvBUKKKvXT4OqqpqCxXsJUDi0yY=;
        b=nY3NEiJjTVhYaqtF4JkoIDdonIMHogVty/rQuAsexe9F4i2Uhwz/XdA3pTBItC0bzq
         O62ca7z8DZ8y/Bjr8vjTyiwT2cmF4NCXYoGPgFaSCni0Y68OlxdULfQFsPTmFEEZP/mK
         NcMkrdksVuMVbn9LSzJ4n66ujsp1NyKYNVX1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2irDBnkqmM3wv0GuRvBUKKKvXT4OqqpqCxXsJUDi0yY=;
        b=HabmHDawCdevn5AXwfkjWZFdSWTQ4PqOdhHCMOpaZmBjZVuxqGW+aXoMSnFMFBEMpK
         vP0yayeyFDkfbi9ZJ+sp/yiXp976rmTJgcOnbq/Qmi7IbGGDUv5vuotwkgBNyQtb+2nL
         FC2OdkZ6ywlmMtsqryzXkoXd8T6eSt7igP69XZLg83k0UBfo13Gy3cW0i8GHJc7zbRwY
         ZDeFI2RRO2L25+LwA7xCmKPWEylPhs42E7CqXR15BIbkCb/ztD5/y6C9sHY6xSFeYl/y
         Tx+BndcieLbGH13erB0zKr8duJgVM0l7xkoSyEP/QVmEFEPs2bRhO+ODIxzk9c8mUs/4
         b1YA==
X-Gm-Message-State: AOAM531Vzx1OH+z3kKbLYyBhBOgekJeZ/eceIKIF+ZjpgQFMYrwPXQcK
        EpYSEZpDPsDfyutyA1f0lZ0K6Q==
X-Google-Smtp-Source: ABdhPJyNRywKHcTfgakgp2CqXZs7wKXnf4eben+Fiu78mA2c8AJYA0KF0c2Abkct8V8f1il2rA20/Q==
X-Received: by 2002:a05:6a00:2bb:b029:25d:92b:bf3b with SMTP id q27-20020a056a0002bbb029025d092bbf3bmr4694708pfs.52.1619197199276;
        Fri, 23 Apr 2021 09:59:59 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:6d86:663d:71f8:6a11])
        by smtp.gmail.com with ESMTPSA id v8sm5123607pfm.128.2021.04.23.09.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 09:59:58 -0700 (PDT)
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
Subject: [PATCH v5 17/20] drm/panel: panel-simple: Power the panel when reading the EDID
Date:   Fri, 23 Apr 2021 09:59:03 -0700
Message-Id: <20210423095743.v5.17.Ibd31b8f7c73255d68c5c9f5b611b4bfaa036f727@changeid>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210423165906.2504169-1-dianders@chromium.org>
References: <20210423165906.2504169-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

I don't believe that it ever makes sense to read the EDID when a panel
is not powered and the powering on of the panel is the job of
prepare(). Let's make sure that this happens before we try to read the
EDID. We use the pm_runtime functions directly rather than directly
calling the normal prepare() function because the pm_runtime functions
are definitely refcounted whereas it's less clear if the prepare() one
is.

NOTE: I'm not 100% sure how EDID reading was working for folks in the
past, but I can only assume that it was failing on the initial attempt
and then working only later. This patch, presumably, will fix that. If
some panel out there really can read the EDID without powering up and
it's a big advantage to preserve the old behavior we can add a
per-panel flag. It appears that providing the DDC bus to the panel in
the past was somewhat uncommon in any case.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

(no changes since v1)

 drivers/gpu/drm/panel/panel-simple.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 4de33c929a59..a12dfe8b8d90 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -510,12 +510,18 @@ static int panel_simple_get_modes(struct drm_panel *panel,
 
 	/* probe EDID if a DDC bus is available */
 	if (p->ddc) {
-		struct edid *edid = drm_get_edid(connector, p->ddc);
+		struct edid *edid;
 
+		pm_runtime_get_sync(panel->dev);
+
+		edid = drm_get_edid(connector, p->ddc);
 		if (edid) {
 			num += drm_add_edid_modes(connector, edid);
 			kfree(edid);
 		}
+
+		pm_runtime_mark_last_busy(panel->dev);
+		pm_runtime_put_autosuspend(panel->dev);
 	}
 
 	/* add hard-coded panel modes */
-- 
2.31.1.498.g6c1eba8ee3d-goog

