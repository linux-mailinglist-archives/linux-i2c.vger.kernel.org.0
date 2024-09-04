Return-Path: <linux-i2c+bounces-6113-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E8296B22E
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 08:56:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EA491F23D82
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 06:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDE2913B2A4;
	Wed,  4 Sep 2024 06:56:20 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail03.siengine.com (mail03.siengine.com [43.240.192.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C2961EC01C;
	Wed,  4 Sep 2024 06:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.240.192.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725432980; cv=none; b=XPA7o3jY74B8btGJ7LU2VTJFC1zSeRDCtAL8Cy6t9ZuBdb53TfxfetxrFZQR3GI7/Yy2tW8luJ3ptm252z3Ib5orzwQgL59wH4dEm9UFhA359mq7O6roKDZJCrB3szHzu+EkyltAXIcla+dzADJHMKiAUJEYYW9fYOPiRMUMTVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725432980; c=relaxed/simple;
	bh=CH8geJ27HjFPuuIteu8p3MEwPbCUSv5qU44WMgLUlSM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=lO+ap+h6zkvn7Tkz7tQCZ1JSTAq00mxeIGLgll0tO38C4dRqPvx3tRADdUM4VsDTSalllLDIxSTQ0Usaxfqeu09heCm3qUdpwEXE2Ol9HpDJjFrv3uITRLSZaLgq6Q1rMYwLg/M3glhjWKoRfX36NFP06NH1NgDrP/Ftv3VZLgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com; spf=pass smtp.mailfrom=siengine.com; arc=none smtp.client-ip=43.240.192.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siengine.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siengine.com
Received: from mail03.siengine.com (localhost [127.0.0.2] (may be forged))
	by mail03.siengine.com with ESMTP id 4846jtQ9038482;
	Wed, 4 Sep 2024 14:45:55 +0800 (+08)
	(envelope-from hongchi.peng@siengine.com)
Received: from dsgsiengine01.siengine.com ([10.8.1.61])
	by mail03.siengine.com with ESMTPS id 4846ifOd038191
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 4 Sep 2024 14:44:41 +0800 (+08)
	(envelope-from hongchi.peng@siengine.com)
Received: from SEEXMB03-2019.siengine.com (SEEXMB03-2019.siengine.com [10.8.1.33])
	by dsgsiengine01.siengine.com (SkyGuard) with ESMTPS id 4WzCf027tNz7ZMlC;
	Wed,  4 Sep 2024 14:44:40 +0800 (CST)
Received: from SEEXMB03-2019.siengine.com (10.8.1.33) by
 SEEXMB03-2019.siengine.com (10.8.1.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.1544.11; Wed, 4 Sep 2024 14:44:40 +0800
Received: from localhost (10.12.10.38) by SEEXMB03-2019.siengine.com
 (10.8.1.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA) id 15.2.1544.11 via Frontend
 Transport; Wed, 4 Sep 2024 14:44:40 +0800
From: kimriver liu <kimriver.liu@siengine.com>
To: <jarkko.nikula@linux.intel.com>
CC: <andriy.shevchenko@linux.intel.com>, <mika.westerberg@linux.intel.com>,
        <jsd@semihalf.com>, <andi.shyti@kernel.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kimriver.liu@siengine.com>
Subject: [PATCH] i2c: designware: fix master is holding SCL low while ENABLE bit is disabled
Date: Wed, 4 Sep 2024 14:42:24 +0800
Message-ID: <20240904064224.2394-1-kimriver.liu@siengine.com>
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
X-MAIL:mail03.siengine.com 4846jtQ9038482

From: "kimriver.liu" <kimriver.liu@siengine.com>

Failure in normal Stop operational path

This failure happens rarely and is hard to reproduce. Debug
trace showed that IC_STATUS had value of 0x23 when STOP_DET
occurred, immediately disable ENABLE bit that can result in
IC_RAW_INTR_STAT.MASTER_ON_HOLD holding SCL low.

Failure in ENABLE bit is disabled path

It was observed that master is holding SCL low and the
IC_ENABLE is already disabled, Enable ABORT bit and
ENABLE bit simultaneously cannot take effect.

Check if the master is holding SCL low after ENABLE bit is
already disabled. If SCL is held low, The software can set
this ABORT bit only when ENABLE is already set，otherwise,
the controller ignores any write to ABORT bit. When the
abort is done, then proceed with disabling the controller.

These kernel logs show up whenever an I2C transaction is
attempted after this failure.
i2c_designware e95e0000.i2c: timeout in disabling adapter
i2c_designware e95e0000.i2c: timeout waiting for bus ready

The patch can be fix the controller cannot be disabled while
SCL is held low in ENABLE bit is already disabled.

Signed-off-by: kimriver.liu <kimriver.liu@siengine.com>
---
 drivers/i2c/busses/i2c-designware-common.c |  5 +++++
 drivers/i2c/busses/i2c-designware-master.c | 21 ++++++++++++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-designware-common.c b/drivers/i2c/busses/i2c-designware-common.c
index e8a688d04aee..e1596b67e92f 100644
--- a/drivers/i2c/busses/i2c-designware-common.c
+++ b/drivers/i2c/busses/i2c-designware-common.c
@@ -453,6 +453,11 @@ void __i2c_dw_disable(struct dw_i2c_dev *dev)
 
 	abort_needed = raw_intr_stats & DW_IC_INTR_MST_ON_HOLD;
 	if (abort_needed) {
+		if (!enable) {
+			regmap_write(dev->map, DW_IC_ENABLE, DW_IC_ENABLE_ENABLE);
+			enable |= DW_IC_ENABLE_ENABLE;
+			usleep_range(25, 100);
+		}
 		regmap_write(dev->map, DW_IC_ENABLE, enable | DW_IC_ENABLE_ABORT);
 		ret = regmap_read_poll_timeout(dev->map, DW_IC_ENABLE, enable,
 					       !(enable & DW_IC_ENABLE_ABORT), 10,
diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
index c7e56002809a..f86d03b0472a 100644
--- a/drivers/i2c/busses/i2c-designware-master.c
+++ b/drivers/i2c/busses/i2c-designware-master.c
@@ -253,6 +253,23 @@ static void i2c_dw_xfer_init(struct dw_i2c_dev *dev)
 	__i2c_dw_write_intr_mask(dev, DW_IC_INTR_MASTER_MASK);
 }
 
+static int i2c_dw_check_mst_activity(struct dw_i2c_dev *dev)
+{
+	u32 status = 0;
+	int ret = 0;
+
+	regmap_read(dev->map, DW_IC_STATUS, &status);
+	if (status & DW_IC_STATUS_MASTER_ACTIVITY) {
+		ret = regmap_read_poll_timeout(dev->map, DW_IC_STATUS, status,
+				!(status & DW_IC_STATUS_MASTER_ACTIVITY),
+				1100, 20000);
+		if (ret)
+			dev_err(dev->dev, "i2c mst activity not idle %d\n", ret);
+	}
+
+	return ret;
+}
+
 static int i2c_dw_check_stopbit(struct dw_i2c_dev *dev)
 {
 	u32 val;
@@ -796,7 +813,9 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
 	 * additional interrupts are a hardware bug or this driver doesn't
 	 * handle them correctly yet.
 	 */
-	__i2c_dw_disable_nowait(dev);
+	ret = i2c_dw_check_mst_activity(dev);
+	if (!ret)
+		__i2c_dw_disable_nowait(dev);
 
 	if (dev->msg_err) {
 		ret = dev->msg_err;
-- 
2.17.1


