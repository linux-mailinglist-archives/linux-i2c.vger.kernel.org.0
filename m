Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1F1E485488
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Jan 2022 15:30:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237395AbiAEOaC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 5 Jan 2022 09:30:02 -0500
Received: from mga03.intel.com ([134.134.136.65]:8170 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237396AbiAEOaC (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 5 Jan 2022 09:30:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641393002; x=1672929002;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YmePdDgmO0Eoy2IW88Uf080eKTZC0JE16aUfaqS9Kfs=;
  b=gEvf1+tIAmv8NmnhwBjR0s72HaWSUGElN8lThx0TUmkiyQT82Nd9FctU
   7v4kdQv4ClxMjHZ1KvwiQWNTjf3wWFHzSbW582p4VIYB+Ll6yYgBmfDwf
   021QnUjofPWeCZdtujcX3TjXPQiWtp+B0bh2aq0ZV9zBhtIJO8eUPx5DK
   GPewOetzGqjKgbNxyvP6NZqSdWy2Lorr6sOw8PEFJ+ZKoBC3ipNmZO0vi
   bPAVUzbAIMKZGwnqFwFtAByMq+cmHH2v4D6OoDSeHu+YXS0U8S372pEYt
   PXjehAZFUN7soZUt8pRV46NQxJFy/ayvPD7nfkhWPpEPFXlCNZXO6HsiH
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="242410386"
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; 
   d="scan'208";a="242410386"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2022 06:19:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,264,1635231600"; 
   d="scan'208";a="472509062"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 05 Jan 2022 06:19:27 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id A3A2821A; Wed,  5 Jan 2022 16:19:37 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Wolfram Sang <wsa@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>
Subject: [PATCH v3 3/5] i2c: nvidia-gpu: Use temporary variable for struct device
Date:   Wed,  5 Jan 2022 16:19:33 +0200
Message-Id: <20220105141935.24109-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220105141935.24109-1-andriy.shevchenko@linux.intel.com>
References: <20220105141935.24109-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Use temporary variable for struct device to make code neater.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
v3: no changes
 drivers/i2c/busses/i2c-nvidia-gpu.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 8117c3674209..a82be377146e 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -270,19 +270,20 @@ static const struct software_node ccgx_node = {
 
 static int gpu_i2c_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 {
+	struct device *dev = &pdev->dev;
 	struct gpu_i2c_dev *i2cd;
 	int status;
 
-	i2cd = devm_kzalloc(&pdev->dev, sizeof(*i2cd), GFP_KERNEL);
+	i2cd = devm_kzalloc(dev, sizeof(*i2cd), GFP_KERNEL);
 	if (!i2cd)
 		return -ENOMEM;
 
-	i2cd->dev = &pdev->dev;
-	dev_set_drvdata(&pdev->dev, i2cd);
+	i2cd->dev = dev;
+	dev_set_drvdata(dev, i2cd);
 
 	status = pcim_enable_device(pdev);
 	if (status < 0) {
-		dev_err(&pdev->dev, "pcim_enable_device failed %d\n", status);
+		dev_err(dev, "pcim_enable_device failed %d\n", status);
 		return status;
 	}
 
@@ -290,13 +291,13 @@ static int gpu_i2c_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	i2cd->regs = pcim_iomap(pdev, 0, 0);
 	if (!i2cd->regs) {
-		dev_err(&pdev->dev, "pcim_iomap failed\n");
+		dev_err(dev, "pcim_iomap failed\n");
 		return -ENOMEM;
 	}
 
 	status = pci_alloc_irq_vectors(pdev, 1, 1, PCI_IRQ_MSI);
 	if (status < 0) {
-		dev_err(&pdev->dev, "pci_alloc_irq_vectors err %d\n", status);
+		dev_err(dev, "pci_alloc_irq_vectors err %d\n", status);
 		return status;
 	}
 
@@ -308,22 +309,21 @@ static int gpu_i2c_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		sizeof(i2cd->adapter.name));
 	i2cd->adapter.algo = &gpu_i2c_algorithm;
 	i2cd->adapter.quirks = &gpu_i2c_quirks;
-	i2cd->adapter.dev.parent = &pdev->dev;
+	i2cd->adapter.dev.parent = dev;
 	status = i2c_add_adapter(&i2cd->adapter);
 	if (status < 0)
 		goto free_irq_vectors;
 
 	i2cd->ccgx_client = i2c_new_ccgx_ucsi(&i2cd->adapter, pdev->irq, &ccgx_node);
 	if (IS_ERR(i2cd->ccgx_client)) {
-		status = dev_err_probe(&pdev->dev, PTR_ERR(i2cd->ccgx_client),
-				       "register UCSI failed\n");
+		status = dev_err_probe(dev, PTR_ERR(i2cd->ccgx_client), "register UCSI failed\n");
 		goto del_adapter;
 	}
 
-	pm_runtime_set_autosuspend_delay(&pdev->dev, 3000);
-	pm_runtime_use_autosuspend(&pdev->dev);
-	pm_runtime_put_autosuspend(&pdev->dev);
-	pm_runtime_allow(&pdev->dev);
+	pm_runtime_set_autosuspend_delay(dev, 3000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_put_autosuspend(dev);
+	pm_runtime_allow(dev);
 
 	return 0;
 
@@ -336,7 +336,7 @@ static int gpu_i2c_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 static void gpu_i2c_remove(struct pci_dev *pdev)
 {
-	struct gpu_i2c_dev *i2cd = dev_get_drvdata(&pdev->dev);
+	struct gpu_i2c_dev *i2cd = pci_get_drvdata(pdev);
 
 	pm_runtime_get_noresume(i2cd->dev);
 	i2c_del_adapter(&i2cd->adapter);
-- 
2.34.1

