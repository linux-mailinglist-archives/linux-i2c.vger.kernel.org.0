Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F58F79E004
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Sep 2023 08:30:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238362AbjIMGaD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Sep 2023 02:30:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238348AbjIMGaD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Sep 2023 02:30:03 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E951D173A
        for <linux-i2c@vger.kernel.org>; Tue, 12 Sep 2023 23:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=from:to:cc:subject:date:message-id
        :in-reply-to:references:mime-version:content-transfer-encoding;
         s=k1; bh=YXJOhBKin2MR8tV4lFJR3XpMrEsZzUkf4neCg226l1I=; b=ACLq9W
        YeE62kLkVpcDzBtalbM3TiPekub5kK8UEhvcH8pO7DAIM1gsGj4KctjQ+LRqi89u
        BqoJ7Yav4nOmYWK5PAxjAHQlj2+/iw6wbnDKAMNoc/mpuqE1LQeaMYVAr0SLGpXP
        DY8JLRMTQ5afK+lOEH4mkZTL96vXN6mVwRIHdnuEjCOj2tCIaM4r8Klgw2/bLpI1
        +ZOKB6zqPrYpKcOT9tm1AWkPVKfdw31Yy3bX60PpSXrNeIMh9dEmdo4TYdf6TLTX
        AOSZq2jNNvTxauXCpwpg5WVNUTv7/DHxa5msNNEAn3ngRcm5Q22ZeXmocaXBIkwy
        3+J+4dzcTEDOFW3A==
Received: (qmail 489585 invoked from network); 13 Sep 2023 08:29:57 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Sep 2023 08:29:57 +0200
X-UD-Smtp-Session: l3s3148p1@ohMosDcFlqMujnuS
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH RFT 2/2] i2c: rcar: improve accuracy for R-Car Gen3+
Date:   Wed, 13 Sep 2023 08:29:49 +0200
Message-Id: <20230913062950.4968-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230913062950.4968-1-wsa+renesas@sang-engineering.com>
References: <20230913062950.4968-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

With some new registers, SCL can be calculated to be closer to the
desired rate. Apply the new formula for R-Car Gen3 device types.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

The base for this patch was a BSP patch adding FM+ support. However,
this clock calculation is significantly different:

* it calculates the divider instead of trying values until it fits
* as there was no information about reasonable SMD calculation, it uses
  a fixed value suggested from recommended settings in the docs
* the SCL low/high ratio is 5:4 instead of 1:1. Otherwise the specs for
  Fastmode are slightly not met
* it doesn't use soc_device_match

 drivers/i2c/busses/i2c-rcar.c | 126 +++++++++++++++++++++++-----------
 1 file changed, 87 insertions(+), 39 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 342c3747f415..bc5c7a0050eb 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -41,6 +41,10 @@
 #define ICSAR	0x1C	/* slave address */
 #define ICMAR	0x20	/* master address */
 #define ICRXTX	0x24	/* data port */
+#define ICCCR2	0x28	/* Clock control 2 */
+#define ICMPR	0x2C	/* SCL mask control */
+#define ICHPR	0x30	/* SCL HIGH control */
+#define ICLPR	0x34	/* SCL LOW control */
 #define ICFBSCR	0x38	/* first bit setup cycle (Gen3) */
 #define ICDMAER	0x3c	/* DMA enable (Gen3) */
 
@@ -84,11 +88,25 @@
 #define RMDMAE	BIT(1)	/* DMA Master Received Enable */
 #define TMDMAE	BIT(0)	/* DMA Master Transmitted Enable */
 
+/* ICCCR2 */
+#define CDFD	BIT(2)	/* CDF Disable */
+#define HLSE	BIT(1)	/* HIGH/LOW Separate Control Enable */
+#define SME	BIT(0)	/* SCL Mask Enable */
+
 /* ICFBSCR */
 #define TCYC17	0x0f		/* 17*Tcyc delay 1st bit between SDA and SCL */
 
 #define RCAR_MIN_DMA_LEN	8
 
+/* SCL low/high ratio 5:4 to meet all I2C timing specs (incl safety margin) */
+#define RCAR_SCLD_RATIO		5
+#define RCAR_SCHD_RATIO		4
+/*
+ * SMD should be smaller than SCLD/SCHD and is always around 20 in the docs.
+ * Thus, we simply use 20 which works for low and high speeds.
+*/
+#define RCAR_DEFAULT_SMD	20
+
 #define RCAR_BUS_PHASE_START	(MDBS | MIE | ESG)
 #define RCAR_BUS_PHASE_DATA	(MDBS | MIE)
 #define RCAR_BUS_PHASE_STOP	(MDBS | MIE | FSB)
@@ -128,6 +146,7 @@ struct rcar_i2c_priv {
 
 	int pos;
 	u32 icccr;
+	u32 scl_gran;
 	u8 recovery_icmcr;	/* protected by adapter lock */
 	enum rcar_i2c_type devtype;
 	struct i2c_client *slave;
@@ -216,11 +235,16 @@ static void rcar_i2c_init(struct rcar_i2c_priv *priv)
 	rcar_i2c_write(priv, ICMCR, MDBS);
 	rcar_i2c_write(priv, ICMSR, 0);
 	/* start clock */
-	rcar_i2c_write(priv, ICCCR, priv->icccr);
-
-	if (priv->devtype == I2C_RCAR_GEN3)
+	if (priv->devtype < I2C_RCAR_GEN3) {
+		rcar_i2c_write(priv, ICCCR, priv->icccr);
+	} else {
+		rcar_i2c_write(priv, ICCCR2, CDFD | HLSE | SME);
+		rcar_i2c_write(priv, ICCCR, priv->icccr);
+		rcar_i2c_write(priv, ICMPR, RCAR_DEFAULT_SMD);
+		rcar_i2c_write(priv, ICHPR, RCAR_SCHD_RATIO * priv->scl_gran);
+		rcar_i2c_write(priv, ICLPR, RCAR_SCLD_RATIO * priv->scl_gran);
 		rcar_i2c_write(priv, ICFBSCR, TCYC17);
-
+	}
 }
 
 static int rcar_i2c_bus_barrier(struct rcar_i2c_priv *priv)
@@ -241,7 +265,7 @@ static int rcar_i2c_bus_barrier(struct rcar_i2c_priv *priv)
 
 static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
 {
-	u32 scgd, cdf, round, ick, sum, scl, cdf_width;
+	u32 cdf, round, ick, sum, scl, cdf_width;
 	unsigned long rate;
 	struct device *dev = rcar_i2c_priv_to_dev(priv);
 	struct i2c_timings t = {
@@ -254,27 +278,17 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
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
-	 *	ICCCR
+	 *	ICCCR (and ICCCR2 for Gen3+)
 	 *
 	 * ick	= clkp / (1 + CDF)
 	 * SCL	= ick / (20 + SCGD * 8 + F[(ticf + tr + intd) * ick])
 	 *
+	 * for Gen3+:
+	 * SCL	= clkp / (8 + SMD * 2 + SCLD + SCHD +F[(ticf + tr + intd) * clkp])
+	 *
 	 * ick  : I2C internal clock < 20 MHz
 	 * ticf : I2C SCL falling time
 	 * tr   : I2C SCL rising  time
@@ -284,11 +298,12 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
 	 */
 	rate = clk_get_rate(priv->clk);
 	cdf = rate / 20000000;
-	if (cdf >= 1U << cdf_width) {
-		dev_err(dev, "Input clock %lu too high\n", rate);
-		return -EIO;
-	}
-	ick = rate / (cdf + 1);
+	cdf_width = (priv->devtype == I2C_RCAR_GEN1) ? 2 : 3;
+	if (cdf >= 1U << cdf_width)
+		goto err_no_val;
+
+	/* On Gen3+, we use cdf only for the filters, not as a SCL divider */
+	ick = rate / (priv->devtype < I2C_RCAR_GEN3 ? (cdf + 1) : 1);
 
 	/*
 	 * It is impossible to calculate a large scale number on u32. Separate it.
@@ -301,24 +316,57 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
 	round = DIV_ROUND_CLOSEST(ick, 1000000);
 	round = DIV_ROUND_CLOSEST(round * sum, 1000);
 
-	/*
-	 * SCL	= ick / (20 + 8 * SCGD + F[(ticf + tr + intd) * ick])
-	 * 20 + 8 * SCGD + F[...] = ick / SCL
-	 * SCGD = ((ick / SCL) - 20 - F[...]) / 8
-	 * Result (= SCL) should be less than bus_speed for hardware safety
-	 */
-	scgd = DIV_ROUND_UP(ick, t.bus_freq_hz ?: 1);
-	scgd = DIV_ROUND_UP(scgd - 20 - round, 8);
-	scl = ick / (20 + 8 * scgd + round);
+	if (priv->devtype < I2C_RCAR_GEN3) {
+		u32 scgd;
+		/*
+		 * SCL	= ick / (20 + 8 * SCGD + F[(ticf + tr + intd) * ick])
+		 * 20 + 8 * SCGD + F[...] = ick / SCL
+		 * SCGD = ((ick / SCL) - 20 - F[...]) / 8
+		 * Result (= SCL) should be less than bus_speed for hardware safety
+		 */
+		scgd = DIV_ROUND_UP(ick, t.bus_freq_hz ?: 1);
+		scgd = DIV_ROUND_UP(scgd - 20 - round, 8);
+		scl = ick / (20 + 8 * scgd + round);
 
-	if (scgd > 0x3f)
-		goto err_no_val;
+		if (scgd > 0x3f)
+			goto err_no_val;
 
-	dev_dbg(dev, "clk %u/%u(%lu), round %u, CDF: %u, SCGD: %u\n",
-		scl, t.bus_freq_hz, rate, round, cdf, scgd);
+		dev_dbg(dev, "clk %u/%u(%lu), round %u, CDF: %u, SCGD: %u\n",
+			scl, t.bus_freq_hz, rate, round, cdf, scgd);
 
-	/* keep icccr value */
-	priv->icccr = scgd << cdf_width | cdf;
+		priv->icccr = scgd << cdf_width | cdf;
+	} else {
+		u32 x, sum_ratio = RCAR_SCHD_RATIO + RCAR_SCLD_RATIO;
+		/*
+		 * SCLD/SCHD ratio and SMD default value are explained above
+		 * where they are defined. With these definitions, we can compute
+		 * x as a base value for the SCLD/SCHD ratio:
+		 *
+		 * SCL = clkp / (8 + 2 * SMD + SCLD + SCHD + F[(ticf + tr + intd) * clkp])
+		 * SCL = clkp / (8 + 2 * RCAR_DEFAULT_SMD + RCAR_SCLD_RATIO * x
+		 * 		 + RCAR_SCHD_RATIO * x + F[...])
+		 *
+		 * with: sum_ratio = RCAR_SCLD_RATIO + RCAR_SCHD_RATIO
+		 * and:  smd = 2 * RCAR_DEFAULT_SMD
+		 *
+		 * SCL = clkp / (8 + smd + sum_ratio * x + F[...])
+		 * 8 + smd + sum_ratio * x + F[...] = SCL / clkp
+		 * x = ((SCL / clkp) - 8 - smd - F[...]) / sum_ratio
+		 */
+		x = DIV_ROUND_UP(rate, t.bus_freq_hz ?: 1);
+		x = DIV_ROUND_UP(x - 8 - 2 * RCAR_DEFAULT_SMD - round, sum_ratio);
+		scl = rate / (8 + 2 * RCAR_DEFAULT_SMD + sum_ratio * x + round);
+
+		/* Bail out if values don't fit into 16 bit or SMD became too large */
+		if (x * RCAR_SCLD_RATIO > 0xffff || RCAR_DEFAULT_SMD > x * RCAR_SCHD_RATIO)
+			goto err_no_val;
+
+		dev_dbg(dev, "clk %u/%u(%lu), round %u, CDF: %u SCL gran %u\n",
+			scl, t.bus_freq_hz, rate, round, cdf, x);
+
+		priv->icccr = cdf;
+		priv->scl_gran = x;
+	}
 
 	return 0;
 
-- 
2.35.1

