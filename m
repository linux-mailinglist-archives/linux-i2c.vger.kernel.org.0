Return-Path: <linux-i2c+bounces-1645-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCA684B86C
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 15:52:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7017A1C240D3
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 14:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 505B2132C39;
	Tue,  6 Feb 2024 14:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AWvJUHgA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E283132C26
	for <linux-i2c@vger.kernel.org>; Tue,  6 Feb 2024 14:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707231145; cv=none; b=SXMZD2uWK15HVkHiE/QBWmV8U9mgFyldTpZknDUCQ257gGqWj1Zl42vP6VQZ9H0AlJ7o8liG6m6cqoJ1rZSbTQS3FHyrFm/7eI9e7OhZoGhOn3zEhGn4IddWvNMilboiz5OU78G2iK2UlZn5qAVNRQX/2Y2Xb0MSSAKkE/lLx0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707231145; c=relaxed/simple;
	bh=R+4q0KD9BvmZdxD81eEs6HX9hWzEr3vbU7jF+NEAE3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gz37yi9FJJIsS/LlYwWR/5/oO2lBfrYJH0HG8tYxDFCezDfR2ZMcTt6sjWP6mcyVJ5PIzKT62vF6FMrrOP/TuSz/alTJFhhd0ZyVCbZaVMSdENuJwZwEI/f1fAkoflx+bNpy5UAS1DYd0Om31YmGf3IJallJXnhZ0S5Tmudt13E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AWvJUHgA; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707231144; x=1738767144;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R+4q0KD9BvmZdxD81eEs6HX9hWzEr3vbU7jF+NEAE3Y=;
  b=AWvJUHgA05W7BNRIigTXUaoWBXMMVKJacGz63W+3J3gFrNh/OgCckDYy
   7lKU+b2CrRtMtL6aF9Vu/Wxd0N5QRwS/EqaCZy0J48nISPWSc0J0UMAlu
   ceroZRgoB2KEjPsQfH0+cosCvK5CApR7GBWFyrab9U+P2f020+YZLCDry
   BYG5Y014q+QHPRiEM9+qjB/tptsCQYtmQtl0pCucOmmJdlkMcg4TgLHQq
   lbvaODjemJkmpUCqwVZpw0yngDQhq5v1ipz5wnaygh9MaznJNqgFnldQK
   81wWi9OGtzxE0/YIqDyszZwRdqUd2gbc1c+fQoJUIJLLrt1Vsxgc8PNG1
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="26206667"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="26206667"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 06:52:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="933481983"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="933481983"
Received: from marquiz-s-2.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.58])
  by fmsmga001.fm.intel.com with ESMTP; 06 Feb 2024 06:52:17 -0800
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
Subject: [PATCH v2 5/9] i2c: designware: Do not enable interrupts shortly in polling mode
Date: Tue,  6 Feb 2024 16:51:54 +0200
Message-ID: <20240206145158.227254-6-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206145158.227254-1-jarkko.nikula@linux.intel.com>
References: <20240206145158.227254-1-jarkko.nikula@linux.intel.com>
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
index ee93c0b4e817..353d753d9d5d 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -353,6 +353,14 @@ static inline void __i2c_dw_disable_nowait(struct dw_i2c_dev *dev)
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


