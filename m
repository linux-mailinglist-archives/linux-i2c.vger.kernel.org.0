Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08116300CE4
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Jan 2021 20:56:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728684AbhAVTtM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Jan 2021 14:49:12 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:38532 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730534AbhAVT0G (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Jan 2021 14:26:06 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 22 Jan 2021 21:25:11 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 10MJP4vD019220;
        Fri, 22 Jan 2021 21:25:11 +0200
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     peda@axentia.se, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next v2 5/7] i2c: mux: mlxcpld: Extend driver to support word address space devices
Date:   Fri, 22 Jan 2021 21:25:00 +0200
Message-Id: <20210122192502.17645-6-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210122192502.17645-1-vadimp@nvidia.com>
References: <20210122192502.17645-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Extend driver to allow I2C routing control through CPLD devices with
word address space. Till now only CPLD devices with byte address space
have been supported.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
v1->v2:
 Comments pointed out by Peter:
 - Remove data buffer allocation from 'mlxcpld_mux' structure, do it on
   stack instead.
 - Do not use array pdata.adap_ids[] in mlxcpld_mux_reg_write() for
   channel assignment.
 - Return back 'regval' variable, used for channel assignment in
   mlxcpld_mux_select_chan().
 - Fix functionality validation in mlxcpld_mux_probe().
 - Fix comment for 'reg_size' field in mlxcpld_mux_plat_data' structure.
  Added by Vadim:
  - Change type of register select address to '__be16' to align with
    type in assignment in cpu_to_be16().
---
 drivers/i2c/muxes/i2c-mux-mlxcpld.c   | 54 ++++++++++++++++++++++++++++-------
 include/linux/platform_data/mlxcpld.h |  2 ++
 2 files changed, 46 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-mlxcpld.c b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
index b53f1479272d..4848dd4ff41a 100644
--- a/drivers/i2c/muxes/i2c-mux-mlxcpld.c
+++ b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
@@ -21,11 +21,13 @@
  * @last_chan - last register value
  * @client - I2C device client
  * @pdata: platform data
+ * @sel_reg_addr: mux select/deselect register address
  */
 struct mlxcpld_mux {
 	u8 last_chan;
 	struct i2c_client *client;
 	struct mlxcpld_mux_plat_data pdata;
+	__be16 sel_reg_addr;
 };
 
 /* MUX logic description.
@@ -60,24 +62,43 @@ struct mlxcpld_mux {
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
+	u8 buf[3];
+
+	switch (mux->pdata.reg_size) {
+	case 1:
+		data.byte = (chan < 0) ? 0 : chan;
+		return __i2c_smbus_xfer(adap, client->addr, client->flags,
+					I2C_SMBUS_WRITE, mux->pdata.sel_reg_addr,
+					I2C_SMBUS_BYTE_DATA, &data);
+	case 2:
+		memcpy(buf, &mux->sel_reg_addr, 2);
+		buf[2] = chan;
+		msg.addr = client->addr;
+		msg.buf = buf;
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
+	u8 regval = chan;
 	int err = 0;
 
+	if (mux->pdata.reg_size == 1)
+		regval += 1;
+
 	/* Only select the channel if its different from the last channel */
-	if (mux->last_chan != regval) {
+	if (mux->last_chan != chan) {
 		err = mlxcpld_mux_reg_write(muxc->parent, mux, regval);
 		mux->last_chan = err < 0 ? 0 : regval;
 	}
@@ -103,13 +124,24 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
 	struct i2c_mux_core *muxc;
 	int num, force;
 	struct mlxcpld_mux *data;
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
+		func = I2C_FUNC_I2C;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (!i2c_check_functionality(client->adapter, func))
 		return -ENODEV;
 
 	muxc = i2c_mux_alloc(client->adapter, &pdev->dev, CPLD_MUX_MAX_NCHANS,
@@ -122,6 +154,8 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
 	data = i2c_mux_priv(muxc);
 	data->client = client;
 	memcpy(&data->pdata, pdata, sizeof(*pdata));
+	/* Save mux select address for 16 bits transaction size. */
+	data->sel_reg_addr = cpu_to_be16(pdata->sel_reg_addr);
 	data->last_chan = 0; /* force the first selection */
 
 	/* Create an adapter for each channel. */
diff --git a/include/linux/platform_data/mlxcpld.h b/include/linux/platform_data/mlxcpld.h
index e6c18bf017dd..9cb2c3d8293e 100644
--- a/include/linux/platform_data/mlxcpld.h
+++ b/include/linux/platform_data/mlxcpld.h
@@ -14,11 +14,13 @@
  * @adap_ids - adapter array
  * @num_adaps - number of adapters
  * @sel_reg_addr - mux select register offset in CPLD space
+ * @reg_size: register size in bytes
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

