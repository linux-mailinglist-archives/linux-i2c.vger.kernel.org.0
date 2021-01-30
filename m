Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57E12309759
	for <lists+linux-i2c@lfdr.de>; Sat, 30 Jan 2021 18:37:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231397AbhA3Rfr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 30 Jan 2021 12:35:47 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:42607 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S231308AbhA3Rfo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 30 Jan 2021 12:35:44 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 30 Jan 2021 19:34:53 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 10UHYnGo010866;
        Sat, 30 Jan 2021 19:34:53 +0200
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     peda@axentia.se, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next v3 3/6] i2c: mux: mlxcpld: Rename mux ids array
Date:   Sat, 30 Jan 2021 19:34:44 +0200
Message-Id: <20210130173447.26328-4-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210130173447.26328-1-vadimp@nvidia.com>
References: <20210130173447.26328-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Rename mux ids array from 'adap_ids' to 'chan_ids'.
The motivation is to prepare infrastructure to be able to:
- Create only the child adapters which are actually needed - for which
  channel ids are specified.
- To assign 'nrs' to these child adapters dynamically, with no 'nr'
  enforcement.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/i2c/muxes/i2c-mux-mlxcpld.c   | 2 +-
 include/linux/platform_data/mlxcpld.h | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-mlxcpld.c b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
index 113ad84cdd94..9e9d74bd1059 100644
--- a/drivers/i2c/muxes/i2c-mux-mlxcpld.c
+++ b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
@@ -130,7 +130,7 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
 			/* discard unconfigured channels */
 			break;
 
-		force = pdata->adap_ids[num];
+		force = pdata->chan_ids[num];
 
 		err = i2c_mux_add_adapter(muxc, force, num, 0);
 		if (err)
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

