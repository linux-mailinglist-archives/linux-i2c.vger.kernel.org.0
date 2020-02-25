Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E0D8B16C0F7
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Feb 2020 13:38:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730036AbgBYMiH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Feb 2020 07:38:07 -0500
Received: from mga17.intel.com ([192.55.52.151]:14139 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729238AbgBYMiH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Feb 2020 07:38:07 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Feb 2020 04:38:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,484,1574150400"; 
   d="scan'208";a="255937950"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 25 Feb 2020 04:38:03 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 54532489; Tue, 25 Feb 2020 14:38:02 +0200 (EET)
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
Subject: [PATCH 3/3] i2c: i801: Do not add ICH_RES_IO_SMI if PMC device is not present
Date:   Tue, 25 Feb 2020 15:38:02 +0300
Message-Id: <20200225123802.88984-4-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200225123802.88984-1-mika.westerberg@linux.intel.com>
References: <20200225123802.88984-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Martin noticed that nct6775 driver does not load properly on his system
in v5.4+ kernels. The issue was bisected to commit b84398d6d7f9 ("i2c:
i801: Use iTCO version 6 in Cannon Lake PCH and beyond") but it is
likely not the culprit because the faulty code has been in the driver
already since commit 9424693035a5 ("i2c: i801: Create iTCO device on
newer Intel PCHs"). So more likely some commit that added PCI IDs of
recent chipsets made the driver to create the iTCO_wdt device on Martins
system.

The issue was debugged to be PCI configuration access to the PMC device
that is not present. This returns all 1's when read and this caused the
iTCO_wdt driver to accidentally request resourses used by nct6775.

Fix this by checking that the PMC device is there and only then populate
the iTCO_wdt ICH_RES_IO_SMI resource. Since the resource is now optional
the iTCO_wdt driver should continue to work on recent systems without it.

Link: https://lore.kernel.org/linux-hwmon/CAM1AHpQ4196tyD=HhBu-2donSsuogabkfP03v1YF26Q7_BgvgA@mail.gmail.com/
Fixes: 9424693035a5 ("i2c: i801: Create iTCO device on newer Intel PCHs")
Reported-by: Martin Volf <martin.volf.42@gmail.com>
Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
---
 drivers/i2c/busses/i2c-i801.c | 45 +++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 18 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index ca4f096fef74..7fa58375bd4b 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1519,7 +1519,7 @@ static DEFINE_SPINLOCK(p2sb_spinlock);
 
 static struct platform_device *
 i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
-		 struct resource *tco_res)
+		 struct resource *tco_res, size_t nres)
 {
 	struct resource *res;
 	unsigned int devfn;
@@ -1563,7 +1563,7 @@ i801_add_tco_spt(struct i801_priv *priv, struct pci_dev *pci_dev,
 	res->flags = IORESOURCE_MEM;
 
 	return platform_device_register_resndata(&pci_dev->dev, "iTCO_wdt", -1,
-					tco_res, 3, &spt_tco_platform_data,
+					tco_res, nres + 1, &spt_tco_platform_data,
 					sizeof(spt_tco_platform_data));
 }
 
@@ -1574,19 +1574,20 @@ static const struct itco_wdt_platform_data cnl_tco_platform_data = {
 
 static struct platform_device *
 i801_add_tco_cnl(struct i801_priv *priv, struct pci_dev *pci_dev,
-		 struct resource *tco_res)
+		 struct resource *tco_res, size_t nres)
 {
 	return platform_device_register_resndata(&pci_dev->dev, "iTCO_wdt", -1,
-					tco_res, 2, &cnl_tco_platform_data,
+					tco_res, nres, &cnl_tco_platform_data,
 					sizeof(cnl_tco_platform_data));
 }
 
 static void i801_add_tco(struct i801_priv *priv)
 {
 	u32 base_addr, tco_base, tco_ctl, ctrl_val;
-	struct pci_dev *pci_dev = priv->pci_dev;
+	struct pci_dev *pmc_dev, *pci_dev = priv->pci_dev;
 	struct resource tco_res[3], *res;
 	unsigned int devfn;
+	size_t nres = 0;
 
 	/* If we have ACPI based watchdog use that instead */
 	if (acpi_has_watchdog())
@@ -1606,29 +1607,37 @@ static void i801_add_tco(struct i801_priv *priv)
 	res->start = tco_base & ~1;
 	res->end = res->start + 32 - 1;
 	res->flags = IORESOURCE_IO;
+	nres++;
 
 	/*
 	 * Power Management registers.
 	 */
 	devfn = PCI_DEVFN(PCI_SLOT(pci_dev->devfn), 2);
-	pci_bus_read_config_dword(pci_dev->bus, devfn, ACPIBASE, &base_addr);
+	pmc_dev = pci_get_slot(pci_dev->bus, devfn);
+	if (pmc_dev) {
+		pci_read_config_dword(pmc_dev, ACPIBASE, &base_addr);
 
-	res = &tco_res[ICH_RES_IO_SMI];
-	res->start = (base_addr & ~1) + ACPIBASE_SMI_OFF;
-	res->end = res->start + 3;
-	res->flags = IORESOURCE_IO;
+		res = &tco_res[ICH_RES_IO_SMI];
+		res->start = (base_addr & ~1) + ACPIBASE_SMI_OFF;
+		res->end = res->start + 3;
+		res->flags = IORESOURCE_IO;
+		nres++;
 
-	/*
-	 * Enable the ACPI I/O space.
-	 */
-	pci_bus_read_config_dword(pci_dev->bus, devfn, ACPICTRL, &ctrl_val);
-	ctrl_val |= ACPICTRL_EN;
-	pci_bus_write_config_dword(pci_dev->bus, devfn, ACPICTRL, ctrl_val);
+		/*
+		 * Enable the ACPI I/O space.
+		 */
+		pci_read_config_dword(pmc_dev, ACPICTRL, &ctrl_val);
+		ctrl_val |= ACPICTRL_EN;
+		pci_write_config_dword(pmc_dev, ACPICTRL, ctrl_val);
+
+		pci_dev_put(pmc_dev);
+	}
 
 	if (priv->features & FEATURE_TCO_CNL)
-		priv->tco_pdev = i801_add_tco_cnl(priv, pci_dev, tco_res);
+		priv->tco_pdev = i801_add_tco_cnl(priv, pci_dev, tco_res, nres);
 	else
-		priv->tco_pdev = i801_add_tco_spt(priv, pci_dev, tco_res);
+		priv->tco_pdev = i801_add_tco_spt(priv, pci_dev, tco_res, nres);
+
 
 	if (IS_ERR(priv->tco_pdev))
 		dev_warn(&pci_dev->dev, "failed to create iTCO device\n");
-- 
2.25.0

