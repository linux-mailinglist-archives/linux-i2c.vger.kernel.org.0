Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B96316FFCA
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Feb 2020 14:21:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726992AbgBZNV3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Feb 2020 08:21:29 -0500
Received: from mga06.intel.com ([134.134.136.31]:39882 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726892AbgBZNV2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Feb 2020 08:21:28 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 26 Feb 2020 05:21:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,488,1574150400"; 
   d="scan'208";a="231395659"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 26 Feb 2020 05:21:23 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id AC008418; Wed, 26 Feb 2020 15:21:22 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Wolfram Sang <wsa@the-dreams.de>
Cc:     Martin Volf <martin.volf.42@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] watchdog: iTCO_wdt: Make ICH_RES_IO_SMI optional
Date:   Wed, 26 Feb 2020 16:21:21 +0300
Message-Id: <20200226132122.62805-3-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200226132122.62805-1-mika.westerberg@linux.intel.com>
References: <20200226132122.62805-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The iTCO_wdt driver only needs ICH_RES_IO_SMI I/O resource when either
turn_SMI_watchdog_clear_off module parameter is set to match ->iTCO_version
(or higher), and when legacy iTCO_vendorsupport is set. Modify the driver
so that ICH_RES_IO_SMI is optional if the two conditions are not met.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/watchdog/iTCO_wdt.c | 28 ++++++++++++++++------------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
index 156360e37714..e707c4797f76 100644
--- a/drivers/watchdog/iTCO_wdt.c
+++ b/drivers/watchdog/iTCO_wdt.c
@@ -459,13 +459,25 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
 	if (!p->tco_res)
 		return -ENODEV;
 
-	p->smi_res = platform_get_resource(pdev, IORESOURCE_IO, ICH_RES_IO_SMI);
-	if (!p->smi_res)
-		return -ENODEV;
-
 	p->iTCO_version = pdata->version;
 	p->pci_dev = to_pci_dev(dev->parent);
 
+	p->smi_res = platform_get_resource(pdev, IORESOURCE_IO, ICH_RES_IO_SMI);
+	if (p->smi_res) {
+		/* The TCO logic uses the TCO_EN bit in the SMI_EN register */
+		if (!devm_request_region(dev, p->smi_res->start,
+					 resource_size(p->smi_res),
+					 pdev->name)) {
+			pr_err("I/O address 0x%04llx already in use, device disabled\n",
+			       (u64)SMI_EN(p));
+			return -EBUSY;
+		}
+	} else if (iTCO_vendorsupport ||
+		   turn_SMI_watchdog_clear_off >= p->iTCO_version) {
+		pr_err("SMI I/O resource is missing\n");
+		return -ENODEV;
+	}
+
 	iTCO_wdt_no_reboot_bit_setup(p, pdata);
 
 	/*
@@ -492,14 +504,6 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
 	/* Set the NO_REBOOT bit to prevent later reboots, just for sure */
 	p->update_no_reboot_bit(p->no_reboot_priv, true);
 
-	/* The TCO logic uses the TCO_EN bit in the SMI_EN register */
-	if (!devm_request_region(dev, p->smi_res->start,
-				 resource_size(p->smi_res),
-				 pdev->name)) {
-		pr_err("I/O address 0x%04llx already in use, device disabled\n",
-		       (u64)SMI_EN(p));
-		return -EBUSY;
-	}
 	if (turn_SMI_watchdog_clear_off >= p->iTCO_version) {
 		/*
 		 * Bit 13: TCO_EN -> 0
-- 
2.25.0

