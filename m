Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDA2030F7BD
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Feb 2021 17:26:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237901AbhBDQ00 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 4 Feb 2021 11:26:26 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:49681 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S237942AbhBDQZr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 4 Feb 2021 11:25:47 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 4 Feb 2021 18:24:56 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 114GOrHE012325;
        Thu, 4 Feb 2021 18:24:56 +0200
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     peda@axentia.se, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next v4 3/6] i2c: mux: mlxcpld: Get rid of adapter numbers enforcement
Date:   Thu,  4 Feb 2021 18:24:48 +0200
Message-Id: <20210204162451.29518-4-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210204162451.29518-1-vadimp@nvidia.com>
References: <20210204162451.29518-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Do not set the argument 'force_nr' of i2c_mux_add_adapter() routine,
instead provide argument 'chan_id'.
Rename mux ids array from 'adap_ids' to 'chan_ids'.

The motivation is to prepare infrastructure to be able to:
- Create only the child adapters which are actually needed - for which
  channel ids are specified.
- To assign 'nrs' to these child adapters dynamically, with no 'nr'
  enforcement.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
v3->v4:
 Comments pointed out by Peter:
 - Extend patch with the code from the next patches dealing with
   argument two and three of the i2c_mux_add_adapter() routine.
v2->v3:
 Changes added by Vadim:
 - Rename patch from "Rename mux ids array" to "Get rid of adapter
   numbers enforcement".
---
 drivers/i2c/muxes/i2c-mux-mlxcpld.c   | 11 ++---------
 include/linux/platform_data/mlxcpld.h |  4 ++--
 2 files changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-mlxcpld.c b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
index 113ad84cdd94..388fe5c080aa 100644
--- a/drivers/i2c/muxes/i2c-mux-mlxcpld.c
+++ b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
@@ -101,9 +101,8 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
 	struct mlxcpld_mux_plat_data *pdata = dev_get_platdata(&pdev->dev);
 	struct i2c_client *client = to_i2c_client(pdev->dev.parent);
 	struct i2c_mux_core *muxc;
-	int num, force;
 	struct mlxcpld_mux *data;
-	int err;
+	int num, err;
 
 	if (!pdata)
 		return -EINVAL;
@@ -126,13 +125,7 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
 
 	/* Create an adapter for each channel. */
 	for (num = 0; num < CPLD_MUX_MAX_NCHANS; num++) {
-		if (num >= pdata->num_adaps)
-			/* discard unconfigured channels */
-			break;
-
-		force = pdata->adap_ids[num];
-
-		err = i2c_mux_add_adapter(muxc, force, num, 0);
+		err = i2c_mux_add_adapter(muxc, 0, pdata->chan_ids[num], 0);
 		if (err)
 			goto virt_reg_failed;
 	}
diff --git a/include/linux/platform_data/mlxcpld.h b/include/linux/platform_data/mlxcpld.h
index e6c18bf017dd..04d93c563c04 100644
--- a/include/linux/platform_data/mlxcpld.h
+++ b/include/linux/platform_data/mlxcpld.h
@@ -11,12 +11,12 @@
 /* Platform data for the CPLD I2C multiplexers */
 
 /* mlxcpld_mux_plat_data - per mux data, used with i2c_register_board_info
- * @adap_ids - adapter array
+ * @chan_ids - channels array
  * @num_adaps - number of adapters
  * @sel_reg_addr - mux select register offset in CPLD space
  */
 struct mlxcpld_mux_plat_data {
-	int *adap_ids;
+	int *chan_ids;
 	int num_adaps;
 	int sel_reg_addr;
 };
-- 
2.11.0

