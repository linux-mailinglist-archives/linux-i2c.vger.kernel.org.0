Return-Path: <linux-i2c+bounces-650-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD4F808A07
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 15:17:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6F9D1F2145B
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 14:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B86534187E;
	Thu,  7 Dec 2023 14:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HBxnT5oJ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3532D10DA;
	Thu,  7 Dec 2023 06:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701958628; x=1733494628;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Pz+b7NxYFQNKKQhTbcI/vJ6DmuTfQ7/BGG0xBHn4/mQ=;
  b=HBxnT5oJ7gcTEI9jNbKDho3Lk3LVsfcgJiw6u2qMLwT0surt04wkAT4h
   m1cFp5ieATsTnR7EMGpqNtVBacwr4yokuJchv8FTP5hn6OnNOctycr/sX
   lG9aER5ax9J8c4yS0U1efp50g05b+WmW/BsbmeuQ/pKntc7eZllXdOuUL
   Djp4Wu5wKRcrS8YYwMBYzGg3vskpJ2qMrxstAVxxkYkcY5lD321C6QHCH
   9AK0RAH6aw/+oNKS8EyByqbmBK5+vQpUnON+Htyo1xPGOR72KOvARhM+o
   H/7t1+6Ir6BByigEIUwWh2geEFja/+/wM+s5rRbk1w0vlQCJrZp/F5kZS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="460726050"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="460726050"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 06:17:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="889756045"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="889756045"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 07 Dec 2023 06:17:03 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id AA07565E; Thu,  7 Dec 2023 16:17:02 +0200 (EET)
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
Subject: [PATCH v5 04/24] i2c: designware: Fix lock probe call order in dw_i2c_plat_probe()
Date: Thu,  7 Dec 2023 16:13:44 +0200
Message-ID: <20231207141653.2785124-5-andriy.shevchenko@linux.intel.com>
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
by wrapping lock probe to become managed one.

Fixes: 78d5e9e299e3 ("i2c: designware: Add AMD PSP I2C bus support")
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Link: https://lore.kernel.org/r/20231120144641.1660574-5-andriy.shevchenko@linux.intel.com
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


