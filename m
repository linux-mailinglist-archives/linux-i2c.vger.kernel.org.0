Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85B9F7332D9
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jun 2023 16:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345489AbjFPOBK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Jun 2023 10:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345492AbjFPOAd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Jun 2023 10:00:33 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BF7935A7;
        Fri, 16 Jun 2023 07:00:29 -0700 (PDT)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id DBB9DD51;
        Fri, 16 Jun 2023 15:59:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686923995;
        bh=XiVizTb0No6StkMtc0kGR0VnW/U20T7mUSmQ2HYOVRo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=clM1AQAk2PShriGlbT7FGLzCdjHxZdspc9QqMm/GQM9miFju/8veTuUS9Y4bm1X+M
         UWc6cjBg0JvilA43K/VP1pThtL4vmqlZ8aA2OGWyXRa2Iss1zy2xFnLV6Ca3Sqe7N8
         36zlxM0Anw5CEgBGREEwh3m49vG9jZDDn58YJd6Q=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v14 11/18] media: i2c: ds90ub9xx: Select GPIOLIB rather than OF_GPIO
Date:   Fri, 16 Jun 2023 16:59:15 +0300
Message-Id: <20230616135922.442979-12-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230616135922.442979-1-tomi.valkeinen@ideasonboard.com>
References: <20230616135922.442979-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Select GPIOLIB rather than OF_GPIO, as the drivers use gpiolib
functionality, but no of_gpio (directly).

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 8a5f09a3de6c..29fc00e30d8b 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1622,7 +1622,7 @@ config VIDEO_DS90UB913
 	depends on OF && I2C && VIDEO_DEV && COMMON_CLK
 	select I2C_ATR
 	select MEDIA_CONTROLLER
-	select OF_GPIO
+	select GPIOLIB
 	select REGMAP_I2C
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
@@ -1635,7 +1635,7 @@ config VIDEO_DS90UB953
 	depends on OF && I2C && VIDEO_DEV && COMMON_CLK
 	select I2C_ATR
 	select MEDIA_CONTROLLER
-	select OF_GPIO
+	select GPIOLIB
 	select REGMAP_I2C
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
@@ -1648,7 +1648,7 @@ config VIDEO_DS90UB960
 	depends on OF && I2C && VIDEO_DEV && COMMON_CLK
 	select I2C_ATR
 	select MEDIA_CONTROLLER
-	select OF_GPIO
+	select GPIOLIB
 	select REGMAP_I2C
 	select V4L2_FWNODE
 	select VIDEO_V4L2_SUBDEV_API
-- 
2.34.1

