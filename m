Return-Path: <linux-i2c+bounces-6223-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0322296CED1
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 07:58:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A7FC51F221C2
	for <lists+linux-i2c@lfdr.de>; Thu,  5 Sep 2024 05:58:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F57E15884D;
	Thu,  5 Sep 2024 05:58:46 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail03.siengine.com (mail03.siengine.com [43.240.192.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E02314F11E;
	Thu,  5 Sep 2024 05:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.240.192.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725515926; cv=none; b=ZecxuwfgMC9lgDwvk3cuBqJjwwfUp8PznkNFeOEe0iMgIzlWDmrtB7aL5EUFrVNDRTshucgvyg7hEggf7Pp/fj0Z24xmojSoT04fDnvbbVwt20ckZG7CC0U5mFM09Vt+t5DUfObg00mV4RLALs3T5tP3NbWgGZh6kMWLCMl7HFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725515926; c=relaxed/simple;
	bh=Xk3h1utae7k0bsWwl81h57s5ztIBgN6khBzBEac2O5Q=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=IqsUmdaTTcAgfPW7/u4v+XvrLNPd7EUSy5Bk+EZvfTuXIx7/tTuDXF2g0CLlKNfvmMP8kg11BfcaSy9gyxCm25OgrESjHfigLB8K9UfdS293wmvrSNzO5ueo3P7CzkdPohRro1KCNHiKEQpFIY4vjiPcV8EEyPZQTEGYSUBJUEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com; spf=pass smtp.mailfrom=siengine.com; arc=none smtp.client-ip=43.240.192.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siengine.com
Received: from dsgsiengine01.siengine.com ([10.8.1.61])
	by mail03.siengine.com with ESMTPS id 4855vwXo021357
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 5 Sep 2024 13:57:58 +0800 (+08)
	(envelope-from hongchi.peng@siengine.com)
Received: from SEEXMB03-2019.siengine.com (SEEXMB03-2019.siengine.com [10.8.1.33])
	by dsgsiengine01.siengine.com (SkyGuard) with ESMTPS id 4WzpYd0dBCz7ZMhp;
	Thu,  5 Sep 2024 13:57:57 +0800 (CST)
Received: from SEEXMB05-2019.siengine.com (10.8.1.153) by
 SEEXMB03-2019.siengine.com (10.8.1.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Thu, 5 Sep 2024 13:57:57 +0800
Received: from SEEXMB03-2019.siengine.com (10.8.1.33) by
 SEEXMB05-2019.siengine.com (10.8.1.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.9; Thu, 5 Sep 2024 13:57:57 +0800
Received: from localhost (10.12.10.38) by SEEXMB03-2019.siengine.com
 (10.8.1.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.2.1544.11 via Frontend
 Transport; Thu, 5 Sep 2024 13:57:56 +0800
From: kimriver liu <kimriver.liu@siengine.com>
To: <jarkko.nikula@linux.intel.com>
CC: <andriy.shevchenko@linux.intel.com>, <mika.westerberg@linux.intel.com>,
        <jsd@semihalf.com>, <andi.shyti@kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kimriver.liu@siengine.com>
Subject: [PATCH] i2c: designware: fix master is holding SCL low while ENABLE bit is disabled
Date: Thu, 5 Sep 2024 13:57:53 +0800
Message-ID: <20240905055753.2276-1-kimriver.liu@siengine.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-DKIM-Results: [10.8.1.61]; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:mail03.siengine.com 4855vwXo021357

From: "kimriver.liu" <kimriver.liu@siengine.com>

Failure in normal Stop operational path

This failure happens rarely and is hard to reproduce. Debug trace
showed that IC_STATUS had value of 0x23 when STOP_DET occurred,
immediately disable ENABLE bit that can result in
IC_RAW_INTR_STAT.MASTER_ON_HOLD holding SCL low.

Failure in ENABLE bit is disabled path

It was observed that master is holding SCL low and the IC_ENABLE is
already disabled, Enable ABORT bit and ENABLE bit simultaneously
cannot take effect.

Check if the master is holding SCL low after ENABLE bit is already
disabled. If SCL is held low, The software can set this ABORT bit only
when ENABLE is already set，otherwise,
the controller ignores any write to ABORT bit. When the abort is done,
then proceed with disabling the controller.

These kernel logs show up whenever an I2C transaction is attempted
after this failure.
i2c_designware e95e0000.i2c: timeout in disabling adapter
i2c_designware e95e0000.i2c: timeout waiting for bus ready

The patch can be fix the controller cannot be disabled while SCL is
held low in ENABLE bit is already disabled.

Signed-off-by: kimriver.liu <kimriver.liu@siengine.com>
---
 drivers/i2c/busses/i2c-designware-common.c | 12 +++++++++++
 drivers/i2c/busses/i2c-designware-master.c | 23 +++++++++++++++++++++-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index e8a688d04aee..74cefbb62bcd 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -453,6 +453,18 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
 
 	abort_needed = raw_intr_stats & DW_IC_INTR_MST_ON_HOLD;
 	if (abort_needed) {
+		if (!enable) {
+			regmap_write(dev->map, DW_IC_ENABLE, DW_IC_ENABLE_ENABLE);
+			enable |= DW_IC_ENABLE_ENABLE;
+
+			/*
+			 * Wait two ic_clk delay when enabling the i2c to ensure ENABLE bit
+			 * is already set by the driver (for 400KHz this is 25us)
+			 * as described in the DesignWare I2C databook.
+			 */
+			fsleep(25);
+		}
+
 		regmap_write(dev->map, DW_IC_ENABLE, enable | DW_IC_ENABLE_ABORT);
 		ret = regmap_read_poll_timeout(dev->map, DW_IC_ENABLE, enable,
 					       !(enable & DW_IC_ENABLE_ABORT), 10,
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index c7e56002809a..aba0b8fdfe9a 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -253,6 +253,26 @@ static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
 	__i2c_dw_write_intr_mask(dev, DW_IC_INTR_MASTER_MASK);
 }
 
+static bool i2c_dw_is_master_idling(struct dw_i2c_dev *dev)
+{
+	u32 status;
+	int ret;
+
+	regmap_read(dev->map, DW_IC_STATUS, &status);
+	if (!(status & DW_IC_STATUS_MASTER_ACTIVITY))
+		return true;
+
+	ret = regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
+			!(status & DW_IC_STATUS_MASTER_ACTIVITY),
+			1100, 20000);
+	if (ret) {
+		dev_err(dev->dev, "i2c master controller not idle %d\n", ret);
+		return false;
+	}
+
+	return true;
+}
+
 static int i2c_dw_check_stopbit(struct dw_i2c_dev *dev)
 {
 	u32 val;
@@ -796,7 +816,8 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	 * additional interrupts are a hardware bug or this driver doesn't
 	 * handle them correctly yet.
 	 */
-	__i2c_dw_disable_nowait(dev);
+	if (i2c_dw_is_master_idling(dev))
+		__i2c_dw_disable_nowait(dev);
 
 	if (dev->msg_err) {
 		ret = dev->msg_err;
-- 
2.17.1


