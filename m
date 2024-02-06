Return-Path: <linux-i2c+bounces-1644-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A92484B86B
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 15:52:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD11A1C24111
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Feb 2024 14:52:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C580132C35;
	Tue,  6 Feb 2024 14:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GBeg1nsU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC06A13248D
	for <linux-i2c@vger.kernel.org>; Tue,  6 Feb 2024 14:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707231144; cv=none; b=gOSkndTIjwUR3+KFQISngnHZqhCJYmtmFptqFelWR0qItCS/FSWNfceR4nDEsjDRDlafRoaYYMxhyvVl1ygBII9TnL1HtSmaH00KJMwiQRF0PX4W0Feua0VuD89oHBvEPQlSeLk1Q38CrFXBnRF/v5CfKZwXSS+LZdAsUap1tzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707231144; c=relaxed/simple;
	bh=QIRbBieKyCpCvVN3MOvFOFPkOGERVjVcGgG8dlz91aE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nCbEwk9yL/j6qUejFqoYZCcxclXaTYuwlWfsdIey0Vfx5kNlxiExrr+iokUZf5YdxEPS+J1AEMMDP/jONvaftScGtsG2R/+CwOVg759ZoDt8zxwoPxpQ2IYkehCbsUtdjzIgXRKmH3OSPpqqhgJMgnl+NxIoLGjglepLfSRisQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GBeg1nsU; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707231143; x=1738767143;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=QIRbBieKyCpCvVN3MOvFOFPkOGERVjVcGgG8dlz91aE=;
  b=GBeg1nsU7+ydXsomu5E/ZQCW/1p5L9l/Ogp7FweV+Coiek3GpjK/Abho
   uBlCfzeLXJGHO2mkcIVRr6cRYZ1tfo2SHnRSONp/yoGyG2YVsirJkqXsf
   dJzWS0ysNRD5Wpv6s5thEVC+m0wG29d4Ue3NSkB648CoKHmzew4BldcMW
   BY0yq+I55mJGNgsFL9zRfvJE9jJm2KVvzt6aLwcehWtG/bH+GNMd1+kNy
   CTTGgPzH3L6RxivEDopDVNCysrkOWHTeQpe7ekliKkUgSMLAOhnG0b0vB
   uf7fWz1jiGXg4O/KEKskN62clAr7qL4fFvnkBvpxyVXEkYYzOVv5+C66h
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="26206646"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="26206646"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2024 06:52:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="933481964"
X-IronPort-AV: E=Sophos;i="6.05,247,1701158400"; 
   d="scan'208";a="933481964"
Received: from marquiz-s-2.fi.intel.com (HELO mylly.fi.intel.com.) ([10.237.72.58])
  by fmsmga001.fm.intel.com with ESMTP; 06 Feb 2024 06:52:14 -0800
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
Subject: [PATCH v2 4/9] i2c: designware: Uniform initialization flow for polling mode
Date: Tue,  6 Feb 2024 16:51:53 +0200
Message-ID: <20240206145158.227254-5-jarkko.nikula@linux.intel.com>
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
index 30b29d6e58ce..ee93c0b4e817 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -300,6 +300,7 @@ struct dw_i2c_dev {
 
 #define ACCESS_INTR_MASK			BIT(0)
 #define ACCESS_NO_IRQ_SUSPEND			BIT(1)
+#define ACCESS_POLLING				BIT(3)
 
 #define SEMAPHORE_AMD_PSP			(1 << 4)
 #define SEMAPHORE_INTEL_PUNIT			(2 << 4)
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
index c07385c20cee..1c9f8e0c02f8 100644
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


