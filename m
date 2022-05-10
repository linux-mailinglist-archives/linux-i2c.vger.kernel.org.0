Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55A26521E3F
	for <lists+linux-i2c@lfdr.de>; Tue, 10 May 2022 17:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345870AbiEJP1m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 May 2022 11:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345865AbiEJP11 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 May 2022 11:27:27 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE4E6C2F;
        Tue, 10 May 2022 08:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652195870; x=1683731870;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y7E4CLRa6BgtD+lqadZc0VtoWUMuhkwoVujS7HBVdOA=;
  b=As11Y4/5EZEMN1iV5KohWMCQ5SvtcxXQmFl2FIcY3mSXjR+QEP3Pn96u
   nfGl4RbAgWQCTFnDrNam/EV5f3k4CHMrSQiMnDeajAtrAwWlSh3LEz5bg
   bbwxIRRORjohaXyyt1LdJ2kDTA0QSA6CMA/O0MI2JV3HcayyXhqHYdn2L
   yyiX0XYoHBPDdlSbTgSituPJaXIcjat6M/x8Bib0c7A152w3xFaa3VUmw
   87uVT0n04Y80fsX8izGJgV4vRxiqlkRtz0bZdv7sgX8ZwWc6QodhmkklH
   XGdOodk1xNbypAd9vx6I89qpch6IUum+q03SYwYg1vdy38BSwkHUfBGDX
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="355830866"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="355830866"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 08:17:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="635995834"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga004.fm.intel.com with ESMTP; 10 May 2022 08:17:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 9DA63590; Tue, 10 May 2022 18:15:16 +0300 (EEST)
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
Subject: [PATCH v5 4/8] mfd: lpc_ich: Switch to generic p2sb_bar()
Date:   Tue, 10 May 2022 18:14:47 +0300
Message-Id: <20220510151451.85561-5-andriy.shevchenko@linux.intel.com>
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

Instead of open coding p2sb_bar() functionality we are going to
use generic library. There is one more user en route.

This is more than just a clean-up. It also fixes a potential issue
seen when SPI BAR is 64-bit. The current code works if and only if
the PCI BAR of the hidden device is inside 4G address space. In case
when firmware decides to go above 4G, we will get a wrong address.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Henning Schild <henning.schild@siemens.com>
Acked-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/Kconfig   |  1 +
 drivers/mfd/lpc_ich.c | 27 ++++++++-------------------
 2 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 3b59456f5545..9566341de470 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -572,6 +572,7 @@ config LPC_ICH
 	tristate "Intel ICH LPC"
 	depends on PCI
 	select MFD_CORE
+	select P2SB if X86
 	help
 	  The LPC bridge function of the Intel ICH provides support for
 	  many functional units. This driver provides needed support for
diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
index d9175cb8a2d5..e360651c5406 100644
--- a/drivers/mfd/lpc_ich.c
+++ b/drivers/mfd/lpc_ich.c
@@ -45,6 +45,7 @@
 #include <linux/mfd/core.h>
 #include <linux/mfd/lpc_ich.h>
 #include <linux/platform_data/itco_wdt.h>
+#include <linux/platform_data/x86/p2sb.h>
 
 #define ACPIBASE		0x40
 #define ACPIBASE_GPE_OFF	0x28
@@ -71,8 +72,6 @@
 #define BCR			0xdc
 #define BCR_WPD			BIT(0)
 
-#define SPIBASE_APL_SZ		4096
-
 #define GPIOBASE_ICH0		0x58
 #define GPIOCTRL_ICH0		0x5C
 #define GPIOBASE_ICH6		0x48
@@ -1134,6 +1133,7 @@ static int lpc_ich_init_spi(struct pci_dev *dev)
 	struct resource *res = &intel_spi_res[0];
 	struct intel_spi_boardinfo *info;
 	u32 spi_base, rcba;
+	int ret;
 
 	info = devm_kzalloc(&dev->dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
@@ -1164,30 +1164,19 @@ static int lpc_ich_init_spi(struct pci_dev *dev)
 		}
 		break;
 
-	case INTEL_SPI_BXT: {
-		unsigned int p2sb = PCI_DEVFN(13, 0);
-		unsigned int spi = PCI_DEVFN(13, 2);
-		struct pci_bus *bus = dev->bus;
-
+	case INTEL_SPI_BXT:
 		/*
 		 * The P2SB is hidden by BIOS and we need to unhide it in
 		 * order to read BAR of the SPI flash device. Once that is
 		 * done we hide it again.
 		 */
-		pci_bus_write_config_byte(bus, p2sb, 0xe1, 0x0);
-		pci_bus_read_config_dword(bus, spi, PCI_BASE_ADDRESS_0,
-					  &spi_base);
-		if (spi_base != ~0) {
-			res->start = spi_base & 0xfffffff0;
-			res->end = res->start + SPIBASE_APL_SZ - 1;
-
-			info->set_writeable = lpc_ich_bxt_set_writeable;
-			info->data = dev;
-		}
+		ret = p2sb_bar(dev->bus, PCI_DEVFN(13, 2), res);
+		if (ret)
+			return ret;
 
-		pci_bus_write_config_byte(bus, p2sb, 0xe1, 0x1);
+		info->set_writeable = lpc_ich_bxt_set_writeable;
+		info->data = dev;
 		break;
-	}
 
 	default:
 		return -EINVAL;
-- 
2.35.1

