Return-Path: <linux-i2c+bounces-655-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE911808A0D
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 15:17:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F12AF2811D9
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 14:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD03441C72;
	Thu,  7 Dec 2023 14:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ehvBIwlt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0429910EB;
	Thu,  7 Dec 2023 06:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701958632; x=1733494632;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Fdf8dgQVzuzQxTt7wdbNS5bskoga27POgf3pr9jQPuY=;
  b=ehvBIwltQNogxhxBbn63LCdaBqbvbjh13jWpGlgACSw5DugFtCD+3r9F
   iI4BUDfcxTHKWxL1TCrUrUxY+1HdMCdR9whR0jDyF5kpImh/Mtvr3K+ya
   96qLHwqf5s77Zhr4o1uwSJCYm931CQ4UqFehSVn/TnrW1bxQJLpeL7wXS
   QpvC7wygtBT5CILxI2uyZXdRh5p7alaQkwUUOCbK8nmIip1avugvGHCBP
   QB/5qUJvQPvaz8Tbisw1JLgh3Ii29IH/vfAPxG/SY7un41O/cwjFTgX/H
   43I4KiS199LcINhXtV8rR+7sjIJPBjFQCAYbwSuKq8IgtURRV+obeJcT9
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="460726112"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="460726112"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 06:17:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="889756082"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="889756082"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 07 Dec 2023 06:17:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 184C0B84; Thu,  7 Dec 2023 16:17:03 +0200 (EET)
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
Subject: [PATCH v5 13/24] i2c: designware: Rename dw_i2c_of_configure() -> i2c_dw_of_configure()
Date: Thu,  7 Dec 2023 16:13:53 +0200
Message-ID: <20231207141653.2785124-14-andriy.shevchenko@linux.intel.com>
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

For the sake of consistency, rename dw_i2c_of_configure() and change
its parameter to be aligned with the i2c_dw_acpi_configure().

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Link: https://lore.kernel.org/r/20231120144641.1660574-14-andriy.shevchenko@linux.intel.com
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 7449f1b37ecf..b8606b651feb 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -110,9 +110,10 @@ static int mscc_twi_set_sda_hold_time(struct dw_i2c_dev *dev)
 	return 0;
 }
 
-static void dw_i2c_of_configure(struct platform_device *pdev)
+static void i2c_dw_of_configure(struct device *device)
 {
-	struct dw_i2c_dev *dev = platform_get_drvdata(pdev);
+	struct platform_device *pdev = to_platform_device(device);
+	struct dw_i2c_dev *dev = dev_get_drvdata(device);
 
 	switch (dev->flags & MODEL_MASK) {
 	case MODEL_MSCC_OCELOT:
@@ -130,7 +131,7 @@ static int bt1_i2c_request_regs(struct dw_i2c_dev *dev)
 	return -ENODEV;
 }
 
-static inline void dw_i2c_of_configure(struct platform_device *pdev)
+static inline void i2c_dw_of_configure(struct device *device)
 {
 }
 #endif
@@ -306,7 +307,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	i2c_dw_adjust_bus_speed(dev);
 
 	if (pdev->dev.of_node)
-		dw_i2c_of_configure(pdev);
+		i2c_dw_of_configure(&pdev->dev);
 
 	if (has_acpi_companion(&pdev->dev))
 		i2c_dw_acpi_configure(&pdev->dev);
-- 
2.43.0.rc1.1.gbec44491f096


