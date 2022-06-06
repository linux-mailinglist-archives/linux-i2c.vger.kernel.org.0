Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1846653E95C
	for <lists+linux-i2c@lfdr.de>; Mon,  6 Jun 2022 19:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231207AbiFFQl4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 Jun 2022 12:41:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230514AbiFFQl4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 6 Jun 2022 12:41:56 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2E76DF8B;
        Mon,  6 Jun 2022 09:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1654533714; x=1686069714;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RI6UqOh9xYxAqMF8vYRnoqK0g1vUqPho6h1TZ3tsMs0=;
  b=bKyKxpFTr8JCaLEaBiVouN7EWZFr0Us16prKB3fJBifWg8wFJR6IXnDl
   lIycI/p1K/l5r062zHjleG0TPR+Mi8sQyzpVGM9xvU525ZR8NPhWZyAx9
   RCiGVubp0nV5JvoY8rv7/iD5B4yppw0Ps+3RUV0Nq15lWjuWeB+Z6LbjW
   rqKt90BGoUU+9xacVwwCCcOMqL6ozKBAGtqoMytyg6Cw82tQoPc6fBwCl
   Gridm6KbiseW3mlYt8WEBnK9iRn9ZbsEE6OZYHsugfH4/Yeyrtt6cRDdv
   +JMvT39SgGJ7rcG48sZct/kkiFxLEeCH72B425UjKuDXVq2X3ch1pfP4S
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10370"; a="275446378"
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="275446378"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2022 09:41:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,280,1647327600"; 
   d="scan'208";a="906623914"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga005.fm.intel.com with ESMTP; 06 Jun 2022 09:41:47 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 7CE85A97; Mon,  6 Jun 2022 19:41:50 +0300 (EEST)
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
Subject: [PATCH v6 03/12] mfd: lpc_ich: Factor out lpc_ich_enable_spi_write()
Date:   Mon,  6 Jun 2022 19:41:29 +0300
Message-Id: <20220606164138.66535-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
References: <20220606164138.66535-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
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

