Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9BEDC46C37B
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Dec 2021 20:22:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236438AbhLGTZg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Dec 2021 14:25:36 -0500
Received: from mga11.intel.com ([192.55.52.93]:47756 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233151AbhLGTZe (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Dec 2021 14:25:34 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="235180034"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; 
   d="scan'208";a="235180034"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2021 11:22:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; 
   d="scan'208";a="502727148"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 07 Dec 2021 11:22:01 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id B3712206; Tue,  7 Dec 2021 21:22:07 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v1 04/11] i2c: designware-pci: Convert to use dev_err_probe()
Date:   Tue,  7 Dec 2021 21:21:52 +0200
Message-Id: <20211207192159.41383-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211207192159.41383-1-andriy.shevchenko@linux.intel.com>
References: <20211207192159.41383-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It's fine to call dev_err_probe() in ->probe() when error code is known.
Convert the driver to use dev_err_probe().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index f91b352f448a..e6b4b1a468da 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -223,28 +223,20 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	struct dw_scl_sda_cfg *cfg;
 	struct dw_i2c_dev *i_dev;
 
-	if (id->driver_data >= ARRAY_SIZE(dw_pci_controllers)) {
-		dev_err(dev, "%s: invalid driver data %ld\n", __func__,
-			id->driver_data);
-		return -EINVAL;
-	}
+	if (id->driver_data >= ARRAY_SIZE(dw_pci_controllers))
+		return dev_err_probe(dev, -EINVAL, "invalid driver data %ld\n", id->driver_data);
 
 	controller = &dw_pci_controllers[id->driver_data];
 
 	r = pcim_enable_device(pdev);
-	if (r) {
-		dev_err(dev, "Failed to enable I2C PCI device (%d)\n",
-			r);
-		return r;
-	}
+	if (r)
+		return dev_err_probe(dev, r, "Failed to enable I2C PCI device\n");
 
 	pci_set_master(pdev);
 
 	r = pcim_iomap_regions(pdev, 1 << 0, pci_name(pdev));
-	if (r) {
-		dev_err(dev, "I/O memory remapping failed\n");
-		return r;
-	}
+	if (r)
+		return dev_err_probe(dev, r, "I/O memory remapping failed\n");
 
 	i_dev = devm_kzalloc(dev, sizeof(*i_dev), GFP_KERNEL);
 	if (!i_dev)
-- 
2.33.0

