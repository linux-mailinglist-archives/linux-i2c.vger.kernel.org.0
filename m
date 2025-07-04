Return-Path: <linux-i2c+bounces-11823-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D98AF8A93
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 10:05:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3EED75A4BFE
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jul 2025 08:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A46F92DECBB;
	Fri,  4 Jul 2025 07:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ImNzoyn5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AF5B2DA776;
	Fri,  4 Jul 2025 07:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751615674; cv=none; b=qMG3QwOPjMYRNpdKXurU1ZdBLOx42ovmxCnb9YLH2xLFEJo8VumxzR8TvItpCsaznXtteHTjxDHMKkJP8k+DAOIKE6sa/J6Fne6PJMI9SpbiiNPdHb8G/8CqSca2/FDtf9pr/iwTuWxJJQpSn85obGoLEd90m13sG+vj6XMB34o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751615674; c=relaxed/simple;
	bh=xYuK9T9+tcQn64AIw71sMLb6RG4OnDJkGt94GjOYXp0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CQ956qec/JqOvBEnEWdxQLbM4N+URSWzDuQLDiYxcfX8Iuu7f+gB4qKyuw/AgjygHmMUtiODPYrzlxtNZXhZThXItiMCuNXx/ZflupH9qEnSSbX7heNOOwE3ds53XBB7abP4qPiwhwkPGMj3B76e6OQoaZZZPzGWY6xosjTzrqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ImNzoyn5; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751615671; x=1783151671;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xYuK9T9+tcQn64AIw71sMLb6RG4OnDJkGt94GjOYXp0=;
  b=ImNzoyn5QkeNTemk9Y35lx3JtH9bROPuEWHig+YWHSDfsgmYDmbrxQMd
   fEhP4RV6E5cEhDNeon27+E2xjFERM6/ddbCPDj0VjHNN4KTaEJD/pUuIg
   H0j5OuOSv53d0DsuuY8buARL8CT2fVwAWTlFZpWg2s36+U3GUhBrDfoCS
   NGhppPRMrroC8r+lc76Ry9tHJFDb5sf8bbmvRIcKebfp2yvkhyizu6LTM
   U/KRADHY1BoKlSGDF6SdQhdr41595kCfdMwOyETz98FmS2R0Ie3kFr415
   6DbEZP1k+BrPnYqW9d4M+IrmEgLHri+BVVQjmLX42jfqJLg9JY6mauBXm
   w==;
X-CSE-ConnectionGUID: /x4f9jZlRSuPw3G8MH6V/w==
X-CSE-MsgGUID: OltbnzLuQmqbkpmgfnqdgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494692"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="76494692"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:30 -0700
X-CSE-ConnectionGUID: QFWajt0PR7SFOZnG7l1PUA==
X-CSE-MsgGUID: +OWarQq2Sw+E08H/hywhkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; 
   d="scan'208";a="158924245"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO svinhufvud.fi.intel.com) ([10.245.244.244])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 00:54:18 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
	by svinhufvud.fi.intel.com (Postfix) with ESMTP id E8D0944843;
	Fri,  4 Jul 2025 10:54:15 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Elie Morisse <syniurge@gmail.com>,
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Michal Simek <michal.simek@amd.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	Jean Delvare <jdelvare@suse.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Ajay Gupta <ajayg@nvidia.com>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Vignesh R <vigneshr@ti.com>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Robert Foss <rfoss@kernel.org>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	Viken Dadhaniya <quic_vdadhani@quicinc.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-omap@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 23/80] i2c: Remove redundant pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:15 +0300
Message-Id: <20250704075415.3218608-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/i2c/busses/i2c-amd-mp2.h           | 1 -
 drivers/i2c/busses/i2c-at91-core.c         | 1 -
 drivers/i2c/busses/i2c-at91-master.c       | 1 -
 drivers/i2c/busses/i2c-cadence.c           | 1 -
 drivers/i2c/busses/i2c-davinci.c           | 2 --
 drivers/i2c/busses/i2c-designware-master.c | 1 -
 drivers/i2c/busses/i2c-hix5hd2.c           | 1 -
 drivers/i2c/busses/i2c-i801.c              | 1 -
 drivers/i2c/busses/i2c-img-scb.c           | 3 ---
 drivers/i2c/busses/i2c-imx-lpi2c.c         | 4 ----
 drivers/i2c/busses/i2c-imx.c               | 3 ---
 drivers/i2c/busses/i2c-mv64xxx.c           | 1 -
 drivers/i2c/busses/i2c-nvidia-gpu.c        | 1 -
 drivers/i2c/busses/i2c-omap.c              | 3 ---
 drivers/i2c/busses/i2c-qcom-cci.c          | 2 --
 drivers/i2c/busses/i2c-qcom-geni.c         | 1 -
 drivers/i2c/busses/i2c-qup.c               | 3 ---
 drivers/i2c/busses/i2c-riic.c              | 2 --
 drivers/i2c/busses/i2c-rzv2m.c             | 1 -
 drivers/i2c/busses/i2c-sprd.c              | 2 --
 drivers/i2c/busses/i2c-stm32f7.c           | 5 -----
 drivers/i2c/busses/i2c-xiic.c              | 1 -
 22 files changed, 41 deletions(-)

diff --git a/drivers/i2c/busses/i2c-amd-mp2.h b/drivers/i2c/busses/i2c-amd-mp2.h
index 018a42de8b1e..9b7e9494dd12 100644
--- a/drivers/i2c/busses/i2c-amd-mp2.h
+++ b/drivers/i2c/busses/i2c-amd-mp2.h
@@ -207,7 +207,6 @@ static inline void amd_mp2_pm_runtime_get(struct amd_mp2_dev *mp2_dev)
 
 static inline void amd_mp2_pm_runtime_put(struct amd_mp2_dev *mp2_dev)
 {
-	pm_runtime_mark_last_busy(&mp2_dev->pci_dev->dev);
 	pm_runtime_put_autosuspend(&mp2_dev->pci_dev->dev);
 }
 
diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at91-core.c
index edc047e3e535..b64adef778d4 100644
--- a/drivers/i2c/busses/i2c-at91-core.c
+++ b/drivers/i2c/busses/i2c-at91-core.c
@@ -313,7 +313,6 @@ static int __maybe_unused at91_twi_resume_noirq(struct device *dev)
 			return ret;
 	}
 
-	pm_runtime_mark_last_busy(dev);
 	pm_request_autosuspend(dev);
 
 	at91_init_twi_bus(twi_dev);
diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
index 59795c1c24ff..894cedbca99f 100644
--- a/drivers/i2c/busses/i2c-at91-master.c
+++ b/drivers/i2c/busses/i2c-at91-master.c
@@ -717,7 +717,6 @@ static int at91_twi_xfer(struct i2c_adapter *adap, struct i2c_msg *msg, int num)
 
 	ret = (ret < 0) ? ret : num;
 out:
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 
 	return ret;
diff --git a/drivers/i2c/busses/i2c-cadence.c b/drivers/i2c/busses/i2c-cadence.c
index 697d095afbe4..0fb728ade92e 100644
--- a/drivers/i2c/busses/i2c-cadence.c
+++ b/drivers/i2c/busses/i2c-cadence.c
@@ -1128,7 +1128,6 @@ static int cdns_i2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 		cdns_i2c_set_mode(CDNS_I2C_MODE_SLAVE, id);
 #endif
 
-	pm_runtime_mark_last_busy(id->dev);
 	pm_runtime_put_autosuspend(id->dev);
 	return ret;
 }
diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
index 6a3d4e9e07f4..a773ba082321 100644
--- a/drivers/i2c/busses/i2c-davinci.c
+++ b/drivers/i2c/busses/i2c-davinci.c
@@ -543,7 +543,6 @@ i2c_davinci_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	ret = num;
 
 out:
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 
 	return ret;
@@ -821,7 +820,6 @@ static int davinci_i2c_probe(struct platform_device *pdev)
 	if (r)
 		goto err_unuse_clocks;
 
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 
 	return 0;
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index cbd88ffa5610..181ca0938fb2 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -901,7 +901,6 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	i2c_dw_release_lock(dev);
 
 done_nolock:
-	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 
 	return ret;
diff --git a/drivers/i2c/busses/i2c-hix5hd2.c b/drivers/i2c/busses/i2c-hix5hd2.c
index 370f32974763..f8aa1ea0f9a6 100644
--- a/drivers/i2c/busses/i2c-hix5hd2.c
+++ b/drivers/i2c/busses/i2c-hix5hd2.c
@@ -373,7 +373,6 @@ static int hix5hd2_i2c_xfer(struct i2c_adapter *adap,
 	ret = num;
 
 out:
-	pm_runtime_mark_last_busy(priv->dev);
 	pm_runtime_put_autosuspend(priv->dev);
 	return ret;
 }
diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index a7f89946dad4..58088e9121a1 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -928,7 +928,6 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 	 */
 	iowrite8(SMBHSTSTS_INUSE_STS | STATUS_FLAGS, SMBHSTSTS(priv));
 
-	pm_runtime_mark_last_busy(&priv->pci_dev->dev);
 	pm_runtime_put_autosuspend(&priv->pci_dev->dev);
 	return ret;
 }
diff --git a/drivers/i2c/busses/i2c-img-scb.c b/drivers/i2c/busses/i2c-img-scb.c
index a454f9f25146..88192c25c44c 100644
--- a/drivers/i2c/busses/i2c-img-scb.c
+++ b/drivers/i2c/busses/i2c-img-scb.c
@@ -1131,7 +1131,6 @@ static int img_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 			break;
 	}
 
-	pm_runtime_mark_last_busy(adap->dev.parent);
 	pm_runtime_put_autosuspend(adap->dev.parent);
 
 	return i2c->msg_status ? i2c->msg_status : num;
@@ -1165,7 +1164,6 @@ static int img_i2c_init(struct img_i2c *i2c)
 			 "Unknown hardware revision (%d.%d.%d.%d)\n",
 			 (rev >> 24) & 0xff, (rev >> 16) & 0xff,
 			 (rev >> 8) & 0xff, rev & 0xff);
-		pm_runtime_mark_last_busy(i2c->adap.dev.parent);
 		pm_runtime_put_autosuspend(i2c->adap.dev.parent);
 		return -EINVAL;
 	}
@@ -1317,7 +1315,6 @@ static int img_i2c_init(struct img_i2c *i2c)
 	/* Perform a synchronous sequence to reset the bus */
 	ret = img_i2c_reset_bus(i2c);
 
-	pm_runtime_mark_last_busy(i2c->adap.dev.parent);
 	pm_runtime_put_autosuspend(i2c->adap.dev.parent);
 
 	return ret;
diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-imx-lpi2c.c
index 064bc83840a6..6d97998859b1 100644
--- a/drivers/i2c/busses/i2c-imx-lpi2c.c
+++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
@@ -362,7 +362,6 @@ static int lpi2c_imx_master_enable(struct lpi2c_imx_struct *lpi2c_imx)
 	return 0;
 
 rpm_put:
-	pm_runtime_mark_last_busy(lpi2c_imx->adapter.dev.parent);
 	pm_runtime_put_autosuspend(lpi2c_imx->adapter.dev.parent);
 
 	return ret;
@@ -376,7 +375,6 @@ static int lpi2c_imx_master_disable(struct lpi2c_imx_struct *lpi2c_imx)
 	temp &= ~MCR_MEN;
 	writel(temp, lpi2c_imx->base + LPI2C_MCR);
 
-	pm_runtime_mark_last_busy(lpi2c_imx->adapter.dev.parent);
 	pm_runtime_put_autosuspend(lpi2c_imx->adapter.dev.parent);
 
 	return 0;
@@ -1372,7 +1370,6 @@ static int lpi2c_imx_probe(struct platform_device *pdev)
 	if (ret)
 		goto rpm_disable;
 
-	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
 	dev_info(&lpi2c_imx->adapter.dev, "LPI2C adapter registered\n");
@@ -1474,7 +1471,6 @@ static int lpi2c_suspend(struct device *dev)
 
 static int lpi2c_resume(struct device *dev)
 {
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 60f5c790ad7c..dcce882f3eba 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1637,7 +1637,6 @@ static int i2c_imx_xfer(struct i2c_adapter *adapter,
 
 	result = i2c_imx_xfer_common(adapter, msgs, num, false);
 
-	pm_runtime_mark_last_busy(i2c_imx->adapter.dev.parent);
 	pm_runtime_put_autosuspend(i2c_imx->adapter.dev.parent);
 
 	return result;
@@ -1822,7 +1821,6 @@ static int i2c_imx_probe(struct platform_device *pdev)
 	if (ret < 0)
 		goto clk_notifier_unregister;
 
-	pm_runtime_mark_last_busy(&pdev->dev);
 	pm_runtime_put_autosuspend(&pdev->dev);
 
 	dev_dbg(&i2c_imx->adapter.dev, "claimed irq %d\n", irq);
@@ -1928,7 +1926,6 @@ static int i2c_imx_suspend(struct device *dev)
 
 static int i2c_imx_resume(struct device *dev)
 {
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
index 8fc26a511320..1acba628e16c 100644
--- a/drivers/i2c/busses/i2c-mv64xxx.c
+++ b/drivers/i2c/busses/i2c-mv64xxx.c
@@ -766,7 +766,6 @@ mv64xxx_i2c_xfer_core(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	drv_data->num_msgs = 0;
 	drv_data->msgs = NULL;
 
-	pm_runtime_mark_last_busy(&adap->dev);
 	pm_runtime_put_autosuspend(&adap->dev);
 
 	return ret;
diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 541d808d62d0..14c059b03945 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -216,7 +216,6 @@ static int gpu_i2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 		if (status2 < 0)
 			dev_err(i2cd->dev, "i2c stop failed %d\n", status2);
 	}
-	pm_runtime_mark_last_busy(i2cd->dev);
 	pm_runtime_put_autosuspend(i2cd->dev);
 	return status;
 }
diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index 8b01df3cc8e9..d62f15d1acfe 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -828,7 +828,6 @@ omap_i2c_xfer_common(struct i2c_adapter *adap, struct i2c_msg msgs[], int num,
 		omap->set_mpu_wkup_lat(omap->dev, -1);
 
 out:
-	pm_runtime_mark_last_busy(omap->dev);
 	pm_runtime_put_autosuspend(omap->dev);
 	return r;
 }
@@ -1508,7 +1507,6 @@ omap_i2c_probe(struct platform_device *pdev)
 	dev_info(omap->dev, "bus %d rev%d.%d at %d kHz\n", adap->nr,
 		 major, minor, omap->speed);
 
-	pm_runtime_mark_last_busy(omap->dev);
 	pm_runtime_put_autosuspend(omap->dev);
 
 	return 0;
@@ -1602,7 +1600,6 @@ static int omap_i2c_suspend(struct device *dev)
 
 static int omap_i2c_resume(struct device *dev)
 {
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return 0;
diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index a3afa11a71a1..e631d79baf14 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -450,7 +450,6 @@ static int cci_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 		ret = num;
 
 err:
-	pm_runtime_mark_last_busy(cci->dev);
 	pm_runtime_put_autosuspend(cci->dev);
 
 	return ret;
@@ -508,7 +507,6 @@ static int __maybe_unused cci_suspend(struct device *dev)
 static int __maybe_unused cci_resume(struct device *dev)
 {
 	cci_resume_runtime(dev);
-	pm_runtime_mark_last_busy(dev);
 	pm_request_autosuspend(dev);
 
 	return 0;
diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index 13889f52b6f7..30921e80d30f 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -714,7 +714,6 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
 	else
 		ret = geni_i2c_fifo_xfer(gi2c, msgs, num);
 
-	pm_runtime_mark_last_busy(gi2c->se.dev);
 	pm_runtime_put_autosuspend(gi2c->se.dev);
 	gi2c->cur = NULL;
 	gi2c->err = 0;
diff --git a/drivers/i2c/busses/i2c-qup.c b/drivers/i2c/busses/i2c-qup.c
index 6059f585843e..61207ca13890 100644
--- a/drivers/i2c/busses/i2c-qup.c
+++ b/drivers/i2c/busses/i2c-qup.c
@@ -1137,7 +1137,6 @@ static int qup_i2c_xfer(struct i2c_adapter *adap,
 		ret = num;
 out:
 
-	pm_runtime_mark_last_busy(qup->dev);
 	pm_runtime_put_autosuspend(qup->dev);
 
 	return ret;
@@ -1622,7 +1621,6 @@ static int qup_i2c_xfer_v2(struct i2c_adapter *adap,
 	if (ret == 0)
 		ret = num;
 out:
-	pm_runtime_mark_last_busy(qup->dev);
 	pm_runtime_put_autosuspend(qup->dev);
 
 	return ret;
@@ -1989,7 +1987,6 @@ static int qup_i2c_suspend(struct device *device)
 static int qup_i2c_resume(struct device *device)
 {
 	qup_i2c_pm_resume_runtime(device);
-	pm_runtime_mark_last_busy(device);
 	pm_request_autosuspend(device);
 	return 0;
 }
diff --git a/drivers/i2c/busses/i2c-riic.c b/drivers/i2c/busses/i2c-riic.c
index 9c164a4b9bb9..2b7893b6152e 100644
--- a/drivers/i2c/busses/i2c-riic.c
+++ b/drivers/i2c/busses/i2c-riic.c
@@ -206,7 +206,6 @@ static int riic_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	}
 
  out:
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return riic->err ?: num;
@@ -452,7 +451,6 @@ static int riic_init_hw(struct riic_dev *riic)
 
 	riic_clear_set_bit(riic, ICCR1_IICRST, 0, RIIC_ICCR1);
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 	return 0;
 }
diff --git a/drivers/i2c/busses/i2c-rzv2m.c b/drivers/i2c/busses/i2c-rzv2m.c
index b0e9c0b62429..238714850673 100644
--- a/drivers/i2c/busses/i2c-rzv2m.c
+++ b/drivers/i2c/busses/i2c-rzv2m.c
@@ -372,7 +372,6 @@ static int rzv2m_i2c_xfer(struct i2c_adapter *adap,
 	ret = num;
 
 out:
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return ret;
diff --git a/drivers/i2c/busses/i2c-sprd.c b/drivers/i2c/busses/i2c-sprd.c
index 56b2e5c5fb49..2eddddbc84a1 100644
--- a/drivers/i2c/busses/i2c-sprd.c
+++ b/drivers/i2c/busses/i2c-sprd.c
@@ -302,7 +302,6 @@ static int sprd_i2c_xfer(struct i2c_adapter *i2c_adap,
 	ret = sprd_i2c_handle_msg(i2c_adap, &msgs[im++], 1);
 
 err_msg:
-	pm_runtime_mark_last_busy(i2c_dev->dev);
 	pm_runtime_put_autosuspend(i2c_dev->dev);
 
 	return ret < 0 ? ret : im;
@@ -559,7 +558,6 @@ static int sprd_i2c_probe(struct platform_device *pdev)
 		goto err_rpm_put;
 	}
 
-	pm_runtime_mark_last_busy(i2c_dev->dev);
 	pm_runtime_put_autosuspend(i2c_dev->dev);
 	return 0;
 
diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
index ef15475a7ee1..36843ac5d024 100644
--- a/drivers/i2c/busses/i2c-stm32f7.c
+++ b/drivers/i2c/busses/i2c-stm32f7.c
@@ -1757,7 +1757,6 @@ static int stm32f7_i2c_xfer_core(struct i2c_adapter *i2c_adap,
 	}
 
 pm_free:
-	pm_runtime_mark_last_busy(i2c_dev->dev);
 	pm_runtime_put_autosuspend(i2c_dev->dev);
 
 	return (ret < 0) ? ret : num;
@@ -1866,7 +1865,6 @@ static int stm32f7_i2c_smbus_xfer(struct i2c_adapter *adapter, u16 addr,
 	}
 
 pm_free:
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 	return ret;
 }
@@ -1973,7 +1971,6 @@ static int stm32f7_i2c_reg_slave(struct i2c_client *slave)
 	if (!stm32f7_i2c_is_slave_registered(i2c_dev))
 		stm32f7_i2c_enable_wakeup(i2c_dev, false);
 
-	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
 	return ret;
@@ -2011,7 +2008,6 @@ static int stm32f7_i2c_unreg_slave(struct i2c_client *slave)
 		stm32f7_i2c_enable_wakeup(i2c_dev, false);
 	}
 
-	pm_runtime_mark_last_busy(i2c_dev->dev);
 	pm_runtime_put_autosuspend(i2c_dev->dev);
 
 	return 0;
@@ -2324,7 +2320,6 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
 
 	dev_info(i2c_dev->dev, "STM32F7 I2C-%d bus adapter\n", adap->nr);
 
-	pm_runtime_mark_last_busy(i2c_dev->dev);
 	pm_runtime_put_autosuspend(i2c_dev->dev);
 
 	return 0;
diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
index 607026c921d6..28015d77599d 100644
--- a/drivers/i2c/busses/i2c-xiic.c
+++ b/drivers/i2c/busses/i2c-xiic.c
@@ -1349,7 +1349,6 @@ static int xiic_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 	mutex_unlock(&i2c->lock);
 
 out:
-	pm_runtime_mark_last_busy(i2c->dev);
 	pm_runtime_put_autosuspend(i2c->dev);
 	return err;
 }
-- 
2.39.5


