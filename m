Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5F3A3697CC
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Apr 2021 19:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243573AbhDWRBB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Apr 2021 13:01:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243482AbhDWRAl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Apr 2021 13:00:41 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF696C06135B
        for <linux-i2c@vger.kernel.org>; Fri, 23 Apr 2021 10:00:01 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id q2so2499176pfk.9
        for <linux-i2c@vger.kernel.org>; Fri, 23 Apr 2021 10:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4ccmN7kOFt4vV6tYXQphBKXq8QUp9QP8qMDQTtMZWgc=;
        b=mZXvU2oI2xqSARjGIIO7jRUdu3n+mLCmWcMcgsEWbTafsweZuS6UDJ2mm6wfMJ06LY
         xi3py9XoTAi9JlGgELbjAIDc7lIU2+4t09kgNMnrit9xbmaXGU745d7vAijNlJLPC5xK
         l7Y6BU6/lFwFMyrFRjQBDEN6y0pwiuZCjkuFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4ccmN7kOFt4vV6tYXQphBKXq8QUp9QP8qMDQTtMZWgc=;
        b=q8R8XWq7uAGg8ztBV6KVafPoiCIyvt9mhgiQ+Ko9Q3G4/VLezgO90m3Vxz+NrIFDcK
         a9Cm83quz1PzxSN18cWwKUWgcuDLtUdaGU1d2b/tqA/XSE9lku+M6QP1f9JhhbwufMTV
         pvJQYxg8wedHbUeBw4qT9sNGkz0jEC0rmZEOgk2aF5gDKZmWEm2RKAujJIHBZ/H3ExGK
         FU+LO0SRAbIZljIIr/F1IbojPYl6LSHpAnFtaergVu7sWCt/xg2sOxdJFWn8pfS9jtaj
         8oofltURKEPJ2bXuuMihwsDSOUGbw29hHdJB90G7wsBBhbPxyYaW/grn+IoDoNIERgSI
         euMw==
X-Gm-Message-State: AOAM531NFQ0PGEIe/AV5iued8fc1ttzxOvqFPqZX9SqbF+Uh9gpvx7NV
        PXErORUcncxQmmc6MHusHOvhTw==
X-Google-Smtp-Source: ABdhPJyk8jzpiq6MaxB8UsjZw7IBJENrtzi8fsfu2GjjtKaFZYH2dXT4qQBYIbdKYg2hvlCPx7Bg/Q==
X-Received: by 2002:a63:8c4a:: with SMTP id q10mr4737171pgn.106.1619197201481;
        Fri, 23 Apr 2021 10:00:01 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:6d86:663d:71f8:6a11])
        by smtp.gmail.com with ESMTPSA id v8sm5123607pfm.128.2021.04.23.10.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 10:00:01 -0700 (PDT)
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
Subject: [PATCH v5 19/20] drm/bridge: ti-sn65dsi86: Don't read EDID blob over DDC
Date:   Fri, 23 Apr 2021 09:59:05 -0700
Message-Id: <20210423095743.v5.19.I9330684c25f65bb318eff57f0616500f83eac3cc@changeid>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210423165906.2504169-1-dianders@chromium.org>
References: <20210423165906.2504169-1-dianders@chromium.org>
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
index 3539ddf9d109..26851119df96 100644
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
 
@@ -1344,8 +1324,6 @@ static void ti_sn_bridge_remove(struct auxiliary_device *adev)
 		mipi_dsi_device_unregister(pdata->dsi);
 	}
 
-	kfree(pdata->edid);
-
 	drm_bridge_remove(&pdata->bridge);
 
 	of_node_put(pdata->host_node);
-- 
2.31.1.498.g6c1eba8ee3d-goog

