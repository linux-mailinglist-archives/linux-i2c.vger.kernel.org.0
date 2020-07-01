Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2DF2C2105E5
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jul 2020 10:09:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbgGAIJQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jul 2020 04:09:16 -0400
Received: from www.zeus03.de ([194.117.254.33]:53736 "EHLO mail.zeus03.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728143AbgGAIJQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 1 Jul 2020 04:09:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
        from:to:cc:subject:date:message-id:mime-version
        :content-transfer-encoding; s=k1; bh=k3oPt7ebljTZbRnqyjxUhHI+Sk+
        dNamur9PwsU8fdT8=; b=n+lnr9cuo7lJu6O+iO05S5cCC1x2rPrDrpxa8j150zO
        vdrQEzkfngi9VDP7ycyB2jEbLI7dtjnNzBTA2J1YQegT0x/0NKI5B4HdBVzNC/I3
        ocT0blKYKcsAlgnPi71KKBBGijemaYYOntDNeQHSq1aRQwUQcZrySGGuLeUUGsLM
        =
Received: (qmail 460432 invoked from network); 1 Jul 2020 10:09:14 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 Jul 2020 10:09:14 +0200
X-UD-Smtp-Session: l3s3148p1@MBXFzlypbtkgAwDPXwRGALjtBlSZf+V/
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-i2c@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Alain Volmat <alain.volmat@st.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH] WIP: i2c: rcar: add HostNotify support
Date:   Wed,  1 Jul 2020 10:09:04 +0200
Message-Id: <20200701080904.11022-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The I2C core can now utilize a slave interface to handle SMBus
HostNotify events. Enable it in this driver.

Not-yet-Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Alain, this is the code needed to enable SMBus HostNotify for the
Renesas R-Car driver already using the binding we discussed yesterday.
I got it to work finally, so we have now two working cases. Good!

I do have some more review comments. I will send them out hopefully
later, but for sure somewhen today.

Thanks for working on it!

 drivers/i2c/busses/i2c-rcar.c | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 19e89ab73b6f..9bc23d72ccae 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -20,6 +20,7 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/i2c.h>
+#include <linux/i2c-smbus.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
@@ -105,10 +106,11 @@
 #define ID_ARBLOST	(1 << 3)
 #define ID_NACK		(1 << 4)
 /* persistent flags */
+#define ID_P_HOST_NOTIFY	BIT(28)
 #define ID_P_REP_AFTER_RD	BIT(29)
 #define ID_P_NO_RXDMA		BIT(30) /* HW forbids RXDMA sometimes */
 #define ID_P_PM_BLOCKED		BIT(31)
-#define ID_P_MASK		GENMASK(31, 29)
+#define ID_P_MASK		GENMASK(31, 28)
 
 enum rcar_i2c_type {
 	I2C_RCAR_GEN1,
@@ -140,6 +142,8 @@ struct rcar_i2c_priv {
 
 	struct reset_control *rstc;
 	int irq;
+
+	struct i2c_client *host_client;
 };
 
 #define rcar_i2c_priv_to_dev(p)		((p)->adap.dev.parent)
@@ -881,14 +885,21 @@ static int rcar_unreg_slave(struct i2c_client *slave)
 
 static u32 rcar_i2c_func(struct i2c_adapter *adap)
 {
+	struct rcar_i2c_priv *priv = i2c_get_adapdata(adap);
+
 	/*
 	 * This HW can't do:
 	 * I2C_SMBUS_QUICK (setting FSB during START didn't work)
 	 * I2C_M_NOSTART (automatically sends address after START)
 	 * I2C_M_IGNORE_NAK (automatically sends STOP after NAK)
 	 */
-	return I2C_FUNC_I2C | I2C_FUNC_SLAVE |
-		(I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
+	u32 func = I2C_FUNC_I2C | I2C_FUNC_SLAVE |
+		   (I2C_FUNC_SMBUS_EMUL & ~I2C_FUNC_SMBUS_QUICK);
+
+	if (priv->flags & ID_P_HOST_NOTIFY)
+		func |= I2C_FUNC_SMBUS_HOST_NOTIFY;
+
+	return func;
 }
 
 static const struct i2c_algorithm rcar_i2c_algo = {
@@ -986,6 +997,8 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	else
 		pm_runtime_put(dev);
 
+	if (of_property_read_bool(dev->of_node, "enable-host-notify"))
+		priv->flags |= ID_P_HOST_NOTIFY;
 
 	priv->irq = platform_get_irq(pdev, 0);
 	ret = devm_request_irq(dev, priv->irq, rcar_i2c_irq, 0, dev_name(dev), priv);
@@ -1000,10 +1013,20 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto out_pm_disable;
 
+	if (priv->flags & ID_P_HOST_NOTIFY) {
+		priv->host_client = i2c_new_smbus_host_notify_device(adap);
+		if (IS_ERR(priv->host_client)) {
+			ret = PTR_ERR(priv->host_client);
+			goto out_del_device;
+		}
+	}
+
 	dev_info(dev, "probed\n");
 
 	return 0;
 
+ out_del_device:
+	i2c_del_adapter(&priv->adap);
  out_pm_put:
 	pm_runtime_put(dev);
  out_pm_disable:
@@ -1017,6 +1040,8 @@ static int rcar_i2c_remove(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 
 	i2c_del_adapter(&priv->adap);
+	if (priv->host_client)
+		i2c_free_smbus_host_notify_device(priv->host_client);
 	rcar_i2c_release_dma(priv);
 	if (priv->flags & ID_P_PM_BLOCKED)
 		pm_runtime_put(dev);
-- 
2.20.1

