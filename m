Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62C1C330D40
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Mar 2021 13:21:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230512AbhCHMUx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Mar 2021 07:20:53 -0500
Received: from mga12.intel.com ([192.55.52.136]:52723 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230202AbhCHMUq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 8 Mar 2021 07:20:46 -0500
IronPort-SDR: 1Rl+bd2TLNR9ttBtL1kKFcWj04rY79Md8U3SVQFg3mavBmvfRrQLWtrkxbXhauWDVqAWjig5G8
 FDdiKFc6+HWA==
X-IronPort-AV: E=McAfee;i="6000,8403,9916"; a="167288062"
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="167288062"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 04:20:46 -0800
IronPort-SDR: 7KV5jbUKmEKHOclGAFqIRsLBCRwD041e9V+1NC7Oz4tSjFWlUGJNzteYGelNMghzFBmIRttzCS
 S9Pg8+TiCmiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="447120674"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 08 Mar 2021 04:20:42 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 451C25BD; Mon,  8 Mar 2021 14:20:38 +0200 (EET)
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
Subject: [PATCH v1 7/7] i2c: i801: convert to use common P2SB accessor
Date:   Mon,  8 Mar 2021 14:20:20 +0200
Message-Id: <20210308122020.57071-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com>
References: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since we have a common P2SB accessor in tree we may use it instead of
open coded variants.

Replace custom code by pci_p2sb_bar() call.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/Kconfig    |  1 +
 drivers/i2c/busses/i2c-i801.c | 40 ++++++++---------------------------
 drivers/pci/pci-p2sb.c        |  6 ++++++
 3 files changed, 16 insertions(+), 31 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 05ebf7546e3f..ffd3007f888c 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -101,6 +101,7 @@ config I2C_HIX5HD2
 config I2C_I801
 	tristate "Intel 82801 (ICH/PCH)"
 	depends on PCI
+	select PCI_P2SB if X86
 	select CHECK_SIGNATURE if X86 && DMI
 	select I2C_SMBUS
 	help
diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 4acee6f9e5a3..23b43de9786a 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -90,6 +90,7 @@
 #include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/pci-p2sb.h>
 #include <linux/kernel.h>
 #include <linux/stddef.h>
 #include <linux/delay.h>
@@ -136,7 +137,6 @@
 #define TCOBASE		0x050
 #define TCOCTL		0x054
 
-#define SBREG_BAR		0x10
 #define SBREG_SMBCTRL		0xc6000c
 #define SBREG_SMBCTRL_DNV	0xcf000c
 
@@ -1524,52 +1524,30 @@ static const struct itco_wdt_platform_data spt_tco_platform_data = {
 	.version = 4,
 };
 
-static DEFINE_SPINLOCK(p2sb_spinlock);
-
 static struct platform_device *
 i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
 		 struct resource *tco_res)
 {
 	struct resource *res;
 	unsigned int devfn;
-	u64 base64_addr;
-	u32 base_addr;
-	u8 hidden;
+	int ret;
 
 	/*
 	 * We must access the NO_REBOOT bit over the Primary to Sideband
-	 * bridge (P2SB). The BIOS prevents the P2SB device from being
-	 * enumerated by the PCI subsystem, so we need to unhide/hide it
-	 * to lookup the P2SB BAR.
+	 * bridge (P2SB).
 	 */
-	spin_lock(&p2sb_spinlock);
 
 	devfn = PCI_DEVFN(PCI_SLOT(pci_dev->devfn), 1);
 
-	/* Unhide the P2SB device, if it is hidden */
-	pci_bus_read_config_byte(pci_dev->bus, devfn, 0xe1, &hidden);
-	if (hidden)
-		pci_bus_write_config_byte(pci_dev->bus, devfn, 0xe1, 0x0);
-
-	pci_bus_read_config_dword(pci_dev->bus, devfn, SBREG_BAR, &base_addr);
-	base64_addr = base_addr & 0xfffffff0;
-
-	pci_bus_read_config_dword(pci_dev->bus, devfn, SBREG_BAR + 0x4, &base_addr);
-	base64_addr |= (u64)base_addr << 32;
-
-	/* Hide the P2SB device, if it was hidden before */
-	if (hidden)
-		pci_bus_write_config_byte(pci_dev->bus, devfn, 0xe1, hidden);
-	spin_unlock(&p2sb_spinlock);
-
 	res = &tco_res[1];
+	ret = pci_p2sb_bar(pci_dev, devfn, res);
+	if (ret)
+		return ERR_PTR(ret);
+
 	if (pci_dev->device == PCI_DEVICE_ID_INTEL_DNV_SMBUS)
-		res->start = (resource_size_t)base64_addr + SBREG_SMBCTRL_DNV;
+		res->start += SBREG_SMBCTRL_DNV;
 	else
-		res->start = (resource_size_t)base64_addr + SBREG_SMBCTRL;
-
-	res->end = res->start + 3;
-	res->flags = IORESOURCE_MEM;
+		res->start += SBREG_SMBCTRL;
 
 	return platform_device_register_resndata(&pci_dev->dev, "iTCO_wdt", -1,
 					tco_res, 2, &spt_tco_platform_data,
diff --git a/drivers/pci/pci-p2sb.c b/drivers/pci/pci-p2sb.c
index 68d7dad48cdb..7f6bc7d4482a 100644
--- a/drivers/pci/pci-p2sb.c
+++ b/drivers/pci/pci-p2sb.c
@@ -22,6 +22,12 @@
 
 static const struct x86_cpu_id p2sb_cpu_ids[] = {
 	X86_MATCH_INTEL_FAM6_MODEL(ATOM_GOLDMONT,	PCI_DEVFN(13, 0)),
+	X86_MATCH_INTEL_FAM6_MODEL(ATOM_GOLDMONT_D,	PCI_DEVFN(31, 1)),
+	X86_MATCH_INTEL_FAM6_MODEL(ATOM_SILVERMONT_D,	PCI_DEVFN(31, 1)),
+	X86_MATCH_INTEL_FAM6_MODEL(KABYLAKE,		PCI_DEVFN(31, 1)),
+	X86_MATCH_INTEL_FAM6_MODEL(KABYLAKE_L,		PCI_DEVFN(31, 1)),
+	X86_MATCH_INTEL_FAM6_MODEL(SKYLAKE,		PCI_DEVFN(31, 1)),
+	X86_MATCH_INTEL_FAM6_MODEL(SKYLAKE_L,		PCI_DEVFN(31, 1)),
 	{}
 };
 
-- 
2.30.1

