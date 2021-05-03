Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A5A73722CA
	for <lists+linux-i2c@lfdr.de>; Mon,  3 May 2021 23:59:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229839AbhECWAQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 May 2021 18:00:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229866AbhECWAP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 3 May 2021 18:00:15 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFD82C061574
        for <linux-i2c@vger.kernel.org>; Mon,  3 May 2021 14:59:21 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id m12so4792379pgr.9
        for <linux-i2c@vger.kernel.org>; Mon, 03 May 2021 14:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W77IZHCnR8zsUGkGNcdPd69iBZZWTodBrQgHGoIvISw=;
        b=M7TZCmAyoUuDzEvPoOmNkr6tBJGvDOg1aR4s7KOllc0EReHc789CdHc4KLzYms9sUR
         5Z3DYDxMXHvWz9wnmzsO7ur2w+WrdPQ52D5E2adcrhy4EhUKeKsS24hkgcqEMF3ndr6w
         o4dBqj+CG6w1Wz63Tlq4h2sjgbhp2vayV4yfM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W77IZHCnR8zsUGkGNcdPd69iBZZWTodBrQgHGoIvISw=;
        b=WWoAbRRJVdIlBAhCX3UYcfuPn3mtcyf5tOwRzebW5WDhQABPsIY9MQHrs1bcTN9Nl0
         7c+eDITePHzBJqYJrL+CkYVDPTbMh+12J7pof8tVlZAKkYd1tRqcLyzvCmYJ68VBdJxy
         9XGP4q796bi5u2Lw8WFL0Rg/qqTwGVbsIC33ulaWkjK1STEpNr1aagSANYl+MsJil5Mi
         Z9pDSlrdANz4u2rOLfwG/wthb9WvwBj+fNO0jMBDx2Qxp7SBF2BgiZoP3xRRT219NuK7
         ukpRKX2Ff/kL2MMcrQoPP6uDlrpQ7h3RTjIfyZ9bgkFHx+e5GZqMJePngxHF+5dNvVpW
         2IsQ==
X-Gm-Message-State: AOAM532RQrw8Mwn3BPvnPit6PyBBZWVql++ngfyXhT3Iy59C/1QBeMbA
        r5/xKsgQdCPbsXQfp3iblAZ4TQ==
X-Google-Smtp-Source: ABdhPJwUwZpD0ml7xZSSGB8YnVak9g4AclMeV/DUQkle3+bQBr3hT0aM54E9KH7HNRBu5lUO+G4fog==
X-Received: by 2002:a17:90a:440f:: with SMTP id s15mr943884pjg.192.1620079161254;
        Mon, 03 May 2021 14:59:21 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:a592:ac50:b17b:5c43])
        by smtp.gmail.com with ESMTPSA id w1sm639186pgp.31.2021.05.03.14.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 14:59:20 -0700 (PDT)
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
Subject: [PATCH v6 3/5] drm/bridge: ti-sn65dsi86: Promote the AUX channel to its own sub-dev
Date:   Mon,  3 May 2021 14:58:42 -0700
Message-Id: <20210503145750.v6.3.If89144992cb9d900f8c91a8d1817dbe00f543720@changeid>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
In-Reply-To: <20210503215844.2996320-1-dianders@chromium.org>
References: <20210503215844.2996320-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

We'd like to be able to expose the DDC-over-AUX channel bus to our
panel. This gets into a chicken-and-egg problem because:
- The panel wants to get its DDC bus at probe time.
- The ti-sn65dsi86 MIPI-to-eDP bridge code, which provides the DDC
  bus, wants to get the panel at probe time.

By using a sub device we can fully create the AUX channel bits so that
the panel can get them. Then the panel can finish probing and the
bridge can probe.

To accomplish this, we use the new functions introduced in ("drm/dp:
Allow an early call to register DDC i2c bus") to register the i2c bus
early.

NOTE: there's a little bit of a trick here. Though the AUX channel can
run without the MIPI-to-eDP bits of the code, the MIPI-to-eDP bits
can't run without the AUX channel. We could come up a complicated
signaling scheme (have the MIPI-to-eDP bits return EPROBE_DEFER for a
while or wait on some sort of completion), but it seems simple enough
to just not even bother creating the bridge device until the AUX
channel probes. That's what we'll do.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Commit 6cba3fe43341 ("drm/dp: Add backpointer to drm_device in
drm_dp_aux") made it very explicit that it's not OK to fully register
the aux device until we have the bridge, but hopefully just getting
the i2c bits early is OK?

Changes in v6:
- Use new drm_dp_aux_register_ddc() calls.

 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 77 +++++++++++++++++++++++----
 1 file changed, 66 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index db027528febd..594aac57bdbc 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -116,6 +116,7 @@
  * struct ti_sn65dsi86 - Platform data for ti-sn65dsi86 driver.
  * @bridge_aux:   AUX-bus sub device for MIPI-to-eDP bridge functionality.
  * @gpio_aux:     AUX-bus sub device for GPIO controller functionality.
+ * @aux_aux:      AUX-bus sub device for eDP AUX channel functionality.
  *
  * @dev:          Pointer to the top level (i2c) device.
  * @regmap:       Regmap for accessing i2c.
@@ -148,6 +149,7 @@
 struct ti_sn65dsi86 {
 	struct auxiliary_device		bridge_aux;
 	struct auxiliary_device		gpio_aux;
+	struct auxiliary_device		aux_aux;
 
 	struct device			*dev;
 	struct regmap			*regmap;
@@ -1331,11 +1333,6 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
 	if (ret)
 		return ret;
 
-	pdata->aux.name = "ti-sn65dsi86-aux";
-	pdata->aux.dev = pdata->dev;
-	pdata->aux.transfer = ti_sn_aux_transfer;
-	drm_dp_aux_init(&pdata->aux);
-
 	pdata->bridge.funcs = &ti_sn_bridge_funcs;
 	pdata->bridge.of_node = np;
 
@@ -1430,6 +1427,50 @@ static int ti_sn65dsi86_add_aux_device(struct ti_sn65dsi86 *pdata,
 	return ret;
 }
 
+static void ti_sn65dsi86_unregister_dp_aux_ddc(void *data)
+{
+	drm_dp_aux_unregister_ddc(data);
+}
+
+static int ti_sn_aux_probe(struct auxiliary_device *adev,
+			   const struct auxiliary_device_id *id)
+{
+	struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
+	int ret;
+
+	pdata->aux.name = "ti-sn65dsi86-aux";
+	pdata->aux.dev = pdata->dev;
+	pdata->aux.transfer = ti_sn_aux_transfer;
+	drm_dp_aux_init(&pdata->aux);
+
+	ret = drm_dp_aux_register_ddc(&pdata->aux);
+	if (ret < 0) {
+		drm_err(pdata, "Failed to register AUX DDC channel: %d\n", ret);
+		return ret;
+	}
+	ret = devm_add_action_or_reset(&adev->dev,
+				       ti_sn65dsi86_unregister_dp_aux_ddc, &pdata->aux);
+	if (ret)
+		return ret;
+
+	/*
+	 * The eDP to MIPI bridge parts don't work until the AUX channel is
+	 * setup so we don't add it in the main driver probe, we add it now.
+	 */
+	return ti_sn65dsi86_add_aux_device(pdata, &pdata->bridge_aux, "bridge");
+}
+
+static const struct auxiliary_device_id ti_sn_aux_id_table[] = {
+	{ .name = "ti_sn65dsi86.aux", },
+	{},
+};
+
+static struct auxiliary_driver ti_sn_aux_driver = {
+	.name = "aux",
+	.probe = ti_sn_aux_probe,
+	.id_table = ti_sn_aux_id_table,
+};
+
 static int ti_sn65dsi86_probe(struct i2c_client *client,
 			      const struct i2c_device_id *id)
 {
@@ -1488,10 +1529,11 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 	 * motiviation here is to solve the chicken-and-egg problem of probe
 	 * ordering. The bridge wants the panel to be there when it probes.
 	 * The panel wants its HPD GPIO (provided by sn65dsi86 on some boards)
-	 * when it probes. There will soon be other devices (DDC I2C bus, PWM)
-	 * that have the same problem. Having sub-devices allows the some sub
-	 * devices to finish probing even if others return -EPROBE_DEFER and
-	 * gets us around the problems.
+	 * when it probes. The panel and maybe backlight might want the DDC
+	 * bus. Soon the PWM provided by the bridge chip will have the same
+	 * problem. Having sub-devices allows the some sub devices to finish
+	 * probing even if others return -EPROBE_DEFER and gets us around the
+	 * problems.
 	 */
 
 	if (IS_ENABLED(CONFIG_OF_GPIO)) {
@@ -1500,7 +1542,13 @@ static int ti_sn65dsi86_probe(struct i2c_client *client,
 			return ret;
 	}
 
-	return ti_sn65dsi86_add_aux_device(pdata, &pdata->bridge_aux, "bridge");
+	/*
+	 * NOTE: At the end of the AUX channel probe we'll add the aux device
+	 * for the bridge. This is because the bridge can't be used until the
+	 * AUX channel is there and this is a very simple solution to the
+	 * dependency problem.
+	 */
+	return ti_sn65dsi86_add_aux_device(pdata, &pdata->aux_aux, "aux");
 }
 
 static struct i2c_device_id ti_sn65dsi86_id[] = {
@@ -1537,12 +1585,18 @@ static int __init ti_sn65dsi86_init(void)
 	if (ret)
 		goto err_main_was_registered;
 
-	ret = auxiliary_driver_register(&ti_sn_bridge_driver);
+	ret = auxiliary_driver_register(&ti_sn_aux_driver);
 	if (ret)
 		goto err_gpio_was_registered;
 
+	ret = auxiliary_driver_register(&ti_sn_bridge_driver);
+	if (ret)
+		goto err_aux_was_registered;
+
 	return 0;
 
+err_aux_was_registered:
+	auxiliary_driver_unregister(&ti_sn_aux_driver);
 err_gpio_was_registered:
 	ti_sn_gpio_unregister();
 err_main_was_registered:
@@ -1555,6 +1609,7 @@ module_init(ti_sn65dsi86_init);
 static void __exit ti_sn65dsi86_exit(void)
 {
 	auxiliary_driver_unregister(&ti_sn_bridge_driver);
+	auxiliary_driver_unregister(&ti_sn_aux_driver);
 	ti_sn_gpio_unregister();
 	i2c_del_driver(&ti_sn65dsi86_driver);
 }
-- 
2.31.1.527.g47e6f16901-goog

