Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEED4521E70
	for <lists+linux-i2c@lfdr.de>; Tue, 10 May 2022 17:25:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345667AbiEJP2c (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 May 2022 11:28:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345958AbiEJP1d (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 May 2022 11:27:33 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7065D1C139;
        Tue, 10 May 2022 08:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652195939; x=1683731939;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jYO8D/V+8KNFOjkHTzY5zn2jgRqIQ7sgACMe0NT0/uo=;
  b=lFT979zZh2XCUwYxqEQkj2xs3W+xU4Q3GcI3RbzyL969+TZTPnc2dHCA
   0GsoKL4KNgUyid6qxisfAe67mQ/44D9XXfbX4Td2FYzqBfK24iH6nUg4A
   xwG4b5OhVZVMqZn+ClDFTNtvTH0GhXBVgMVatfyw2riIXnKSLCvcnn+xi
   T6bQCeMfeWY2ntcyBfbWIs512R7p0s5fVl1P8cwb2jtBftH6HUIe+nxIr
   K73OvuUZMrivuTNFjUGs6TgViFVv9ehjRD9LshDGcBfjUxNdg0ovc2ELF
   5uAOMw7Dd0G7We4CAuZAbGdWWZLesA59hlMXoWhf/PYFzTlA4+B46v6F9
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="332439850"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="332439850"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 08:17:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="623500960"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 10 May 2022 08:17:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 70EA381; Tue, 10 May 2022 18:15:16 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tony Luck <tony.luck@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        =?UTF-8?q?=C5=81ukasz=20Bartosik?= <lb@semihalf.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
Subject: [PATCH v5 1/8] platform/x86/intel: Add Primary to Sideband (P2SB) bridge support
Date:   Tue, 10 May 2022 18:14:44 +0300
Message-Id: <20220510151451.85561-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510151451.85561-1-andriy.shevchenko@linux.intel.com>
References: <20220510151451.85561-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Jonathan Yong <jonathan.yong@intel.com>

SoC features such as GPIO are accessed via a reserved MMIO area,
we don't know its address but can obtain it from the BAR of
the P2SB device, that device is normally hidden so we have to
temporarily unhide it, read address and hide it back.

There are already a few users and at least one more is coming which
require an access to Primary to Sideband (P2SB) bridge in order
to get IO or MMIO BAR hidden by BIOS.

Create a library to access P2SB for x86 devices in a unified way.

Background information
======================
Note, the term "bridge" is used in the documentation and it has nothing
to do with a PCI (host) bridge as per the PCI specifications.

The P2SB is an interesting device by its nature and hardware design.
First of all, it has several devices in the hardware behind it. These
devices may or may not be represented as ACPI devices by a firmware.

It also has a hardwired (to 0s) the least significant bits of the
base address register which is represented by the only 64-bit BAR0.
It means that OS mustn't reallocate the BAR.

On top of that in some cases P2SB is represented by function 0 on PCI
slot (in terms of B:D.F) and according to the PCI specification any
other function can't be seen until function 0 is present and visible.

In the PCI configuration space of P2SB device the full 32-bit register
is allocated for the only purpose of hiding the entire P2SB device. As
per [3]:

  3.1.39 P2SB Control (P2SBC)—Offset E0h

  Hide Device (HIDE): When this bit is set, the P2SB will return 1s on
  any PCI Configuration Read on IOSF-P. All other transactions including
  PCI Configuration Writes on IOSF-P are unaffected by this. This does
  not affect reads performed on the IOSF-SB interface.

This doesn't prevent MMIO accesses, although preventing the OS from
assigning these addresses. The firmware on the affected platforms marks
the region as unusable (by cutting it off from the PCI host bridge
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
Technically it's possible to unhide the P2SB device and devices on
the same PCI slot and access them at any time as needed. But there are
several potential issues with that:

 - the systems were never tested against such configuration and hence
   nobody knows what kind of bugs it may bring, especially when we talk
   about SPI NOR case which contains Intel FirmWare Image (IFWI) code
   (including BIOS) and already known to be problematic in the past for
   end users

 - the PCI by its nature is a hotpluggable bus and in case somebody
   attaches a driver to the functions of a P2SB slot device(s) the
   end user experience and system behaviour can be unpredictable

 - the kernel code would need some ugly hacks (or code looking as an
   ugly hack) under arch/x86/pci in order to enable these devices on
   only selected platforms (which may include CPU ID table followed by
   a potentially growing number of DMI strings

The future improvements
=======================
The future improvements with this code may go in order to gain some kind
of cache, if it's possible at all, to prevent unhiding and hiding many
times to take static information that may be saved once per boot.

Links
=====
[1]: https://lab.whitequark.org/notes/2017-11-08/accessing-intel-ich-pch-gpios/
[2]: https://cdrdv2.intel.com/v1/dl/getContent/332690?wapkw=332690
[3]: https://cdrdv2.intel.com/v1/dl/getContent/332691?wapkw=332691
[4]: https://medium.com/@jacksonchen_43335/bios-gpio-p2sb-70e9b829b403

Signed-off-by: Jonathan Yong <jonathan.yong@intel.com>
Co-developed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Henning Schild <henning.schild@siemens.com>
Acked-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/platform/x86/intel/Kconfig     |  12 +++
 drivers/platform/x86/intel/Makefile    |   2 +
 drivers/platform/x86/intel/p2sb.c      | 127 +++++++++++++++++++++++++
 include/linux/platform_data/x86/p2sb.h |  28 ++++++
 4 files changed, 169 insertions(+)
 create mode 100644 drivers/platform/x86/intel/p2sb.c
 create mode 100644 include/linux/platform_data/x86/p2sb.h

diff --git a/drivers/platform/x86/intel/Kconfig b/drivers/platform/x86/intel/Kconfig
index 1f01a8a23c57..f0c4334bc0ca 100644
--- a/drivers/platform/x86/intel/Kconfig
+++ b/drivers/platform/x86/intel/Kconfig
@@ -69,6 +69,18 @@ config INTEL_OAKTRAIL
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
index c61bc3e97121..8a999f70e55c 100644
--- a/drivers/platform/x86/intel/Makefile
+++ b/drivers/platform/x86/intel/Makefile
@@ -27,6 +27,8 @@ intel_int0002_vgpio-y			:= int0002_vgpio.o
 obj-$(CONFIG_INTEL_INT0002_VGPIO)	+= intel_int0002_vgpio.o
 intel_oaktrail-y			:= oaktrail.o
 obj-$(CONFIG_INTEL_OAKTRAIL)		+= intel_oaktrail.o
+intel_p2sb-y				:= p2sb.o
+obj-$(CONFIG_P2SB)			+= intel_p2sb.o
 intel_sdsi-y				:= sdsi.o
 obj-$(CONFIG_INTEL_SDSI)		+= intel_sdsi.o
 intel_vsec-y				:= vsec.o
diff --git a/drivers/platform/x86/intel/p2sb.c b/drivers/platform/x86/intel/p2sb.c
new file mode 100644
index 000000000000..b598ef14dbc6
--- /dev/null
+++ b/drivers/platform/x86/intel/p2sb.c
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Primary to Sideband (P2SB) bridge access support
+ *
+ * Copyright (c) 2017, 2021-2022 Intel Corporation.
+ *
+ * Authors: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
+ *	    Jonathan Yong <jonathan.yong@intel.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/export.h>
+#include <linux/pci.h>
+#include <linux/platform_data/x86/p2sb.h>
+
+#include <asm/cpu_device_id.h>
+#include <asm/intel-family.h>
+
+#define P2SBC			0xe0
+#define P2SBC_HIDE		BIT(8)
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
+static int p2sb_read_bar0(struct pci_dev *pdev, struct resource *mem)
+{
+	/* Copy resource from the first BAR of the device in question */
+	*mem = pdev->resource[0];
+	return 0;
+}
+
+static int p2sb_scan_and_read(struct pci_bus *bus, unsigned int devfn, struct resource *mem)
+{
+	struct pci_dev *pdev;
+	int ret;
+
+	pdev = pci_scan_single_device(bus, devfn);
+	if (!pdev)
+		return -ENODEV;
+
+	ret = p2sb_read_bar0(pdev, mem);
+
+	pci_stop_and_remove_bus_device(pdev);
+	return ret;
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
+ * if @bus is NULL, the bus 0 in domain 0 will be used.
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
+	struct pci_dev *pdev_p2sb;
+	unsigned int devfn_p2sb;
+	u32 value = P2SBC_HIDE;
+	int ret;
+
+	/* Get devfn for P2SB device itself */
+	ret = p2sb_get_devfn(&devfn_p2sb);
+	if (ret)
+		return ret;
+
+	/* if @bus is NULL, use bus 0 in domain 0 */
+	bus = bus ?: pci_find_bus(0, 0);
+
+	/*
+	 * Prevent concurrent PCI bus scan from seeing the P2SB device and
+	 * removing via sysfs while it is temporarily exposed.
+	 */
+	pci_lock_rescan_remove();
+
+	/* Unhide the P2SB device, if needed */
+	pci_bus_read_config_dword(bus, devfn_p2sb, P2SBC, &value);
+	if (value & P2SBC_HIDE)
+		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, 0);
+
+	pdev_p2sb = pci_scan_single_device(bus, devfn_p2sb);
+	if (devfn)
+		ret = p2sb_scan_and_read(bus, devfn, mem);
+	else
+		ret = p2sb_read_bar0(pdev_p2sb, mem);
+	pci_stop_and_remove_bus_device(pdev_p2sb);
+
+	/* Hide the P2SB device, if it was hidden */
+	if (value & P2SBC_HIDE)
+		pci_bus_write_config_dword(bus, devfn_p2sb, P2SBC, P2SBC_HIDE);
+
+	pci_unlock_rescan_remove();
+
+	if (ret)
+		return ret;
+
+	if (mem->flags == 0)
+		return -ENODEV;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(p2sb_bar);
diff --git a/include/linux/platform_data/x86/p2sb.h b/include/linux/platform_data/x86/p2sb.h
new file mode 100644
index 000000000000..a1d5fddc8f13
--- /dev/null
+++ b/include/linux/platform_data/x86/p2sb.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Primary to Sideband (P2SB) bridge access support
+ */
+
+#ifndef _PLATFORM_DATA_X86_P2SB_H
+#define _PLATFORM_DATA_X86_P2SB_H
+
+#include <linux/errno.h>
+#include <linux/kconfig.h>
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
2.35.1

