Return-Path: <linux-i2c+bounces-4723-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F50929343
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:33:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 80A1EB21E0A
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1CFE17B4F0;
	Sat,  6 Jul 2024 11:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="GEXpAqe4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE6A17839F
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264943; cv=none; b=QoKNP79yKLjVl4KTOSgcrKF1zmjaAnrFN1zi0fCcWg/PBdwFCeJEG79W+rzczcPUYiBEwZDEqKp0TxJs42y+4P/WTJtGjNShiviCgSOPmou0knHFD5y7pl6hSBt3OTQI/elLCCUnrTgcd0xM7lzFtyUv57QyK4gcX4p/AyLr2X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264943; c=relaxed/simple;
	bh=6eb51MOTGBI7OZukMaHMR/yQNB0zOjnlttyLfhF9pKk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Kgo2NeymJr/xAQaHmZsYAIDw1a9Y/x99Bj9Bzt1wbNFceYTZk+4tXDJS3zegzuam0NyExnb/kWRQC7ABIO1EDyq71NkqHUv/O4DXmvuIbaIJ8hLr1EwVyfIJCnNmjec7RRPEn3Vao+PDrmqXYa3p9uo4dj58JRKhXKPaOZazyO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=GEXpAqe4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=bPsQpXZGJKgS7AfXMtPt5PXQkvw0RqAM8l1t2WL8MAU=; b=GEXpAq
	e47VuL2iU2TfJCW6qFTaJtAVs1xa+ZIvO7KN8lpAfiPKmxlanuKKXWdbUVz/ZLBg
	4WxFCx7WTPZG7GXYWblzon9uxbOfuUcCEkxWZkA6WtjNIk0WjWugj3ljWtFqz7cb
	L4wjc8JshFBn6jeIScRwwlTKzMEpljCT5TsqKLnFnkCXlP3HkvxrAfS+xHcOholA
	FxElatnmiLOYd67NGfnD2IrG3c6LM5cJ1fNhVHso9+19pqM18pIBaXM9Y/PwKBXD
	IzKauGL+Fpf++btDffoIg5u6Tp2y6lDAr8ExFeYgLD6NuDaebhG/KPJKG5JvZI1Q
	CTTCF8n1ghHrUDVQ==
Received: (qmail 3811200 invoked from network); 6 Jul 2024 13:22:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:22:01 +0200
X-UD-Smtp-Session: l3s3148p1@tPiTY5IcsuFQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Hans Hu <hanshu@zhaoxin.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 56/60] i2c: viai2c: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:56 +0200
Message-ID: <20240706112116.24543-57-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the wording of this driver wrt. the newest I2C v7 and SMBus 3.2
specifications and replace "master/slave" with more appropriate terms.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-viai2c-common.c  |  2 +-
 drivers/i2c/busses/i2c-viai2c-wmt.c     |  8 ++++----
 drivers/i2c/busses/i2c-viai2c-zhaoxin.c | 12 ++++++------
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-viai2c-common.c b/drivers/i2c/busses/i2c-viai2c-common.c
index 162b31306cba..5a53ed95a59b 100644
--- a/drivers/i2c/busses/i2c-viai2c-common.c
+++ b/drivers/i2c/busses/i2c-viai2c-common.c
@@ -198,6 +198,6 @@ int viai2c_init(struct platform_device *pdev, struct viai2c **pi2c, int plat)
 }
 EXPORT_SYMBOL_GPL(viai2c_init);
 
-MODULE_DESCRIPTION("Via/Wondermedia/Zhaoxin I2C master-mode bus adapter");
+MODULE_DESCRIPTION("Via/Wondermedia/Zhaoxin I2C controller core");
 MODULE_AUTHOR("Tony Prisk <linux@prisktech.co.nz>");
 MODULE_LICENSE("GPL");
diff --git a/drivers/i2c/busses/i2c-viai2c-wmt.c b/drivers/i2c/busses/i2c-viai2c-wmt.c
index 420fd10fe3aa..3415683dab91 100644
--- a/drivers/i2c/busses/i2c-viai2c-wmt.c
+++ b/drivers/i2c/busses/i2c-viai2c-wmt.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- *  Wondermedia I2C Master Mode Driver
+ *  Wondermedia I2C Controller Driver
  *
  *  Copyright (C) 2012 Tony Prisk <linux@prisktech.co.nz>
  *
@@ -35,8 +35,8 @@ static u32 wmt_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm wmt_i2c_algo = {
-	.master_xfer	= viai2c_xfer,
-	.functionality	= wmt_i2c_func,
+	.xfer = viai2c_xfer,
+	.functionality = wmt_i2c_func,
 };
 
 static int wmt_i2c_reset_hardware(struct viai2c *i2c)
@@ -178,7 +178,7 @@ static struct platform_driver wmt_i2c_driver = {
 
 module_platform_driver(wmt_i2c_driver);
 
-MODULE_DESCRIPTION("Wondermedia I2C master-mode bus adapter");
+MODULE_DESCRIPTION("Wondermedia I2C controller driver");
 MODULE_AUTHOR("Tony Prisk <linux@prisktech.co.nz>");
 MODULE_LICENSE("GPL");
 MODULE_DEVICE_TABLE(of, wmt_i2c_dt_ids);
diff --git a/drivers/i2c/busses/i2c-viai2c-zhaoxin.c b/drivers/i2c/busses/i2c-viai2c-zhaoxin.c
index ab3e44e147e9..95dc64902b7c 100644
--- a/drivers/i2c/busses/i2c-viai2c-zhaoxin.c
+++ b/drivers/i2c/busses/i2c-viai2c-zhaoxin.c
@@ -38,7 +38,7 @@
 #define ZXI2C_GOLD_FSTP_400K	0x38
 #define ZXI2C_GOLD_FSTP_1M	0x13
 #define ZXI2C_GOLD_FSTP_3400K	0x37
-#define ZXI2C_HS_MASTER_CODE	(0x08 << 8)
+#define ZXI2C_HS_CTRL_CODE	(0x08 << 8)
 
 #define ZXI2C_FIFO_SIZE		32
 
@@ -136,7 +136,7 @@ static int viai2c_fifo_irq_xfer(struct viai2c *i2c)
 	return 0;
 }
 
-static int zxi2c_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
+static int zxi2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 {
 	u8 tmp;
 	int ret;
@@ -194,8 +194,8 @@ static u32 zxi2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm zxi2c_algorithm = {
-	.master_xfer	= zxi2c_master_xfer,
-	.functionality	= zxi2c_func,
+	.xfer = zxi2c_xfer,
+	.functionality = zxi2c_func,
 };
 
 static const struct i2c_adapter_quirks zxi2c_quirks = {
@@ -250,9 +250,9 @@ static void zxi2c_get_bus_speed(struct viai2c *i2c)
 
 	i2c->tcr = params[1];
 	priv->mcr = ioread16(i2c->base + VIAI2C_REG_MCR);
-	/* for Hs-mode, use 0x80 as master code */
+	/* for Hs-mode, use 0x80 as controller code */
 	if (params[0] == I2C_MAX_HIGH_SPEED_MODE_FREQ)
-		priv->mcr |= ZXI2C_HS_MASTER_CODE;
+		priv->mcr |= ZXI2C_HS_CTRL_CODE;
 
 	dev_info(i2c->dev, "speed mode is %s\n", i2c_freq_mode_string(params[0]));
 }
-- 
2.43.0


