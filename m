Return-Path: <linux-i2c+bounces-668-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35198808A29
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 15:17:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4A4B281158
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 14:17:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D4141C80;
	Thu,  7 Dec 2023 14:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dcrC1Z3x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1449A1987;
	Thu,  7 Dec 2023 06:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701958642; x=1733494642;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+yrYKiXrfmH57CrIvqkWlnC8Sznz69h4K5xSraBupEU=;
  b=dcrC1Z3xW601XZPaDEvx2khZxiaAvsepojBXnP9rs6gqtkA0r7ITNgJF
   pCMrwPsyJQkoaa0vJeoByWCEh+zEoBJsUOpDCcwaLxXjw8L7/9w6K8vCL
   rJqFhe1uNmTDJ9+x4f4ifT6oGxBustHxQ68yd5R09WglE/k8aEHjysYj1
   sglxT+KIsAtvefSG82pzDqvXkKRCwduuAyR3RgnUQQs7JnKjHro2pbvth
   mJItT+ADbNkNpY468yJSJM0aAoRuaOGlvZf4TAL2Xz6nH7Und6CP1YUAi
   05EuDL44bfIT2snofd3YwnCmRSbTkLO0Gtnx/MPy5eVvC8hLJ6YiK7iOY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="460726199"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="460726199"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 06:17:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="889756103"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="889756103"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga002.fm.intel.com with ESMTP; 07 Dec 2023 06:17:11 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 5927ACC8; Thu,  7 Dec 2023 16:17:03 +0200 (EET)
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
Subject: [PATCH v5 19/24] i2c: designware: Uninline i2c_dw_probe()
Date: Thu,  7 Dec 2023 16:13:59 +0200
Message-ID: <20231207141653.2785124-20-andriy.shevchenko@linux.intel.com>
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

Since i2c_dw_probe() might be extended in the future, uninline it
to reduce the noise in the common header.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Link: https://lore.kernel.org/r/20231120144641.1660574-20-andriy.shevchenko@linux.intel.com
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c | 14 ++++++++++++++
 drivers/i2c/busses/i2c-designware-core.h   | 17 ++---------------
 2 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 7c877e380605..1d213bc0bbfa 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -714,6 +714,20 @@ void i2c_dw_disable(struct dw_i2c_dev *dev)
 }
 EXPORT_SYMBOL_GPL(i2c_dw_disable);
 
+int i2c_dw_probe(struct dw_i2c_dev *dev)
+{
+	switch (dev->mode) {
+	case DW_IC_SLAVE:
+		return i2c_dw_probe_slave(dev);
+	case DW_IC_MASTER:
+		return i2c_dw_probe_master(dev);
+	default:
+		dev_err(dev->dev, "Wrong operation mode: %d\n", dev->mode);
+		return -EINVAL;
+	}
+}
+EXPORT_SYMBOL_GPL(i2c_dw_probe);
+
 static int i2c_dw_prepare(struct device *device)
 {
 	/*
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index f6ebf86dcc6f..7479cb3a450d 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -10,9 +10,7 @@
  */
 
 #include <linux/bits.h>
-#include <linux/compiler_types.h>
 #include <linux/completion.h>
-#include <linux/dev_printk.h>
 #include <linux/errno.h>
 #include <linux/i2c.h>
 #include <linux/pm.h>
@@ -367,19 +365,6 @@ static inline void i2c_dw_configure_slave(struct dw_i2c_dev *dev) { }
 static inline int i2c_dw_probe_slave(struct dw_i2c_dev *dev) { return -EINVAL; }
 #endif
 
-static inline int i2c_dw_probe(struct dw_i2c_dev *dev)
-{
-	switch (dev->mode) {
-	case DW_IC_SLAVE:
-		return i2c_dw_probe_slave(dev);
-	case DW_IC_MASTER:
-		return i2c_dw_probe_master(dev);
-	default:
-		dev_err(dev->dev, "Wrong operation mode: %d\n", dev->mode);
-		return -EINVAL;
-	}
-}
-
 static inline void i2c_dw_configure(struct dw_i2c_dev *dev)
 {
 	if (i2c_detect_slave_mode(dev->dev))
@@ -388,6 +373,8 @@ static inline void i2c_dw_configure(struct dw_i2c_dev *dev)
 		i2c_dw_configure_master(dev);
 }
 
+int i2c_dw_probe(struct dw_i2c_dev *dev);
+
 #if IS_ENABLED(CONFIG_I2C_DESIGNWARE_BAYTRAIL)
 int i2c_dw_baytrail_probe_lock_support(struct dw_i2c_dev *dev);
 #endif
-- 
2.43.0.rc1.1.gbec44491f096


