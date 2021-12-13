Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F09E2473378
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Dec 2021 19:00:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241620AbhLMSAt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Dec 2021 13:00:49 -0500
Received: from mga01.intel.com ([192.55.52.88]:57909 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241613AbhLMSAk (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 13 Dec 2021 13:00:40 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="262918298"
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="262918298"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 10:00:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="566773369"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 13 Dec 2021 10:00:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2119A302; Mon, 13 Dec 2021 20:00:36 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 5/6] i2c: designware-pci: Group MODULE_*() macros
Date:   Mon, 13 Dec 2021 20:00:33 +0200
Message-Id: <20211213180034.30929-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211213180034.30929-1-andriy.shevchenko@linux.intel.com>
References: <20211213180034.30929-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

For better maintenance group MODULE_*() macros together.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
v2: added tag (Jarkko)

 drivers/i2c/busses/i2c-designware-pcidrv.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 499970d70755..bc19d7f59d31 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -344,9 +344,6 @@ static void i2c_dw_pci_remove(struct pci_dev *pdev)
 	pci_free_irq_vectors(pdev);
 }
 
-/* work with hotplug and coldplug */
-MODULE_ALIAS("i2c_designware-pci");
-
 static const struct pci_device_id i2_designware_pci_ids[] = {
 	/* Medfield */
 	{ PCI_VDEVICE(INTEL, 0x0817), medfield },
@@ -403,9 +400,11 @@ static struct pci_driver dw_i2c_driver = {
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
2.33.0

