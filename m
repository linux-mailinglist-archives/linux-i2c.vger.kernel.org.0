Return-Path: <linux-i2c+bounces-1697-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C8B8530E0
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Feb 2024 13:49:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B07D41C21924
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Feb 2024 12:49:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20EAC4207A;
	Tue, 13 Feb 2024 12:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UKyapQ7R"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7E342074
	for <linux-i2c@vger.kernel.org>; Tue, 13 Feb 2024 12:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707828542; cv=none; b=lrjLuAC4afGzTVqR15D7YHCHuuePeXhOJ91n9CaQfviWkd863jeWasfIRd8gPlpl++9VE8JTGzTIAkBvjkCIHsDof6+WJ9PHVNTDvCpvdh01z7jnGhqDLIKMQwT86Si88HLEdKf3OT1on16B/50WgMWt5+9NZhdw7xQVmrhGHFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707828542; c=relaxed/simple;
	bh=CCOkECtyYC7+84Htb6YkffVn0zFMf6Enor5lfqSj8IU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iQhnc5No+hf0udr1cCNqVkdFaYWDOQPIzkquMnyizOYzs6g76DseTz33j2fHX8ofuKvCer7DqNcb2HBqaXFs3bqStjUvrZIMD85y6EKOOriKLfiGrXNKjwlJVsW9QIk1z8OFIJpX6fu9QLsteS2ofEAORYWgcDIbmhPld+SVLhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UKyapQ7R; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707828541; x=1739364541;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CCOkECtyYC7+84Htb6YkffVn0zFMf6Enor5lfqSj8IU=;
  b=UKyapQ7Rb6gsl9kYCn0JthegdTjXw+ID2+h6V9Q57Ob72HvJD1dbHd/f
   bQ7760B29qjZzvPlMP7EcsyLhqZs77iB+yM5GH8dLQZijY4yRtdnAI7/X
   h8PdMd3GRw+NsxNcZTMSdHZY/c0LD58Dl3eG7gF+Fx4yL87EJ+PQJoaxZ
   Fw1gyMw7tJLpJn+HY+xkkQsuDmgeqQQBt6cJG+lLFbZtrLnmhNzQ59id0
   kfQdLi0l9ROl/v7DUdIh8gMH6pCfWUCj0J32aMbj7z8/swsxSnCaoLE6T
   Sav7/TFK7VTuwxKTsYfo+txkXae4Pf06+Y48TG5c3J8JraEg5130eZ6DI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12467242"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="12467242"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 04:49:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="7486668"
Received: from marquiz-s-2.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.58])
  by fmviesa004.fm.intel.com with ESMTP; 13 Feb 2024 04:48:59 -0800
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
Subject: [PATCH v3 3/6] i2c: designware: Use accessors to DW_IC_INTR_MASK register
Date: Tue, 13 Feb 2024 14:48:44 +0200
Message-ID: <20240213124847.672084-4-jarkko.nikula@linux.intel.com>
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


