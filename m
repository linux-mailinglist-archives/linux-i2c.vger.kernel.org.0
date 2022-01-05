Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5CF6048549C
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jan 2022 15:32:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240893AbiAEOcS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jan 2022 09:32:18 -0500
Received: from mga12.intel.com ([192.55.52.136]:39353 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231912AbiAEOcR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Jan 2022 09:32:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641393137; x=1672929137;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ABu6KFRcKAVHPekzGmRRzaEXwMcsW1byJmvaUzwWsH4=;
  b=EO6ZIPdJUo5qj15kKnnxN7UoA9fFAKURyqPtOxuOzNqAFyFu1LS8JM3o
   IBAXF6d9XOI3f5ZOogJxa2esiIjs3DK+I3qQ6wx23/Fmt4qnxObdGU7sZ
   5TuPFCd/w6JHcs1g79k3pCe+zxd0owWERMz45DtWQQItzHQGLAiFrSMDe
   lEbTD6ABz8V0Gqy56ZcaPsQ3xTIuP1dBkKyasAINUEZ8bdJydApqPtDJd
   zjaM6w4EDkjGcrWvHkPv/isypWWpv5nliDDhUKcO5lp2RPXsH2nH/A/CV
   ZOUfKCpQj5yboCkFhrw4iu/WqHkFi+uNpE/47we8JwvBKE41HT6izwAqe
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="222447853"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; 
   d="scan'208";a="222447853"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2022 06:19:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; 
   d="scan'208";a="526549898"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 05 Jan 2022 06:19:27 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9227918E; Wed,  5 Jan 2022 16:19:37 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Subject: [PATCH v3 1/5] i2c: Introduce common module to instantiate CCGx UCSI
Date:   Wed,  5 Jan 2022 16:19:31 +0200
Message-Id: <20220105141935.24109-1-andriy.shevchenko@linux.intel.com>
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
v3: added MODULE_LICENSE(GPL); (Nehal-bakulchandra)
 drivers/i2c/busses/Kconfig         |  7 +++++++
 drivers/i2c/busses/Makefile        |  3 +++
 drivers/i2c/busses/i2c-ccgx-ucsi.c | 30 ++++++++++++++++++++++++++++++
 drivers/i2c/busses/i2c-ccgx-ucsi.h | 11 +++++++++++
 4 files changed, 51 insertions(+)
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
index 000000000000..092dc92dea9f
--- /dev/null
+++ b/drivers/i2c/busses/i2c-ccgx-ucsi.c
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Instantiate UCSI device for Cypress CCGx Type-C controller.
+ * Derived from i2c-designware-pcidrv.c and i2c-nvidia-gpu.c.
+ */
+
+#include <linux/i2c.h>
+#include <linux/export.h>
+#include <linux/module.h>
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
+
+MODULE_LICENSE("GPL");
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

