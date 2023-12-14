Return-Path: <linux-i2c+bounces-768-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DBE8129B0
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 08:44:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 788831C214F0
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Dec 2023 07:44:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6056E1401A;
	Thu, 14 Dec 2023 07:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WYq0W0rV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 074FDB9
	for <linux-i2c@vger.kernel.org>; Wed, 13 Dec 2023 23:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=sLux8hEi9/sjtoNpGdoaEH5UG27zo1G6S1tRWJJq7VI=; b=WYq0W0
	rV/3w0jLnvYX1Hbq4O/e8ngeKUf+TFRzIGQEAcneiQzYZnrGKtN7sndG9/TR2qa9
	5MDN1HAvumjLFgk2CvTeZujnMh+W9KO7qTwsib59E6pPtW1Ctrf7UKQWnnin/wVu
	DzcPAk1P5hK17nQPK7T8z4hy0/4zYFaNTvLl2RpKg75VOgOuv4m0t/5po9nKgFCe
	0pL0yvzW0k482FkVlrEVhNWlkmekVvTV8bmZ7ORof7uiWfd6I3+4BVFO9zdThz/u
	OryOPyBNR/E0aZNGnLgQzyaw3nM3v3uyWk9IZTiyQNZQUqlsqrszO/qCv2kDNZls
	Yepqwg3QZvoGWZ1g==
Received: (qmail 827056 invoked from network); 14 Dec 2023 08:44:14 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Dec 2023 08:44:14 +0100
X-UD-Smtp-Session: l3s3148p1@aI05c3MMwK8ujnuR
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] i2c: rcar: add FastMode+ support for Gen4
Date: Thu, 14 Dec 2023 08:43:58 +0100
Message-Id: <20231214074358.8711-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20231214074358.8711-1-wsa+renesas@sang-engineering.com>
References: <20231214074358.8711-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To support FM+, we mainly need to turn the SMD constant into a parameter
and set it accordingly. That also means we can finally fix SMD to our
needs instead of bailing out. A sanity check for SMD then becomes a
sanity check for 'x == 0'. After all that, activating the enable bit for
FM+ is all we need to do. Tested with a Renesas Falcon board using R-Car
V3U.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
Changes since v1:

* rebased to 6.7-rc4
* gained S4 specific handling from patch 1
* keep SCL filters active for FM+ by still writing to CDF
* if default SMD is too large, fix it instead of bailing out

 drivers/i2c/busses/i2c-rcar.c | 38 +++++++++++++++++++++++++----------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 973811a6c27b..828aa2ea0fe4 100644
--- a/drivers/i2c/busses/i2c-rcar.c
+++ b/drivers/i2c/busses/i2c-rcar.c
@@ -89,6 +89,7 @@
 #define TMDMAE	BIT(0)	/* DMA Master Transmitted Enable */
 
 /* ICCCR2 */
+#define FMPE	BIT(7)	/* Fast Mode Plus Enable */
 #define CDFD	BIT(2)	/* CDF Disable */
 #define HLSE	BIT(1)	/* HIGH/LOW Separate Control Enable */
 #define SME	BIT(0)	/* SCL Mask Enable */
@@ -122,11 +123,12 @@
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
@@ -149,6 +151,7 @@ struct rcar_i2c_priv {
 	u32 icccr;
 	u16 schd;
 	u16 scld;
+	u8 smd;
 	u8 recovery_icmcr;	/* protected by adapter lock */
 	enum rcar_i2c_type devtype;
 	struct i2c_client *slave;
@@ -240,9 +243,14 @@ static void rcar_i2c_init(struct rcar_i2c_priv *priv)
 	if (priv->devtype < I2C_RCAR_GEN3) {
 		rcar_i2c_write(priv, ICCCR, priv->icccr);
 	} else {
-		rcar_i2c_write(priv, ICCCR2, CDFD | HLSE | SME);
+		u32 icccr2 = CDFD | HLSE | SME;
+
+		if (priv->flags & ID_P_FMPLUS)
+			icccr2 |= FMPE;
+
+		rcar_i2c_write(priv, ICCCR2, icccr2);
 		rcar_i2c_write(priv, ICCCR, priv->icccr);
-		rcar_i2c_write(priv, ICMPR, RCAR_DEFAULT_SMD);
+		rcar_i2c_write(priv, ICMPR, priv->smd);
 		rcar_i2c_write(priv, ICHPR, priv->schd);
 		rcar_i2c_write(priv, ICLPR, priv->scld);
 		rcar_i2c_write(priv, ICFBSCR, TCYC17);
@@ -279,6 +287,7 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
 
 	/* Fall back to previously used values if not supplied */
 	i2c_parse_fw_timings(dev, &t, false);
+	priv->smd = RCAR_DEFAULT_SMD;
 
 	/*
 	 * calculate SCL clock
@@ -304,6 +313,11 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
 	if (cdf >= 1U << cdf_width)
 		goto err_no_val;
 
+	if (t.bus_freq_hz > I2C_MAX_FAST_MODE_FREQ && priv->devtype >= I2C_RCAR_GEN4)
+		priv->flags |= ID_P_FMPLUS;
+	else
+		priv->flags &= ~ID_P_FMPLUS;
+
 	/* On Gen3+, we use cdf only for the filters, not as a SCL divider */
 	ick = rate / (priv->devtype < I2C_RCAR_GEN3 ? (cdf + 1) : 1);
 
@@ -345,30 +359,30 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
 		 * x as a base value for the SCLD/SCHD ratio:
 		 *
 		 * SCL = clkp / (8 + 2 * SMD + SCLD + SCHD + F[(ticf + tr + intd) * clkp])
-		 * SCL = clkp / (8 + 2 * RCAR_DEFAULT_SMD + RCAR_SCLD_RATIO * x
+		 * SCL = clkp / (8 + 2 * SMD + RCAR_SCLD_RATIO * x
 		 *		 + RCAR_SCHD_RATIO * x + F[...])
 		 *
 		 * with: sum_ratio = RCAR_SCLD_RATIO + RCAR_SCHD_RATIO
-		 * and:  smd = RCAR_DEFAULT_SMD
 		 *
 		 * SCL = clkp / (8 + 2 * smd + sum_ratio * x + F[...])
 		 * 8 + 2 * smd + sum_ratio * x + F[...] = clkp / SCL
 		 * x = ((clkp / SCL) - 8 - 2 * smd - F[...]) / sum_ratio
 		 */
 		x = DIV_ROUND_UP(rate, t.bus_freq_hz ?: 1);
-		x = DIV_ROUND_UP(x - 8 - 2 * RCAR_DEFAULT_SMD - round, sum_ratio);
-		scl = rate / (8 + 2 * RCAR_DEFAULT_SMD + sum_ratio * x + round);
+		x = DIV_ROUND_UP(x - 8 - 2 * priv->smd - round, sum_ratio);
+		scl = rate / (8 + 2 * priv->smd + sum_ratio * x + round);
 
-		/* Bail out if values don't fit into 16 bit or SMD became too large */
-		if (x * RCAR_SCLD_RATIO > 0xffff || RCAR_DEFAULT_SMD > x * RCAR_SCHD_RATIO)
+		if (x == 0 || x * RCAR_SCLD_RATIO > 0xffff)
 			goto err_no_val;
 
 		priv->icccr = cdf;
 		priv->schd = RCAR_SCHD_RATIO * x;
 		priv->scld = RCAR_SCLD_RATIO * x;
+		if (priv->smd >= priv->schd)
+			priv->smd = priv->schd - 1;
 
-		dev_dbg(dev, "clk %u/%u(%lu), round %u, CDF: %u SCHD %u SCLD %u\n",
-			scl, t.bus_freq_hz, rate, round, cdf, priv->schd, priv->scld);
+		dev_dbg(dev, "clk %u/%u(%lu), round %u, CDF: %u SCHD %u SCLD %u SMD %u\n",
+			scl, t.bus_freq_hz, rate, round, cdf, priv->schd, priv->scld, priv->smd);
 	}
 
 	return 0;
@@ -1073,6 +1087,8 @@ static const struct of_device_id rcar_i2c_dt_ids[] = {
 	{ .compatible = "renesas,i2c-r8a7794", .data = (void *)I2C_RCAR_GEN2 },
 	{ .compatible = "renesas,i2c-r8a7795", .data = (void *)I2C_RCAR_GEN3 },
 	{ .compatible = "renesas,i2c-r8a7796", .data = (void *)I2C_RCAR_GEN3 },
+	/* S4 has no FM+ bit */
+	{ .compatible = "renesas,i2c-r8a779f0", .data = (void *)I2C_RCAR_GEN3 },
 	{ .compatible = "renesas,rcar-gen1-i2c", .data = (void *)I2C_RCAR_GEN1 },
 	{ .compatible = "renesas,rcar-gen2-i2c", .data = (void *)I2C_RCAR_GEN2 },
 	{ .compatible = "renesas,rcar-gen3-i2c", .data = (void *)I2C_RCAR_GEN3 },
-- 
2.35.1


