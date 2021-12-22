Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3BBE47D50C
	for <lists+linux-i2c@lfdr.de>; Wed, 22 Dec 2021 17:20:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241748AbhLVQUk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 Dec 2021 11:20:40 -0500
Received: from mga03.intel.com ([134.134.136.65]:22267 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241680AbhLVQUi (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 Dec 2021 11:20:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640190038; x=1671726038;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7vlQmD8voMWV9y3FJTHhhKespHFHpV949rDzKkpjGiE=;
  b=HF10s7sTZXJPPXjvKBb+7ziJiKo9hwauncNMhvsuo/otOBPpsbwBeF+E
   mHMYPPh/KRwwli4PGV9TnW/pFQDVj8RveynnJQ/Zv0xhfKg/h9P/HAl3m
   HJne+4+dersZxv0M7AmT71ljU/m85BLDmcq06orLSiJGBfcmtTtHwajl7
   YdZcCtY66dFZS0EicHswK9KVLuTDIUWrynlquTzRT5Ro8YKuo+zG1eFMl
   59z6PGaodFHjxaOg/gIB10ksjwU1JxQUScrUGViUXGAbZDQJTuvomU7Mr
   GEGR5GIDg6aKyLUCREMgXDfjA/HeiTf+WH7xI6vmUXxJQeYRrupO5HJ+q
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10206"; a="240606646"
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; 
   d="scan'208";a="240606646"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2021 08:20:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,227,1635231600"; 
   d="scan'208";a="685071336"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 22 Dec 2021 08:20:35 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2E0F81F4; Wed, 22 Dec 2021 18:20:44 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Subject: [PATCH v2 4/5] i2c: nvidia-gpu: Convert to use dev_err_probe()
Date:   Wed, 22 Dec 2021 18:20:40 +0200
Message-Id: <20211222162041.64625-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211222162041.64625-1-andriy.shevchenko@linux.intel.com>
References: <20211222162041.64625-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It's fine to call dev_err_probe() in ->probe() when error code is known.
Convert the driver to use dev_err_probe().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v2: rebased on top of current i2c/for-next

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
2.34.1

