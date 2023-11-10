Return-Path: <linux-i2c+bounces-23-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E037E819B
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 19:31:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D0ADE2810A9
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 18:31:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16E313A287;
	Fri, 10 Nov 2023 18:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XbdZ///F"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481CF3A293
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 18:31:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F975310F4;
	Fri, 10 Nov 2023 10:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699641003; x=1731177003;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GK90mbE0EOw3ya7gSntsxAU2F0RaNMKzpLtQIiMB+v0=;
  b=XbdZ///F0DxMg91BknwbvxUvAwOd+OqDXw8tuxoe9m2faAsx/IZL8DG6
   64NDALRnUsW3KM+TcCIHynaoV4AtJOA6xHL72VkLjhkuGqj98BXCaB/+v
   k+GPLdM83gLIFgI7jRh2igRZeLkyjUoBRByOtuqQZONmEcTPUpm5XKr/X
   PrFsds83sFFyJvCvtlRB/unukMyZhHtTF/9mMShy+7N0dJl9GZaQhaJ7Z
   1f9wgooz50pNAwUYwm+fvEeJ4dqXKKe7Y0bNt8vbOSyZHkNhVLsOXSbfw
   oPVjRf/HEId6kojuGQERN9IeZ+8mPUvX32SLewxA6iY8GvlLSDDnsZziY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="456715036"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="456715036"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 10:29:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="763808228"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="763808228"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 10 Nov 2023 10:29:36 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 78C9979F; Fri, 10 Nov 2023 20:23:07 +0200 (EET)
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
Subject: [PATCH v3 03/25] i2c: designware: Fix reset call order in dw_i2c_plat_probe()
Date: Fri, 10 Nov 2023 20:11:23 +0200
Message-ID: <20231110182304.3894319-4-andriy.shevchenko@linux.intel.com>
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
by wrapping reset control to become managed one.

With that start checking the rerurn code from reset_control_deassert()
as it may fail and calling assertion in that scenario is not always
a good idea.

Fixes: ab809fd81fde ("i2c: designware: add reset interface")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 56 ++++++++++++---------
 1 file changed, 33 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 8b0099e1bc26..648fb84e574d 100644
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
@@ -395,13 +411,9 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 
 	ret = dw_i2c_plat_pm_setup(dev);
 	if (ret)
-		goto exit_reset;
+		return ret;
 
 	return i2c_dw_probe(dev);
-
-exit_reset:
-	reset_control_assert(dev->rst);
-	return ret;
 }
 
 static void dw_i2c_plat_remove(struct platform_device *pdev)
@@ -418,8 +430,6 @@ static void dw_i2c_plat_remove(struct platform_device *pdev)
 	pm_runtime_put_sync(&pdev->dev);
 
 	i2c_dw_remove_lock_support(dev);
-
-	reset_control_assert(dev->rst);
 }
 
 static int dw_i2c_plat_prepare(struct device *dev)
-- 
2.43.0.rc1.1.gbec44491f096


