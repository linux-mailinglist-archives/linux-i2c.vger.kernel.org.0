Return-Path: <linux-i2c+bounces-33-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 144367E81C0
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 19:33:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 692C42810BC
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 18:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DA8B1DDFA;
	Fri, 10 Nov 2023 18:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NyL7DKfx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1E0D26F
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 18:33:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56EEF62CE0;
	Fri, 10 Nov 2023 10:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699641085; x=1731177085;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=aDNeBaFxH9YLIpux4SIUUOepmpuzRLX2X1AJDeylr5c=;
  b=NyL7DKfxpVYcDQTT+9V4WxVvaZ/mCDaMCQCGc/jJi9EE1FOssavUSpob
   vny9UoEvAkf38cvjVOFQc8QaUGOdJ5MIDj3aXVA8faRM/GusH7/dPaVAz
   Y7ZSrABR+M29SiHkc8K5f6MRI8XhZKgu54bJz8oKUsqZVuLbt8lWEFEtT
   VaRkBcG3zMgcYo7srtRHa1rhUGMkH8NSZj/4it/NuAFnIogk1q57sS89T
   VI46IJ4iiTEOlgCIkuW6d5tVwzVKRs/1iPemGaRb4L/ginsRSCXcaYjSQ
   N2A7mG2qKCVh68xZkV6kYjfqtYeeTZg0FDXYpMCzj2bATmVMLPY93xJD6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="456715078"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="456715078"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 10:29:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="763808263"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="763808263"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 10 Nov 2023 10:29:40 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id F2288888; Fri, 10 Nov 2023 20:23:07 +0200 (EET)
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
Subject: [PATCH v3 14/25] i2c: designware: Rename dw_i2c_of_configure() -> i2c_dw_of_configure()
Date: Fri, 10 Nov 2023 20:11:34 +0200
Message-ID: <20231110182304.3894319-15-andriy.shevchenko@linux.intel.com>
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

For the sake of consistency, rename dw_i2c_of_configure() and change
its parameter to be aligned with the i2c_dw_acpi_configure().

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 7449f1b37ecf..b8606b651feb 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -110,9 +110,10 @@ static int mscc_twi_set_sda_hold_time(struct dw_i2c_dev *dev)
 	return 0;
 }
 
-static void dw_i2c_of_configure(struct platform_device *pdev)
+static void i2c_dw_of_configure(struct device *device)
 {
-	struct dw_i2c_dev *dev = platform_get_drvdata(pdev);
+	struct platform_device *pdev = to_platform_device(device);
+	struct dw_i2c_dev *dev = dev_get_drvdata(device);
 
 	switch (dev->flags & MODEL_MASK) {
 	case MODEL_MSCC_OCELOT:
@@ -130,7 +131,7 @@ static int bt1_i2c_request_regs(struct dw_i2c_dev *dev)
 	return -ENODEV;
 }
 
-static inline void dw_i2c_of_configure(struct platform_device *pdev)
+static inline void i2c_dw_of_configure(struct device *device)
 {
 }
 #endif
@@ -306,7 +307,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	i2c_dw_adjust_bus_speed(dev);
 
 	if (pdev->dev.of_node)
-		dw_i2c_of_configure(pdev);
+		i2c_dw_of_configure(&pdev->dev);
 
 	if (has_acpi_companion(&pdev->dev))
 		i2c_dw_acpi_configure(&pdev->dev);
-- 
2.43.0.rc1.1.gbec44491f096


