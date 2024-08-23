Return-Path: <linux-i2c+bounces-5712-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1606095C390
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 05:05:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D4901C233ED
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 03:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B3D3B784;
	Fri, 23 Aug 2024 03:04:47 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B4AF286A2;
	Fri, 23 Aug 2024 03:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724382287; cv=none; b=nGsLH+TyCeVVUtDN6Ie/hePNvJYt6kXEuHfPd6tq8eyc42V1XHWNa9/p+h5bonEpbyeeRmcxfFB7qDNy7K7Cgx/ofmRaoMKWC1BbPylXhcEPf/chOTSoqpw/xsJuqxkMoWIOdKW4cp/ljo3sAtWnH+IVwqCB12su/Qm2+FoxSwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724382287; c=relaxed/simple;
	bh=TFy/88oldcTouickwwwIRQ5m+qUrSWHc0cHVKxDkfX4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rDt0DkOlIx2PdJpu/BfPbBUvaWdoMhjPn8yagrk7RxJaDZE7qinE8X1oM2UjwvgxF2CbYKALSgeQLJawJ7UGtwXShYt+7AG19Oih9bGXjF7jybYqIOPQPeJ+CAnhdICOavyUyY2Cgz2+quOge1qt8eoztNuyH3e1UWbQdSK7HdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com; spf=pass smtp.mailfrom=trustnetic.com; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trustnetic.com
X-QQ-mid: bizesmtpsz10t1724382256twwbaw
X-QQ-Originating-IP: 8lSusnd7n+jDw/4gqO+6NWF+GBzzw5FLUMqwVNhN7ao=
Received: from wxdbg.localdomain.com ( [125.118.254.234])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Aug 2024 11:04:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13398459795474154738
From: Jiawen Wu <jiawenwu@trustnetic.com>
To: andi.shyti@kernel.org,
	jarkko.nikula@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	mika.westerberg@linux.intel.com,
	jsd@semihalf.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	rmk+kernel@armlinux.org.uk,
	piotr.raczynski@intel.com,
	andrew@lunn.ch,
	linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org
Cc: mengyuanlou@net-swift.com,
	duanqiangwen@net-swift.com,
	Jiawen Wu <jiawenwu@trustnetic.com>,
	stable@vger.kernel.org
Subject: [PATCH net 2/3] i2c: designware: add device private data passing to lock functions
Date: Fri, 23 Aug 2024 11:02:41 +0800
Message-Id: <20240823030242.3083528-3-jiawenwu@trustnetic.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20240823030242.3083528-1-jiawenwu@trustnetic.com>
References: <20240823030242.3083528-1-jiawenwu@trustnetic.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:trustnetic.com:qybglogicsvrgz:qybglogicsvrgz8a-1

In order to add the hardware lock for Wangxun devices with minimal
modification, pass struct dw_i2c_dev to the acquire and release lock
functions.

Cc: stable@vger.kernel.org
Fixes: 2f8d1ed79345 ("i2c: designware: Add driver support for Wangxun 10Gb NIC")
Signed-off-by: Jiawen Wu <jiawenwu@trustnetic.com>
---
 drivers/i2c/busses/i2c-designware-amdpsp.c   |  4 ++--
 drivers/i2c/busses/i2c-designware-baytrail.c | 14 ++++++++++++--
 drivers/i2c/busses/i2c-designware-common.c   |  4 ++--
 drivers/i2c/busses/i2c-designware-core.h     |  4 ++--
 4 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-designware-amdpsp.c b/drivers/i2c/busses/i2c-designware-amdpsp.c
index 63454b06e5da..ee7cc4b33f4b 100644
--- a/drivers/i2c/busses/i2c-designware-amdpsp.c
+++ b/drivers/i2c/busses/i2c-designware-amdpsp.c
@@ -167,7 +167,7 @@ static void psp_release_i2c_bus_deferred(struct work_struct *work)
 }
 static DECLARE_DELAYED_WORK(release_queue, psp_release_i2c_bus_deferred);
 
-static int psp_acquire_i2c_bus(void)
+static int psp_acquire_i2c_bus(struct dw_i2c_dev *dev)
 {
 	int status;
 
@@ -206,7 +206,7 @@ static int psp_acquire_i2c_bus(void)
 	return 0;
 }
 
-static void psp_release_i2c_bus(void)
+static void psp_release_i2c_bus(struct dw_i2c_dev *dev)
 {
 	mutex_lock(&psp_i2c_access_mutex);
 
diff --git a/drivers/i2c/busses/i2c-designware-baytrail.c b/drivers/i2c/busses/i2c-designware-baytrail.c
index 45774aa47c28..9dde796e0fcc 100644
--- a/drivers/i2c/busses/i2c-designware-baytrail.c
+++ b/drivers/i2c/busses/i2c-designware-baytrail.c
@@ -12,6 +12,16 @@
 
 #include "i2c-designware-core.h"
 
+static int iosf_mbi_block_punit_i2c_access_dev(struct dw_i2c_dev *dev)
+{
+	return iosf_mbi_block_punit_i2c_access();
+}
+
+static void iosf_mbi_unblock_punit_i2c_access_dev(struct dw_i2c_dev *dev)
+{
+	return iosf_mbi_unblock_punit_i2c_access();
+}
+
 int i2c_dw_baytrail_probe_lock_support(struct dw_i2c_dev *dev)
 {
 	acpi_status status;
@@ -36,8 +46,8 @@ int i2c_dw_baytrail_probe_lock_support(struct dw_i2c_dev *dev)
 		return -EPROBE_DEFER;
 
 	dev_info(dev->dev, "I2C bus managed by PUNIT\n");
-	dev->acquire_lock = iosf_mbi_block_punit_i2c_access;
-	dev->release_lock = iosf_mbi_unblock_punit_i2c_access;
+	dev->acquire_lock = iosf_mbi_block_punit_i2c_access_dev;
+	dev->release_lock = iosf_mbi_unblock_punit_i2c_access_dev;
 	dev->shared_with_punit = true;
 
 	return 0;
diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index e8a688d04aee..743875090356 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -524,7 +524,7 @@ int i2c_dw_acquire_lock(struct dw_i2c_dev *dev)
 	if (!dev->acquire_lock)
 		return 0;
 
-	ret = dev->acquire_lock();
+	ret = dev->acquire_lock(dev);
 	if (!ret)
 		return 0;
 
@@ -536,7 +536,7 @@ int i2c_dw_acquire_lock(struct dw_i2c_dev *dev)
 void i2c_dw_release_lock(struct dw_i2c_dev *dev)
 {
 	if (dev->release_lock)
-		dev->release_lock();
+		dev->release_lock(dev);
 }
 
 /*
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index e9606c00b8d1..12b77f464fb5 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -291,8 +291,8 @@ struct dw_i2c_dev {
 	u16			fp_lcnt;
 	u16			hs_hcnt;
 	u16			hs_lcnt;
-	int			(*acquire_lock)(void);
-	void			(*release_lock)(void);
+	int			(*acquire_lock)(struct dw_i2c_dev *dev);
+	void			(*release_lock)(struct dw_i2c_dev *dev);
 	int			semaphore_idx;
 	bool			shared_with_punit;
 	void			(*disable)(struct dw_i2c_dev *dev);
-- 
2.27.0


