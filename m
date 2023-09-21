Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10CDA7AA3D2
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Sep 2023 23:59:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232819AbjIUV7g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 Sep 2023 17:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232265AbjIUV7V (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 21 Sep 2023 17:59:21 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4D95D1141
        for <linux-i2c@vger.kernel.org>; Thu, 21 Sep 2023 11:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=from:to:cc:subject:date:message-id
        :in-reply-to:references:mime-version:content-transfer-encoding;
         s=k1; bh=duvSsemho/pM55xnB5X1Ej/3oASY0Q2Y+C3dK2hywaA=; b=SrPSPQ
        l1cRatCL2HvkwZMygj6a8UvmyACNVI/eyrO//VbTKYx5K3V4+YYRNjBgbAh3ABa+
        +6GHak1TwECn/5USD0/DnDjazzR5SF5Ntvhss3zxo/Y0IVrMRdWqaNjTj3gjxBCo
        SreKJfgy9YzBwAHTdtS5Hnc7BqeXB6lvbOwZx0UacHnKVn3ympGniVn2mDEtFxra
        +V/Taf/7lPC3nTMe1SaKXn2TlVmknfa66pLIRpMb9q1Flwz8Ii4vOZQXfotHXZeg
        X9XTddR6uTEfm7xMSmGt6bBC6rQhLLYYBM1I+uSG11Xjj/du5kviqyqDOwoRLGId
        l9ikDOGqs1hJXDEw==
Received: (qmail 953756 invoked from network); 21 Sep 2023 14:54:04 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Sep 2023 14:54:04 +0200
X-UD-Smtp-Session: l3s3148p1@KouQ/N0FcHkuciJ+
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] i2c: rcar: reset controller is mandatory for Gen3+
Date:   Thu, 21 Sep 2023 14:53:49 +0200
Message-Id: <20230921125351.3954-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230921125351.3954-1-wsa+renesas@sang-engineering.com>
References: <20230921125351.3954-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Initially, we only needed a reset controller to make sure RXDMA works at
least once per transfer. Meanwhile, documentation has been updated. It
now says that a reset has to be performed prior every transaction, even
if it is non-DMA. So, make the reset controller a requirement instead of
being optional. And bail out if resetting fails.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Change since v2:
* properly bail out on errors using goto
  To make that easier, the reset controller is now probed after the
  handling of pm_runtime_put() is determined

 drivers/i2c/busses/i2c-rcar.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 5e97635faf78..6800059514bc 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -838,12 +838,10 @@ static int rcar_i2c_master_xfer(struct i2c_adapter *adap,
 
 	/* Gen3 needs a reset before allowing RXDMA once */
 	if (priv->devtype == I2C_RCAR_GEN3) {
-		priv->flags |= ID_P_NO_RXDMA;
-		if (!IS_ERR(priv->rstc)) {
-			ret = rcar_i2c_do_reset(priv);
-			if (ret == 0)
-				priv->flags &= ~ID_P_NO_RXDMA;
-		}
+		priv->flags &= ~ID_P_NO_RXDMA;
+		ret = rcar_i2c_do_reset(priv);
+		if (ret)
+			goto out;
 	}
 
 	rcar_i2c_init(priv);
@@ -1094,15 +1092,6 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 		irqhandler = rcar_i2c_gen2_irq;
 	}
 
-	if (priv->devtype == I2C_RCAR_GEN3) {
-		priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
-		if (!IS_ERR(priv->rstc)) {
-			ret = reset_control_status(priv->rstc);
-			if (ret < 0)
-				priv->rstc = ERR_PTR(-ENOTSUPP);
-		}
-	}
-
 	/* Stay always active when multi-master to keep arbitration working */
 	if (of_property_read_bool(dev->of_node, "multi-master"))
 		priv->flags |= ID_P_PM_BLOCKED;
@@ -1112,6 +1101,16 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 	if (of_property_read_bool(dev->of_node, "smbus"))
 		priv->flags |= ID_P_HOST_NOTIFY;
 
+	if (priv->devtype == I2C_RCAR_GEN3) {
+		priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
+		if (IS_ERR(priv->rstc))
+			goto out_pm_put;
+
+		ret = reset_control_status(priv->rstc);
+		if (ret < 0)
+			goto out_pm_put;
+	}
+
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
 		goto out_pm_put;
-- 
2.35.1

