Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A85E22EB650
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Jan 2021 00:35:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbhAEXej (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Jan 2021 18:34:39 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:37852 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727303AbhAEXej (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Jan 2021 18:34:39 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 6 Jan 2021 01:33:49 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 105NXnID018091;
        Wed, 6 Jan 2021 01:33:49 +0200
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     peda@axentia.se, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next v2 1/1] i2c: mlxcpld: Add support for I2C bus frequency setting
Date:   Wed,  6 Jan 2021 01:33:47 +0200
Message-Id: <20210105233347.459-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add support for I2C bus frequency setting according to the specific
system capability. This capability is obtained from CPLD frequency
setting register, which could be provided through the platform data.
If such register is provided, it specifies minimal I2C bus frequency
to be used for the devices attached to the I2C bus. Supported
freqeuncies are 100KHz, 400KHz, 1MHz, while 100KHz is the default.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
v1->v2:
 - Fix "signedness" warning.
---
 drivers/i2c/busses/i2c-mlxcpld.c | 63 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 62 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mlxcpld.c b/drivers/i2c/busses/i2c-mlxcpld.c
index 9e45214d1eb6..4e0b7c2882ce 100644
--- a/drivers/i2c/busses/i2c-mlxcpld.c
+++ b/drivers/i2c/busses/i2c-mlxcpld.c
@@ -11,7 +11,9 @@
 #include <linux/io.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/platform_data/mlxreg.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 
 /* General defines */
 #define MLXPLAT_CPLD_LPC_I2C_BASE_ADDR	0x2000
@@ -46,6 +48,16 @@
 #define MLXCPLD_LPCI2C_ACK_IND		1
 #define MLXCPLD_LPCI2C_NACK_IND		2
 
+#define MLXCPLD_I2C_FREQ_1000KHZ_SET	0x04
+#define MLXCPLD_I2C_FREQ_400KHZ_SET	0x0f
+#define MLXCPLD_I2C_FREQ_100KHZ_SET	0x42
+
+enum mlxcpld_i2c_frequency {
+	MLXCPLD_I2C_FREQ_1000KHZ = 1,
+	MLXCPLD_I2C_FREQ_400KHZ = 2,
+	MLXCPLD_I2C_FREQ_100KHZ = 3,
+};
+
 struct  mlxcpld_i2c_curr_xfer {
 	u8 cmd;
 	u8 addr_width;
@@ -463,8 +475,45 @@ static struct i2c_adapter mlxcpld_i2c_adapter = {
 	.nr		= MLXCPLD_I2C_BUS_NUM,
 };
 
+static int
+mlxcpld_i2c_set_frequency(struct mlxcpld_i2c_priv *priv,
+			  struct mlxreg_core_hotplug_platform_data *pdata)
+{
+	struct mlxreg_core_item *item = pdata->items;
+	struct mlxreg_core_data *data;
+	u32 regval;
+	u8 freq;
+	int err;
+
+	if (!item)
+		return 0;
+
+	/* Read frequency setting. */
+	data = item->data;
+	err = regmap_read(pdata->regmap, data->reg, &regval);
+	if (err)
+		return err;
+
+	/* Set frequency only if it is not 100KHz, which is default. */
+	switch ((data->reg & data->mask) >> data->bit) {
+	case MLXCPLD_I2C_FREQ_1000KHZ:
+		freq = MLXCPLD_I2C_FREQ_1000KHZ_SET;
+		break;
+	case MLXCPLD_I2C_FREQ_400KHZ:
+		freq = MLXCPLD_I2C_FREQ_400KHZ_SET;
+		break;
+	default:
+		return 0;
+	}
+
+	mlxcpld_i2c_write_comm(priv, MLXCPLD_LPCI2C_HALF_CYC_REG, &freq, 1);
+
+	return 0;
+}
+
 static int mlxcpld_i2c_probe(struct platform_device *pdev)
 {
+	struct mlxreg_core_hotplug_platform_data *pdata;
 	struct mlxcpld_i2c_priv *priv;
 	int err;
 	u8 val;
@@ -479,6 +528,14 @@ static int mlxcpld_i2c_probe(struct platform_device *pdev)
 	priv->dev = &pdev->dev;
 	priv->base_addr = MLXPLAT_CPLD_LPC_I2C_BASE_ADDR;
 
+	/* Set I2C bus frequency if platform data provides this info. */
+	pdata = dev_get_platdata(&pdev->dev);
+	if (pdata) {
+		err = mlxcpld_i2c_set_frequency(priv, pdata);
+		if (err)
+			goto mlxcpld_i2_probe_failed;
+	}
+
 	/* Register with i2c layer */
 	mlxcpld_i2c_adapter.timeout = usecs_to_jiffies(MLXCPLD_I2C_XFER_TO);
 	/* Read capability register */
@@ -497,8 +554,12 @@ static int mlxcpld_i2c_probe(struct platform_device *pdev)
 
 	err = i2c_add_numbered_adapter(&priv->adap);
 	if (err)
-		mutex_destroy(&priv->lock);
+		goto mlxcpld_i2_probe_failed;
 
+	return 0;
+
+mlxcpld_i2_probe_failed:
+	mutex_destroy(&priv->lock);
 	return err;
 }
 
-- 
2.11.0

