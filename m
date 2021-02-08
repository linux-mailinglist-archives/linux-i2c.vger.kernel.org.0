Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 339BD314032
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Feb 2021 21:18:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235781AbhBHUR0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Feb 2021 15:17:26 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:41607 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S236739AbhBHURO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 8 Feb 2021 15:17:14 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 8 Feb 2021 22:16:16 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 118KG8n8004438;
        Mon, 8 Feb 2021 22:16:16 +0200
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     peda@axentia.se, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next v5 4/6] i2c: mux: mlxcpld: Extend driver to support word address space devices
Date:   Mon,  8 Feb 2021 22:16:04 +0200
Message-Id: <20210208201606.10620-5-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210208201606.10620-1-vadimp@nvidia.com>
References: <20210208201606.10620-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Extend driver to allow I2C routing control through CPLD devices with
word address space. Till now only CPLD devices with byte address space
have been supported.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
v2->v3:
 Comments pointed out by Peter:
 - Do not change mlxcpld_mux_reg_write() argumnet "val" to "chan",
   since it is misleading for the one-byte case.
 - Drop cpu_to_be16() conversion from mlxcpld_mux_reg_write().
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
 drivers/i2c/muxes/i2c-mux-mlxcpld.c   | 47 +++++++++++++++++++++++++++++------
 include/linux/platform_data/mlxcpld.h |  2 ++
 2 files changed, 41 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-mlxcpld.c b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
index e99a7ad09886..10767ad4adb4 100644
--- a/drivers/i2c/muxes/i2c-mux-mlxcpld.c
+++ b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
@@ -63,19 +63,39 @@ static int mlxcpld_mux_reg_write(struct i2c_adapter *adap,
 				 struct mlxcpld_mux *mux, u32 val)
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
+		data.byte = val;
+		return __i2c_smbus_xfer(adap, client->addr, client->flags,
+					I2C_SMBUS_WRITE, mux->pdata.sel_reg_addr,
+					I2C_SMBUS_BYTE_DATA, &data);
+	case 2:
+		buf[0] = mux->pdata.sel_reg_addr >> 8;
+		buf[1] = mux->pdata.sel_reg_addr;
+		buf[2] = val;
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
-	u32 regval = chan + 1;
+	u32 regval = chan;
 	int err = 0;
 
+	if (mux->pdata.reg_size == 1)
+		regval += 1;
+
 	/* Only select the channel if its different from the last channel */
 	if (mux->last_val != regval) {
 		err = mlxcpld_mux_reg_write(muxc->parent, mux, regval);
@@ -103,12 +123,23 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
 	struct i2c_mux_core *muxc;
 	struct mlxcpld_mux *data;
 	int num, err;
+	u32 func;
 
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
diff --git a/include/linux/platform_data/mlxcpld.h b/include/linux/platform_data/mlxcpld.h
index 04d93c563c04..a7bee798d991 100644
--- a/include/linux/platform_data/mlxcpld.h
+++ b/include/linux/platform_data/mlxcpld.h
@@ -14,11 +14,13 @@
  * @chan_ids - channels array
  * @num_adaps - number of adapters
  * @sel_reg_addr - mux select register offset in CPLD space
+ * @reg_size: register size in bytes
  */
 struct mlxcpld_mux_plat_data {
 	int *chan_ids;
 	int num_adaps;
 	int sel_reg_addr;
+	u8 reg_size;
 };
 
 #endif /* _LINUX_I2C_MLXCPLD_H */
-- 
2.11.0

