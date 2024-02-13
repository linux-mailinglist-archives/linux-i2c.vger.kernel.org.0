Return-Path: <linux-i2c+bounces-1698-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0288530E1
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Feb 2024 13:49:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE5F11C21D6D
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Feb 2024 12:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 225BE42076;
	Tue, 13 Feb 2024 12:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZOonI1Y4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592D942074
	for <linux-i2c@vger.kernel.org>; Tue, 13 Feb 2024 12:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707828545; cv=none; b=MwOPz9RwYcGUfXprwp/F9vEz8+Jr09cVELVpRE0EwdVDVxeoOLByUpLIE3gcJtYUW+v1BITYWT8q96XeBVOT7kcgSFWdTeq3xVbNF9TlR3yMt+0QAlGjrFf8EyUcur0tJ0PajEsIAkoSO3fuxG/U11DOSgsA6s9vdzJMXfn0IvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707828545; c=relaxed/simple;
	bh=1hML6MS2qRRElgzutzOiaNSGVRT/50yW+sXvGpxuosk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cfd5vSVpU0yC6K//bJBmgPHL/ROUVucjoy9YpXyyi3OB5K1fa28/BlV3Y1AtvSWzOudDl4vI7TZGdZRNd/AL+Z0bH0Bo5r3UlG13HmgrSQq85vnzaCHLdz/rLnfZmkgYb7wAbhnHcfGqBjScO5uFSBlIo9ybVFjSecoKMV2230c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZOonI1Y4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707828544; x=1739364544;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1hML6MS2qRRElgzutzOiaNSGVRT/50yW+sXvGpxuosk=;
  b=ZOonI1Y4XlFugFTvis7U0MzjizRVXal2C6akjSCNToRFKBOyIgy5OpzM
   DgoB91MgWViGdTrFc/KF67qBi0cde8JBC1C6OkOR218qvkIvRCKNp44iF
   i0NRX3qSq+4cZMoZSQIOcPFbOWIZCCNaO73FXOlqrSGTU+ARcmriKl8p3
   0o8saSkxoU5MdAOWg359n1sh09ckDUE85gs6Qbb9WT4Iwocjf1rSeNZFR
   sByya+1IyVeVLDKzQggPT/WaQUk2ggk8pV2aVGmgkRJvW9GjOWX5d208m
   bggKrCHn1hZI6nQFUG/p9qdiy4qoLQt6vbngd2VV6UrQk4lSMeHcsaq07
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12467251"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="12467251"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 04:49:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="7486696"
Received: from marquiz-s-2.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.58])
  by fmviesa004.fm.intel.com with ESMTP; 13 Feb 2024 04:49:01 -0800
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
Subject: [PATCH v3 4/6] i2c: designware: Move interrupt handling functions before i2c_dw_xfer()
Date: Tue, 13 Feb 2024 14:48:45 +0200
Message-ID: <20240213124847.672084-5-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213124847.672084-1-jarkko.nikula@linux.intel.com>
References: <20240213124847.672084-1-jarkko.nikula@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Code is more logically arranged when i2c_dw_read_clear_intrbits() and
i2c_dw_isr() are located before i2c_dw_xfer().

Real reason for this is to prepare for more shared code between
interrupt and polling mode code.

While at it, remove one extra space and refer to the
i2c_dw_init_master() in two comment sections.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 226 ++++++++++-----------
 1 file changed, 113 insertions(+), 113 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 2e8f9733ddd3..7c8e95fef9c8 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -633,119 +633,6 @@ i2c_dw_read(struct dw_i2c_dev *dev)
 	}
 }
 
-/*
- * Prepare controller for a transaction and call i2c_dw_xfer_msg.
- */
-static int
-i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
-{
-	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
-	int ret;
-
-	dev_dbg(dev->dev, "%s: msgs: %d\n", __func__, num);
-
-	pm_runtime_get_sync(dev->dev);
-
-	/*
-	 * Initiate I2C message transfer when polling mode is enabled,
-	 * As it is polling based transfer mechanism, which does not support
-	 * interrupt based functionalities of existing DesignWare driver.
-	 */
-	switch (dev->flags & MODEL_MASK) {
-	case MODEL_AMD_NAVI_GPU:
-		ret = amd_i2c_dw_xfer_quirk(adap, msgs, num);
-		goto done_nolock;
-	case MODEL_WANGXUN_SP:
-		ret = txgbe_i2c_dw_xfer_quirk(adap, msgs, num);
-		goto done_nolock;
-	default:
-		break;
-	}
-
-	reinit_completion(&dev->cmd_complete);
-	dev->msgs = msgs;
-	dev->msgs_num = num;
-	dev->cmd_err = 0;
-	dev->msg_write_idx = 0;
-	dev->msg_read_idx = 0;
-	dev->msg_err = 0;
-	dev->status = 0;
-	dev->abort_source = 0;
-	dev->rx_outstanding = 0;
-
-	ret = i2c_dw_acquire_lock(dev);
-	if (ret)
-		goto done_nolock;
-
-	ret = i2c_dw_wait_bus_not_busy(dev);
-	if (ret < 0)
-		goto done;
-
-	/* Start the transfers */
-	i2c_dw_xfer_init(dev);
-
-	/* Wait for tx to complete */
-	if (!wait_for_completion_timeout(&dev->cmd_complete, adap->timeout)) {
-		dev_err(dev->dev, "controller timed out\n");
-		/* i2c_dw_init implicitly disables the adapter */
-		i2c_recover_bus(&dev->adapter);
-		i2c_dw_init_master(dev);
-		ret = -ETIMEDOUT;
-		goto done;
-	}
-
-	/*
-	 * We must disable the adapter before returning and signaling the end
-	 * of the current transfer. Otherwise the hardware might continue
-	 * generating interrupts which in turn causes a race condition with
-	 * the following transfer.  Needs some more investigation if the
-	 * additional interrupts are a hardware bug or this driver doesn't
-	 * handle them correctly yet.
-	 */
-	__i2c_dw_disable_nowait(dev);
-
-	if (dev->msg_err) {
-		ret = dev->msg_err;
-		goto done;
-	}
-
-	/* No error */
-	if (likely(!dev->cmd_err && !dev->status)) {
-		ret = num;
-		goto done;
-	}
-
-	/* We have an error */
-	if (dev->cmd_err == DW_IC_ERR_TX_ABRT) {
-		ret = i2c_dw_handle_tx_abort(dev);
-		goto done;
-	}
-
-	if (dev->status)
-		dev_err(dev->dev,
-			"transfer terminated early - interrupt latency too high?\n");
-
-	ret = -EIO;
-
-done:
-	i2c_dw_release_lock(dev);
-
-done_nolock:
-	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
-
-	return ret;
-}
-
-static const struct i2c_algorithm i2c_dw_algo = {
-	.master_xfer = i2c_dw_xfer,
-	.functionality = i2c_dw_func,
-};
-
-static const struct i2c_adapter_quirks i2c_dw_quirks = {
-	.flags = I2C_AQ_NO_ZERO_LEN,
-};
-
 static u32 i2c_dw_read_clear_intrbits(struct dw_i2c_dev *dev)
 {
 	unsigned int stat, dummy;
@@ -872,6 +759,119 @@ static irqreturn_t i2c_dw_isr(int this_irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+/*
+ * Prepare controller for a transaction and call i2c_dw_xfer_msg.
+ */
+static int
+i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
+{
+	struct dw_i2c_dev *dev = i2c_get_adapdata(adap);
+	int ret;
+
+	dev_dbg(dev->dev, "%s: msgs: %d\n", __func__, num);
+
+	pm_runtime_get_sync(dev->dev);
+
+	/*
+	 * Initiate I2C message transfer when polling mode is enabled,
+	 * As it is polling based transfer mechanism, which does not support
+	 * interrupt based functionalities of existing DesignWare driver.
+	 */
+	switch (dev->flags & MODEL_MASK) {
+	case MODEL_AMD_NAVI_GPU:
+		ret = amd_i2c_dw_xfer_quirk(adap, msgs, num);
+		goto done_nolock;
+	case MODEL_WANGXUN_SP:
+		ret = txgbe_i2c_dw_xfer_quirk(adap, msgs, num);
+		goto done_nolock;
+	default:
+		break;
+	}
+
+	reinit_completion(&dev->cmd_complete);
+	dev->msgs = msgs;
+	dev->msgs_num = num;
+	dev->cmd_err = 0;
+	dev->msg_write_idx = 0;
+	dev->msg_read_idx = 0;
+	dev->msg_err = 0;
+	dev->status = 0;
+	dev->abort_source = 0;
+	dev->rx_outstanding = 0;
+
+	ret = i2c_dw_acquire_lock(dev);
+	if (ret)
+		goto done_nolock;
+
+	ret = i2c_dw_wait_bus_not_busy(dev);
+	if (ret < 0)
+		goto done;
+
+	/* Start the transfers */
+	i2c_dw_xfer_init(dev);
+
+	/* Wait for tx to complete */
+	if (!wait_for_completion_timeout(&dev->cmd_complete, adap->timeout)) {
+		dev_err(dev->dev, "controller timed out\n");
+		/* i2c_dw_init_master() implicitly disables the adapter */
+		i2c_recover_bus(&dev->adapter);
+		i2c_dw_init_master(dev);
+		ret = -ETIMEDOUT;
+		goto done;
+	}
+
+	/*
+	 * We must disable the adapter before returning and signaling the end
+	 * of the current transfer. Otherwise the hardware might continue
+	 * generating interrupts which in turn causes a race condition with
+	 * the following transfer. Needs some more investigation if the
+	 * additional interrupts are a hardware bug or this driver doesn't
+	 * handle them correctly yet.
+	 */
+	__i2c_dw_disable_nowait(dev);
+
+	if (dev->msg_err) {
+		ret = dev->msg_err;
+		goto done;
+	}
+
+	/* No error */
+	if (likely(!dev->cmd_err && !dev->status)) {
+		ret = num;
+		goto done;
+	}
+
+	/* We have an error */
+	if (dev->cmd_err == DW_IC_ERR_TX_ABRT) {
+		ret = i2c_dw_handle_tx_abort(dev);
+		goto done;
+	}
+
+	if (dev->status)
+		dev_err(dev->dev,
+			"transfer terminated early - interrupt latency too high?\n");
+
+	ret = -EIO;
+
+done:
+	i2c_dw_release_lock(dev);
+
+done_nolock:
+	pm_runtime_mark_last_busy(dev->dev);
+	pm_runtime_put_autosuspend(dev->dev);
+
+	return ret;
+}
+
+static const struct i2c_algorithm i2c_dw_algo = {
+	.master_xfer = i2c_dw_xfer,
+	.functionality = i2c_dw_func,
+};
+
+static const struct i2c_adapter_quirks i2c_dw_quirks = {
+	.flags = I2C_AQ_NO_ZERO_LEN,
+};
+
 void i2c_dw_configure_master(struct dw_i2c_dev *dev)
 {
 	struct i2c_timings *t = &dev->timings;
-- 
2.43.0


