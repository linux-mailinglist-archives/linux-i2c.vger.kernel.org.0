Return-Path: <linux-i2c+bounces-5465-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 204D6954FC1
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 19:13:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 539791C229C0
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 17:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D91771C3F14;
	Fri, 16 Aug 2024 17:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N3FgcbO4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 500B61C378B;
	Fri, 16 Aug 2024 17:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723828362; cv=none; b=N0O8dqbanQFi5/Dqd6WfQ9+k0VBdoGEUny1FvIMC4EpGi7nujni/Ijt/mKfO6BF9mxt0yqmNfJU8uKsh08cmnWrybkKnx9j3Wm7Poi98C2ZC9kbJk6s1NJvhHF3Tt/NFzCSYdFFlgYNCqdjtX0Tut/IwEGjYFDdPpR5PkFXVInk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723828362; c=relaxed/simple;
	bh=JeD6dx8LkKLsb4f1jGNEIeW+t/ve0YFKAf5hq/Jb5G8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WM+JNm2nmD3kUK4Syc0C55442+cH9aQFzV9nHJARJPFpdfY9AcX717za8nH3z3YaOnfJ4t3EAOhW++gRa1V2EPv5Yc4NIVVQq+/+i9XZSFC59gStIx4OgvccytJZx+Od2+znDH9qJnhMFrOFAbZ7OaxCdKPnGfK4hE4jZaITUdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N3FgcbO4; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723828361; x=1755364361;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JeD6dx8LkKLsb4f1jGNEIeW+t/ve0YFKAf5hq/Jb5G8=;
  b=N3FgcbO4zdMk1I0jdAR5HVIAKLclNULxLeVITUuYRuCO+B2MdXu/mOqx
   5UqYZ9HL3q8tIVD3lh9isxJDnhb7Uj7tHfgaxq2Oe+/rzqjI0aCvbCGVB
   HYBPtPcU41xGXehBbkU/ge3e4Kpi5L08RZcF8gZN5tNIvVZHlY+wq6Sat
   LuATrvlK3t5jj/bOeWkuUTCtd6j4BLLtDBIxOMhTwXjt7vTey+kEGTPkP
   XQr87C9pdNxls7yLVgxCOM93/JvEg9awPTKk5gvxU1I1CJzjis6SDUT5H
   CH6dFyK1DiXuE97TstaR9MAsS7hR+0d3CcgI6HM3y+UjjOY4LnPhTbMC0
   A==;
X-CSE-ConnectionGUID: zbb93Rh8Rg6aQbfACFH5vA==
X-CSE-MsgGUID: tB/SGKnTSLmhUwyDQX2WPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="25888880"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="25888880"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 10:12:36 -0700
X-CSE-ConnectionGUID: xgJPT7dTT5qLlCLXfk6sBQ==
X-CSE-MsgGUID: pvYuNcbgTsaq0f1Dc/UYog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="59360357"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa006.fm.intel.com with ESMTP; 16 Aug 2024 10:12:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 71E32213; Fri, 16 Aug 2024 20:12:32 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Narasimhan.V@amd.com,
	Borislav Petkov <bp@alien8.de>,
	Kim Phillips <kim.phillips@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v1 1/7] i2c: designware: Replace a while-loop by for-loop
Date: Fri, 16 Aug 2024 20:01:59 +0300
Message-ID: <20240816171225.3506844-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240816171225.3506844-1-andriy.shevchenko@linux.intel.com>
References: <20240816171225.3506844-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace a while-loop by for-loop in i2c_dw_probe_lock_support() to
save a few lines of code.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index df3dc1e8093e..d092532375b8 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -238,11 +238,9 @@ static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
 	int i = 0;
 	int ret;
 
-	ptr = i2c_dw_semaphore_cb_table;
-
 	dev->semaphore_idx = -1;
 
-	while (ptr->probe) {
+	for (ptr = i2c_dw_semaphore_cb_table; ptr->probe; ptr++) {
 		ret = ptr->probe(dev);
 		if (ret) {
 			/*
@@ -254,7 +252,6 @@ static int i2c_dw_probe_lock_support(struct dw_i2c_dev *dev)
 				return ret;
 
 			i++;
-			ptr++;
 			continue;
 		}
 
-- 
2.43.0.rc1.1336.g36b5255a03ac


