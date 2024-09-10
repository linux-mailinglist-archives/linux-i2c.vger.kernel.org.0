Return-Path: <linux-i2c+bounces-6511-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8518F973D54
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 18:34:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B59EE1C25028
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Sep 2024 16:34:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B2141A7046;
	Tue, 10 Sep 2024 16:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OxaNs/eH"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE961A4F04;
	Tue, 10 Sep 2024 16:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725985897; cv=none; b=ZEord3TeUgHNpyL7wnbEt9jwg2iXOx5tek+eihZI8BfeoBMN1XVdh38+ePPwhxRFYT6wvzjMFQUYCOf0/KWtN185+VyQ75jCQBadcq/HMn+ZZzQHPljls8MJchzcU2QH7TZiVltSF7ROnm8hB7r3QPoaHJGekptscNfaHzWcmmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725985897; c=relaxed/simple;
	bh=O6Oa9RZ5Z+GEXT/UX2CpvepIr8IkWdpkYKLgBUjmFRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YqHPEQ9Gy/8+VDx3TMnHfjRz+aKL1mecBkZ0xwf6MItZNuEvGoe2B5D0xuifJp4dTNZ69rgdsqcOpNfNL/gqaVdkOjiN01rVS20lS7i/iAAJ1YHD/suBHSicNJ9/9Dr28OoM8GNYMXAzTQAWNnNJXb4yZ+MeJNBZE6o0uC8mYv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OxaNs/eH; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725985896; x=1757521896;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=O6Oa9RZ5Z+GEXT/UX2CpvepIr8IkWdpkYKLgBUjmFRU=;
  b=OxaNs/eH5FN9o5EACPhSXVxhA4wnR1JFWd7L4FIG5sAuR/ER6LHDcCZ8
   V3h1+zcCtNiKPP7sqZdpfhjdcol2xwkKaPLT4jrEm92gzLpB8x7UBwhH5
   3a26cVhQbTnCibS8qtnT52wXgnfIK9XLJGbZIbXUoZl00QUBjGTX8zXad
   EaH0nUKM/ciyyQqdVxtl/zL2wuthAIlrdOSWb4jmtzcs5/vB1StfTLiaG
   G+8166DLI+0bVZJTBsGBIhkwI7SpDOpiBaXraf/GG0H0Ojj+vDzbrAuxf
   A/lib1w4IbpxWhv/HU1VkTI/GM4hl0oToQJTO0JzgIjNicsjerQXW8/t7
   A==;
X-CSE-ConnectionGUID: Hrxnak/ARFOqbNB05E7Igw==
X-CSE-MsgGUID: +DrZ+nAkRka1U1nW1ROE9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="35341743"
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="35341743"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 09:31:33 -0700
X-CSE-ConnectionGUID: TfksfhfLSxSk8rhl0SD/qQ==
X-CSE-MsgGUID: 7PYPVcZqREG5NgfOLxmjXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,217,1719903600"; 
   d="scan'208";a="71681500"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa004.fm.intel.com with ESMTP; 10 Sep 2024 09:31:26 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0AA5C44A; Tue, 10 Sep 2024 19:31:25 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>
Subject: [PATCH v1 3/3] i2c: designware: Use pci_get_drvdata()
Date: Tue, 10 Sep 2024 19:28:46 +0300
Message-ID: <20240910163123.2499931-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240910163123.2499931-1-andriy.shevchenko@linux.intel.com>
References: <20240910163123.2499931-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the wrapper function for getting the driver data using pci_dev
instead of using dev_get_drvdata() with &pdev->dev, so we can directly
pass a struct pci_dev. This is a purely cosmetic change.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 64f7bd8c7faf..7b2c5d71a7fc 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -102,7 +102,7 @@ static u32 mfld_get_clk_rate_khz(struct dw_i2c_dev *dev)
 
 static int mfld_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
 {
-	struct dw_i2c_dev *dev = dev_get_drvdata(&pdev->dev);
+	struct dw_i2c_dev *dev = pci_get_drvdata(pdev);
 
 	switch (pdev->device) {
 	case 0x0817:
@@ -152,7 +152,7 @@ static u32 navi_amd_get_clk_rate_khz(struct dw_i2c_dev *dev)
 
 static int navi_amd_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
 {
-	struct dw_i2c_dev *dev = dev_get_drvdata(&pdev->dev);
+	struct dw_i2c_dev *dev = pci_get_drvdata(pdev);
 
 	dev->flags |= MODEL_AMD_NAVI_GPU | ACCESS_POLLING;
 	dev->timings.bus_freq_hz = I2C_MAX_STANDARD_MODE_FREQ;
-- 
2.43.0.rc1.1336.g36b5255a03ac


