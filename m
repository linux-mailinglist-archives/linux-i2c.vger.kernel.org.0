Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCB77733304
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jun 2023 16:02:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345681AbjFPOBy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Jun 2023 10:01:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345361AbjFPOBT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Jun 2023 10:01:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F67B3A9E;
        Fri, 16 Jun 2023 07:00:48 -0700 (PDT)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 70E6013D2;
        Fri, 16 Jun 2023 15:59:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686924001;
        bh=H61sLU+pMDMXwm3oliz8WTwPsmI2d35vuhKG80jM2uE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DHqU8tSfpK+qDd5oR/fqohDZAguo7YJzdvQbVbDtticn4TZsNLGTQ8bYOe/IB73IY
         YkaxU8oc9GIa5MT3unVYJ/EhyBsbpY+fJBNrx9iCycsL0RPDasbsJb47q+MxI+yODP
         MsQEwDiiJmT4ANv4QLmH7N5bQBMnnzpjmLInB5U8=
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
Subject: [PATCH v14 14/18] media: i2c: ds90ub913: Use v4l2_fwnode_endpoint_parse()
Date:   Fri, 16 Jun 2023 16:59:18 +0300
Message-Id: <20230616135922.442979-15-tomi.valkeinen@ideasonboard.com>
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

Use v4l2_fwnode_endpoint_parse() to parse the sink endpoint parameters.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub913.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
index 203f7cceae23..9f95d0c44feb 100644
--- a/drivers/media/i2c/ds90ub913.c
+++ b/drivers/media/i2c/ds90ub913.c
@@ -21,6 +21,8 @@
 #include <linux/regmap.h>
 
 #include <media/i2c/ds90ub9xx.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mediabus.h>
 #include <media/v4l2-subdev.h>
 
 #define UB913_PAD_SINK			0
@@ -83,7 +85,7 @@ struct ub913_data {
 
 	struct ds90ub9xx_platform_data *plat_data;
 
-	u32			pclk_polarity;
+	u32			pclk_polarity_rising;
 };
 
 static inline struct ub913_data *sd_to_ub913(struct v4l2_subdev *sd)
@@ -675,25 +677,31 @@ static int ub913_add_i2c_adapter(struct ub913_data *priv)
 static int ub913_parse_dt(struct ub913_data *priv)
 {
 	struct device *dev = &priv->client->dev;
+	struct v4l2_fwnode_endpoint vep = {};
 	struct fwnode_handle *ep_fwnode;
 	int ret;
 
 	ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
 						    UB913_PAD_SINK, 0, 0);
-	if (!ep_fwnode) {
-		dev_err_probe(dev, -ENOENT, "No sink endpoint\n");
-		return -ENOENT;
-	}
+	if (!ep_fwnode)
+		return dev_err_probe(dev, -ENOENT, "No sink endpoint\n");
 
-	ret = fwnode_property_read_u32(ep_fwnode, "pclk-sample",
-				       &priv->pclk_polarity);
+	vep.bus_type = V4L2_MBUS_PARALLEL;
+	ret = v4l2_fwnode_endpoint_parse(ep_fwnode, &vep);
 
 	fwnode_handle_put(ep_fwnode);
 
-	if (ret) {
-		dev_err_probe(dev, ret, "failed to parse 'pclk-sample'\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to parse sink endpoint data\n");
+
+	if (vep.bus.parallel.flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
+		priv->pclk_polarity_rising = true;
+	else if (vep.bus.parallel.flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
+		priv->pclk_polarity_rising = false;
+	else
+		return dev_err_probe(dev, -EINVAL,
+				     "bad value for 'pclk-sample'\n");
 
 	return 0;
 }
@@ -726,7 +734,7 @@ static int ub913_hw_init(struct ub913_data *priv)
 
 	ub913_read(priv, UB913_REG_GENERAL_CFG, &v);
 	v &= ~UB913_REG_GENERAL_CFG_PCLK_RISING;
-	v |= priv->pclk_polarity ? UB913_REG_GENERAL_CFG_PCLK_RISING : 0;
+	v |= priv->pclk_polarity_rising ? UB913_REG_GENERAL_CFG_PCLK_RISING : 0;
 	ub913_write(priv, UB913_REG_GENERAL_CFG, v);
 
 	return 0;
-- 
2.34.1

