Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DDDE579F2EE
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Sep 2023 22:32:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232173AbjIMUc5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 13 Sep 2023 16:32:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232555AbjIMUc4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 13 Sep 2023 16:32:56 -0400
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82EE91BD1
        for <linux-i2c@vger.kernel.org>; Wed, 13 Sep 2023 13:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        sang-engineering.com; h=from:to:cc:subject:date:message-id
        :in-reply-to:references:mime-version:content-transfer-encoding;
         s=k1; bh=OjN5VJ4QM7OhyI3wmGDWXLIjFnf1/VnezDm+qLQZSgg=; b=DzLrod
        dQ1Ib357owC5tehUe++9ulGPTDn02OnChHkAzXWpWvM5ldero61RZFgC3P83eJkQ
        3t5oA2+qJ/U5EQMEQYdC9XPCKrEhJXt4eniKAZdwVwJR7DISJPPDJI0HVkuAvaWU
        6BFAkU5uwJyP19cNALjGO5FzXvrSZ6PVJpoqnruVIpq8Q/hWBr5LmWzyhlXb16xr
        ZTDlXkr599/ejcNstL6gZpAMngnFed6htZ+Ljg04wI7Gzg3GytSwEka84zJ+EzvI
        4VRnX25v/4k+nnsSgFBBvzCHY2jpOr8G+DBvM7yA8/wc6oFn5bWjR8VSQtDNDiU9
        GDz0RCS0/ktDjMzg==
Received: (qmail 715875 invoked from network); 13 Sep 2023 22:32:49 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Sep 2023 22:32:49 +0200
X-UD-Smtp-Session: l3s3148p1@P9h8dkMFPqIujnuS
From:   Wolfram Sang <wsa+renesas@sang-engineering.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] i2c: rcar: add FastMode+ support for Gen4
Date:   Wed, 13 Sep 2023 22:32:41 +0200
Message-Id: <20230913203242.31505-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230913203242.31505-1-wsa+renesas@sang-engineering.com>
References: <20230913203242.31505-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

To support FM+, we mainly need to turn the SMD constant into a parameter
and set it accordingly. Then, activating the enable bit for FM+ is all
we need to do. Tested with a Renesas Falcon board using R-Car V3U.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-rcar.c | 52 +++++++++++++++++++++++------------
 1 file changed, 34 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rcar.c b/drivers/i2c/busses/i2c-rcar.c
index 5aa6fd777276..9cc8d6ba0c78 100644
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
@@ -148,6 +150,7 @@ struct rcar_i2c_priv {
 	int pos;
 	u32 icccr;
 	u32 scl_gran;
+	u8 smd;
 	u8 recovery_icmcr;	/* protected by adapter lock */
 	enum rcar_i2c_type devtype;
 	struct i2c_client *slave;
@@ -239,9 +242,14 @@ static void rcar_i2c_init(struct rcar_i2c_priv *priv)
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
 		rcar_i2c_write(priv, ICHPR, RCAR_SCHD_RATIO * priv->scl_gran);
 		rcar_i2c_write(priv, ICLPR, RCAR_SCLD_RATIO * priv->scl_gran);
 		rcar_i2c_write(priv, ICFBSCR, TCYC17);
@@ -278,6 +286,8 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
 
 	/* Fall back to previously used values if not supplied */
 	i2c_parse_fw_timings(dev, &t, false);
+	priv->smd = RCAR_DEFAULT_SMD;
+	rate = clk_get_rate(priv->clk);
 
 	/*
 	 * calculate SCL clock
@@ -297,11 +307,18 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
 	 * clkp : peripheral_clk
 	 * F[]  : integer up-valuation
 	 */
-	rate = clk_get_rate(priv->clk);
-	cdf = rate / 20000000;
-	cdf_width = (priv->devtype == I2C_RCAR_GEN1) ? 2 : 3;
-	if (cdf >= 1U << cdf_width)
-		goto err_no_val;
+	if (t.bus_freq_hz > I2C_MAX_FAST_MODE_FREQ && priv->devtype >= I2C_RCAR_GEN4) {
+		priv->flags |= ID_P_FMPLUS;
+		/* FM+ needs lower SMD and no filters */
+		priv->smd /= 2;
+		cdf = 0;
+	} else {
+		priv->flags &= ~ID_P_FMPLUS;
+		cdf = rate / 20000000;
+		cdf_width = (priv->devtype == I2C_RCAR_GEN1) ? 2 : 3;
+		if (cdf >= 1U << cdf_width)
+			goto err_no_val;
+	}
 
 	/* On Gen3+, we use cdf only for the filters, not as a SCL divider */
 	ick = rate / (priv->devtype < I2C_RCAR_GEN3 ? (cdf + 1) : 1);
@@ -344,26 +361,25 @@ static int rcar_i2c_clock_calculate(struct rcar_i2c_priv *priv)
 		 * x as a base value for the SCLD/SCHD ratio:
 		 *
 		 * SCL = clkp / (8 + 2 * SMD + SCLD + SCHD + F[(ticf + tr + intd) * clkp])
-		 * SCL = clkp / (8 + 2 * RCAR_DEFAULT_SMD + RCAR_SCLD_RATIO * x
+		 * SCL = clkp / (8 + 2 * SMD + RCAR_SCLD_RATIO * x
 		 * 		 + RCAR_SCHD_RATIO * x + F[...])
 		 *
 		 * with: sum_ratio = RCAR_SCLD_RATIO + RCAR_SCHD_RATIO
-		 * and:  smd = 2 * RCAR_DEFAULT_SMD
 		 *
-		 * SCL = clkp / (8 + smd + sum_ratio * x + F[...])
-		 * 8 + smd + sum_ratio * x + F[...] = SCL / clkp
-		 * x = ((SCL / clkp) - 8 - smd - F[...]) / sum_ratio
+		 * SCL = clkp / (8 + 2 * smd + sum_ratio * x + F[...])
+		 * 8 + 2 * smd + sum_ratio * x + F[...] = clkp / SCL
+		 * x = ((clkp / SCL) - 8 - 2 * smd - F[...]) / sum_ratio
 		 */
 		x = DIV_ROUND_UP(rate, t.bus_freq_hz ?: 1);
-		x = DIV_ROUND_UP(x - 8 - 2 * RCAR_DEFAULT_SMD - round, sum_ratio);
-		scl = rate / (8 + 2 * RCAR_DEFAULT_SMD + sum_ratio * x + round);
+		x = DIV_ROUND_UP(x - 8 - 2 * priv->smd - round, sum_ratio);
+		scl = rate / (8 + 2 * priv->smd + sum_ratio * x + round);
 
 		/* Bail out if values don't fit into 16 bit or SMD became too large */
-		if (x * RCAR_SCLD_RATIO > 0xffff || RCAR_DEFAULT_SMD > x * RCAR_SCHD_RATIO)
+		if (x * RCAR_SCLD_RATIO > 0xffff || priv->smd > x * RCAR_SCHD_RATIO)
 			goto err_no_val;
 
-		dev_dbg(dev, "clk %u/%u(%lu), round %u, CDF: %u SCL gran %u\n",
-			scl, t.bus_freq_hz, rate, round, cdf, x);
+		dev_dbg(dev, "clk %u/%u(%lu), round %u, CDF: %u SMD %u SCL gran %u\n",
+			scl, t.bus_freq_hz, rate, round, cdf, priv->smd, x);
 
 		priv->icccr = cdf;
 		priv->scl_gran = x;
-- 
2.35.1

