Return-Path: <linux-i2c+bounces-5462-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E84954FBB
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 19:13:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3033B1F230C6
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 17:13:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E2B1C378F;
	Fri, 16 Aug 2024 17:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LXQvKFq8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF181C0DF7;
	Fri, 16 Aug 2024 17:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723828361; cv=none; b=t8Bv0gOFqXAOCJswd8EdvtPodNMSvetd52NztwzSuMdq8I/btV1RlTbIK0Kq+jNqNNuJsU3lw2sJqPL6ekMzjfUf6GceSdDGLglwo2PhjuSlBdhB9QnXMNvZ1yQYmPXfoqGYmtpTYJHbjXuqoqZbtQ/sudfeQDugngSzGgeUx1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723828361; c=relaxed/simple;
	bh=lmpJVHEI45bCw92NS0r5bbHGa1U4pmqHhD3BTF+AWZ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PD++uvVYWEiKXSjzgk7xXTqXH0WHibB6iME5hx3j0qnioUZ8J0Yr/koahCNd0uNf7i+Aua26y8roFMOYFh4s39MOMKJ9/UmDirSdDvm3DJv7K1XEKYLeytltLqHCCg4BQLlawXs+56xrjRrMEtKr8CXCd0FwbmYfHZPjb+Rm9pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LXQvKFq8; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723828359; x=1755364359;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lmpJVHEI45bCw92NS0r5bbHGa1U4pmqHhD3BTF+AWZ0=;
  b=LXQvKFq8xupnUm8OEIrS8O4Tw4yUiGe4AzZ442UvTwUAVPyqkZX4egId
   u2q401ntSBZvlBcZdXreMoPae5frPXkJ82d1NaSvHiruLInNC1CXAo1Rm
   fVGTeSQsjQKj6kpVzbtfg8mBgI5Y1SJmFv8q8qYLuCLevMZsYb1Pb8bfo
   CA8oBtsHuqJhfJtESQ7GS+5w3k41LiZO0EhK+xUZMcfoPst1z0W7LAqCU
   yTGC8frACnMZLbdKagVAdbnZCjSLEegAq1gQTEjpPAKBB84/1wT5yPE2Z
   6VpUoLCskZxltJvrdvYfvj/r/JjkH71Bd92rna5/0px8hJju6a6iHdtv+
   g==;
X-CSE-ConnectionGUID: Pi0eVmn6SbCacl4Nx30kYg==
X-CSE-MsgGUID: g4vfI6DJTP+1MOYt+ue/GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="25888865"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="25888865"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 10:12:36 -0700
X-CSE-ConnectionGUID: 58mmwS9DQvKzv7KbHxNpJw==
X-CSE-MsgGUID: TSsNBn1QTX2VOgKHlLWGXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="59360354"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 16 Aug 2024 10:12:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7DF7826D; Fri, 16 Aug 2024 20:12:32 +0300 (EEST)
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
Subject: [PATCH v1 2/7] i2c: designware: Let PCI core to take care about interrupt vectors
Date: Fri, 16 Aug 2024 20:02:00 +0300
Message-ID: <20240816171225.3506844-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240816171225.3506844-1-andriy.shevchenko@linux.intel.com>
References: <20240816171225.3506844-1-andriy.shevchenko@linux.intel.com>
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


