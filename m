Return-Path: <linux-i2c+bounces-6581-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E404A97578C
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 17:50:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACBB628A433
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Sep 2024 15:50:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFB951B532C;
	Wed, 11 Sep 2024 15:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hi5ZLoAP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49A01B29A9;
	Wed, 11 Sep 2024 15:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726069716; cv=none; b=F9C1hHX4vJGgy2u9fStdzNJ4HlsTg5u07xQV7dCHVqvMF4VZbaMkaYNlLZtZVVBqDgru0LuJiSoH8WTd0Wywhec0PJG6iLQEfF2Y7I5bbqYwEIW4FYGddHbOybWmi9IL7eC7+9Wiwrkdvn1p3DKRJjM1YWw8o7FI0OSU5dQIKBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726069716; c=relaxed/simple;
	bh=fbOdtbUqLO2b0hGOuyDJ1swIlNsS7eQ2jI47dwBgPCI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qOWoQZkmdY1CRx3mN7lIBA7tlWAASDEXlENRFVJ45nqJXujCGj5khzBiFLsKy+iBznEotHhIeG8wcFCN6VB//hfXkFx4NpasUu2PCYnBlLlC8RfH3SMTeyZuy0IY10m3z+zwsiL2SBDiMa0pYZeVfkbwtquTbS5QLkJhbgMomYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hi5ZLoAP; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726069715; x=1757605715;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fbOdtbUqLO2b0hGOuyDJ1swIlNsS7eQ2jI47dwBgPCI=;
  b=hi5ZLoAPWaz9mqS5BqnvXG1oekuukG+db9jd6CFezPhGzPhlrTq9fbT0
   QUWAUWckfabwXQX/x6ZttY9V5AMkKNnP8QPYAOoCguRzgWaLg47lMcpdB
   h1p393TfMLH20xqhjIWzD0lbxoghMKcmA/YeZr6DsRl03hsl12NVQTu6i
   DMT+qpy4weaY0ExkO0Foxh4SQUUrzK+zDnlg3qSnY9K8XNmkQ9Tg7t3L0
   h3e0HuHXdqoWmHk/Us6HWoh8hQHHvppJu2oHyP3emQzNZ/xwh3VfBD3Ub
   K1rnS5Ei81FEaI/vg7YBjEmZVP0avFeCSg/bRwsao//1JBoM/SnKu7xOC
   w==;
X-CSE-ConnectionGUID: 75C/QMv0QnuyFt3Nq1OGsg==
X-CSE-MsgGUID: l7abm2CbQ4mlYg3MMmN38g==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24701857"
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="24701857"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 08:48:27 -0700
X-CSE-ConnectionGUID: bDvppkeiT4y2th4H5Ah6YA==
X-CSE-MsgGUID: bbEbQH2lRPykFhZT8IUIAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,220,1719903600"; 
   d="scan'208";a="72388567"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa004.jf.intel.com with ESMTP; 11 Sep 2024 08:48:25 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D1D895D7; Wed, 11 Sep 2024 18:48:21 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v1 12/12] i2c: isch: Convert to kernel-doc
Date: Wed, 11 Sep 2024 18:39:25 +0300
Message-ID: <20240911154820.2846187-13-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240911154820.2846187-1-andriy.shevchenko@linux.intel.com>
References: <20240911154820.2846187-1-andriy.shevchenko@linux.intel.com>
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
index a6aa28000568..333312a50deb 100644
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


