Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A13353D404F
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Jul 2021 20:31:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229783AbhGWRuw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Jul 2021 13:50:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbhGWRuw (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Jul 2021 13:50:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 578D3C061757;
        Fri, 23 Jul 2021 11:31:25 -0700 (PDT)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1112C885;
        Fri, 23 Jul 2021 20:31:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1627065083;
        bh=BCXbIhKbQJ8xSp61vl4cP6rSh6AwiPTMQd3Sop78zM0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kHbiCADaLhSkU+QcqAmmBP4cRTN0lMYQW8qW05s/BINotmE90YaLOPYH0Mi1dYX+V
         vNUpvUEJyclS5m42UPja7S66Z1FdgthVbbNa1Al+CV3rsldTQmdbjtcx0UBxgL+qiD
         FjpS24ZA253tWUJJtcMHxuoyXTrjN4rnEYWCu9Ys=
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     linux-iio@vger.kernel.org
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sean Nyekjaer <sean@geanix.com>, devicetree@vger.kernel.org,
        Jose Cazarin <joseespiriki@gmail.com>,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
Subject: [PATCH 2/2] iio: dac: dac5571: Fix chip id detection for OF devices
Date:   Fri, 23 Jul 2021 21:31:14 +0300
Message-Id: <20210723183114.26017-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210723183114.26017-1-laurent.pinchart@ideasonboard.com>
References: <20210723183114.26017-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jose Cazarin <joseespiriki@gmail.com>

When matching an OF device, the match mechanism tries all components of
the compatible property. This can result with a device matched with a
compatible string that isn't the first in the compatible list. For
instance, with a compatible property set to

    compatible = "ti,dac081c081", "ti,dac5571";

the driver will match the second compatible string, as the first one
isn't listed in the of_device_id table. The device will however be named
"dac081c081" by the I2C core.

This causes an issue when identifying the chip. The probe function
receives a i2c_device_id that comes from the module's I2C device ID
table. There is no entry in that table for "dac081c081", which results
in a NULL pointer passed to the probe function.

To fix this, add chip_id information in the data field of the OF device
ID table, and retrieve it with of_device_get_match_data() for OF
devices.

Signed-off-by: Jose Cazarin <joseespiriki@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/iio/dac/ti-dac5571.c | 27 +++++++++++++++++----------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/iio/dac/ti-dac5571.c b/drivers/iio/dac/ti-dac5571.c
index 2a5ba1b08a1d..bd005b3a976b 100644
--- a/drivers/iio/dac/ti-dac5571.c
+++ b/drivers/iio/dac/ti-dac5571.c
@@ -311,6 +311,7 @@ static int dac5571_probe(struct i2c_client *client,
 	const struct dac5571_spec *spec;
 	struct dac5571_data *data;
 	struct iio_dev *indio_dev;
+	enum chip_id chip_id;
 	int ret, i;
 
 	indio_dev = devm_iio_device_alloc(dev, sizeof(*data));
@@ -326,7 +327,13 @@ static int dac5571_probe(struct i2c_client *client,
 	indio_dev->modes = INDIO_DIRECT_MODE;
 	indio_dev->channels = dac5571_channels;
 
-	spec = &dac5571_spec[id->driver_data];
+	if (dev->of_node)
+		chip_id = (uintptr_t)of_device_get_match_data(dev);
+	else
+		chip_id = id->driver_data;
+
+	spec = &dac5571_spec[chip_id];
+
 	indio_dev->num_channels = spec->num_channels;
 	data->spec = spec;
 
@@ -384,15 +391,15 @@ static int dac5571_remove(struct i2c_client *i2c)
 }
 
 static const struct of_device_id dac5571_of_id[] = {
-	{.compatible = "ti,dac5571"},
-	{.compatible = "ti,dac6571"},
-	{.compatible = "ti,dac7571"},
-	{.compatible = "ti,dac5574"},
-	{.compatible = "ti,dac6574"},
-	{.compatible = "ti,dac7574"},
-	{.compatible = "ti,dac5573"},
-	{.compatible = "ti,dac6573"},
-	{.compatible = "ti,dac7573"},
+	{.compatible = "ti,dac5571", .data = (void *)single_8bit},
+	{.compatible = "ti,dac6571", .data = (void *)single_10bit},
+	{.compatible = "ti,dac7571", .data = (void *)single_12bit},
+	{.compatible = "ti,dac5574", .data = (void *)quad_8bit},
+	{.compatible = "ti,dac6574", .data = (void *)quad_10bit},
+	{.compatible = "ti,dac7574", .data = (void *)quad_12bit},
+	{.compatible = "ti,dac5573", .data = (void *)quad_8bit},
+	{.compatible = "ti,dac6573", .data = (void *)quad_10bit},
+	{.compatible = "ti,dac7573", .data = (void *)quad_12bit},
 	{}
 };
 MODULE_DEVICE_TABLE(of, dac5571_of_id);
-- 
Regards,

Laurent Pinchart

