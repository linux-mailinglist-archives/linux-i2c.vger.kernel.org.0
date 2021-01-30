Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E47EE309756
	for <lists+linux-i2c@lfdr.de>; Sat, 30 Jan 2021 18:37:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbhA3Rfp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 30 Jan 2021 12:35:45 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:42616 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S231765AbhA3Rfo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 30 Jan 2021 12:35:44 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 30 Jan 2021 19:34:55 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 10UHYnGq010866;
        Sat, 30 Jan 2021 19:34:55 +0200
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     peda@axentia.se, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next v3 5/6] i2c: mux: mlxcpld: Extend supported mux number
Date:   Sat, 30 Jan 2021 19:34:46 +0200
Message-Id: <20210130173447.26328-6-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210130173447.26328-1-vadimp@nvidia.com>
References: <20210130173447.26328-1-vadimp@nvidia.com>
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
 drivers/i2c/muxes/i2c-mux-mlxcpld.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-mlxcpld.c b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
index 71d4b8813704..5e0672f9979b 100644
--- a/drivers/i2c/muxes/i2c-mux-mlxcpld.c
+++ b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
@@ -15,8 +15,6 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-#define CPLD_MUX_MAX_NCHANS	8
-
 /* mlxcpld_mux - mux control structure:
  * @last_val - last selected register value or -1 if mux deselected
  * @client - I2C device client
@@ -121,10 +119,9 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
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
@@ -143,7 +140,7 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
 	if (!i2c_check_functionality(client->adapter, func))
 		return -ENODEV;
 
-	muxc = i2c_mux_alloc(client->adapter, &pdev->dev, CPLD_MUX_MAX_NCHANS,
+	muxc = i2c_mux_alloc(client->adapter, &pdev->dev, pdata->num_adaps,
 			     sizeof(*data), 0, mlxcpld_mux_select_chan,
 			     mlxcpld_mux_deselect);
 	if (!muxc)
@@ -156,14 +153,8 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
 	data->last_val = -1; /* force the first selection */
 
 	/* Create an adapter for each channel. */
-	for (num = 0; num < CPLD_MUX_MAX_NCHANS; num++) {
-		if (num >= pdata->num_adaps)
-			/* discard unconfigured channels */
-			break;
-
-		force = pdata->chan_ids[num];
-
-		err = i2c_mux_add_adapter(muxc, force, num, 0);
+	for (num = 0; num < pdata->num_adaps; num++) {
+		err = i2c_mux_add_adapter(muxc, 0, pdata->chan_ids[num], 0);
 		if (err)
 			goto virt_reg_failed;
 	}
-- 
2.11.0

