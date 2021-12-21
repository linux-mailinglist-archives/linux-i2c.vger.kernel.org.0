Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BA0147C655
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Dec 2021 19:20:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241220AbhLUSUU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Dec 2021 13:20:20 -0500
Received: from mga09.intel.com ([134.134.136.24]:10988 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232361AbhLUSUU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Dec 2021 13:20:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640110820; x=1671646820;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4k4x29Qb+0v8l+0y3SmwpANCykxqEpDNAkQhk4vCpjE=;
  b=RlOUG/kZFpqBkPcTllYNGKXJ9TZG8//+iRWw4Z8/iWubRpwzg9cjIcSI
   Exfqefgylm+ldP8HwV5J1wihr1p0Xnjqj9jAJ53W9EAvUdQv/yxZLeY2f
   aSdbxwLeY3LrrhXxNuYH3KpEcepOxvcxTeYb5Rt4rvzyaJ+2kk4zt+O7x
   deH2d7wAW1RH7HYiWX+Koxq+PFppP7nyi3Ou/FTY+eo7kzKR1IfJbCRra
   wR3PQrTGCV5/x/C1fP+I3zeRpdNQ8tYWwfSeONrCeJ+LyQcvha17qHesO
   60VGE4r1BCMF9Pa2MPmeFnv0rQHeWAmbmOmkgBChA+gGlalgXB6UslmhM
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10205"; a="240270381"
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="240270381"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2021 10:15:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,224,1635231600"; 
   d="scan'208";a="607153233"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2021 10:15:31 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id DEBC6144; Tue, 21 Dec 2021 20:15:39 +0200 (EET)
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
Subject: [PATCH v3 1/8] PCI: Introduce pci_bus_*() printing macros when device is not available
Date:   Tue, 21 Dec 2021 20:15:19 +0200
Message-Id: <20211221181526.53798-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211221181526.53798-1-andriy.shevchenko@linux.intel.com>
References: <20211221181526.53798-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In some cases PCI device structure is not available and we want to print
information based on the bus and devfn parameters. For this cases introduce
pci_bus_*() printing macros and replace in existing users.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Jean Delvare <jdelvare@suse.de>
---
 drivers/pci/probe.c | 12 +++---------
 include/linux/pci.h |  8 ++++++++
 2 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 78962652f5bf..82014b248f4d 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2333,16 +2333,12 @@ static bool pci_bus_wait_crs(struct pci_bus *bus, int devfn, u32 *l,
 	 */
 	while (pci_bus_crs_vendor_id(*l)) {
 		if (delay > timeout) {
-			pr_warn("pci %04x:%02x:%02x.%d: not ready after %dms; giving up\n",
-				pci_domain_nr(bus), bus->number,
-				PCI_SLOT(devfn), PCI_FUNC(devfn), delay - 1);
+			pci_bus_warn(bus, devfn, "not ready after %dms; giving up\n", delay - 1);
 
 			return false;
 		}
 		if (delay >= 1000)
-			pr_info("pci %04x:%02x:%02x.%d: not ready after %dms; waiting\n",
-				pci_domain_nr(bus), bus->number,
-				PCI_SLOT(devfn), PCI_FUNC(devfn), delay - 1);
+			pci_bus_info(bus, devfn, "not ready after %dms; waiting\n", delay - 1);
 
 		msleep(delay);
 		delay *= 2;
@@ -2352,9 +2348,7 @@ static bool pci_bus_wait_crs(struct pci_bus *bus, int devfn, u32 *l,
 	}
 
 	if (delay >= 1000)
-		pr_info("pci %04x:%02x:%02x.%d: ready after %dms\n",
-			pci_domain_nr(bus), bus->number,
-			PCI_SLOT(devfn), PCI_FUNC(devfn), delay - 1);
+		pci_bus_info(bus, devfn, "ready after %dms\n", delay - 1);
 
 	return true;
 }
diff --git a/include/linux/pci.h b/include/linux/pci.h
index d4308f847e58..e3c9edd103df 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2484,4 +2484,12 @@ void pci_uevent_ers(struct pci_dev *pdev, enum  pci_ers_result err_type);
 	WARN_ONCE(condition, "%s %s: " fmt, \
 		  dev_driver_string(&(pdev)->dev), pci_name(pdev), ##arg)
 
+#define pci_bus_printk(level, bus, devfn, fmt, arg...) \
+	printk(level "pci %04x:%02x:%02x.%d: " fmt, \
+	       pci_domain_nr(bus), (bus)->number, PCI_SLOT(devfn), PCI_FUNC(devfn), ##arg)
+
+#define pci_bus_err(bus, devfn, fmt, arg...)	pci_bus_printk(KERN_ERR, (bus), devfn, fmt, ##arg)
+#define pci_bus_warn(bus, devfn, fmt, arg...)	pci_bus_printk(KERN_WARNING, (bus), devfn, fmt, ##arg)
+#define pci_bus_info(bus, devfn, fmt, arg...)	pci_bus_printk(KERN_INFO, (bus), devfn, fmt, ##arg)
+
 #endif /* LINUX_PCI_H */
-- 
2.34.1

