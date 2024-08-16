Return-Path: <linux-i2c+bounces-5464-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80125954FBD
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 19:13:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 00DD51F2342C
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 17:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C791C2315;
	Fri, 16 Aug 2024 17:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RO+EXmqf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189B11C2307;
	Fri, 16 Aug 2024 17:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723828361; cv=none; b=WnI/Av5b8a0sYwe+kKKuiTw+cZ/xcHEdpYDg7u5Sb6UiYsaUusUCijCYqHKc+IhHx0yCCMFRZoldt4lkU6rjU+POttaMnraSc9xvYGlEt0/Nkbji5JejBBgrTWNY/grYy6lmxSynZztAKItVO43gSTr9vHIuF2xPmzbYMpLfq2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723828361; c=relaxed/simple;
	bh=Azq9qB8c+ZqCCIl0U60dNZORg3VJLIGkiKwQHx+8jz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CibdHxSO+bUKzq2WYBD8h/ytR7S20wMWx/pMlK5RZStpQZZl9qrgMhWbzoiXFjkPyD3cgoitpGM/aiQLhy5ZHmcDo6sMhkkNbvDMXZTneNf6OVMS6WutOQMLFuw3hWGgfL5NPDkyV8gY92z0MoYfGkvon+Cd0F1qTn1OI+RBW6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RO+EXmqf; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723828360; x=1755364360;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Azq9qB8c+ZqCCIl0U60dNZORg3VJLIGkiKwQHx+8jz4=;
  b=RO+EXmqfTHh2jWnxVNQU8AltvNIpEhEOzghdcYVm+AMX/WMtqRzXeRyt
   xfa1hzr0dHCRU0rwt2gmSuUef50apvpMlPLwY0NSgu/UQdicPS262tovZ
   5d64wdo1jCXbj1DYFIcrAbchBGkoe1Ibc9vDcwmOJa/5co8YX6urLvCxN
   dm6lGCIvJ+U82A8CshQEoc5CW0qw8BjwIIsIEAPZAqw+M7L/IPifAybNP
   cKaTTIntmKfi7A3jqmiCiLJjGjegnTBQZjDJ1a8zjC9W0HawxFAEpAxs+
   zLK8APqEPZ/2CzhiyMJG0g+J5IAAigpEgspPud5ns3qi1L9pCwd61aKVM
   g==;
X-CSE-ConnectionGUID: lFE2KSq2QFuNdcQXilxasg==
X-CSE-MsgGUID: ApgzBaIHTsGeqQ6n1Q0+Dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22101739"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="22101739"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 10:12:40 -0700
X-CSE-ConnectionGUID: 5l52B8chR5W0B7BNtbvLJg==
X-CSE-MsgGUID: SorZKKYIQBOKPvmppXlgZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="97233141"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa001.jf.intel.com with ESMTP; 16 Aug 2024 10:12:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id C32113B7; Fri, 16 Aug 2024 20:12:32 +0300 (EEST)
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
Subject: [PATCH v1 7/7] i2c: designware: Drop return value from dw_i2c_of_configure()
Date: Fri, 16 Aug 2024 20:02:05 +0300
Message-ID: <20240816171225.3506844-8-andriy.shevchenko@linux.intel.com>
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
index 905557c7dfa4..0ea6c95ee60e 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -133,7 +133,7 @@ static int mscc_twi_set_sda_hold_time(struct dw_i2c_dev *dev)
 	return 0;
 }
 
-static int dw_i2c_of_configure(struct platform_device *pdev)
+static void dw_i2c_of_configure(struct platform_device *pdev)
 {
 	struct dw_i2c_dev *dev = platform_get_drvdata(pdev);
 
@@ -146,8 +146,6 @@ static int dw_i2c_of_configure(struct platform_device *pdev)
 	default:
 		break;
 	}
-
-	return 0;
 }
 #else
 static int bt1_i2c_request_regs(struct dw_i2c_dev *dev)
@@ -155,9 +153,8 @@ static int bt1_i2c_request_regs(struct dw_i2c_dev *dev)
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


