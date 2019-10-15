Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF232D6E6C
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2019 06:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725938AbfJOE7j (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Oct 2019 00:59:39 -0400
Received: from inva020.nxp.com ([92.121.34.13]:49602 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726825AbfJOE7j (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 15 Oct 2019 00:59:39 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 35EBE1A043F;
        Tue, 15 Oct 2019 06:59:36 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1488D1A00FD;
        Tue, 15 Oct 2019 06:59:32 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id F12394030B;
        Tue, 15 Oct 2019 12:59:26 +0800 (SGT)
From:   Biwen Li <biwen.li@nxp.com>
To:     peda@axentia.se, leoyang.li@nxp.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Biwen Li <biwen.li@nxp.com>
Subject: [v2,2/2] i2c: mux: pca954x: add property idle-state
Date:   Tue, 15 Oct 2019 12:48:39 +0800
Message-Id: <20191015044839.23746-2-biwen.li@nxp.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20191015044839.23746-1-biwen.li@nxp.com>
References: <20191015044839.23746-1-biwen.li@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

This adds property idle-state

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
Change in v2:
	- update subject and description
	- add property idle-state

 drivers/i2c/muxes/i2c-mux-pca954x.c | 47 ++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 923aa3a5a3dc..8ec586342b92 100644
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
@@ -402,6 +402,25 @@ static void pca954x_cleanup(struct i2c_mux_core *muxc)
 	i2c_mux_del_adapters(muxc);
 }
 
+static int pca954x_init(struct i2c_client *client, struct pca954x *data)
+{
+	/*
+	 * Write the mux register at addr to verify
+	 * that the mux is in fact present. This also
+	 * initializes the mux to disconnected state.
+	 */
+	if (data->idle_state >= 0) {
+		/* Always enable multiplexer */
+		if (data->chip->muxtype == pca954x_ismux)
+			data->last_chan = data->idle_state | data->chip->enable;
+		else
+			data->last_chan = 1 << data->idle_state;
+	} else {
+		/* Disconnect multiplexer */
+		data->last_chan = 0; /* force the first selection */
+	}
+	return i2c_smbus_write_byte(client, data->last_chan);
+}
 /*
  * I2C init/probing/exit functions
  */
@@ -411,7 +430,6 @@ static int pca954x_probe(struct i2c_client *client,
 	struct i2c_adapter *adap = client->adapter;
 	struct device *dev = &client->dev;
 	struct device_node *np = dev->of_node;
-	bool idle_disconnect_dt;
 	struct gpio_desc *gpio;
 	struct i2c_mux_core *muxc;
 	struct pca954x *data;
@@ -462,22 +480,18 @@ static int pca954x_probe(struct i2c_client *client,
 		}
 	}
 
-	/* Write the mux register at addr to verify
-	 * that the mux is in fact present. This also
-	 * initializes the mux to disconnected state.
-	 */
-	if (i2c_smbus_write_byte(client, 0) < 0) {
+	if (of_property_read_u32(np, "idle-state", &data->idle_state))
+		data->idle_state = MUX_IDLE_AS_IS;
+
+	if (of_property_read_bool(np, "i2c-mux-idle-disconnect"))
+		data->idle_state = MUX_IDLE_DISCONNECT;
+
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
 
 	ret = pca954x_irq_setup(muxc);
 	if (ret)
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

