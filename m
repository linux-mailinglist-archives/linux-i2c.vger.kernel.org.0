Return-Path: <linux-i2c+bounces-325-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 594127F160E
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 15:47:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0ED2E1F24D3E
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 14:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BAD21D521;
	Mon, 20 Nov 2023 14:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Msqjec5h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8EBED69;
	Mon, 20 Nov 2023 06:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700491619; x=1732027619;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uLVeF/uTk0+x9zvX73n0BK9nE9dqOP8VDpiHMj0UVU0=;
  b=Msqjec5h2I/AYlFd6Y/HkcnA92o0Cg0jOG3aRRcSTM4WB/Tn31xM9x+V
   op3PQ6Y4IS8ln20hRUPw+2sbuCQuE3+1dNJbrNlTYuZrKOXq7aXUh+jyY
   Q7xt07v39DvyuM+QItLzZd8Pn0gCV7GECE7e8S9U2j2LZFWVT1Pbq12YQ
   zvDUa/nXj6LKWZTb8Z8UHFpRw7pQdI/ydwvJHkD1MjPVAq356NPnjevEY
   zRDK4lpS/zfFlr+4daLUuA67AH3ZlcIfXqCUux8JWCVPclG0ic/sk/3ra
   RswIzHbGb63pNGzqSiFHjC4cTZfyLKBLMeEiI9qY1CHDRAFOR3slgFgUR
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="455956510"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="455956510"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 06:46:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="801193204"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="801193204"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 20 Nov 2023 06:46:53 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id DA4AC497; Mon, 20 Nov 2023 16:46:44 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v4 16/24] i2c: designware: Move exports to I2C_DW namespaces
Date: Mon, 20 Nov 2023 16:41:58 +0200
Message-ID: <20231120144641.1660574-17-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
References: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
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


