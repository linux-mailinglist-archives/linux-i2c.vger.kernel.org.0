Return-Path: <linux-i2c+bounces-666-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6168E808A2C
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 15:17:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 915BB1C209F3
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 14:17:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC8C841C8C;
	Thu,  7 Dec 2023 14:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FNfL2SdL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55B4A1730;
	Thu,  7 Dec 2023 06:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701958639; x=1733494639;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5FwmIHAPnFsy0X0MCr7ws7HTjCheqTg8YUTrG4teLIA=;
  b=FNfL2SdLpaZt2WedNvf3tYzKBHXcrknAhO8ek85dLmwW+Wlik1fq3h/P
   n4nm65RuObKV1+CHLyeDhSwM2FTMoAdKIGxqKQ33YZnW5xNg2nXNACSi6
   7IJnSK/4B9Mx5LEuw5R6jvBLN+pxE2b7lJgCghF0IKZFdIL2Teb2j2IsC
   NBlBxYlMp0D95LKw68iUOZbfXVFCc3FLZTOQ797yhi4Fn9PIRH0JNb75P
   ZB4ZrwHrPG4pTNfiHcfPrIkypxfc6LVD958Rn81m2ZfQSQE6MpEitnOOz
   tSxhbGsKtZ+GIEa0z6GCZgVqeyqg+iy5ofaS7QRio1nPwOUF6dvf8vmxJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="460726181"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="460726181"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 06:17:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="889756098"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="889756098"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 07 Dec 2023 06:17:11 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 352F1BB2; Thu,  7 Dec 2023 16:17:03 +0200 (EET)
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
Subject: [PATCH v5 16/24] i2c: designware: Move exports to I2C_DW namespaces
Date: Thu,  7 Dec 2023 16:13:56 +0200
Message-ID: <20231207141653.2785124-17-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231207141653.2785124-1-andriy.shevchenko@linux.intel.com>
References: <20231207141653.2785124-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Reduce scope of the I²C DesignWare driver exports to I2C_DW namespaces.
This will prevent abuse of the symbols and clean up global namespace.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Link: https://lore.kernel.org/r/20231120144641.1660574-17-andriy.shevchenko@linux.intel.com
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c  | 2 ++
 drivers/i2c/busses/i2c-designware-master.c  | 3 +++
 drivers/i2c/busses/i2c-designware-pcidrv.c  | 2 ++
 drivers/i2c/busses/i2c-designware-platdrv.c | 2 ++
 drivers/i2c/busses/i2c-designware-slave.c   | 3 +++
 5 files changed, 12 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index fb75e9b3d4fc..89b8fa492e26 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -28,6 +28,8 @@
 #include <linux/types.h>
 #include <linux/units.h>
 
+#define DEFAULT_SYMBOL_NAMESPACE	I2C_DW_COMMON
+
 #include "i2c-designware-core.h"
 
 static char *abort_sources[] = {
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 85dbd0eb5392..0b6576d7f811 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -22,6 +22,8 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
+#define DEFAULT_SYMBOL_NAMESPACE	I2C_DW
+
 #include "i2c-designware-core.h"
 
 #define AMD_TIMEOUT_MIN_US	25
@@ -1079,3 +1081,4 @@ EXPORT_SYMBOL_GPL(i2c_dw_probe_master);
 
 MODULE_DESCRIPTION("Synopsys DesignWare I2C bus master adapter");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(I2C_DW_COMMON);
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 7556e9cbf8d2..a40acc3d9288 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -410,3 +410,5 @@ module_pci_driver(dw_i2c_driver);
 MODULE_AUTHOR("Baruch Siach <baruch@tkos.co.il>");
 MODULE_DESCRIPTION("Synopsys DesignWare PCI I2C bus adapter");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(I2C_DW);
+MODULE_IMPORT_NS(I2C_DW_COMMON);
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index b275a1b19eec..6b1a26afc278 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -471,3 +471,5 @@ module_exit(dw_i2c_exit_driver);
 MODULE_AUTHOR("Baruch Siach <baruch@tkos.co.il>");
 MODULE_DESCRIPTION("Synopsys DesignWare I2C bus adapter");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS(I2C_DW);
+MODULE_IMPORT_NS(I2C_DW_COMMON);
diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
index 2e079cf20bb5..70d183fa3bff 100644
--- a/drivers/i2c/busses/i2c-designware-slave.c
+++ b/drivers/i2c/busses/i2c-designware-slave.c
@@ -16,6 +16,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
+#define DEFAULT_SYMBOL_NAMESPACE	I2C_DW
+
 #include "i2c-designware-core.h"
 
 static void i2c_dw_configure_fifo_slave(struct dw_i2c_dev *dev)
@@ -279,3 +281,4 @@ EXPORT_SYMBOL_GPL(i2c_dw_probe_slave);
 MODULE_AUTHOR("Luis Oliveira <lolivei@synopsys.com>");
 MODULE_DESCRIPTION("Synopsys DesignWare I2C bus slave adapter");
 MODULE_LICENSE("GPL v2");
+MODULE_IMPORT_NS(I2C_DW_COMMON);
-- 
2.43.0.rc1.1.gbec44491f096


