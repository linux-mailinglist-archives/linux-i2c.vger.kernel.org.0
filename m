Return-Path: <linux-i2c+bounces-659-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B05808A1E
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 15:17:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DA79BB2160A
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 14:17:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3CB341C8A;
	Thu,  7 Dec 2023 14:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DUcRV7L0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D743B10FF;
	Thu,  7 Dec 2023 06:17:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701958634; x=1733494634;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=khq6cQ5BKVTLs44iQiMGbcvQCpPxqmbsi0+JKEy1Afs=;
  b=DUcRV7L0CZDQeCbwF/zn9Jem2SXhCLDjT+Xa4xZJlzesoLyzmqy7vuWA
   rOsKIqS7zZLUH8RLqV0/7BRtJQnm2aWmfWbH63roNjYO9vruZUBZSZkaL
   yW/35SlI6zNDmhLN+Aqio9V4X60i5DuvQBPh9SLsxdPNnjznj7n4OtDcz
   /W/9NWhjE+t40QDElXqT1IDevcNnTSbrM3Q1SiQ/SskdaFfCuAqGQ/m2W
   Ok99llRhQAEMyiKvKFZQz6CP1SEXGWAUeqZE8hQcH4qBVaTHX5+8KgtAp
   RrwrU8bAEGrUaY+lr46K5MMTJJ3vP1obDlIfstbTZRbNfQbNrENi39odG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="460726139"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="460726139"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 06:17:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="862490642"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="862490642"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Dec 2023 06:17:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E25759E2; Thu,  7 Dec 2023 16:17:02 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v5 09/24] i2c: designware: Unify terminator in device ID tables
Date: Thu,  7 Dec 2023 16:13:49 +0200
Message-ID: <20231207141653.2785124-10-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231207141653.2785124-1-andriy.shevchenko@linux.intel.com>
References: <20231207141653.2785124-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the terminator entry look the same in all device ID tables.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Link: https://lore.kernel.org/r/20231120144641.1660574-10-andriy.shevchenko@linux.intel.com
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 2 +-
 drivers/i2c/busses/i2c-designware-platdrv.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 35eba432bd08..cf736a8b9023 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -401,7 +401,7 @@ static const struct pci_device_id i2c_designware_pci_ids[] = {
 	{ PCI_VDEVICE(ATI,  0x73c4), navi_amd },
 	{ PCI_VDEVICE(ATI,  0x7444), navi_amd },
 	{ PCI_VDEVICE(ATI,  0x7464), navi_amd },
-	{ 0,}
+	{}
 };
 MODULE_DEVICE_TABLE(pci, i2c_designware_pci_ids);
 
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 5d8427ccc9b4..018c353a456a 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -57,7 +57,7 @@ static const struct acpi_device_id dw_i2c_acpi_match[] = {
 	{ "HISI02A2", 0 },
 	{ "HISI02A3", 0 },
 	{ "HYGO0010", ACCESS_INTR_MASK },
-	{ }
+	{}
 };
 MODULE_DEVICE_TABLE(acpi, dw_i2c_acpi_match);
 #endif
@@ -153,7 +153,7 @@ static const struct of_device_id dw_i2c_of_match[] = {
 	{ .compatible = "snps,designware-i2c", },
 	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
 	{ .compatible = "baikal,bt1-sys-i2c", .data = (void *)MODEL_BAIKAL_BT1 },
-	{},
+	{}
 };
 MODULE_DEVICE_TABLE(of, dw_i2c_of_match);
 #else
-- 
2.43.0.rc1.1.gbec44491f096


