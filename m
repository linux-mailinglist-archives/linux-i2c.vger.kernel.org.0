Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37D2147C5B9
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Dec 2021 19:07:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240878AbhLUSHb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Dec 2021 13:07:31 -0500
Received: from mga02.intel.com ([134.134.136.20]:28871 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240866AbhLUSH3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Dec 2021 13:07:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640110049; x=1671646049;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h6UTVBeZT7gn1lfluVUbX+dyfb0Xa5oO3oRjnoBANlQ=;
  b=nwXNT8GQjKfNJhEtlbkSVqS8D7Y4gYkFNYU02ER3Px4RTgQz8e5F9id2
   Ing1fPz1Ujb39DACSWgEF4s7HigRtxlDTvXNyb6pJayHMWC/e6U9vZBb8
   2NSAVPgMMLK0jo5KC8XhZvpByjQHyUdH9FfDWGAjO0DG/aXW/ukS7s63a
   Z+oinfOyB8MycxY4OvlA3cJI1rkZCuwPDLB2MnxuPx8k89l8860WdCJ43
   DKswiS4MAzYt+zJREPonReIk8qKwB3iuMXAI40rwM2523Gs+xgKMo8paq
   rnFKsdKK5v8SsdfAVrvCe1AroDnCzLHwvvo8vBPprJB5eBskzlZJGdyzK
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="227751347"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="227751347"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2021 09:41:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="755891858"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga006.fm.intel.com with ESMTP; 21 Dec 2021 09:41:07 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E01C740C; Tue, 21 Dec 2021 19:41:09 +0200 (EET)
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
        Mark Gross <markgross@kernel.org>
Subject: [PATCH v2 8/8] i2c: i801: convert to use common P2SB accessor
Date:   Tue, 21 Dec 2021 19:39:45 +0200
Message-Id: <20211221173945.53674-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211221173945.53674-1-andriy.shevchenko@linux.intel.com>
References: <20211221173945.53674-1-andriy.shevchenko@linux.intel.com>
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
 drivers/i2c/busses/Kconfig        |  1 +
 drivers/i2c/busses/i2c-i801.c     | 39 +++++++------------------------
 drivers/platform/x86/intel/p2sb.c |  6 +++++
 3 files changed, 16 insertions(+), 30 deletions(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 42da31c1ab70..286f3b14712b 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -101,6 +101,7 @@ config I2C_HIX5HD2
 config I2C_I801
 	tristate "Intel 82801 (ICH/PCH)"
 	depends on PCI
+	select P2SB if X86
 	select CHECK_SIGNATURE if X86 && DMI
 	select I2C_SMBUS
 	help
diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 7428cc6af5cc..950a9b444adf 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -110,6 +110,7 @@
 #include <linux/err.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/itco_wdt.h>
+#include <linux/platform_data/x86/p2sb.h>
 #include <linux/pm_runtime.h>
 #include <linux/mutex.h>
 
@@ -139,7 +140,6 @@
 #define TCOBASE		0x050
 #define TCOCTL		0x054
 
-#define SBREG_BAR		0x10
 #define SBREG_SMBCTRL		0xc6000c
 #define SBREG_SMBCTRL_DNV	0xcf000c
 
@@ -1474,45 +1474,24 @@ i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
 		.version = 4,
 	};
 	struct resource *res;
-	unsigned int devfn;
-	u64 base64_addr;
-	u32 base_addr;
-	u8 hidden;
+	int ret;
 
 	/*
 	 * We must access the NO_REBOOT bit over the Primary to Sideband
-	 * bridge (P2SB). The BIOS prevents the P2SB device from being
-	 * enumerated by the PCI subsystem, so we need to unhide/hide it
-	 * to lookup the P2SB BAR.
+	 * (P2SB) bridge.
 	 */
-	pci_lock_rescan_remove();
-
-	devfn = PCI_DEVFN(PCI_SLOT(pci_dev->devfn), 1);
-
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
-	pci_unlock_rescan_remove();
 
 	res = &tco_res[1];
+	ret = p2sb_bar(pci_dev->bus, 0, res);
+	if (ret)
+		return ERR_PTR(ret);
+
 	if (pci_dev->device == PCI_DEVICE_ID_INTEL_DNV_SMBUS)
-		res->start = (resource_size_t)base64_addr + SBREG_SMBCTRL_DNV;
+		res->start += SBREG_SMBCTRL_DNV;
 	else
-		res->start = (resource_size_t)base64_addr + SBREG_SMBCTRL;
+		res->start += SBREG_SMBCTRL;
 
 	res->end = res->start + 3;
-	res->flags = IORESOURCE_MEM;
 
 	return platform_device_register_resndata(&pci_dev->dev, "iTCO_wdt", -1,
 					tco_res, 2, &pldata, sizeof(pldata));
diff --git a/drivers/platform/x86/intel/p2sb.c b/drivers/platform/x86/intel/p2sb.c
index b47517572310..916318a7310b 100644
--- a/drivers/platform/x86/intel/p2sb.c
+++ b/drivers/platform/x86/intel/p2sb.c
@@ -24,6 +24,12 @@
 
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
2.34.1

