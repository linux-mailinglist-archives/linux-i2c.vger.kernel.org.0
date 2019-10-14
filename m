Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AB4A2D6171
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2019 13:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730598AbfJNLhB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Oct 2019 07:37:01 -0400
Received: from inva021.nxp.com ([92.121.34.21]:47766 "EHLO inva021.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730178AbfJNLhA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 14 Oct 2019 07:37:00 -0400
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 23E3A200194;
        Mon, 14 Oct 2019 13:36:58 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 3914320019B;
        Mon, 14 Oct 2019 13:36:54 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 1F90E402E2;
        Mon, 14 Oct 2019 19:36:49 +0800 (SGT)
From:   Biwen Li <biwen.li@nxp.com>
To:     peda@axentia.se, leoyang.li@nxp.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Biwen Li <biwen.li@nxp.com>
Subject: [PATCH 2/2] i2c: mux: pca954x: replace property i2c-mux-idle-disconnect
Date:   Mon, 14 Oct 2019 19:25:58 +0800
Message-Id: <20191014112558.3881-2-biwen.li@nxp.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20191014112558.3881-1-biwen.li@nxp.com>
References: <20191014112558.3881-1-biwen.li@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This replaces property i2c-mux-idle-disconnect with idle-state

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
 drivers/i2c/muxes/i2c-mux-pca954x.c | 44 ++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 923aa3a5a3dc..a330929c4d67 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -86,7 +86,7 @@ struct pca954x {
 
 	u8 last_chan;		/* last register value */
 	/* MUX_IDLE_AS_IS, MUX_IDLE_DISCONNECT or >= 0 for channel */
-	s8 idle_state;
+	s32 idle_state;
 
 	struct i2c_client *client;
 
@@ -256,7 +256,7 @@ static int pca954x_deselect_mux(struct i2c_mux_core *muxc, u32 chan)
 {
 	struct pca954x *data = i2c_mux_priv(muxc);
 	struct i2c_client *client = data->client;
-	s8 idle_state;
+	s32 idle_state;
 
 	idle_state = READ_ONCE(data->idle_state);
 	if (idle_state >= 0)
@@ -411,7 +411,6 @@ static int pca954x_probe(struct i2c_client *client,
 	struct i2c_adapter *adap = client->adapter;
 	struct device *dev = &client->dev;
 	struct device_node *np = dev->of_node;
-	bool idle_disconnect_dt;
 	struct gpio_desc *gpio;
 	struct i2c_mux_core *muxc;
 	struct pca954x *data;
@@ -462,22 +461,31 @@ static int pca954x_probe(struct i2c_client *client,
 		}
 	}
 
+	if (of_property_read_u32(np, "idle-state", &data->idle_state))
+		data->idle_state = MUX_IDLE_AS_IS;
+
 	/* Write the mux register at addr to verify
 	 * that the mux is in fact present. This also
 	 * initializes the mux to disconnected state.
 	 */
-	if (i2c_smbus_write_byte(client, 0) < 0) {
+	if (data->idle_state >= 0){
+		data->last_chan = data->idle_state;
+		/* Always enable multiplexer */
+		ret = i2c_smbus_write_byte(client, data->last_chan |
+				(data->chip->muxtype == pca954x_ismux ?
+				 data->chip->enable : 0));
+	}
+	else{
+		data->last_chan = 0;		   /* force the first selection */
+		/* Disconnect multiplexer */
+		ret = i2c_smbus_write_byte(client, data->last_chan);
+	}
+
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
 
 	ret = pca954x_irq_setup(muxc);
 	if (ret)
@@ -531,8 +539,18 @@ static int pca954x_resume(struct device *dev)
 	struct i2c_mux_core *muxc = i2c_get_clientdata(client);
 	struct pca954x *data = i2c_mux_priv(muxc);
 
-	data->last_chan = 0;
-	return i2c_smbus_write_byte(client, 0);
+	if (data->idle_state >= 0){
+		data->last_chan = data->idle_state;
+		/* Always enable multiplexer */
+		return i2c_smbus_write_byte(client, data->last_chan |
+				(data->chip->muxtype == pca954x_ismux ?
+				 data->chip->enable : 0));
+	}
+	else{
+		data->last_chan = 0;
+		/* Disconnect multiplexer */
+		return i2c_smbus_write_byte(client, data->last_chan);
+	}
 }
 #endif
 
-- 
2.17.1

