Return-Path: <linux-i2c+bounces-649-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C100D808A0A
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 15:17:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3C60FB203C9
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 14:17:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEBF44185E;
	Thu,  7 Dec 2023 14:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="egTrLJW6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6252510DC;
	Thu,  7 Dec 2023 06:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701958628; x=1733494628;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LLfjvS+VRjLxkVCrmOp5ZQ7KNZBykPK/FRjYw4fcjt0=;
  b=egTrLJW6o3W4Cx8lvHC4tubwZ2J4KOMa3HK7y2nQ5RxwxsO0Km3P2PGh
   ry+5EEOQ1iN7y/ztbM76c46RFKU1v74hxqYnmS2JMQ3O/m5VUg+H2n51T
   MKkJCYvgEaBdWx1OV7nZKD6PR/6WP8kcrP3mXYFbA1BwGexPzmzxBeEIt
   WDiUz34G6dUml0X67dFM3Fkmhnr9PS6+tZQfMVbC4yH3KtFf0fddG8AVe
   tnACWTFJbIK0eBFyCf+M+n+l+VvxhP/s6+hwl5H4PknBjfp2Xz3ZdWw0g
   WVgAC6gJL5ltED9MpToHBKhLpoTn5KGhQGFpnTaMw2WcPEWGNRevK5ic7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="460726064"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="460726064"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 06:17:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="889756048"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="889756048"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 07 Dec 2023 06:17:03 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 7B5BADE; Thu,  7 Dec 2023 16:17:02 +0200 (EET)
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
Subject: [PATCH v5 01/24] i2c: designware: Fix PM calls order in dw_i2c_plat_probe()
Date: Thu,  7 Dec 2023 16:13:41 +0200
Message-ID: <20231207141653.2785124-2-andriy.shevchenko@linux.intel.com>
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

We should not mix managed calls with non-managed. This will break
the calls order at the error path and ->remove() stages. Fix this
by wrapping PM ops to become managed one.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Link: https://lore.kernel.org/r/20231120144641.1660574-2-andriy.shevchenko@linux.intel.com
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 26 ++++++++++++++-------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 855b698e99c0..fd3cd65f9c88 100644
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
@@ -381,19 +393,16 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 
-	if (dev->shared_with_punit)
-		pm_runtime_get_noresume(&pdev->dev);
-
-	pm_runtime_enable(&pdev->dev);
+	ret = dw_i2c_plat_pm_setup(dev);
+	if (ret)
+		goto exit_reset;
 
 	ret = i2c_dw_probe(dev);
 	if (ret)
-		goto exit_probe;
+		goto exit_reset;
 
 	return ret;
 
-exit_probe:
-	dw_i2c_plat_pm_cleanup(dev);
 exit_reset:
 	reset_control_assert(dev->rst);
 	return ret;
@@ -411,7 +420,6 @@ static void dw_i2c_plat_remove(struct platform_device *pdev)
 
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_sync(&pdev->dev);
-	dw_i2c_plat_pm_cleanup(dev);
 
 	i2c_dw_remove_lock_support(dev);
 
-- 
2.43.0.rc1.1.gbec44491f096


