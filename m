Return-Path: <linux-i2c+bounces-1553-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 236E88441A2
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jan 2024 15:17:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33CC4B25CE2
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jan 2024 14:17:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35F6E80C17;
	Wed, 31 Jan 2024 14:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PaTUkz8L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72CD87F488
	for <linux-i2c@vger.kernel.org>; Wed, 31 Jan 2024 14:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706710637; cv=none; b=gDku5yD25Es3hRHdwQukoN4PmBBoCYW4y4bR4HqEPj0aO9L9LbTxVcajZzbKa7JM0Rx7E8qJdyh0VG/xWUO/ava37J3sXnCLSgw+cuLE6BVbCc8fVNb4+qpyI8WEOQSsSZvmyRVAem3+JaLyNeUYroSzY+qL0VfJ4BR6pGATlmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706710637; c=relaxed/simple;
	bh=CCOkECtyYC7+84Htb6YkffVn0zFMf6Enor5lfqSj8IU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XE/MdAGAG5fKrP8IfcXofwuCALcIpwNq6b5OCLuTKC1j+q0WuqEaZPPCOfInTpp8EY7+6qUdBnp/R9mSdqIuewx7YGDTrmAF8wza+YvKKNyIQhYwV5q9DPdyrcy2zierR9ZmHJS9o55O8kzzdB9rtEE2mrP5UTZxRD0zum0xXW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PaTUkz8L; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706710636; x=1738246636;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CCOkECtyYC7+84Htb6YkffVn0zFMf6Enor5lfqSj8IU=;
  b=PaTUkz8LDhlHkcNgtINdMW0pQGo/N40PMs95H4ERIr3fifnOukVGihvh
   9kUg+HYbM+HT+RQ089xT6Nyj+4KlN06Y2oppyhl0lORikGWjSSTBvT98J
   1/36eH3uf1gwWyQE0OH/TTH0986uwlt8kS1DHJ8A8w8KshntqE5aYJlUL
   0TZCgjcb0lwYL8XxkX7OHVB15m7nJP72DQVu5mcbMMUYqTaA8AnOFLCT9
   f5YOILWb0LwZ0/7LHXcUI3SOyi3lnghEKQJ06Ny0EhM1GXWdzC23g19TP
   aLpnGe7ZzSWCcT6CkoF+4pdl/x7lzt5kV0IRgzX2fDr+Bfn0m+E/RoG0L
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3460474"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="3460474"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 06:17:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="788591887"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="788591887"
Received: from unknown (HELO mylly.fi.intel.com.) ([10.237.72.79])
  by orsmga002.jf.intel.com with ESMTP; 31 Jan 2024 06:17:11 -0800
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
Subject: [PATCH 3/6] i2c: designware: Use accessors to DW_IC_INTR_MASK register
Date: Wed, 31 Jan 2024 16:16:49 +0200
Message-ID: <20240131141653.2689260-4-jarkko.nikula@linux.intel.com>
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

Convert access to DW_IC_INTR_MASK register using the existing
__i2c_dw_write_intr_mask() and a __i2c_dw_read_intr_mask() introduced
here. Motivation to this is to prepare for generic polling mode code
where polling mode will use a SW mask instead of DW_IC_INTR_MASK.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c |  2 +-
 drivers/i2c/busses/i2c-designware-core.h   |  7 +++++++
 drivers/i2c/busses/i2c-designware-master.c | 22 ++++++++++++----------
 3 files changed, 20 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 35f762872b8a..e8a688d04aee 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -648,7 +648,7 @@ void i2c_dw_disable(struct dw_i2c_dev *dev)
 	__i2c_dw_disable(dev);
 
 	/* Disable all interrupts */
-	regmap_write(dev->map, DW_IC_INTR_MASK, 0);
+	__i2c_dw_write_intr_mask(dev, 0);
 	regmap_read(dev->map, DW_IC_CLR_INTR, &dummy);
 
 	i2c_dw_release_lock(dev);
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 8ce6111cdda3..4d277ebcca92 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -360,6 +360,13 @@ static inline void __i2c_dw_write_intr_mask(struct dw_i2c_dev *dev,
 	regmap_write(dev->map, DW_IC_INTR_MASK, val);
 }
 
+static inline void __i2c_dw_read_intr_mask(struct dw_i2c_dev *dev,
+					   unsigned int *intr_mask)
+{
+	if (!(dev->flags & ACCESS_POLLING))
+		regmap_read(dev->map, DW_IC_INTR_MASK, intr_mask);
+}
+
 void __i2c_dw_disable(struct dw_i2c_dev *dev);
 
 extern void i2c_dw_configure_master(struct dw_i2c_dev *dev);
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 835d82e2c5fe..2e8f9733ddd3 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -240,7 +240,7 @@ static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
 		     msgs[dev->msg_write_idx].addr | ic_tar);
 
 	/* Enforce disabled interrupts (due to HW issues) */
-	regmap_write(dev->map, DW_IC_INTR_MASK, 0);
+	__i2c_dw_write_intr_mask(dev, 0);
 
 	/* Enable the adapter */
 	__i2c_dw_enable(dev);
@@ -544,7 +544,7 @@ i2c_dw_xfer_msg(struct dw_i2c_dev *dev)
 	if (dev->msg_err)
 		intr_mask = 0;
 
-	regmap_write(dev->map,  DW_IC_INTR_MASK, intr_mask);
+	__i2c_dw_write_intr_mask(dev, intr_mask);
 }
 
 static u8
@@ -552,6 +552,7 @@ i2c_dw_recv_len(struct dw_i2c_dev *dev, u8 len)
 {
 	struct i2c_msg *msgs = dev->msgs;
 	u32 flags = msgs[dev->msg_read_idx].flags;
+	unsigned int intr_mask;
 
 	/*
 	 * Adjust the buffer length and mask the flag
@@ -566,8 +567,9 @@ i2c_dw_recv_len(struct dw_i2c_dev *dev, u8 len)
 	 * Received buffer length, re-enable TX_EMPTY interrupt
 	 * to resume the SMBUS transaction.
 	 */
-	regmap_update_bits(dev->map, DW_IC_INTR_MASK, DW_IC_INTR_TX_EMPTY,
-			   DW_IC_INTR_TX_EMPTY);
+	__i2c_dw_read_intr_mask(dev, &intr_mask);
+	intr_mask |= DW_IC_INTR_TX_EMPTY;
+	__i2c_dw_write_intr_mask(dev, intr_mask);
 
 	return len;
 }
@@ -827,7 +829,7 @@ static irqreturn_t i2c_dw_isr(int this_irq, void *dev_id)
 		 * interrupt really came from this HW (E.g. firmware has left
 		 * the HW active).
 		 */
-		regmap_write(dev->map, DW_IC_INTR_MASK, 0);
+		__i2c_dw_write_intr_mask(dev, 0);
 		return IRQ_HANDLED;
 	}
 
@@ -840,7 +842,7 @@ static irqreturn_t i2c_dw_isr(int this_irq, void *dev_id)
 		 * Anytime TX_ABRT is set, the contents of the tx/rx
 		 * buffers are flushed. Make sure to skip them.
 		 */
-		regmap_write(dev->map, DW_IC_INTR_MASK, 0);
+		__i2c_dw_write_intr_mask(dev, 0);
 		goto tx_aborted;
 	}
 
@@ -862,9 +864,9 @@ static irqreturn_t i2c_dw_isr(int this_irq, void *dev_id)
 		complete(&dev->cmd_complete);
 	else if (unlikely(dev->flags & ACCESS_INTR_MASK)) {
 		/* Workaround to trigger pending interrupt */
-		regmap_read(dev->map, DW_IC_INTR_MASK, &stat);
-		regmap_write(dev->map, DW_IC_INTR_MASK, 0);
-		regmap_write(dev->map, DW_IC_INTR_MASK, stat);
+		__i2c_dw_read_intr_mask(dev, &stat);
+		__i2c_dw_write_intr_mask(dev, 0);
+		__i2c_dw_write_intr_mask(dev, stat);
 	}
 
 	return IRQ_HANDLED;
@@ -1016,7 +1018,7 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 	if (ret)
 		return ret;
 
-	regmap_write(dev->map, DW_IC_INTR_MASK, 0);
+	__i2c_dw_write_intr_mask(dev, 0);
 	i2c_dw_release_lock(dev);
 
 	if (!(dev->flags & ACCESS_POLLING)) {
-- 
2.43.0


