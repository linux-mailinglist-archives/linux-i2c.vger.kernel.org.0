Return-Path: <linux-i2c+bounces-31-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEE27E81BA
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 19:33:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 141B528121B
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 18:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D4701DDFA;
	Fri, 10 Nov 2023 18:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aCJIZkso"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E1E3219E
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 18:33:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C7B87693;
	Fri, 10 Nov 2023 10:32:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699641144; x=1731177144;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bEJAV9zxfyI2elm8JN4vfIfB/68Bb0SGglHF3L4Fy+Y=;
  b=aCJIZksonkYiMiWdefRMRkeGVig9iU8p98Cg3KYv0yyKgye3yzTvrtev
   XmpwRrWS/tUVDtFMlHgrE6gR4uCvXssgrHsDFdcAK6whAOoUsXjQjIwjG
   wSRwhjQxF98frtUFcjr0olnoxuJ7G84SXd4+a7ZKm+lM9N1CI+pr7a1rf
   pagsbr+MrseWLs1OQLPsia4LXdRuYZDXsYtmtXIT/JpWje4029VEw4iVX
   0R/DBp76W/MkyZ268q7hyIoZl0O5t37Mvpg7/A+z1oS+219pfbWY2dOmC
   JT+Jx5SMPzbsXmIErOl8cLtg/SOBOM1ZBR5oUduAiK+nQerhive0LQlE9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="456715067"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="456715067"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 10:29:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="763808264"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="763808264"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 10 Nov 2023 10:29:40 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 571888E8; Fri, 10 Nov 2023 20:23:08 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v3 22/25] i2c: designware: Use pci_get_drvdata()
Date: Fri, 10 Nov 2023 20:11:42 +0200
Message-ID: <20231110182304.3894319-23-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1.gbec44491f096
In-Reply-To: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
References: <20231110182304.3894319-1-andriy.shevchenko@linux.intel.com>
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

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-pcidrv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index f9fbd41c188d..826c0c0a7c8d 100644
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


