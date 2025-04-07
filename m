Return-Path: <linux-i2c+bounces-10184-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 634DDA7E572
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 18:00:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7786017BEA3
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Apr 2025 15:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20B792063F5;
	Mon,  7 Apr 2025 15:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFpPcld7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB44205516;
	Mon,  7 Apr 2025 15:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744040987; cv=none; b=a7oN1gmBSHWICaDIM0hvXypCJ1R41VxjH1u89BKk0KSPiOIyixtR5UzCcGxcor3UgWLAdVY+GXCLk8sBqp4zOlRngVTu3Bpd+2akhw7Y9p6ybXL9U1MjriVXugMV6zmyrSnrgS6p8pSNFlZqb+51dvjlC1Iuy/9RWGHSQGE6bGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744040987; c=relaxed/simple;
	bh=dw6/Y8A47coxQ1l+IbbwY/SUQFFk8DGXqjOvl2SPSdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=udSHbCNOA/uD50C+GiN5AfFN0jpKdC/rqeFkHSvK+5k8JG6YJl5ngOWyxSADCO2X7Mt1GckX8pOYgLgzEliG5KE0WAfT/XwndqmPZNbSEW53igOvnhqQn6NaonN69jP23OuQY6/K2TMEdWQ6KnMKINYJ471+HZ9nOivUCZTq9mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFpPcld7; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744040986; x=1775576986;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dw6/Y8A47coxQ1l+IbbwY/SUQFFk8DGXqjOvl2SPSdI=;
  b=oFpPcld7VWa0Da8HYHAasiu67VEo1X6tHESp1Kh3fGeI3LC3QclET2Wz
   lmb8q+CqsCJQ2lpvIHghuogIeKaMgwQww0NNH7ddPYT503yb5wiP5dtG6
   gNVn7gz2Ca5UY8NtirISrRHyaFXetKA5TX8vginmq40KtU6CoWqfxcTDQ
   NrP8vX/PABznRzZ7ovmoZLgpDuMYQVBVLvllAxuj8edxdJ20L3H8g7B4n
   hOYHmkZnCsIVW58RnQOLX6lrOBCdc16mTCEC6Vkm7SdaWX8YWgtJQQu+f
   heqftO2+LzNNFj0cI23zzOMb/o9gYU7pb/flcokDCIfv5FwdWkX7ijUMY
   A==;
X-CSE-ConnectionGUID: Rc4qNIUJRTiieb1WJqEzGg==
X-CSE-MsgGUID: KZJlWu4+RJGq3qJSiaQa6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45555072"
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="45555072"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 08:49:46 -0700
X-CSE-ConnectionGUID: Dr0I3IDmTfSOBhdbomBqUA==
X-CSE-MsgGUID: 6bxPVgKsTsqeV9RuH5Ddig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,194,1739865600"; 
   d="scan'208";a="158986667"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 07 Apr 2025 08:49:43 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C75D430E; Mon, 07 Apr 2025 18:49:38 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH v3 6/7] i2c: core: Deprecate of_node in struct i2c_board_info
Date: Mon,  7 Apr 2025 18:45:02 +0300
Message-ID: <20250407154937.744466-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250407154937.744466-1-andriy.shevchenko@linux.intel.com>
References: <20250407154937.744466-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two members of the same or similar semantics is quite confusing to begin with.
Moreover, the fwnode covers all possible firmware descriptions that Linux kernel
supports. Deprecate of_node in struct i2c_board_info, so users will be warned
and in the future remote it completely.

Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/i2c.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 2e4903b7f7bc..cc1437f29823 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -405,7 +405,7 @@ static inline bool i2c_detect_slave_mode(struct device *dev) { return false; }
  * @addr: stored in i2c_client.addr
  * @dev_name: Overrides the default <busnr>-<addr> dev_name if set
  * @platform_data: stored in i2c_client.dev.platform_data
- * @of_node: pointer to OpenFirmware device node
+ * @of_node: **DEPRECATED** - use @fwnode for this
  * @fwnode: device node supplied by the platform firmware
  * @swnode: software node for the device
  * @resources: resources associated with the device
-- 
2.47.2


