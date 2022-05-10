Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A171521E85
	for <lists+linux-i2c@lfdr.de>; Tue, 10 May 2022 17:26:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344368AbiEJPaM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 May 2022 11:30:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345765AbiEJP3E (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 May 2022 11:29:04 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74E1E5005E;
        Tue, 10 May 2022 08:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652195976; x=1683731976;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1omZw5dmtXzXRoaAGkEEyclQDmdsq5BTpI3E6oMJveY=;
  b=AS7C+Syq3WxVnNl3Nq13k4gqqEJSi9m7poPr+15V/wEARiDtLzTs99S0
   GfJiUzKshs7HV2nv4jM5a9tSzvWdDX2z4VMkfrfs40N1/nwtQ36W8rkFK
   MZKTEzxc3OJh89Kuno84rnHsgSD7J5mfHswd0L8GhUuZDbBDlnHJJTy5X
   Co+DKk2KPY9qEP9a+l7pp8wIUqEYAIDNkTNyoa5r2CUEqiTCPgfkfk/a/
   tnmehNevPJRwEGCRPUAqpFALtZYNZgCNZ38itJvadlfVAEAfAnCmiZ48c
   xs9Evw9t/FB/AFgof5SSXpdTUmsP32eIRucA0+vwCt9APjaFLm8R0scav
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="330001640"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="330001640"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 08:17:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="894912638"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 10 May 2022 08:17:38 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id CFC10646; Tue, 10 May 2022 18:15:16 +0300 (EEST)
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
Subject: [PATCH v5 8/8] EDAC, pnd2: convert to use common P2SB accessor
Date:   Tue, 10 May 2022 18:14:51 +0300
Message-Id: <20220510151451.85561-9-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510151451.85561-1-andriy.shevchenko@linux.intel.com>
References: <20220510151451.85561-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
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

Since we have a common P2SB accessor in tree we may use it instead of
open coded variants.

Replace custom code by p2sb_bar() call.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Henning Schild <henning.schild@siemens.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
 drivers/edac/Kconfig     |  1 +
 drivers/edac/pnd2_edac.c | 55 ++++++++++++----------------------------
 2 files changed, 17 insertions(+), 39 deletions(-)

diff --git a/drivers/edac/Kconfig b/drivers/edac/Kconfig
index d3e2477948c8..17562cf1fe97 100644
--- a/drivers/edac/Kconfig
+++ b/drivers/edac/Kconfig
@@ -263,6 +263,7 @@ config EDAC_I10NM
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
2.35.1

