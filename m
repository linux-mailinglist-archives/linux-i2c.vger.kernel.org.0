Return-Path: <linux-i2c+bounces-5485-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC0D9565C1
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 10:40:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B4E061F22E22
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 08:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA74715C133;
	Mon, 19 Aug 2024 08:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="etrLq4vR"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2D915B14C;
	Mon, 19 Aug 2024 08:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724056817; cv=none; b=QNuM3sVBUSf+XANaIVtzl2FtwdYD+GbGDKqST51XmC3hPahh7wE6uOTgBbnoHKxULmW7elTXFhH8gEXQ3oXaccGIBb173QKDvTO4nyYmmedGgQtoiES5ixnKpjiWwKMYDoGLXt09+FOpKhtCxNuv4pr6gC0ax2uhu2SKIIDUuYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724056817; c=relaxed/simple;
	bh=JeD6dx8LkKLsb4f1jGNEIeW+t/ve0YFKAf5hq/Jb5G8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rGttRgP4ypnMSLNmZPQpJ0tXvNkr4OF2efSwFaYglx7/Ifw8k+Fy4NfEEFGrMlLtYPZ1KLrulhaTctDn2TODYEsjo75ZULbqZwmKaxZPsY6eDfUpFMBwVVmdzcuZnSVS9A4jGkSNdvGcnvVBjgArrVCSZtJ9kEzWuUdo9NScnKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=etrLq4vR; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724056816; x=1755592816;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JeD6dx8LkKLsb4f1jGNEIeW+t/ve0YFKAf5hq/Jb5G8=;
  b=etrLq4vRgwLOfGmJdKsckUG3I4rTTltceRTyHGFsOaRgGSXkTaNgFvYr
   BVP8kfmiTUGCFM2+ltCdPUNko1R97Qn5+rSxrjw/y3xYnBF23U0L8NNLb
   Ckk6QWlBF2cHAkIhZMjxolbCnoK/CVmIbxYzuhi1AHc41KYblnAlc0m6Y
   0OXht1x4RuVrm/+7TEIftg7NaiQS/GXaxWt7p+9pyOF3VhpC+OpZiq4iW
   XDTCPfHbaBF/KqvMI74WQqYsp1ijomAZShxPdvGk+T3SJn8IBKSjSEGKf
   whFwoqGNfga4Gy0X2xXMjMSzNsw33E88HbRkcudWAaClh9Q6S2re8tZd3
   A==;
X-CSE-ConnectionGUID: +XEg5bSVQHyxGc0S0/z9MQ==
X-CSE-MsgGUID: ZazoBwPdRRu6uC/XU/Jvdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11168"; a="21834852"
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="21834852"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 01:40:13 -0700
X-CSE-ConnectionGUID: f08XVrIYRYC7I561LKWXbg==
X-CSE-MsgGUID: HBOILHGCQoyhdIAVg6SiyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,158,1719903600"; 
   d="scan'208";a="91080186"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa001.fm.intel.com with ESMTP; 19 Aug 2024 01:40:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id D8505164; Mon, 19 Aug 2024 11:40:08 +0300 (EEST)
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
Subject: [PATCH v2 1/7] i2c: designware: Replace a while-loop by for-loop
Date: Mon, 19 Aug 2024 11:39:05 +0300
Message-ID: <20240819084007.3700433-2-andriy.shevchenko@linux.intel.com>
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


