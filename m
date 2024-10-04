Return-Path: <linux-i2c+bounces-7217-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 275DE99000C
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2024 11:42:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45BAF1C23864
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Oct 2024 09:42:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180A615278E;
	Fri,  4 Oct 2024 09:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TTAAY3l7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26C21487DF
	for <linux-i2c@vger.kernel.org>; Fri,  4 Oct 2024 09:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728034890; cv=none; b=qSN/p64We7SNyWEU5olzFmgzzYjj3d0cj3YJGhylc/z/HEMz11c7zTm418CzktlHRImeUA21JiRrzOylx36Pg0v3DGs17+8BUSd8fDndoPAAysQhjtCqjz9slVE0Jp89q7nciCNjcDBEKry4xKUenASMrETJ9NsPLRimZfMAMws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728034890; c=relaxed/simple;
	bh=AhrzfC5nCDvOoXtSw8UsjExriCBRrK46dbdZm3uUtVg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZJmVRD6OSgNCqvR6jMDmAgfD2S7MR7mAUU7t23nTRLElUlW9nBMUWYhUyq27l3wlZkwwjPaUSpda0NihjsYh1g5FxWyvaVPajD3IpgQ0qd7OJXgB5F8kGDQce0fw28UknDdb4PH1J8Wg6KUnn+/pwpRRZgBkgf1iyKWI5FjxL1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TTAAY3l7; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728034889; x=1759570889;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=AhrzfC5nCDvOoXtSw8UsjExriCBRrK46dbdZm3uUtVg=;
  b=TTAAY3l7b7XonZL6uuIdMPaXOSP/GLa8QrEHSBlFw+KcudSfICrUVwau
   qv+g1mRuIKdeYHOyJ9Ew2PsGUm7ndnY2iz9lVBXkaQETTe1+TfnazpBHF
   7SK7CGYiufZBPMztpfJbc86H5BWBgOhXhzrPUJTHlh887Fmj36NxOXkd6
   tGnYlVylGSQazE4BqhA3cLFwNvxPJZdulF15G7e4mP1+pIRNQzN8I+uPd
   e/BAmedZi5JY+94GVCK37xTxk6YfG7/6W09Jswm6wpwDUNLq/5DWdxCXn
   beBB5GvfeVzyvzujVq/14842QvCVp7vI1Q0y2Sgoi37Marw29ryzNOGfH
   Q==;
X-CSE-ConnectionGUID: ndAITYFSStuhyjNPLtUmVQ==
X-CSE-MsgGUID: 2+P7bADEQ2iE1aRZnWw3Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37856252"
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="37856252"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:29 -0700
X-CSE-ConnectionGUID: EQLc42TpSJ+iE5y1sAICvw==
X-CSE-MsgGUID: 6ta+lRWUTD+6IMagsDDGnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,177,1725346800"; 
   d="scan'208";a="74331938"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2024 02:41:27 -0700
Received: from punajuuri.localdomain (punajuuri.localdomain [192.168.240.130])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C5295120C57;
	Fri,  4 Oct 2024 12:41:22 +0300 (EEST)
Received: from sailus by punajuuri.localdomain with local (Exim 4.96)
	(envelope-from <sakari.ailus@linux.intel.com>)
	id 1sweoM-000TYr-2Z;
	Fri, 04 Oct 2024 12:41:22 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org
Subject: [PATCH 16/51] i2c: Switch to __pm_runtime_put_autosuspend()
Date: Fri,  4 Oct 2024 12:41:22 +0300
Message-Id: <20241004094122.113623-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend() will soon be changed to include a call to
pm_runtime_mark_last_busy(). This patch switches the current users to
__pm_runtime_put_autosuspend() which will continue to have the
functionality of old pm_runtime_put_autosuspend().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
 drivers/i2c/busses/i2c-amd-mp2-pci.c       |  2 +-
 drivers/i2c/busses/i2c-amd-mp2.h           |  2 +-
 drivers/i2c/busses/i2c-at91-master.c       |  2 +-
 drivers/i2c/busses/i2c-cadence.c           |  2 +-
 drivers/i2c/busses/i2c-davinci.c           |  4 ++--
 drivers/i2c/busses/i2c-designware-master.c |  2 +-
 drivers/i2c/busses/i2c-designware-pcidrv.c |  2 +-
 drivers/i2c/busses/i2c-hix5hd2.c           |  2 +-
 drivers/i2c/busses/i2c-i801.c              |  4 ++--
 drivers/i2c/busses/i2c-img-scb.c           |  6 +++---
 drivers/i2c/busses/i2c-imx-lpi2c.c         |  6 +++---
 drivers/i2c/busses/i2c-imx.c               |  4 ++--
 drivers/i2c/busses/i2c-mv64xxx.c           |  2 +-
 drivers/i2c/busses/i2c-nvidia-gpu.c        |  4 ++--
 drivers/i2c/busses/i2c-omap.c              |  6 +++---
 drivers/i2c/busses/i2c-qcom-cci.c          |  2 +-
 drivers/i2c/busses/i2c-qcom-geni.c         |  2 +-
 drivers/i2c/busses/i2c-qup.c               |  4 ++--
 drivers/i2c/busses/i2c-riic.c              |  4 ++--
 drivers/i2c/busses/i2c-rzv2m.c             |  2 +-
 drivers/i2c/busses/i2c-sprd.c              |  4 ++--
 drivers/i2c/busses/i2c-stm32f7.c           | 10 +++++-----
 drivers/i2c/busses/i2c-xiic.c              |  2 +-
 23 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd-mp2-pci.c b/drivers/i2c/busses/i2c-amd-mp2-pci.c
index 143165300949..43efef70607b 100644
--- a/drivers/i2c/busses/i2c-amd-mp2-pci.c
+++ b/drivers/i2c/busses/i2c-amd-mp2-pci.c
@@ -360,7 +360,7 @@ static int amd_mp2_pci_probe(struct pci_dev *pci_dev,
 
 	pm_runtime_set_autosuspend_delay(&pci_dev->dev, 1000);
 	pm_runtime_use_autosuspend(&pci_dev->dev);
-	pm_runtime_put_autosuspend(&pci_dev->dev);
+	__pm_runtime_put_autosuspend(&pci_dev->dev);
 	pm_runtime_allow(&pci_dev->dev);
 
 	privdata->probed = true;
diff --git a/drivers/i2c/busses/i2c-amd-mp2.h b/drivers/i2c/busses/i2c-amd-mp2.h
index 018a42de8b1e..66736440a1af 100644
--- a/drivers/i2c/busses/i2c-amd-mp2.h
+++ b/drivers/i2c/busses/i2c-amd-mp2.h
@@ -208,7 +208,7 @@ static inline void amd_mp2_pm_runtime_get(struct amd_mp2_dev *mp2_dev)
 static inline void amd_mp2_pm_runtime_put(struct amd_mp2_dev *mp2_dev)
 {
 	pm_runtime_mark_last_busy(&mp2_dev->pci_dev->dev);
-	pm_runtime_put_autosuspend(&mp2_dev->pci_dev->dev);
+	__pm_runtime_put_autosuspend(&mp2_dev->pci_dev->dev);
 }
 
 #endif
diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
index ee3b469ddfb9..ef415e01116f 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -717,7 +717,7 @@ static int at91_twi_xfer(struct i2c_adapter *adap, struct i2c_msg *msg, int num)
 	ret = (ret < 0) ? ret : num;
 out:
 	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 
 	return ret;
 }
diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index b64026fbca66..47a1224ede6e 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -1129,7 +1129,7 @@ static int cdns_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 #endif
 
 	pm_runtime_mark_last_busy(id->dev);
-	pm_runtime_put_autosuspend(id->dev);
+	__pm_runtime_put_autosuspend(id->dev);
 	return ret;
 }
 
diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 71dc0a6688b7..454c422c665f 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -561,7 +561,7 @@ i2c_davinci_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 
 out:
 	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 
 	return ret;
 }
@@ -867,7 +867,7 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 		goto err_unuse_clocks;
 
 	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 
 	return 0;
 
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index 528b969253a7..e01afd49d478 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -881,7 +881,7 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 
 done_nolock:
 	pm_runtime_mark_last_busy(dev->dev);
-	pm_runtime_put_autosuspend(dev->dev);
+	__pm_runtime_put_autosuspend(dev->dev);
 
 	return ret;
 }
diff --git a/drivers/i2c/busses/i2c-designware-pcidrv.c b/drivers/i2c/busses/i2c-designware-pcidrv.c
index 38265c3dc454..a1579bf2424c 100644
--- a/drivers/i2c/busses/i2c-designware-pcidrv.c
+++ b/drivers/i2c/busses/i2c-designware-pcidrv.c
@@ -285,7 +285,7 @@ static int i2c_dw_pci_probe(struct pci_dev *pdev,
 
 	pm_runtime_set_autosuspend_delay(device, 1000);
 	pm_runtime_use_autosuspend(device);
-	pm_runtime_put_autosuspend(device);
+	__pm_runtime_put_autosuspend(device);
 	pm_runtime_allow(device);
 
 	return 0;
diff --git a/drivers/i2c/busses/i2c-hix5hd2.c b/drivers/i2c/busses/i2c-hix5hd2.c
index 370f32974763..1845191a607c 100644
--- a/drivers/i2c/busses/i2c-hix5hd2.c
+++ b/drivers/i2c/busses/i2c-hix5hd2.c
@@ -374,7 +374,7 @@ static int hix5hd2_i2c_xfer(struct i2c_adapter *adap,
 
 out:
 	pm_runtime_mark_last_busy(priv->dev);
-	pm_runtime_put_autosuspend(priv->dev);
+	__pm_runtime_put_autosuspend(priv->dev);
 	return ret;
 }
 
diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 75dab01d43a7..089d430afe43 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -934,7 +934,7 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 	outb_p(SMBHSTSTS_INUSE_STS | STATUS_FLAGS, SMBHSTSTS(priv));
 
 	pm_runtime_mark_last_busy(&priv->pci_dev->dev);
-	pm_runtime_put_autosuspend(&priv->pci_dev->dev);
+	__pm_runtime_put_autosuspend(&priv->pci_dev->dev);
 	return ret;
 }
 
@@ -1797,7 +1797,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	dev_pm_set_driver_flags(&dev->dev, DPM_FLAG_NO_DIRECT_COMPLETE);
 	pm_runtime_set_autosuspend_delay(&dev->dev, 1000);
 	pm_runtime_use_autosuspend(&dev->dev);
-	pm_runtime_put_autosuspend(&dev->dev);
+	__pm_runtime_put_autosuspend(&dev->dev);
 	pm_runtime_allow(&dev->dev);
 
 	return 0;
diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
index 02f75cf310aa..3891d06ee018 100644
--- a/drivers/i2c/busses/i2c-img-scb.c
+++ b/drivers/i2c/busses/i2c-img-scb.c
@@ -1132,7 +1132,7 @@ static int img_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 	}
 
 	pm_runtime_mark_last_busy(adap->dev.parent);
-	pm_runtime_put_autosuspend(adap->dev.parent);
+	__pm_runtime_put_autosuspend(adap->dev.parent);
 
 	return i2c->msg_status ? i2c->msg_status : num;
 }
@@ -1166,7 +1166,7 @@ static int img_i2c_init(struct img_i2c *i2c)
 			 (rev >> 24) & 0xff, (rev >> 16) & 0xff,
 			 (rev >> 8) & 0xff, rev & 0xff);
 		pm_runtime_mark_last_busy(i2c->adap.dev.parent);
-		pm_runtime_put_autosuspend(i2c->adap.dev.parent);
+		__pm_runtime_put_autosuspend(i2c->adap.dev.parent);
 		return -EINVAL;
 	}
 
@@ -1318,7 +1318,7 @@ static int img_i2c_init(struct img_i2c *i2c)
 	ret = img_i2c_reset_bus(i2c);
 
 	pm_runtime_mark_last_busy(i2c->adap.dev.parent);
-	pm_runtime_put_autosuspend(i2c->adap.dev.parent);
+	__pm_runtime_put_autosuspend(i2c->adap.dev.parent);
 
 	return ret;
 }
diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 8adf2963d764..5ad13c2e34ce 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -286,7 +286,7 @@ static int lpi2c_imx_master_enable(struct lpi2c_imx_struct *lpi2c_imx)
 
 rpm_put:
 	pm_runtime_mark_last_busy(lpi2c_imx->adapter.dev.parent);
-	pm_runtime_put_autosuspend(lpi2c_imx->adapter.dev.parent);
+	__pm_runtime_put_autosuspend(lpi2c_imx->adapter.dev.parent);
 
 	return ret;
 }
@@ -300,7 +300,7 @@ static int lpi2c_imx_master_disable(struct lpi2c_imx_struct *lpi2c_imx)
 	writel(temp, lpi2c_imx->base + LPI2C_MCR);
 
 	pm_runtime_mark_last_busy(lpi2c_imx->adapter.dev.parent);
-	pm_runtime_put_autosuspend(lpi2c_imx->adapter.dev.parent);
+	__pm_runtime_put_autosuspend(lpi2c_imx->adapter.dev.parent);
 
 	return 0;
 }
@@ -645,7 +645,7 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 		goto rpm_disable;
 
 	pm_runtime_mark_last_busy(&pdev->dev);
-	pm_runtime_put_autosuspend(&pdev->dev);
+	__pm_runtime_put_autosuspend(&pdev->dev);
 
 	dev_info(&lpi2c_imx->adapter.dev, "LPI2C adapter registered\n");
 
diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index c2358356a8ff..7f529bc7f46d 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1336,7 +1336,7 @@ static int i2c_imx_xfer(struct i2c_adapter *adapter,
 	result = i2c_imx_xfer_common(adapter, msgs, num, false);
 
 	pm_runtime_mark_last_busy(i2c_imx->adapter.dev.parent);
-	pm_runtime_put_autosuspend(i2c_imx->adapter.dev.parent);
+	__pm_runtime_put_autosuspend(i2c_imx->adapter.dev.parent);
 
 	return result;
 }
@@ -1492,7 +1492,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
 		goto clk_notifier_unregister;
 
 	pm_runtime_mark_last_busy(&pdev->dev);
-	pm_runtime_put_autosuspend(&pdev->dev);
+	__pm_runtime_put_autosuspend(&pdev->dev);
 
 	dev_dbg(&i2c_imx->adapter.dev, "claimed irq %d\n", irq);
 	dev_dbg(&i2c_imx->adapter.dev, "device resources: %pR\n", res);
diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
index 874309580c33..32933db94550 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -773,7 +773,7 @@ mv64xxx_i2c_xfer_core(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	drv_data->msgs = NULL;
 
 	pm_runtime_mark_last_busy(&adap->dev);
-	pm_runtime_put_autosuspend(&adap->dev);
+	__pm_runtime_put_autosuspend(&adap->dev);
 
 	return ret;
 }
diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 541d808d62d0..07f77552662f 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -217,7 +217,7 @@ static int gpu_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 			dev_err(i2cd->dev, "i2c stop failed %d\n", status2);
 	}
 	pm_runtime_mark_last_busy(i2cd->dev);
-	pm_runtime_put_autosuspend(i2cd->dev);
+	__pm_runtime_put_autosuspend(i2cd->dev);
 	return status;
 }
 
@@ -318,7 +318,7 @@ static int gpu_i2c_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 
 	pm_runtime_set_autosuspend_delay(dev, 3000);
 	pm_runtime_use_autosuspend(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 	pm_runtime_allow(dev);
 
 	return 0;
diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index 92faf03d64cf..339f4c01a1f8 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -827,7 +827,7 @@ omap_i2c_xfer_common(struct i2c_adapter *adap, struct i2c_msg msgs[], int num,
 
 out:
 	pm_runtime_mark_last_busy(omap->dev);
-	pm_runtime_put_autosuspend(omap->dev);
+	__pm_runtime_put_autosuspend(omap->dev);
 	return r;
 }
 
@@ -1502,7 +1502,7 @@ omap_i2c_probe(struct platform_device *pdev)
 		 major, minor, omap->speed);
 
 	pm_runtime_mark_last_busy(omap->dev);
-	pm_runtime_put_autosuspend(omap->dev);
+	__pm_runtime_put_autosuspend(omap->dev);
 
 	return 0;
 
@@ -1590,7 +1590,7 @@ static int omap_i2c_suspend(struct device *dev)
 static int omap_i2c_resume(struct device *dev)
 {
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 
 	return 0;
 }
diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 5cc791b3b57d..a8d6888ceb21 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -452,7 +452,7 @@ static int cci_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 
 err:
 	pm_runtime_mark_last_busy(cci->dev);
-	pm_runtime_put_autosuspend(cci->dev);
+	__pm_runtime_put_autosuspend(cci->dev);
 
 	return ret;
 }
diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 7a22e1f46e60..04f6e4c6b84f 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -716,7 +716,7 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 		ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
 
 	pm_runtime_mark_last_busy(gi2c->se.dev);
-	pm_runtime_put_autosuspend(gi2c->se.dev);
+	__pm_runtime_put_autosuspend(gi2c->se.dev);
 	gi2c->cur = NULL;
 	gi2c->err = 0;
 	return ret;
diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index 86ec391616b0..0f8061cae1d4 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -1109,7 +1109,7 @@ static int qup_i2c_xfer(struct i2c_adapter *adap,
 out:
 
 	pm_runtime_mark_last_busy(qup->dev);
-	pm_runtime_put_autosuspend(qup->dev);
+	__pm_runtime_put_autosuspend(qup->dev);
 
 	return ret;
 }
@@ -1594,7 +1594,7 @@ static int qup_i2c_xfer_v2(struct i2c_adapter *adap,
 		ret = num;
 out:
 	pm_runtime_mark_last_busy(qup->dev);
-	pm_runtime_put_autosuspend(qup->dev);
+	__pm_runtime_put_autosuspend(qup->dev);
 
 	return ret;
 }
diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index c218f73c3650..b4a213aa4c7b 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -178,7 +178,7 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 
  out:
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 
 	return riic->err ?: num;
 }
@@ -412,7 +412,7 @@ static int riic_init_hw(struct riic_dev *riic)
 	riic_clear_set_bit(riic, ICCR1_IICRST, 0, RIIC_ICCR1);
 
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 	return 0;
 }
 
diff --git a/drivers/i2c/busses/i2c-rzv2m.c b/drivers/i2c/busses/i2c-rzv2m.c
index 02b76e24a476..d7289fd8b35a 100644
--- a/drivers/i2c/busses/i2c-rzv2m.c
+++ b/drivers/i2c/busses/i2c-rzv2m.c
@@ -378,7 +378,7 @@ static int rzv2m_i2c_xfer(struct i2c_adapter *adap,
 
 out:
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 
 	return ret;
 }
diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index 56b2e5c5fb49..551aba23cd1a 100644
--- a/drivers/i2c/busses/i2c-sprd.c
+++ b/drivers/i2c/busses/i2c-sprd.c
@@ -303,7 +303,7 @@ static int sprd_i2c_xfer(struct i2c_adapter *i2c_adap,
 
 err_msg:
 	pm_runtime_mark_last_busy(i2c_dev->dev);
-	pm_runtime_put_autosuspend(i2c_dev->dev);
+	__pm_runtime_put_autosuspend(i2c_dev->dev);
 
 	return ret < 0 ? ret : im;
 }
@@ -560,7 +560,7 @@ static int sprd_i2c_probe(struct platform_device *pdev)
 	}
 
 	pm_runtime_mark_last_busy(i2c_dev->dev);
-	pm_runtime_put_autosuspend(i2c_dev->dev);
+	__pm_runtime_put_autosuspend(i2c_dev->dev);
 	return 0;
 
 err_rpm_put:
diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index 973a3a8c6d4a..c86874bf1070 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1757,7 +1757,7 @@ static int stm32f7_i2c_xfer_core(struct i2c_adapter *i2c_adap,
 
 pm_free:
 	pm_runtime_mark_last_busy(i2c_dev->dev);
-	pm_runtime_put_autosuspend(i2c_dev->dev);
+	__pm_runtime_put_autosuspend(i2c_dev->dev);
 
 	return (ret < 0) ? ret : num;
 }
@@ -1866,7 +1866,7 @@ static int stm32f7_i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 
 pm_free:
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 	return ret;
 }
 
@@ -1973,7 +1973,7 @@ static int stm32f7_i2c_reg_slave(struct i2c_client *slave)
 		stm32f7_i2c_enable_wakeup(i2c_dev, false);
 
 	pm_runtime_mark_last_busy(dev);
-	pm_runtime_put_autosuspend(dev);
+	__pm_runtime_put_autosuspend(dev);
 
 	return ret;
 }
@@ -2011,7 +2011,7 @@ static int stm32f7_i2c_unreg_slave(struct i2c_client *slave)
 	}
 
 	pm_runtime_mark_last_busy(i2c_dev->dev);
-	pm_runtime_put_autosuspend(i2c_dev->dev);
+	__pm_runtime_put_autosuspend(i2c_dev->dev);
 
 	return 0;
 }
@@ -2324,7 +2324,7 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 	dev_info(i2c_dev->dev, "STM32F7 I2C-%d bus adapter\n", adap->nr);
 
 	pm_runtime_mark_last_busy(i2c_dev->dev);
-	pm_runtime_put_autosuspend(i2c_dev->dev);
+	__pm_runtime_put_autosuspend(i2c_dev->dev);
 
 	return 0;
 
diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index c4d3eb02da09..7292e649dea0 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1194,7 +1194,7 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 
 out:
 	pm_runtime_mark_last_busy(i2c->dev);
-	pm_runtime_put_autosuspend(i2c->dev);
+	__pm_runtime_put_autosuspend(i2c->dev);
 	return err;
 }
 
-- 
2.39.5


