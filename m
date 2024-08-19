Return-Path: <linux-i2c+bounces-5543-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 43EBF9573E8
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 20:47:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 02DB31F2456E
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Aug 2024 18:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF90D18B465;
	Mon, 19 Aug 2024 18:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jwwWSRZv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE28018A6BC;
	Mon, 19 Aug 2024 18:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724093170; cv=none; b=mEcnL5esJtvzdy/LcUiishRGZqQH0J+bsBuK+UVwaBDdKTy01hSbq1RxfEkUiW4ZMsG6ILCdcyC4RDNVtqZrw/nNw0JBOHvZjChKvtYg1/SZfK59wGVTJrfKhXSZDgbJax/1Zrnt6Nd1bPCt5Fm/uOKZWzJZM58fn3aw8HApzc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724093170; c=relaxed/simple;
	bh=orz/0lF6uAuaBB453PuZmPXmD0diGdVSoe/F0+vR7qU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Vu0f03S07ZHFgLWyRQzV6gUBYJQKw7TszEtQ5gdLNejr0s4VWr6aRRiWSlW3434+o/SOlknqQeECppPt20QJDtWhpX4DUW8u3/tZyirAe3GoonscnTvOs9wjjOGqu1P5bLnRN2cMuN/yc79XUDHLrZy419zQ/6VhLyJ+Wv0DW0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jwwWSRZv; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724093169; x=1755629169;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=orz/0lF6uAuaBB453PuZmPXmD0diGdVSoe/F0+vR7qU=;
  b=jwwWSRZvLWMzWbq8YL53uF/w5T8zFXSYoWdTt7jbQzszCBh2jq6CPYJ/
   pRps1v2mb+TkdF2oR3A85fAGKRIUC4czu8dlwN611FaAh7D3lYNtd/8P8
   AeUY78ebGqQFx7jgeO6SDflR3BCX44AJrWzRbrIdHF4IcT7dqbUVqjTSR
   EvSEC9j6rwt1K7OfdQqdn5vTp0erGFwr5GDktchv7Uw1KLsrkj+BCxHMC
   FmezLggO36poSsJY9Sp/CpjR/sxroe8wC6YwDgoTuOE94xzFSHus+tEUM
   WSEnOSxkfbyhDfB0gBIeQmXsx+nP+VgHBBDuVLjYz0pW0qS18prSMcwV/
   g==;
X-CSE-ConnectionGUID: lhLo1ZF+T9y+iXoxkxrIsw==
X-CSE-MsgGUID: WhTtT+nLQKWCyawWNVo/xA==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="22537659"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="22537659"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 11:46:09 -0700
X-CSE-ConnectionGUID: B1J5UmGuQIumBX9gHdlP0w==
X-CSE-MsgGUID: G4DK/AxpToCPUkNoe0O4fQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="60433958"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa009.jf.intel.com with ESMTP; 19 Aug 2024 11:46:06 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 6E7E77CA; Mon, 19 Aug 2024 21:46:01 +0300 (EEST)
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
Subject: [PATCH v3 7/7] i2c: designware: Drop return value from dw_i2c_of_configure()
Date: Mon, 19 Aug 2024 21:45:13 +0300
Message-ID: <20240819184600.2256658-8-andriy.shevchenko@linux.intel.com>
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
index c1e1344c3fc6..cd24d2b8becf 100644
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


