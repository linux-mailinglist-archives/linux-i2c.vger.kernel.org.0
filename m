Return-Path: <linux-i2c+bounces-5544-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8079573EC
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 20:47:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 73FED281FD9
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 18:47:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1779C18C329;
	Mon, 19 Aug 2024 18:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dtCzxQL6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002AA18A932;
	Mon, 19 Aug 2024 18:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724093171; cv=none; b=t+gMsf/ZfI1aDlA0xtaIQHymaQsZaN3m4c6CDrY+fT5eA7l2Ki23N85FAf3lVtEi83PoWzg8bfOcduqueNjvkMlqG+MDfyLbWQ6AKeQ/6E6sZHSEYCeEPRXqPLNtdDNtlprA7/eRSecMqpwv5Ndm1pm8hUiXZnTmaerXQRTj3HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724093171; c=relaxed/simple;
	bh=Y1Ep7oRG8mmFYP1MjwtqPXbgMeqhwANm2mnuz20Ojr8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y9TM+sZLgj1R8xkjyWCljtsx3J4PpWn0MxzoNomNME3MIznZMgVIQzN30SOq/dl9eJnGSVWL5eZIobyRiFOoBtkb/6vYENBqq/FxqguYV0Wa3fq4Wm1KpUdH85YBvn4YlB0IO5KtQT29AKCBN2SDpAKtr8Kq+aSqQjzRlzKuPTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dtCzxQL6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724093170; x=1755629170;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y1Ep7oRG8mmFYP1MjwtqPXbgMeqhwANm2mnuz20Ojr8=;
  b=dtCzxQL6N2Zh6yMQ47oqudrG/IGY/0pOXvavPsoQk0bNjfCQnt6qUZAZ
   F6nP/V/dKZjpXgYLkDZ5Iq14roEt6x46auBAMIYjfdUKTo7EL4ythNYlS
   5UoJHhKnURUh2LgipJlNu9ju/Yg3cugI3BnkaGt4PjRNLUeI5ny55DHNC
   9ODMvdrBksq8TauV1k6uwdcYQTBqsfco7v6RNqUoTTmNYl4m7QpJgiNJR
   rdncWIi/+0/lOym0CVgyZG31aKU0Ol0sdmTHXQoz9B3MBkUaFkcfPPnMQ
   Fl7/XubtQ7mIPJyYp6zaQgd25etBTd19CVCdGmMBoyZ+f2Zy4GGb8ldgv
   Q==;
X-CSE-ConnectionGUID: PK/MZw7bSIO98fr1sdVhbA==
X-CSE-MsgGUID: WkQfRgdFRiOfMHaMveQI3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="21902315"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="21902315"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 11:46:08 -0700
X-CSE-ConnectionGUID: LNyXs2hbQAypRk+2b2t5zw==
X-CSE-MsgGUID: BBsp2xcNQZKtZJ0EU6mVkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="83671090"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 19 Aug 2024 11:46:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 550A072C; Mon, 19 Aug 2024 21:46:01 +0300 (EEST)
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
Subject: [PATCH v3 5/7] i2c: designware: Always provide device ID tables
Date: Mon, 19 Aug 2024 21:45:11 +0300
Message-ID: <20240819184600.2256658-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240819184600.2256658-1-andriy.shevchenko@linux.intel.com>
References: <20240819184600.2256658-1-andriy.shevchenko@linux.intel.com>
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
 drivers/i2c/busses/i2c-designware-platdrv.c | 64 ++++++++++-----------
 1 file changed, 31 insertions(+), 33 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 9ce74a8be43a..c1e1344c3fc6 100644
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
@@ -488,8 +486,8 @@ static struct platform_driver dw_i2c_driver = {
 	.remove_new = dw_i2c_plat_remove,
 	.driver		= {
 		.name	= "i2c_designware",
-		.of_match_table = of_match_ptr(dw_i2c_of_match),
-		.acpi_match_table = ACPI_PTR(dw_i2c_acpi_match),
+		.of_match_table = dw_i2c_of_match,
+		.acpi_match_table = dw_i2c_acpi_match,
 		.pm	= pm_ptr(&dw_i2c_dev_pm_ops),
 	},
 	.id_table = dw_i2c_platform_ids,
-- 
2.43.0.rc1.1336.g36b5255a03ac


