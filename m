Return-Path: <linux-i2c+bounces-14576-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0154BCC3396
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 14:29:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 61C403044134
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 13:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB7DD3930C7;
	Tue, 16 Dec 2025 13:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I4n9LVzG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8888F37D133;
	Tue, 16 Dec 2025 13:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765890894; cv=none; b=XZ+7QuciBZFPj/EabFWjmF5o7HGPpaOOw1sQoejm0TxoNo8zLAW2TNM9RGn0YuTQoe5g2ztML26xMtkMGbDh6HOsmj2ezbYwy/e9M6qNWPp33PxZqbjM/6BuCqReiBvO5fa8jfT460E6ubpGJMeWxq65LDYr6CTw8MX7dyRpUqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765890894; c=relaxed/simple;
	bh=LOFyzY+s40BW9OGVVI9S8t54tp2Xdd8z4HLtupMLEH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gp0ArRXNWVdgvCtd9ayJcS6M0hi+15ZpjBHrnMNGPPEcr3VLypEpQw8XlWT0+6xPwehUGnzR+c9HAhl0x8lVw09L+o2ftPnA5TvpTkPo9wa5ycYYtYpuZMXp3d3hVccRR+HpUKYNwKkP0rwo8bNsTICluP9cn+T+RsNQsYCv7Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I4n9LVzG; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765890893; x=1797426893;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LOFyzY+s40BW9OGVVI9S8t54tp2Xdd8z4HLtupMLEH0=;
  b=I4n9LVzGrejVCt5TCxXulSq74npvkOVczPVQQ4uDdzRyyZKug9/mMUox
   JhQ6Qalyk9+s5AtN5AZpQN667CXLk3BPqDi+m9Fv5HlF7QnW1gOY6VcoZ
   DkdGQNet7/TSpUpB08gJ4PEhXFveIVTOxYCSTDA9pYONyK2bEbUSbYzWq
   2w5CMQ2tsVAhX0gCF+OFMVvd02V1G5jVIMu5CbDTuZK9sLWrIp/i64ijp
   KJC3B5Eh6fNVYvjwnKcGJiyGDz+4ADzyvdOzU0iXyMs754XVCtaoFQcDa
   mYSe0iW84WDqt2ErpwTwc1ojW1ZalfaaIeDJPTdXhW4aHy7yZlXUxCL1u
   g==;
X-CSE-ConnectionGUID: MQev62C8SLqKmFCw42i+GQ==
X-CSE-MsgGUID: W4aemKvBSfKqQW2EcYPJRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78444902"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="78444902"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 05:14:51 -0800
X-CSE-ConnectionGUID: qMX/zWAuTM2hmOnOAibljw==
X-CSE-MsgGUID: oTtj72IlTd285ETuLzZUwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="198274413"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 16 Dec 2025 05:14:49 -0800
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Jan Dabros <jsd@semihalf.com>,
	Raag Jadav <raag.jadav@intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/6] i2c: designware: Combine some of the common functions
Date: Tue, 16 Dec 2025 14:14:38 +0100
Message-ID: <20251216131442.8464-4-heikki.krogerus@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251216131442.8464-1-heikki.krogerus@linux.intel.com>
References: <20251216131442.8464-1-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The adapter can be registered just in the core instead of
separately in the master and slave drivers. The same applies
to the interrupt.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c | 108 +++++++++++++++++++--
 drivers/i2c/busses/i2c-designware-core.h   |  11 ++-
 drivers/i2c/busses/i2c-designware-master.c |  97 +++---------------
 drivers/i2c/busses/i2c-designware-slave.c  |  53 ++--------
 4 files changed, 126 insertions(+), 143 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 5b1e8f74c4ac..1823e4b71004 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -131,7 +131,7 @@ static int dw_reg_write_word(void *context, unsigned int reg, unsigned int val)
  *
  * Return: 0 on success, or negative errno otherwise.
  */
-int i2c_dw_init_regmap(struct dw_i2c_dev *dev)
+static int i2c_dw_init_regmap(struct dw_i2c_dev *dev)
 {
 	struct regmap_config map_cfg = {
 		.reg_bits = 32,
@@ -457,7 +457,7 @@ u32 i2c_dw_scl_lcnt(struct dw_i2c_dev *dev, unsigned int reg, u32 ic_clk,
 	return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * (tLOW + tf), MICRO) - 1 + offset;
 }
 
-int i2c_dw_set_sda_hold(struct dw_i2c_dev *dev)
+static int i2c_dw_set_sda_hold(struct dw_i2c_dev *dev)
 {
 	unsigned int reg;
 	int ret;
@@ -672,7 +672,7 @@ int i2c_dw_handle_tx_abort(struct dw_i2c_dev *dev)
 	return -EIO;
 }
 
-int i2c_dw_set_fifo_size(struct dw_i2c_dev *dev)
+static int i2c_dw_set_fifo_size(struct dw_i2c_dev *dev)
 {
 	u32 tx_fifo_depth, rx_fifo_depth;
 	unsigned int param;
@@ -741,19 +741,113 @@ void i2c_dw_disable(struct dw_i2c_dev *dev)
 }
 EXPORT_SYMBOL_GPL(i2c_dw_disable);
 
+static irqreturn_t i2c_dw_isr(int this_irq, void *dev_id)
+{
+	struct dw_i2c_dev *dev = dev_id;
+
+	if (dev->mode == DW_IC_SLAVE)
+		return i2c_dw_isr_slave(dev);
+
+	return i2c_dw_isr_master(dev);
+}
+
+static const struct i2c_algorithm i2c_dw_algo = {
+	.xfer = i2c_dw_xfer,
+	.functionality = i2c_dw_func,
+#if IS_ENABLED(CONFIG_I2C_SLAVE)
+	.reg_slave = i2c_dw_reg_slave,
+	.unreg_slave = i2c_dw_unreg_slave,
+#endif
+};
+
+static const struct i2c_adapter_quirks i2c_dw_quirks = {
+	.flags = I2C_AQ_NO_ZERO_LEN,
+};
+
 int i2c_dw_probe(struct dw_i2c_dev *dev)
 {
+	struct i2c_adapter *adap = &dev->adapter;
+	unsigned long irq_flags;
+	int ret;
+
 	device_set_node(&dev->adapter.dev, dev_fwnode(dev->dev));
 
+	ret = i2c_dw_init_regmap(dev);
+	if (ret)
+		return ret;
+
+	ret = i2c_dw_set_sda_hold(dev);
+	if (ret)
+		return ret;
+
+	ret = i2c_dw_set_fifo_size(dev);
+	if (ret)
+		return ret;
+
 	switch (dev->mode) {
 	case DW_IC_SLAVE:
-		return i2c_dw_probe_slave(dev);
+		ret = i2c_dw_probe_slave(dev);
+		break;
 	case DW_IC_MASTER:
-		return i2c_dw_probe_master(dev);
+		ret = i2c_dw_probe_master(dev);
+		break;
 	default:
-		dev_err(dev->dev, "Wrong operation mode: %d\n", dev->mode);
-		return -EINVAL;
+		ret = -EINVAL;
+		break;
 	}
+	if (ret)
+		return ret;
+
+	ret = dev->init(dev);
+	if (ret)
+		return ret;
+
+	if (!adap->name[0])
+		strscpy(adap->name, "Synopsys DesignWare I2C adapter");
+
+	adap->retries = 3;
+	adap->algo = &i2c_dw_algo;
+	adap->quirks = &i2c_dw_quirks;
+	adap->dev.parent = dev->dev;
+	i2c_set_adapdata(adap, dev);
+
+	/*
+	 * REVISIT: The mode check may not be necessary.
+	 * For now keeping the flags as they were originally.
+	 */
+	if (dev->mode == DW_IC_SLAVE)
+		irq_flags = IRQF_SHARED;
+	else if (dev->flags & ACCESS_NO_IRQ_SUSPEND)
+		irq_flags = IRQF_NO_SUSPEND;
+	else
+		irq_flags = IRQF_SHARED | IRQF_COND_SUSPEND;
+
+	ret = i2c_dw_acquire_lock(dev);
+	if (ret)
+		return ret;
+
+	__i2c_dw_write_intr_mask(dev, 0);
+	i2c_dw_release_lock(dev);
+
+	if (!(dev->flags & ACCESS_POLLING)) {
+		ret = devm_request_irq(dev->dev, dev->irq, i2c_dw_isr,
+				       irq_flags, dev_name(dev->dev), dev);
+		if (ret)
+			return ret;
+	}
+
+	/*
+	 * Increment PM usage count during adapter registration in order to
+	 * avoid possible spurious runtime suspend when adapter device is
+	 * registered to the device core and immediate resume in case bus has
+	 * registered I2C slaves that do I2C transfers in their probe.
+	 */
+	ACQUIRE(pm_runtime_noresume, pm)(dev->dev);
+	ret = ACQUIRE_ERR(pm_runtime_noresume, &pm);
+	if (ret)
+		return ret;
+
+	return i2c_add_numbered_adapter(adap);
 }
 EXPORT_SYMBOL_GPL(i2c_dw_probe);
 
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 2a7decc24931..0f58c4b50377 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -13,6 +13,7 @@
 #include <linux/completion.h>
 #include <linux/errno.h>
 #include <linux/i2c.h>
+#include <linux/irqreturn.h>
 #include <linux/pm.h>
 #include <linux/regmap.h>
 #include <linux/types.h>
@@ -333,20 +334,18 @@ struct i2c_dw_semaphore_callbacks {
 	int	(*probe)(struct dw_i2c_dev *dev);
 };
 
-int i2c_dw_init_regmap(struct dw_i2c_dev *dev);
 u32 i2c_dw_scl_hcnt(struct dw_i2c_dev *dev, unsigned int reg, u32 ic_clk,
 		    u32 tSYMBOL, u32 tf, int offset);
 u32 i2c_dw_scl_lcnt(struct dw_i2c_dev *dev, unsigned int reg, u32 ic_clk,
 		    u32 tLOW, u32 tf, int offset);
-int i2c_dw_set_sda_hold(struct dw_i2c_dev *dev);
 u32 i2c_dw_clk_rate(struct dw_i2c_dev *dev);
 int i2c_dw_prepare_clk(struct dw_i2c_dev *dev, bool prepare);
 int i2c_dw_acquire_lock(struct dw_i2c_dev *dev);
 void i2c_dw_release_lock(struct dw_i2c_dev *dev);
 int i2c_dw_wait_bus_not_busy(struct dw_i2c_dev *dev);
 int i2c_dw_handle_tx_abort(struct dw_i2c_dev *dev);
-int i2c_dw_set_fifo_size(struct dw_i2c_dev *dev);
 u32 i2c_dw_func(struct i2c_adapter *adap);
+irqreturn_t i2c_dw_isr_master(struct dw_i2c_dev *dev);
 
 extern const struct dev_pm_ops i2c_dw_dev_pm_ops;
 
@@ -386,12 +385,18 @@ void i2c_dw_disable(struct dw_i2c_dev *dev);
 extern void i2c_dw_configure_master(struct dw_i2c_dev *dev);
 extern int i2c_dw_probe_master(struct dw_i2c_dev *dev);
 
+int i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num);
+
 #if IS_ENABLED(CONFIG_I2C_SLAVE)
 extern void i2c_dw_configure_slave(struct dw_i2c_dev *dev);
 extern int i2c_dw_probe_slave(struct dw_i2c_dev *dev);
+irqreturn_t i2c_dw_isr_slave(struct dw_i2c_dev *dev);
+int i2c_dw_reg_slave(struct i2c_client *client);
+int i2c_dw_unreg_slave(struct i2c_client *client);
 #else
 static inline void i2c_dw_configure_slave(struct dw_i2c_dev *dev) { }
 static inline int i2c_dw_probe_slave(struct dw_i2c_dev *dev) { return -EINVAL; }
+static inline irqreturn_t i2c_dw_isr_slave(struct dw_i2c_dev *dev) { return IRQ_NONE; }
 #endif
 
 static inline void i2c_dw_configure(struct dw_i2c_dev *dev)
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 15b3a46f0132..91540a4520a3 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -191,10 +191,6 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
 			dev->hs_hcnt, dev->hs_lcnt);
 	}
 
-	ret = i2c_dw_set_sda_hold(dev);
-	if (ret)
-		return ret;
-
 	dev_dbg(dev->dev, "Bus speed: %s\n", i2c_freq_mode_string(t->bus_freq_hz));
 	return 0;
 }
@@ -353,9 +349,8 @@ static int i2c_dw_status(struct dw_i2c_dev *dev)
  * Initiate and continue master read/write transaction with polling
  * based transfer routine afterward write messages into the Tx buffer.
  */
-static int amd_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msgs, int num_msgs)
+static int amd_i2c_dw_xfer_quirk(struct dw_i2c_dev *dev, struct i2c_msg *msgs, int num_msgs)
 {
-	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
 	int msg_wrt_idx, msg_itr_lmt, buf_len, data_idx;
 	int cmd = 0, status;
 	u8 *tx_buf;
@@ -752,9 +747,8 @@ static void i2c_dw_process_transfer(struct dw_i2c_dev *dev, unsigned int stat)
  * Interrupt service routine. This gets called whenever an I2C master interrupt
  * occurs.
  */
-static irqreturn_t i2c_dw_isr(int this_irq, void *dev_id)
+irqreturn_t i2c_dw_isr_master(struct dw_i2c_dev *dev)
 {
-	struct dw_i2c_dev *dev = dev_id;
 	unsigned int stat, enabled;
 
 	regmap_read(dev->map, DW_IC_ENABLE, &enabled);
@@ -815,9 +809,8 @@ static int i2c_dw_wait_transfer(struct dw_i2c_dev *dev)
  * Prepare controller for a transaction and call i2c_dw_xfer_msg.
  */
 static int
-i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
+i2c_dw_xfer_common(struct dw_i2c_dev *dev, struct i2c_msg msgs[], int num)
 {
-	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
 	int ret;
 
 	dev_dbg(dev->dev, "%s: msgs: %d\n", __func__, num);
@@ -908,19 +901,15 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	return ret;
 }
 
-static const struct i2c_algorithm i2c_dw_algo = {
-	.xfer = i2c_dw_xfer,
-	.functionality = i2c_dw_func,
-};
+int i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
+{
+	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
 
-static const struct i2c_algorithm amd_i2c_dw_algo = {
-	.xfer = amd_i2c_dw_xfer_quirk,
-	.functionality = i2c_dw_func,
-};
+	if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU)
+		return amd_i2c_dw_xfer_quirk(dev, msgs, num);
 
-static const struct i2c_adapter_quirks i2c_dw_quirks = {
-	.flags = I2C_AQ_NO_ZERO_LEN,
-};
+	return i2c_dw_xfer_common(dev, msgs, num);
+}
 
 void i2c_dw_configure_master(struct dw_i2c_dev *dev)
 {
@@ -1005,8 +994,6 @@ static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
 
 int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 {
-	struct i2c_adapter *adap = &dev->adapter;
-	unsigned long irq_flags;
 	unsigned int ic_con;
 	int ret;
 
@@ -1014,18 +1001,10 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 
 	dev->init = i2c_dw_init_master;
 
-	ret = i2c_dw_init_regmap(dev);
-	if (ret)
-		return ret;
-
 	ret = i2c_dw_set_timings_master(dev);
 	if (ret)
 		return ret;
 
-	ret = i2c_dw_set_fifo_size(dev);
-	if (ret)
-		return ret;
-
 	/* Lock the bus for accessing DW_IC_CON */
 	ret = i2c_dw_acquire_lock(dev);
 	if (ret)
@@ -1045,61 +1024,7 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 	if (ic_con & DW_IC_CON_BUS_CLEAR_CTRL)
 		dev->master_cfg |= DW_IC_CON_BUS_CLEAR_CTRL;
 
-	ret = dev->init(dev);
-	if (ret)
-		return ret;
-
-	if (!adap->name[0])
-		scnprintf(adap->name, sizeof(adap->name),
-			  "Synopsys DesignWare I2C adapter");
-	adap->retries = 3;
-	if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU)
-		adap->algo = &amd_i2c_dw_algo;
-	else
-		adap->algo = &i2c_dw_algo;
-	adap->quirks = &i2c_dw_quirks;
-	adap->dev.parent = dev->dev;
-	i2c_set_adapdata(adap, dev);
-
-	if (dev->flags & ACCESS_NO_IRQ_SUSPEND) {
-		irq_flags = IRQF_NO_SUSPEND;
-	} else {
-		irq_flags = IRQF_SHARED | IRQF_COND_SUSPEND;
-	}
-
-	ret = i2c_dw_acquire_lock(dev);
-	if (ret)
-		return ret;
-
-	__i2c_dw_write_intr_mask(dev, 0);
-	i2c_dw_release_lock(dev);
-
-	if (!(dev->flags & ACCESS_POLLING)) {
-		ret = devm_request_irq(dev->dev, dev->irq, i2c_dw_isr,
-				       irq_flags, dev_name(dev->dev), dev);
-		if (ret)
-			return dev_err_probe(dev->dev, ret,
-					     "failure requesting irq %i: %d\n",
-					     dev->irq, ret);
-	}
-
-	ret = i2c_dw_init_recovery_info(dev);
-	if (ret)
-		return ret;
-
-	/*
-	 * Increment PM usage count during adapter registration in order to
-	 * avoid possible spurious runtime suspend when adapter device is
-	 * registered to the device core and immediate resume in case bus has
-	 * registered I2C slaves that do I2C transfers in their probe.
-	 */
-	pm_runtime_get_noresume(dev->dev);
-	ret = i2c_add_numbered_adapter(adap);
-	if (ret)
-		dev_err(dev->dev, "failure adding adapter: %d\n", ret);
-	pm_runtime_put_noidle(dev->dev);
-
-	return ret;
+	return i2c_dw_init_recovery_info(dev);
 }
 
 MODULE_DESCRIPTION("Synopsys DesignWare I2C bus master adapter");
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index 1995be79544d..c0baf53e97d8 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -63,7 +63,7 @@ static int i2c_dw_init_slave(struct dw_i2c_dev *dev)
 	return 0;
 }
 
-static int i2c_dw_reg_slave(struct i2c_client *slave)
+int i2c_dw_reg_slave(struct i2c_client *slave)
 {
 	struct dw_i2c_dev *dev = i2c_get_adapdata(slave->adapter);
 
@@ -88,7 +88,7 @@ static int i2c_dw_reg_slave(struct i2c_client *slave)
 	return 0;
 }
 
-static int i2c_dw_unreg_slave(struct i2c_client *slave)
+int i2c_dw_unreg_slave(struct i2c_client *slave)
 {
 	struct dw_i2c_dev *dev = i2c_get_adapdata(slave->adapter);
 
@@ -152,9 +152,8 @@ static u32 i2c_dw_read_clear_intrbits_slave(struct dw_i2c_dev *dev)
  * Interrupt service routine. This gets called whenever an I2C slave interrupt
  * occurs.
  */
-static irqreturn_t i2c_dw_isr_slave(int this_irq, void *dev_id)
+irqreturn_t i2c_dw_isr_slave(struct dw_i2c_dev *dev)
 {
-	struct dw_i2c_dev *dev = dev_id;
 	unsigned int raw_stat, stat, enabled, tmp;
 	u8 val = 0, slave_activity;
 
@@ -217,12 +216,6 @@ static irqreturn_t i2c_dw_isr_slave(int this_irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
-static const struct i2c_algorithm i2c_dw_algo = {
-	.functionality = i2c_dw_func,
-	.reg_slave = i2c_dw_reg_slave,
-	.unreg_slave = i2c_dw_unreg_slave,
-};
-
 void i2c_dw_configure_slave(struct dw_i2c_dev *dev)
 {
 	dev->functionality = I2C_FUNC_SLAVE;
@@ -236,46 +229,12 @@ EXPORT_SYMBOL_GPL(i2c_dw_configure_slave);
 
 int i2c_dw_probe_slave(struct dw_i2c_dev *dev)
 {
-	struct i2c_adapter *adap = &dev->adapter;
-	int ret;
+	if (dev->flags & ACCESS_POLLING)
+		return -EOPNOTSUPP;
 
 	dev->init = i2c_dw_init_slave;
 
-	ret = i2c_dw_init_regmap(dev);
-	if (ret)
-		return ret;
-
-	ret = i2c_dw_set_sda_hold(dev);
-	if (ret)
-		return ret;
-
-	ret = i2c_dw_set_fifo_size(dev);
-	if (ret)
-		return ret;
-
-	ret = dev->init(dev);
-	if (ret)
-		return ret;
-
-	snprintf(adap->name, sizeof(adap->name),
-		 "Synopsys DesignWare I2C Slave adapter");
-	adap->retries = 3;
-	adap->algo = &i2c_dw_algo;
-	adap->dev.parent = dev->dev;
-	i2c_set_adapdata(adap, dev);
-
-	ret = devm_request_irq(dev->dev, dev->irq, i2c_dw_isr_slave,
-			       IRQF_SHARED, dev_name(dev->dev), dev);
-	if (ret)
-		return dev_err_probe(dev->dev, ret,
-				     "failure requesting IRQ %i: %d\n",
-				     dev->irq, ret);
-
-	ret = i2c_add_numbered_adapter(adap);
-	if (ret)
-		dev_err(dev->dev, "failure adding adapter: %d\n", ret);
-
-	return ret;
+	return 0;
 }
 
 MODULE_AUTHOR("Luis Oliveira <lolivei@synopsys.com>");
-- 
2.50.1


