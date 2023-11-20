Return-Path: <linux-i2c+bounces-313-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AEA7F15FF
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 15:47:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D732282517
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 14:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE2541BDFF;
	Mon, 20 Nov 2023 14:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KJvxcYos"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EABD6ED;
	Mon, 20 Nov 2023 06:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700491613; x=1732027613;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=So8kYJoKij+VCNKaGUL34AujAf1NZ1x9lxbojhvLPXI=;
  b=KJvxcYosvcV8FirGX7laC4VNukh0DlH5hibJTGr/BMory8ozfahioifu
   JV1tc7x1sgJ8CxTzn29uiZO3rIgWMV0tn29i5KG1ZJ91QHMi/Itr6/dCN
   aJRFEtTjG/epLLxpo83rN+RbBv8bJIlbVLAajc8BjnqURoYZAapwhSwUv
   EuvOizkgbmMPwPHZPkpoPv0d8BWI0qeF6sWeHpHH6T4hF97u7cOCQ748i
   ImavZW26cfkKWM7LNHFBDd6CTT7W5deAuPg3Xrku/dSjN8lBiLcuxkgDq
   xbOKobXtmVs2BCP6lP+aH1ApzSXKSr2U6gOH6RBIdT4Rahjp3L++eI282
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="382017009"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="382017009"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 06:46:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="832291634"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="832291634"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 20 Nov 2023 06:46:48 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 508C912C; Mon, 20 Nov 2023 16:46:44 +0200 (EET)
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
Subject: [PATCH v4 04/24] i2c: designware: Fix lock probe call order in dw_i2c_plat_probe()
Date: Mon, 20 Nov 2023 16:41:46 +0200
Message-ID: <20231120144641.1660574-5-andriy.shevchenko@linux.intel.com>
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


