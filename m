Return-Path: <linux-i2c+bounces-670-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 68260808A2F
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 15:17:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 981351C2099B
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 14:17:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09CAE41A86;
	Thu,  7 Dec 2023 14:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nLe+nS9w"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15B3A10FF;
	Thu,  7 Dec 2023 06:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701958646; x=1733494646;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LDVJgGPC1/UfdET2Sar0sat4JWJvb4Gf9G/ZusZGYKI=;
  b=nLe+nS9weoI5zMJ08zTVnKvCWb7FKJHHtUkwdQ3TwPTWWAl+wQHrLNcb
   x07cMO6u+nG3FtQe65PKCMG6wqvb3P4oc9rikVPOp1mfEUTD5qIZ3IUKt
   3dflv5PoTDyoVfFcZzd7fFjkxd96oqylHxYykReIkVVtjUTA78YgKyD4o
   AfGyur9qLRC/tJVSbz7ERoHgVsf8deIMBjZymlPnsRDMV9/Uyuhu0mUf2
   V3HpkOFskfXeMwrOjcHvc+iae+/eLPMGddB84BCrtVULEKNzm5mUJadCS
   yWgKyb2aLjxaQkGnAGJgdt8eO8W3HI/Oiwnj2Bi0KR91narvbVlfedDYF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="460726221"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="460726221"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 06:17:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="889756108"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="889756108"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 07 Dec 2023 06:17:12 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 721CBCCE; Thu,  7 Dec 2023 16:17:03 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Serge Semin <fancer.lancer@gmail.com>
Subject: [PATCH v5 21/24] i2c: designware: Use pci_get_drvdata()
Date: Thu,  7 Dec 2023 16:14:01 +0200
Message-ID: <20231207141653.2785124-22-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231207141653.2785124-1-andriy.shevchenko@linux.intel.com>
References: <20231207141653.2785124-1-andriy.shevchenko@linux.intel.com>
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
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Link: https://lore.kernel.org/r/20231120144641.1660574-22-andriy.shevchenko@linux.intel.com
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 2c7bc7dc8e44..211d8279b05e 100644
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
 
 	dev->flags |= MODEL_AMD_NAVI_GPU;
 	dev->timings.bus_freq_hz = I2C_MAX_STANDARD_MODE_FREQ;
-- 
2.43.0.rc1.1.gbec44491f096


