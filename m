Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A5C5212A766
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Dec 2019 11:37:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726025AbfLYKhl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 25 Dec 2019 05:37:41 -0500
Received: from inva021.nxp.com ([92.121.34.21]:42314 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726307AbfLYKhi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 25 Dec 2019 05:37:38 -0500
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id C3FB02007A5;
        Wed, 25 Dec 2019 11:37:35 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 77E28201259;
        Wed, 25 Dec 2019 11:37:31 +0100 (CET)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 32803402DF;
        Wed, 25 Dec 2019 18:37:26 +0800 (SGT)
From:   Biwen Li <biwen.li@nxp.com>
To:     peda@axentia.se, leoyang.li@nxp.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Biwen Li <biwen.li@nxp.com>
Subject: [RESEND v6,2/3] i2c: mux: pca954x: support property idle-state
Date:   Wed, 25 Dec 2019 18:36:23 +0800
Message-Id: <20191225103624.48342-2-biwen.li@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191225103624.48342-1-biwen.li@nxp.com>
References: <20191225103624.48342-1-biwen.li@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This supports property idle-state,if present,
overrides i2c-mux-idle-disconnect.

My use cases:
	- Use the property idle-state to fix
	  an errata on LS2085ARDB and LS2088ARDB.
	- Errata id: E-00013(board LS2085ARDB and
	  LS2088ARDB revision on Rev.B, Rev.C and Rev.D).
	- About E-00013:
	  - Description: I2C1 and I2C3 buses
	    are missing pull-up.
	  - Impact: When the PCA954x device is tri-stated, the I2C bus
	    will float. This makes the I2C bus and its associated
	    downstream devices inaccessible.
	  - Hardware fix: Populate resistors R189 and R190 for I2C1
	    and resistors R228 and R229 for I2C3.
	  - Software fix: Remove the tri-state option from the PCA954x
	    driver(PCA954x always on enable status, specify a
	    channel zero in dts to fix the errata E-00013).

Tested-by: Ioana Ciornei <ioana.ciornei@nxp.com>
Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
Change in v6:
	- adjust log

Change in v5:
	- add extra precaution for pca954x_init 	

Change in v4:
	- rename function
	  pca954x_calculate_chan -> pca954x_regval

Change in v3:
	- update subject and description
	- add a helper function pca954x_calculate_chan()

Change in v2:
	- update subject and description
	- add property idle-state

 drivers/i2c/muxes/i2c-mux-pca954x.c | 69 +++++++++++++++++++----------
 1 file changed, 46 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index cd8753b29a63..6577ec873f59 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -87,7 +87,7 @@ struct pca954x {
 
 	u8 last_chan;		/* last register value */
 	/* MUX_IDLE_AS_IS, MUX_IDLE_DISCONNECT or >= 0 for channel */
-	s8 idle_state;
+	s32 idle_state;
 
 	struct i2c_client *client;
 
@@ -237,20 +237,23 @@ static int pca954x_reg_write(struct i2c_adapter *adap,
 				I2C_SMBUS_BYTE, &dummy);
 }
 
+static u8 pca954x_regval(struct pca954x *data, u8 chan)
+{
+	/* We make switches look like muxes, not sure how to be smarter. */
+	if (data->chip->muxtype == pca954x_ismux)
+		return chan | data->chip->enable;
+	else
+		return 1 << chan;
+}
+
 static int pca954x_select_chan(struct i2c_mux_core *muxc, u32 chan)
 {
 	struct pca954x *data = i2c_mux_priv(muxc);
 	struct i2c_client *client = data->client;
-	const struct chip_desc *chip = data->chip;
 	u8 regval;
 	int ret = 0;
 
-	/* we make switches look like muxes, not sure how to be smarter */
-	if (chip->muxtype == pca954x_ismux)
-		regval = chan | chip->enable;
-	else
-		regval = 1 << chan;
-
+	regval = pca954x_regval(data, chan);
 	/* Only select the channel if its different from the last channel */
 	if (data->last_chan != regval) {
 		ret = pca954x_reg_write(muxc->parent, client, regval);
@@ -264,7 +267,7 @@ static int pca954x_deselect_mux(struct i2c_mux_core *muxc, u32 chan)
 {
 	struct pca954x *data = i2c_mux_priv(muxc);
 	struct i2c_client *client = data->client;
-	s8 idle_state;
+	s32 idle_state;
 
 	idle_state = READ_ONCE(data->idle_state);
 	if (idle_state >= 0)
@@ -410,6 +413,22 @@ static void pca954x_cleanup(struct i2c_mux_core *muxc)
 	i2c_mux_del_adapters(muxc);
 }
 
+static int pca954x_init(struct i2c_client *client, struct pca954x *data)
+{
+	int ret;
+	if (data->idle_state >= 0) {
+		data->last_chan = pca954x_regval(data, data->idle_state);
+	} else {
+		/* Disconnect multiplexer */
+		data->last_chan = 0;
+	}
+	ret = i2c_smbus_write_byte(client, data->last_chan);
+	if (ret < 0)
+		data->last_chan = 0;
+
+	return ret;
+}
+
 /*
  * I2C init/probing/exit functions
  */
@@ -419,7 +438,6 @@ static int pca954x_probe(struct i2c_client *client,
 	struct i2c_adapter *adap = client->adapter;
 	struct device *dev = &client->dev;
 	struct device_node *np = dev->of_node;
-	bool idle_disconnect_dt;
 	struct gpio_desc *gpio;
 	struct i2c_mux_core *muxc;
 	struct pca954x *data;
@@ -470,23 +488,24 @@ static int pca954x_probe(struct i2c_client *client,
 		}
 	}
 
-	/* Write the mux register at addr to verify
+	data->idle_state = MUX_IDLE_AS_IS;
+	if (of_property_read_u32(np, "idle-state", &data->idle_state)) {
+		if (np && of_property_read_bool(np, "i2c-mux-idle-disconnect"))
+			data->idle_state = MUX_IDLE_DISCONNECT;
+	}
+
+	/*
+	 * Write the mux register at addr to verify
 	 * that the mux is in fact present. This also
-	 * initializes the mux to disconnected state.
+	 * initializes the mux to a channel
+	 * or disconnected state.
 	 */
-	if (i2c_smbus_write_byte(client, 0) < 0) {
+	ret = pca954x_init(client, data);
+	if (ret < 0) {
 		dev_warn(dev, "probe failed\n");
 		return -ENODEV;
 	}
 
-	data->last_chan = 0;		   /* force the first selection */
-	data->idle_state = MUX_IDLE_AS_IS;
-
-	idle_disconnect_dt = np &&
-		of_property_read_bool(np, "i2c-mux-idle-disconnect");
-	if (idle_disconnect_dt)
-		data->idle_state = MUX_IDLE_DISCONNECT;
-
 	ret = pca954x_irq_setup(muxc);
 	if (ret)
 		goto fail_cleanup;
@@ -538,9 +557,13 @@ static int pca954x_resume(struct device *dev)
 	struct i2c_client *client = to_i2c_client(dev);
 	struct i2c_mux_core *muxc = i2c_get_clientdata(client);
 	struct pca954x *data = i2c_mux_priv(muxc);
+	int ret;
 
-	data->last_chan = 0;
-	return i2c_smbus_write_byte(client, 0);
+	ret = pca954x_init(client, data);
+	if (ret < 0)
+		dev_err(&client->dev, "failed to verify the mux, the mux maybe not present in fact\n");
+
+	return ret;
 }
 #endif
 
-- 
2.17.1

