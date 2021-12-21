Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1E4B47C659
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Dec 2021 19:20:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241241AbhLUSUW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Dec 2021 13:20:22 -0500
Received: from mga09.intel.com ([134.134.136.24]:10988 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241240AbhLUSUV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Dec 2021 13:20:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640110821; x=1671646821;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=odfpjb40813bEsnO4F0m5yfmvDKHC6/Q8vBwdpPGyIo=;
  b=gK+dCGuVXi1bQD1f296By5g7/GF5S9rQMTi3a/KD/Cr2y/83NB0N2REp
   FE3Gdtqhaj9kyBMf8ZVHK6WkGOr2U3DIriJtvpiAqzW++8BLwTAqT7BCQ
   deLaWPCzDD41Ico3jHOltY8hnBq4lnXDhnfYrgk1FrMdnb0ZxN0rADIzn
   F5WW4iw1K45OFwCHeLJOMEUgIW70e/DOZOp3K4GeeozRbFwUdFlr8nBZj
   dGs68gmrep0a058LXMhQ7BfIp/23095lXDnL9R89pwPEkHnUhJT7ZFD4R
   t8vl2GT26++tZWIE18zeRGvIkGkydDUddydQ8r7qXPWThAwpx4wEbSxTY
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="240270405"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="240270405"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2021 10:15:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="607153245"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2021 10:15:37 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 20612379; Tue, 21 Dec 2021 20:15:40 +0200 (EET)
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
Subject: [PATCH v3 5/8] mfd: lpc_ich: Factor out lpc_ich_enable_spi_write()
Date:   Tue, 21 Dec 2021 20:15:23 +0200
Message-Id: <20211221181526.53798-6-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211221181526.53798-1-andriy.shevchenko@linux.intel.com>
References: <20211221181526.53798-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Factor out duplicate code to lpc_ich_enable_spi_write() helper function.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/lpc_ich.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
index f10e53187f67..13d8c64318e6 100644
--- a/drivers/mfd/lpc_ich.c
+++ b/drivers/mfd/lpc_ich.c
@@ -1084,12 +1084,21 @@ static int lpc_ich_init_wdt(struct pci_dev *dev)
 	return ret;
 }
 
+static void lpc_ich_test_spi_write(struct pci_dev *dev, unsigned int devfn,
+				   struct intel_spi_boardinfo *info)
+{
+	u32 bcr;
+
+	pci_bus_read_config_dword(dev->bus, devfn, BCR, &bcr);
+	info->writeable = !!(bcr & BCR_WPD);
+}
+
 static int lpc_ich_init_spi(struct pci_dev *dev)
 {
 	struct lpc_ich_priv *priv = pci_get_drvdata(dev);
 	struct resource *res = &intel_spi_res[0];
 	struct intel_spi_boardinfo *info;
-	u32 spi_base, rcba, bcr;
+	u32 spi_base, rcba;
 
 	info = devm_kzalloc(&dev->dev, sizeof(*info), GFP_KERNEL);
 	if (!info)
@@ -1113,8 +1122,7 @@ static int lpc_ich_init_spi(struct pci_dev *dev)
 			res->start = spi_base + SPIBASE_LPT;
 			res->end = res->start + SPIBASE_LPT_SZ - 1;
 
-			pci_read_config_dword(dev, BCR, &bcr);
-			info->writeable = !!(bcr & BCR_WPD);
+			lpc_ich_test_spi_write(dev, dev->devfn, info);
 		}
 		break;
 
@@ -1135,8 +1143,7 @@ static int lpc_ich_init_spi(struct pci_dev *dev)
 			res->start = spi_base & 0xfffffff0;
 			res->end = res->start + SPIBASE_APL_SZ - 1;
 
-			pci_bus_read_config_dword(bus, spi, BCR, &bcr);
-			info->writeable = !!(bcr & BCR_WPD);
+			lpc_ich_test_spi_write(dev, spi, info);
 		}
 
 		pci_bus_write_config_byte(bus, p2sb, 0xe1, 0x1);
-- 
2.34.1

