Return-Path: <linux-i2c+bounces-5488-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE68C9565C6
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 10:41:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2CBF21C21E1A
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 08:41:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B88215E5C8;
	Mon, 19 Aug 2024 08:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LJ4Z6P1C"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D74FB15C14C;
	Mon, 19 Aug 2024 08:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724056819; cv=none; b=eav1qOV/BRfxaCicqQaDrBqDZ73I7rX0QCl0242NJXZ6RYkD0+Sp4LPp+LTwZynrwWihBLZ1ExrN09oXguQnjEKuBDsOvddv8VZE7snSLPaE38mcR1o6tLgaj17HpiXfCiZSsRBG41xgbKrw76wqux2J7n/FGlhM/odJ89JQOIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724056819; c=relaxed/simple;
	bh=jxV2hAqOs7BxSVK1cXUtzc6fthb30mv8K5t33I/+KgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OjGWJT7GOaDD176t8yBzT3qj/RczCqSL0pnLt2HbDFB1lL71mDYZdEWzxbr9VehB9bEnZGG1Cs/O/mzOq+5OTJazxpWFmj/tAHdfJ57ezm7szShQTXcllSCI1SVwSBSoC1C4uhJXe7DWXPh/dpqAhPMIN5Ng7T1NOwc8DcXYPLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LJ4Z6P1C; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724056818; x=1755592818;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jxV2hAqOs7BxSVK1cXUtzc6fthb30mv8K5t33I/+KgE=;
  b=LJ4Z6P1CKegVaXydHsvdw0bgkT9HSmcccrdBYs88KLaHasthEbiTQL4B
   VC0X0cqxsOF1NlgQ4Rj3h8EQmgg2h6K+G0roDG5TLk+hlrwyj3HWtlTP7
   xvkkNNyZFm6m4bn5BACTufl/JblyhT+8QOlphP6hBsJ+eI8EKF0T7ajcQ
   B6zZyuIY8wdNzx50SVm/7KFI4j4m2HXkw5HhyYIMh+9yNULVo46NtS7nL
   thYQiphzVOwOa81Vi3dU+4PBdUeMD8uJMb0xdNZcze/bIOKQIZxLe3ty8
   QpnAU9JtynMVbqc3KepmPDE5vCfUsBGebTEvT/RXuqC3P7b4FSp5Y+WaT
   Q==;
X-CSE-ConnectionGUID: nsoDeTK1R4Cn2+onYzEdcA==
X-CSE-MsgGUID: 37qcyBTvQbC+htD999e05Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="21834872"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="21834872"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 01:40:16 -0700
X-CSE-ConnectionGUID: znqmongDRB6XZZX9VGx4MA==
X-CSE-MsgGUID: Mo8kxpxpT4KU15/58nhwRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="91080207"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 19 Aug 2024 01:40:14 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 2EF13562; Mon, 19 Aug 2024 11:40:09 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Narasimhan.V@amd.com,
	Borislav Petkov <bp@alien8.de>,
	Kim Phillips <kim.phillips@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v2 7/7] i2c: designware: Drop return value from dw_i2c_of_configure()
Date: Mon, 19 Aug 2024 11:39:11 +0300
Message-ID: <20240819084007.3700433-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240819084007.3700433-1-andriy.shevchenko@linux.intel.com>
References: <20240819084007.3700433-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dw_i2c_of_configure() is called without checking of the returned
value, hence just drop it by converting to void.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 6328ae943a34..340c9e9a450a 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -110,7 +110,7 @@ static int mscc_twi_set_sda_hold_time(struct dw_i2c_dev *dev)
 	return 0;
 }
 
-static int dw_i2c_of_configure(struct platform_device *pdev)
+static void dw_i2c_of_configure(struct platform_device *pdev)
 {
 	struct dw_i2c_dev *dev = platform_get_drvdata(pdev);
 
@@ -123,8 +123,6 @@ static int dw_i2c_of_configure(struct platform_device *pdev)
 	default:
 		break;
 	}
-
-	return 0;
 }
 #else
 static int bt1_i2c_request_regs(struct dw_i2c_dev *dev)
@@ -132,9 +130,8 @@ static int bt1_i2c_request_regs(struct dw_i2c_dev *dev)
 	return -ENODEV;
 }
 
-static inline int dw_i2c_of_configure(struct platform_device *pdev)
+static inline void dw_i2c_of_configure(struct platform_device *pdev)
 {
-	return -ENODEV;
 }
 #endif
 
-- 
2.43.0.rc1.1336.g36b5255a03ac


