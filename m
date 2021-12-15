Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB23B475B87
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Dec 2021 16:12:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243787AbhLOPMQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Dec 2021 10:12:16 -0500
Received: from mga18.intel.com ([134.134.136.126]:62944 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243811AbhLOPMQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Dec 2021 10:12:16 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10198"; a="226104868"
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="226104868"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2021 07:12:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,207,1635231600"; 
   d="scan'208";a="518801190"
Received: from mylly.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.88])
  by orsmga008.jf.intel.com with ESMTP; 15 Dec 2021 07:12:14 -0800
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
To:     linux-i2c@vger.kernel.org
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 4/6] i2c: designware-pci: Group MODULE_*() macros
Date:   Wed, 15 Dec 2021 17:12:03 +0200
Message-Id: <20211215151205.584264-4-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211215151205.584264-1-jarkko.nikula@linux.intel.com>
References: <20211215151205.584264-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

For better maintenance group MODULE_*() macros together.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index f49c41ba5647..021eee44fa3d 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -359,9 +359,6 @@ static void i2c_dw_pci_remove(struct pci_dev *pdev)
 	pci_free_irq_vectors(pdev);
 }
 
-/* work with hotplug and coldplug */
-MODULE_ALIAS("i2c_designware-pci");
-
 static const struct pci_device_id i2_designware_pci_ids[] = {
 	/* Medfield */
 	{ PCI_VDEVICE(INTEL, 0x0817), medfield },
@@ -418,9 +415,11 @@ static struct pci_driver dw_i2c_driver = {
 		.pm     = &i2c_dw_pm_ops,
 	},
 };
-
 module_pci_driver(dw_i2c_driver);
 
+/* Work with hotplug and coldplug */
+MODULE_ALIAS("i2c_designware-pci");
+
 MODULE_AUTHOR("Baruch Siach <baruch@tkos.co.il>");
 MODULE_DESCRIPTION("Synopsys DesignWare PCI I2C bus adapter");
 MODULE_LICENSE("GPL");
-- 
2.34.1

