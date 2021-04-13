Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70B5735E1B1
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 16:38:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244620AbhDMOiR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 10:38:17 -0400
Received: from mga18.intel.com ([134.134.136.126]:54662 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243824AbhDMOiQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Apr 2021 10:38:16 -0400
IronPort-SDR: fVTNZ9IG1CzC5Je0UavB95Dbe6ssEDDVgGrURcM/hU5lzXQfdXVMeB9j3D2VNUlKkbBPI4vy/N
 1bAljSMGNp+w==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="181940558"
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="181940558"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 07:37:55 -0700
IronPort-SDR: /zlEhL58J+c+PfuKImPCcisc5t9ZR8hZDeKtpUD/Uryd1XJOItgtm3njWnlnnX+WhLUumAs9uA
 0TTm1dSUIZjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="424279256"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 13 Apr 2021 07:37:53 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id DCA1A147; Tue, 13 Apr 2021 17:38:09 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Chris Packham <chris.packham@alliedtelesis.co.nz>, wsa@kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/4] i2c: mpc: Use device_get_match_data() helper
Date:   Tue, 13 Apr 2021 17:37:55 +0300
Message-Id: <20210413143756.60138-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413143756.60138-1-andriy.shevchenko@linux.intel.com>
References: <20210413143756.60138-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use the device_get_match_data() helper instead of open coding.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-mpc.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 2376accd4e8e..ec9d7d93e80f 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -19,6 +19,7 @@
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
+#include <linux/property.h>
 #include <linux/slab.h>
 
 #include <linux/clk.h>
@@ -643,10 +644,9 @@ static struct i2c_bus_recovery_info fsl_i2c_recovery_info = {
 	.recover_bus = fsl_i2c_bus_recovery,
 };
 
-static const struct of_device_id mpc_i2c_of_match[];
 static int fsl_i2c_probe(struct platform_device *op)
 {
-	const struct of_device_id *match;
+	const struct mpc_i2c_data *data;
 	struct mpc_i2c *i2c;
 	const u32 *prop;
 	u32 clock = MPC_I2C_CLOCK_LEGACY;
@@ -655,10 +655,6 @@ static int fsl_i2c_probe(struct platform_device *op)
 	struct clk *clk;
 	int err;
 
-	match = of_match_device(mpc_i2c_of_match, &op->dev);
-	if (!match)
-		return -EINVAL;
-
 	i2c = devm_kzalloc(&op->dev, sizeof(*i2c), GFP_KERNEL);
 	if (!i2c)
 		return -ENOMEM;
@@ -709,8 +705,8 @@ static int fsl_i2c_probe(struct platform_device *op)
 			clock = *prop;
 	}
 
-	if (match->data) {
-		const struct mpc_i2c_data *data = match->data;
+	data = device_get_match_data(&op->dev);
+	if (data) {
 		data->setup(op->dev.of_node, i2c, clock);
 	} else {
 		/* Backwards compatibility */
-- 
2.30.2

