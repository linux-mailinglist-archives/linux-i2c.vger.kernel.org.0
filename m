Return-Path: <linux-i2c+bounces-5466-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CCCB3954FC2
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 19:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F836285E50
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 17:13:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CEDB1C3F1E;
	Fri, 16 Aug 2024 17:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BZJ0MBO/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A8A1C2302;
	Fri, 16 Aug 2024 17:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723828362; cv=none; b=QZm9+eyssZcAMbZ1pg0RZVVqbiXA0Avo16/USrZcTsEQyolmUe4UW9TAHPxXn6QYsc40cWFbXfjsBC8Xqv1jKAeegKOsP7eOK6PYAs/CkSs90GYF8brektvPTwmDV4HfN6x5SFEI5KDGjFGEp5ty5HiGPIbRPYu5bOC0+PXMcFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723828362; c=relaxed/simple;
	bh=fM3QyOcACxbz3EgkNWA6wIeK6Z0/rqQoD5M/3kN7fKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CVVRazZYvoy42N7WsLapYiLDpMKIs4AD7CNvrURQCLC9hf06vPMSxafbAH3SZHbYRf59n/DpF8cvJAK6rlCCjHMXzxYMZOqDRpBUe3MSaz+Ow6aJ5ALt2r/I9nlRR7uX917HSAqDsb6hblP/7R3uRXZvw7OTDTjUDmcTjVgOz1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BZJ0MBO/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723828360; x=1755364360;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fM3QyOcACxbz3EgkNWA6wIeK6Z0/rqQoD5M/3kN7fKI=;
  b=BZJ0MBO/v4zKEPjt94pRPaZLTL8Lpwd0cdXVP4y2wkyPygajnQlJIdEI
   4UySX4vHWgE/hT8J3GmCZSDuM50CUWcfuZuG6CdM9D/h+2FSKTWXsCd8b
   DiJpLDoojQOhPNlRvbfP7jW0iX60pRdjprR4AWyAZ/msD8/E1dh+R0vpL
   Tg/YNMvbmi6WcB7uhdEmao7BOFhuj43xeMf2C4vIPXAIXnQoRZiS+3mr4
   99l54ArP/nRUHry4u08rEWS4JcILZTFeVeEJ6K5QE1cWvWdFY/UmUzbvb
   KXtUbK4f0zmqR8aOpgyjvmuoLGSBvyl9tSRWedM3ZDVpxk0AVvlm1WF4c
   w==;
X-CSE-ConnectionGUID: Zyhp9pu/QrGNEbeNrd06jg==
X-CSE-MsgGUID: oqSwECVTSMWgEniHyDeneg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="39644617"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="39644617"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 10:12:39 -0700
X-CSE-ConnectionGUID: mlOdonHbTkWhPOP9WOIE8A==
X-CSE-MsgGUID: kK8mqIeQQvuxqO2UaaQsQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="64394902"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 16 Aug 2024 10:12:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id AA70C35D; Fri, 16 Aug 2024 20:12:32 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Narasimhan.V@amd.com,
	Borislav Petkov <bp@alien8.de>,
	Kim Phillips <kim.phillips@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v1 5/7] i2c: designware: Always provide device ID tables
Date: Fri, 16 Aug 2024 20:02:03 +0300
Message-ID: <20240816171225.3506844-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240816171225.3506844-1-andriy.shevchenko@linux.intel.com>
References: <20240816171225.3506844-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need to have ugly ifdeffery and additional macros
for the device ID tables. Always provide them. Since we touch
the ACPI table, make it sorted by ID.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 36 ++++++++++++++++-----
 1 file changed, 28 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 9ce74a8be43a..905557c7dfa4 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -149,14 +149,6 @@ static int dw_i2c_of_configure(struct platform_device *pdev)
 
 	return 0;
 }
-
-static const struct of_device_id dw_i2c_of_match[] = {
-	{ .compatible = "snps,designware-i2c", },
-	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
-	{ .compatible = "baikal,bt1-sys-i2c", .data = (void *)MODEL_BAIKAL_BT1 },
-	{}
-};
-MODULE_DEVICE_TABLE(of, dw_i2c_of_match);
 #else
 static int bt1_i2c_request_regs(struct dw_i2c_dev *dev)
 {
@@ -477,6 +469,34 @@ static const struct dev_pm_ops dw_i2c_dev_pm_ops = {
 	RUNTIME_PM_OPS(dw_i2c_plat_runtime_suspend, dw_i2c_plat_runtime_resume, NULL)
 };
 
+static const struct of_device_id dw_i2c_of_match[] = {
+	{ .compatible = "snps,designware-i2c", },
+	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
+	{ .compatible = "baikal,bt1-sys-i2c", .data = (void *)MODEL_BAIKAL_BT1 },
+	{}
+};
+MODULE_DEVICE_TABLE(of, dw_i2c_of_match);
+
+static const struct acpi_device_id dw_i2c_acpi_match[] = {
+	{ "80860F41", ACCESS_NO_IRQ_SUSPEND },
+	{ "808622C1", ACCESS_NO_IRQ_SUSPEND },
+	{ "AMD0010", ACCESS_INTR_MASK },
+	{ "AMDI0010", ACCESS_INTR_MASK },
+	{ "AMDI0019", ACCESS_INTR_MASK | ARBITRATION_SEMAPHORE },
+	{ "AMDI0510", 0 },
+	{ "APMC0D0F", 0 },
+	{ "HISI02A1", 0 },
+	{ "HISI02A2", 0 },
+	{ "HISI02A3", 0 },
+	{ "HYGO0010", ACCESS_INTR_MASK },
+	{ "INT33C2", 0 },
+	{ "INT33C3", 0 },
+	{ "INT3432", 0 },
+	{ "INT3433", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, dw_i2c_acpi_match);
+
 static const struct platform_device_id dw_i2c_platform_ids[] = {
 	{ "i2c_designware" },
 	{}
-- 
2.43.0.rc1.1336.g36b5255a03ac


