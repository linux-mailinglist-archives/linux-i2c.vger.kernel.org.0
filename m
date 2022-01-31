Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C45C04A4A01
	for <lists+linux-i2c@lfdr.de>; Mon, 31 Jan 2022 16:15:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377605AbiAaPOg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 31 Jan 2022 10:14:36 -0500
Received: from mga03.intel.com ([134.134.136.65]:14352 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349421AbiAaPOI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 31 Jan 2022 10:14:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643642048; x=1675178048;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zl1WEsN+S0fe432u7xlUnaY5szL7dEoqtZRLgOVer54=;
  b=kKHExrE11clqVVWI9rCEYj4ADv9IJzpqI+CYvs4DEo7WigXpNERAgzKT
   +6xB05sbVdcwaWjZ6J88JNkAbFcE/6//bXfMxXIBJr+teFHYMVPLY28Mx
   hug0dMGWePtUAPy+B+eVAArQd/nP9nftJAtdpkLuibeX/Ie6WCW209mVW
   NYwRerQ36tBJyMmHwv6GxMByltUhZml+J20KJpsTagRwovqognBAlZGPs
   oY4X10sZkydOB3YBXUJr3kgW5KmVdrU+dpexTM3mdk+Ub2766e219Sq7/
   TDX7u2nYRQUMFkfjV59XiP1J7k3fE1NDQxCK1es9/chbMWPIWjUjbKfFF
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10243"; a="247432625"
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="247432625"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2022 07:14:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,331,1635231600"; 
   d="scan'208";a="534199166"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 31 Jan 2022 07:14:01 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id E5C9A3C8; Mon, 31 Jan 2022 17:14:15 +0200 (EET)
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
Subject: [PATCH v4 3/8] mfd: lpc_ich: Factor out lpc_ich_enable_spi_write()
Date:   Mon, 31 Jan 2022 17:13:41 +0200
Message-Id: <20220131151346.45792-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131151346.45792-1-andriy.shevchenko@linux.intel.com>
References: <20220131151346.45792-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Factor out duplicate code to lpc_ich_enable_spi_write() helper function.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
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

