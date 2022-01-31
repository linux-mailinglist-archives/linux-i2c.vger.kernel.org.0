Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1D284A4A06
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jan 2022 16:15:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379050AbiAaPOi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jan 2022 10:14:38 -0500
Received: from mga18.intel.com ([134.134.136.126]:17029 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1378391AbiAaPOW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 31 Jan 2022 10:14:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643642062; x=1675178062;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+exGFQd/cTQyWk2QAcEy4X66VsJFxyo/yocq2eE5qj4=;
  b=clZGuHtXt2CIGzvmpQNKRCTstHpILMRliNXPW3NSmhGlLLH65M5sZdGx
   4tHoGF+yjvJUc7fONE5QQZdtSTmhrfm8v0abEEYgSxb8nE+YUa/VvBebY
   s2EpOpYISuQxYdqiH6QoGnXtFL6OIv8bps4OMoys7HEtf+zVidGtCmJAG
   l2NhlwdbiCUkYILx8ZEZDJbnfcxgB4AU65/w5GjDtGnEK87IO1LgkXHi5
   CGsSfc8yZZc516mM/JHIJrhxaTmSxfvkIjVs4xA5/2VZznNLRdksuX1ux
   Qn0HFw3rgf13PqfkzBiuJlRfHiwFZ4P1T7x9b9h4o3QzF27u1Luxg7coD
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="231050143"
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="231050143"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 07:14:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="479189238"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 31 Jan 2022 07:14:08 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2FF2250C; Mon, 31 Jan 2022 17:14:16 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Kate Hsuan <hpa@redhat.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Peter Tyser <ptyser@xes-inc.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>,
        Henning Schild <henning.schild@siemens.com>
Subject: [PATCH v4 8/8] EDAC, pnd2: convert to use common P2SB accessor
Date:   Mon, 31 Jan 2022 17:13:46 +0200
Message-Id: <20220131151346.45792-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131151346.45792-1-andriy.shevchenko@linux.intel.com>
References: <20220131151346.45792-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Since we have a common P2SB accessor in tree we may use it instead of
open coded variants.

Replace custom code by p2sb_bar() call.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
 drivers/edac/Kconfig     |  1 +
 drivers/edac/pnd2_edac.c | 55 ++++++++++++----------------------------
 2 files changed, 17 insertions(+), 39 deletions(-)

diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index 58ab63642e72..e566d66999a9 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -262,6 +262,7 @@ config EDAC_I10NM
 config EDAC_PND2
 	tristate "Intel Pondicherry2"
 	depends on PCI && X86_64 && X86_MCE_INTEL
+	select P2SB if X86
 	help
 	  Support for error detection and correction on the Intel
 	  Pondicherry2 Integrated Memory Controller. This SoC IP is
diff --git a/drivers/edac/pnd2_edac.c b/drivers/edac/pnd2_edac.c
index 7d1df120e24c..a20b299f1202 100644
--- a/drivers/edac/pnd2_edac.c
+++ b/drivers/edac/pnd2_edac.c
@@ -28,6 +28,8 @@
 #include <linux/bitmap.h>
 #include <linux/math64.h>
 #include <linux/mod_devicetable.h>
+#include <linux/platform_data/x86/p2sb.h>
+
 #include <asm/cpu_device_id.h>
 #include <asm/intel-family.h>
 #include <asm/processor.h>
@@ -232,42 +234,14 @@ static u64 get_mem_ctrl_hub_base_addr(void)
 	return U64_LSHIFT(hi.base, 32) | U64_LSHIFT(lo.base, 15);
 }
 
-static u64 get_sideband_reg_base_addr(void)
-{
-	struct pci_dev *pdev;
-	u32 hi, lo;
-	u8 hidden;
-
-	pdev = pci_get_device(PCI_VENDOR_ID_INTEL, 0x19dd, NULL);
-	if (pdev) {
-		/* Unhide the P2SB device, if it's hidden */
-		pci_read_config_byte(pdev, 0xe1, &hidden);
-		if (hidden)
-			pci_write_config_byte(pdev, 0xe1, 0);
-
-		pci_read_config_dword(pdev, 0x10, &lo);
-		pci_read_config_dword(pdev, 0x14, &hi);
-		lo &= 0xfffffff0;
-
-		/* Hide the P2SB device, if it was hidden before */
-		if (hidden)
-			pci_write_config_byte(pdev, 0xe1, hidden);
-
-		pci_dev_put(pdev);
-		return (U64_LSHIFT(hi, 32) | U64_LSHIFT(lo, 0));
-	} else {
-		return 0xfd000000;
-	}
-}
-
 #define DNV_MCHBAR_SIZE  0x8000
 #define DNV_SB_PORT_SIZE 0x10000
 static int dnv_rd_reg(int port, int off, int op, void *data, size_t sz, char *name)
 {
 	struct pci_dev *pdev;
 	void __iomem *base;
-	u64 addr;
-	unsigned long size;
+	struct resource r;
+	int ret;
 
 	if (op == 4) {
 		pdev = pci_get_device(PCI_VENDOR_ID_INTEL, 0x1980, NULL);
@@ -279,20 +253,23 @@ static int dnv_rd_reg(int port, int off, int op, void *data, size_t sz, char *na
 	} else {
 		/* MMIO via memory controller hub base address */
 		if (op == 0 && port == 0x4c) {
-			addr = get_mem_ctrl_hub_base_addr();
-			if (!addr)
+			memset(&r, 0, sizeof(r));
+
+			r.start = get_mem_ctrl_hub_base_addr();
+			if (!r.start)
 				return -ENODEV;
-			size = DNV_MCHBAR_SIZE;
+			r.end = r.start + DNV_MCHBAR_SIZE - 1;
 		} else {
 			/* MMIO via sideband register base address */
-			addr = get_sideband_reg_base_addr();
-			if (!addr)
-				return -ENODEV;
-			addr += (port << 16);
-			size = DNV_SB_PORT_SIZE;
+			ret = p2sb_bar(NULL, 0, &r);
+			if (ret)
+				return ret;
+
+			r.start += (port << 16);
+			r.end = r.start + DNV_SB_PORT_SIZE - 1;
 		}
 
-		base = ioremap((resource_size_t)addr, size);
+		base = ioremap(r.start, resource_size(&r));
 		if (!base)
 			return -ENODEV;
 
-- 
2.34.1

