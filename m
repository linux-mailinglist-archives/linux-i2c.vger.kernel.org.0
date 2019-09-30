Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 58AE1C1A5C
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2019 05:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729481AbfI3Dfq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 29 Sep 2019 23:35:46 -0400
Received: from inva020.nxp.com ([92.121.34.13]:37870 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728853AbfI3Dfo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 29 Sep 2019 23:35:44 -0400
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 4510B1A0453;
        Mon, 30 Sep 2019 05:35:41 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com [165.114.16.14])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 8F8D71A0C5E;
        Mon, 30 Sep 2019 05:35:37 +0200 (CEST)
Received: from titan.ap.freescale.net (TITAN.ap.freescale.net [10.192.208.233])
        by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id A50554030D;
        Mon, 30 Sep 2019 11:35:32 +0800 (SGT)
From:   Biwen Li <biwen.li@nxp.com>
To:     peda@axentia.se, leoyang.li@nxp.com, robh+dt@kernel.org,
        mark.rutland@arm.com
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Biwen Li <biwen.li@nxp.com>
Subject: [v2,1/2] i2c: pca954x: Add property to skip disabling PCA954x MUX device
Date:   Mon, 30 Sep 2019 11:25:02 +0800
Message-Id: <20190930032503.44425-1-biwen.li@nxp.com>
X-Mailer: git-send-email 2.9.5
X-Virus-Scanned: ClamAV using ClamSMTP
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On some Layerscape boards like LS2085ARDB and LS2088ARDB,
input pull-up resistors on PCA954x MUX device are missing on board,
So, if MUX are disabled after powered-on, input lines will float
leading to incorrect functionality.

Hence, PCA954x MUX device should never be turned-off after
power-on.

Add property to skip disabling PCA954x MUX device
if device tree contains "i2c-mux-never-disable"
for PCA954x device node.

Errata ID: E-00013 on board LS2085ARDB and LS2088ARDB
(The hardware bug found on board revision
Rev.B, Rev.C and Rev.D)

Signed-off-by: Biwen Li <biwen.li@nxp.com>
---
Change in v2:
	- update variable name
	  disable_mux->never_disable

 drivers/i2c/muxes/i2c-mux-pca954x.c | 37 +++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
index 923aa3a5a3dc..b4647b033163 100644
--- a/drivers/i2c/muxes/i2c-mux-pca954x.c
+++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
@@ -93,6 +93,11 @@ struct pca954x {
 	struct irq_domain *irq;
 	unsigned int irq_mask;
 	raw_spinlock_t lock;
+	/*
+	 * never disable value will write to control register of mux
+	 * to always enable mux
+	 */
+	u8 never_disable;
 };
 
 /* Provide specs for the PCA954x types we know about */
@@ -258,6 +263,11 @@ static int pca954x_deselect_mux(struct i2c_mux_core *muxc, u32 chan)
 	struct i2c_client *client = data->client;
 	s8 idle_state;
 
+	if (data->never_disable) {
+		data->last_chan = data->chip->nchans;
+		return pca954x_reg_write(muxc->parent, client, data->never_disable);
+	}
+
 	idle_state = READ_ONCE(data->idle_state);
 	if (idle_state >= 0)
 		/* Set the mux back to a predetermined channel */
@@ -462,16 +472,32 @@ static int pca954x_probe(struct i2c_client *client,
 		}
 	}
 
+	/* Errata ID E-00013 on board LS2088ARDB and LS2088ARDB:
+	 * The point here is that you must not disable a mux if there
+	 * are no pullups on the input or you mess up the I2C. This
+	 * needs to be put into the DTS really as the kernel cannot
+	 * know this otherwise.
+	 */
+
+	data->never_disable = np &&
+		of_property_read_bool(np, "i2c-mux-never-disable") &&
+		data->chip->muxtype == pca954x_ismux ?
+		data->chip->enable : 0;
+
 	/* Write the mux register at addr to verify
 	 * that the mux is in fact present. This also
 	 * initializes the mux to disconnected state.
 	 */
-	if (i2c_smbus_write_byte(client, 0) < 0) {
+	if (i2c_smbus_write_byte(client, data->never_disable) < 0) {
 		dev_warn(dev, "probe failed\n");
 		return -ENODEV;
 	}
 
-	data->last_chan = 0;		   /* force the first selection */
+	if (data->never_disable)
+		data->last_chan = data->chip->nchans;
+	else
+		data->last_chan = 0;               /* force the first selection */
+
 	data->idle_state = MUX_IDLE_AS_IS;
 
 	idle_disconnect_dt = np &&
@@ -531,8 +557,11 @@ static int pca954x_resume(struct device *dev)
 	struct i2c_mux_core *muxc = i2c_get_clientdata(client);
 	struct pca954x *data = i2c_mux_priv(muxc);
 
-	data->last_chan = 0;
-	return i2c_smbus_write_byte(client, 0);
+	if (data->never_disable)
+		data->last_chan = data->chip->nchans;
+	else
+		data->last_chan = 0;
+	return i2c_smbus_write_byte(client, data->never_disable);
 }
 #endif
 
-- 
2.17.1

