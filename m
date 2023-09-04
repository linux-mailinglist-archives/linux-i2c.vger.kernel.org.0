Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0001979193D
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Sep 2023 15:59:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244177AbjIDN7L (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Sep 2023 09:59:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345605AbjIDN7H (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Sep 2023 09:59:07 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 561CFCE0
        for <linux-i2c@vger.kernel.org>; Mon,  4 Sep 2023 06:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=from:to:cc:subject:date:message-id
        :in-reply-to:references:mime-version:content-transfer-encoding;
         s=k1; bh=fH+PBKZ7A29HHE4AexGRH2brVEprQzOFBvbe2kpdhgM=; b=E7AyXn
        ZIu6Q+metbRDAm9jz1HQsjKYT0Mob47XMPLj1ST41iTB4AukbIpHnSKAL7GBp40e
        0qiFIv7Mu4mQ4QRWK1zb/oQN4JR2EdRo0a2fGIm90Hs3JM0jwD+nZc0XKtxlk/uU
        sb4UP9tBkxLkXrvmr40t9JCB0ThEH4HyH6V+wqZ0qoeWsWNTjJcZnsmNeZ6TVklj
        Bke3SXBWH2XWCgbeXY6PxpDcZ9mGiphDFryqMjCT2b5uudUCK65HSuYEsUyjXrP2
        ksUl5ZHFVsivLjOq33IJdU07rm8AVKK66GAtNds8JYrkU4YZ9R3HUFtujj52FTgu
        HVXgZOoZ8Jb+gvQQ==
Received: (qmail 2131873 invoked from network); 4 Sep 2023 15:59:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Sep 2023 15:59:01 +0200
X-UD-Smtp-Session: l3s3148p1@p4+Y6YgEGNYgAwDPXx78AHsOvgc204Bb
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] i2c: rcar: add FastMode+ support
Date:   Mon,  4 Sep 2023 15:58:51 +0200
Message-Id: <20230904135852.12146-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230904135852.12146-1-wsa+renesas@sang-engineering.com>
References: <20230904135852.12146-1-wsa+renesas@sang-engineering.com>
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

Apply the different formula and register setting for activating FM+ on
Gen4 devtypes.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 125 ++++++++++++++++++++++++----------
 1 file changed, 89 insertions(+), 36 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 76aa16bf17b2..a48849b393a3 100644
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
 
@@ -84,6 +88,12 @@
 #define RMDMAE	BIT(1)	/* DMA Master Received Enable */
 #define TMDMAE	BIT(0)	/* DMA Master Transmitted Enable */
 
+/* ICCCR2 */
+#define FMPE	BIT(7)	/* Fast Mode Plus Enable */
+#define CDFD	BIT(2)	/* CDF Disable */
+#define HLSE	BIT(1)	/* HIGH/LOW Separate Control Enable */
+#define SME	BIT(0)	/* SCL Mask Enable */
+
 /* ICFBSCR */
 #define TCYC17	0x0f		/* 17*Tcyc delay 1st bit between SDA and SCL */
 
@@ -104,11 +114,12 @@
 #define ID_NACK			BIT(4)
 #define ID_EPROTO		BIT(5)
 /* persistent flags */
+#define ID_P_FMPLUS		BIT(27)
 #define ID_P_NOT_ATOMIC		BIT(28)
 #define ID_P_HOST_NOTIFY	BIT(29)
 #define ID_P_NO_RXDMA		BIT(30) /* HW forbids RXDMA sometimes */
 #define ID_P_PM_BLOCKED		BIT(31)
-#define ID_P_MASK		GENMASK(31, 28)
+#define ID_P_MASK		GENMASK(31, 27)
 
 enum rcar_i2c_type {
 	I2C_RCAR_GEN1,
@@ -128,7 +139,7 @@ struct rcar_i2c_priv {
 	wait_queue_head_t wait;
 
 	int pos;
-	u32 icccr;
+	u32 clock_val;
 	u8 recovery_icmcr;	/* protected by adapter lock */
 	enum rcar_i2c_type devtype;
 	struct i2c_client *slave;
@@ -217,7 +228,17 @@ static void rcar_i2c_init(struct rcar_i2c_priv *priv)
 	rcar_i2c_write(priv, ICMCR, MDBS);
 	rcar_i2c_write(priv, ICMSR, 0);
 	/* start clock */
-	rcar_i2c_write(priv, ICCCR, priv->icccr);
+	if (priv->flags & ID_P_FMPLUS) {
+		rcar_i2c_write(priv, ICCCR, 0);
+		rcar_i2c_write(priv, ICMPR, priv->clock_val);
+		rcar_i2c_write(priv, ICHPR, 3 * priv->clock_val);
+		rcar_i2c_write(priv, ICLPR, 3 * priv->clock_val);
+		rcar_i2c_write(priv, ICCCR2, FMPE | CDFD | HLSE | SME);
+	} else {
+		rcar_i2c_write(priv, ICCCR, priv->clock_val);
+		if (priv->devtype >= I2C_RCAR_GEN3)
+			rcar_i2c_write(priv, ICCCR2, 0);
+	}
 
 	if (priv->devtype >= I2C_RCAR_GEN3)
 		rcar_i2c_write(priv, ICFBSCR, TCYC17);
@@ -242,7 +263,7 @@ static int rcar_i2c_bus_barrier(struct rcar_i2c_priv *priv)
 
 static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
 {
-	u32 scgd, cdf, round, ick, sum, scl, cdf_width;
+	u32 scgd, cdf = 0, round, ick, sum, scl, cdf_width, smd;
 	unsigned long rate;
 	struct device *dev = rcar_i2c_priv_to_dev(priv);
 	struct i2c_timings t = {
@@ -252,19 +273,26 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
 		.scl_int_delay_ns	= 50,
 	};
 
-	cdf_width = (priv->devtype == I2C_RCAR_GEN1) ? 2 : 3;
-
 	/* Fall back to previously used values if not supplied */
 	i2c_parse_fw_timings(dev, &t, false);
 
+	if (t.bus_freq_hz > I2C_MAX_FAST_MODE_FREQ &&
+	    priv->devtype >= I2C_RCAR_GEN4)
+		priv->flags |= ID_P_FMPLUS;
+	else
+		priv->flags &= ~ID_P_FMPLUS;
+
 	/*
 	 * calculate SCL clock
 	 * see
-	 *	ICCCR
+	 *	ICCCR (and ICCCR2 for FastMode+)
 	 *
 	 * ick	= clkp / (1 + CDF)
 	 * SCL	= ick / (20 + SCGD * 8 + F[(ticf + tr + intd) * ick])
 	 *
+	 * for FastMode+:
+	 * SCL	= clkp / (8 + SMD * 2 + SCLD + SCHD +F[(ticf + tr + intd) * clkp])
+	 *
 	 * ick  : I2C internal clock < 20 MHz
 	 * ticf : I2C SCL falling time
 	 * tr   : I2C SCL rising  time
@@ -273,10 +301,14 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
 	 * F[]  : integer up-valuation
 	 */
 	rate = clk_get_rate(priv->clk);
-	cdf = rate / 20000000;
-	if (cdf >= 1U << cdf_width) {
-		dev_err(dev, "Input clock %lu too high\n", rate);
-		return -EIO;
+
+	if (!(priv->flags & ID_P_FMPLUS)) {
+		cdf = rate / 20000000;
+		cdf_width = (priv->devtype == I2C_RCAR_GEN1) ? 2 : 3;
+		if (cdf >= 1U << cdf_width) {
+			dev_err(dev, "Input clock %lu too high\n", rate);
+			return -EIO;
+		}
 	}
 	ick = rate / (cdf + 1);
 
@@ -292,34 +324,55 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
 	round = (ick + 500000) / 1000000 * sum;
 	round = (round + 500) / 1000;
 
-	/*
-	 * SCL	= ick / (20 + SCGD * 8 + F[(ticf + tr + intd) * ick])
-	 *
-	 * Calculation result (= SCL) should be less than
-	 * bus_speed for hardware safety
-	 *
-	 * We could use something along the lines of
-	 *	div = ick / (bus_speed + 1) + 1;
-	 *	scgd = (div - 20 - round + 7) / 8;
-	 *	scl = ick / (20 + (scgd * 8) + round);
-	 * (not fully verified) but that would get pretty involved
-	 */
-	for (scgd = 0; scgd < 0x40; scgd++) {
-		scl = ick / (20 + (scgd * 8) + round);
-		if (scl <= t.bus_freq_hz)
-			break;
-	}
+	if (priv->flags & ID_P_FMPLUS) {
+		/*
+		 * SMD should be smaller than SCLD and SCHD, we arbitrarily set
+		 * the ratio 1:3. SCHD:SCLD ratio is 1:1, thus:
+		 * SCL	= clkp / (8 + SMD * 2 + SCLD + SCHD + F[(ticf + tr + intd) * clkp])
+		 * SCL	= clkp / (8 + SMD * 2 + SMD * 3 + SMD * 3 + F[...])
+		 * SCL	= clkp / (8 + SMD * 8 + F[...])
+		 */
+		smd = DIV_ROUND_UP(ick / t.bus_freq_hz - 8 - round, 8);
+		scl = ick / (8 + 8 * smd + round);
 
-	if (scgd == 0x40) {
-		dev_err(dev, "it is impossible to calculate best SCL\n");
-		return -EIO;
-	}
+		if (smd > 0xff) {
+			dev_err(dev, "it is impossible to calculate best SCL\n");
+			return -EINVAL;
+		}
 
-	dev_dbg(dev, "clk %d/%d(%lu), round %u, CDF:0x%x, SCGD: 0x%x\n",
-		scl, t.bus_freq_hz, rate, round, cdf, scgd);
+		dev_dbg(dev, "clk %d/%d(%lu), round %u, SMD:0x%x, SCHD: 0x%x\n",
+			scl, t.bus_freq_hz, rate, round, smd, 3 * smd);
 
-	/* keep icccr value */
-	priv->icccr = scgd << cdf_width | cdf;
+		priv->clock_val = smd;
+	} else {
+		/*
+		 * SCL	= ick / (20 + SCGD * 8 + F[(ticf + tr + intd) * ick])
+		 *
+		 * Calculation result (= SCL) should be less than
+		 * bus_speed for hardware safety
+		 *
+		 * We could use something along the lines of
+		 *	div = ick / (bus_speed + 1) + 1;
+		 *	scgd = (div - 20 - round + 7) / 8;
+		 *	scl = ick / (20 + (scgd * 8) + round);
+		 * (not fully verified) but that would get pretty involved
+		 */
+		for (scgd = 0; scgd < 0x40; scgd++) {
+			scl = ick / (20 + (scgd * 8) + round);
+			if (scl <= t.bus_freq_hz)
+				break;
+		}
+
+		if (scgd == 0x40) {
+			dev_err(dev, "it is impossible to calculate best SCL\n");
+			return -EINVAL;
+		}
+
+		dev_dbg(dev, "clk %d/%d(%lu), round %u, CDF:0x%x, SCGD: 0x%x\n",
+			scl, t.bus_freq_hz, rate, round, cdf, scgd);
+
+		priv->clock_val = scgd << cdf_width | cdf;
+	}
 
 	return 0;
 }
-- 
2.35.1

