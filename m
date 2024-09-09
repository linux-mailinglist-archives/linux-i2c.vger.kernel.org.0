Return-Path: <linux-i2c+bounces-6379-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7224970B96
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 03:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15D66B21766
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Sep 2024 01:57:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E4FF11712;
	Mon,  9 Sep 2024 01:57:22 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail03.siengine.com (mail03.siengine.com [43.240.192.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B080512E75;
	Mon,  9 Sep 2024 01:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.240.192.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725847042; cv=none; b=U/qKeuJHUndn/bDrkJ+QGAtLYJZGop6LHw/lTfDTEhjq8aDvWEeYQcds0SyhB027JaFPSPg2lZbzUr2ApkQCL0pZvQzwrwk9tMXn4faJtG3QR0I69TOoc4pjZxnbgoaQD6SAd4TIuwPf5B/Rf5qgxqHMr/j190tuT4gZ29dsE3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725847042; c=relaxed/simple;
	bh=gomuHYepYV55LsQtuiU2pGyDxQqh1vId63Nfx0Lzwdk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PuJ93xftQ5PQFvxImDsSdDhE6jwEPIpvMyaPJyUy/tYGeVEsLuDj4FWkkMYEy6k/wNjYGeIX9H6PC9NNHZ5LQ3tmFOYtggkEZvmi61ObiMw6auhAVDdlAyZ82n+mnGOiv0feZZr/KwW/WOX0fSZc4lN5UFQLRE8Hg087xB4j8MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com; spf=pass smtp.mailfrom=siengine.com; arc=none smtp.client-ip=43.240.192.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siengine.com
Received: from dsgsiengine01.siengine.com ([10.8.1.61])
	by mail03.siengine.com with ESMTPS id 4891unRq087872
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 9 Sep 2024 09:56:49 +0800 (+08)
	(envelope-from hongchi.peng@siengine.com)
Received: from SEEXMB03-2019.siengine.com (SEEXMB03-2019.siengine.com [10.8.1.33])
	by dsgsiengine01.siengine.com (SkyGuard) with ESMTPS id 4X291X0V8Rz7ZMrD;
	Mon,  9 Sep 2024 09:56:48 +0800 (CST)
Received: from SEEXMB05-2019.siengine.com (10.8.1.153) by
 SEEXMB03-2019.siengine.com (10.8.1.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Mon, 9 Sep 2024 09:56:48 +0800
Received: from SEEXMB03-2019.siengine.com (10.8.1.33) by
 SEEXMB05-2019.siengine.com (10.8.1.153) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.9; Mon, 9 Sep 2024 09:56:47 +0800
Received: from localhost (10.12.10.38) by SEEXMB03-2019.siengine.com
 (10.8.1.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.2.1544.11 via Frontend
 Transport; Mon, 9 Sep 2024 09:56:47 +0800
From: Kimriver Liu <kimriver.liu@siengine.com>
To: <jarkko.nikula@linux.intel.com>
CC: <andriy.shevchenko@linux.intel.com>, <mika.westerberg@linux.intel.com>,
        <jsd@semihalf.com>, <andi.shyti@kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kimriver.liu@siengine.com>
Subject: [PATCH v7] i2c: designware: fix master is holding SCL low while ENABLE bit is disabled
Date: Mon, 9 Sep 2024 09:56:46 +0800
Message-ID: <20240909015646.2285-1-kimriver.liu@siengine.com>
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
X-MAIL:mail03.siengine.com 4891unRq087872

It was observed issuing ABORT bit(IC_ENABLE[1]) will not work when
IC_ENABLE is already disabled.

Check if ENABLE bit(IC_ENABLE[0]) is disabled when the master is
holding SCL low. If ENABLE bit is disabled, the software need
enable it before trying to issue ABORT bit. otherwise,
the controller ignores any write to ABORT bit.

Signed-off-by: Kimriver Liu <kimriver.liu@siengine.com>

---
V6->V7:
	1. add Subject versioning [PATCH v7]
	2. change fsleep(25) to usleep_range(25, 250)
	3. Add macro definition DW_iC_ENABLE_ENABLE to fix compile errors
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
 drivers/i2c/busses/i2c-designware-common.c | 12 ++++++++++++
 drivers/i2c/busses/i2c-designware-core.h   |  1 +
 drivers/i2c/busses/i2c-designware-master.c | 22 ++++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index e8a688d04aee..a105fd1e6b29 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -453,6 +453,18 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
 
 	abort_needed = raw_intr_stats & DW_IC_INTR_MST_ON_HOLD;
 	if (abort_needed) {
+		if (!(enable & DW_IC_ENABLE_ENABLE)) {
+			regmap_write(dev->map, DW_IC_ENABLE, DW_IC_ENABLE_ENABLE);
+			enable |= DW_IC_ENABLE_ENABLE;
+			/*
+			 * Need two ic_clk delay when enabling the I2C to ensure ENABLE bit
+			 * is already set. Wait 10 times the signaling period of the highest
+			 * I2C transfer supported by the driver(for 400KHz this is 25us)
+			 * as described in the DesignWare I2C databook.
+			 */
+			usleep_range(25, 250);
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
index c7e56002809a..132b7237c004 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -253,6 +253,19 @@ static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
 	__i2c_dw_write_intr_mask(dev, DW_IC_INTR_MASTER_MASK);
 }
 
+static bool i2c_dw_is_master_idling(struct dw_i2c_dev *dev)
+{
+	u32 status;
+
+	regmap_read(dev->map, DW_IC_STATUS, &status);
+	if (!(status & DW_IC_STATUS_MASTER_ACTIVITY))
+		return true;
+
+	return !regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
+			!(status & DW_IC_STATUS_MASTER_ACTIVITY),
+			1100, 20000);
+}
+
 static int i2c_dw_check_stopbit(struct dw_i2c_dev *dev)
 {
 	u32 val;
@@ -788,6 +801,15 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 		goto done;
 	}
 
+	/*
+	 * This happens rarely and is hard to reproduce. Debug trace
+	 * showed that IC_STATUS had value of 0x23 when STOP_DET occurred,
+	 * if disable IC_ENABLE.ENABLE immediately that can result in
+	 * IC_RAW_INTR_STAT.MASTER_ON_HOLD holding SCL low.
+	 */
+	if (!i2c_dw_is_master_idling(dev))
+		dev_err(dev->dev, "I2C master not idling\n");
+
 	/*
 	 * We must disable the adapter before returning and signaling the end
 	 * of the current transfer. Otherwise the hardware might continue
-- 
2.17.1


