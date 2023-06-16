Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3911F7332D8
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jun 2023 16:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345566AbjFPOAm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Jun 2023 10:00:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345400AbjFPOA2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Jun 2023 10:00:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 387F43A91;
        Fri, 16 Jun 2023 07:00:26 -0700 (PDT)
Received: from desky.lan (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1038A1288;
        Fri, 16 Jun 2023 15:59:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1686923991;
        bh=TK4YhOFvhaya/ewN0odVoqq5/fzBn2JCsOSBpSX+EaA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WDSxDTRoWEr1DQN5TqicxHaj01o2XZhN9a+beo+jxVDyiEWrU33vNaT5QdS2r7ILu
         38pVM7bU03/ARszH+h9bhXiPxKYdiJA+GGUeWNQF0UPxUQj9FeSAgiWbrb6gKRcKtM
         AOUk7Scrz/La0CfEJtqrKaMXxLWELqLfSS1r7FGA=
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
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Ludwig Zenz <lzenz@dh-electronics.com>
Subject: [PATCH v14 09/18] media: i2c: ds90ub960: Fix use of UB960_SR_FWD_CTL1
Date:   Fri, 16 Jun 2023 16:59:13 +0300
Message-Id: <20230616135922.442979-10-tomi.valkeinen@ideasonboard.com>
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

The driver does not update the forwarding bits in the UB960_SR_FWD_CTL1
register for ports that won't be used. This might leave port forwardings
enabled for unused ports, which might cause issues.

Fix this by making sure all the port forwardings are disabled by
default, and only enable the ones that are used.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reported-by: Ludwig Zenz <lzenz@dh-electronics.com>
Link: https://lore.kernel.org/all/20230516123549.3120-1-lzenz@dh-electronics.com/
---
 drivers/media/i2c/ds90ub960.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
index ff939300c918..e101bcf2356a 100644
--- a/drivers/media/i2c/ds90ub960.c
+++ b/drivers/media/i2c/ds90ub960.c
@@ -2330,7 +2330,8 @@ static int ub960_enable_rx_port(struct ub960_data *priv, unsigned int nport)
 	dev_dbg(dev, "enable RX port %u\n", nport);
 
 	/* Enable forwarding */
-	return ub960_update_bits(priv, UB960_SR_FWD_CTL1, BIT(4 + nport), 0);
+	return ub960_update_bits(priv, UB960_SR_FWD_CTL1,
+				 UB960_SR_FWD_CTL1_PORT_DIS(nport), 0);
 }
 
 static void ub960_disable_rx_port(struct ub960_data *priv, unsigned int nport)
@@ -2340,8 +2341,9 @@ static void ub960_disable_rx_port(struct ub960_data *priv, unsigned int nport)
 	dev_dbg(dev, "disable RX port %u\n", nport);
 
 	/* Disable forwarding */
-	ub960_update_bits(priv, UB960_SR_FWD_CTL1, BIT(4 + nport),
-			  BIT(4 + nport));
+	ub960_update_bits(priv, UB960_SR_FWD_CTL1,
+			  UB960_SR_FWD_CTL1_PORT_DIS(nport),
+			  UB960_SR_FWD_CTL1_PORT_DIS(nport));
 }
 
 /*
@@ -2467,7 +2469,11 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 
 	/* Configure RX ports */
 
-	fwd_ctl = 0;
+	/*
+	 * Keep all port forwardings disabled by default. Forwarding will be
+	 * enabled in ub960_enable_rx_port.
+	 */
+	fwd_ctl = GENMASK(7, 4);
 
 	for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
 		struct ub960_rxport *rxport = priv->rxports[nport];
@@ -2515,10 +2521,6 @@ static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
 			break;
 		}
 
-		/* Forwarding */
-
-		fwd_ctl |= BIT(4 + nport); /* forward disable */
-
 		if (rx_data[nport].tx_port == 1)
 			fwd_ctl |= BIT(nport); /* forward to TX1 */
 		else
-- 
2.34.1

