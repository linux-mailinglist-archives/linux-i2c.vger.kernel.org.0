Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DC602B7EA4
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Nov 2020 14:54:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726389AbgKRNuJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Nov 2020 08:50:09 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:47746 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726625AbgKRNuJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Nov 2020 08:50:09 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 18 Nov 2020 15:50:04 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 0AIDnxsW024731;
        Wed, 18 Nov 2020 15:50:04 +0200
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, Vadim Pasternak <vadimp@nvidia.com>
Subject: [Re-send: PATCH i2c-next 5/6] i2c: mux: mlxcpld: Extend driver to support word address space devices
Date:   Wed, 18 Nov 2020 15:49:56 +0200
Message-Id: <20201118134957.182779-6-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201118134957.182779-1-vadimp@nvidia.com>
References: <20201118134957.182779-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Extend driver to allow I2C routing control through CPLD devices with
word address space. Till now only CPLD devices with byte address space
have been supported.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/i2c/muxes/i2c-mux-mlxcpld.c   | 57 +++++++++++++++++++++++++++--------
 include/linux/platform_data/mlxcpld.h |  2 ++
 2 files changed, 47 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-mlxcpld.c b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
index 6bb8caecf8e8..c76180919fc3 100644
--- a/drivers/i2c/muxes/i2c-mux-mlxcpld.c
+++ b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
@@ -21,11 +21,13 @@
  * @last_chan - last register value
  * @client - I2C device client
  * @pdata: platform data
+ * @sel_buf: I2C message buffer for mux select 16 bits transactions
  */
 struct mlxcpld_mux {
 	u8 last_chan;
 	struct i2c_client *client;
 	struct mlxcpld_mux_plat_data pdata;
+	u8 sel_buf[3];
 };
 
 /* MUX logic description.
@@ -60,26 +62,42 @@ struct mlxcpld_mux {
  * for this as they will try to lock adapter a second time.
  */
 static int mlxcpld_mux_reg_write(struct i2c_adapter *adap,
-				 struct mlxcpld_mux *mux, u8 val)
+				 struct mlxcpld_mux *mux, int chan)
 {
 	struct i2c_client *client = mux->client;
-	union i2c_smbus_data data = { .byte = val };
-
-	return __i2c_smbus_xfer(adap, client->addr, client->flags,
-				I2C_SMBUS_WRITE, mux->pdata.sel_reg_addr,
-				I2C_SMBUS_BYTE_DATA, &data);
+	union i2c_smbus_data data;
+	struct i2c_msg msg;
+
+	switch (mux->pdata.reg_size) {
+	case 1:
+		data.byte = (chan < 0) ? 0 : chan;
+		return __i2c_smbus_xfer(adap, client->addr, client->flags,
+					I2C_SMBUS_WRITE,
+					mux->pdata.sel_reg_addr,
+					I2C_SMBUS_BYTE_DATA, &data);
+	case 2:
+		mux->sel_buf[mux->pdata.reg_size] = (chan < 0) ? 0 :
+						    mux->pdata.adap_ids[chan];
+		msg.addr = client->addr;
+		msg.buf = mux->sel_buf;
+		msg.len = mux->pdata.reg_size + 1;
+		msg.flags = 0;
+		return __i2c_transfer(adap, &msg, 1);
+	default:
+		return -EINVAL;
+	}
 }
 
 static int mlxcpld_mux_select_chan(struct i2c_mux_core *muxc, u32 chan)
 {
 	struct mlxcpld_mux *mux = i2c_mux_priv(muxc);
-	u8 regval = chan + 1;
 	int err = 0;
 
 	/* Only select the channel if its different from the last channel */
-	if (mux->last_chan != regval) {
-		err = mlxcpld_mux_reg_write(muxc->parent, mux, regval);
-		mux->last_chan = err < 0 ? 0 : regval;
+	chan++;
+	if (mux->last_chan != chan) {
+		err = mlxcpld_mux_reg_write(muxc->parent, mux, chan);
+		mux->last_chan = err < 0 ? 0 : chan;
 	}
 
 	return err;
@@ -103,13 +121,26 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
 	struct i2c_mux_core *muxc;
 	int num, force;
 	struct mlxcpld_mux *data;
+	u16 sel_reg_addr = 0;
+	u32 func;
 	int err;
 
 	if (!pdata)
 		return -EINVAL;
 
-	if (!i2c_check_functionality(client->adapter,
-				     I2C_FUNC_SMBUS_WRITE_BYTE_DATA))
+	switch (pdata->reg_size) {
+	case 1:
+		func = I2C_FUNC_SMBUS_WRITE_BYTE_DATA;
+		break;
+	case 2:
+		func = I2C_FUNC_SMBUS_WRITE_WORD_DATA;
+		sel_reg_addr = cpu_to_be16(pdata->sel_reg_addr);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (!i2c_check_functionality(client->adapter, func))
 		return -ENODEV;
 
 	muxc = i2c_mux_alloc(client->adapter, &pdev->dev, CPLD_MUX_MAX_NCHANS,
@@ -122,6 +153,8 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
 	data = i2c_mux_priv(muxc);
 	data->client = client;
 	memcpy(&data->pdata, pdata, sizeof(*pdata));
+	/* Save mux select address for 16 bits transaction size. */
+	memcpy(data->sel_buf, &sel_reg_addr, 2);
 	data->last_chan = 0; /* force the first selection */
 
 	/* Create an adapter for each channel. */
diff --git a/include/linux/platform_data/mlxcpld.h b/include/linux/platform_data/mlxcpld.h
index e6c18bf017dd..da4f7e8f5721 100644
--- a/include/linux/platform_data/mlxcpld.h
+++ b/include/linux/platform_data/mlxcpld.h
@@ -14,11 +14,13 @@
  * @adap_ids - adapter array
  * @num_adaps - number of adapters
  * @sel_reg_addr - mux select register offset in CPLD space
+ * @reg_size: register size in bytes (default 0 - 1 byte data, 1 - 2 bytes data
  */
 struct mlxcpld_mux_plat_data {
 	int *adap_ids;
 	int num_adaps;
 	int sel_reg_addr;
+	u8 reg_size;
 };
 
 #endif /* _LINUX_I2C_MLXCPLD_H */
-- 
2.11.0

