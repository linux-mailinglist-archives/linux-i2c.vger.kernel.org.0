Return-Path: <linux-i2c+bounces-6788-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23DA897A0FF
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 14:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC603285056
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 12:03:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C13815749C;
	Mon, 16 Sep 2024 12:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LoUisgIY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E8A156654;
	Mon, 16 Sep 2024 12:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726488168; cv=none; b=XYYOT/a42GJ3T5cAS2re2aovk1chsqVS7oORbSMpB7+F9v0SrVNLCdzihftr09TJhLH1dBZ8v7tZ1KpqY5CZrYdM1TfxGlVxljnNTf052v4Z5KdN8Oey/ypYZMur0mnipOKJoBL/rF5H7RYAbAr9N+wvBMy4OKQY7eLj+/C+wmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726488168; c=relaxed/simple;
	bh=rxXnm0azao5yDrOsSuKoukkb1vYMVqWT1uQqrgdp6fQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ANETE/IXtKGYLpiXXnEzWzFYUk/ohhYwhiD7prNVGTfaQbCLmEKNNLWs273VSOTvXQXH+3RrVwyYIhjOClInuKK+RCMkRCTm6fd9mJtc4WO4SXiVK3SG3kwYI9K5a8L/0PE6frSWNyngk0esIVK6sj1p3SCLRUa2ai1Fx5cbEPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LoUisgIY; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726488167; x=1758024167;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rxXnm0azao5yDrOsSuKoukkb1vYMVqWT1uQqrgdp6fQ=;
  b=LoUisgIYeDQHpD/ibL70FUPvzI5iRWcQCMESByjU23jXafB2hP07u61p
   jREDhonWXHOccWcNykN+D/8D32O41S4KyLvoN2hOCCteBvNed4JAEytf+
   Zd1xD8D76U+yeJR0u5wGlDiMUsotgH2pawF98OtRUkkwvc9XklVGZ/9OF
   upgg9XV9p3T52dA4Oz795NEGxHNJdEBiLnLWIJMd7irgiqWdgsjZJyfQE
   gP2/GVV9Un30FJpEWXL+PkBo0oQ1sPlPJqAUhb9zByiWbFZRBNcxgXXgq
   I7wHyLo4X4A36RekOKCD0n+OripcK1omGUlgSYSQeBgDI2qKQsgPu3Kh2
   A==;
X-CSE-ConnectionGUID: J+emVUUhQZmwUOEoSh7QaQ==
X-CSE-MsgGUID: 4i/JNql5T9iuJkZbTvzUtg==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="24842830"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="24842830"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 05:02:44 -0700
X-CSE-ConnectionGUID: BS3QeiVhQA6GpL68AJenDw==
X-CSE-MsgGUID: R8XkRmZ0RuWud+6wmmGTBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="68540781"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa007.fm.intel.com with ESMTP; 16 Sep 2024 05:02:42 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 18C016E5; Mon, 16 Sep 2024 15:02:39 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 11/11] i2c: isch: Convert to kernel-doc
Date: Mon, 16 Sep 2024 15:01:38 +0300
Message-ID: <20240916120237.1385982-12-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240916120237.1385982-1-andriy.shevchenko@linux.intel.com>
References: <20240916120237.1385982-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert existing descriptions to kernel-doc format and unify
the rest of the comments to follow the modern style.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-isch.c | 48 ++++++++++++++++++++---------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/drivers/i2c/busses/i2c-isch.c b/drivers/i2c/busses/i2c-isch.c
index b2857e8e1c58..2b3b65ef2900 100644
--- a/drivers/i2c/busses/i2c-isch.c
+++ b/drivers/i2c/busses/i2c-isch.c
@@ -1,13 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
-    i2c-isch.c - Linux kernel driver for Intel SCH chipset SMBus
-    - Based on i2c-piix4.c
-    Copyright (c) 1998 - 2002 Frodo Looijaard <frodol@dds.nl> and
-    Philip Edelbrock <phil@netroedge.com>
-    - Intel SCH support
-    Copyright (c) 2007 - 2008 Jacob Jun Pan <jacob.jun.pan@intel.com>
-
-*/
+ *  Linux kernel driver for Intel SCH chipset SMBus
+ *  - Based on i2c-piix4.c
+ *  Copyright (c) 1998 - 2002 Frodo Looijaard <frodol@dds.nl> and
+ *  Philip Edelbrock <phil@netroedge.com>
+ *  - Intel SCH support
+ *  Copyright (c) 2007 - 2008 Jacob Jun Pan <jacob.jun.pan@intel.com>
+ */
 
 /* Supports: Intel SCH chipsets (AF82US15W, AF82US15L, AF82UL11L) */
 
@@ -72,10 +71,14 @@ static inline void sch_io_wr16(struct sch_i2c *priv, unsigned int offset, u16 va
 	iowrite16(value, priv->smba + offset);
 }
 
-/*
- * Start the i2c transaction -- the i2c_access will prepare the transaction
- * and this function will execute it.
- * return 0 for success and others for failure.
+/**
+ * sch_transaction - Start the i2c transaction
+ * @adap: the i2c adapter pointer
+ *
+ * The sch_access() will prepare the transaction and
+ * this function will execute it.
+ *
+ * Return: 0 for success and others for failure.
  */
 static int sch_transaction(struct i2c_adapter *adap)
 {
@@ -105,7 +108,7 @@ static int sch_transaction(struct i2c_adapter *adap)
 		}
 	}
 
-	/* start the transaction by setting bit 4 */
+	/* Start the transaction by setting bit 4 */
 	temp = sch_io_rd8(priv, SMBHSTCNT);
 	temp |= 0x10;
 	sch_io_wr8(priv, SMBHSTCNT, temp);
@@ -141,12 +144,17 @@ static int sch_transaction(struct i2c_adapter *adap)
 	return rc;
 }
 
-/*
- * This is the main access entry for i2c-sch access
- * adap is i2c_adapter pointer, addr is the i2c device bus address, read_write
- * (0 for read and 1 for write), size is i2c transaction type and data is the
- * union of transaction for data to be transferred or data read from bus.
- * return 0 for success and others for failure.
+/**
+ * sch_access - the main access entry for i2c-sch access
+ * @adap: the i2c adapter pointer
+ * @addr: the i2c device bus address
+ * @flags: I2C_CLIENT_* flags (usually zero or I2C_CLIENT_PEC)
+ * @read_write: 0 for read and 1 for write
+ * @command: Byte interpreted by slave, for protocols which use such bytes
+ * @size: the i2c transaction type
+ * @data: the union of transaction for data to be transferred or data read from bus
+ *
+ * Return: 0 for success and others for failure.
  */
 static s32 sch_access(struct i2c_adapter *adap, u16 addr,
 		 unsigned short flags, char read_write,
@@ -281,7 +289,7 @@ static int smbus_sch_probe(struct platform_device *pdev)
 	if (!priv->smba)
 		return dev_err_probe(dev, -EBUSY, "SMBus region %pR already in use!\n", res);
 
-	/* set up the sysfs linkage to our parent device */
+	/* Set up the sysfs linkage to our parent device */
 	priv->adapter.dev.parent = dev;
 	priv->adapter.owner = THIS_MODULE,
 	priv->adapter.class = I2C_CLASS_HWMON,
-- 
2.43.0.rc1.1336.g36b5255a03ac


