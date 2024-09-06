Return-Path: <linux-i2c+bounces-6296-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3AF96EB28
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 08:57:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 328931F258F8
	for <lists+linux-i2c@lfdr.de>; Fri,  6 Sep 2024 06:57:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90DAA141987;
	Fri,  6 Sep 2024 06:57:54 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail03.siengine.com (mail03.siengine.com [43.240.192.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5891613B590;
	Fri,  6 Sep 2024 06:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.240.192.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725605874; cv=none; b=IOyjO8CfW4s80oVhVsyKezpxrnvcXDWjjiz5zczexeFZd4sIcmgr8a2AiLn9HKX6nmJZIbgnHwbATDTdyE6MulGqV4Ab/f7ZE++E9nrmnNdF/7PwLQbsVXSkd4QKdSvafAFCQOXFkvtsRcv12V6ToLZiQjTfrBvKTjZFPZ8OAgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725605874; c=relaxed/simple;
	bh=DpHW5VJNnXEH06XP0PTby3TshzUenRERq6D1rgx8oNA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KJM/uL/fWgS1OSL2jfeoIfldHKGeZPijtK4pYF3DMTTdqqH4Xa6jXQstjBAG3JwDoudeO8Mp2e5eMwDYV1jClQVc+33jwnma1l9NxNWeGtfSFuqJKg8l+kJXmvcTvF1d9abLYW//jiPMj97YxboXkAvQX/DZ5f4IRdFQTrJzlyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com; spf=pass smtp.mailfrom=siengine.com; arc=none smtp.client-ip=43.240.192.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siengine.com
Received: from dsgsiengine01.siengine.com ([10.8.1.61])
	by mail03.siengine.com with ESMTPS id 4866v5Da014756
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 6 Sep 2024 14:57:05 +0800 (+08)
	(envelope-from hongchi.peng@siengine.com)
Received: from SEEXMB03-2019.siengine.com (SEEXMB03-2019.siengine.com [10.8.1.33])
	by dsgsiengine01.siengine.com (SkyGuard) with ESMTPS id 4X0RqN5X1hz7ZMtY;
	Fri,  6 Sep 2024 14:57:04 +0800 (CST)
Received: from SEEXMB03-2019.siengine.com (10.8.1.33) by
 SEEXMB03-2019.siengine.com (10.8.1.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Fri, 6 Sep 2024 14:57:04 +0800
Received: from localhost (10.12.10.38) by SEEXMB03-2019.siengine.com
 (10.8.1.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.2.1544.11 via Frontend
 Transport; Fri, 6 Sep 2024 14:57:04 +0800
From: Kimriver Liu <kimriver.liu@siengine.com>
To: <jarkko.nikula@linux.intel.com>
CC: <andriy.shevchenko@linux.intel.com>, <mika.westerberg@linux.intel.com>,
        <jsd@semihalf.com>, <andi.shyti@kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kimriver.liu@siengine.com>
Subject: [PATCH] i2c: designware: fix master is holding SCL low while ENABLE bit is disabled
Date: Fri, 6 Sep 2024 14:54:49 +0800
Message-ID: <20240906065449.2897-1-kimriver.liu@siengine.com>
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
X-MAIL:mail03.siengine.com 4866v5Da014756

It was observed issuing ABORT bit(IC_ENABLE[1]) will not work when
IC_ENABLE is already disabled.

Check if ENABLE bit(IC_ENABLE[0]) is disabled when the master is
holding SCL low. If ENABLE bit is disabled, the software need
enable it before trying to issue ABORT bit. otherwise,
the controller ignores any write to ABORT bit.

Signed-off-by: Kimriver Liu <kimriver.liu@siengine.com>

---
V4->V5: delete master idling checking
V3->V4:
      1. update commit messages and add patch version and changelog
      2. move print the error message in i2c_dw_xfer
V2->V3: change (!enable) to (!(enable & DW_IC_ENABLE_ENABLE))
V1->V2: used standard words in function names and addressed review comments

link to V1:
https://lore.kernel.org/lkml/20240904064224.2394-1-kimriver.liu@siengine.com/
---
 drivers/i2c/busses/i2c-designware-common.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index e8a688d04aee..2b3398cd4382 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -453,6 +453,17 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
 
 	abort_needed = raw_intr_stats & DW_IC_INTR_MST_ON_HOLD;
 	if (abort_needed) {
+		if (!(enable & DW_IC_ENABLE_ENABLE)) {
+			regmap_write(dev->map, DW_IC_ENABLE, DW_IC_ENABLE_ENABLE);
+			enable |= DW_IC_ENABLE_ENABLE;
+			/*
+			 * Wait two ic_clk delay when enabling the I2C to ensure ENABLE bit
+			 * is already set by the driver (for 400KHz this is 25us)
+			 * as described in the DesignWare I2C databook.
+			 */
+			fsleep(25);
+		}
+
 		regmap_write(dev->map, DW_IC_ENABLE, enable | DW_IC_ENABLE_ABORT);
 		ret = regmap_read_poll_timeout(dev->map, DW_IC_ENABLE, enable,
 					       !(enable & DW_IC_ENABLE_ABORT), 10,
-- 
2.17.1


