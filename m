Return-Path: <linux-i2c+bounces-1554-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCAD58441A3
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jan 2024 15:17:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1C3E1C21545
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jan 2024 14:17:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47EE37F48F;
	Wed, 31 Jan 2024 14:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QhnrsEsd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CD180C1D
	for <linux-i2c@vger.kernel.org>; Wed, 31 Jan 2024 14:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706710641; cv=none; b=jH6FlN2gqNS2Rxxqzv8yt9Q6AIuttaE/NiDwhpnoe6Gi0V94uMILrEi0LF8FTnb/+pimGzulQPeF02zK77qomL25GhbakMmc3UpXARIma6EBt3L3vhqzSH3xZJxtIV0rWO/7LdEC0rWwBDANqsja1OBq1LI1fC1/HpocXosPgYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706710641; c=relaxed/simple;
	bh=UoiwHy7xqEgMy8eOAK4q8jh0JHOFwvCIB7tA/aMNWu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EXPy4dJ3fHEl7TawsVNt+uLFGc2vou8ZXDg1Ix3G2J7edkaME0re3v2y1CzBRmISKAaN05KAilcFh8b7JXmhoR+jq2GmQQBKtsqQZ5og4EFH7vp6tnKC2UzBZHpSJUHDRG5U2wK0d7HEQyHmRjA8MpD8X+x86r3GApKNsNgLz88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QhnrsEsd; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706710640; x=1738246640;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=UoiwHy7xqEgMy8eOAK4q8jh0JHOFwvCIB7tA/aMNWu8=;
  b=QhnrsEsdI3h2DTvh8JoBM11RYtlFasdm1lFy8UL1xTC6aiw6K0vdNSci
   7ScQQwoHvoqGvnzRyS87pmxdQeoEj3udDznZv+3KBMF6JoHzFUV4+UZeU
   JjDCAZgk9c+T2Ikc6sZ3H80bsWHbZ+n6wasvjn8SJZuatx1Ml5JC97UxJ
   03up3LeqeSkwzPj04jx4muLXvwU1lPaI2AEmA7Uni3F0uBgLZBHVSWYBq
   j4D0ZSxOb+pGGiCz7yTYbei4YIWA8WPImwU6nGBCbFb5G/tQMjuW92YiW
   kV52FMS7CfsPSYShYirkC5NhT3VMLq6Dz0wPYdqvsuMbxCnrnvvGlHsAV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3460485"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="3460485"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 06:17:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="788591904"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="788591904"
Received: from unknown (HELO mylly.fi.intel.com.) ([10.237.72.79])
  by orsmga002.jf.intel.com with ESMTP; 31 Jan 2024 06:17:15 -0800
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
	Sanket Goswami <Sanket.Goswami@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Ruhl@web.codeaurora.org, Michael J <michael.j.ruhl@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 4/6] i2c: designware: Move interrupt handling functions before i2c_dw_xfer()
Date: Wed, 31 Jan 2024 16:16:50 +0200
Message-ID: <20240131141653.2689260-5-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240131141653.2689260-1-jarkko.nikula@linux.intel.com>
References: <20240131141653.2689260-1-jarkko.nikula@linux.intel.com>
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

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-master.c | 226 ++++++++++-----------
 1 file changed, 113 insertions(+), 113 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 2e8f9733ddd3..856c955c6560 100644
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
+		/* i2c_dw_init implicitly disables the adapter */
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
+	 * the following transfer.  Needs some more investigation if the
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


