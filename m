Return-Path: <linux-i2c+bounces-660-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 220D2808A17
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 15:17:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 521581C20A92
	for <lists+linux-i2c@lfdr.de>; Thu,  7 Dec 2023 14:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4604241C7E;
	Thu,  7 Dec 2023 14:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bzYWhMqs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7D6910FB;
	Thu,  7 Dec 2023 06:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701958633; x=1733494633;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A3sEG26V7uefcQiTn8sbi7khvyOLOkQeV61uKyLd7tM=;
  b=bzYWhMqsG/rtWg/LYczFpQMxOQf9C/9u3ZMfgG4zVYs+93eYqWY5jlA7
   X5Rtz2Y7baZK4Q5vT+HWPXzYQ3+Flt9+rkCveTKHUZhumk7dTb8330hKn
   NYdkkBlSMQqfTT/dtuuiY5vUFSvWS4gzXe4M/UTanH89VO894m9vGacY4
   lyw+teq0VeJZ8LZ8aK+9tTDUHSsTRx7kHYG4ImgbbNLnkxHv7FYivqq8G
   dR1o44lLTOYjSfGRqJNhyRXGHWr38aGvOja1rrsvStQSJUlHfCb5UbBwP
   QXmTrUyOb7E3pcRonp933yhAvfDST7uBmfMU9eY1NsDB/WFgtqKd1Tk1j
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="460726127"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="460726127"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 06:17:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="862490638"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="862490638"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 07 Dec 2023 06:17:07 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C2FE36A6; Thu,  7 Dec 2023 16:17:02 +0200 (EET)
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
Subject: [PATCH v5 06/24] i2c: designware: Save pointer to semaphore callbacks instead of index
Date: Thu,  7 Dec 2023 16:13:46 +0200
Message-ID: <20231207141653.2785124-7-andriy.shevchenko@linux.intel.com>
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

Instead of saving index and do an additional level of referencing,
save just a pointer to the semaphore callbacks directly. It makes
code cleaner.

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Tested-by: Serge Semin <fancer.lancer@gmail.com>
Link: https://lore.kernel.org/r/20231120144641.1660574-7-andriy.shevchenko@linux.intel.com
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-core.h    |  4 +++-
 drivers/i2c/busses/i2c-designware-platdrv.c | 12 ++++--------
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index a7f6f3eafad7..f8dd87cb0ae9 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -187,6 +187,8 @@ struct clk;
 struct device;
 struct reset_control;
 
+struct i2c_dw_semaphore_callbacks;
+
 /**
  * struct dw_i2c_dev - private i2c-designware data
  * @dev: driver model device node
@@ -291,7 +293,7 @@ struct dw_i2c_dev {
 	u16			hs_lcnt;
 	int			(*acquire_lock)(void);
 	void			(*release_lock)(void);
-	int			semaphore_idx;
+	const struct i2c_dw_semaphore_callbacks *semaphore_cb;
 	bool			shared_with_punit;
 	void			(*disable)(struct dw_i2c_dev *dev);
 	int			(*init)(struct dw_i2c_dev *dev);
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index cb954f11540e..4b5e58e1ce5b 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -247,21 +247,18 @@ static void i2c_dw_remove_lock_support(void *data)
 {
 	struct dw_i2c_dev *dev = data;
 
-	if (dev->semaphore_idx < 0)
+	if (!dev->semaphore_cb)
 		return;
 
-	if (i2c_dw_semaphore_cb_table[dev->semaphore_idx].remove)
-		i2c_dw_semaphore_cb_table[dev->semaphore_idx].remove(dev);
+	if (dev->semaphore_cb->remove)
+		dev->semaphore_cb->remove(dev);
 }
 
 static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
 {
 	const struct i2c_dw_semaphore_callbacks *ptr;
-	int i = 0;
 	int ret;
 
-	dev->semaphore_idx = -1;
-
 	for (ptr = i2c_dw_semaphore_cb_table; ptr->probe; ptr++) {
 		ret = ptr->probe(dev);
 		if (ret) {
@@ -273,11 +270,10 @@ static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
 			if (ret != -ENODEV)
 				return ret;
 
-			i++;
 			continue;
 		}
 
-		dev->semaphore_idx = i;
+		dev->semaphore_cb = ptr;
 		break;
 	}
 
-- 
2.43.0.rc1.1.gbec44491f096


