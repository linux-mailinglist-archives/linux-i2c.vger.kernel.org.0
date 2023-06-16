Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88AF87332F3
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jun 2023 16:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345664AbjFPOBb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Jun 2023 10:01:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345493AbjFPOBR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Jun 2023 10:01:17 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0DBC3C1B;
        Fri, 16 Jun 2023 07:00:41 -0700 (PDT)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 03E751288;
        Fri, 16 Jun 2023 16:00:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686924006;
        bh=yiiSk0ohte72gCz1Vi3cjnyefBLR0mWfSt3DWEVwmbc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nc2C73syYspyRLFR+Rd6kXPCxlKjBlgkuKmohkVYFVNgy7t/1QuMip+Vxw1Hx+F6j
         NPfLb5/BWOYQKv/lVElTZxPZJ1u1DidD+CYJwtWYu0TGr0fh9BkMHWsziAlUJRdVtv
         lzUlbLjwuEEIbkpNvZbWPlMSqVRdHPrCm9h0NL/s=
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
To:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?q?Krzysztof=20Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH v14 17/18] media: i2c: ds90ub953: Restructure clkout management
Date:   Fri, 16 Jun 2023 16:59:21 +0300
Message-Id: <20230616135922.442979-18-tomi.valkeinen@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230616135922.442979-1-tomi.valkeinen@ideasonboard.com>
References: <20230616135922.442979-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Separate clkout calculations and register writes into two functions:
ub953_calc_clkout_params and ub953_write_clkout_regs, and add a struct
ub953_clkout_data that is used to store the clkout parameters.

This simplifies the clkout management.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub953.c | 135 ++++++++++++++++++----------------
 1 file changed, 70 insertions(+), 65 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index f2e950a00d64..ff55740965eb 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -131,6 +131,13 @@ struct ub953_hw_data {
 	bool is_ub971;
 };
 
+struct ub953_clkout_data {
+	u32 hs_div;
+	u32 m;
+	u32 n;
+	unsigned long rate;
+};
+
 struct ub953_data {
 	const struct ub953_hw_data	*hw_data;
 
@@ -906,6 +913,58 @@ static unsigned long ub953_calc_clkout_ub971(struct ub953_data *priv,
 	return res;
 }
 
+static void ub953_calc_clkout_params(struct ub953_data *priv,
+				     unsigned long target_rate,
+				     struct ub953_clkout_data *clkout_data)
+{
+	struct device *dev = &priv->client->dev;
+	unsigned long clkout_rate;
+	u64 fc_rate;
+
+	fc_rate = ub953_get_fc_rate(priv);
+
+	if (priv->hw_data->is_ub971) {
+		u8 m, n;
+
+		clkout_rate = ub953_calc_clkout_ub971(priv, target_rate,
+						      fc_rate, &m, &n);
+
+		clkout_data->m = m;
+		clkout_data->n = n;
+
+		dev_dbg(dev, "%s %llu * %u / (8 * %u) = %lu (requested %lu)",
+			__func__, fc_rate, m, n, clkout_rate, target_rate);
+	} else {
+		u8 hs_div, m, n;
+
+		clkout_rate = ub953_calc_clkout_ub953(priv, target_rate,
+						      fc_rate, &hs_div, &m, &n);
+
+		clkout_data->hs_div = hs_div;
+		clkout_data->m = m;
+		clkout_data->n = n;
+
+		dev_dbg(dev, "%s %llu / %u * %u / %u = %lu (requested %lu)",
+			__func__, fc_rate, hs_div, m, n, clkout_rate,
+			target_rate);
+	}
+
+	clkout_data->rate = clkout_rate;
+}
+
+static void ub953_write_clkout_regs(struct ub953_data *priv,
+				    struct ub953_clkout_data *clkout_data)
+{
+	if (priv->hw_data->is_ub971) {
+		ub953_write(priv, UB953_REG_CLKOUT_CTRL0, clkout_data->m);
+		ub953_write(priv, UB953_REG_CLKOUT_CTRL1, clkout_data->n);
+	} else {
+		ub953_write(priv, UB953_REG_CLKOUT_CTRL0,
+			    (__ffs(clkout_data->hs_div) << 5) | clkout_data->m);
+		ub953_write(priv, UB953_REG_CLKOUT_CTRL1, clkout_data->n);
+	}
+}
+
 static unsigned long ub953_clkout_recalc_rate(struct clk_hw *hw,
 					      unsigned long parent_rate)
 {
@@ -965,52 +1024,25 @@ static long ub953_clkout_round_rate(struct clk_hw *hw, unsigned long rate,
 				    unsigned long *parent_rate)
 {
 	struct ub953_data *priv = container_of(hw, struct ub953_data, clkout_clk_hw);
-	struct device *dev = &priv->client->dev;
-	unsigned long res;
-	u64 fc_rate;
-	u8 hs_div, m, n;
-
-	fc_rate = ub953_get_fc_rate(priv);
+	struct ub953_clkout_data clkout_data;
 
-	if (priv->hw_data->is_ub971) {
-		res = ub953_calc_clkout_ub971(priv, rate, fc_rate, &m, &n);
+	ub953_calc_clkout_params(priv, rate, &clkout_data);
 
-		dev_dbg(dev, "%s %llu * %u / (8 * %u) = %lu (requested %lu)",
-			__func__, fc_rate, m, n, res, rate);
-	} else {
-		res = ub953_calc_clkout_ub953(priv, rate, fc_rate, &hs_div, &m, &n);
-
-		dev_dbg(dev, "%s %llu / %u * %u / %u = %lu (requested %lu)",
-			__func__, fc_rate, hs_div, m, n, res, rate);
-	}
-
-	return res;
+	return clkout_data.rate;
 }
 
 static int ub953_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
 				 unsigned long parent_rate)
 {
 	struct ub953_data *priv = container_of(hw, struct ub953_data, clkout_clk_hw);
-	u64 fc_rate;
-	u8 hs_div, m, n;
-	unsigned long res;
+	struct ub953_clkout_data clkout_data;
 
-	fc_rate = ub953_get_fc_rate(priv);
-
-	if (priv->hw_data->is_ub971) {
-		res = ub953_calc_clkout_ub971(priv, rate, fc_rate, &m, &n);
-
-		ub953_write(priv, UB953_REG_CLKOUT_CTRL0, m);
-		ub953_write(priv, UB953_REG_CLKOUT_CTRL1, n);
-	} else {
-		res = ub953_calc_clkout_ub953(priv, rate, fc_rate, &hs_div, &m, &n);
+	ub953_calc_clkout_params(priv, rate, &clkout_data);
 
-		ub953_write(priv, UB953_REG_CLKOUT_CTRL0, (__ffs(hs_div) << 5) | m);
-		ub953_write(priv, UB953_REG_CLKOUT_CTRL1, n);
-	}
+	dev_dbg(&priv->client->dev, "%s %lu (requested %lu)\n", __func__,
+		clkout_data.rate, rate);
 
-	dev_dbg(&priv->client->dev, "%s %lu (requested %lu)\n", __func__, res,
-		rate);
+	ub953_write_clkout_regs(priv, &clkout_data);
 
 	return 0;
 }
@@ -1021,32 +1053,6 @@ static const struct clk_ops ub953_clkout_ops = {
 	.set_rate	= ub953_clkout_set_rate,
 };
 
-static void ub953_init_clkout_ub953(struct ub953_data *priv)
-{
-	u64 fc_rate;
-	u8 hs_div, m, n;
-
-	fc_rate = ub953_get_fc_rate(priv);
-
-	ub953_calc_clkout_ub953(priv, 25000000, fc_rate, &hs_div, &m, &n);
-
-	ub953_write(priv, UB953_REG_CLKOUT_CTRL0, (__ffs(hs_div) << 5) | m);
-	ub953_write(priv, UB953_REG_CLKOUT_CTRL1, n);
-}
-
-static void ub953_init_clkout_ub971(struct ub953_data *priv)
-{
-	u64 fc_rate;
-	u8 m, n;
-
-	fc_rate = ub953_get_fc_rate(priv);
-
-	ub953_calc_clkout_ub971(priv, 25000000, fc_rate, &m, &n);
-
-	ub953_write(priv, UB953_REG_CLKOUT_CTRL0, m);
-	ub953_write(priv, UB953_REG_CLKOUT_CTRL1, n);
-}
-
 static int ub953_register_clkout(struct ub953_data *priv)
 {
 	struct device *dev = &priv->client->dev;
@@ -1055,16 +1061,15 @@ static int ub953_register_clkout(struct ub953_data *priv)
 				  priv->hw_data->model, dev_name(dev)),
 		.ops = &ub953_clkout_ops,
 	};
+	struct ub953_clkout_data clkout_data;
 	int ret;
 
 	if (!init.name)
 		return -ENOMEM;
 
 	/* Initialize clkout to 25MHz by default */
-	if (priv->hw_data->is_ub971)
-		ub953_init_clkout_ub971(priv);
-	else
-		ub953_init_clkout_ub953(priv);
+	ub953_calc_clkout_params(priv, 25000000, &clkout_data);
+	ub953_write_clkout_regs(priv, &clkout_data);
 
 	priv->clkout_clk_hw.init = &init;
 
-- 
2.34.1

