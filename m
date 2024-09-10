Return-Path: <linux-i2c+bounces-6508-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D8D973D49
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 18:32:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DD3C61F26407
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 16:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 320481A3BB8;
	Tue, 10 Sep 2024 16:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jT7D1neM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777111A3BA4;
	Tue, 10 Sep 2024 16:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725985890; cv=none; b=e1BqO+K7GRwwNCl2VLqiNpF2qTIBXxSx7piir0sA1chYdQy36gXTzAlcQnCkSczvsIH4yfqAeH0yBmFbnvhxMqL1sDY6+EJwMDM8TUWRqOwYYGNBRMXSJopUV5wsVePGd/QyG2a5r2yr+q1jg+Y1CnvZM0eRVvZPCwtgueuqMQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725985890; c=relaxed/simple;
	bh=USi9uav+M8F7wd4G7BM+uWeTrTFoG8YEiyIQDm/jji0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n42OazqJYkt39DHWdpWaM373VmAVd5L7AglN4VanycZYH77gNKO16TNXoY9ozdCRE1YHWJzIXsuOaxf3l2C0AhqbKVbU0QCQexyhVwSQBCzlTrSc5tzHLtpYQ2M5/kslimiQOIntRqe8ZA+UCgPKmggcHuf1KsjD5F34JP2TmFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jT7D1neM; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725985888; x=1757521888;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=USi9uav+M8F7wd4G7BM+uWeTrTFoG8YEiyIQDm/jji0=;
  b=jT7D1neMnSucw/YDLh46ufnRir3FzCuwPgJtaWUzgNHHU5VJiLAAo/Hc
   GNqd2daf8UWPvkWr2e3QUq2KQbNVgFTIUtauAARH7eiX+bj5eFL5cT/eS
   d9BK1LkhYcbY6SiosinWIPvQm0j8VCCO3l0o4iUPH6u413qq6IlFvbbfs
   ugRXr9bz5sU91uwxt0UZ2gPGYqEHYPdDaSN5NPJbuOgY8VQEiv1R++fsr
   Ob+uImr6XnHBuTR79YipfsC2ryOd+aqa7L1OsGPAFO6w3dtIp3hynXYLc
   KbUZZw2iFs89IlD5E15ClonmP+hfJdsISxDYLt/NQH+PO2HtC2DbogfAI
   w==;
X-CSE-ConnectionGUID: jcKElCuOQ2m1PcQeZpN6hA==
X-CSE-MsgGUID: +R6+TtwfQse8lst/weVKrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24888649"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="24888649"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 09:31:28 -0700
X-CSE-ConnectionGUID: j+ezFjuPSeq2WEsmT6GXmQ==
X-CSE-MsgGUID: 76P2cZDWRQCaxc5QTwJfFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="67845219"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 10 Sep 2024 09:31:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id F1978432; Tue, 10 Sep 2024 19:31:24 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>
Subject: [PATCH v1 2/3] i2c: designware: Propagate firmware node
Date: Tue, 10 Sep 2024 19:28:45 +0300
Message-ID: <20240910163123.2499931-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240910163123.2499931-1-andriy.shevchenko@linux.intel.com>
References: <20240910163123.2499931-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Propagate firmware node by using a specific API call, i.e. device_set_node().

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c  | 2 ++
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 2 --
 drivers/i2c/busses/i2c-designware-platdrv.c | 3 ---
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index a6dbccd85565..080204182bb5 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -739,6 +739,8 @@ EXPORT_SYMBOL_GPL(i2c_dw_disable);
 
 int i2c_dw_probe(struct dw_i2c_dev *dev)
 {
+	device_set_node(&dev->adapter.dev, dev_fwnode(dev->dev));
+
 	switch (dev->mode) {
 	case DW_IC_SLAVE:
 		return i2c_dw_probe_slave(dev);
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 04377533f3ae..64f7bd8c7faf 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -9,7 +9,6 @@
  * Copyright (C) 2009 Provigent Ltd.
  * Copyright (C) 2011, 2015, 2016 Intel Corporation.
  */
-#include <linux/acpi.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/errno.h>
@@ -273,7 +272,6 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	adap = &dev->adapter;
 	adap->owner = THIS_MODULE;
 	adap->class = 0;
-	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
 	adap->nr = controller->bus_num;
 
 	r = i2c_dw_probe(dev);
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 732e444d0dfc..36041e624e3e 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -8,7 +8,6 @@
  * Copyright (C) 2007 MontaVista Software Inc.
  * Copyright (C) 2009 Provigent Ltd.
  */
-#include <linux/acpi.h>
 #include <linux/clk-provider.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -279,8 +278,6 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	adap->owner = THIS_MODULE;
 	adap->class = dmi_check_system(dw_i2c_hwmon_class_dmi) ?
 					I2C_CLASS_HWMON : I2C_CLASS_DEPRECATED;
-	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
-	adap->dev.of_node = pdev->dev.of_node;
 	adap->nr = -1;
 
 	if (dev->flags & ACCESS_NO_IRQ_SUSPEND) {
-- 
2.43.0.rc1.1336.g36b5255a03ac


