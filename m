Return-Path: <linux-i2c+bounces-311-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 955EC7F1600
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 15:47:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F31B9B21893
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 14:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CB4F18E37;
	Mon, 20 Nov 2023 14:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApKoZJWm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0382A4;
	Mon, 20 Nov 2023 06:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700491610; x=1732027610;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gttshKJrMZpIh+yFG4GEE2CGljM8HFTYcNc2C9Ugs5s=;
  b=ApKoZJWmMNrMBI00iNjbG2VAlwimxaq3A1PqBjfEhZ1vzOxeIoa81IoW
   bi+d1sfqyapaegdcSAXXWUFlueBV/ATERjMYlSoO9bD0YfYfqZIO6jGv1
   xghScxH0BeJBWYl27fuRNQjQnuJbhpxrbI9d7ucAb/uCPwfgvV5h0dQcs
   q3J4DxR1V8n/QJDI4Lp5Vvx0fmkt+TjtK0rBFDIgjlAocDG04elqjIAGq
   6pHiMJ6aa6S+EJAycoyVRG7U4Qp7nhBt6FPrLN65xZI3+pfUX16R3bi7Q
   Nuz/3lc6XG8Hl5EZ+ytpQOj49y1TNDGRCAEkCqetGI7nsDLolZrdf3wtO
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="455956441"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="455956441"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 06:46:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="801193127"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="801193127"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 20 Nov 2023 06:46:45 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 47A3812A; Mon, 20 Nov 2023 16:46:44 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH v4 03/24] i2c: designware: Let PCI core to take care about interrupt vectors
Date: Mon, 20 Nov 2023 16:41:45 +0200
Message-ID: <20231120144641.1660574-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
References: <20231120144641.1660574-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PCI core, after pcim_enable_device(), takes care about the allocated
IRQ vectors, no need to do it explicitly and break the cleaning up
order.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 61d7a27aa070..e67956845c19 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -295,10 +295,8 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 
 	if (controller->setup) {
 		r = controller->setup(pdev, controller);
-		if (r) {
-			pci_free_irq_vectors(pdev);
+		if (r)
 			return r;
-		}
 	}
 
 	i2c_dw_adjust_bus_speed(dev);
@@ -307,10 +305,8 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 		i2c_dw_acpi_configure(&pdev->dev);
 
 	r = i2c_dw_validate_speed(dev);
-	if (r) {
-		pci_free_irq_vectors(pdev);
+	if (r)
 		return r;
-	}
 
 	i2c_dw_configure(dev);
 
@@ -330,10 +326,8 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 	adap->nr = controller->bus_num;
 
 	r = i2c_dw_probe(dev);
-	if (r) {
-		pci_free_irq_vectors(pdev);
+	if (r)
 		return r;
-	}
 
 	if ((dev->flags & MODEL_MASK) == MODEL_AMD_NAVI_GPU) {
 		dev->slave = i2c_new_ccgx_ucsi(&dev->adapter, dev->irq, &dgpu_node);
@@ -359,8 +353,6 @@ static void i2c_dw_pci_remove(struct pci_dev *pdev)
 	pm_runtime_get_noresume(&pdev->dev);
 
 	i2c_del_adapter(&dev->adapter);
-	devm_free_irq(&pdev->dev, dev->irq, dev);
-	pci_free_irq_vectors(pdev);
 }
 
 static const struct pci_device_id i2_designware_pci_ids[] = {
-- 
2.43.0.rc1.1.gbec44491f096


