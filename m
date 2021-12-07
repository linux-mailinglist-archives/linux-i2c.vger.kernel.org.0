Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2012046C388
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Dec 2021 20:22:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235447AbhLGTZx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Dec 2021 14:25:53 -0500
Received: from mga03.intel.com ([134.134.136.65]:16927 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233960AbhLGTZk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Dec 2021 14:25:40 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="237610082"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; 
   d="scan'208";a="237610082"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2021 11:22:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; 
   d="scan'208";a="542925266"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 07 Dec 2021 11:22:04 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id DD349315; Tue,  7 Dec 2021 21:22:07 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v1 07/11] i2c: designware-pci: Group MODULE_*() macros
Date:   Tue,  7 Dec 2021 21:21:55 +0200
Message-Id: <20211207192159.41383-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211207192159.41383-1-andriy.shevchenko@linux.intel.com>
References: <20211207192159.41383-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

For better maintenance group MODULE_*() macros together.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index a0ea71e71886..87bdf7acb612 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -323,9 +323,6 @@ static void i2c_dw_pci_remove(struct pci_dev *pdev)
 	pci_free_irq_vectors(pdev);
 }
 
-/* work with hotplug and coldplug */
-MODULE_ALIAS("i2c_designware-pci");
-
 static const struct pci_device_id i2_designware_pci_ids[] = {
 	/* Medfield */
 	{ PCI_VDEVICE(INTEL, 0x0817), medfield },
@@ -382,9 +379,11 @@ static struct pci_driver dw_i2c_driver = {
 		.pm     = &i2c_dw_pm_ops,
 	},
 };
-
 module_pci_driver(dw_i2c_driver);
 
+/* work with hotplug and coldplug */
+MODULE_ALIAS("i2c_designware-pci");
+
 MODULE_AUTHOR("Baruch Siach <baruch@tkos.co.il>");
 MODULE_DESCRIPTION("Synopsys DesignWare PCI I2C bus adapter");
 MODULE_LICENSE("GPL");
-- 
2.33.0

