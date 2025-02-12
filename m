Return-Path: <linux-i2c+bounces-9401-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A889A32C8A
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 17:55:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 369DB169EC0
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 16:53:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 474B2255E27;
	Wed, 12 Feb 2025 16:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZVSDXTEH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62499253B6A;
	Wed, 12 Feb 2025 16:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739379132; cv=none; b=DIZe1OFvbMB+eML2pDvi/OCHYOZkZ1A67OgDFMGsPorh6Nu0L5tF1V1TjIKD4EsaK1GCGIt0lXND2stkWh14xL1hWMKA3Cfg1k/d5u8UYw6cAmabPew4kfb07mPHK2vX10H1qdYhekxvJbBXeN3LADQBcgJgVz7XjyON9qS8Jq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739379132; c=relaxed/simple;
	bh=DuDi2b+Klx0jWzs1GBIpIImj+rbr7oIyuVMulAca84Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r3Kb5c6A/qnzWUZnQi6jU6eDMWGEXzYgbrvtAKeIbF0zyWdxL6PkEYlAQlYbs8KLzCehhv5Ep/DY1Fi2n60k+L9Iuil5jyTG7Jcs30IKYhTVSVxGXequ/Merliq65nfIGIoQcuEcUBPYzqHb+k9+pf5l9zAfABm9XoCyy2DCdHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZVSDXTEH; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739379130; x=1770915130;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DuDi2b+Klx0jWzs1GBIpIImj+rbr7oIyuVMulAca84Q=;
  b=ZVSDXTEHS8Rth64TVF6RqXScuysVLVC228YvdPBc/v6qqW4/7dsvVVHs
   6KhVm9yyUOapFRBWZPO4XdCGAQvAmjaf2oQ2wubzWG4yCiRLVBrSSehQ/
   CpHsg4NQqPJD0Err2ZPiim1lyLajVhNUEBvU+RwJpfHBmtafPsdjTGx1E
   cs+d0Yhb5VQ8nt5kuEbFv+Fnu68tBCKppQg40qlV+yPW6uMIHwe1xcEkB
   7sHdCkk1xGzqfevNgJgdQ3N+mueVaxFy6S0m2SdWpHbdlz5lAfTAeMBbG
   J4GzOdhN9KxsYPb9PXEEcTLyz/3nVhhmHV94dYZG1jKOKKB9cRwK+2/rs
   Q==;
X-CSE-ConnectionGUID: PwtFNsYhRW+d4qbSVXnLKA==
X-CSE-MsgGUID: OjAtmSYFTaS4Xc92+falAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="40196668"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="40196668"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 08:51:32 -0800
X-CSE-ConnectionGUID: LgDlmX5ITJOQt0TQh5wOvw==
X-CSE-MsgGUID: CnrwtECdQXuLeO0Fm39RFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="117969856"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 12 Feb 2025 08:51:30 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D35F811E; Wed, 12 Feb 2025 18:51:28 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v1 1/1] i2c: mlxbf: Use readl_poll_timeout_atomic() for polling
Date: Wed, 12 Feb 2025 18:51:28 +0200
Message-ID: <20250212165128.2413430-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.45.1.3035.g276e886db78b
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the usage of an open-coded custom tight poll while loop
with the provided readl_poll_timeout_atomic() macro.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-mlxbf.c | 106 ++++++++-------------------------
 1 file changed, 26 insertions(+), 80 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mlxbf.c b/drivers/i2c/busses/i2c-mlxbf.c
index 21f67f3b65b6..280dde53d7f3 100644
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
+	 * it returns -ETIMEDOUT when the bit is asserted, 0 if not.
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
@@ -1829,18 +1785,6 @@ static bool mlxbf_i2c_has_coalesce(struct mlxbf_i2c_priv *priv, bool *read,
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
@@ -1943,7 +1887,9 @@ static int mlxbf_i2c_irq_send(struct mlxbf_i2c_priv *priv, u8 recv_bytes)
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
2.45.1.3035.g276e886db78b


