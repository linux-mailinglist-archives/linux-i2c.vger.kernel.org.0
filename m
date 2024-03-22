Return-Path: <linux-i2c+bounces-2537-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC8C886D55
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:37:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D3661F24D8F
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F72164CD4;
	Fri, 22 Mar 2024 13:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lmVKV8Fv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3349A634FE
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:27:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114045; cv=none; b=hfhvMk4KKi3Nydcc6EiKlTfSQGNGNRrFR+CNc/mQOLmvU5dLiznA8EwU3VGnb1p84zUbzGTTY1lB05LmKfJVq438wgQEf/CP34w33A0UoXEtSY7tFG4C1xeCb2N7uo7o6LHxr4Vxxp3x1AO3Dg+wN6v7MoYZ2rMGL7qRU/x8dOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114045; c=relaxed/simple;
	bh=JopqC1CUA53KwbARMzk2PCnsUdhS27WGHgIgrl130yc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u/YI1poH3xeg0fwUMwLHpmJCkJ1KeLXuQkSvnqFKQ2fm6Jxfw7aCDu35DRVrsZj9mW6MnSQtmzCieXxAbSxFobRDepJLndRJveN8GujvfRaZK5Ya00Pv1A+be1GhXxz4L3AHE8icDpbqD7dcKo9xck3ztU5smOeFBv6g2z8/r7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lmVKV8Fv; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=83ypbEc9zEl6mc8ZY/BhWqheV6O8ZhghdvuHQYn8SGw=; b=lmVKV8
	Fv7W7PwTQKacO0Czh2T3OLVPheHj/dZG/Y1qnKYwxa+4V76ajiIV71HpaXJ8APPY
	Vlz08qZ7Hrq5Zmycyj0/3901kolybUfUlsOb3nXVtE/5Ej7I7bXefHcJPUMjFoTo
	ujOkZ0RDCSk4Xt1FUM61EWbUHf0BlE4y4OBKth00hiMNtBq44ciECxAODUQYs8Q8
	0aKxYcdtk/pjE77HyOIUlir79KMbuTBazs2VxKdkdceZVpug5WAapNT//cdb2Xji
	Xn4nUaaMUTws28u+fwr8JfF0SILwDB/p+8Nc39rfXupgJiw0VcMjDmocurJ4DDjB
	9j+Z0kSvivo91URg==
Received: (qmail 3871861 invoked from network); 22 Mar 2024 14:27:03 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:27:03 +0100
X-UD-Smtp-Session: l3s3148p1@CtiFxz8UMJRehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 51/64] i2c: sis630: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:44 +0100
Message-ID: <20240322132619.6389-52-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Match the wording of this driver wrt. the newest I2C v7, SMBus 3.2, I3C
specifications and replace "master/slave" with more appropriate terms.
They are also more specific because we distinguish now between a remote
entity ("client") and a local one ("target").

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/i2c/busses/i2c-sis630.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-sis630.c b/drivers/i2c/busses/i2c-sis630.c
index 3505cf29cedd..7910ba2fce15 100644
--- a/drivers/i2c/busses/i2c-sis630.c
+++ b/drivers/i2c/busses/i2c-sis630.c
@@ -18,7 +18,7 @@
 	+------------------------+--------------------+-------------------+
 	| Clock                  | 14kHz/56kHz        | 55.56kHz/27.78kHz |
 	| SMBus registers offset | 0x80               | 0xE0              |
-	| SMB_CNT                | Bit 1 = Slave Busy | Bit 1 = Bus probe |
+	| SMB_CNT                | Bit 1 = Client Busy| Bit 1 = Bus probe |
 	|         (not used yet) | Bit 3 is reserved  | Bit 3 = Last byte |
 	| SMB_PCOUNT		 | Offset + 0x06      | Offset + 0x14     |
 	| SMB_COUNT              | 4:0 bits           | 5:0 bits          |
@@ -56,8 +56,8 @@
 
 /* SMB_CNT register */
 #define MSTO_EN			0x40	/* Host Master Timeout Enable */
-#define SMBCLK_SEL		0x20	/* Host master clock selection */
-#define SMB_PROBE		0x02	/* Bus Probe/Slave busy */
+#define SMBCLK_SEL		0x20	/* Host clock selection */
+#define SMB_PROBE		0x02	/* Bus Probe/Client busy */
 #define SMB_HOSTBUSY		0x01	/* Host Busy */
 
 /* SMBHOST_CNT register */
@@ -93,7 +93,7 @@ static bool high_clock;
 static bool force;
 module_param(high_clock, bool, 0);
 MODULE_PARM_DESC(high_clock,
-	"Set Host Master Clock to 56KHz (default 14KHz) (SIS630/730 only).");
+	"Set Host Clock to 56KHz (default 14KHz) (SIS630/730 only).");
 module_param(force, bool, 0);
 MODULE_PARM_DESC(force, "Forcibly enable the SIS630. DANGEROUS!");
 
@@ -144,8 +144,7 @@ static int sis630_transaction_start(struct i2c_adapter *adap, int size,
 
 	dev_dbg(&adap->dev, "saved clock 0x%02x\n", *oldclock);
 
-	/* disable timeout interrupt,
-	 * set Host Master Clock to 56KHz if requested */
+	/* disable timeout interrupt, set Host Clock to 56KHz if requested */
 	if (high_clock)
 		sis630_write(SMB_CNT, SMBCLK_SEL);
 	else
@@ -201,10 +200,7 @@ static void sis630_transaction_end(struct i2c_adapter *adap, u8 oldclock)
 	dev_dbg(&adap->dev,
 		"SMB_CNT before clock restore 0x%02x\n", sis630_read(SMB_CNT));
 
-	/*
-	 * restore old Host Master Clock if high_clock is set
-	 * and oldclock was not 56KHz
-	 */
+	/* restore old Host Clock if high_clock is set and oldclock was not 56KHz */
 	if (high_clock && !(oldclock & SMBCLK_SEL))
 		sis630_write(SMB_CNT, sis630_read(SMB_CNT) & ~SMBCLK_SEL);
 
-- 
2.43.0


