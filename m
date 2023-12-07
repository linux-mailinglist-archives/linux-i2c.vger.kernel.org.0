Return-Path: <linux-i2c+bounces-661-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 34650808A20
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 15:17:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14CF2B21694
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 14:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F57C41C8F;
	Thu,  7 Dec 2023 14:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OPwmwa61"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98D171716;
	Thu,  7 Dec 2023 06:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701958636; x=1733494636;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yamRjBTHlJZZ2xEb7LSBV/GouU3u82Ilx8RqV32Sls4=;
  b=OPwmwa61U5wFZnr6dBlkvlNuxjlvqxobJnVmi9hQ7ygMkWVtZmnvsFLT
   V9RodP7RwVMRyl76LT/aJqgrUaYyJ1nD2kxFoj9X9Esr0nz/nHX/Laleu
   T88aPlN62cGZMPaL/GbZqzx+UVzki1VZvLWA/zWdZB0/N18bYLHFxcPRV
   nT30CHaxEAg+JARMKjpkdGEw5b6QLeHTO3K/tppb2aPWo0IabShabvOVj
   WYnrY263BbeXIuZ0+iVIvJVsBCmfb8Qm2sHGke2d3BC2NlfKh9XMHYGDQ
   zRg8aOYf5iW/7UYmCx7v3wMqqQLhtl63F2Xppc49CItXUX9Mf79yMkz28
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="460726159"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="460726159"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 06:17:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="889756096"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="889756096"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 07 Dec 2023 06:17:10 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2C00ABAB; Thu,  7 Dec 2023 16:17:03 +0200 (EET)
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
Subject: [PATCH v5 15/24] i2c: designware: Unify the firmware type checks
Date: Thu,  7 Dec 2023 16:13:55 +0200
Message-ID: <20231207141653.2785124-16-andriy.shevchenko@linux.intel.com>
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

Instead of asymmetrical checks for the firmware type use
the is_*_node() calls.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Link: https://lore.kernel.org/r/20231120144641.1660574-16-andriy.shevchenko@linux.intel.com
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index d3ddfec46200..fb75e9b3d4fc 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -22,6 +22,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pm_runtime.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/swab.h>
 #include <linux/types.h>
@@ -372,14 +373,15 @@ int i2c_dw_fw_parse_and_configure(struct dw_i2c_dev *dev)
 {
 	struct i2c_timings *t = &dev->timings;
 	struct device *device = dev->dev;
+	struct fwnode_handle *fwnode = dev_fwnode(device);
 
 	i2c_parse_fw_timings(device, t, false);
 
 	i2c_dw_adjust_bus_speed(dev);
 
-	if (device->of_node)
+	if (is_of_node(fwnode))
 		i2c_dw_of_configure(device);
-	if (has_acpi_companion(device))
+	else if (is_acpi_node(fwnode))
 		i2c_dw_acpi_configure(device);
 
 	return i2c_dw_validate_speed(dev);
-- 
2.43.0.rc1.1.gbec44491f096


