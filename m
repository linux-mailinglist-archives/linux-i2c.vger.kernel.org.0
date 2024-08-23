Return-Path: <linux-i2c+bounces-5714-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDBB95C395
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 05:05:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7009E1C231CE
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Aug 2024 03:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BDC83717F;
	Fri, 23 Aug 2024 03:05:03 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4F820B33;
	Fri, 23 Aug 2024 03:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.19.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724382303; cv=none; b=hAeShtHmIBAvhp1zSl3H4EuAjB58qmaV0chbS2lyn1Y+faxh/jKr3AgUkhCwZTeIF7PSiN/EifWoh95zCLDCHWwyyphKTu2bHQGy+Depwdq7EySwFquoxa2JYxjJfAkf6JaHd8J8AN6JV49lLZS+UZxZUbbAMyq7697KKOT98as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724382303; c=relaxed/simple;
	bh=wYA32n8apsDrrCroaz23XiRgtIN6FLOe59UHYpX+gP8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KDQyYWwntxaaeKtdq8wCCQY+/A3TnvYb+cGYV8OIsydfZf1JWlF2C68RYFe87DNcpyiY9Xlz/wCYl2Z0e8BQ8ajS3V/h0EoyIvS5H3eEgbKp4zkPneiyxyB9KqTkqgL/53QaCbjyHZXI867lBt2aH1whDmZRQGZMzD20oGoyQXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com; spf=pass smtp.mailfrom=trustnetic.com; arc=none smtp.client-ip=54.207.19.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=trustnetic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trustnetic.com
X-QQ-mid: bizesmtpsz10t1724382253t0w8cy
X-QQ-Originating-IP: DLfjgWbWDrqS3+pDl8ep5c3vVgAjqF/4QIofPLFmZfU=
Received: from wxdbg.localdomain.com ( [125.118.254.234])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 23 Aug 2024 11:04:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5009362697263220875
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
Subject: [PATCH net 1/3] net: txgbe: add IO address in I2C platform device data
Date: Fri, 23 Aug 2024 11:02:40 +0800
Message-Id: <20240823030242.3083528-2-jiawenwu@trustnetic.com>
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

Consider the necessity of reading/writing the IO address to acquire and
release the lock between software and firmware, add the IO address as
the platform data to register I2C platform device.

Cc: stable@vger.kernel.org
Fixes: c625e72561f6 ("net: txgbe: Register I2C platform device")
Signed-off-by: Jiawen Wu <jiawenwu@trustnetic.com>
---
 drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c |  5 +++++
 include/linux/platform_data/i2c-wx.h           | 11 +++++++++++
 2 files changed, 16 insertions(+)
 create mode 100644 include/linux/platform_data/i2c-wx.h

diff --git a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
index 5f502265f0a6..781a3a34aa4c 100644
--- a/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
+++ b/drivers/net/ethernet/wangxun/txgbe/txgbe_phy.c
@@ -9,6 +9,7 @@
 #include <linux/i2c.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
+#include <linux/platform_data/i2c-wx.h>
 #include <linux/regmap.h>
 #include <linux/pcs/pcs-xpcs.h>
 #include <linux/phylink.h>
@@ -618,6 +619,7 @@ static const struct regmap_config i2c_regmap_config = {
 
 static int txgbe_i2c_register(struct txgbe *txgbe)
 {
+	struct txgbe_i2c_platform_data pdata = {};
 	struct platform_device_info info = {};
 	struct platform_device *i2c_dev;
 	struct regmap *i2c_regmap;
@@ -636,6 +638,9 @@ static int txgbe_i2c_register(struct txgbe *txgbe)
 	info.fwnode = software_node_fwnode(txgbe->nodes.group[SWNODE_I2C]);
 	info.name = "i2c_designware";
 	info.id = pci_dev_id(pdev);
+	pdata.hw_addr = wx->hw_addr;
+	info.data = &pdata;
+	info.size_data = sizeof(pdata);
 
 	info.res = &DEFINE_RES_IRQ(pdev->irq);
 	info.num_res = 1;
diff --git a/include/linux/platform_data/i2c-wx.h b/include/linux/platform_data/i2c-wx.h
new file mode 100644
index 000000000000..b46777fa1d85
--- /dev/null
+++ b/include/linux/platform_data/i2c-wx.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2015 - 2024 Beijing WangXun Technology Co., Ltd. */
+
+#ifndef _I2C_WX_H_
+#define _I2C_WX_H_
+
+struct txgbe_i2c_platform_data {
+	void __iomem *hw_addr;
+};
+
+#endif /* _I2C_WX_H_ */
-- 
2.27.0


