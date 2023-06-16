Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9E3367332E7
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jun 2023 16:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345539AbjFPOBV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Jun 2023 10:01:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345260AbjFPOAm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Jun 2023 10:00:42 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E403AA4;
        Fri, 16 Jun 2023 07:00:33 -0700 (PDT)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B995B9CA;
        Fri, 16 Jun 2023 15:59:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686923997;
        bh=dm5HbePgcaPfLaX3yBGz4mvjF9Gw8NresEFgv9LiBwg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=o7lpsgfyBcgVEjzk95eFobdWH7IL+5e48RA0imLvV+DhrlkW+qPUEWNZESGOjxHl4
         43LLNeDplDQRzphGWpzL/TysN+GTDlCR794571j7RgZvDSiMrQeCKFOL2aFr/uSGNx
         h3JJVN2519h+VUN98u0SwKVmMjkRTFYQDL13+1r4=
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
Subject: [PATCH v14 12/18] media: i2c: ds90ub960: Configure CSI-2 continuous clock
Date:   Fri, 16 Jun 2023 16:59:16 +0300
Message-Id: <20230616135922.442979-13-tomi.valkeinen@ideasonboard.com>
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

Use 'clock-noncontinuous' from DT to configure the
continuous/non-continuous clock setting for the TX ports.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/media/i2c/ds90ub960.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index e101bcf2356a..6b70fa5bb22f 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -149,6 +149,7 @@
 
 #define UB960_TR_CSI_CTL			0x33
 #define UB960_TR_CSI_CTL_CSI_CAL_EN		BIT(6)
+#define UB960_TR_CSI_CTL_CSI_CONTS_CLOCK	BIT(1)
 #define UB960_TR_CSI_CTL_CSI_ENABLE		BIT(0)
 
 #define UB960_TR_CSI_CTL2			0x34
@@ -485,6 +486,7 @@ struct ub960_txport {
 	u8                      nport;	/* TX port number, and index in priv->txport[] */
 
 	u32 num_data_lanes;
+	bool non_continous_clk;
 };
 
 struct ub960_data {
@@ -1133,6 +1135,9 @@ static int ub960_parse_dt_txport(struct ub960_data *priv,
 		goto err_free_txport;
 	}
 
+	txport->non_continous_clk = vep.bus.mipi_csi2.flags &
+				    V4L2_MBUS_CSI2_NONCONTINUOUS_CLOCK;
+
 	txport->num_data_lanes = vep.bus.mipi_csi2.num_data_lanes;
 
 	if (vep.nr_of_link_frequencies != 1) {
@@ -1744,6 +1749,9 @@ static void ub960_init_tx_port(struct ub960_data *priv,
 
 	csi_ctl |= (4 - txport->num_data_lanes) << 4;
 
+	if (!txport->non_continous_clk)
+		csi_ctl |= UB960_TR_CSI_CTL_CSI_CONTS_CLOCK;
+
 	ub960_txport_write(priv, nport, UB960_TR_CSI_CTL, csi_ctl);
 }
 
-- 
2.34.1

