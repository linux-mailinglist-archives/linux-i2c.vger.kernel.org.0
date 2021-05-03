Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E6523722CF
	for <lists+linux-i2c@lfdr.de>; Mon,  3 May 2021 23:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbhECWAU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 May 2021 18:00:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229894AbhECWAR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 May 2021 18:00:17 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3198C06138C
        for <linux-i2c@vger.kernel.org>; Mon,  3 May 2021 14:59:23 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id q10so4817265pgj.2
        for <linux-i2c@vger.kernel.org>; Mon, 03 May 2021 14:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cHNn6cgaHFiYsy23xxjcXeSja9Jq6oH8Rtx9Cw9p/us=;
        b=QEOfc0k7hR4SGctu04la7uL23JKNBUOJfOGCTmjmOnfxC0g8y0/fHzqfA6Ibibmuqm
         4woEpzLA/LGcSVAaYpJv6Ude2Nhv0wZ++8hR1/XK5WOD7fZAhgyIXZ+57Z1Y5kpxhOIj
         4lD1S8NpX6cKWp9hJiBFqn/flOMgkjtxWCxDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cHNn6cgaHFiYsy23xxjcXeSja9Jq6oH8Rtx9Cw9p/us=;
        b=Z5QE00awpAHI2xu084RqTAxZb8u0c2D8A/p1Rp/jv2bVQVjKqEEq367cTC5HPmtPY3
         8QAT8kbiXcFwdKbG28EscaHh+cnyufJ28BoZueXTtOWlX1wPEugm3mFs3bLu3dHbTIRq
         UFbmL0HkWVQA15kAKxHv8oXvEJ2QB4JiPOXLQBJQ3E8Qpt7CdvuRcLzN/uO9MVT035q2
         lUA/BLQnvFh825HRa+AgtjYo03XtLI9ZIIIQdrdgvqtmcTBthwms7kdO2XXAg6l6qR+P
         UpiAQHGAhBywVSDEuFhiw5NFfvXC3qJkfX1UctooDZHGmg5b60m0dDItDPKXo26NoJ+e
         G65w==
X-Gm-Message-State: AOAM531A1YDUCLgyvSznclmOe5pBiS8RlMRjKRUYWUVqwICyruJHFCce
        l83UBneHZ1QqCDV+h/gNpak6Ag==
X-Google-Smtp-Source: ABdhPJw6xhJFWKXbx9yLrVAJoMM/0/yqDEDpABclbFcZqWO+E1l4nBR3JDgLgwwO9ZBlItrFlxJgVw==
X-Received: by 2002:a63:591b:: with SMTP id n27mr20475986pgb.33.1620079163465;
        Mon, 03 May 2021 14:59:23 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:a592:ac50:b17b:5c43])
        by smtp.gmail.com with ESMTPSA id w1sm639186pgp.31.2021.05.03.14.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 14:59:23 -0700 (PDT)
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
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Robert Foss <robert.foss@linaro.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 4/5] drm/bridge: ti-sn65dsi86: Don't read EDID blob over DDC
Date:   Mon,  3 May 2021 14:58:43 -0700
Message-Id: <20210503145750.v6.4.I9330684c25f65bb318eff57f0616500f83eac3cc@changeid>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
In-Reply-To: <20210503215844.2996320-1-dianders@chromium.org>
References: <20210503215844.2996320-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This is really just a revert of commit 58074b08c04a ("drm/bridge:
ti-sn65dsi86: Read EDID blob over DDC"), resolving conflicts.

The old code failed to read the EDID properly in a very important
case: before the bridge's pre_enable() was called. The way things need
to work:
1. Read the EDID.
2. Based on the EDID, decide on video settings and pixel clock.
3. Enable the bridge w/ the desired settings.

The way things were working:
1. Try to read the EDID but fail; fall back to hardcoded values.
2. Based on hardcoded values, decide on video settings and pixel clock.
3. Enable the bridge w/ the desired settings.
4. Try again to read the EDID, it works now!
5. Realize that the hardcoded settings weren't quite right.
6. Disable / reenable the bridge w/ the right settings.

The reasons for the failures were twofold:
a) Since we never ran the bridge chip's pre-enable then we never set
   the bit to ignore HPD. This meant the bridge chip didn't even _try_
   to go out on the bus and communicate with the panel.
b) Even if we fixed things to ignore HPD, the EDID still wouldn't read
   if the panel wasn't on.

Instead of reverting the code, we could fix it to set the HPD bit and
also power on the panel. However, it also works nicely to just let the
panel code read the EDID. Now that we've split the driver up we can
expose the DDC AUX channel bus to the panel node. The panel can take
charge of reading the EDID.

NOTE: in order for things to work, anyone that needs to read the EDID
will need to add something that looks like this to their panel in the
dts:
  ddc-i2c-bus = <&sn65dsi86_bridge>;

Presumably it's OK to land this without waiting for users to add the
dts property since the EDID reading was a bit broken anyway, was
"recently" added, and we know we must have the fallback mode to use
(since the EDID reading was a bit broken).

Suggested-by: Andrzej Hajda <a.hajda@samsung.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

(no changes since v1)

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 22 ----------------------
 1 file changed, 22 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 594aac57bdbc..9f0f785f380d 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -125,7 +125,6 @@
  * @connector:    Our connector.
  * @host_node:    Remote DSI node.
  * @dsi:          Our MIPI DSI source.
- * @edid:         Detected EDID of eDP panel.
  * @refclk:       Our reference clock.
  * @panel:        Our panel.
  * @enable_gpio:  The GPIO we toggle to enable the bridge.
@@ -156,7 +155,6 @@ struct ti_sn65dsi86 {
 	struct drm_dp_aux		aux;
 	struct drm_bridge		bridge;
 	struct drm_connector		connector;
-	struct edid			*edid;
 	struct device_node		*host_node;
 	struct mipi_dsi_device		*dsi;
 	struct clk			*refclk;
@@ -405,24 +403,6 @@ connector_to_ti_sn65dsi86(struct drm_connector *connector)
 static int ti_sn_bridge_connector_get_modes(struct drm_connector *connector)
 {
 	struct ti_sn65dsi86 *pdata = connector_to_ti_sn65dsi86(connector);
-	struct edid *edid = pdata->edid;
-	int num, ret;
-
-	if (!edid) {
-		pm_runtime_get_sync(pdata->dev);
-		edid = pdata->edid = drm_get_edid(connector, &pdata->aux.ddc);
-		pm_runtime_put_autosuspend(pdata->dev);
-	}
-
-	if (edid && drm_edid_is_valid(edid)) {
-		ret = drm_connector_update_edid_property(connector, edid);
-		if (!ret) {
-			num = drm_add_edid_modes(connector, edid);
-			if (num)
-				return num;
-		}
-	}
-
 	return drm_panel_get_modes(pdata->panel, connector);
 }
 
@@ -1353,8 +1333,6 @@ static void ti_sn_bridge_remove(struct auxiliary_device *adev)
 		mipi_dsi_device_unregister(pdata->dsi);
 	}
 
-	kfree(pdata->edid);
-
 	drm_bridge_remove(&pdata->bridge);
 
 	of_node_put(pdata->host_node);
-- 
2.31.1.527.g47e6f16901-goog

