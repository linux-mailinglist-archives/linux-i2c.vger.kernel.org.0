Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B28AC46C37F
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Dec 2021 20:22:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240936AbhLGTZj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Dec 2021 14:25:39 -0500
Received: from mga02.intel.com ([134.134.136.20]:22343 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240933AbhLGTZh (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 7 Dec 2021 14:25:37 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10190"; a="224923751"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; 
   d="scan'208";a="224923751"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2021 11:22:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; 
   d="scan'208";a="462437374"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 07 Dec 2021 11:22:04 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 15950400; Tue,  7 Dec 2021 21:22:08 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>
Subject: [PATCH v1 11/11] i2c: nvidia-gpu: Convert to use dev_err_probe()
Date:   Tue,  7 Dec 2021 21:21:59 +0200
Message-Id: <20211207192159.41383-11-andriy.shevchenko@linux.intel.com>
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
 drivers/i2c/busses/i2c-nvidia-gpu.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index a82be377146e..6920c1b9a126 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -282,24 +282,18 @@ static int gpu_i2c_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	dev_set_drvdata(dev, i2cd);
 
 	status = pcim_enable_device(pdev);
-	if (status < 0) {
-		dev_err(dev, "pcim_enable_device failed %d\n", status);
-		return status;
-	}
+	if (status < 0)
+		return dev_err_probe(dev, status, "pcim_enable_device failed\n");
 
 	pci_set_master(pdev);
 
 	i2cd->regs = pcim_iomap(pdev, 0, 0);
-	if (!i2cd->regs) {
-		dev_err(dev, "pcim_iomap failed\n");
-		return -ENOMEM;
-	}
+	if (!i2cd->regs)
+		return dev_err_probe(dev, -ENOMEM, "pcim_iomap failed\n");
 
 	status = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI);
-	if (status < 0) {
-		dev_err(dev, "pci_alloc_irq_vectors err %d\n", status);
-		return status;
-	}
+	if (status < 0)
+		return dev_err_probe(dev, status, "pci_alloc_irq_vectors err\n");
 
 	gpu_enable_i2c_bus(i2cd);
 
-- 
2.33.0

