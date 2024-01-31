Return-Path: <linux-i2c+bounces-1551-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA268441A0
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jan 2024 15:17:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 108D41F21C9D
	for <lists+linux-i2c@lfdr.de>; Wed, 31 Jan 2024 14:17:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA440762DD;
	Wed, 31 Jan 2024 14:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J91xAfFS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1377F48F
	for <linux-i2c@vger.kernel.org>; Wed, 31 Jan 2024 14:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706710630; cv=none; b=rzuLdX1ZHIeR6QTJlMAa24igr4Q8jup1ElSdlCcem+uN0TclLOcO2b8eLTbhVayDjCj7e0dpp0MhAn8+rDU1jJ0QZ3aAAitvYdbOfDrnZLCBddt6j0FdjMsWARsHL3HTGNEskmXVLoAd08w3N8md+fjgyFqbktS+jfpUBlnQ/U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706710630; c=relaxed/simple;
	bh=akMZVlRhyYPVYCgoLK4kigOX0GhWH89ROyd8cQBrtho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L6yA0Au/AKOtuucLZpcp0MJW8W0gWaWTjuZ23M1aX1JRAWUmakDga6C9v4gvzYuAhE9LM223qz9x27Y/KXY+YFkP1O0OZGUcQMMLSVQ3UpBuN9kZgNEIyUvPijbKgz4B8fPOrCTFsqkgcCxPKTWjnXv0VFTD/g1l1ypIekl678A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J91xAfFS; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706710630; x=1738246630;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=akMZVlRhyYPVYCgoLK4kigOX0GhWH89ROyd8cQBrtho=;
  b=J91xAfFS1UnryejWh85+SVZpmDzbni/6wtABrFtZVOO652rGJeOyLHB6
   Uifw808YUz66ILms/FVwhxzdS4rSP8Whm9Sd8VGRJ5aCGRSnO3T8IH9Nh
   v35ckPHfAyBMshPVUwiSBDypxxoQ0NzzUtV4ud6i5QDp0RD1J5rznCcko
   rffmQbqd4736tZ3WLnpzj92yjQQ98YnNT6/ZReC9rG5MKP/Hh+JVsgZuD
   Hj/vDk5ty0s0sEgOPS1sLpqsR2WRwYcRvzQAlhpc6HZnXl3NWjtpoiGiK
   lqhMhzEEQa/74deCXjB/XPCq4kdS6OT0drnCC8vB4h57nmk6wQndf4ddE
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="3460453"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="3460453"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 06:17:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="788591852"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="788591852"
Received: from unknown (HELO mylly.fi.intel.com.) ([10.237.72.79])
  by orsmga002.jf.intel.com with ESMTP; 31 Jan 2024 06:16:59 -0800
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
To: linux-i2c@vger.kernel.org
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>, Jiawen Wu <jiawenwu@trustnetic.com>,
	Sanket Goswami <Sanket.Goswami@amd.com>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Ruhl@web.codeaurora.org, Michael J <michael.j.ruhl@intel.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH 1/6] i2c: designware: Uniform initialization flow for polling mode
Date: Wed, 31 Jan 2024 16:16:47 +0200
Message-ID: <20240131141653.2689260-2-jarkko.nikula@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240131141653.2689260-1-jarkko.nikula@linux.intel.com>
References: <20240131141653.2689260-1-jarkko.nikula@linux.intel.com>
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


