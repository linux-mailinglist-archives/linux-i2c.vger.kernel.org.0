Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 404E8300CE0
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Jan 2021 20:56:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728567AbhAVTsu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Jan 2021 14:48:50 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:38538 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730531AbhAVT0F (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Jan 2021 14:26:05 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 22 Jan 2021 21:25:13 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 10MJP4vF019220;
        Fri, 22 Jan 2021 21:25:13 +0200
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     peda@axentia.se, wsa@the-dreams.de
Cc:     linux-i2c@vger.kernel.org, Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH i2c-next v2 7/7] i2c: mux: mlxcpld: Add callback to notify mux creation completion
Date:   Fri, 22 Jan 2021 21:25:02 +0200
Message-Id: <20210122192502.17645-8-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210122192502.17645-1-vadimp@nvidia.com>
References: <20210122192502.17645-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Add notification to inform caller that mux objects array has been
created. It allows to user, invoked platform device registration for
"i2c-mux-mlxcpld" driver, to be notified that mux infrastructure is
available, and thus some devices could be connected to this
infrastructure.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/i2c/muxes/i2c-mux-mlxcpld.c   | 4 ++++
 include/linux/platform_data/mlxcpld.h | 5 +++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/i2c/muxes/i2c-mux-mlxcpld.c b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
index 7b37d59dc23b..5e0b910790ce 100644
--- a/drivers/i2c/muxes/i2c-mux-mlxcpld.c
+++ b/drivers/i2c/muxes/i2c-mux-mlxcpld.c
@@ -162,6 +162,10 @@ static int mlxcpld_mux_probe(struct platform_device *pdev)
 			goto virt_reg_failed;
 	}
 
+	/* Notify caller when all channels' adapters are created. */
+	if (pdata->completion_notify)
+		pdata->completion_notify(pdata->handle, muxc->parent, muxc->adapter);
+
 	return 0;
 
 virt_reg_failed:
diff --git a/include/linux/platform_data/mlxcpld.h b/include/linux/platform_data/mlxcpld.h
index a7bee798d991..d7610b528856 100644
--- a/include/linux/platform_data/mlxcpld.h
+++ b/include/linux/platform_data/mlxcpld.h
@@ -15,12 +15,17 @@
  * @num_adaps - number of adapters
  * @sel_reg_addr - mux select register offset in CPLD space
  * @reg_size: register size in bytes
+ * @handle: handle to be passed by callback
+ * @completion_notify: callback to notify when all the adapters are created
  */
 struct mlxcpld_mux_plat_data {
 	int *chan_ids;
 	int num_adaps;
 	int sel_reg_addr;
 	u8 reg_size;
+	void *handle;
+	int (*completion_notify)(void *handle, struct i2c_adapter *parent,
+				 struct i2c_adapter *adapters[]);
 };
 
 #endif /* _LINUX_I2C_MLXCPLD_H */
-- 
2.11.0

