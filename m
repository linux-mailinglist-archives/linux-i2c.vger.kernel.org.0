Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92B2779193F
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Sep 2023 15:59:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244482AbjIDN7L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Sep 2023 09:59:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343888AbjIDN7H (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Sep 2023 09:59:07 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0851DCDE
        for <linux-i2c@vger.kernel.org>; Mon,  4 Sep 2023 06:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=from:to:cc:subject:date:message-id
        :in-reply-to:references:mime-version:content-transfer-encoding;
         s=k1; bh=H9mtQgb6+eJ82kL1Qtz4yJWRCOermGgtp3zzEoqmkO8=; b=RFKsh/
        +4CdIO6BnOw0KATdD/RH6785OE1n/G0DhWC+PMut3pBCP7yG8sPKQYNG0uzKi+vA
        3NoWGZyp2lv4Nxx2kzMXpZ6V26/WaNcExHxo3IR1p5XxGAjomq2YI3t+uf/eSknJ
        Kxwp2WQlH1ZHwZFylWCtbA5VYWIydfjNqbonlz5nVgVznDEcNenpsRXhIpYxlh/s
        X1SLIBvLtvLpqp3NmS9+kd2x30Paqd5aC2EJ1H8XfRGEuKOXn3iDZN9YzSSozZ4N
        OB1CQymAhoCr3n/sXzPc2uHjXkYj4JSfluRJ6LskRQDIIO2F+r8CNGxCJkNY9ywL
        uJVfoNnB7+sGVc9A==
Received: (qmail 2131819 invoked from network); 4 Sep 2023 15:59:00 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Sep 2023 15:59:00 +0200
X-UD-Smtp-Session: l3s3148p1@7xqF6YgEDtYgAwDPXx78AHsOvgc204Bb
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] i2c: rcar: introduce Gen4 devices
Date:   Mon,  4 Sep 2023 15:58:50 +0200
Message-Id: <20230904135852.12146-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230904135852.12146-1-wsa+renesas@sang-engineering.com>
References: <20230904135852.12146-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

So far, we treated Gen4 as Gen3. But we are soon adding FM+ as a Gen4
specific feature, so prepare the code for the new devtype.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 23 ++++++++---------------
 1 file changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index f2b953df0c4d..76aa16bf17b2 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -114,6 +114,7 @@ enum rcar_i2c_type {
 	I2C_RCAR_GEN1,
 	I2C_RCAR_GEN2,
 	I2C_RCAR_GEN3,
+	I2C_RCAR_GEN4,
 };
 
 struct rcar_i2c_priv {
@@ -218,7 +219,7 @@ static void rcar_i2c_init(struct rcar_i2c_priv *priv)
 	/* start clock */
 	rcar_i2c_write(priv, ICCCR, priv->icccr);
 
-	if (priv->devtype == I2C_RCAR_GEN3)
+	if (priv->devtype >= I2C_RCAR_GEN3)
 		rcar_i2c_write(priv, ICFBSCR, TCYC17);
 
 }
@@ -251,22 +252,11 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
 		.scl_int_delay_ns	= 50,
 	};
 
+	cdf_width = (priv->devtype == I2C_RCAR_GEN1) ? 2 : 3;
+
 	/* Fall back to previously used values if not supplied */
 	i2c_parse_fw_timings(dev, &t, false);
 
-	switch (priv->devtype) {
-	case I2C_RCAR_GEN1:
-		cdf_width = 2;
-		break;
-	case I2C_RCAR_GEN2:
-	case I2C_RCAR_GEN3:
-		cdf_width = 3;
-		break;
-	default:
-		dev_err(dev, "device type error\n");
-		return -EIO;
-	}
-
 	/*
 	 * calculate SCL clock
 	 * see
@@ -1031,10 +1021,12 @@ static const struct of_device_id rcar_i2c_dt_ids[] = {
 	{ .compatible = "renesas,i2c-r8a7794", .data = (void *)I2C_RCAR_GEN2 },
 	{ .compatible = "renesas,i2c-r8a7795", .data = (void *)I2C_RCAR_GEN3 },
 	{ .compatible = "renesas,i2c-r8a7796", .data = (void *)I2C_RCAR_GEN3 },
+	/* S4 has no FM+ bit */
+	{ .compatible = "renesas,i2c-r8a779f0", .data = (void *)I2C_RCAR_GEN3 },
 	{ .compatible = "renesas,rcar-gen1-i2c", .data = (void *)I2C_RCAR_GEN1 },
 	{ .compatible = "renesas,rcar-gen2-i2c", .data = (void *)I2C_RCAR_GEN2 },
 	{ .compatible = "renesas,rcar-gen3-i2c", .data = (void *)I2C_RCAR_GEN3 },
-	{ .compatible = "renesas,rcar-gen4-i2c", .data = (void *)I2C_RCAR_GEN3 },
+	{ .compatible = "renesas,rcar-gen4-i2c", .data = (void *)I2C_RCAR_GEN4 },
 	{},
 };
 MODULE_DEVICE_TABLE(of, rcar_i2c_dt_ids);
@@ -1101,6 +1093,7 @@ static int rcar_i2c_probe(struct platform_device *pdev)
 		irqhandler = rcar_i2c_gen2_irq;
 	}
 
+	/* Gen3 needs reset for RXDMA */
 	if (priv->devtype == I2C_RCAR_GEN3) {
 		priv->rstc = devm_reset_control_get_exclusive(&pdev->dev, NULL);
 		if (!IS_ERR(priv->rstc)) {
-- 
2.35.1

