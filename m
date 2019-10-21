Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85511DE5FF
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Oct 2019 10:12:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727648AbfJUILy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Oct 2019 04:11:54 -0400
Received: from inva021.nxp.com ([92.121.34.21]:46372 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727399AbfJUILy (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 21 Oct 2019 04:11:54 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2B65D20020B;
        Mon, 21 Oct 2019 10:11:51 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 227322001DC;
        Mon, 21 Oct 2019 10:11:47 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 25DE7402B6;
        Mon, 21 Oct 2019 16:11:42 +0800 (SGT)
From:   Biwen Li <biwen.li@nxp.com>
To:     peda@axentia.se, leoyang.li@nxp.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Biwen Li <biwen.li@nxp.com>
Subject: [v4,2/2] i2c: mux: pca954x: support property idle-state
Date:   Mon, 21 Oct 2019 16:00:48 +0800
Message-Id: <20191021080048.47189-2-biwen.li@nxp.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20191021080048.47189-1-biwen.li@nxp.com>
References: <20191021080048.47189-1-biwen.li@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This supports property idle-state

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
Change in v4:
	- rename function
	  pca954x_calculate_chan -> pca954x_regval

Change in v3:
	- update subject and description
	- add a helper function pca954x_calculate_chan()

Change in v2:
	- update subject and description
	- add property idle-state

 drivers/i2c/muxes/i2c-mux-pca954x.c | 59 ++++++++++++++++++-----------
 1 file changed, 36 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 923aa3a5a3dc..e566c4cd8ba5 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -86,7 +86,7 @@ struct pca954x {
 
 	u8 last_chan;		/* last register value */
 	/* MUX_IDLE_AS_IS, MUX_IDLE_DISCONNECT or >= 0 for channel */
-	s8 idle_state;
+	s32 idle_state;
 
 	struct i2c_client *client;
 
@@ -229,20 +229,23 @@ static int pca954x_reg_write(struct i2c_adapter *adap,
 				I2C_SMBUS_BYTE, &dummy);
 }
 
+static u8 pca954x_regval(struct pca954x *data, u8 chan)
+{
+	/* we make switches look like muxes, not sure how to be smarter */
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
+	regval = pca954x_regval(data, (u8)(chan & 0xff));
 	/* Only select the channel if its different from the last channel */
 	if (data->last_chan != regval) {
 		ret = pca954x_reg_write(muxc->parent, client, regval);
@@ -256,7 +259,7 @@ static int pca954x_deselect_mux(struct i2c_mux_core *muxc, u32 chan)
 {
 	struct pca954x *data = i2c_mux_priv(muxc);
 	struct i2c_client *client = data->client;
-	s8 idle_state;
+	s32 idle_state;
 
 	idle_state = READ_ONCE(data->idle_state);
 	if (idle_state >= 0)
@@ -402,6 +405,17 @@ static void pca954x_cleanup(struct i2c_mux_core *muxc)
 	i2c_mux_del_adapters(muxc);
 }
 
+static int pca954x_init(struct i2c_client *client, struct pca954x *data)
+{
+	if (data->idle_state >= 0) {
+		data->last_chan = pca954x_regval(data, (u8)(data->idle_state & 0xff));
+	} else {
+		/* Disconnect multiplexer */
+		data->last_chan = 0;
+	}
+	return i2c_smbus_write_byte(client, data->last_chan);
+}
+
 /*
  * I2C init/probing/exit functions
  */
@@ -411,7 +425,6 @@ static int pca954x_probe(struct i2c_client *client,
 	struct i2c_adapter *adap = client->adapter;
 	struct device *dev = &client->dev;
 	struct device_node *np = dev->of_node;
-	bool idle_disconnect_dt;
 	struct gpio_desc *gpio;
 	struct i2c_mux_core *muxc;
 	struct pca954x *data;
@@ -462,23 +475,24 @@ static int pca954x_probe(struct i2c_client *client,
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
@@ -531,8 +545,7 @@ static int pca954x_resume(struct device *dev)
 	struct i2c_mux_core *muxc = i2c_get_clientdata(client);
 	struct pca954x *data = i2c_mux_priv(muxc);
 
-	data->last_chan = 0;
-	return i2c_smbus_write_byte(client, 0);
+	return pca954x_init(client, data);
 }
 #endif
 
-- 
2.17.1

