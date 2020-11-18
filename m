Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA3A2B7FA9
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Nov 2020 15:46:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727029AbgKROo3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Nov 2020 09:44:29 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:48214 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727022AbgKROo2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Nov 2020 09:44:28 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 18 Nov 2020 16:44:23 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 0AIEiIHv008040;
        Wed, 18 Nov 2020 16:44:23 +0200
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     wsa@the-dreams.de
Cc:     peda@axentia.se, linux-i2c@vger.kernel.org,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [Re-send: PATCH i2c-next 4/6] i2c: mux: mlxcpld: Convert driver to platform driver
Date:   Wed, 18 Nov 2020 16:44:14 +0200
Message-Id: <20201118144416.184120-5-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201118144416.184120-1-vadimp@nvidia.com>
References: <20201118144416.184120-1-vadimp@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert driver from 'i2c' to 'platform'.
The motivation is to avoid I2C addressing conflict between
‘i2c-mux-cpld’ driver, providing mux selection and deselection through
CPLD ‘mux control’ register, and CPLD host driver. The CPLD is I2C
device and is multi-functional device performing logic for different
components, like LED, ‘hwmon’, interrupt control, watchdog etcetera.
For such configuration CPLD should be host I2C device, connected to the
relevant I2C bus with the relevant I2C address and all others component
drivers are supposed to be its children.
The hierarchy in such case will be like in the below example:
ls /sys/bus/i2c/devices/44-0032
i2c-mux-mlxcpld.44  leds-mlxreg.44  mlxreg-io.44
ls /sys/bus/i2c/devices/44-0032/i2c-mux-mlxcpld.44
channel-0, …,  channel-X

Currently this driver is not activated by any kernel driver,
so this conversion doesn’t affect any user.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
 drivers/i2c/muxes/i2c-mux-mlxcpld.c | 62 +++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 34 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-mlxcpld.c b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
index 3d894cfb19df..6bb8caecf8e8 100644
--- a/drivers/i2c/muxes/i2c-mux-mlxcpld.c
+++ b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
@@ -20,10 +20,12 @@
 /* mlxcpld_mux - mux control structure:
  * @last_chan - last register value
  * @client - I2C device client
+ * @pdata: platform data
  */
 struct mlxcpld_mux {
 	u8 last_chan;
 	struct i2c_client *client;
+	struct mlxcpld_mux_plat_data pdata;
 };
 
 /* MUX logic description.
@@ -54,37 +56,30 @@ struct mlxcpld_mux {
  *
  */
 
-static const struct i2c_device_id mlxcpld_mux_id[] = {
-	{ "mlxcpld_mux_module", 0 },
-	{ }
-};
-MODULE_DEVICE_TABLE(i2c, mlxcpld_mux_id);
-
 /* Write to mux register. Don't use i2c_transfer() and i2c_smbus_xfer()
  * for this as they will try to lock adapter a second time.
  */
 static int mlxcpld_mux_reg_write(struct i2c_adapter *adap,
-				 struct i2c_client *client, u8 val)
+				 struct mlxcpld_mux *mux, u8 val)
 {
-	struct mlxcpld_mux_plat_data *pdata = dev_get_platdata(&client->dev);
+	struct i2c_client *client = mux->client;
 	union i2c_smbus_data data = { .byte = val };
 
 	return __i2c_smbus_xfer(adap, client->addr, client->flags,
-				I2C_SMBUS_WRITE, pdata->sel_reg_addr,
+				I2C_SMBUS_WRITE, mux->pdata.sel_reg_addr,
 				I2C_SMBUS_BYTE_DATA, &data);
 }
 
 static int mlxcpld_mux_select_chan(struct i2c_mux_core *muxc, u32 chan)
 {
-	struct mlxcpld_mux *data = i2c_mux_priv(muxc);
-	struct i2c_client *client = data->client;
+	struct mlxcpld_mux *mux = i2c_mux_priv(muxc);
 	u8 regval = chan + 1;
 	int err = 0;
 
 	/* Only select the channel if its different from the last channel */
-	if (data->last_chan != regval) {
-		err = mlxcpld_mux_reg_write(muxc->parent, client, regval);
-		data->last_chan = err < 0 ? 0 : regval;
+	if (mux->last_chan != regval) {
+		err = mlxcpld_mux_reg_write(muxc->parent, mux, regval);
+		mux->last_chan = err < 0 ? 0 : regval;
 	}
 
 	return err;
@@ -92,21 +87,19 @@ static int mlxcpld_mux_select_chan(struct i2c_mux_core *muxc, u32 chan)
 
 static int mlxcpld_mux_deselect(struct i2c_mux_core *muxc, u32 chan)
 {
-	struct mlxcpld_mux *data = i2c_mux_priv(muxc);
-	struct i2c_client *client = data->client;
+	struct mlxcpld_mux *mux = i2c_mux_priv(muxc);
 
 	/* Deselect active channel */
-	data->last_chan = 0;
+	mux->last_chan = -1;
 
-	return mlxcpld_mux_reg_write(muxc->parent, client, data->last_chan);
+	return mlxcpld_mux_reg_write(muxc->parent, mux, mux->last_chan);
 }
 
 /* Probe/reomove functions */
-static int mlxcpld_mux_probe(struct i2c_client *client,
-			     const struct i2c_device_id *id)
+static int mlxcpld_mux_probe(struct platform_device *pdev)
 {
-	struct i2c_adapter *adap = client->adapter;
-	struct mlxcpld_mux_plat_data *pdata = dev_get_platdata(&client->dev);
+	struct mlxcpld_mux_plat_data *pdata = dev_get_platdata(&pdev->dev);
+	struct i2c_client *client = to_i2c_client(pdev->dev.parent);
 	struct i2c_mux_core *muxc;
 	int num, force;
 	struct mlxcpld_mux *data;
@@ -115,18 +108,20 @@ static int mlxcpld_mux_probe(struct i2c_client *client,
 	if (!pdata)
 		return -EINVAL;
 
-	if (!i2c_check_functionality(adap, I2C_FUNC_SMBUS_WRITE_BYTE_DATA))
+	if (!i2c_check_functionality(client->adapter,
+				     I2C_FUNC_SMBUS_WRITE_BYTE_DATA))
 		return -ENODEV;
 
-	muxc = i2c_mux_alloc(adap, &client->dev, CPLD_MUX_MAX_NCHANS,
+	muxc = i2c_mux_alloc(client->adapter, &pdev->dev, CPLD_MUX_MAX_NCHANS,
 			     sizeof(*data), 0, mlxcpld_mux_select_chan,
 			     mlxcpld_mux_deselect);
 	if (!muxc)
 		return -ENOMEM;
 
+	platform_set_drvdata(pdev, muxc);
 	data = i2c_mux_priv(muxc);
-	i2c_set_clientdata(client, muxc);
 	data->client = client;
+	memcpy(&data->pdata, pdata, sizeof(*pdata));
 	data->last_chan = 0; /* force the first selection */
 
 	/* Create an adapter for each channel. */
@@ -149,24 +144,23 @@ static int mlxcpld_mux_probe(struct i2c_client *client,
 	return err;
 }
 
-static int mlxcpld_mux_remove(struct i2c_client *client)
+static int mlxcpld_mux_remove(struct platform_device *pdev)
 {
-	struct i2c_mux_core *muxc = i2c_get_clientdata(client);
+	struct i2c_mux_core *muxc = platform_get_drvdata(pdev);
 
 	i2c_mux_del_adapters(muxc);
 	return 0;
 }
 
-static struct i2c_driver mlxcpld_mux_driver = {
-	.driver		= {
-		.name	= "mlxcpld-mux",
+static struct platform_driver mlxcpld_mux_driver = {
+	.driver = {
+		.name = "i2c-mux-mlxcpld",
 	},
-	.probe		= mlxcpld_mux_probe,
-	.remove		= mlxcpld_mux_remove,
-	.id_table	= mlxcpld_mux_id,
+	.probe = mlxcpld_mux_probe,
+	.remove = mlxcpld_mux_remove,
 };
 
-module_i2c_driver(mlxcpld_mux_driver);
+module_platform_driver(mlxcpld_mux_driver);
 
 MODULE_AUTHOR("Michael Shych (michaels@mellanox.com)");
 MODULE_DESCRIPTION("Mellanox I2C-CPLD-MUX driver");
-- 
2.11.0

