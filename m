Return-Path: <linux-i2c+bounces-6661-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C74977765
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 05:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 980C91C243AA
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Sep 2024 03:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB93A6F315;
	Fri, 13 Sep 2024 03:34:13 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail03.siengine.com (mail03.siengine.com [43.240.192.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2B18827
	for <linux-i2c@vger.kernel.org>; Fri, 13 Sep 2024 03:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.240.192.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726198453; cv=none; b=k6Fuc3yKFS+K+fqUDlGOF6VQ2UbrcfpS59TNtFJsZ7R1VF0NTXC0UKc+9YRDMyvAwiAxA5rs44aubE3SmMEdGranLp6aPpmhedTQvpxLsH6yECLg8hNrw+VUcieLqj027Mh2Xw3DRWW10BayFH7yybwxl05rCX1R4RnwF7Z5YIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726198453; c=relaxed/simple;
	bh=32HCVF9iRQmnSGINGQ2xIZwpHLsquwDRbsw8Kz3FR5Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=TKC3LsFKezbsyOntWgMHEwk9S0W2rOmXnuee6+d5q/GemCnFUjkMU+K8EAJvAx8Qk3HNP72CXz0ORCWmPw+9adfLw4LVKJG2xesXvHQhJ+sLCPJxU//HTzTNNA4EB4a6EWd3JXa2ZxSVsmMHsF5EyXfGXy2vULEctr/NfDds6Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com; spf=pass smtp.mailfrom=siengine.com; arc=none smtp.client-ip=43.240.192.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siengine.com
Received: from dsgsiengine01.siengine.com ([10.8.1.61])
	by mail03.siengine.com with ESMTPS id 48D3Y25c076613
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 13 Sep 2024 11:34:02 +0800 (+08)
	(envelope-from hongchi.peng@siengine.com)
Received: from SEEXMB03-2019.siengine.com (SEEXMB03-2019.siengine.com [10.8.1.33])
	by dsgsiengine01.siengine.com (SkyGuard) with ESMTPS id 4X4fzr5jprz7ZMt2;
	Fri, 13 Sep 2024 11:34:00 +0800 (CST)
Received: from SEEXMB03-2019.siengine.com (10.8.1.33) by
 SEEXMB03-2019.siengine.com (10.8.1.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Fri, 13 Sep 2024 11:34:01 +0800
Received: from localhost (10.12.10.38) by SEEXMB03-2019.siengine.com
 (10.8.1.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.2.1544.11 via Frontend
 Transport; Fri, 13 Sep 2024 11:34:01 +0800
From: Kimriver Liu <kimriver.liu@siengine.com>
To: <jarkko.nikula@linux.intel.com>
CC: <andriy.shevchenko@linux.intel.com>, <mika.westerberg@linux.intel.com>,
        <jsd@semihalf.com>, <andi.shyti@kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kimriver.liu@siengine.com>, Andy Shevchenko
	<andy@kernel.org>
Subject: [PATCH v11] i2c: designware: fix controller is holding SCL low while ENABLE bit is disabled
Date: Fri, 13 Sep 2024 11:31:46 +0800
Message-ID: <4ebc4e8882a52620cbca30f1bf25650cbc3723fb.1726197817.git.kimriver.liu@siengine.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-DKIM-Results: [10.8.1.61]; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:mail03.siengine.com 48D3Y25c076613

It was observed that issuing the ABORT bit (IC_ENABLE[1]) will not
work when IC_ENABLE is already disabled.

Check if the ENABLE bit (IC_ENABLE[0]) is disabled when the controller
is holding SCL low. If the ENABLE bit is disabled, the software needs
to enable it before trying to issue the ABORT bit. otherwise,
the controller ignores any write to ABORT bit.

These kernel logs show up whenever an I2C transaction is
attempted after this failure.
i2c_designware e95e0000.i2c: timeout waiting for bus ready
i2c_designware e95e0000.i2c: timeout in disabling adapter

The patch fixes the issue where the controller cannot be disabled
while SCL is held low if the ENABLE bit is already disabled.

Fixes: 2409205acd3c ("i2c: designware: fix __i2c_dw_disable() in case master is holding SCL low")
Signed-off-by: Kimriver Liu <kimriver.liu@siengine.com>
Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Reviewed-by: Andy Shevchenko <andy@kernel.org>
---
V10->V11:
	1. update commit messages and comments
	2. add Reviewed-by: Andy Shevchenko <andy@kernel.org>
V9->V10:
	1. return a boolean value for i2c_dw_is_controller_active()
	2. update comments and indentation alignment
V8->V9:
	1. update commit messages and comments
	2. add Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
	3. add fixes tag
	4. change function i2c_dw_is_master_idling to i2c_dw_is_controller_active
	5. update subject as: fix controller is holding SCL low while ENABLE bit is disabled
V7->V8:
	1. calculate this delay based on the actual speed in use
	  fsleep(DIV_ROUND_CLOSEST_ULL(10 * MICRO, t->bus_freq_hz))
	2. add Reviewed-by: Mika Westerberg<mika.westerberg@linux.intel.com>
V6->V7:
	1. add Subject versioning [PATCH v7]
	2. change fsleep(25) to usleep_range(25, 250)
	3. Add macro definition DW_iC_ENABLE_ENABLE to fix compile errors
	  | Reported-by: kernel test robot <lkp@intel.com>
	  | Closes:https://lore.kernel.org/oe-kbuild-all/202409082011.9JF6aYsk-lkp@intel.com/
	4. base: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=master
V5->V6: restore i2c_dw_is_master_idling() function checking
V4->V5: delete master idling checking
V3->V4:
	1. update commit messages and add patch version and changelog
	2. move print the error message in i2c_dw_xfer
V2->V3: change (!enable) to (!(enable & DW_IC_ENABLE_ENABLE))
V1->V2: used standard words in function names and addressed review comments

link to V1:
https://lore.kernel.org/lkml/20240904064224.2394-1-kimriver.liu@siengine.com/
---
 drivers/i2c/busses/i2c-designware-common.c | 14 +++++++++
 drivers/i2c/busses/i2c-designware-core.h   |  1 +
 drivers/i2c/busses/i2c-designware-master.c | 35 ++++++++++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index e8a688d04aee..2d71489ab213 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -441,6 +441,7 @@ int i2c_dw_set_sda_hold(struct dw_i2c_dev *dev)
 
 void __i2c_dw_disable(struct dw_i2c_dev *dev)
 {
+	struct i2c_timings *t = &dev->timings;
 	unsigned int raw_intr_stats;
 	unsigned int enable;
 	int timeout = 100;
@@ -453,6 +454,19 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
 
 	abort_needed = raw_intr_stats & DW_IC_INTR_MST_ON_HOLD;
 	if (abort_needed) {
+		if (!(enable & DW_IC_ENABLE_ENABLE)) {
+			regmap_write(dev->map, DW_IC_ENABLE, DW_IC_ENABLE_ENABLE);
+			/*
+			 * Wait 10 times the signaling period of the highest I2C
+			 * transfer supported by the driver (for 400KHz this is
+			 * 25us) to ensure the I2C ENABLE bit is already set
+			 * as described in the DesignWare I2C databook.
+			 */
+			fsleep(DIV_ROUND_CLOSEST_ULL(10 * MICRO, t->bus_freq_hz));
+			/*Set ENABLE bit before setting ABORT*/
+			enable |= DW_IC_ENABLE_ENABLE;
+		}
+
 		regmap_write(dev->map, DW_IC_ENABLE, enable | DW_IC_ENABLE_ABORT);
 		ret = regmap_read_poll_timeout(dev->map, DW_IC_ENABLE, enable,
 					       !(enable & DW_IC_ENABLE_ABORT), 10,
diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
index e9606c00b8d1..e45daedad967 100644
--- a/drivers/i2c/busses/i2c-designware-core.h
+++ b/drivers/i2c/busses/i2c-designware-core.h
@@ -109,6 +109,7 @@
 						 DW_IC_INTR_RX_UNDER | \
 						 DW_IC_INTR_RD_REQ)
 
+#define DW_IC_ENABLE_ENABLE			BIT(0)
 #define DW_IC_ENABLE_ABORT			BIT(1)
 
 #define DW_IC_STATUS_ACTIVITY			BIT(0)
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index c7e56002809a..4fe69a0996f3 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -253,6 +253,31 @@ static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
 	__i2c_dw_write_intr_mask(dev, DW_IC_INTR_MASTER_MASK);
 }
 
+/*
+ * This function waits controller idling before disabling I2C
+ * When the controller is not in the IDLE state,
+ * MST_ACTIVITY bit (IC_STATUS[5]) is set.
+ * Values:
+ * 0x1 (ACTIVE): Controller not idle
+ * 0x0 (IDLE): Controller is idle
+ * The function is called after returning the end of the current transfer
+ * Returns:
+ * False when controller is in IDLE state.
+ * True when controller is in ACTIVE state.
+ */
+static bool i2c_dw_is_controller_active(struct dw_i2c_dev *dev)
+{
+	u32 status;
+
+	regmap_read(dev->map, DW_IC_STATUS, &status);
+	if (!(status & DW_IC_STATUS_MASTER_ACTIVITY))
+		return false;
+
+	return regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
+				       !(status & DW_IC_STATUS_MASTER_ACTIVITY),
+				       1100, 20000) != 0;
+}
+
 static int i2c_dw_check_stopbit(struct dw_i2c_dev *dev)
 {
 	u32 val;
@@ -788,6 +813,16 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 		goto done;
 	}
 
+	/*
+	 * This happens rarely (~1:500) and is hard to reproduce. Debug trace
+	 * showed that IC_STATUS had value of 0x23 when STOP_DET occurred,
+	 * if disable IC_ENABLE.ENABLE immediately that can result in
+	 * IC_RAW_INTR_STAT.MASTER_ON_HOLD holding SCL low. Check if
+	 * controller is still ACTIVE before disabling I2C.
+	 */
+	if (i2c_dw_is_controller_active(dev))
+		dev_err(dev->dev, "controller active\n");
+
 	/*
 	 * We must disable the adapter before returning and signaling the end
 	 * of the current transfer. Otherwise the hardware might continue
-- 
2.17.1


