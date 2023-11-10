Return-Path: <linux-i2c+bounces-34-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8598A7E81C9
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 19:34:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6CE31C20AD2
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 18:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECEA73AC12;
	Fri, 10 Nov 2023 18:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I8V0PTZK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5032BCF7
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 18:34:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5470612D388;
	Fri, 10 Nov 2023 10:32:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699641123; x=1731177123;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IMyTNKO4GTE+4MqgHZUK0YF/DYKs3aQmIFo7+4BIWQM=;
  b=I8V0PTZKL5g29QkO+O1vwXiIi5tqpyqjhB9pHjx5Cl2KhtjAP2p5ZDBW
   xbZl68pT4nT76q073TuF3Q8WNLW9ezVPnkLAYGneU+nuSJiUiAghu4Sdg
   T+txngmv+WV3gqIjEYGQh6xLSj1jXGzZpw9DOso9MwCE15duzwj7TpRDp
   gVrWUB8fDTtqldatnkfGCnmX3K0P22PvYcwII1e+rh/JZ0j7TorI+M8sI
   2FNSwGmD9ZpOtMPXqrqCzh3CmBx8pV5noRegzVJvApohPEyx2mXZRnpLu
   vAdgUPE8eR73P6YdZcVWBehKD+qixd2p5gscxX8HwfcPlF+x/L1xV+Iim
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="456715085"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="456715085"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 10:29:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="763808266"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="763808266"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 10 Nov 2023 10:29:40 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D3405845; Fri, 10 Nov 2023 20:23:07 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 11/25] i2c: designware: Always provide device ID tables
Date: Fri, 10 Nov 2023 20:11:31 +0200
Message-ID: <20231110182304.3894319-12-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
References: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
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
 drivers/i2c/busses/i2c-designware-platdrv.c | 62 ++++++++++-----------
 1 file changed, 30 insertions(+), 32 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 018c353a456a..15f19ec20b33 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -40,28 +40,6 @@ static u32 i2c_dw_get_clk_rate_khz(struct dw_i2c_dev *dev)
 	return clk_get_rate(dev->clk) / KILO;
 }
 
-#ifdef CONFIG_ACPI
-static const struct acpi_device_id dw_i2c_acpi_match[] = {
-	{ "INT33C2", 0 },
-	{ "INT33C3", 0 },
-	{ "INT3432", 0 },
-	{ "INT3433", 0 },
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
@@ -148,14 +126,6 @@ static int dw_i2c_of_configure(struct platform_device *pdev)
 
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
@@ -486,6 +456,34 @@ static const struct dev_pm_ops dw_i2c_dev_pm_ops = {
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
@@ -497,8 +495,8 @@ static struct platform_driver dw_i2c_driver = {
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
2.43.0.rc1.1.gbec44491f096


