Return-Path: <linux-i2c+bounces-5538-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBED39573DF
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 20:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C4D81C20E33
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 18:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABAEE189BAF;
	Mon, 19 Aug 2024 18:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JVrDm5I9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A72B189915;
	Mon, 19 Aug 2024 18:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724093167; cv=none; b=YeQ/Ha1Utvz2u9ySlPYhSO0FMn+EYUUqmsKwJqtN0UE9xsKZ9KeZZ6EaWDjE+k1pKWzqrCP+MS+Ar2RNGo+e5TQC2vMGvyEJWt4a+0KChbLNDnQx9PmY/IpDfpDfQU1pAlIF/Zt4lcKAIi0XIfU0jFowKBWtFAh5PSqsr2NeJQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724093167; c=relaxed/simple;
	bh=JeD6dx8LkKLsb4f1jGNEIeW+t/ve0YFKAf5hq/Jb5G8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kGeuO5VAEXASn/rB+y93qvTYL0sbi/N7zHjSxEQww+g9KoU4ccOFZMEKtBeFdb63ph6S7czg6r3wze2eMZMNKT7EyMcbozZUZN7UFRR7eyNkHPfLbK5tJ8W8y/5vs4/6nYAipHBcB+eRKczo67H9agTYcV1AD+hcnOGqC9stz+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JVrDm5I9; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724093166; x=1755629166;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JeD6dx8LkKLsb4f1jGNEIeW+t/ve0YFKAf5hq/Jb5G8=;
  b=JVrDm5I9nZb57ebRTXMhAvjfK7u+2bMOws2VeKp2iAe4TEtsKT94cU3K
   eEPtLjzCgG8j6HwQsTXBl8sewYoInCVrESv1sYswQQAyfxmuyxZr3xS3z
   tvy3dpVyWJ1E3NG/nRfNnk5r2ZZ3YwYXr5VV1uWuw+uB/JCKuHLocWeWV
   qleJ6h0Y0UXfSjNQaiLuqEbCW3H2nm7EWkqI/hL4zJagB3SenXvu0dbny
   FL5dXF0eG2T7pIeo6nEl42tbgo1wGRa5od3CGYDdC0LPl2ocxjt6kH1ny
   /PSxnuCm8rTGBT7PAHorzFkC5pOCZGoH+QbemRD3dTLGHIfcqhAF/nRiw
   A==;
X-CSE-ConnectionGUID: CjkCzlbiT2qgcn+gWZsUtA==
X-CSE-MsgGUID: TzCQlZZjSY2dcATnXXYY2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="21902302"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="21902302"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 11:46:05 -0700
X-CSE-ConnectionGUID: zOLOSkmyQpaaA9jOp7Z9vA==
X-CSE-MsgGUID: zTPi4leaTGedagulTld4Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="83671052"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa002.fm.intel.com with ESMTP; 19 Aug 2024 11:46:02 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 16E152AA; Mon, 19 Aug 2024 21:46:01 +0300 (EEST)
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
Subject: [PATCH v3 1/7] i2c: designware: Replace a while-loop by for-loop
Date: Mon, 19 Aug 2024 21:45:07 +0300
Message-ID: <20240819184600.2256658-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240819184600.2256658-1-andriy.shevchenko@linux.intel.com>
References: <20240819184600.2256658-1-andriy.shevchenko@linux.intel.com>
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


