Return-Path: <linux-i2c+bounces-1695-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8D08530DE
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Feb 2024 13:49:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 438311C22675
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Feb 2024 12:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8912D41C75;
	Tue, 13 Feb 2024 12:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZWBj3ggl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA325405D8
	for <linux-i2c@vger.kernel.org>; Tue, 13 Feb 2024 12:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707828537; cv=none; b=r5MMKPh0LQSvi+TAubKj2V+RBvMSfENhy76CQ0yft8pNvR08YuhdTomLVxW9D1AQnWw80JiZ6brPGFuxzOkGi5xOvaNjRhTEk5rvqTgwUTBYsC2KJn6SyyDI6SqrkWPl56A8OKENj3zV+1VssJzIrJmeY+UAh0Qvhqnyn8zZGD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707828537; c=relaxed/simple;
	bh=akMZVlRhyYPVYCgoLK4kigOX0GhWH89ROyd8cQBrtho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HwFFyVGiZPdn4fgLTIM4sR0tOMOhX9HQbkSbwaRS6pLAlcEVLLAssoPMIYhJJs84XPMPozq1YKYMsfwkuRxssSPgpkxFhX1o6mOR+Qp2l+i/ngYphWE0PvlSLyxEKo2jgYXzJLvWPfrf3lJXW7ZS9EkONvQJEIXtZyKXIpYuRT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZWBj3ggl; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707828536; x=1739364536;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=akMZVlRhyYPVYCgoLK4kigOX0GhWH89ROyd8cQBrtho=;
  b=ZWBj3ggl+aD+tw7yQD/z8j7yRh6Ay5edSy/PTy/KinMNEs6WIQ/q7s0b
   9O5Y6x7TAuTBmUKU9SDk829muRB8hVI04J55c9TRRiFZEEwzW+qlBhVoi
   GG+D0GEpXPLc3dZqLEsTJdglAzn3vgZIxc2lSHSBAXd8EfuG5gKK29SlV
   ruXVXkU9PURMnyLh69+uhfuDXllVJVSaLWOAtUEr591xJd8ptwyxBHpzi
   VGO2xVRXtm+6rAFBth+bxGAfyBM0Q9MvAhwjDElwWXG7Jmc3gylEIz0J3
   /sioiA7m18aiip06Ftw1LDm83yJNJhWz5p5pW7lsjP5z06mH2/Asfgpsb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="12467226"
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="12467226"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 04:48:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,157,1705392000"; 
   d="scan'208";a="7486637"
Received: from marquiz-s-2.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.58])
  by fmviesa004.fm.intel.com with ESMTP; 13 Feb 2024 04:48:53 -0800
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
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH v3 1/6] i2c: designware: Uniform initialization flow for polling mode
Date: Tue, 13 Feb 2024 14:48:42 +0200
Message-ID: <20240213124847.672084-2-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240213124847.672084-1-jarkko.nikula@linux.intel.com>
References: <20240213124847.672084-1-jarkko.nikula@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently initialization flow in i2c_dw_probe_master() skips a few steps
and has code duplication for polling mode implementation.

Simplify this by adding a new ACCESS_POLLING flag that is set for those
two platforms that currently use polling mode and use it to skip
interrupt handler setup.

Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
---
 drivers/i2c/busses/i2c-designware-core.h    |  1 +
 drivers/i2c/busses/i2c-designware-master.c  | 42 ++++-----------------
 drivers/i2c/busses/i2c-designware-pcidrv.c  |  2 +-
 drivers/i2c/busses/i2c-designware-platdrv.c |  2 +-
 4 files changed, 11 insertions(+), 36 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index a7f6f3eafad7..78c8062a8eb5 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -303,6 +303,7 @@ struct dw_i2c_dev {
 #define ACCESS_INTR_MASK			BIT(0)
 #define ACCESS_NO_IRQ_SUSPEND			BIT(1)
 #define ARBITRATION_SEMAPHORE			BIT(2)
+#define ACCESS_POLLING				BIT(3)
 
 #define MODEL_MSCC_OCELOT			BIT(8)
 #define MODEL_BAIKAL_BT1			BIT(9)
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 85dbd0eb5392..e879a0f5cc97 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -953,31 +953,6 @@ static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
 	return 0;
 }
 
-static int i2c_dw_poll_adap_quirk(struct dw_i2c_dev *dev)
-{
-	struct i2c_adapter *adap = &dev->adapter;
-	int ret;
-
-	pm_runtime_get_noresume(dev->dev);
-	ret = i2c_add_numbered_adapter(adap);
-	if (ret)
-		dev_err(dev->dev, "Failed to add adapter: %d\n", ret);
-	pm_runtime_put_noidle(dev->dev);
-
-	return ret;
-}
-
-static bool i2c_dw_is_model_poll(struct dw_i2c_dev *dev)
-{
-	switch (dev->flags & MODEL_MASK) {
-	case MODEL_AMD_NAVI_GPU:
-	case MODEL_WANGXUN_SP:
-		return true;
-	default:
-		return false;
-	}
-}
-
 int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 {
 	struct i2c_adapter *adap = &dev->adapter;
@@ -1033,9 +1008,6 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 	adap->dev.parent = dev->dev;
 	i2c_set_adapdata(adap, dev);
 
-	if (i2c_dw_is_model_poll(dev))
-		return i2c_dw_poll_adap_quirk(dev);
-
 	if (dev->flags & ACCESS_NO_IRQ_SUSPEND) {
 		irq_flags = IRQF_NO_SUSPEND;
 	} else {
@@ -1049,12 +1021,14 @@ int i2c_dw_probe_master(struct dw_i2c_dev *dev)
 	regmap_write(dev->map, DW_IC_INTR_MASK, 0);
 	i2c_dw_release_lock(dev);
 
-	ret = devm_request_irq(dev->dev, dev->irq, i2c_dw_isr, irq_flags,
-			       dev_name(dev->dev), dev);
-	if (ret) {
-		dev_err(dev->dev, "failure requesting irq %i: %d\n",
-			dev->irq, ret);
-		return ret;
+	if (!(dev->flags & ACCESS_POLLING)) {
+		ret = devm_request_irq(dev->dev, dev->irq, i2c_dw_isr,
+				       irq_flags, dev_name(dev->dev), dev);
+		if (ret) {
+			dev_err(dev->dev, "failure requesting irq %i: %d\n",
+				dev->irq, ret);
+			return ret;
+		}
 	}
 
 	ret = i2c_dw_init_recovery_info(dev);
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 61d7a27aa070..9be9a2658e1f 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -154,7 +154,7 @@ static int navi_amd_setup(struct pci_dev *pdev, struct dw_pci_controller *c)
 {
 	struct dw_i2c_dev *dev = dev_get_drvdata(&pdev->dev);
 
-	dev->flags |= MODEL_AMD_NAVI_GPU;
+	dev->flags |= MODEL_AMD_NAVI_GPU | ACCESS_POLLING;
 	dev->timings.bus_freq_hz = I2C_MAX_STANDARD_MODE_FREQ;
 	return 0;
 }
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index 855b698e99c0..4ab41ba39d55 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -290,7 +290,7 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
 
 	dev->flags = (uintptr_t)device_get_match_data(&pdev->dev);
 	if (device_property_present(&pdev->dev, "wx,i2c-snps-model"))
-		dev->flags = MODEL_WANGXUN_SP;
+		dev->flags = MODEL_WANGXUN_SP | ACCESS_POLLING;
 
 	dev->dev = &pdev->dev;
 	dev->irq = irq;
-- 
2.43.0


