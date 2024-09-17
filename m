Return-Path: <linux-i2c+bounces-6818-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC05597AD88
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 11:05:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E5C8B2A20A
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Sep 2024 08:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCDB8175D5D;
	Tue, 17 Sep 2024 08:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Cb8FfdzX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E71165EEF;
	Tue, 17 Sep 2024 08:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726563215; cv=none; b=dHDhoGRS8Qbcw1Ykj9Ip3WYEE8mTc0xK0YyfcedWEeU8nPMokMyNKtp5keEu43yNYW2A8lMKrU970GLEVLPHp+gKLp95rOYDVLHmNSmvlKouHIa15SWEAUX7UB73qzaZGhXHY6Mlr3Jio35KA2SqweMNPskp67PVS4OY815o65I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726563215; c=relaxed/simple;
	bh=z+d3irWh7mStagZJOo4SmN0ZvOkr+sZJxcsZgV6KR3E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oamGMGj9KYmCGrulipiK+QYjKf3jZBACHpMq/yXmO/UKMEigy/TMQacAk31xEnr6E9FfTeCmUyOr7a2xk0GMnWYn9eJZs/auNHpIEENTrDlsOuqLgAI7VchixdNLB/3oQp6nlbxxeWnkbjYs3cpxPhyGbzSXdKNFkIySqbHmca8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Cb8FfdzX; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 17F8124000F;
	Tue, 17 Sep 2024 08:53:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1726563211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NbWGpJQEJyMacI+BAl0HLXVEczFckWr8+kUC/shDjy8=;
	b=Cb8FfdzXhk4g/9rQXsYItNmhlK4goP3zY1+tFtY78i0f8wuTgUyL/2LfWvtmw27SVW6D3P
	xfCyqEyCt4Qw44LRO2OXqZymPuitdlOVGiCleFKdImwG6DHaFaDDeRSXPMHPJPxOAeOwYV
	VSvmSh1LxxmRFlgEVjCRtxJfkx3pQ6bi3SJ4kFNHfetqmQcAHdSegwavtEZ0x7w/ULL8Co
	z4AKVzIgsaoTmqQJ+2z1k6apFc2LNb+iRxwYjV2GQKjY8SdGgrboDaDQVIOIeo3dL6+zbj
	1SHNzhIRYYKunkA8kL1T2MHKHzxbQooxn6gdGqSXtCZN2yPLYM8I6eW8qoZW3Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 17 Sep 2024 10:53:10 +0200
Subject: [PATCH v4 6/8] backlight: led-backlight: add devlink to supplier
 LEDs
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240917-hotplug-drm-bridge-v4-6-bc4dfee61be6@bootlin.com>
References: <20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com>
In-Reply-To: <20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Derek Kiernan <derek.kiernan@amd.com>, 
 Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Saravana Kannan <saravanak@google.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Lee Jones <lee@kernel.org>, 
 Daniel Thompson <daniel.thompson@linaro.org>, 
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>
Cc: Paul Kocialkowski <contact@paulk.fr>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-i2c@vger.kernel.org, linux-fbdev@vger.kernel.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-Sasl: luca.ceresoli@bootlin.com

led-backlight is a consumer of one or multiple LED class devices, but no
devlink is created for such supplier-producer relationship. One consequence
is that removal ordered is not correctly enforced.

Issues happen for example with the following sections in a device tree
overlay:

    // An LED driver chip
    pca9632@62 {
        compatible = "nxp,pca9632";
        reg = <0x62>;

	// ...

        addon_led_pwm: led-pwm@3 {
            reg = <3>;
            label = "addon:led:pwm";
        };
    };

    backlight-addon {
        compatible = "led-backlight";
        leds = <&addon_led_pwm>;
        brightness-levels = <255>;
        default-brightness-level = <255>;
    };

On removal of the above overlay, the LED driver can be removed before the
backlight device, resulting in:

    Unable to handle kernel NULL pointer dereference at virtual address 0000000000000010
    ...
    Call trace:
     led_put+0xe0/0x140
     devm_led_release+0x6c/0x98

Fix by adding a devlink between the consuming led-backlight device and the
supplying LED device.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch first appeared in v4.
---
 drivers/video/backlight/led_bl.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/video/backlight/led_bl.c b/drivers/video/backlight/led_bl.c
index c7aefcd6e4e3..bfbd80728036 100644
--- a/drivers/video/backlight/led_bl.c
+++ b/drivers/video/backlight/led_bl.c
@@ -209,6 +209,19 @@ static int led_bl_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->bl_dev);
 	}
 
+	for (i = 0; i < priv->nb_leds; i++) {
+		struct device_link *link;
+
+		link = device_link_add(&pdev->dev, priv->leds[0]->dev->parent,
+				       DL_FLAG_AUTOREMOVE_CONSUMER);
+		if (!link) {
+			dev_err(&pdev->dev, "Failed to add devlink (consumer %s, supplier %s)\n",
+				dev_name(&pdev->dev), dev_name(priv->leds[0]->dev->parent));
+			backlight_device_unregister(priv->bl_dev);
+			return -EINVAL;
+		}
+	}
+
 	for (i = 0; i < priv->nb_leds; i++) {
 		mutex_lock(&priv->leds[i]->led_access);
 		led_sysfs_disable(priv->leds[i]);

-- 
2.34.1


