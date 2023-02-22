Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1611069F56B
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Feb 2023 14:29:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232243AbjBVN3g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Feb 2023 08:29:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232043AbjBVN31 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 22 Feb 2023 08:29:27 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFB8138EB4;
        Wed, 22 Feb 2023 05:29:25 -0800 (PST)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B45DDFE8;
        Wed, 22 Feb 2023 14:29:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1677072563;
        bh=v04vyxoM/k/6/Qb5nSIQ8QOaU+d2QRVnP23BFrHf8Sk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Q+mvXlx6Gq61loioBfeFO/Jtp79yxpcTjhmY8z5YYYRyUUNXnbU4IKKunuJ3TIvpD
         o8mIo7sexTZElkaUfvGSaw84Lpb77fj2xNjLvbcWg4qpbn9o39iF8XL/KIdLbV/GZK
         p0lenSCFwNvgvU71c6wuNMEle23UHOLhUcPIXmKc=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v10 2/8] media: subdev: Split V4L2_SUBDEV_ROUTING_NO_STREAM_MIX
Date:   Wed, 22 Feb 2023 15:29:01 +0200
Message-Id: <20230222132907.594690-3-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222132907.594690-1-tomi.valkeinen@ideasonboard.com>
References: <20230222132907.594690-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

V4L2_SUBDEV_ROUTING_NO_STREAM_MIX routing validation flag means that all
routes from a sink pad must go to the same source pad and all routes
going to the same source pad must originate from the same sink pad.

This does not cover all use cases. For example, if a device routes
all streams from a single sink pad to any of the source pads, but
streams from multiple sink pads can go to the same source pad, the
current flag is too restrictive.

Split the flag into two parts, V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX
and V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX, which add the restriction
only on one side of the device. Together they mean the same as
V4L2_SUBDEV_ROUTING_NO_STREAM_MIX.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/v4l2-core/v4l2-subdev.c | 17 +++++++++++++----
 include/media/v4l2-subdev.h           | 16 +++++++++++++---
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 1bebcda2bd20..84ae656c770d 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -1678,10 +1678,11 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
 		}
 
 		/*
-		 * V4L2_SUBDEV_ROUTING_NO_STREAM_MIX: Streams on the same pad
-		 * may not be routed to streams on different pads.
+		 * V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX: Streams on the same
+		 * sink pad may not be routed to streams on different source
+		 * pads.
 		 */
-		if (disallow & V4L2_SUBDEV_ROUTING_NO_STREAM_MIX) {
+		if (disallow & V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX) {
 			if (remote_pads[route->sink_pad] != U32_MAX &&
 			    remote_pads[route->sink_pad] != route->source_pad) {
 				dev_dbg(sd->dev,
@@ -1690,6 +1691,15 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
 				goto out;
 			}
 
+			remote_pads[route->sink_pad] = route->source_pad;
+		}
+
+		/*
+		 * V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX: Streams on the same
+		 * source pad may not be routed to streams on different sink
+		 * pads.
+		 */
+		if (disallow & V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX) {
 			if (remote_pads[route->source_pad] != U32_MAX &&
 			    remote_pads[route->source_pad] != route->sink_pad) {
 				dev_dbg(sd->dev,
@@ -1698,7 +1708,6 @@ int v4l2_subdev_routing_validate(struct v4l2_subdev *sd,
 				goto out;
 			}
 
-			remote_pads[route->sink_pad] = route->source_pad;
 			remote_pads[route->source_pad] = route->sink_pad;
 		}
 
diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
index 17773be4a4ee..a4331e0a5aeb 100644
--- a/include/media/v4l2-subdev.h
+++ b/include/media/v4l2-subdev.h
@@ -1643,19 +1643,29 @@ u64 v4l2_subdev_state_xlate_streams(const struct v4l2_subdev_state *state,
  * @V4L2_SUBDEV_ROUTING_NO_N_TO_1:
  *	multiple input streams may not be routed to the same output stream
  *	(stream merging)
- * @V4L2_SUBDEV_ROUTING_NO_STREAM_MIX:
- *	streams on the same pad may not be routed to streams on different pads
+ * @V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX:
+ *	streams on the same sink pad may not be routed to streams on different
+ *	source pads
+ * @V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX:
+ *	streams on the same source pad may not be routed to streams on different
+ *	sink pads
  * @V4L2_SUBDEV_ROUTING_ONLY_1_TO_1:
  *	only non-overlapping 1-to-1 stream routing is allowed (a combination of
  *	@V4L2_SUBDEV_ROUTING_NO_1_TO_N and @V4L2_SUBDEV_ROUTING_NO_N_TO_1)
+ * @V4L2_SUBDEV_ROUTING_NO_STREAM_MIX:
+ *	streams on the same pad may not be routed to streams on different pads
  */
 enum v4l2_subdev_routing_restriction {
 	V4L2_SUBDEV_ROUTING_NO_1_TO_N = BIT(0),
 	V4L2_SUBDEV_ROUTING_NO_N_TO_1 = BIT(1),
-	V4L2_SUBDEV_ROUTING_NO_STREAM_MIX = BIT(2),
+	V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX = BIT(2),
+	V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX = BIT(3),
 	V4L2_SUBDEV_ROUTING_ONLY_1_TO_1 =
 		V4L2_SUBDEV_ROUTING_NO_1_TO_N |
 		V4L2_SUBDEV_ROUTING_NO_N_TO_1,
+	V4L2_SUBDEV_ROUTING_NO_STREAM_MIX =
+		V4L2_SUBDEV_ROUTING_NO_SINK_STREAM_MIX |
+		V4L2_SUBDEV_ROUTING_NO_SOURCE_STREAM_MIX,
 };
 
 /**
-- 
2.34.1

