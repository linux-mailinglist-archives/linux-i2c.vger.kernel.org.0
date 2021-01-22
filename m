Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 903C0300CE3
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Jan 2021 20:56:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728594AbhAVTtC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Jan 2021 14:49:02 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:38536 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730533AbhAVT0G (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Jan 2021 14:26:06 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 22 Jan 2021 21:25:12 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 10MJP4vE019220;
        Fri, 22 Jan 2021 21:25:12 +0200
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     peda@axentia.se, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next v2 6/7] i2c: mux: mlxcpld: Extend supported mux number
Date:   Fri, 22 Jan 2021 21:25:01 +0200
Message-Id: <20210122192502.17645-7-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210122192502.17645-1-vadimp@nvidia.com>
References: <20210122192502.17645-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Allow to extend mux number supported by driver.
Currently it is limited by eight, which is not enough for new coming
Mellanox modular system with line cards, which require up to 64 mux
support.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
Reviewed-by: Michael Shych <michaelsh@nvidia.com>
---
v1->v2:
 Comments pointed out by Peter:
 - Remove introducing of 'base_nr' field.
 - Drop chan increment in mlxcpld_mux_select_chan().
 Added by Vadim:
 - Rename 'adaps_ids' array to 'chan_ids' array.
 - Drop forcing of adapter 'nr'.
---
 drivers/i2c/muxes/i2c-mux-mlxcpld.c   | 19 +++++--------------
 include/linux/platform_data/mlxcpld.h |  4 ++--
 2 files changed, 7 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-mlxcpld.c b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
index 4848dd4ff41a..7b37d59dc23b 100644
--- a/drivers/i2c/muxes/i2c-mux-mlxcpld.c
+++ b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
@@ -15,8 +15,6 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-#define CPLD_MUX_MAX_NCHANS	8
-
 /* mlxcpld_mux - mux control structure:
  * @last_chan - last register value
  * @client - I2C device client
@@ -24,7 +22,7 @@
  * @sel_reg_addr: mux select/deselect register address
  */
 struct mlxcpld_mux {
-	u8 last_chan;
+	int last_chan;
 	struct i2c_client *client;
 	struct mlxcpld_mux_plat_data pdata;
 	__be16 sel_reg_addr;
@@ -122,10 +120,9 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
 	struct mlxcpld_mux_plat_data *pdata = dev_get_platdata(&pdev->dev);
 	struct i2c_client *client = to_i2c_client(pdev->dev.parent);
 	struct i2c_mux_core *muxc;
-	int num, force;
 	struct mlxcpld_mux *data;
+	int num, err;
 	u32 func;
-	int err;
 
 	if (!pdata)
 		return -EINVAL;
@@ -144,7 +141,7 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
 	if (!i2c_check_functionality(client->adapter, func))
 		return -ENODEV;
 
-	muxc = i2c_mux_alloc(client->adapter, &pdev->dev, CPLD_MUX_MAX_NCHANS,
+	muxc = i2c_mux_alloc(client->adapter, &pdev->dev, pdata->num_adaps,
 			     sizeof(*data), 0, mlxcpld_mux_select_chan,
 			     mlxcpld_mux_deselect);
 	if (!muxc)
@@ -159,14 +156,8 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
 	data->last_chan = 0; /* force the first selection */
 
 	/* Create an adapter for each channel. */
-	for (num = 0; num < CPLD_MUX_MAX_NCHANS; num++) {
-		if (num >= pdata->num_adaps)
-			/* discard unconfigured channels */
-			break;
-
-		force = pdata->adap_ids[num];
-
-		err = i2c_mux_add_adapter(muxc, force, num, 0);
+	for (num = 0; num < pdata->num_adaps; num++) {
+		err = i2c_mux_add_adapter(muxc, 0, pdata->chan_ids[num], 0);
 		if (err)
 			goto virt_reg_failed;
 	}
diff --git a/include/linux/platform_data/mlxcpld.h b/include/linux/platform_data/mlxcpld.h
index 9cb2c3d8293e..a7bee798d991 100644
--- a/include/linux/platform_data/mlxcpld.h
+++ b/include/linux/platform_data/mlxcpld.h
@@ -11,13 +11,13 @@
 /* Platform data for the CPLD I2C multiplexers */
 
 /* mlxcpld_mux_plat_data - per mux data, used with i2c_register_board_info
- * @adap_ids - adapter array
+ * @chan_ids - channels array
  * @num_adaps - number of adapters
  * @sel_reg_addr - mux select register offset in CPLD space
  * @reg_size: register size in bytes
  */
 struct mlxcpld_mux_plat_data {
-	int *adap_ids;
+	int *chan_ids;
 	int num_adaps;
 	int sel_reg_addr;
 	u8 reg_size;
-- 
2.11.0

