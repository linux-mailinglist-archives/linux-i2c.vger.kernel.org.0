Return-Path: <linux-i2c+bounces-5487-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A00B69565C5
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 10:41:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CC50283D67
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 08:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6355415E5A2;
	Mon, 19 Aug 2024 08:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="izZXYpMp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A27115C130;
	Mon, 19 Aug 2024 08:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724056819; cv=none; b=Ln3FxWwj/HsUHEgKc1qyFUQhVJ0oel9k6FaR9pIxvx2pneVnCGgJRUr+0kOdv8PFqxFtLVG8xyEnrtKKRHBD1equPcwheAXpRt6RUAMDFvjnO53X9yVV4PqK+WRg1UDbi1Bz7sri2hvVRcCT5GFWjPs3B5l3v6RIES9TXGNAFZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724056819; c=relaxed/simple;
	bh=q/dzERaIodn+eQ2P4wKpMoyNkbhR80Ijh3zvaSu63WA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r0m47ZjzqexSzwIaUnjkk3iAAiF0FQUX1Au71A1GyjlM8qmpG/qMKazg8vlv1aj/u49gqE3JGr6Wo6JVoM4atkmIk26qq2EaoTlPhEzQiDxadIZr5CjXtED4KdnzRgxfHOWqJPhiOSRVrRR/3jd8M2/PpYEyoAL8+xaG7IRfY18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=izZXYpMp; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724056818; x=1755592818;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=q/dzERaIodn+eQ2P4wKpMoyNkbhR80Ijh3zvaSu63WA=;
  b=izZXYpMpX3JlDRc7wzQyGT66p6JZ1ttKRlP3xhiNw5kvii5Yel1xo43M
   wypiIVwfqTUX8rDfuD3/5qB68vdQyXEPE6RN8Si7lPMdzxkeTSJAD8JWZ
   X1d+vY8TQcU+eIe8zPGujdaZlZ3Mvy/1anO6Wae9j+B0DbVgugEHRlcqL
   P7p3Psi76b6kCcZ/1NieWBOiRP/cB8UxOb750l34MiKDm7lxIfLNOxXuP
   h86fH9uDxRE+E3sMY6j2kgKiuaYS2Vz2kSMDt8fUYrXMtf2Cviz+cSlh3
   QOHy6BtRg+q4U6RNStjRbffgqEuo8t2MrML4sc2Um/B+/OxHlB3mrLZ3W
   g==;
X-CSE-ConnectionGUID: wB3C072vTGu3wAnHGJkggw==
X-CSE-MsgGUID: 2ABktHmUQsWvNforX9vjfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="21834867"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="21834867"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 01:40:16 -0700
X-CSE-ConnectionGUID: ga3bwXg2SBe8b+jT/1lj3A==
X-CSE-MsgGUID: ELAIoj+kSk6ed7V8OP6cow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="91080206"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 19 Aug 2024 01:40:13 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 13C843FD; Mon, 19 Aug 2024 11:40:09 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Narasimhan.V@amd.com,
	Borislav Petkov <bp@alien8.de>,
	Kim Phillips <kim.phillips@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v2 5/7] i2c: designware: Always provide device ID tables
Date: Mon, 19 Aug 2024 11:39:09 +0300
Message-ID: <20240819084007.3700433-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240819084007.3700433-1-andriy.shevchenko@linux.intel.com>
References: <20240819084007.3700433-1-andriy.shevchenko@linux.intel.com>
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
 drivers/i2c/busses/i2c-designware-platdrv.c | 60 ++++++++++-----------
 1 file changed, 29 insertions(+), 31 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 9ce74a8be43a..6328ae943a34 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -40,29 +40,6 @@ static u32 i2c_dw_get_clk_rate_khz(struct dw_i2c_dev *dev)
 	return clk_get_rate(dev->clk) / KILO;
 }
 
-#ifdef CONFIG_ACPI
-static const struct acpi_device_id dw_i2c_acpi_match[] = {
-	{ "INT33C2", 0 },
-	{ "INT33C3", 0 },
-	{ "INT3432", 0 },
-	{ "INT3433", 0 },
-	{ "INTC10EF", 0 },
-	{ "80860F41", ACCESS_NO_IRQ_SUSPEND },
-	{ "808622C1", ACCESS_NO_IRQ_SUSPEND },
-	{ "AMD0010", ACCESS_INTR_MASK },
-	{ "AMDI0010", ACCESS_INTR_MASK },
-	{ "AMDI0019", ACCESS_INTR_MASK | ARBITRATION_SEMAPHORE },
-	{ "AMDI0510", 0 },
-	{ "APMC0D0F", 0 },
-	{ "HISI02A1", 0 },
-	{ "HISI02A2", 0 },
-	{ "HISI02A3", 0 },
-	{ "HYGO0010", ACCESS_INTR_MASK },
-	{}
-};
-MODULE_DEVICE_TABLE(acpi, dw_i2c_acpi_match);
-#endif
-
 #ifdef CONFIG_OF
 #define BT1_I2C_CTL			0x100
 #define BT1_I2C_CTL_ADDR_MASK		GENMASK(7, 0)
@@ -149,14 +126,6 @@ static int dw_i2c_of_configure(struct platform_device *pdev)
 
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
@@ -477,6 +446,35 @@ static const struct dev_pm_ops dw_i2c_dev_pm_ops = {
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
+	{ "INTC10EF", 0 },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, dw_i2c_acpi_match);
+
 static const struct platform_device_id dw_i2c_platform_ids[] = {
 	{ "i2c_designware" },
 	{}
-- 
2.43.0.rc1.1336.g36b5255a03ac


