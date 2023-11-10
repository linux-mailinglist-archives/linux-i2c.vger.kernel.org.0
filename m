Return-Path: <linux-i2c+bounces-28-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B97707E81AB
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 19:32:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9F401C20ADD
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 18:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383373AC0C;
	Fri, 10 Nov 2023 18:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IaVcnqaD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3223AC14
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 18:32:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DA4A69B50;
	Fri, 10 Nov 2023 10:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699641092; x=1731177092;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZW/QTtMTJOHD7YAVCGqQfN6rvkOgtMt7/eliDRM3ikM=;
  b=IaVcnqaDyvMWpJMZsSyV/bKNaq5pOv7gMvDAC0VjrZzStHwLWnab/BXq
   urx+PvGzo2PCIHS6YDjyZ35GMAyPzI99V9oqNxeslnpl+Xat0EN9RaDvx
   dBAU7MPZ+YlqwuCv1md3OGnQ4Tp7g2ynkcRV5zZAo0DX2wSy2dOQaZCeM
   KgJZF4nLLfR7SltDaJ5U6SFqmA8H06BOyZDa21wZAvkBJNTNztEtFsWcf
   1IYs102G8dTSuSqViOUH+xRsFcTzNt2sBcbUw/cwOWvpnR+MewvTDj8Ix
   ++EFw1uIjUjPFXpzqq9k1bxi2GmeXr7NjznIJ3uDqOYgGuQBVX1uY+uYy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="456715060"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="456715060"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 10:29:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="763808265"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="763808265"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 10 Nov 2023 10:29:40 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 63DEE76D; Fri, 10 Nov 2023 20:23:07 +0200 (EET)
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
Subject: [PATCH v3 02/25] i2c: designware: Fix PM calls order in dw_i2c_plat_probe()
Date: Fri, 10 Nov 2023 20:11:22 +0200
Message-ID: <20231110182304.3894319-3-andriy.shevchenko@linux.intel.com>
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

We should not mix managed calls with non-managed. This will break
the calls order at the error path and ->remove() stages. Fix this
by wrapping PM ops to become managed one.

Fixes: 36d48fb5766a ("i2c: designware-platdrv: enable RuntimePM before registering to the core")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 28 ++++++++++++---------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 855b698e99c0..8b0099e1bc26 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -177,14 +177,26 @@ static int txgbe_i2c_request_regs(struct dw_i2c_dev *dev)
 	return 0;
 }
 
-static void dw_i2c_plat_pm_cleanup(struct dw_i2c_dev *dev)
+static void dw_i2c_plat_pm_cleanup(void *data)
 {
+	struct dw_i2c_dev *dev = data;
+
 	pm_runtime_disable(dev->dev);
 
 	if (dev->shared_with_punit)
 		pm_runtime_put_noidle(dev->dev);
 }
 
+static int dw_i2c_plat_pm_setup(struct dw_i2c_dev *dev)
+{
+	if (dev->shared_with_punit)
+		pm_runtime_get_noresume(dev->dev);
+
+	pm_runtime_enable(dev->dev);
+
+	return devm_add_action_or_reset(dev->dev, dw_i2c_plat_pm_cleanup, dev);
+}
+
 static int dw_i2c_plat_request_regs(struct dw_i2c_dev *dev)
 {
 	struct platform_device *pdev = to_platform_device(dev->dev);
@@ -381,19 +393,12 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 
-	if (dev->shared_with_punit)
-		pm_runtime_get_noresume(&pdev->dev);
-
-	pm_runtime_enable(&pdev->dev);
-
-	ret = i2c_dw_probe(dev);
+	ret = dw_i2c_plat_pm_setup(dev);
 	if (ret)
-		goto exit_probe;
+		goto exit_reset;
 
-	return ret;
+	return i2c_dw_probe(dev);
 
-exit_probe:
-	dw_i2c_plat_pm_cleanup(dev);
 exit_reset:
 	reset_control_assert(dev->rst);
 	return ret;
@@ -411,7 +416,6 @@ static void dw_i2c_plat_remove(struct platform_device *pdev)
 
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_sync(&pdev->dev);
-	dw_i2c_plat_pm_cleanup(dev);
 
 	i2c_dw_remove_lock_support(dev);
 
-- 
2.43.0.rc1.1.gbec44491f096


