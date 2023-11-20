Return-Path: <linux-i2c+bounces-309-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1D17F15FC
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 15:46:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C87A1F24885
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 14:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D619E15AD9;
	Mon, 20 Nov 2023 14:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e4ZMUp0S"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04FEDED;
	Mon, 20 Nov 2023 06:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700491610; x=1732027610;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Q74ZR11NZl+PRDfKRQssfNbi5b3tAivgbT0UCKwiVes=;
  b=e4ZMUp0SWsh6cXIuvQxGNtcR+5dGR24P4geXs1z7GkFcWxbMZsrGPBhT
   tEb1PDcN7w8SByl1FL3jXLmhmpKLXXQlG6baGHU+sIbteujqsesVZJ4JC
   orai+iUwI7MotMGAGI+NdIA3UtDyVrzHzRPP8mRY5lqOePgOPVsvsS6v/
   cnQgy59ySrCr3bMs9Y2SvPwUKCe2bfG/QN81SffG7Bzyu5hIHXI+wIy+G
   Lk5UPcqBpCYap0JY/LxJaCA4/nqNCAz0nnr5pwOGgxwGGh7OSNVcztsmo
   VBFsjlIm1EfoGaHdqLnnVDovHfpP/hsyoZYWb9miQmWZr1IAI4YArvr0Z
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="455956424"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="455956424"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 06:46:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="801193124"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="801193124"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga001.jf.intel.com with ESMTP; 20 Nov 2023 06:46:45 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2E61568; Mon, 20 Nov 2023 16:46:44 +0200 (EET)
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
Subject: [PATCH v4 01/24] i2c: designware: Fix PM calls order in dw_i2c_plat_probe()
Date: Mon, 20 Nov 2023 16:41:43 +0200
Message-ID: <20231120144641.1660574-2-andriy.shevchenko@linux.intel.com>
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
by wrapping PM ops to become managed one.

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


