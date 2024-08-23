Return-Path: <linux-i2c+bounces-5713-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E7E95C391
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 05:05:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2CAFA1F22ED0
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 03:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 566C92E3EB;
	Fri, 23 Aug 2024 03:04:55 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C17286A2;
	Fri, 23 Aug 2024 03:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724382295; cv=none; b=TqzHcqQXK0eUZLv1mVyPSPS5DrsnvHvc/7SXuyKxi7ZdWfD6HcH605pywg/rWy/oKCd7f23eaywGUlgIjqmMOa090nqh3AfcLo601xaLltv4LL406HniwdIyv/tAQAOSl+XS5QsmdQ7dJfkyKmHWgRIHwzIODZQNj0vUmWK8WFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724382295; c=relaxed/simple;
	bh=mcEAXU1FvnggaQBD5YJ9DeWVw3HJs/NjfryhgfYZUs4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Fw2duDjKq3a6tmvtN6qKunF1kJJRRa2rIhCdECJNbaVRf7z9SL5pV0NgByjMsu0MROCS10E1gMwixIAnpBlZdn7uJnzojLNvP4iexk1hkquzy9aqjFncjYH6CObhI3Swt+isJuJmHe2TcaAnLw9vS4Lekky0tKPHt6ZCrNeA/Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com; spf=pass smtp.mailfrom=trustnetic.com; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trustnetic.com
X-QQ-mid: bizesmtpsz10t1724382259ta2caz
X-QQ-Originating-IP: gbUqlHL0NTEjZfGdEQ+MEW0Ib4b1Gf1GRt+0vWy6wNE=
Received: from wxdbg.localdomain.com ( [125.118.254.234])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Aug 2024 11:04:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11173995996635364265
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
Subject: [PATCH net 3/3] i2c: designware: support hardware lock for Wangxun 10Gb NIC
Date: Fri, 23 Aug 2024 11:02:42 +0800
Message-Id: <20240823030242.3083528-4-jiawenwu@trustnetic.com>
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

Support acquire_lock() and release_lock() for Wangxun 10Gb NIC. Since the
firmware needs to access I2C all the time for some features, the semaphore
is used between software and firmware. The driver should set software
semaphore before accessing I2C bus and release it when it is finished.
Otherwise, there is probability that the correct information on I2C bus
will not be obtained.

Cc: stable@vger.kernel.org
Fixes: 2f8d1ed79345 ("i2c: designware: Add driver support for Wangxun 10Gb NIC")
Signed-off-by: Jiawen Wu <jiawenwu@trustnetic.com>
---
 drivers/i2c/busses/Makefile                 |  1 +
 drivers/i2c/busses/i2c-designware-core.h    |  2 +
 drivers/i2c/busses/i2c-designware-platdrv.c |  3 +
 drivers/i2c/busses/i2c-designware-wx.c      | 65 +++++++++++++++++++++
 4 files changed, 71 insertions(+)
 create mode 100644 drivers/i2c/busses/i2c-designware-wx.c

diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
index 78d0561339e5..f0ad9ebaacaa 100644
--- a/drivers/i2c/busses/Makefile
+++ b/drivers/i2c/busses/Makefile
@@ -58,6 +58,7 @@ i2c-designware-core-y					+= i2c-designware-master.o
 i2c-designware-core-$(CONFIG_I2C_DESIGNWARE_SLAVE) 	+= i2c-designware-slave.o
 obj-$(CONFIG_I2C_DESIGNWARE_PLATFORM)			+= i2c-designware-platform.o
 i2c-designware-platform-y 				:= i2c-designware-platdrv.o
+i2c-designware-platform-y 				+= i2c-designware-wx.o
 i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_AMDPSP)	+= i2c-designware-amdpsp.o
 i2c-designware-platform-$(CONFIG_I2C_DESIGNWARE_BAYTRAIL) += i2c-designware-baytrail.o
 obj-$(CONFIG_I2C_DESIGNWARE_PCI)			+= i2c-designware-pci.o
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index 12b77f464fb5..eae2c4cdc851 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -414,6 +414,8 @@ int i2c_dw_baytrail_probe_lock_support(struct dw_i2c_dev *dev);
 int i2c_dw_amdpsp_probe_lock_support(struct dw_i2c_dev *dev);
 #endif
 
+int i2c_dw_txgbe_probe_lock_support(struct dw_i2c_dev *dev);
+
 int i2c_dw_validate_speed(struct dw_i2c_dev *dev);
 void i2c_dw_adjust_bus_speed(struct dw_i2c_dev *dev);
 
diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
index df3dc1e8093e..49c71ae5b6c1 100644
--- a/drivers/i2c/busses/i2c-designware-platdrv.c
+++ b/drivers/i2c/busses/i2c-designware-platdrv.c
@@ -229,6 +229,9 @@ static const struct i2c_dw_semaphore_callbacks i2c_dw_semaphore_cb_table[] = {
 		.probe = i2c_dw_amdpsp_probe_lock_support,
 	},
 #endif
+	{
+		.probe = i2c_dw_txgbe_probe_lock_support,
+	},
 	{}
 };
 
diff --git a/drivers/i2c/busses/i2c-designware-wx.c b/drivers/i2c/busses/i2c-designware-wx.c
new file mode 100644
index 000000000000..0f98160b956d
--- /dev/null
+++ b/drivers/i2c/busses/i2c-designware-wx.c
@@ -0,0 +1,65 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2015 - 2024 Beijing WangXun Technology Co., Ltd. */
+
+#include <linux/platform_data/i2c-wx.h>
+#include <linux/platform_device.h>
+#include <linux/i2c.h>
+#include <linux/pci.h>
+
+#include "i2c-designware-core.h"
+
+#define I2C_DW_TXGBE_REQ_RETRY_CNT	4000
+#define I2C_DW_TXGBE_MNG_SW		0x1E004
+#define I2C_DW_TXGBE_MNG_SW_SM		BIT(0)
+#define I2C_DW_TXGBE_FLUSH		0x10000
+
+static int i2c_dw_txgbe_acquire_lock(struct dw_i2c_dev *dev)
+{
+	void __iomem *req_addr;
+	u32 swsm;
+	int i;
+
+	req_addr = dev->ext + I2C_DW_TXGBE_MNG_SW;
+
+	for (i = 0; i < I2C_DW_TXGBE_REQ_RETRY_CNT; i++) {
+		writel(I2C_DW_TXGBE_MNG_SW_SM, req_addr);
+
+		/* If we set the bit successfully then we got semaphore. */
+		swsm = readl(req_addr);
+		if (swsm & I2C_DW_TXGBE_MNG_SW_SM)
+			break;
+
+		udelay(50);
+	}
+
+	if (i == I2C_DW_TXGBE_REQ_RETRY_CNT)
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
+static void i2c_dw_txgbe_release_lock(struct dw_i2c_dev *dev)
+{
+	writel(0, dev->ext + I2C_DW_TXGBE_MNG_SW);
+	/* flush register status */
+	readl(dev->ext + I2C_DW_TXGBE_FLUSH);
+}
+
+int i2c_dw_txgbe_probe_lock_support(struct dw_i2c_dev *dev)
+{
+	struct platform_device *pdev = to_platform_device(dev->dev);
+	struct txgbe_i2c_platform_data *pdata;
+
+	pdata = dev_get_platdata(&pdev->dev);
+	if (!pdata)
+		return -ENXIO;
+
+	dev->ext = pdata->hw_addr;
+	if (!dev->ext)
+		return -ENXIO;
+
+	dev->acquire_lock = i2c_dw_txgbe_acquire_lock;
+	dev->release_lock = i2c_dw_txgbe_release_lock;
+
+	return 0;
+}
-- 
2.27.0


