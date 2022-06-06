Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10A9F53E677
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jun 2022 19:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230515AbiFFQq1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jun 2022 12:46:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230448AbiFFQq0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jun 2022 12:46:26 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A8A415BAE2;
        Mon,  6 Jun 2022 09:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654533985; x=1686069985;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Y7E4CLRa6BgtD+lqadZc0VtoWUMuhkwoVujS7HBVdOA=;
  b=Bb5yvQn4U7Unc9LHRwuLc04qwcd5V/mfjRBnCgR2HF9A2v+KJzkVOXLe
   mm6EDL3YHal8FT3YP1l/6lbwO/Gxy75TjBJouBjwJHFy+YuCITLN3f57U
   NkhltW0TP+EfhITZbVmChU2cmRM5TLds8TxWppW+mAas9Zrk8FmrYe2mS
   GkzqD/9YiGw67C12a+cJ5pzGAjS938SQhtnwQJ6rr+5RJeV5rl7QQ3Nz/
   J87s6fYWAd3mYk9vYbQnHlbxA1qd8Ugpb6m5Zycc8mcqgKuIIXG5NZAOr
   wB0XsHyyxtRD4F7zcSHNw5XXy1jeliQRbN3Z/EkIqvgFmY+6GdcjUk575
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="259081431"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="259081431"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 09:41:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="532206862"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 06 Jun 2022 09:41:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8A9D6B85; Mon,  6 Jun 2022 19:41:50 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tony Luck <tony.luck@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Henning Schild <henning.schild@siemens.com>,
        Lee Jones <lee.jones@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Cc:     Borislav Petkov <bp@alien8.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        James Morse <james.morse@arm.com>,
        Robert Richter <rric@kernel.org>,
        Jean Delvare <jdelvare@suse.com>, Pavel Machek <pavel@ucw.cz>,
        Peter Tyser <ptyser@xes-inc.com>,
        Andy Shevchenko <andy@kernel.org>,
        Mark Gross <markgross@kernel.org>
Subject: [PATCH v6 04/12] mfd: lpc_ich: Switch to generic p2sb_bar()
Date:   Mon,  6 Jun 2022 19:41:30 +0300
Message-Id: <20220606164138.66535-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
References: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
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

