Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF758330D45
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Mar 2021 13:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230486AbhCHMUw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Mar 2021 07:20:52 -0500
Received: from mga07.intel.com ([134.134.136.100]:3478 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230169AbhCHMUm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 8 Mar 2021 07:20:42 -0500
IronPort-SDR: Qef8E12BSHAwArql24qevcPZ5OU8KhgJ01nVnY1Y3/0SC3IgYWJOMSnkSvPfJ/1YHlAKC5MxCP
 jtudN8iOZbTA==
X-IronPort-AV: E=McAfee;i="6000,8403,9916"; a="252044285"
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="252044285"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 04:20:41 -0800
IronPort-SDR: 2q3WNouO93QO5ykGzfaw+a9Vr4WuKb3dTbqIHNKitQOgq+WsN9clIO/C3nSrxGwM3eaL2KRaye
 uf82+az6QKpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="369401482"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 08 Mar 2021 04:20:37 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 11573263; Mon,  8 Mar 2021 14:20:38 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Lee Jones <lee.jones@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Jim Quinlan <james.quinlan@broadcom.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Peter Tyser <ptyser@xes-inc.com>,
        hdegoede@redhat.com, henning.schild@siemens.com
Subject: [PATCH v1 3/7] PCI: New Primary to Sideband (P2SB) bridge support library
Date:   Mon,  8 Mar 2021 14:20:16 +0200
Message-Id: <20210308122020.57071-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com>
References: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jonathan Yong <jonathan.yong@intel.com>

There is already one and at least one more user is coming which
requires an access to Primary to Sideband bridge (P2SB) in order to
get IO or MMIO bar hidden by BIOS. Create a library to access P2SB
for x86 devices.

Signed-off-by: Jonathan Yong <jonathan.yong@intel.com>
Co-developed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pci/Kconfig      |  8 ++++
 drivers/pci/Makefile     |  1 +
 drivers/pci/pci-p2sb.c   | 83 ++++++++++++++++++++++++++++++++++++++++
 include/linux/pci-p2sb.h | 28 ++++++++++++++
 4 files changed, 120 insertions(+)
 create mode 100644 drivers/pci/pci-p2sb.c
 create mode 100644 include/linux/pci-p2sb.h

diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
index 0c473d75e625..740e5b30d6fd 100644
--- a/drivers/pci/Kconfig
+++ b/drivers/pci/Kconfig
@@ -252,6 +252,14 @@ config PCIE_BUS_PEER2PEER
 
 endchoice
 
+config PCI_P2SB
+	bool "Primary to Sideband (P2SB) bridge access support"
+	depends on PCI && X86
+	help
+	  The Primary to Sideband bridge is an interface to some PCI
+	  devices connected through it. In particular, SPI NOR
+	  controller in Intel Apollo Lake SoC is one of such devices.
+
 source "drivers/pci/hotplug/Kconfig"
 source "drivers/pci/controller/Kconfig"
 source "drivers/pci/endpoint/Kconfig"
diff --git a/drivers/pci/Makefile b/drivers/pci/Makefile
index d62c4ac4ae1b..eee8d5dda7d9 100644
--- a/drivers/pci/Makefile
+++ b/drivers/pci/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_PCI_IOV)		+= iov.o
 obj-$(CONFIG_PCI_BRIDGE_EMUL)	+= pci-bridge-emul.o
 obj-$(CONFIG_PCI_LABEL)		+= pci-label.o
 obj-$(CONFIG_X86_INTEL_MID)	+= pci-mid.o
+obj-$(CONFIG_PCI_P2SB)		+= pci-p2sb.o
 obj-$(CONFIG_PCI_SYSCALL)	+= syscall.o
 obj-$(CONFIG_PCI_STUB)		+= pci-stub.o
 obj-$(CONFIG_PCI_PF_STUB)	+= pci-pf-stub.o
diff --git a/drivers/pci/pci-p2sb.c b/drivers/pci/pci-p2sb.c
new file mode 100644
index 000000000000..68d7dad48cdb
--- /dev/null
+++ b/drivers/pci/pci-p2sb.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Primary to Sideband bridge (P2SB) access support
+ *
+ * Copyright (c) 2017, 2021 Intel Corporation.
+ *
+ * Authors: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+ *	    Jonathan Yong <jonathan.yong@intel.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/export.h>
+#include <linux/pci-p2sb.h>
+
+#include <asm/cpu_device_id.h>
+#include <asm/intel-family.h>
+
+#include "pci.h"
+
+#define P2SBC_HIDE_BYTE			0xe1
+#define P2SBC_HIDE_BIT			BIT(0)
+
+static const struct x86_cpu_id p2sb_cpu_ids[] = {
+	X86_MATCH_INTEL_FAM6_MODEL(ATOM_GOLDMONT,	PCI_DEVFN(13, 0)),
+	{}
+};
+
+static int pci_p2sb_devfn(unsigned int *devfn)
+{
+	const struct x86_cpu_id *id;
+
+	id = x86_match_cpu(p2sb_cpu_ids);
+	if (!id)
+		return -ENODEV;
+
+	*devfn = (unsigned int)id->driver_data;
+	return 0;
+}
+
+/**
+ * pci_p2sb_bar - Get Primary to Sideband bridge (P2SB) device BAR
+ * @pdev:	PCI device to get a PCI bus to communicate with
+ * @devfn:	PCI slot and function to communicate with
+ * @mem:	memory resource to be filled in
+ *
+ * The BIOS prevents the P2SB device from being enumerated by the PCI
+ * subsystem, so we need to unhide and hide it back to lookup the BAR.
+ *
+ * Caller must provide a valid pointer to @mem.
+ *
+ * Locking is handled by pci_rescan_remove_lock mutex.
+ *
+ * Return:
+ * 0 on success or appropriate errno value on error.
+ */
+int pci_p2sb_bar(struct pci_dev *pdev, unsigned int devfn, struct resource *mem)
+{
+	struct pci_bus *bus = pdev->bus;
+	unsigned int df;
+	int ret;
+
+	/* Get devfn for P2SB device itself */
+	ret = pci_p2sb_devfn(&df);
+	if (ret)
+		return ret;
+
+	pci_lock_rescan_remove();
+
+	/* Unhide the P2SB device */
+	pci_bus_write_config_byte(bus, df, P2SBC_HIDE_BYTE, 0);
+
+	/* Read the first BAR of the device in question */
+	__pci_bus_read_base(bus, devfn, pci_bar_unknown, mem, PCI_BASE_ADDRESS_0, true);
+
+	/* Hide the P2SB device */
+	pci_bus_write_config_byte(bus, df, P2SBC_HIDE_BYTE, P2SBC_HIDE_BIT);
+
+	pci_unlock_rescan_remove();
+
+	pci_bus_info(bus, devfn, "BAR: %pR\n", mem);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pci_p2sb_bar);
diff --git a/include/linux/pci-p2sb.h b/include/linux/pci-p2sb.h
new file mode 100644
index 000000000000..15dd42737c84
--- /dev/null
+++ b/include/linux/pci-p2sb.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Primary to Sideband bridge (P2SB) access support
+ */
+
+#ifndef _PCI_P2SB_H
+#define _PCI_P2SB_H
+
+#include <linux/errno.h>
+
+struct pci_dev;
+struct resource;
+
+#if IS_BUILTIN(CONFIG_PCI_P2SB)
+
+int pci_p2sb_bar(struct pci_dev *pdev, unsigned int devfn, struct resource *mem);
+
+#else /* CONFIG_PCI_P2SB is not set */
+
+static inline
+int pci_p2sb_bar(struct pci_dev *pdev, unsigned int devfn, struct resource *mem)
+{
+	return -ENODEV;
+}
+
+#endif /* CONFIG_PCI_P2SB */
+
+#endif /* _PCI_P2SB_H */
-- 
2.30.1

