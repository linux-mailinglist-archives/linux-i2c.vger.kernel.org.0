Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03FDE47C662
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Dec 2021 19:21:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241219AbhLUSVn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Dec 2021 13:21:43 -0500
Received: from mga17.intel.com ([192.55.52.151]:29082 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241203AbhLUSVn (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Dec 2021 13:21:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640110903; x=1671646903;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E6FZu5u6JQthoClqs6ziOuXmSYlsUAO7E2O5fDyqdsk=;
  b=ihF233erlQQQVJXmqSG3/It8oPzKk8hm45T4YGSypBp9EimbUEibNfaE
   e7XGfYDyRoWHwlFUH1dhGbP9jnpAPvTaw5NrSzCGfcuxVijTk1coUbxA8
   Rj+cccgM+13gyQ9rRRoQCKKqCgkcUwbPeHPtd3rznBJUoBS92GRk9eXSu
   0LspDH4Bv1a/Jfjs7BLrQlartTiBcmLEEYvG0GTRrm2p7kC8j0cWOQWaO
   pJ/+y4ubqECR/6F6SqfRfSF1tF6SGWYXKEyTfIGK4MqAy4rurq/m3a2gp
   RHWt2GBjyzWM9xttE6wwyVGvTdVeiViM0PZjvlefyVbh8CM8Op1Hn4LzX
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="221139645"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="221139645"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2021 10:15:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="570303297"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 21 Dec 2021 10:15:37 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2E6C93AE; Tue, 21 Dec 2021 20:15:40 +0200 (EET)
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
Subject: [PATCH v3 6/8] mfd: lpc_ich: Switch to generic p2sb_bar()
Date:   Tue, 21 Dec 2021 20:15:24 +0200
Message-Id: <20211221181526.53798-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211221181526.53798-1-andriy.shevchenko@linux.intel.com>
References: <20211221181526.53798-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/Kconfig   |  1 +
 drivers/mfd/lpc_ich.c | 20 ++++++--------------
 2 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index a21cbdf89477..be3616fe78b8 100644
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
index 13d8c64318e6..95dca5434917 100644
--- a/drivers/mfd/lpc_ich.c
+++ b/drivers/mfd/lpc_ich.c
@@ -45,6 +45,7 @@
 #include <linux/mfd/core.h>
 #include <linux/mfd/lpc_ich.h>
 #include <linux/platform_data/itco_wdt.h>
+#include <linux/platform_data/x86/p2sb.h>
 
 #define ACPIBASE		0x40
 #define ACPIBASE_GPE_OFF	0x28
@@ -69,8 +70,6 @@
 #define BCR			0xdc
 #define BCR_WPD			BIT(0)
 
-#define SPIBASE_APL_SZ		4096
-
 #define GPIOBASE_ICH0		0x58
 #define GPIOCTRL_ICH0		0x5C
 #define GPIOBASE_ICH6		0x48
@@ -1127,26 +1126,19 @@ static int lpc_ich_init_spi(struct pci_dev *dev)
 		break;
 
 	case INTEL_SPI_BXT: {
-		unsigned int p2sb = PCI_DEVFN(13, 0);
 		unsigned int spi = PCI_DEVFN(13, 2);
-		struct pci_bus *bus = dev->bus;
+		int ret;
 
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
-			lpc_ich_test_spi_write(dev, spi, info);
-		}
+		ret = p2sb_bar(dev->bus, spi, res);
+		if (ret)
+			return ret;
 
-		pci_bus_write_config_byte(bus, p2sb, 0xe1, 0x1);
+		lpc_ich_test_spi_write(dev, spi, info);
 		break;
 	}
 
-- 
2.34.1

