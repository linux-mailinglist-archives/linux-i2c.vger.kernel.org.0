Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E330733305
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jun 2023 16:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345600AbjFPOB7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Jun 2023 10:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345702AbjFPOBX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Jun 2023 10:01:23 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEEB53C3E;
        Fri, 16 Jun 2023 07:00:52 -0700 (PDT)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id D38349CA;
        Fri, 16 Jun 2023 16:00:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686924008;
        bh=e8hgMd9naRgk1G2Q6oVS0NzY0giecTRVjFGHh0pIH4g=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=tzJeiLVtEg4EztEc7jsNCFtBWIaOg+0aiMLwbXXubqS7yTg0w/XNITL/kuxV5SJk0
         ZBtiBzWvdjHj1V/zWydLpPZxlu80z79NuvQSFpQqqmCzuSMeZCaEcEqyc65JfdRAYP
         XIYWT8Gr3f+WB1LHK2yPrgcu6iS3WXqWb+TbnmC4=
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
Subject: [PATCH v14 18/18] media: i2c: ds90ub953: Support non-sync mode
Date:   Fri, 16 Jun 2023 16:59:22 +0300
Message-Id: <20230616135922.442979-19-tomi.valkeinen@ideasonboard.com>
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

Add support for FPD-Link non-sync mode with external clock. The only
thing that needs to be added is the calculation for the clkout.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub953.c | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index ff55740965eb..ae90a647489a 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -143,6 +143,7 @@ struct ub953_data {
 
 	struct i2c_client	*client;
 	struct regmap		*regmap;
+	struct clk		*clkin;
 
 	u32			num_data_lanes;
 	bool			non_cont_clk;
@@ -842,15 +843,21 @@ static int ub953_i2c_master_init(struct ub953_data *priv)
 
 static u64 ub953_get_fc_rate(struct ub953_data *priv)
 {
-	if (priv->mode != UB953_MODE_SYNC) {
+	switch (priv->mode) {
+	case UB953_MODE_SYNC:
+		if (priv->hw_data->is_ub971)
+			return priv->plat_data->bc_rate * 160ull;
+		else
+			return priv->plat_data->bc_rate / 2 * 160ull;
+
+	case UB953_MODE_NONSYNC_EXT:
+		/* CLKIN_DIV = 1 always */
+		return clk_get_rate(priv->clkin) * 80ull;
+
+	default:
 		/* Not supported */
 		return 0;
 	}
-
-	if (priv->hw_data->is_ub971)
-		return priv->plat_data->bc_rate * 160ull;
-	else
-		return priv->plat_data->bc_rate / 2 * 160ull;
 }
 
 static unsigned long ub953_calc_clkout_ub953(struct ub953_data *priv,
@@ -1189,9 +1196,15 @@ static int ub953_hw_init(struct ub953_data *priv)
 	dev_dbg(dev, "mode from %s: %#x\n", mode_override ? "reg" : "strap",
 		priv->mode);
 
-	if (priv->mode != UB953_MODE_SYNC)
+	if (priv->mode != UB953_MODE_SYNC &&
+	    priv->mode != UB953_MODE_NONSYNC_EXT)
 		return dev_err_probe(dev, -ENODEV,
-				     "Only synchronous mode supported\n");
+				     "Unsupported mode selected: %d\n",
+				     priv->mode);
+
+	if (priv->mode == UB953_MODE_NONSYNC_EXT && !priv->clkin)
+		return dev_err_probe(dev, -EINVAL,
+				     "clkin required for non-sync ext mode\n");
 
 	ret = ub953_read(priv, UB953_REG_REV_MASK_ID, &v);
 	if (ret)
@@ -1319,6 +1332,11 @@ static int ub953_probe(struct i2c_client *client)
 		goto err_mutex_destroy;
 	}
 
+	priv->clkin = devm_clk_get_optional(dev, "clkin");
+	if (IS_ERR(priv->clkin))
+		return dev_err_probe(dev, PTR_ERR(priv->clkin),
+				     "failed to parse 'clkin'\n");
+
 	ret = ub953_parse_dt(priv);
 	if (ret)
 		goto err_mutex_destroy;
-- 
2.34.1

