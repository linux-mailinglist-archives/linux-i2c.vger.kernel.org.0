Return-Path: <linux-i2c+bounces-308-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 541F67F15FB
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 15:46:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01C361F23EE5
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 14:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2695814A89;
	Mon, 20 Nov 2023 14:46:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n6ok0S77"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE914C1;
	Mon, 20 Nov 2023 06:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700491608; x=1732027608;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KIuH4XCfPQjyUWIlRjFEssI3BuwBFySin1vMLnPP7+A=;
  b=n6ok0S77AvyiH1olP5ZHrphZIxZ+9yKfI2438FY5dK7BF69jRdgAU8kR
   Uh34v55JJOvTHoXikq2fWA5jJUYWT5KBxprnkWoIU6lF3w/DyUDTRM/Aa
   NZ2Uw9mwo7Wo8gZrWzbAsNz6VNQHb+ggxAAUtGRDb0YRz7COl/WAMAGE7
   2ZAsl+XLn2dQ/0OyRYzvBMx2FowPj/bkaJHGquolLgKPipcMDwes3mwI1
   lQgBSeWcDi/Kclq7yaIKF8Q51G81QlvfdwHLXd9N+ETK4XCP7Owsc3AL3
   TgLLeY32Nv8uXZ41cIEmO5B85kTJW/58nFwu2pBZZSQ4RhMWgZwsa/6Tb
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="455956418"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="455956418"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 06:46:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="801193125"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="801193125"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 20 Nov 2023 06:46:45 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 3A683118; Mon, 20 Nov 2023 16:46:44 +0200 (EET)
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
Subject: [PATCH v4 02/24] i2c: designware: Fix reset call order in dw_i2c_plat_probe()
Date: Mon, 20 Nov 2023 16:41:44 +0200
Message-ID: <20231120144641.1660574-3-andriy.shevchenko@linux.intel.com>
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

We should not mix managed calls with non-managed. This will break
the calls order at the error path and ->remove() stages. Fix this
by wrapping reset control to become managed one.

With that start checking the rerurn code from reset_control_deassert()
as it may fail and calling assertion in that scenario is not always
a good idea.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 62 +++++++++++----------
 1 file changed, 34 insertions(+), 28 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index fd3cd65f9c88..648fb84e574d 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -285,6 +285,28 @@ static void i2c_dw_remove_lock_support(struct dw_i2c_dev *dev)
 		i2c_dw_semaphore_cb_table[dev->semaphore_idx].remove(dev);
 }
 
+static void dw_i2c_plat_assert_reset(void *data)
+{
+	struct dw_i2c_dev *dev = data;
+
+	reset_control_assert(dev->rst);
+}
+
+static int dw_i2c_plat_get_reset(struct dw_i2c_dev *dev)
+{
+	int ret;
+
+	dev->rst = devm_reset_control_get_optional_exclusive(dev->dev, NULL);
+	if (IS_ERR(dev->rst))
+		return PTR_ERR(dev->rst);
+
+	ret = reset_control_deassert(dev->rst);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev->dev, dw_i2c_plat_assert_reset, dev);
+}
+
 static int dw_i2c_plat_probe(struct platform_device *pdev)
 {
 	struct i2c_adapter *adap;
@@ -312,11 +334,9 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	dev->rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
-	if (IS_ERR(dev->rst))
-		return PTR_ERR(dev->rst);
-
-	reset_control_deassert(dev->rst);
+	ret = dw_i2c_plat_get_reset(dev);
+	if (ret)
+		return ret;
 
 	t = &dev->timings;
 	i2c_parse_fw_timings(&pdev->dev, t, false);
@@ -331,30 +351,26 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 
 	ret = i2c_dw_validate_speed(dev);
 	if (ret)
-		goto exit_reset;
+		return ret;
 
 	ret = i2c_dw_probe_lock_support(dev);
 	if (ret)
-		goto exit_reset;
+		return ret;
 
 	i2c_dw_configure(dev);
 
 	/* Optional interface clock */
 	dev->pclk = devm_clk_get_optional(&pdev->dev, "pclk");
-	if (IS_ERR(dev->pclk)) {
-		ret = PTR_ERR(dev->pclk);
-		goto exit_reset;
-	}
+	if (IS_ERR(dev->pclk))
+		return PTR_ERR(dev->pclk);
 
 	dev->clk = devm_clk_get_optional(&pdev->dev, NULL);
-	if (IS_ERR(dev->clk)) {
-		ret = PTR_ERR(dev->clk);
-		goto exit_reset;
-	}
+	if (IS_ERR(dev->clk))
+		return PTR_ERR(dev->clk);
 
 	ret = i2c_dw_prepare_clk(dev, true);
 	if (ret)
-		goto exit_reset;
+		return ret;
 
 	if (dev->clk) {
 		u64 clk_khz;
@@ -395,17 +411,9 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 
 	ret = dw_i2c_plat_pm_setup(dev);
 	if (ret)
-		goto exit_reset;
+		return ret;
 
-	ret = i2c_dw_probe(dev);
-	if (ret)
-		goto exit_reset;
-
-	return ret;
-
-exit_reset:
-	reset_control_assert(dev->rst);
-	return ret;
+	return i2c_dw_probe(dev);
 }
 
 static void dw_i2c_plat_remove(struct platform_device *pdev)
@@ -422,8 +430,6 @@ static void dw_i2c_plat_remove(struct platform_device *pdev)
 	pm_runtime_put_sync(&pdev->dev);
 
 	i2c_dw_remove_lock_support(dev);
-
-	reset_control_assert(dev->rst);
 }
 
 static int dw_i2c_plat_prepare(struct device *dev)
-- 
2.43.0.rc1.1.gbec44491f096


