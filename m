Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F327047336E
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Dec 2021 19:00:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241582AbhLMSAg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Dec 2021 13:00:36 -0500
Received: from mga07.intel.com ([134.134.136.100]:22693 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236059AbhLMSAb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 13 Dec 2021 13:00:31 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="302170318"
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="302170318"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2021 10:00:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,203,1635231600"; 
   d="scan'208";a="613915793"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 13 Dec 2021 10:00:29 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id ED27D136; Mon, 13 Dec 2021 20:00:35 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: [PATCH v2 2/6] i2c: designware-pci: Convert to use dev_err_probe()
Date:   Mon, 13 Dec 2021 20:00:30 +0200
Message-Id: <20211213180034.30929-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211213180034.30929-1-andriy.shevchenko@linux.intel.com>
References: <20211213180034.30929-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It's fine to call dev_err_probe() in ->probe() when error code is known.
Convert the driver to use dev_err_probe().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: no changes
 drivers/i2c/busses/i2c-designware-pcidrv.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 5f76010f7dfd..85860902c496 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -242,26 +242,20 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	struct dw_pci_controller *controller;
 	struct dw_scl_sda_cfg *cfg;
 
-	if (id->driver_data >= ARRAY_SIZE(dw_pci_controllers)) {
-		dev_err(d, "%s: invalid driver data %ld\n", __func__, id->driver_data);
-		return -EINVAL;
-	}
+	if (id->driver_data >= ARRAY_SIZE(dw_pci_controllers))
+		return dev_err_probe(d, -EINVAL, "invalid driver data %ld\n", id->driver_data);
 
 	controller = &dw_pci_controllers[id->driver_data];
 
 	r = pcim_enable_device(pdev);
-	if (r) {
-		dev_err(d, "Failed to enable I2C PCI device (%d)\n", r);
-		return r;
-	}
+	if (r)
+		return dev_err_probe(d, r, "Failed to enable I2C PCI device\n");
 
 	pci_set_master(pdev);
 
 	r = pcim_iomap_regions(pdev, 1 << 0, pci_name(pdev));
-	if (r) {
-		dev_err(d, "I/O memory remapping failed\n");
-		return r;
-	}
+	if (r)
+		return dev_err_probe(d, r, "I/O memory remapping failed\n");
 
 	dev = devm_kzalloc(d, sizeof(*dev), GFP_KERNEL);
 	if (!dev)
-- 
2.33.0

