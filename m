Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D5AB706DD
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Jul 2019 19:27:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731519AbfGVR0g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Jul 2019 13:26:36 -0400
Received: from sauhun.de ([88.99.104.3]:42386 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731497AbfGVR0g (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Jul 2019 13:26:36 -0400
Received: from localhost (p54B33E22.dip0.t-ipconnect.de [84.179.62.34])
        by pokefinder.org (Postfix) with ESMTPSA id C0E6F4A1496;
        Mon, 22 Jul 2019 19:26:34 +0200 (CEST)
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpu: drm: bridge: sii9234: convert to devm_i2c_new_dummy_device
Date:   Mon, 22 Jul 2019 19:26:34 +0200
Message-Id: <20190722172634.4481-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Move from i2c_new_dummy() to devm_i2c_new_dummy_device(). So, we now get
an ERRPTR which we use in error handling and we can skip removal of the
created devices.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Only build tested. Part of a tree-wide move to deprecate
i2c_new_dummy().

 drivers/gpu/drm/bridge/sii9234.c | 36 +++++++++++---------------------
 1 file changed, 12 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
index 25d4ad8c7ad6..8a6c85693a88 100644
--- a/drivers/gpu/drm/bridge/sii9234.c
+++ b/drivers/gpu/drm/bridge/sii9234.c
@@ -841,39 +841,28 @@ static int sii9234_init_resources(struct sii9234 *ctx,
 
 	ctx->client[I2C_MHL] = client;
 
-	ctx->client[I2C_TPI] = i2c_new_dummy(adapter, I2C_TPI_ADDR);
-	if (!ctx->client[I2C_TPI]) {
+	ctx->client[I2C_TPI] = devm_i2c_new_dummy_device(&client->dev, adapter,
+							 I2C_TPI_ADDR);
+	if (IS_ERR(ctx->client[I2C_TPI])) {
 		dev_err(ctx->dev, "failed to create TPI client\n");
-		return -ENODEV;
+		return PTR_ERR(ctx->client[I2C_TPI]);
 	}
 
-	ctx->client[I2C_HDMI] = i2c_new_dummy(adapter, I2C_HDMI_ADDR);
-	if (!ctx->client[I2C_HDMI]) {
+	ctx->client[I2C_HDMI] = devm_i2c_new_dummy_device(&client->dev, adapter,
+							  I2C_HDMI_ADDR);
+	if (IS_ERR(ctx->client[I2C_HDMI])) {
 		dev_err(ctx->dev, "failed to create HDMI RX client\n");
-		goto fail_tpi;
+		return PTR_ERR(ctx->client[I2C_HDMI]);
 	}
 
-	ctx->client[I2C_CBUS] = i2c_new_dummy(adapter, I2C_CBUS_ADDR);
-	if (!ctx->client[I2C_CBUS]) {
+	ctx->client[I2C_CBUS] = devm_i2c_new_dummy_device(&client->dev, adapter,
+							  I2C_CBUS_ADDR);
+	if (IS_ERR(ctx->client[I2C_CBUS])) {
 		dev_err(ctx->dev, "failed to create CBUS client\n");
-		goto fail_hdmi;
+		return PTR_ERR(ctx->client[I2C_CBUS]);
 	}
 
 	return 0;
-
-fail_hdmi:
-	i2c_unregister_device(ctx->client[I2C_HDMI]);
-fail_tpi:
-	i2c_unregister_device(ctx->client[I2C_TPI]);
-
-	return -ENODEV;
-}
-
-static void sii9234_deinit_resources(struct sii9234 *ctx)
-{
-	i2c_unregister_device(ctx->client[I2C_CBUS]);
-	i2c_unregister_device(ctx->client[I2C_HDMI]);
-	i2c_unregister_device(ctx->client[I2C_TPI]);
 }
 
 static inline struct sii9234 *bridge_to_sii9234(struct drm_bridge *bridge)
@@ -950,7 +939,6 @@ static int sii9234_remove(struct i2c_client *client)
 
 	sii9234_cable_out(ctx);
 	drm_bridge_remove(&ctx->bridge);
-	sii9234_deinit_resources(ctx);
 
 	return 0;
 }
-- 
2.20.1

