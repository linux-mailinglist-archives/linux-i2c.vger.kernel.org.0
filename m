Return-Path: <linux-i2c+bounces-6990-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C21CD98604A
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 16:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D112283DA5
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2024 14:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 461EB1A0BC9;
	Wed, 25 Sep 2024 12:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J5iPk8ab"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692231A01D5;
	Wed, 25 Sep 2024 12:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727268568; cv=none; b=ip004Ln5roJ4KWGL0rtgVwS4XadMeo9o8xiyPAgA9RMTQbGIU9pDEpWWQmRri86U9VeRhvvFR/SHKbtqAnqASNY5wgQVva/GOF3NjIoHf2AaO3yYW27wnnz4waU6SiMjKZ7wD8S4fdOo/0A+EMmlqrY8XXNBV9D51LHUGCyo/GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727268568; c=relaxed/simple;
	bh=/TXpA607vG0oOI0BpN5eHgQcE45esS5ompfrTwKMzrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lnzb4y43cBuu0dv5JUUg43iJ9uqlvtdhMU+PD9h9L5pGxC3YKGOizsTY5JGgr8WcTDneklk98UMeXil2SThmbczK6Oq5tbb6MoDeixkuf/U8HsnkKDviHlHNBE7YE7IASlC/ua1l4rlaUKSt2Ba0U1KyzzterfzcGRWV2R8dy6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J5iPk8ab; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727268566; x=1758804566;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/TXpA607vG0oOI0BpN5eHgQcE45esS5ompfrTwKMzrc=;
  b=J5iPk8abM6N3oiaHz4wj4n54XA14SN3Rul6wCPksiNun+k2ALBeoA5pl
   Ttqve/39K0rVx3l5Wai7ZydI5qAGJo4PN2oH/Rp68S2xfWNiMo7CflpMZ
   scZvD+nwRXA5JaWShPlrg8u+bIjs23r4w8A68TiMy6deorKJZqU2MBfWz
   PBidNIVqI/oL77FmV9WDNxvA7lPrmdl1sq5gMazVxbx24C1o6KrBKV9Mg
   qnojF+Nz3EXMWzvDXed3AXEB3qxacfCn9Ocl+CASoQONpgivAaL+qtUgl
   xnJcMa2g1IktFQaQwymY0inxlRfakoCouSMc6SUagMRqQT39dPm+ZrHMd
   Q==;
X-CSE-ConnectionGUID: 7hANOwzlQ1a141ONwXeDnQ==
X-CSE-MsgGUID: u81u/Dg7R5uvhoS8YJn7GA==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="36878379"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="36878379"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 05:49:22 -0700
X-CSE-ConnectionGUID: mioT3FTNSBWk2IqOmgXuvw==
X-CSE-MsgGUID: G7N+hhHMR0GQvA3dcvmbbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; 
   d="scan'208";a="72577341"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa008.jf.intel.com with ESMTP; 25 Sep 2024 05:49:19 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id AD3F160C; Wed, 25 Sep 2024 15:49:17 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Narasimhan.V@amd.com,
	Borislav Petkov <bp@alien8.de>,
	Kim Phillips <kim.phillips@amd.com>
Subject: [PATCH v1 3/5] i2c: designware: Remove 'cond' from i2c_dw_scl_hcnt()
Date: Wed, 25 Sep 2024 15:44:21 +0300
Message-ID: <20240925124916.976173-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240925124916.976173-1-andriy.shevchenko@linux.intel.com>
References: <20240925124916.976173-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'cond' parameter is not being used (always default, hence drop it
and hence make it consistent with i2c_dw_scl_lcnt().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-common.c | 52 +++++++---------------
 drivers/i2c/busses/i2c-designware-core.h   |  2 +-
 drivers/i2c/busses/i2c-designware-master.c |  4 --
 3 files changed, 16 insertions(+), 42 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index 84ca53ee3317..9c6166f463a2 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -407,47 +407,26 @@ static u32 i2c_dw_read_scl_reg(struct dw_i2c_dev *dev, u32 reg)
 }
 
 u32 i2c_dw_scl_hcnt(struct dw_i2c_dev *dev, unsigned int reg, u32 ic_clk,
-		    u32 tSYMBOL, u32 tf, int cond, int offset)
+		    u32 tSYMBOL, u32 tf, int offset)
 {
 	if (!ic_clk)
 		return i2c_dw_read_scl_reg(dev, reg);
 
 	/*
-	 * DesignWare I2C core doesn't seem to have solid strategy to meet
-	 * the tHD;STA timing spec.  Configuring _HCNT based on tHIGH spec
-	 * will result in violation of the tHD;STA spec.
+	 * Conditional expression:
+	 *
+	 *   IC_[FS]S_SCL_HCNT + 3 >= IC_CLK * (tHD;STA + tf)
+	 *
+	 * This is just experimental rule; the tHD;STA period turned
+	 * out to be proportinal to (_HCNT + 3).  With this setting,
+	 * we could meet both tHIGH and tHD;STA timing specs.
+	 *
+	 * If unsure, you'd better to take this alternative.
+	 *
+	 * The reason why we need to take into account "tf" here,
+	 * is the same as described in i2c_dw_scl_lcnt().
 	 */
-	if (cond)
-		/*
-		 * Conditional expression:
-		 *
-		 *   IC_[FS]S_SCL_HCNT + (1+4+3) >= IC_CLK * tHIGH
-		 *
-		 * This is based on the DW manuals, and represents an ideal
-		 * configuration.  The resulting I2C bus speed will be
-		 * faster than any of the others.
-		 *
-		 * If your hardware is free from tHD;STA issue, try this one.
-		 */
-		return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * tSYMBOL, MICRO) -
-		       8 + offset;
-	else
-		/*
-		 * Conditional expression:
-		 *
-		 *   IC_[FS]S_SCL_HCNT + 3 >= IC_CLK * (tHD;STA + tf)
-		 *
-		 * This is just experimental rule; the tHD;STA period turned
-		 * out to be proportinal to (_HCNT + 3).  With this setting,
-		 * we could meet both tHIGH and tHD;STA timing specs.
-		 *
-		 * If unsure, you'd better to take this alternative.
-		 *
-		 * The reason why we need to take into account "tf" here,
-		 * is the same as described in i2c_dw_scl_lcnt().
-		 */
-		return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * (tSYMBOL + tf), MICRO) -
-		       3 + offset;
+	return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * (tSYMBOL + tf), MICRO) - 3 + offset;
 }
 
 u32 i2c_dw_scl_lcnt(struct dw_i2c_dev *dev, unsigned int reg, u32 ic_clk,
@@ -467,8 +446,7 @@ u32 i2c_dw_scl_lcnt(struct dw_i2c_dev *dev, unsigned int reg, u32 ic_clk,
 	 * account the fall time of SCL signal (tf).  Default tf value
 	 * should be 0.3 us, for safety.
 	 */
-	return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * (tLOW + tf), MICRO) -
-	       1 + offset;
+	return DIV_ROUND_CLOSEST_ULL((u64)ic_clk * (tLOW + tf), MICRO) - 1 + offset;
 }
 
 int i2c_dw_set_sda_hold(struct dw_i2c_dev *dev)
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 8e8854ec9882..067ed5bcec08 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -328,7 +328,7 @@ struct i2c_dw_semaphore_callbacks {
 
 int i2c_dw_init_regmap(struct dw_i2c_dev *dev);
 u32 i2c_dw_scl_hcnt(struct dw_i2c_dev *dev, unsigned int reg, u32 ic_clk,
-		    u32 tSYMBOL, u32 tf, int cond, int offset);
+		    u32 tSYMBOL, u32 tf, int offset);
 u32 i2c_dw_scl_lcnt(struct dw_i2c_dev *dev, unsigned int reg, u32 ic_clk,
 		    u32 tLOW, u32 tf, int offset);
 int i2c_dw_set_sda_hold(struct dw_i2c_dev *dev);
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index e8ac9a7bf0b3..09e72ead51ee 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -71,7 +71,6 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
 					ic_clk,
 					4000,	/* tHD;STA = tHIGH = 4.0 us */
 					sda_falling_time,
-					0,	/* 0: DW default, 1: Ideal */
 					0);	/* No offset */
 		dev->ss_lcnt =
 			i2c_dw_scl_lcnt(dev,
@@ -105,7 +104,6 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
 						ic_clk,
 						260,	/* tHIGH = 260 ns */
 						sda_falling_time,
-						0,	/* DW default */
 						0);	/* No offset */
 			dev->fs_lcnt =
 				i2c_dw_scl_lcnt(dev,
@@ -129,7 +127,6 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
 					ic_clk,
 					600,	/* tHD;STA = tHIGH = 0.6 us */
 					sda_falling_time,
-					0,	/* 0: DW default, 1: Ideal */
 					0);	/* No offset */
 		dev->fs_lcnt =
 			i2c_dw_scl_lcnt(dev,
@@ -161,7 +158,6 @@ static int i2c_dw_set_timings_master(struct dw_i2c_dev *dev)
 						ic_clk,
 						160,	/* tHIGH = 160 ns */
 						sda_falling_time,
-						0,	/* DW default */
 						0);	/* No offset */
 			dev->hs_lcnt =
 				i2c_dw_scl_lcnt(dev,
-- 
2.43.0.rc1.1336.g36b5255a03ac


