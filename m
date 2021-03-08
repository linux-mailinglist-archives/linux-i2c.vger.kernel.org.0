Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45235330D43
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Mar 2021 13:21:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230271AbhCHMUv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Mar 2021 07:20:51 -0500
Received: from mga09.intel.com ([134.134.136.24]:50394 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229972AbhCHMUl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 8 Mar 2021 07:20:41 -0500
IronPort-SDR: 8HjKfgxdzP3Tr08fLF6Rl+vseFPkMiroFdozuYZidZ2t6Y3/A3C4UxeO03VjoxCstxvOZqMXHF
 UjGPjUOMHmSA==
X-IronPort-AV: E=McAfee;i="6000,8403,9916"; a="188123974"
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="188123974"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2021 04:20:41 -0800
IronPort-SDR: S46f8z3XISa1+fZmCo/UklecqlcJS3knmaT5YZJUn5sLqfhHdmQbHJsSW3dnoSBq7mynelwxRA
 RXjZUEQB/1pw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,232,1610438400"; 
   d="scan'208";a="376069664"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 08 Mar 2021 04:20:37 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id ED38067; Mon,  8 Mar 2021 14:20:37 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Jean Delvare <jdelvare@suse.de>,
        Lee Jones <lee.jones@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Tan Jui Nee <jui.nee.tan@intel.com>,
        Jim Quinlan <james.quinlan@broadcom.com>,
        Jonathan Yong <jonathan.yong@intel.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-pci@vger.kernel.org
Cc:     Jean Delvare <jdelvare@suse.com>, Peter Tyser <ptyser@xes-inc.com>,
        hdegoede@redhat.com, henning.schild@siemens.com
Subject: [PATCH v1 1/7] PCI: Introduce pci_bus_*() printing macros when device is not available
Date:   Mon,  8 Mar 2021 14:20:14 +0200
Message-Id: <20210308122020.57071-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com>
References: <20210308122020.57071-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

In some cases PCI device structure is not available and we want to print
information based on the bus and devfn parameters. For this cases introduce
pci_bus_*() printing macros and replace in existing users.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pci/probe.c | 12 +++---------
 include/linux/pci.h |  9 +++++++++
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 953f15abc850..7d67be52d8e5 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -2268,16 +2268,12 @@ static bool pci_bus_wait_crs(struct pci_bus *bus, int devfn, u32 *l,
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
@@ -2287,9 +2283,7 @@ static bool pci_bus_wait_crs(struct pci_bus *bus, int devfn, u32 *l,
 	}
 
 	if (delay >= 1000)
-		pr_info("pci %04x:%02x:%02x.%d: ready after %dms\n",
-			pci_domain_nr(bus), bus->number,
-			PCI_SLOT(devfn), PCI_FUNC(devfn), delay - 1);
+		pci_bus_info(bus, devfn, "ready after %dms\n", delay - 1);
 
 	return true;
 }
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 86c799c97b77..c557d4a8476f 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -2463,4 +2463,13 @@ void pci_uevent_ers(struct pci_dev *pdev, enum  pci_ers_result err_type);
 	WARN_ONCE(condition, "%s %s: " fmt, \
 		  dev_driver_string(&(pdev)->dev), pci_name(pdev), ##arg)
 
+#define pci_bus_printk(level, bus, devfn, fmt, arg...)		\
+	printk(level "pci %04x:%02x:%02x.%d: " fmt,		\
+	       pci_domain_nr(bus), bus->number,			\
+	       PCI_SLOT(devfn), PCI_FUNC(devfn), ##arg)
+
+#define pci_bus_err(bus, devfn, fmt, arg...)	pci_bus_printk(KERN_ERR, bus, devfn, fmt, ##arg)
+#define pci_bus_warn(bus, devfn, fmt, arg...)	pci_bus_printk(KERN_WARNING, bus, devfn, fmt, ##arg)
+#define pci_bus_info(bus, devfn, fmt, arg...)	pci_bus_printk(KERN_INFO, bus, devfn, fmt, ##arg)
+
 #endif /* LINUX_PCI_H */
-- 
2.30.1

