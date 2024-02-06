Return-Path: <linux-i2c+bounces-1643-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BB12184B879
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 15:54:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ED6ACB2E06C
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 14:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147EE132C13;
	Tue,  6 Feb 2024 14:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jky/c+8L"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687F613248D
	for <linux-i2c@vger.kernel.org>; Tue,  6 Feb 2024 14:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707231138; cv=none; b=XcjRxdFORtZz74LQt8+J1YzrYgUtEO7kjs7hIgo8AqpRvar5yzyN90e2D65MgFWeC7/XQbiQR/4wAxKEhFBHaHCapNxxIaD7KtyELdj7hi4iCj57ydeCtpR5Ai5pL8yhwYno+M5E2cctiRRiUgSs1JBtE2pHr4VKKVKadOwoLIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707231138; c=relaxed/simple;
	bh=G/LdQdyvkNe9+2Q1hCbMEiqDjUsESN22cr+x9wkcxbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qssbtYUTnn9rjMux/14ZY/kjXN6BDZZoSirF1RaiCHKVQaVOlkALOX3kjAy82Ttha1il5nN3bRLgmimtoiGOu55a5P78Aof6Q28k6TG3zxx+M3fv1GHRhxEOEsTgGHi7fQ7+6cMh3/N0hx6Nen0yqOgUF2NqqaGeg72H53LI6Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jky/c+8L; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707231137; x=1738767137;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=G/LdQdyvkNe9+2Q1hCbMEiqDjUsESN22cr+x9wkcxbo=;
  b=jky/c+8LiiJ66wQvCFWs1ifuiTH1H5gpt3YIgsPs0iY0SvJgDUMbRPdP
   QwRRoFOED5OiSILy15wvbhaPWMthiaMJxBH5X8EepkBoSOYUIyohdqRXQ
   0U7JufB4mtnAtMTnQDWiQEcCLWm/yy2mx+gEPVEqdL5Ul/lBYeEd8DbmT
   EXh2gAtAjZ1rXxuvZi8v8pzLFXpUUtk0dTToT3EsXkomCzYtSQ8bwyHWV
   0epRrJCPQe8UubBfbGHpcfFEOW9jEPxQXAt03ugHF41FNhhoOgnSC2cE2
   WkOO7u/xaTn0bqy6D/KGV1kvg3Mj9dA3totNzuzRg8Yn4Nd9B+t64L/9G
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="26206624"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="26206624"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 06:52:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="933481937"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="933481937"
Received: from marquiz-s-2.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.58])
  by fmsmga001.fm.intel.com with ESMTP; 06 Feb 2024 06:52:11 -0800
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	Sanket Goswami <Sanket.Goswami@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	michael.j.ruhl@intel.com,
	Hans de Goede <hdegoede@redhat.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v2 3/9] i2c: designware: Convert shared_with_punit boolean as semaphore type
Date: Tue,  6 Feb 2024 16:51:52 +0200
Message-ID: <20240206145158.227254-4-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240206145158.227254-1-jarkko.nikula@linux.intel.com>
References: <20240206145158.227254-1-jarkko.nikula@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the shared_with_punit member variable from the struct dw_i2c_dev
and make it one semaphore type. Idea is to make code more uniform when
there is need to differentiate between bus semaphores.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-baytrail.c | 2 +-
 drivers/i2c/busses/i2c-designware-core.h     | 3 +--
 drivers/i2c/busses/i2c-designware-platdrv.c  | 8 ++++----
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-baytrail.c b/drivers/i2c/busses/i2c-designware-baytrail.c
index 45774aa47c28..159db4802cdf 100644
--- a/drivers/i2c/busses/i2c-designware-baytrail.c
+++ b/drivers/i2c/busses/i2c-designware-baytrail.c
@@ -38,7 +38,7 @@ int i2c_dw_baytrail_probe_lock_support(struct dw_i2c_dev *dev)
 	dev_info(dev->dev, "I2C bus managed by PUNIT\n");
 	dev->acquire_lock = iosf_mbi_block_punit_i2c_access;
 	dev->release_lock = iosf_mbi_unblock_punit_i2c_access;
-	dev->shared_with_punit = true;
+	dev->flags |= SEMAPHORE_INTEL_PUNIT;
 
 	return 0;
 }
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index bac0aec3cb15..30b29d6e58ce 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -235,7 +235,6 @@ struct reset_control;
  * @release_lock: function to release a hardware lock on the bus
  * @semaphore_idx: Index of table with semaphore type attached to the bus. It's
  *	-1 if there is no semaphore.
- * @shared_with_punit: true if this bus is shared with the SoCs PUNIT
  * @disable: function to disable the controller
  * @init: function to initialize the I2C hardware
  * @set_sda_hold_time: callback to retrieve IP specific SDA hold timing
@@ -292,7 +291,6 @@ struct dw_i2c_dev {
 	int			(*acquire_lock)(void);
 	void			(*release_lock)(void);
 	int			semaphore_idx;
-	bool			shared_with_punit;
 	void			(*disable)(struct dw_i2c_dev *dev);
 	int			(*init)(struct dw_i2c_dev *dev);
 	int			(*set_sda_hold_time)(struct dw_i2c_dev *dev);
@@ -304,6 +302,7 @@ struct dw_i2c_dev {
 #define ACCESS_NO_IRQ_SUSPEND			BIT(1)
 
 #define SEMAPHORE_AMD_PSP			(1 << 4)
+#define SEMAPHORE_INTEL_PUNIT			(2 << 4)
 #define SEMAPHORE_MASK				GENMASK(7, 4)
 
 #define MODEL_MSCC_OCELOT			(1 << 8)
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index efe9b8e0b7a2..c07385c20cee 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -181,7 +181,7 @@ static void dw_i2c_plat_pm_cleanup(struct dw_i2c_dev *dev)
 {
 	pm_runtime_disable(dev->dev);
 
-	if (dev->shared_with_punit)
+	if ((dev->flags & SEMAPHORE_MASK) == SEMAPHORE_INTEL_PUNIT)
 		pm_runtime_put_noidle(dev->dev);
 }
 
@@ -381,7 +381,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 
-	if (dev->shared_with_punit)
+	if ((dev->flags & SEMAPHORE_MASK) == SEMAPHORE_INTEL_PUNIT)
 		pm_runtime_get_noresume(&pdev->dev);
 
 	pm_runtime_enable(&pdev->dev);
@@ -433,7 +433,7 @@ static int dw_i2c_plat_runtime_suspend(struct device *dev)
 {
 	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
 
-	if (i_dev->shared_with_punit)
+	if ((i_dev->flags & SEMAPHORE_MASK) == SEMAPHORE_INTEL_PUNIT)
 		return 0;
 
 	i_dev->disable(i_dev);
@@ -455,7 +455,7 @@ static int dw_i2c_plat_runtime_resume(struct device *dev)
 {
 	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
 
-	if (!i_dev->shared_with_punit)
+	if ((i_dev->flags & SEMAPHORE_MASK) != SEMAPHORE_INTEL_PUNIT)
 		i2c_dw_prepare_clk(i_dev, true);
 
 	i_dev->init(i_dev);
-- 
2.43.0


