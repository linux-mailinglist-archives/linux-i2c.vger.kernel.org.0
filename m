Return-Path: <linux-i2c+bounces-5537-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 949FE9573DE
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 20:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 50C29285209
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 18:46:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43456189B98;
	Mon, 19 Aug 2024 18:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bC/om4c4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81719189916;
	Mon, 19 Aug 2024 18:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724093167; cv=none; b=LQ0sWBxPNFLZqUT3gPoTfYutB+IjfaoX7aGnSOx05FyZwmDnG1/Vi2XAbCaY2khI0s353LlHv6qHHXwniAszBXiz3zlIFCxbwy2I254F0DjLvhKjOQVjz4HxbInYcLyb/V5nBu974siAH7eWUvZyKB3Kz6/bxm9G0lWppn00jfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724093167; c=relaxed/simple;
	bh=lmpJVHEI45bCw92NS0r5bbHGa1U4pmqHhD3BTF+AWZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OK4lRv11mOxK0jiOz4V7JYPd8upuwu3bT3gbwk8LHXkWDDi+Asrjf949uwJEeHAiW7W2ZlkdobV6+FYpf7b5RNmoAZu5f6A7mENy6ioYBq5Sax/XRViWgqDVZxsMNqKc1zXDKoswmHSpe8K/IV0Csc4SSTZ4mv19Qhptx9j4hEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bC/om4c4; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724093166; x=1755629166;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lmpJVHEI45bCw92NS0r5bbHGa1U4pmqHhD3BTF+AWZ0=;
  b=bC/om4c4SS5vdqDvQ01gsl7woW8+WlDdwN1Gjq/SBjxQhURHeIhVIsPq
   h8CHFzsJTOy4pA5SC1Uh3L1yKMn4FeETsvwUWND5kNbRaxMXGQIaElU1n
   rLYFj+82ZWE0emUQNm4rSgfYjMrkYYC2akliV1wWwBE7c1+SSK+vLCt8+
   HblHiHALOsILsbw2raJrE8rIDGG/VldoztSYyrnU9X7yOlGK6lowLRmjw
   BW0HQjSm1pl2qXuE44b5y9bzwv2wV/o63iGqlMDVrzvegv9uDuQ+5Z+Yq
   bWEVktllCr1q8LtlPGcOIq/iBgG7BgmiDJ9g17SM7cKU/tLw8kB68kTSk
   g==;
X-CSE-ConnectionGUID: ca3jwcA4TnK4jzHEXloLtw==
X-CSE-MsgGUID: ts+9HLZjRzSzaF9mZ48UzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22537636"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="22537636"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 11:46:05 -0700
X-CSE-ConnectionGUID: P943Wh3bRESwcQbF/Osa5Q==
X-CSE-MsgGUID: Sf2ivcdmSpuaMRMjVxSE5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="60433944"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 19 Aug 2024 11:46:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 293245CF; Mon, 19 Aug 2024 21:46:01 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Narasimhan.V@amd.com,
	Borislav Petkov <bp@alien8.de>,
	Kim Phillips <kim.phillips@amd.com>
Subject: [PATCH v3 2/7] i2c: designware: Let PCI core to take care about interrupt vectors
Date: Mon, 19 Aug 2024 21:45:08 +0300
Message-ID: <20240819184600.2256658-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240819184600.2256658-1-andriy.shevchenko@linux.intel.com>
References: <20240819184600.2256658-1-andriy.shevchenko@linux.intel.com>
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

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c | 14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index a1b379a1e904..507e114332cd 100644
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
2.43.0.rc1.1336.g36b5255a03ac


