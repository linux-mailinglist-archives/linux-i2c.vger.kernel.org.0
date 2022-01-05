Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3BFC48549B
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jan 2022 15:32:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232306AbiAEOcR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jan 2022 09:32:17 -0500
Received: from mga12.intel.com ([192.55.52.136]:39353 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230522AbiAEOcQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Jan 2022 09:32:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641393136; x=1672929136;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NavvXcBUgg/rXOENM/3QkXbd4C+Zd41d3Y/LV9zLAlk=;
  b=ad96fYFwWIlWLd3vgDoYYfMksqoAP5ph3x0JoRgxZKd3NpMwus6mOMS3
   y03uC6w6i0DP0707RqaspsLc4JfAKCtcqHQzZqdGS3NGw8+F+bi4sdCYT
   Xdci2ZGuN8fpBq24A/9gSA4tnoRRjO+MJhBxozFXhpJTNwVXXVZ0YXAnH
   BBhEnfVqc2iAHPSQDU+EFQAi/S+bSShFexMWz6YkrfgFoXFsfypTUOtrz
   Z8xsRrSmm4IrkZAfvwxz2QjBFpu0FHsYBWZS6PblyD0HFXAwa3qJve77V
   ZyaLEa/KBFkf/9fi4Ibdm5kTPJeYlnnEU/+szw1htrReozgaWfqPy1ECN
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="222447854"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; 
   d="scan'208";a="222447854"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2022 06:19:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; 
   d="scan'208";a="526549899"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga008.jf.intel.com with ESMTP; 05 Jan 2022 06:19:27 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id AC89925F; Wed,  5 Jan 2022 16:19:37 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Subject: [PATCH v3 4/5] i2c: nvidia-gpu: Convert to use dev_err_probe()
Date:   Wed,  5 Jan 2022 16:19:34 +0200
Message-Id: <20220105141935.24109-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220105141935.24109-1-andriy.shevchenko@linux.intel.com>
References: <20220105141935.24109-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

It's fine to call dev_err_probe() in ->probe() when error code is known.
Convert the driver to use dev_err_probe().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v3: no changes
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

