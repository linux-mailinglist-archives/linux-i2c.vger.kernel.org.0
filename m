Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BDCF7332EE
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jun 2023 16:01:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345610AbjFPOB1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Jun 2023 10:01:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345406AbjFPOAr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Jun 2023 10:00:47 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1DA23ABE;
        Fri, 16 Jun 2023 07:00:38 -0700 (PDT)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4BB43209A;
        Fri, 16 Jun 2023 16:00:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686924002;
        bh=nED/RJDHJyg29w/DBB3glM12/4xdeiqHHA4Jmrf1gCg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aB0KB4+j1275iIuPK4NaBWo3JzF/LkoqbjTuJ2h8VDrcU63PrkOMnIxpKOjFEwDbG
         rhcq4+wUgWLLNdDXSF+M+RfgtHDXl6DBz1lz5X591gLLmtcJJxD6vuiU66iGgTld++
         oenKicSavewUKIJko3lJ72EFDFxAdJ1HDdCqKh2U=
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
Subject: [PATCH v14 15/18] media: i2c: ds90ub953: Handle V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK
Date:   Fri, 16 Jun 2023 16:59:19 +0300
Message-Id: <20230616135922.442979-16-tomi.valkeinen@ideasonboard.com>
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

Handle V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK flag to configure the CSI-2 RX
continuous/non-continuous clock register.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub953.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 5b586855c77b..f2e950a00d64 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -138,6 +138,7 @@ struct ub953_data {
 	struct regmap		*regmap;
 
 	u32			num_data_lanes;
+	bool			non_cont_clk;
 
 	struct gpio_chip	gpio_chip;
 
@@ -1140,6 +1141,9 @@ static int ub953_parse_dt(struct ub953_data *priv)
 
 	priv->num_data_lanes = nlanes;
 
+	priv->non_cont_clk = vep.bus.mipi_csi2.flags &
+			     V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
+
 	return 0;
 }
 
@@ -1202,7 +1206,7 @@ static int ub953_hw_init(struct ub953_data *priv)
 		return dev_err_probe(dev, ret, "i2c init failed\n");
 
 	ub953_write(priv, UB953_REG_GENERAL_CFG,
-		    UB953_REG_GENERAL_CFG_CONT_CLK |
+		    (priv->non_cont_clk ? 0 : UB953_REG_GENERAL_CFG_CONT_CLK) |
 		    ((priv->num_data_lanes - 1) << UB953_REG_GENERAL_CFG_CSI_LANE_SEL_SHIFT) |
 		    UB953_REG_GENERAL_CFG_CRC_TX_GEN_ENABLE);
 
-- 
2.34.1

