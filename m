Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A84427A67DB
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Sep 2023 17:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233001AbjISPUC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 Sep 2023 11:20:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233073AbjISPUA (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 19 Sep 2023 11:20:00 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D77F122
        for <linux-i2c@vger.kernel.org>; Tue, 19 Sep 2023 08:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=from:to:cc:subject:date:message-id
        :in-reply-to:references:mime-version:content-transfer-encoding;
         s=k1; bh=Q/EHrMYmoFV/pUd9fc6v47dB5B/JJmQSMKEBTtNyNPA=; b=Vhp5iF
        7ORYLBDSS8FIovR+RuVTZxUDgqNwSmtjZF7N54y3iOc/8V1Uwh9vQ1SO6ReG7i+o
        UzVoF2BEtm4SK+dpxU3m0H2ral40ZfHGYNVC4XDUU1ekslzCq5nubTDJwox+9IDT
        eB08xkyn1kjtzGgaWVvVjrMhbs72r7JMewZTfcsYXJYZKCbLcqRJFrJ/ihVB5fM5
        8E+nQQe2cZVGZ8HlLRf4aiPwn0o+9iFsvW+DgM1pFSkxoH0mqWhwyMl70LId16F7
        ohPQcERagCzsPZE5mVBMu0unTe/0qZeaX9cF4N9mnTNgMxOEO5ii3vJsH4PV+ply
        cDDQYFX2mllKzziQ==
Received: (qmail 255804 invoked from network); 19 Sep 2023 17:19:51 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Sep 2023 17:19:51 +0200
X-UD-Smtp-Session: l3s3148p1@9BNFyrcFxTsucrQg
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] i2c: rcar: reset controller is mandatory for Gen3+
Date:   Tue, 19 Sep 2023 17:19:46 +0200
Message-Id: <20230919151948.21564-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230919151948.21564-1-wsa+renesas@sang-engineering.com>
References: <20230919151948.21564-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
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

Change since v1:
* bail out when resetting fails (Thanks, Geert!)

 drivers/i2c/busses/i2c-rcar.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 5e97635faf78..bb4fc66309c2 100644
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
+			return ret;
 	}
 
 	rcar_i2c_init(priv);
@@ -1096,11 +1094,13 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 
 	if (priv->devtype == I2C_RCAR_GEN3) {
 		priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
-		if (!IS_ERR(priv->rstc)) {
-			ret = reset_control_status(priv->rstc);
-			if (ret < 0)
-				priv->rstc = ERR_PTR(-ENOTSUPP);
-		}
+		if (IS_ERR(priv->rstc))
+			return dev_err_probe(&pdev->dev, PTR_ERR(priv->rstc),
+					     "couldn't get reset");
+
+		ret = reset_control_status(priv->rstc);
+		if (ret < 0)
+			return ret;
 	}
 
 	/* Stay always active when multi-master to keep arbitration working */
-- 
2.35.1

