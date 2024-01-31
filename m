Return-Path: <linux-i2c+bounces-1552-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2418441A1
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jan 2024 15:17:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E2691F21B4A
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jan 2024 14:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41D880BFD;
	Wed, 31 Jan 2024 14:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dH+u8eJm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245B97F48F
	for <linux-i2c@vger.kernel.org>; Wed, 31 Jan 2024 14:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706710632; cv=none; b=UokapE9304VcqysGtWsPWXLKe7TkaqcoIbPeDLp7Tg9zruMyU0eAuXrYE1UpFz13t/ByNOejvOtfzYmHyB7EhgQ1n+utA02Ww2keheTzheCmKP1pWVJGn2lI4d0hbOojY7ZB5h2Po79jtUrTlCaFrGbqQOcKnpoOE4RhfQXV2dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706710632; c=relaxed/simple;
	bh=I1INptr4wTgwgYhDkfo04O8YwbWCb1lkt0P6xrSuK78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sx79ErvS3LeRYoU+MCOXivPVK4nfAb4Nrhb4Fiv2MdMqYYey8CkZGDhlIrjws5oH6Y0HzGEXvZzJaPvqjMWVR8AUvSbEqzbNs+1Hi3PsuFu4P5e0yGwjrVD9HkNCLK/gJ6OlUn+ahDueRDI9IuMrjr3Q0kHfgMUJ11p0x2oodzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dH+u8eJm; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706710632; x=1738246632;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I1INptr4wTgwgYhDkfo04O8YwbWCb1lkt0P6xrSuK78=;
  b=dH+u8eJmXeSYC8DGOT6djV3Uviuu4jKJzgBFbRWZlPuD/weQZnEJp2ZV
   1gX8a2roozxMIs5EKT2A05+xedbtRD0FRh9zZfr7dmviPv9ZkLnaXXVWu
   kBRy2y2cRx9KmN3s60tSU7ErniFw7hbDArS7kiUD14g6DmtGddWonN1ow
   Yeydh8YitakwhEY8QBPA3E2DAiXpkFbsDhV7Qyo/8tARLTkeo5iw3TjsA
   0uSd4P+MIUp9cgk6npThZNPJhKHS2bsRUqc3QwmwI14pkqTRr0yvr0wkw
   glmCqQCB8oHXmcu0gUImxXXSiVp4qMTiVImdjHGzx1M/b1kh2XGyKThC8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3460462"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="3460462"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 06:17:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="788591869"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="788591869"
Received: from unknown (HELO mylly.fi.intel.com.) ([10.237.72.79])
  by orsmga002.jf.intel.com with ESMTP; 31 Jan 2024 06:17:06 -0800
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
Subject: [PATCH 2/6] i2c: designware: Do not enable interrupts shortly in polling mode
Date: Wed, 31 Jan 2024 16:16:48 +0200
Message-ID: <20240131141653.2689260-3-jarkko.nikula@linux.intel.com>
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


