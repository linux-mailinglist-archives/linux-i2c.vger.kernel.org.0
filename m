Return-Path: <linux-i2c+bounces-1700-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BEE8530E3
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Feb 2024 13:49:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB888281C30
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Feb 2024 12:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CCB242078;
	Tue, 13 Feb 2024 12:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Od9Hr3oU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF4742074
	for <linux-i2c@vger.kernel.org>; Tue, 13 Feb 2024 12:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707828552; cv=none; b=jaC5mTHAjeiEXOnde2IKoTiXutRKLaZoBCKzlO+yOWQyQbHQaA7fsUpuqT5g3053rCii9k6C+8jsyhsVR18GPJ09+91dJ8eNJ6Gh0b4wDZ+7RM2r+cbgFXYKCRIc5d/MdzZd2dz4K5AD44kPg33FLnAz+7MEKFGdIHNya84C1FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707828552; c=relaxed/simple;
	bh=/l2fX463LopqOkncFpKk4NY9RuVr3nslOqTzqkmW8fs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kyjxtejuKBfvES1shbI42hI6dDUQaBw0gVv4f2PP7wlZay54WyAV7K5lZ7VNr/FZ5OnIIj5fDe7RiqhX7pDVHy+RUB1Dga1Rn72eGsHZDYiDuJ+FQGX/hDO2jZ8vQuX0Xtz1DevrBDiAbcoF6AItcr1KYiji0gihuW71jfzY9qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Od9Hr3oU; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707828550; x=1739364550;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/l2fX463LopqOkncFpKk4NY9RuVr3nslOqTzqkmW8fs=;
  b=Od9Hr3oURxLvEQNdZBUMCPNP61LL61HCVSyZuZcrHHuA+pdMQVUCI5BX
   8SWC25PduKj2iIwH/+daM2eWHDFe3ewaBYKL6C4xvi1OhyqGUwUxf5yj4
   CSYDAGEobJlWsrQUM2G+16fODy7olpQQkvyD6/aOqnPCTsG6UIF4u2XXN
   lJrPEJNl+zXpLOMZGMu2Dc/ugtQliVyuQ8hZClLiEpbDB017UUu6FxnnN
   F6mqwB+YB0a23wElr3hlnLXAl8TC8SofEAQxw/Tzeq2mYDhKIC62tOZ1Q
   EIvqemTlTwPiyxjocSXpvH4scW8NyAnJEeqSPqD/OjnFol+Ilpevnu5zv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12467267"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="12467267"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 04:49:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="7486729"
Received: from marquiz-s-2.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.58])
  by fmviesa004.fm.intel.com with ESMTP; 13 Feb 2024 04:49:07 -0800
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Sanket Goswami <Sanket.Goswami@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	michael.j.ruhl@intel.com,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v3 6/6] i2c: designware: Implement generic polling mode code for Wangxun 10Gb NIC
Date: Tue, 13 Feb 2024 14:48:47 +0200
Message-ID: <20240213124847.672084-7-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213124847.672084-1-jarkko.nikula@linux.intel.com>
References: <20240213124847.672084-1-jarkko.nikula@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I got an idea the i2c-designware should not need duplicated state
machines for the interrupt and polling modes. The IP is practically the
same and state transitions happens in response to the events that can be
observed from the DW_IC_RAW_INTR_STAT register. Either by interrupts or
by polling.

Another reasons are the interrupt mode is the most tested, has handling
for special cases as well as transmit abort handling and those are
missing from two polling mode quirks.

Patch implements a generic polling mode by using existing code for
interrupt mode. This is done by moving event handling from the
i2c_dw_isr() into a new i2c_dw_process_transfer() that will be called
both from the i2c_dw_isr() and a polling loop.

Polling loop is implemented in a new i2c_dw_wait_transfer() that is
shared between both modes. In interrupt mode it waits for the completion
object as before. In polling mode both completion object and
DW_IC_RAW_INTR_STAT are polled to determine completed transfer and state
transitions.

Loop tries to save power by sleeping "stetson guessed" range between
3 and 25 µS which falls between 10 cycles of High-speed mode 3.4 Mb/s
and Fast mode 400 kHz. With it the CPU usage was reduced under heavy
Fast mode I2C transfer without much increase in total transfer time but
otherwise no more effort has been put to optimize this.

I decided to convert the txgbe_i2c_dw_xfer_quirk() straight to generic
polling mode code in this patch. It doesn't have HW dependent quirks
like the amd_i2c_dw_xfer_quirk() does have and without users this patch
is needless.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-core.h   |   5 +
 drivers/i2c/busses/i2c-designware-master.c | 172 +++++++++------------
 2 files changed, 75 insertions(+), 102 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index bf8f140dc113..e9606c00b8d1 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -212,6 +212,7 @@ struct reset_control;
  * @msg_err: error status of the current transfer
  * @status: i2c master status, one of STATUS_*
  * @abort_source: copy of the TX_ABRT_SOURCE register
+ * @sw_mask: SW mask of DW_IC_INTR_MASK used in polling mode
  * @irq: interrupt number for the i2c master
  * @flags: platform specific flags like type of IO accessors or model
  * @adapter: i2c subsystem adapter node
@@ -270,6 +271,7 @@ struct dw_i2c_dev {
 	int			msg_err;
 	unsigned int		status;
 	unsigned int		abort_source;
+	unsigned int		sw_mask;
 	int			irq;
 	u32			flags;
 	struct i2c_adapter	adapter;
@@ -358,6 +360,7 @@ static inline void __i2c_dw_write_intr_mask(struct dw_i2c_dev *dev,
 	unsigned int val = dev->flags & ACCESS_POLLING ? 0 : intr_mask;
 
 	regmap_write(dev->map, DW_IC_INTR_MASK, val);
+	dev->sw_mask = intr_mask;
 }
 
 static inline void __i2c_dw_read_intr_mask(struct dw_i2c_dev *dev,
@@ -365,6 +368,8 @@ static inline void __i2c_dw_read_intr_mask(struct dw_i2c_dev *dev,
 {
 	if (!(dev->flags & ACCESS_POLLING))
 		regmap_read(dev->map, DW_IC_INTR_MASK, intr_mask);
+	else
+		*intr_mask = dev->sw_mask;
 }
 
 void __i2c_dw_disable(struct dw_i2c_dev *dev);
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 7c8e95fef9c8..c7e56002809a 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -354,67 +354,6 @@ static int amd_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	return 0;
 }
 
-static int i2c_dw_poll_tx_empty(struct dw_i2c_dev *dev)
-{
-	u32 val;
-
-	return regmap_read_poll_timeout(dev->map, DW_IC_RAW_INTR_STAT, val,
-					val & DW_IC_INTR_TX_EMPTY,
-					100, 1000);
-}
-
-static int i2c_dw_poll_rx_full(struct dw_i2c_dev *dev)
-{
-	u32 val;
-
-	return regmap_read_poll_timeout(dev->map, DW_IC_RAW_INTR_STAT, val,
-					val & DW_IC_INTR_RX_FULL,
-					100, 1000);
-}
-
-static int txgbe_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msgs,
-				   int num_msgs)
-{
-	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
-	int msg_idx, buf_len, data_idx, ret;
-	unsigned int val, stop = 0;
-	u8 *buf;
-
-	dev->msgs = msgs;
-	dev->msgs_num = num_msgs;
-	i2c_dw_xfer_init(dev);
-
-	for (msg_idx = 0; msg_idx < num_msgs; msg_idx++) {
-		buf = msgs[msg_idx].buf;
-		buf_len = msgs[msg_idx].len;
-
-		for (data_idx = 0; data_idx < buf_len; data_idx++) {
-			if (msg_idx == num_msgs - 1 && data_idx == buf_len - 1)
-				stop |= BIT(9);
-
-			if (msgs[msg_idx].flags & I2C_M_RD) {
-				regmap_write(dev->map, DW_IC_DATA_CMD, 0x100 | stop);
-
-				ret = i2c_dw_poll_rx_full(dev);
-				if (ret)
-					return ret;
-
-				regmap_read(dev->map, DW_IC_DATA_CMD, &val);
-				buf[data_idx] = val;
-			} else {
-				ret = i2c_dw_poll_tx_empty(dev);
-				if (ret)
-					return ret;
-
-				regmap_write(dev->map, DW_IC_DATA_CMD,
-					     buf[data_idx] | stop);
-			}
-		}
-	}
-
-	return num_msgs;
-}
-
 /*
  * Initiate (and continue) low level master read/write transaction.
  * This function is only called from i2c_dw_isr, and pumping i2c_msg
@@ -649,7 +588,12 @@ static u32 i2c_dw_read_clear_intrbits(struct dw_i2c_dev *dev)
 	 *
 	 * The raw version might be useful for debugging purposes.
 	 */
-	regmap_read(dev->map, DW_IC_INTR_STAT, &stat);
+	if (!(dev->flags & ACCESS_POLLING)) {
+		regmap_read(dev->map, DW_IC_INTR_STAT, &stat);
+	} else {
+		regmap_read(dev->map, DW_IC_RAW_INTR_STAT, &stat);
+		stat &= dev->sw_mask;
+	}
 
 	/*
 	 * Do not use the IC_CLR_INTR register to clear interrupts, or
@@ -689,37 +633,8 @@ static u32 i2c_dw_read_clear_intrbits(struct dw_i2c_dev *dev)
 	return stat;
 }
 
-/*
- * Interrupt service routine. This gets called whenever an I2C master interrupt
- * occurs.
- */
-static irqreturn_t i2c_dw_isr(int this_irq, void *dev_id)
+static void i2c_dw_process_transfer(struct dw_i2c_dev *dev, unsigned int stat)
 {
-	struct dw_i2c_dev *dev = dev_id;
-	unsigned int stat, enabled;
-
-	regmap_read(dev->map, DW_IC_ENABLE, &enabled);
-	regmap_read(dev->map, DW_IC_RAW_INTR_STAT, &stat);
-	if (!enabled || !(stat & ~DW_IC_INTR_ACTIVITY))
-		return IRQ_NONE;
-	if (pm_runtime_suspended(dev->dev) || stat == GENMASK(31, 0))
-		return IRQ_NONE;
-	dev_dbg(dev->dev, "enabled=%#x stat=%#x\n", enabled, stat);
-
-	stat = i2c_dw_read_clear_intrbits(dev);
-
-	if (!(dev->status & STATUS_ACTIVE)) {
-		/*
-		 * Unexpected interrupt in driver point of view. State
-		 * variables are either unset or stale so acknowledge and
-		 * disable interrupts for suppressing further interrupts if
-		 * interrupt really came from this HW (E.g. firmware has left
-		 * the HW active).
-		 */
-		__i2c_dw_write_intr_mask(dev, 0);
-		return IRQ_HANDLED;
-	}
-
 	if (stat & DW_IC_INTR_TX_ABRT) {
 		dev->cmd_err |= DW_IC_ERR_TX_ABRT;
 		dev->status &= ~STATUS_MASK;
@@ -755,10 +670,71 @@ static irqreturn_t i2c_dw_isr(int this_irq, void *dev_id)
 		__i2c_dw_write_intr_mask(dev, 0);
 		__i2c_dw_write_intr_mask(dev, stat);
 	}
+}
+
+/*
+ * Interrupt service routine. This gets called whenever an I2C master interrupt
+ * occurs.
+ */
+static irqreturn_t i2c_dw_isr(int this_irq, void *dev_id)
+{
+	struct dw_i2c_dev *dev = dev_id;
+	unsigned int stat, enabled;
+
+	regmap_read(dev->map, DW_IC_ENABLE, &enabled);
+	regmap_read(dev->map, DW_IC_RAW_INTR_STAT, &stat);
+	if (!enabled || !(stat & ~DW_IC_INTR_ACTIVITY))
+		return IRQ_NONE;
+	if (pm_runtime_suspended(dev->dev) || stat == GENMASK(31, 0))
+		return IRQ_NONE;
+	dev_dbg(dev->dev, "enabled=%#x stat=%#x\n", enabled, stat);
+
+	stat = i2c_dw_read_clear_intrbits(dev);
+
+	if (!(dev->status & STATUS_ACTIVE)) {
+		/*
+		 * Unexpected interrupt in driver point of view. State
+		 * variables are either unset or stale so acknowledge and
+		 * disable interrupts for suppressing further interrupts if
+		 * interrupt really came from this HW (E.g. firmware has left
+		 * the HW active).
+		 */
+		__i2c_dw_write_intr_mask(dev, 0);
+		return IRQ_HANDLED;
+	}
+
+	i2c_dw_process_transfer(dev, stat);
 
 	return IRQ_HANDLED;
 }
 
+static int i2c_dw_wait_transfer(struct dw_i2c_dev *dev)
+{
+	unsigned long timeout = dev->adapter.timeout;
+	unsigned int stat;
+	int ret;
+
+	if (!(dev->flags & ACCESS_POLLING)) {
+		ret = wait_for_completion_timeout(&dev->cmd_complete, timeout);
+	} else {
+		timeout += jiffies;
+		do {
+			ret = try_wait_for_completion(&dev->cmd_complete);
+			if (ret)
+				break;
+
+			stat = i2c_dw_read_clear_intrbits(dev);
+			if (stat)
+				i2c_dw_process_transfer(dev, stat);
+			else
+				/* Try save some power */
+				usleep_range(3, 25);
+		} while (time_before(jiffies, timeout));
+	}
+
+	return ret ? 0 : -ETIMEDOUT;
+}
+
 /*
  * Prepare controller for a transaction and call i2c_dw_xfer_msg.
  */
@@ -772,18 +748,10 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 
 	pm_runtime_get_sync(dev->dev);
 
-	/*
-	 * Initiate I2C message transfer when polling mode is enabled,
-	 * As it is polling based transfer mechanism, which does not support
-	 * interrupt based functionalities of existing DesignWare driver.
-	 */
 	switch (dev->flags & MODEL_MASK) {
 	case MODEL_AMD_NAVI_GPU:
 		ret = amd_i2c_dw_xfer_quirk(adap, msgs, num);
 		goto done_nolock;
-	case MODEL_WANGXUN_SP:
-		ret = txgbe_i2c_dw_xfer_quirk(adap, msgs, num);
-		goto done_nolock;
 	default:
 		break;
 	}
@@ -811,12 +779,12 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	i2c_dw_xfer_init(dev);
 
 	/* Wait for tx to complete */
-	if (!wait_for_completion_timeout(&dev->cmd_complete, adap->timeout)) {
+	ret = i2c_dw_wait_transfer(dev);
+	if (ret) {
 		dev_err(dev->dev, "controller timed out\n");
 		/* i2c_dw_init_master() implicitly disables the adapter */
 		i2c_recover_bus(&dev->adapter);
 		i2c_dw_init_master(dev);
-		ret = -ETIMEDOUT;
 		goto done;
 	}
 
-- 
2.43.0


