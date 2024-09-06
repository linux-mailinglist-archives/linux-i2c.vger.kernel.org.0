Return-Path: <linux-i2c+bounces-6293-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B0E96E96C
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 07:46:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEDB11C22AE0
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 05:45:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2C8181AD2;
	Fri,  6 Sep 2024 05:45:54 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail03.siengine.com (mail03.siengine.com [43.240.192.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9B511CBD;
	Fri,  6 Sep 2024 05:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.240.192.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725601554; cv=none; b=b8coZ+bRj4dz5TCkuvRxC2gRb9WqnXsiSwqk4+lM934g7pQB012lqxDMFyD204nJrRULRzr1qcBPDSeA22sX0wP7q16SwyZkPKXdW1FkXAk6kY8YpCCyhGRGprwRAgBBB5w9LNuR6+YEnInYvN59b4TLn0hNYFZL/3i4FgRV3Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725601554; c=relaxed/simple;
	bh=ryzMGHZFu8iO8l1xB+6ZJzWrGgo7UxjgkWnVYBnv8gg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mksLzbr29fGdlhU8syVw1Ms4vknM+QtmiNLTDvXTbKApuCBU7lgghsdivhF2Gj1Lc/L76bbachkEnmlHRTFdiwhor1rUXnRD5UiP2L23XZffytwVc1izxhBNd8EIua1v61fNADiZdgXunZrDweCu2kYVk//07GaaO0Cc8Prze4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com; spf=pass smtp.mailfrom=siengine.com; arc=none smtp.client-ip=43.240.192.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siengine.com
Received: from dsgsiengine01.siengine.com ([10.8.1.61])
	by mail03.siengine.com with ESMTPS id 4865j8bM004722
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 6 Sep 2024 13:45:08 +0800 (+08)
	(envelope-from hongchi.peng@siengine.com)
Received: from SEEXMB03-2019.siengine.com (SEEXMB03-2019.siengine.com [10.8.1.33])
	by dsgsiengine01.siengine.com (SkyGuard) with ESMTPS id 4X0QDM4BqFz7ZMgn;
	Fri,  6 Sep 2024 13:45:07 +0800 (CST)
Received: from SEEXMB03-2019.siengine.com (10.8.1.33) by
 SEEXMB03-2019.siengine.com (10.8.1.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Fri, 6 Sep 2024 13:45:07 +0800
Received: from localhost (10.12.10.38) by SEEXMB03-2019.siengine.com
 (10.8.1.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.2.1544.11 via Frontend
 Transport; Fri, 6 Sep 2024 13:45:07 +0800
From: Kimriver Liu <kimriver.liu@siengine.com>
To: <jarkko.nikula@linux.intel.com>
CC: <andriy.shevchenko@linux.intel.com>, <mika.westerberg@linux.intel.com>,
        <jsd@semihalf.com>, <andi.shyti@kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kimriver.liu@siengine.com>
Subject: [PATCH] i2c: designware: fix master is holding SCL low while ENABLE bit is disabled
Date: Fri, 6 Sep 2024 13:42:50 +0800
Message-ID: <20240906054250.2745-1-kimriver.liu@siengine.com>
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
X-MAIL:mail03.siengine.com 4865j8bM004722

It was observed issuing ABORT bit(IC_ENABLE[1]) will not work when
IC_ENABLE is already disabled.

Check if ENABLE bit(IC_ENABLE[0]) is disabled when the master is
holding SCL low. If ENABLE bit is disabled, the software need
enable it before trying to issue ABORT bit. otherwise,
the controller ignores any write to ABORT bit

Signed-off-by: Kimriver Liu <kimriver.liu@siengine.com>

---

V3->V4:
      1. update commit messages and add patch version and changelog
      2. move print the error message in i2c_dw_xfer
V2->V3: change (!enable) to (!(enable & DW_IC_ENABLE_ENABLE))
V1->V2: used standard words in function names and addressed review comments

link to V1:
https://lore.kernel.org/lkml/20240904064224.2394-1-kimriver.liu@siengine.com/
---
 drivers/i2c/busses/i2c-designware-common.c | 12 ++++++++++
 drivers/i2c/busses/i2c-designware-master.c | 27 ++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index e8a688d04aee..54acf8554582 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -453,6 +453,18 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
 
 	abort_needed = raw_intr_stats & DW_IC_INTR_MST_ON_HOLD;
 	if (abort_needed) {
+		if (!(enable & DW_IC_ENABLE_ENABLE)) {
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
index c7e56002809a..6a053f3b5501 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -253,6 +253,24 @@ static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
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
+	if (ret)
+		return false;
+
+	return true;
+}
+
 static int i2c_dw_check_stopbit(struct dw_i2c_dev *dev)
 {
 	u32 val;
@@ -788,6 +806,15 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 		goto done;
 	}
 
+	/*
+	 * This happens rarely and is hard to reproduce. Debug trace
+	 * showed that IC_STATUS had value of 0x23 when STOP_DET occurred,
+	 * if disable IC_ENABLE.ENABLE immediately that can result in
+	 * IC_RAW_INTR_STAT.MASTER_ON_HOLD holding SCL low.
+	 */
+	if (!i2c_dw_is_master_idling(dev))
+		dev_err(dev->dev, "i2c master controller not idle\n");
+
 	/*
 	 * We must disable the adapter before returning and signaling the end
 	 * of the current transfer. Otherwise the hardware might continue
-- 
2.17.1


