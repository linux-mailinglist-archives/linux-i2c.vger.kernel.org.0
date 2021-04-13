Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2532835E1B0
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Apr 2021 16:38:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243346AbhDMOiP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Apr 2021 10:38:15 -0400
Received: from mga12.intel.com ([192.55.52.136]:44168 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237179AbhDMOiO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 13 Apr 2021 10:38:14 -0400
IronPort-SDR: KcxiDkliPBYEPvhe5aOXgkKJjLBTxT0iwt1JwUJpwIuHYLZJ78Le7PfK69zqtF3mK3Bjx+GAcC
 OmyNEs3a7Jyw==
X-IronPort-AV: E=McAfee;i="6200,9189,9953"; a="173919058"
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="173919058"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2021 07:37:54 -0700
IronPort-SDR: hikAh/u1PLSUJ5UU7CKgkyX3XGxkCv7m2pl4ZasOWQr6mFUS11V+wM07v3M80smkoI35REla1z
 7qNTHxOXfM0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,219,1613462400"; 
   d="scan'208";a="417878777"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 13 Apr 2021 07:37:52 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 4D29612A; Tue, 13 Apr 2021 17:38:09 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Chris Packham <chris.packham@alliedtelesis.co.nz>, wsa@kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/4] i2c: mpc: Remove CONFIG_PM_SLEEP ifdeffery
Date:   Tue, 13 Apr 2021 17:37:54 +0300
Message-Id: <20210413143756.60138-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210413143756.60138-1-andriy.shevchenko@linux.intel.com>
References: <20210413143756.60138-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use __maybe_unused for the suspend()/resume() hooks and get rid of
the CONFIG_PM_SLEEP ifdeffery to improve the code.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-mpc.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mpc.c b/drivers/i2c/busses/i2c-mpc.c
index 6dc029a31d36..2376accd4e8e 100644
--- a/drivers/i2c/busses/i2c-mpc.c
+++ b/drivers/i2c/busses/i2c-mpc.c
@@ -66,9 +66,7 @@ struct mpc_i2c {
 	struct i2c_adapter adap;
 	int irq;
 	u32 real_clk;
-#ifdef CONFIG_PM_SLEEP
 	u8 fdr, dfsrr;
-#endif
 	struct clk *clk_per;
 };
 
@@ -761,8 +759,7 @@ static int fsl_i2c_remove(struct platform_device *op)
 	return 0;
 };
 
-#ifdef CONFIG_PM_SLEEP
-static int mpc_i2c_suspend(struct device *dev)
+static int __maybe_unused mpc_i2c_suspend(struct device *dev)
 {
 	struct mpc_i2c *i2c = dev_get_drvdata(dev);
 
@@ -772,7 +769,7 @@ static int mpc_i2c_suspend(struct device *dev)
 	return 0;
 }
 
-static int mpc_i2c_resume(struct device *dev)
+static int __maybe_unused mpc_i2c_resume(struct device *dev)
 {
 	struct mpc_i2c *i2c = dev_get_drvdata(dev);
 
@@ -781,12 +778,7 @@ static int mpc_i2c_resume(struct device *dev)
 
 	return 0;
 }
-
 static SIMPLE_DEV_PM_OPS(mpc_i2c_pm_ops, mpc_i2c_suspend, mpc_i2c_resume);
-#define MPC_I2C_PM_OPS	(&mpc_i2c_pm_ops)
-#else
-#define MPC_I2C_PM_OPS	NULL
-#endif
 
 static const struct mpc_i2c_data mpc_i2c_data_512x = {
 	.setup = mpc_i2c_setup_512x,
-- 
2.30.2

