Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6C626D0789
	for <lists+linux-i2c@lfdr.de>; Thu, 30 Mar 2023 16:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232213AbjC3OCK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 30 Mar 2023 10:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230035AbjC3OCI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 30 Mar 2023 10:02:08 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C29C5259;
        Thu, 30 Mar 2023 07:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680184927; x=1711720927;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=kGqql32tY2qK8YOyl2Nxe92xv5mmZXxmhttRivAFbQY=;
  b=ZnnCRmfAsvkr4rMJQqhaLcwuAGo38VwF3qpkQaENxf8oGNz2qtA+ocMH
   XFQ7VARnvcN5LBWvcUQLg8yTptP0hsp6z0ztGywvoJXEpSYS5wpmSGsbS
   G+0t8wsldEAnaz5cyrVqjmrIE5jR0IJL97BC+O9bfGV8z3BI6FDCLjD13
   auJBPax9b3fh9TNRzsvVbF5AG7JSzBqxQ0NQzdDXpI4K2Xt/f7FMvUqy/
   mhFk+Wjqbvlnmjddh5T8Tgz7H5wlVBlIjdDnABfwGUN/LEcSCKu/2ChHr
   u8F4pfOgub7oCbBGoz4q6Okl6zrluR3BDeqPOTsSxlfMvtdc3/qYAsmQV
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="338672814"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="338672814"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 07:01:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="1014430014"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="1014430014"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 30 Mar 2023 07:01:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D6A1313A; Thu, 30 Mar 2023 16:57:50 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Khalil Blaiech <kblaiech@nvidia.com>,
        Asmaa Mnebhi <asmaa@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] i2c: mlxbf: Use readl_poll_timeout_atomic() for polling
Date:   Thu, 30 Mar 2023 16:57:47 +0300
Message-Id: <20230330135747.15684-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Convert the usage of an open-coded custom tight poll while loop
with the provided readl_poll_timeout_atomic() macro.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-mlxbf.c | 106 ++++++++-------------------------
 1 file changed, 26 insertions(+), 80 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index 1810d5791b3d..8087c556694d 100644
--- a/drivers/i2c/busses/i2c-mlxbf.c
+++ b/drivers/i2c/busses/i2c-mlxbf.c
@@ -12,6 +12,7 @@
 #include <linux/interrupt.h>
 #include <linux/i2c.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -495,65 +496,6 @@ static u8 mlxbf_i2c_bus_count;
 
 static struct mutex mlxbf_i2c_bus_lock;
 
-/*
- * Function to poll a set of bits at a specific address; it checks whether
- * the bits are equal to zero when eq_zero is set to 'true', and not equal
- * to zero when eq_zero is set to 'false'.
- * Note that the timeout is given in microseconds.
- */
-static u32 mlxbf_i2c_poll(void __iomem *io, u32 addr, u32 mask,
-			    bool eq_zero, u32  timeout)
-{
-	u32 bits;
-
-	timeout = (timeout / MLXBF_I2C_POLL_FREQ_IN_USEC) + 1;
-
-	do {
-		bits = readl(io + addr) & mask;
-		if (eq_zero ? bits == 0 : bits != 0)
-			return eq_zero ? 1 : bits;
-		udelay(MLXBF_I2C_POLL_FREQ_IN_USEC);
-	} while (timeout-- != 0);
-
-	return 0;
-}
-
-/*
- * SW must make sure that the SMBus Master GW is idle before starting
- * a transaction. Accordingly, this function polls the Master FSM stop
- * bit; it returns false when the bit is asserted, true if not.
- */
-static bool mlxbf_i2c_smbus_master_wait_for_idle(struct mlxbf_i2c_priv *priv)
-{
-	u32 mask = MLXBF_I2C_SMBUS_MASTER_FSM_STOP_MASK;
-	u32 addr = priv->chip->smbus_master_fsm_off;
-	u32 timeout = MLXBF_I2C_SMBUS_TIMEOUT;
-
-	if (mlxbf_i2c_poll(priv->mst->io, addr, mask, true, timeout))
-		return true;
-
-	return false;
-}
-
-/*
- * wait for the lock to be released before acquiring it.
- */
-static bool mlxbf_i2c_smbus_master_lock(struct mlxbf_i2c_priv *priv)
-{
-	if (mlxbf_i2c_poll(priv->mst->io, MLXBF_I2C_SMBUS_MASTER_GW,
-			   MLXBF_I2C_MASTER_LOCK_BIT, true,
-			   MLXBF_I2C_SMBUS_LOCK_POLL_TIMEOUT))
-		return true;
-
-	return false;
-}
-
-static void mlxbf_i2c_smbus_master_unlock(struct mlxbf_i2c_priv *priv)
-{
-	/* Clear the gw to clear the lock */
-	writel(0, priv->mst->io + MLXBF_I2C_SMBUS_MASTER_GW);
-}
-
 static bool mlxbf_i2c_smbus_transaction_success(u32 master_status,
 						u32 cause_status)
 {
@@ -583,6 +525,7 @@ static int mlxbf_i2c_smbus_check_status(struct mlxbf_i2c_priv *priv)
 {
 	u32 master_status_bits;
 	u32 cause_status_bits;
+	u32 bits;
 
 	/*
 	 * GW busy bit is raised by the driver and cleared by the HW
@@ -591,9 +534,9 @@ static int mlxbf_i2c_smbus_check_status(struct mlxbf_i2c_priv *priv)
 	 * then read the cause and master status bits to determine if
 	 * errors occurred during the transaction.
 	 */
-	mlxbf_i2c_poll(priv->mst->io, MLXBF_I2C_SMBUS_MASTER_GW,
-			 MLXBF_I2C_MASTER_BUSY_BIT, true,
-			 MLXBF_I2C_SMBUS_TIMEOUT);
+	readl_poll_timeout_atomic(priv->mst->io + MLXBF_I2C_SMBUS_MASTER_GW,
+				  bits, !(bits & MLXBF_I2C_MASTER_BUSY_BIT),
+				  MLXBF_I2C_POLL_FREQ_IN_USEC, MLXBF_I2C_SMBUS_TIMEOUT);
 
 	/* Read cause status bits. */
 	cause_status_bits = readl(priv->mst_cause->io +
@@ -740,7 +683,8 @@ mlxbf_i2c_smbus_start_transaction(struct mlxbf_i2c_priv *priv,
 	u8 read_en, write_en, block_en, pec_en;
 	u8 slave, flags, addr;
 	u8 *read_buf;
-	int ret = 0;
+	u32 bits;
+	int ret;
 
 	if (request->operation_cnt > MLXBF_I2C_SMBUS_MAX_OP_CNT)
 		return -EINVAL;
@@ -760,11 +704,22 @@ mlxbf_i2c_smbus_start_transaction(struct mlxbf_i2c_priv *priv,
 	 * Try to acquire the smbus gw lock before any reads of the GW register since
 	 * a read sets the lock.
 	 */
-	if (WARN_ON(!mlxbf_i2c_smbus_master_lock(priv)))
+	ret = readl_poll_timeout_atomic(priv->mst->io + MLXBF_I2C_SMBUS_MASTER_GW,
+					bits, !(bits & MLXBF_I2C_MASTER_LOCK_BIT),
+					MLXBF_I2C_POLL_FREQ_IN_USEC,
+					MLXBF_I2C_SMBUS_LOCK_POLL_TIMEOUT);
+	if (WARN_ON(ret))
 		return -EBUSY;
 
-	/* Check whether the HW is idle */
-	if (WARN_ON(!mlxbf_i2c_smbus_master_wait_for_idle(priv))) {
+	/*
+	 * SW must make sure that the SMBus Master GW is idle before starting
+	 * a transaction. Accordingly, this call polls the Master FSM stop bit;
+	 * it returns 0 when the bit is asserted, -ETIMEDOUT if not.
+	 */
+	ret = readl_poll_timeout_atomic(priv->mst->io + priv->chip->smbus_master_fsm_off,
+					bits, !(bits & MLXBF_I2C_SMBUS_MASTER_FSM_STOP_MASK),
+					MLXBF_I2C_POLL_FREQ_IN_USEC, MLXBF_I2C_SMBUS_TIMEOUT);
+	if (WARN_ON(ret)) {
 		ret = -EBUSY;
 		goto out_unlock;
 	}
@@ -855,7 +810,8 @@ mlxbf_i2c_smbus_start_transaction(struct mlxbf_i2c_priv *priv,
 	}
 
 out_unlock:
-	mlxbf_i2c_smbus_master_unlock(priv);
+	/* Clear the gw to clear the lock */
+	writel(0, priv->mst->io + MLXBF_I2C_SMBUS_MASTER_GW);
 
 	return ret;
 }
@@ -1835,18 +1791,6 @@ static bool mlxbf_i2c_has_coalesce(struct mlxbf_i2c_priv *priv, bool *read,
 	return true;
 }
 
-static bool mlxbf_i2c_slave_wait_for_idle(struct mlxbf_i2c_priv *priv,
-					    u32 timeout)
-{
-	u32 mask = MLXBF_I2C_CAUSE_S_GW_BUSY_FALL;
-	u32 addr = MLXBF_I2C_CAUSE_ARBITER;
-
-	if (mlxbf_i2c_poll(priv->slv_cause->io, addr, mask, false, timeout))
-		return true;
-
-	return false;
-}
-
 static struct i2c_client *mlxbf_i2c_get_slave_from_addr(
 			struct mlxbf_i2c_priv *priv, u8 addr)
 {
@@ -1949,7 +1893,9 @@ static int mlxbf_i2c_irq_send(struct mlxbf_i2c_priv *priv, u8 recv_bytes)
 	 * Wait until the transfer is completed; the driver will wait
 	 * until the GW is idle, a cause will rise on fall of GW busy.
 	 */
-	mlxbf_i2c_slave_wait_for_idle(priv, MLXBF_I2C_SMBUS_TIMEOUT);
+	readl_poll_timeout_atomic(priv->slv_cause->io + MLXBF_I2C_CAUSE_ARBITER,
+				  data32, data32 & MLXBF_I2C_CAUSE_S_GW_BUSY_FALL,
+				  MLXBF_I2C_POLL_FREQ_IN_USEC, MLXBF_I2C_SMBUS_TIMEOUT);
 
 clear_csr:
 	/* Release the Slave GW. */
-- 
2.40.0.1.gaa8946217a0b

