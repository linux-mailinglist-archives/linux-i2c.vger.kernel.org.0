Return-Path: <linux-i2c+bounces-1696-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8CC8530DF
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Feb 2024 13:49:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C673D1F22877
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Feb 2024 12:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E6342076;
	Tue, 13 Feb 2024 12:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bzQDaCS4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0781542074
	for <linux-i2c@vger.kernel.org>; Tue, 13 Feb 2024 12:48:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707828540; cv=none; b=MXOMCOGFFOgaxMCBEeqHAuWSTUAKZ9/IAcOiwzIadXRsToGk9gkC4DepPyion0zSb3Jc3EmQPwbBGdbNE4uYfUd8ACuidmzUZHEPIIqZ9RChji/u1tI5iVcmY/ulrW74r4J9d5yHWmLzV917HqAtKjCeP+Cj+CHyMNVYtZu0hzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707828540; c=relaxed/simple;
	bh=I1INptr4wTgwgYhDkfo04O8YwbWCb1lkt0P6xrSuK78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ohq8pHCqy2tR3DbOyRTskxOJeFFyKIdqCq5S/1ZbYFkDpzRXAagqPiqk3OlhMoanGLHNsT1be3uSCxFeJXkpK+zwadERst4GKUw8404kfo3JyYqN8rdq12zd7mIFyoBdOEWZ7PuD7J3L9peOTNOHayIQpSkTQ55KhwBZBC4O4zM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bzQDaCS4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707828539; x=1739364539;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I1INptr4wTgwgYhDkfo04O8YwbWCb1lkt0P6xrSuK78=;
  b=bzQDaCS4pRFVlOhdZg7GD2Zn2bumDywrrB7TxMWojO9THVYc/vqmeXCX
   E6ZNqNJoDUFRg+8b5KO8Vpf84ObUO80E+7JPT46GH1OT3IkyF97Ko4FPj
   Sl7q1xXPfBYgT8ogjx6iGfQKDR3W97JlRHVTL5BTcqjFMKBOkwMTzZg03
   0lRQr4669ZYJt5n/RU//v5zgaCXcPiNwFJ48FxrTZqRYGt/hEB4R6o3r/
   8AGnh8icI9YYKEiw/hLmpvWzdXqBYl97d4swmskV+EH8NxtSyacSkNj/k
   9guNK6lw1rJ56Ow+BK2XgdFKfFqGj3hkvZu6hmFVJgy26i7n8S//xJEsS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12467233"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="12467233"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 04:48:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="7486648"
Received: from marquiz-s-2.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.58])
  by fmviesa004.fm.intel.com with ESMTP; 13 Feb 2024 04:48:56 -0800
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
Subject: [PATCH v3 2/6] i2c: designware: Do not enable interrupts shortly in polling mode
Date: Tue, 13 Feb 2024 14:48:43 +0200
Message-ID: <20240213124847.672084-3-jarkko.nikula@linux.intel.com>
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

I was testing the polling mode txgbe_i2c_dw_xfer_quirk() on a HW where
the i2c-designware has interrupt connected and shared with other device.
I noticed there is a bogus interrupt for each transfer.

Reason for this that both polling mode functions call the
i2c_dw_xfer_init() which enable interrupts then followed by immediate
disable by the same polling mode functions. This is enough to trigger
TX_EMPTY interrupt.

Fix this by introducing a __i2c_dw_write_intr_mask() helper that unmasks
interrupts conditionally and use it in i2c_dw_xfer_init().

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-core.h   | 8 ++++++++
 drivers/i2c/busses/i2c-designware-master.c | 4 +---
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 78c8062a8eb5..8ce6111cdda3 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -352,6 +352,14 @@ static inline void __i2c_dw_disable_nowait(struct dw_i2c_dev *dev)
 	dev->status &= ~STATUS_ACTIVE;
 }
 
+static inline void __i2c_dw_write_intr_mask(struct dw_i2c_dev *dev,
+					    unsigned int intr_mask)
+{
+	unsigned int val = dev->flags & ACCESS_POLLING ? 0 : intr_mask;
+
+	regmap_write(dev->map, DW_IC_INTR_MASK, val);
+}
+
 void __i2c_dw_disable(struct dw_i2c_dev *dev);
 
 extern void i2c_dw_configure_master(struct dw_i2c_dev *dev);
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index e879a0f5cc97..835d82e2c5fe 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -250,7 +250,7 @@ static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
 
 	/* Clear and enable interrupts */
 	regmap_read(dev->map, DW_IC_CLR_INTR, &dummy);
-	regmap_write(dev->map, DW_IC_INTR_MASK, DW_IC_INTR_MASTER_MASK);
+	__i2c_dw_write_intr_mask(dev, DW_IC_INTR_MASTER_MASK);
 }
 
 static int i2c_dw_check_stopbit(struct dw_i2c_dev *dev)
@@ -300,7 +300,6 @@ static int amd_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	dev->msgs = msgs;
 	dev->msgs_num = num_msgs;
 	i2c_dw_xfer_init(dev);
-	regmap_write(dev->map, DW_IC_INTR_MASK, 0);
 
 	/* Initiate messages read/write transaction */
 	for (msg_wrt_idx = 0; msg_wrt_idx < num_msgs; msg_wrt_idx++) {
@@ -384,7 +383,6 @@ static int txgbe_i2c_dw_xfer_quirk(struct i2c_adapter *adap, struct i2c_msg *msg
 	dev->msgs = msgs;
 	dev->msgs_num = num_msgs;
 	i2c_dw_xfer_init(dev);
-	regmap_write(dev->map, DW_IC_INTR_MASK, 0);
 
 	for (msg_idx = 0; msg_idx < num_msgs; msg_idx++) {
 		buf = msgs[msg_idx].buf;
-- 
2.43.0


