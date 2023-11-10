Return-Path: <linux-i2c+bounces-25-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6CC7E81A8
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 19:31:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C5BFCB20D16
	for <lists+linux-i2c@lfdr.de>; Fri, 10 Nov 2023 18:31:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E033A293;
	Fri, 10 Nov 2023 18:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RsK4Aog9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72C403A29E
	for <linux-i2c@vger.kernel.org>; Fri, 10 Nov 2023 18:31:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28EEC1288FE;
	Fri, 10 Nov 2023 10:31:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699641063; x=1731177063;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=So8kYJoKij+VCNKaGUL34AujAf1NZ1x9lxbojhvLPXI=;
  b=RsK4Aog9zMwUU+woRGZ+AdPBuQl6F3QgfwgzLEryLxv6Fz4ZMpasgxJc
   fAZY6IN0iiw5mTQU2cmKur7zx8BxDhXP8p5F4+DlbwHIjwieNMy6cukhN
   F9C3qv7pPViKyHURwcU/nVqyuAgfq9zkPX/qMVdP9amgXef3HfC2uFhQd
   kIJ7L4FvMgTnF6rl518aZb4fqxHw6G1GaEG21bBGTkxAVwKnyFqq6Uor9
   X753nvHDj2HUvCvO0wGWPLeR9VFuBDemBiEqRGQB4dlm2HUcdv+jSJv7W
   pZBtAWE+QVgTyUP0HzeoiGeEk8KVBIRHV48xYBKpfl4dpDQgHfC/cnVFi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="456715051"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="456715051"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 10:29:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="763808231"
X-IronPort-AV: E=Sophos;i="6.03,291,1694761200"; 
   d="scan'208";a="763808231"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 10 Nov 2023 10:29:36 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 9068C7E7; Fri, 10 Nov 2023 20:23:07 +0200 (EET)
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
Subject: [PATCH v3 05/25] i2c: designware: Fix lock probe call order in dw_i2c_plat_probe()
Date: Fri, 10 Nov 2023 20:11:25 +0200
Message-ID: <20231110182304.3894319-6-andriy.shevchenko@linux.intel.com>
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
by wrapping lock probe to become managed one.

Fixes: 78d5e9e299e3 ("i2c: designware: Add AMD PSP I2C bus support")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 24 ++++++++++-----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 648fb84e574d..63cc3cdca2c7 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -243,6 +243,17 @@ static const struct i2c_dw_semaphore_callbacks i2c_dw_semaphore_cb_table[] = {
 	{}
 };
 
+static void i2c_dw_remove_lock_support(void *data)
+{
+	struct dw_i2c_dev *dev = data;
+
+	if (dev->semaphore_idx < 0)
+		return;
+
+	if (i2c_dw_semaphore_cb_table[dev->semaphore_idx].remove)
+		i2c_dw_semaphore_cb_table[dev->semaphore_idx].remove(dev);
+}
+
 static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
 {
 	const struct i2c_dw_semaphore_callbacks *ptr;
@@ -273,16 +284,7 @@ static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
 		break;
 	}
 
-	return 0;
-}
-
-static void i2c_dw_remove_lock_support(struct dw_i2c_dev *dev)
-{
-	if (dev->semaphore_idx < 0)
-		return;
-
-	if (i2c_dw_semaphore_cb_table[dev->semaphore_idx].remove)
-		i2c_dw_semaphore_cb_table[dev->semaphore_idx].remove(dev);
+	return devm_add_action_or_reset(dev->dev, i2c_dw_remove_lock_support, dev);
 }
 
 static void dw_i2c_plat_assert_reset(void *data)
@@ -428,8 +430,6 @@ static void dw_i2c_plat_remove(struct platform_device *pdev)
 
 	pm_runtime_dont_use_autosuspend(&pdev->dev);
 	pm_runtime_put_sync(&pdev->dev);
-
-	i2c_dw_remove_lock_support(dev);
 }
 
 static int dw_i2c_plat_prepare(struct device *dev)
-- 
2.43.0.rc1.1.gbec44491f096


