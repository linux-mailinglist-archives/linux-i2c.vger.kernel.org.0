Return-Path: <linux-i2c+bounces-12-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 500B17E8137
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 19:25:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 805D31C20963
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 18:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F2F238DE9;
	Fri, 10 Nov 2023 18:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T93xu4PC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A50639876
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 18:25:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 620DA1091B4;
	Fri, 10 Nov 2023 10:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699640673; x=1731176673;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eMPXpCWG6Cf4B8QclIybkFC1zjR2hPsfAHy93QLcORg=;
  b=T93xu4PCj0QBQbFzi9l9IC5xlLfBalfd8QVHM0P8Qr+6RA2/zeFIYM9d
   mzMKOkfTxWBWBFHpJMq6YMUpvc+cNZDkH/R1HN4pN8jME+5NWKbkCyPWV
   BOi+LQflGIMqfEbuqeBPURbWhLedXapo7izuF0ylHWc40IN+Rr/bVORFl
   7QN1b4r2S/GgQFZJ2DW7Uo/4OVBr9CO1BJr2b+N47vzhpahzm1pFXl5P3
   M91RFBF4c/VtyIl7oQ7dalsorHy8ms/hSR6gVG8MflyziE71ou1G47D9o
   Z33Zk8xAWArdiYq0+YRJZGPiD3n8yPsUSZS0bwkjPCOIcTSZHH/4/AAgV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="375251918"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="375251918"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 10:23:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="798663748"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="798663748"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 10 Nov 2023 10:23:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C0972823; Fri, 10 Nov 2023 20:23:07 +0200 (EET)
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
Subject: [PATCH v3 09/25] i2c: designware: Replace MODULE_ALIAS() with MODULE_DEVICE_TABLE()
Date: Fri, 10 Nov 2023 20:11:29 +0200
Message-ID: <20231110182304.3894319-10-andriy.shevchenko@linux.intel.com>
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

As Krzysztof Kozlowski pointed out the better is to use
MODULE_DEVICE_TABLE() as it will be consistent with the content
of the real ID table of the platform devices.

While at it, drop unneeded and unused module alias in PCI glue
driver as PCI already has its own ID table and automatic loading
should just work.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 2 --
 drivers/i2c/busses/i2c-designware-platdrv.c | 8 ++++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index d2ed4e77afb3..db642e0aa61f 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -417,8 +417,6 @@ static struct pci_driver dw_i2c_driver = {
 };
 module_pci_driver(dw_i2c_driver);
 
-/* Work with hotplug and coldplug */
-MODULE_ALIAS("i2c_designware-pci");
 MODULE_AUTHOR("Baruch Siach <baruch@tkos.co.il>");
 MODULE_DESCRIPTION("Synopsys DesignWare PCI I2C bus adapter");
 MODULE_LICENSE("GPL");
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 4b5e58e1ce5b..5d8427ccc9b4 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -486,8 +486,11 @@ static const struct dev_pm_ops dw_i2c_dev_pm_ops = {
 	RUNTIME_PM_OPS(dw_i2c_plat_runtime_suspend, dw_i2c_plat_runtime_resume, NULL)
 };
 
-/* Work with hotplug and coldplug */
-MODULE_ALIAS("platform:i2c_designware");
+static const struct platform_device_id dw_i2c_platform_ids[] = {
+	{ "i2c_designware" },
+	{}
+};
+MODULE_DEVICE_TABLE(platform, dw_i2c_platform_ids);
 
 static struct platform_driver dw_i2c_driver = {
 	.probe = dw_i2c_plat_probe,
@@ -498,6 +501,7 @@ static struct platform_driver dw_i2c_driver = {
 		.acpi_match_table = ACPI_PTR(dw_i2c_acpi_match),
 		.pm	= pm_ptr(&dw_i2c_dev_pm_ops),
 	},
+	.id_table = dw_i2c_platform_ids,
 };
 
 static int __init dw_i2c_init_driver(void)
-- 
2.43.0.rc1.1.gbec44491f096


