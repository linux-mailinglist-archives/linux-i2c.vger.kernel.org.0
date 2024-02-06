Return-Path: <linux-i2c+bounces-1649-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D684384B86E
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 15:52:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8E51528613F
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 14:52:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 915B313328A;
	Tue,  6 Feb 2024 14:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="asgOXhnD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2BC131E53
	for <linux-i2c@vger.kernel.org>; Tue,  6 Feb 2024 14:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707231155; cv=none; b=ViP5UV5HR+13QHUVL8EHvpnSwdkzFFcQh+VOhVYcHbQT7EILVp/1wHs644LQL0SKKDiOyLXFhxSLE3CS0lvOPfF9YZfpjdZIH4BRNuPA7D9VLI2W6VCC+2xmJ+9hzKzxAIUpsSxzAhaZvKANOCZ3zdboUUVFrMusOmY7p/qj1e8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707231155; c=relaxed/simple;
	bh=B6mG1u9IFmK5V0XW/+xsw1/HsXCcEbp1ivsRgNJyH40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kuQ/fDK/LpkeZuV+3YeHzDaqUAlPS1mm9orFYYJVuuYRp6Ncw4Of8Q2vkamBn/JKQpuKKKFibANRm4iwjQRCQ9FEDSOxomucv+EqsR/gJaP2nwOMRKNkMyD/MYJWeFjSz+2xJ7FQiMSbV4QYhnj1dnsp+w0nr4PNnva3NafTAck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=asgOXhnD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707231153; x=1738767153;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=B6mG1u9IFmK5V0XW/+xsw1/HsXCcEbp1ivsRgNJyH40=;
  b=asgOXhnDPwDbwkBjSQJM8lE1hRE1DkE8DlDqN73fdzGbtjhJty5SHM+H
   kIevLb/ojk5CehiyancXvi68ciBCbAo67zdCKxFmy7z6kIfAmW0tjnhuO
   BeYorFDQ1u/r8QguNJ08Mc7/+9P0AbJQrUfp/4qriVdOA170vQUcHv/NO
   nLoP9UqY/dY8pTCchduggpwnp08extVWA+A7kJvQj+GcvIsYv3V5Vddfz
   uvhnkNJ2Xc+JZihcBfqJUh3q4iTSg8Yn40kJH+2KWabYk4UonuhLaNVqK
   ivlJKRYXH+TRLejkswFAS2TqSbrQcNx4f0FrTDARMe0s3IR5ZRUfHj+7G
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="26206756"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="26206756"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 06:52:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="933482058"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="933482058"
Received: from marquiz-s-2.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.58])
  by fmsmga001.fm.intel.com with ESMTP; 06 Feb 2024 06:52:30 -0800
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
	Hans de Goede <hdegoede@redhat.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v2 9/9] i2c: designware: Implement generic polling mode code for Wangxun 10Gb NIC
Date: Tue,  6 Feb 2024 16:51:58 +0200
Message-ID: <20240206145158.227254-10-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206145158.227254-1-jarkko.nikula@linux.intel.com>
References: <20240206145158.227254-1-jarkko.nikula@linux.intel.com>
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
 drivers/i2c/busses/i2c-designware-master.c | 169 +++++++++------------
 2 files changed, 77 insertions(+), 97 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 94da70ce1f32..b62206db4f09 100644
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
@@ -269,6 +270,7 @@ struct dw_i2c_dev {
 	int			msg_err;
 	unsigned int		status;
 	unsigned int		abort_source;
+	unsigned int		sw_mask;
 	int			irq;
 	u32			flags;
 	struct i2c_adapter	adapter;
@@ -359,6 +361,7 @@ static inline void __i2c_dw_write_intr_mask(struct dw_i2c_dev *dev,
 	unsigned int val = dev->flags & ACCESS_POLLING ? 0 : intr_mask;
 
 	regmap_write(dev->map, DW_IC_INTR_MASK, val);
+	dev->sw_mask = intr_mask;
 }
 
 static inline void __i2c_dw_read_intr_mask(struct dw_i2c_dev *dev,
@@ -366,6 +369,8 @@ static inline void __i2c_dw_read_intr_mask(struct dw_i2c_dev *dev,
 {
 	if (!(dev->flags & ACCESS_POLLING))
 		regmap_read(dev->map, DW_IC_INTR_MASK, intr_mask);
+	else
+		*intr_mask = dev->sw_mask;
 }
 
 void __i2c_dw_disable(struct dw_i2c_dev *dev);
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 856c955c6560..5897fad544c0 100644
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
@@ -755,10 +670,73 @@ static irqreturn_t i2c_dw_isr(int this_irq, void *dev_id)
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
+	int ret = 0;
+
+	if (!(dev->flags & ACCESS_POLLING)) {
+		ret = wait_for_completion_timeout(&dev->cmd_complete,
+						  timeout) ? 0 : -ETIMEDOUT;
+	} else {
+		timeout += jiffies;
+		do {
+			if (try_wait_for_completion(&dev->cmd_complete))
+				goto out;
+
+			stat = i2c_dw_read_clear_intrbits(dev);
+			if (stat)
+				i2c_dw_process_transfer(dev, stat);
+			else
+				/* Try save some power */
+				usleep_range(3, 25);
+		} while (time_before(jiffies, timeout));
+		ret = ETIMEDOUT;
+	}
+
+out:
+	return ret;
+}
+
 /*
  * Prepare controller for a transaction and call i2c_dw_xfer_msg.
  */
@@ -781,9 +759,6 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	case MODEL_AMD_NAVI_GPU:
 		ret = amd_i2c_dw_xfer_quirk(adap, msgs, num);
 		goto done_nolock;
-	case MODEL_WANGXUN_SP:
-		ret = txgbe_i2c_dw_xfer_quirk(adap, msgs, num);
-		goto done_nolock;
 	default:
 		break;
 	}
@@ -811,12 +786,12 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	i2c_dw_xfer_init(dev);
 
 	/* Wait for tx to complete */
-	if (!wait_for_completion_timeout(&dev->cmd_complete, adap->timeout)) {
+	ret = i2c_dw_wait_transfer(dev);
+	if (ret) {
 		dev_err(dev->dev, "controller timed out\n");
 		/* i2c_dw_init implicitly disables the adapter */
 		i2c_recover_bus(&dev->adapter);
 		i2c_dw_init_master(dev);
-		ret = -ETIMEDOUT;
 		goto done;
 	}
 
-- 
2.43.0


