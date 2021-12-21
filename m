Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5992147C63E
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Dec 2021 19:19:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241075AbhLUSTN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Dec 2021 13:19:13 -0500
Received: from mga01.intel.com ([192.55.52.88]:5878 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240053AbhLUSTN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Dec 2021 13:19:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640110753; x=1671646753;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2weH9YLl+uiZq5NoxK5gXa8HMVS6Pv2FeoIswyTQXwQ=;
  b=XPaNvXWerwVEHZmRZ1DdQlJS2vkQlPVoO6nXBZXm/ojtgymP+ZpuqpIU
   Gb7QLTl3T9H2lje8kbrevVvRjLRn4sFaEIt+AEhnK2V7ippCifT6KaHFk
   oyVKkXKYGaUbcUosonTVhKxPvlIGOKiVtS+Eun99DX5JsXHq6WejGpSla
   yfAvH+KGOf0Z4wJURLcxzfda4qB05M2Pg7j9bXOwFLPuVUTOyGxDD3pUC
   7cEJDf6yC+pUdEACIz6CGb5MhPu5d6sKsu179iRG9RZngwFoS5TT6lMEb
   SKcSYvW65sEOxsPE0WXMHP+tdt9l2vxGPxMccNWX9ySj/HdTqRLCo3/aL
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="264655634"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="264655634"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2021 10:15:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="586780231"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 21 Dec 2021 10:15:31 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 06495331; Tue, 21 Dec 2021 20:15:40 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
Subject: [PATCH v3 3/8] platform/x86/intel: Add Primary to Sideband (P2SB) bridge support
Date:   Tue, 21 Dec 2021 20:15:21 +0200
Message-Id: <20211221181526.53798-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211221181526.53798-1-andriy.shevchenko@linux.intel.com>
References: <20211221181526.53798-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jonathan Yong <jonathan.yong@intel.com>

There are already two and at least one more user is coming which
require an access to Primary to Sideband (P2SB) bridge in order
to get IO or MMIO BAR hidden by BIOS.

Create a library to access P2SB for x86 devices.

Background information
======================
Note, the term "bridge" is used in the documentation and it has nothing
to do with a PCI (host) bridge as per the PCI specifications.

The P2SB is an interesting device by it's nature and hardware design.
First of all, it has several devices in the hardware behind it. These
devices may or may not be represented as ACPI devices by a firmware.

It also has a hardwired (to 0s) the least significant part of the
address space which is represented by the only 64-bit BAR0. It means
that OS mustn't reallocate the BAR.

On top of that in some cases P2SB is represented by function 0 on PCI
slot (in terms of B:D.F) and according to the PCI specification any
other function can't be seen until function 0 is present and visible.

In the PCI configuration space of P2SB device the full 32-bit register
is allocated for the only purpose of hiding the entire P2SB device.

  3.1.39 P2SB Control (P2SBC)—Offset E0h

  Hide Device (HIDE): When this bit is set, the P2SB will return 1s on
  any PCI Configuration Read on IOSF-P. All other transactions including
  PCI Configuration Writes on IOSF-P are unaffected by this. This does
  not affect reads performed on the IOSF-SB interface.

This doesn't prevent MMIO accesses though. In order to prevent OS from
the assignment to these addresses, the firmware on the affected platforms
marks the region as unusable (by cutting it off from the PCI host bridge
resources) as depicted in the Apollo Lake example below:

  PCI host bridge to bus 0000:00
  pci_bus 0000:00: root bus resource [io  0x0070-0x0077]
  pci_bus 0000:00: root bus resource [io  0x0000-0x006f window]
  pci_bus 0000:00: root bus resource [io  0x0078-0x0cf7 window]
  pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
  pci_bus 0000:00: root bus resource [mem 0x7c000001-0x7fffffff window]
  pci_bus 0000:00: root bus resource [mem 0x7b800001-0x7bffffff window]
  pci_bus 0000:00: root bus resource [mem 0x80000000-0xcfffffff window]
  pci_bus 0000:00: root bus resource [mem 0xe0000000-0xefffffff window]
  pci_bus 0000:00: root bus resource [bus 00-ff]

The P2SB 16MB BAR is located at 0xd0000000-0xd0ffffff memory window.

The generic solution
====================
The generic solution for all cases when we need to access to the information
behind P2SB device is a library code where users ask for necessary resources
by demand and hence those users take care of not being run on the systems
where this access is not required.

The library provides the p2sb_bar() API to retrieve the MMIO of the BAR0 of
the device from P2SB device slot.

P2SB unconditional unhiding awareness
=====================================
Technically it's possible to unhinde the P2SB device and devices on
the same PCI slot and access them at any time as needed. But there are
several potential issues with that:

 - the systems were never tested against such configuration and hence
   nobody knows what kind of bugs it may bring, especially when we talk
   about SPI NOR case which contains IFWI code (including BIOS) and
   already known to be problematic in the past for end users

 - the PCI by it's nature is a hotpluggable bus and in case somebody
   attaches a driver to the functions of a P2SB slot device(s) the
   end user experience and system behaviour can be unpredictable

 - the kernel code would need some ugly hacks (or code looking as an
   ugly hack) under arch/x86/pci in order to enable these devices on
   only selected platforms (which may include CPU ID table followed by
   a potentially growing number of DMI strings

The future improvements
=======================
The future improvements with this code may go in order to gain some kind
of cache, if it's possible at all, to prevent unhiding and hiding to many
times to take static information that may be saved once per boot.

Links
=====
[1]: https://lab.whitequark.org/notes/2017-11-08/accessing-intel-ich-pch-gpios/
[2]: https://lab.whitequark.org/files/gpioke/Intel-332690-004EN.pdf
[3]: https://lab.whitequark.org/files/gpioke/Intel-332691-002EN.pdf
[4]: https://medium.com/@jacksonchen_43335/bios-gpio-p2sb-70e9b829b403

Signed-off-by: Jonathan Yong <jonathan.yong@intel.com>
Co-developed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/platform/x86/intel/Kconfig     | 12 ++++
 drivers/platform/x86/intel/Makefile    |  2 +
 drivers/platform/x86/intel/p2sb.c      | 93 ++++++++++++++++++++++++++
 include/linux/platform_data/x86/p2sb.h | 27 ++++++++
 4 files changed, 134 insertions(+)
 create mode 100644 drivers/platform/x86/intel/p2sb.c
 create mode 100644 include/linux/platform_data/x86/p2sb.h

diff --git a/drivers/platform/x86/intel/Kconfig b/drivers/platform/x86/intel/Kconfig
index 38ce3e344589..e0cc64dcf72c 100644
--- a/drivers/platform/x86/intel/Kconfig
+++ b/drivers/platform/x86/intel/Kconfig
@@ -81,6 +81,18 @@ config INTEL_OAKTRAIL
 	  enable/disable the Camera, WiFi, BT etc. devices. If in doubt, say Y
 	  here; it will only load on supported platforms.
 
+config P2SB
+	bool "Primary to Sideband (P2SB) bridge access support"
+	depends on PCI
+	help
+	  The Primary to Sideband (P2SB) bridge is an interface to some
+	  PCI devices connected through it. In particular, SPI NOR controller
+	  in Intel Apollo Lake SoC is one of such devices.
+
+	  The main purpose of this library is to unhide P2SB device in case
+	  firmware kept it hidden on some platforms in order to access devices
+	  behind it.
+
 config INTEL_BXTWC_PMIC_TMU
 	tristate "Intel Broxton Whiskey Cove TMU Driver"
 	depends on INTEL_SOC_PMIC_BXTWC
diff --git a/drivers/platform/x86/intel/Makefile b/drivers/platform/x86/intel/Makefile
index 7c24be2423d8..b1f74b3f9c29 100644
--- a/drivers/platform/x86/intel/Makefile
+++ b/drivers/platform/x86/intel/Makefile
@@ -26,6 +26,8 @@ intel_int0002_vgpio-y			:= int0002_vgpio.o
 obj-$(CONFIG_INTEL_INT0002_VGPIO)	+= intel_int0002_vgpio.o
 intel_oaktrail-y			:= oaktrail.o
 obj-$(CONFIG_INTEL_OAKTRAIL)		+= intel_oaktrail.o
+intel_p2sb-y				:= p2sb.o
+obj-$(CONFIG_P2SB)			+= intel_p2sb.o
 
 # Intel PMIC / PMC / P-Unit drivers
 intel_bxtwc_tmu-y			:= bxtwc_tmu.o
diff --git a/drivers/platform/x86/intel/p2sb.c b/drivers/platform/x86/intel/p2sb.c
new file mode 100644
index 000000000000..b47517572310
--- /dev/null
+++ b/drivers/platform/x86/intel/p2sb.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Primary to Sideband (P2SB) bridge access support
+ *
+ * Copyright (c) 2017, 2021 Intel Corporation.
+ *
+ * Authors: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+ *	    Jonathan Yong <jonathan.yong@intel.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/export.h>
+#include <linux/pci.h>
+#include <linux/platform_data/x86/p2sb.h>
+
+/* For __pci_bus_read_base(), which is available for the PCI subsystem */
+#include <../../../pci/pci.h>
+
+#include <asm/cpu_device_id.h>
+#include <asm/intel-family.h>
+
+#define P2SBC_HIDE_BYTE			0xe1
+#define P2SBC_HIDE_BIT			BIT(0)
+
+static const struct x86_cpu_id p2sb_cpu_ids[] = {
+	X86_MATCH_INTEL_FAM6_MODEL(ATOM_GOLDMONT,	PCI_DEVFN(13, 0)),
+	{}
+};
+
+static int p2sb_get_devfn(unsigned int *devfn)
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
+ * p2sb_bar - Get Primary to Sideband (P2SB) bridge device BAR
+ * @bus: PCI bus to communicate with
+ * @devfn: PCI slot and function to communicate with
+ * @mem: memory resource to be filled in
+ *
+ * The BIOS prevents the P2SB device from being enumerated by the PCI
+ * subsystem, so we need to unhide and hide it back to lookup the BAR.
+ *
+ * if @bus is NULL, the bus 0 in domain 0 will be in use.
+ * If @devfn is 0, it will be replaced by devfn of the P2SB device.
+ *
+ * Caller must provide a valid pointer to @mem.
+ *
+ * Locking is handled by pci_rescan_remove_lock mutex.
+ *
+ * Return:
+ * 0 on success or appropriate errno value on error.
+ */
+int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
+{
+	unsigned int devfn_p2sb;
+	int ret;
+
+	/* Get devfn for P2SB device itself */
+	ret = p2sb_get_devfn(&devfn_p2sb);
+	if (ret)
+		return ret;
+
+	/* if @pdev is NULL, use bus 0 in domain 0 */
+	bus = bus ?: pci_find_bus(0, 0);
+
+	/* If @devfn is 0, replace it with devfn of P2SB device itself */
+	devfn = devfn ?: devfn_p2sb;
+
+	pci_lock_rescan_remove();
+
+	/* Unhide the P2SB device */
+	pci_bus_write_config_byte(bus, devfn_p2sb, P2SBC_HIDE_BYTE, 0);
+
+	/* Read the first BAR of the device in question */
+	__pci_bus_read_base(bus, devfn, pci_bar_unknown, mem, PCI_BASE_ADDRESS_0, true);
+
+	/* Hide the P2SB device */
+	pci_bus_write_config_byte(bus, devfn_p2sb, P2SBC_HIDE_BYTE, P2SBC_HIDE_BIT);
+
+	pci_unlock_rescan_remove();
+
+	pci_bus_info(bus, devfn, "BAR: %pR\n", mem);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(p2sb_bar);
diff --git a/include/linux/platform_data/x86/p2sb.h b/include/linux/platform_data/x86/p2sb.h
new file mode 100644
index 000000000000..2f71de65aee4
--- /dev/null
+++ b/include/linux/platform_data/x86/p2sb.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Primary to Sideband (P2SB) bridge access support
+ */
+
+#ifndef _PLATFORM_DATA_X86_P2SB_H
+#define _PLATFORM_DATA_X86_P2SB_H
+
+#include <linux/errno.h>
+
+struct pci_bus;
+struct resource;
+
+#if IS_BUILTIN(CONFIG_P2SB)
+
+int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem);
+
+#else /* CONFIG_P2SB */
+
+static inline int p2sb_bar(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
+{
+	return -ENODEV;
+}
+
+#endif /* CONFIG_P2SB is not set */
+
+#endif /* _PLATFORM_DATA_X86_P2SB_H */
-- 
2.34.1

