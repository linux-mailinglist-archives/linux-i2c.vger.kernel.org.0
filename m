Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35DED521E74
	for <lists+linux-i2c@lfdr.de>; Tue, 10 May 2022 17:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242462AbiEJP2d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 May 2022 11:28:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345692AbiEJP1d (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 10 May 2022 11:27:33 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7327E17054;
        Tue, 10 May 2022 08:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1652195938; x=1683731938;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RI6UqOh9xYxAqMF8vYRnoqK0g1vUqPho6h1TZ3tsMs0=;
  b=c7JlDTz12+0De7ZR65jiwlRfwPCISLaL8BhJxm3yy8fb5Dkni4zHY2sT
   wfJ66TFnOdNkKmDK6vxSLbUT9diY+0QuY+GODvdgrBsqFfziYI4Ki3PB1
   fSHd3YTmuYtaYCpuiJXc9wsbHruQsHngxCYTCi00LGxvrpxFZNOnoWUgC
   xs2wS11hYNEyMr4pd0yek0NH7CJhtc5h2TSxSRh5hwNXTdqHTJy15PvzF
   wEiUHkIkhqS3+5lIw+Rc+K3loME/EDB7ewxqbLL6zX6n1J7cmHfbzc0Ny
   kLkz5nfAPgodLiEPd7mjk8bZZb3dtPUKQ6rqJcNIQOORLyu5UfRBb/m3v
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="249305286"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="249305286"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 08:17:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; 
   d="scan'208";a="552883008"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 10 May 2022 08:17:31 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 8ECBA57E; Tue, 10 May 2022 18:15:16 +0300 (EEST)
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
Subject: [PATCH v5 3/8] mfd: lpc_ich: Factor out lpc_ich_enable_spi_write()
Date:   Tue, 10 May 2022 18:14:46 +0300
Message-Id: <20220510151451.85561-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510151451.85561-1-andriy.shevchenko@linux.intel.com>
References: <20220510151451.85561-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Factor out duplicate code to lpc_ich_enable_spi_write() helper function.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Henning Schild <henning.schild@siemens.com>
Acked-by: Hans de Goede <hdegoede@redhat.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mfd/lpc_ich.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/mfd/lpc_ich.c b/drivers/mfd/lpc_ich.c
index 9ffab9aafd81..d9175cb8a2d5 100644
--- a/drivers/mfd/lpc_ich.c
+++ b/drivers/mfd/lpc_ich.c
@@ -1100,35 +1100,32 @@ static bool lpc_ich_byt_set_writeable(void __iomem *base, void *data)
 	return val & BYT_BCR_WPD;
 }
 
-static bool lpc_ich_lpt_set_writeable(void __iomem *base, void *data)
+static bool lpc_ich_set_writeable(struct pci_bus *bus, unsigned int devfn)
 {
-	struct pci_dev *pdev = data;
 	u32 bcr;
 
-	pci_read_config_dword(pdev, BCR, &bcr);
+	pci_bus_read_config_dword(bus, devfn, BCR, &bcr);
 	if (!(bcr & BCR_WPD)) {
 		bcr |= BCR_WPD;
-		pci_write_config_dword(pdev, BCR, bcr);
-		pci_read_config_dword(pdev, BCR, &bcr);
+		pci_bus_write_config_dword(bus, devfn, BCR, bcr);
+		pci_bus_read_config_dword(bus, devfn, BCR, &bcr);
 	}
 
 	return bcr & BCR_WPD;
 }
 
-static bool lpc_ich_bxt_set_writeable(void __iomem *base, void *data)
+static bool lpc_ich_lpt_set_writeable(void __iomem *base, void *data)
 {
-	unsigned int spi = PCI_DEVFN(13, 2);
-	struct pci_bus *bus = data;
-	u32 bcr;
+	struct pci_dev *pdev = data;
 
-	pci_bus_read_config_dword(bus, spi, BCR, &bcr);
-	if (!(bcr & BCR_WPD)) {
-		bcr |= BCR_WPD;
-		pci_bus_write_config_dword(bus, spi, BCR, bcr);
-		pci_bus_read_config_dword(bus, spi, BCR, &bcr);
-	}
+	return lpc_ich_set_writeable(pdev->bus, pdev->devfn);
+}
 
-	return bcr & BCR_WPD;
+static bool lpc_ich_bxt_set_writeable(void __iomem *base, void *data)
+{
+	struct pci_dev *pdev = data;
+
+	return lpc_ich_set_writeable(pdev->bus, PCI_DEVFN(13, 2));
 }
 
 static int lpc_ich_init_spi(struct pci_dev *dev)
@@ -1185,7 +1182,7 @@ static int lpc_ich_init_spi(struct pci_dev *dev)
 			res->end = res->start + SPIBASE_APL_SZ - 1;
 
 			info->set_writeable = lpc_ich_bxt_set_writeable;
-			info->data = bus;
+			info->data = dev;
 		}
 
 		pci_bus_write_config_byte(bus, p2sb, 0xe1, 0x1);
-- 
2.35.1

