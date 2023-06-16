Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BBAA7332FA
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jun 2023 16:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345416AbjFPOCE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Jun 2023 10:02:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345427AbjFPOB2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Jun 2023 10:01:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC5AA4217;
        Fri, 16 Jun 2023 07:00:58 -0700 (PDT)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 957C013C5;
        Fri, 16 Jun 2023 15:59:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686923999;
        bh=FoGdEyjowh4KoMU7bekORi82avpRc1q3afQLZLU30b4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iskhj8ZgwLQplODwjp9qmAk6HekEdJcsQbtzW8zRHuBM0387UbXUdmHHLg2NubObK
         qk3bXXIdISXY4U9mxuvrXJyidUlGWPyllyurNkM7EX3lMy/p6nqMsutVI3xZUYz747
         hdpCsu/XlkuJrWtJ2bv8OCBID6n65oUM3VsI6W/0=
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
Subject: [PATCH v14 13/18] media: i2c: ds90ub953: Use v4l2_fwnode_endpoint_parse()
Date:   Fri, 16 Jun 2023 16:59:17 +0300
Message-Id: <20230616135922.442979-14-tomi.valkeinen@ideasonboard.com>
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
 drivers/media/i2c/ds90ub953.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 1e3827a60029..5b586855c77b 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -25,6 +25,8 @@
 #include <media/i2c/ds90ub9xx.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-event.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-mediabus.h>
 #include <media/v4l2-subdev.h>
 
 #define UB953_PAD_SINK			0
@@ -1111,7 +1113,9 @@ static const struct regmap_config ub953_regmap_config = {
 static int ub953_parse_dt(struct ub953_data *priv)
 {
 	struct device *dev = &priv->client->dev;
+	struct v4l2_fwnode_endpoint vep = {};
 	struct fwnode_handle *ep_fwnode;
+	unsigned char nlanes;
 	int ret;
 
 	ep_fwnode = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev),
@@ -1119,19 +1123,22 @@ static int ub953_parse_dt(struct ub953_data *priv)
 	if (!ep_fwnode)
 		return dev_err_probe(dev, -ENOENT, "no endpoint found\n");
 
-	ret = fwnode_property_count_u32(ep_fwnode, "data-lanes");
+	vep.bus_type = V4L2_MBUS_CSI2_DPHY;
+	ret = v4l2_fwnode_endpoint_parse(ep_fwnode, &vep);
 
 	fwnode_handle_put(ep_fwnode);
 
-	if (ret < 0)
+	if (ret)
 		return dev_err_probe(dev, ret,
-				     "failed to parse property 'data-lanes'\n");
+				     "failed to parse sink endpoint data\n");
+
+	nlanes = vep.bus.mipi_csi2.num_data_lanes;
 
-	if (ret != 1 && ret != 2 && ret != 4)
+	if (nlanes != 1 && nlanes != 2 && nlanes != 4)
 		return dev_err_probe(dev, -EINVAL,
-				     "bad number of data-lanes: %d\n", ret);
+				     "bad number of data-lanes: %d\n", nlanes);
 
-	priv->num_data_lanes = ret;
+	priv->num_data_lanes = nlanes;
 
 	return 0;
 }
-- 
2.34.1

