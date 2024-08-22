Return-Path: <linux-i2c+bounces-5698-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2507D95BDEC
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 20:05:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8E8B9B25F0C
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 18:05:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34D041D0DC5;
	Thu, 22 Aug 2024 18:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eflP1u1/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785D91CF2AF;
	Thu, 22 Aug 2024 18:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724349867; cv=none; b=YN4q2Q24fzSA760uo3t3ii2YO0xR3q1eOmIyEAxaKOUtL94pw8pQAHqJhf1ysNJfK/bhCWnic83QqBQY++QMP55/uebBK/xdWyvlfD3TrNzVdbzzUNggoSpaq2U0Outmxb59N8AN9UrcH1/0TxbO6H6YKEfFWBBsr4EukW9ktz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724349867; c=relaxed/simple;
	bh=+BKVVtf/v0HbG+gOMvddYZA8yuI36a4N7ul6v8KrfnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kFtixP5LNpEcVSOFLkgCUnUOGr+jOP+TmkHGqxK8pJ/0NmppfNeHqFWcUj2tJ2k7/CawoaZFB+ud0tcC3w8VpYjL776DZWL3eabq8bGdupntkk+wFtz4zom03ZBLGveFy2W6kHwSOE+rkRNluSmCU/EOJhW1hr4P6UfWTTZnX2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eflP1u1/; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724349865; x=1755885865;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+BKVVtf/v0HbG+gOMvddYZA8yuI36a4N7ul6v8KrfnY=;
  b=eflP1u1/LsL1q0qNR0xeUoeoUGkPpFNvMZeq/x+gSVzTMjmhjBBeHQ9C
   Sckpka5qTpOQVR08H22wA/DQbd52JkW7G19yA2N5pA/IvQTpCGIIuseom
   DBBgq+ucX0zNNSk6kf9X46ggks89SAMrbKPL9H7WOKkF3pdINgdPdPjs2
   FIO9JQ20VQCfqzPFujxMsrGtjFWCslPz5KZlUD5IouUxW3Nd/bhN185jt
   GnnHuw/6zB0zTCkp+dRT7IsXqYVXty5ukY1j94JMZb9mHXJPYrSWM/8Oo
   iP10B8kr3OZZfDHWaxL0SFndXw7gkSHP2Wy9sf2KRkyorNbDAQmG0nyCp
   w==;
X-CSE-ConnectionGUID: 939DClVVQxucmpS6LrQaCA==
X-CSE-MsgGUID: 8/VzKJDmRja+MNrvQOXOOw==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="26656205"
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="26656205"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 11:04:20 -0700
X-CSE-ConnectionGUID: wH7pBY6+SWaiM7xTNAkNRw==
X-CSE-MsgGUID: ckRQbNvzRX2qUtZh7EO3ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,167,1719903600"; 
   d="scan'208";a="62074203"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa007.jf.intel.com with ESMTP; 22 Aug 2024 11:04:16 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 5245F268; Thu, 22 Aug 2024 21:04:12 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Narasimhan.V@amd.com,
	Borislav Petkov <bp@alien8.de>,
	Kim Phillips <kim.phillips@amd.com>,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v1 1/5] i2c: designware: Rename dw_i2c_of_configure() -> i2c_dw_of_configure()
Date: Thu, 22 Aug 2024 20:58:37 +0300
Message-ID: <20240822180411.2298991-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240822180411.2298991-1-andriy.shevchenko@linux.intel.com>
References: <20240822180411.2298991-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For the sake of consistency, rename dw_i2c_of_configure() and change
its parameter to be aligned with the i2c_dw_acpi_configure().

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-platdrv.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index cd24d2b8becf..981a2d399c9f 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -110,9 +110,10 @@ static int mscc_twi_set_sda_hold_time(struct dw_i2c_dev *dev)
 	return 0;
 }
 
-static void dw_i2c_of_configure(struct platform_device *pdev)
+static void i2c_dw_of_configure(struct device *device)
 {
-	struct dw_i2c_dev *dev = platform_get_drvdata(pdev);
+	struct platform_device *pdev = to_platform_device(device);
+	struct dw_i2c_dev *dev = dev_get_drvdata(device);
 
 	switch (dev->flags & MODEL_MASK) {
 	case MODEL_MSCC_OCELOT:
@@ -130,7 +131,7 @@ static int bt1_i2c_request_regs(struct dw_i2c_dev *dev)
 	return -ENODEV;
 }
 
-static inline void dw_i2c_of_configure(struct platform_device *pdev)
+static inline void i2c_dw_of_configure(struct device *device)
 {
 }
 #endif
@@ -276,7 +277,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	i2c_dw_adjust_bus_speed(dev);
 
 	if (pdev->dev.of_node)
-		dw_i2c_of_configure(pdev);
+		i2c_dw_of_configure(&pdev->dev);
 
 	if (has_acpi_companion(&pdev->dev))
 		i2c_dw_acpi_configure(&pdev->dev);
-- 
2.43.0.rc1.1336.g36b5255a03ac


