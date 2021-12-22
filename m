Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49AD047D50E
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Dec 2021 17:20:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241750AbhLVQUk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Dec 2021 11:20:40 -0500
Received: from mga05.intel.com ([192.55.52.43]:37380 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241721AbhLVQUj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Dec 2021 11:20:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640190039; x=1671726039;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=SizBVyW8i2X/uXEttEPyssEyhOCOhU573+MmAa5CRcQ=;
  b=CYDOWoWE/lJW2f4ZTcluW8KP66YEQDpe3lZBTVcsOC0U6h7bUPWPcRc4
   RyYYWZVkpYG1M3Hdmr3ZcLFnRYGGmd8JmiZtoHx0A2CxpfA/LjZpyPA0E
   3fpOWIj6QQn2jvFNiChFs26EjrxmBHSBzaW0A+lQ5xSYXBziCsPyS/19b
   VjmorwWs7Rqvp0NG/pzVkLQzAQaLXMOYKkqJS1xdc+qVK/+AGjRAEFIR4
   wviTHhgj5029N/HGfEjpUWcoZgy+vC3+GFXqaf/xSsn759HlWGnxFNtKJ
   JgnBqHAyj8yRSLKxADvz+DaeFnj8mwIItOnxPXNTdLZNkGrU/l6mqr/NJ
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="326959149"
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; 
   d="scan'208";a="326959149"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2021 08:20:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; 
   d="scan'208";a="664318065"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 22 Dec 2021 08:20:35 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 09815FE; Wed, 22 Dec 2021 18:20:43 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Subject: [PATCH v2 1/5] i2c: Introduce common module to instantiate CCGx UCSI
Date:   Wed, 22 Dec 2021 18:20:37 +0200
Message-Id: <20211222162041.64625-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Introduce a common module to provide an API to instantiate UCSI device
for Cypress CCGx Type-C controller. Individual bus drivers need to select
this one on demand.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: rebased on top of current i2c/for-next
 drivers/i2c/busses/Kconfig         |  7 +++++++
 drivers/i2c/busses/Makefile        |  3 +++
 drivers/i2c/busses/i2c-ccgx-ucsi.c | 27 +++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-ccgx-ucsi.h | 11 +++++++++++
 4 files changed, 48 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-ccgx-ucsi.c
 create mode 100644 drivers/i2c/busses/i2c-ccgx-ucsi.h

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 42da31c1ab70..08e24e396e37 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -9,6 +9,13 @@ menu "I2C Hardware Bus support"
 comment "PC SMBus host controller drivers"
 	depends on PCI
 
+config I2C_CCGX_UCSI
+	tristate
+	help
+	  A common module to provide an API to instantiate UCSI device
+	  for Cypress CCGx Type-C controller. Individual bus drivers
+	  need to select this one on demand.
+
 config I2C_ALI1535
 	tristate "ALI 1535"
 	depends on PCI
diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 1d00dce77098..79405cb5d600 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -6,6 +6,9 @@
 # ACPI drivers
 obj-$(CONFIG_I2C_SCMI)		+= i2c-scmi.o
 
+# Auxiliary I2C/SMBus modules
+obj-$(CONFIG_I2C_CCGX_UCSI)	+= i2c-ccgx-ucsi.o
+
 # PC SMBus host controller drivers
 obj-$(CONFIG_I2C_ALI1535)	+= i2c-ali1535.o
 obj-$(CONFIG_I2C_ALI1563)	+= i2c-ali1563.o
diff --git a/drivers/i2c/busses/i2c-ccgx-ucsi.c b/drivers/i2c/busses/i2c-ccgx-ucsi.c
new file mode 100644
index 000000000000..141c3d1ef752
--- /dev/null
+++ b/drivers/i2c/busses/i2c-ccgx-ucsi.c
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Instantiate UCSI device for Cypress CCGx Type-C controller.
+ * Derived from i2c-designware-pcidrv.c and i2c-nvidia-gpu.c.
+ */
+
+#include <linux/i2c.h>
+#include <linux/export.h>
+#include <linux/string.h>
+
+#include "i2c-ccgx-ucsi.h"
+
+struct software_node;
+
+struct i2c_client *i2c_new_ccgx_ucsi(struct i2c_adapter *adapter, int irq,
+				     const struct software_node *swnode)
+{
+	struct i2c_board_info info = {};
+
+	strscpy(info.type, "ccgx-ucsi", sizeof(info.type));
+	info.addr = 0x08;
+	info.irq = irq;
+	info.swnode = swnode;
+
+	return i2c_new_client_device(adapter, &info);
+}
+EXPORT_SYMBOL_GPL(i2c_new_ccgx_ucsi);
diff --git a/drivers/i2c/busses/i2c-ccgx-ucsi.h b/drivers/i2c/busses/i2c-ccgx-ucsi.h
new file mode 100644
index 000000000000..739ac7a4b117
--- /dev/null
+++ b/drivers/i2c/busses/i2c-ccgx-ucsi.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __I2C_CCGX_UCSI_H_
+#define __I2C_CCGX_UCSI_H_
+
+struct i2c_adapter;
+struct i2c_client;
+struct software_node;
+
+struct i2c_client *i2c_new_ccgx_ucsi(struct i2c_adapter *adapter, int irq,
+				     const struct software_node *swnode);
+#endif /* __I2C_CCGX_UCSI_H_ */
-- 
2.34.1

