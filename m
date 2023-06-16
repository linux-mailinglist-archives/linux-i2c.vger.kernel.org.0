Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFD3D7332EB
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jun 2023 16:01:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345596AbjFPOBX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Jun 2023 10:01:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345585AbjFPOAn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Jun 2023 10:00:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 900BE3AAD;
        Fri, 16 Jun 2023 07:00:34 -0700 (PDT)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EFC8A12AE;
        Fri, 16 Jun 2023 15:59:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686923993;
        bh=jOKJrxg/dduXr1jjTL8Zpj2VPkKOWDkg4G8B8PyOAso=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=m6lBbMRjhxdXnFfX64BD2EGAO0rWWG/aAj1/AJ/kGAi3XHCRCHRu8GtW4jWcVVJX7
         f9S+GH+Qt8dacSCpTK3+yvtHm7Jipa/NJquual4omH1u7GSu5Xdl31A+TFq6gST+KM
         iFURJLpgA8pNZZuhY9VMQAFzXJUlboFuGdjMkrpY=
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
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v14 10/18] media: i2c: ds90ub9xx: Add COMMON_CLK kconfig dependency
Date:   Fri, 16 Jun 2023 16:59:14 +0300
Message-Id: <20230616135922.442979-11-tomi.valkeinen@ideasonboard.com>
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

Fix missing COMMON_CLK dependency:

ERROR: modpost: "__clk_get_name" [drivers/media/i2c/ds90ub913.ko] undefined!
ERROR: modpost: "devm_clk_hw_register_fixed_factor" [drivers/media/i2c/ds90ub913.ko] undefined!
ERROR: modpost: "of_clk_hw_simple_get" [drivers/media/i2c/ds90ub913.ko] undefined!
ERROR: modpost: "devm_of_clk_add_hw_provider" [drivers/media/i2c/ds90ub913.ko] undefined!

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202305081255.n5KHsShj-lkp@intel.com/
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index 461df425c163..8a5f09a3de6c 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -1619,7 +1619,7 @@ menu "Video serializers and deserializers"
 
 config VIDEO_DS90UB913
 	tristate "TI DS90UB913 FPD-Link III Serializer"
-	depends on OF && I2C && VIDEO_DEV
+	depends on OF && I2C && VIDEO_DEV && COMMON_CLK
 	select I2C_ATR
 	select MEDIA_CONTROLLER
 	select OF_GPIO
@@ -1632,7 +1632,7 @@ config VIDEO_DS90UB913
 
 config VIDEO_DS90UB953
 	tristate "TI FPD-Link III/IV CSI-2 Serializers"
-	depends on OF && I2C && VIDEO_DEV
+	depends on OF && I2C && VIDEO_DEV && COMMON_CLK
 	select I2C_ATR
 	select MEDIA_CONTROLLER
 	select OF_GPIO
@@ -1645,7 +1645,7 @@ config VIDEO_DS90UB953
 
 config VIDEO_DS90UB960
 	tristate "TI FPD-Link III/IV Deserializers"
-	depends on OF && I2C && VIDEO_DEV
+	depends on OF && I2C && VIDEO_DEV && COMMON_CLK
 	select I2C_ATR
 	select MEDIA_CONTROLLER
 	select OF_GPIO
-- 
2.34.1

