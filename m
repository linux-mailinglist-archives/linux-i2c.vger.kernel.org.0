Return-Path: <linux-i2c+bounces-328-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A567F1616
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 15:47:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 21EEDB21615
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Nov 2023 14:47:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CC5D1D531;
	Mon, 20 Nov 2023 14:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hRZmxe+l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8BB1D66;
	Mon, 20 Nov 2023 06:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700491619; x=1732027619;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OIU/ohSenRIHfIdotaL7Z+fDSzDZwcwlLHrvdYy8u3A=;
  b=hRZmxe+lhiFwI+J5aBg8topVUB22WD+uIuE56rNrehkfAssvzyDs0W3G
   8ngXSdIRa2nd+lThDJvEicBKpdORq9eMtQIh4YCts25gENCq6L3EA0L4N
   yulsiLRcHd5BAIQm6vTTMfsCxl0jyHpOom9BBq/VJkG7WQ1jZl/SPjXBd
   L5/uMiJJdiYLUaR7HDEk8Q+PhQMM4xsMp4IwUirJYR/a61jgyuq8nny0g
   EZdhHDZUWVJvbmjdRP5URyX3sgp45Sf+Ob4BKwGX47sbZJSm8Ln0UcrkD
   iGQhqCg0GRFb83AWOpA+teeb4XKUaskmQw3XST7cyLeF8YE94Ccrs8Dy4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="382017086"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="382017086"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 06:46:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="832291654"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="832291654"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 20 Nov 2023 06:46:53 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 0CA136B5; Mon, 20 Nov 2023 16:46:45 +0200 (EET)
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
Subject: [PATCH v4 19/24] i2c: designware: Uninline i2c_dw_probe()
Date: Mon, 20 Nov 2023 16:42:01 +0200
Message-ID: <20231120144641.1660574-20-andriy.shevchenko@linux.intel.com>
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

Since i2c_dw_probe() is going to be extended, uninline it to reduce
the noise in the common header.

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


