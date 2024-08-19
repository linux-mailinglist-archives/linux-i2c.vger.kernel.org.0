Return-Path: <linux-i2c+bounces-5482-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A59C9565BB
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 10:40:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46D421C21878
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 08:40:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0903D15B542;
	Mon, 19 Aug 2024 08:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XwDJJ5W5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F82C125;
	Mon, 19 Aug 2024 08:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724056815; cv=none; b=AqftT4nP68xthOFppCzPX+05Iu4pVvgKNozbPHCKXdNRzb7pF9bS6yRdg2cVOLFrVB+UQpIqJl1sju6dGXKHkJmBB6eehzfzI1OnEiffq5zmb0CThFA7pAkY3IXqWOjYq1z9sRpo0uSHLUgcsERs/oiA2DX9h47w4IFm6qR+BmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724056815; c=relaxed/simple;
	bh=lmpJVHEI45bCw92NS0r5bbHGa1U4pmqHhD3BTF+AWZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YlIbRHPMzUz2ny8GxzXIW/fbwA2lzV/ll2w6bHR/+w1LsWppBm1k+BN+0YuAEKkh1wPbyOeNQsdshwiNkQ058WFt808xYjLC7GeLltj4K4M3EqJrAQU77nIFWkFfKt41yChVXTNeNCNgt9lLEUmwMRrNXl8hTo7c4GbdjNQ2Hrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XwDJJ5W5; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724056813; x=1755592813;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lmpJVHEI45bCw92NS0r5bbHGa1U4pmqHhD3BTF+AWZ0=;
  b=XwDJJ5W518M+3YUvHGbya41FcqNFs6/rl2lsqXFhAOWZCE35i6ejtrfY
   Tdrkdw5MfsE29KmFWXaKDT44IoJ5cYCEE/cA5I4+oXKy+xrY4zvOPPAIE
   BTtZ1SMa2v8dnXY1NV3EvDsa0HaQN8nuJqCdcwUyvLh//cBPZu562dYn9
   qRMDWLq/pIM+wrqMn9+KolEnlqfIZC4L5QrtFO5xm5O7XexdTB44dfdFV
   7mWZljggZlkcI13TGlXVgl/yl7dSXtbBOiEjx3ZLavYZto6dLfbTPvhoY
   qwEYZMUVsag7zVIxOs8nKmhZzxy4NYDiNuMq1mFNWZM0xpKZ4ANo4MWuc
   Q==;
X-CSE-ConnectionGUID: rDoYuPY7TFelV3dNC9cxmw==
X-CSE-MsgGUID: tDvQOzFdRtGLV06fPJnhkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="21834847"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="21834847"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 01:40:12 -0700
X-CSE-ConnectionGUID: MbfR/L+BQsm6oYvwqZxPcg==
X-CSE-MsgGUID: gme/tkdZSvin6cemuCv+Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="91080185"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 19 Aug 2024 01:40:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E143F2D8; Mon, 19 Aug 2024 11:40:08 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Narasimhan.V@amd.com,
	Borislav Petkov <bp@alien8.de>,
	Kim Phillips <kim.phillips@amd.com>
Subject: [PATCH v2 2/7] i2c: designware: Let PCI core to take care about interrupt vectors
Date: Mon, 19 Aug 2024 11:39:06 +0300
Message-ID: <20240819084007.3700433-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240819084007.3700433-1-andriy.shevchenko@linux.intel.com>
References: <20240819084007.3700433-1-andriy.shevchenko@linux.intel.com>
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


