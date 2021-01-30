Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A820309755
	for <lists+linux-i2c@lfdr.de>; Sat, 30 Jan 2021 18:37:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229468AbhA3Rfo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 30 Jan 2021 12:35:44 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:42605 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229832AbhA3Rfo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 30 Jan 2021 12:35:44 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 30 Jan 2021 19:34:52 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 10UHYnGn010866;
        Sat, 30 Jan 2021 19:34:52 +0200
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     peda@axentia.se, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next v3 2/6] i2c: mux: mlxcpld: Prepare mux selection infrastructure for two-byte support
Date:   Sat, 30 Jan 2021 19:34:43 +0200
Message-Id: <20210130173447.26328-3-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210130173447.26328-1-vadimp@nvidia.com>
References: <20210130173447.26328-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Allow to program register value zero to the mux register, which is
required for word address mux register space support.
Change key selector type from 'unsigned short' to 'integer' in order to
allow to set it to -1 on deselection.
Rename key selector field from 'last_chan' to 'last_val', since this
fields keeps actually selector value and not channel number.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/i2c/muxes/i2c-mux-mlxcpld.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-mlxcpld.c b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
index b53f1479272d..113ad84cdd94 100644
--- a/drivers/i2c/muxes/i2c-mux-mlxcpld.c
+++ b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
@@ -18,12 +18,12 @@
 #define CPLD_MUX_MAX_NCHANS	8
 
 /* mlxcpld_mux - mux control structure:
- * @last_chan - last register value
+ * @last_val - last selected register value or -1 if mux deselected
  * @client - I2C device client
  * @pdata: platform data
  */
 struct mlxcpld_mux {
-	u8 last_chan;
+	int last_val;
 	struct i2c_client *client;
 	struct mlxcpld_mux_plat_data pdata;
 };
@@ -60,7 +60,7 @@ struct mlxcpld_mux {
  * for this as they will try to lock adapter a second time.
  */
 static int mlxcpld_mux_reg_write(struct i2c_adapter *adap,
-				 struct mlxcpld_mux *mux, u8 val)
+				 struct mlxcpld_mux *mux, u32 val)
 {
 	struct i2c_client *client = mux->client;
 	union i2c_smbus_data data = { .byte = val };
@@ -73,13 +73,13 @@ static int mlxcpld_mux_reg_write(struct i2c_adapter *adap,
 static int mlxcpld_mux_select_chan(struct i2c_mux_core *muxc, u32 chan)
 {
 	struct mlxcpld_mux *mux = i2c_mux_priv(muxc);
-	u8 regval = chan + 1;
+	u32 regval = chan + 1;
 	int err = 0;
 
 	/* Only select the channel if its different from the last channel */
-	if (mux->last_chan != regval) {
+	if (mux->last_val != regval) {
 		err = mlxcpld_mux_reg_write(muxc->parent, mux, regval);
-		mux->last_chan = err < 0 ? 0 : regval;
+		mux->last_val = err < 0 ? -1 : regval;
 	}
 
 	return err;
@@ -90,9 +90,9 @@ static int mlxcpld_mux_deselect(struct i2c_mux_core *muxc, u32 chan)
 	struct mlxcpld_mux *mux = i2c_mux_priv(muxc);
 
 	/* Deselect active channel */
-	mux->last_chan = 0;
+	mux->last_val = -1;
 
-	return mlxcpld_mux_reg_write(muxc->parent, mux, mux->last_chan);
+	return mlxcpld_mux_reg_write(muxc->parent, mux, 0);
 }
 
 /* Probe/reomove functions */
@@ -122,7 +122,7 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
 	data = i2c_mux_priv(muxc);
 	data->client = client;
 	memcpy(&data->pdata, pdata, sizeof(*pdata));
-	data->last_chan = 0; /* force the first selection */
+	data->last_val = -1; /* force the first selection */
 
 	/* Create an adapter for each channel. */
 	for (num = 0; num < CPLD_MUX_MAX_NCHANS; num++) {
-- 
2.11.0

