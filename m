Return-Path: <linux-i2c+bounces-4673-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3839292D7
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:22:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D14F91F21FCD
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:22:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C80F113A3FD;
	Sat,  6 Jul 2024 11:21:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="NkxjEHGM"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB5B13174B
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264903; cv=none; b=CGQyLVvYeVsJu8j/sOfwyuCNyWpOL7sXgv7swovo9YPku149n+64ib/JjBd+PTZ4wgu73kMUWFdpmR/8CTYhcUnoLfMQUJnLZaKkDqpKGWDG3Gq31e3UKG97BXlhiTwhBEFkWn5vMsVaZbsYqvzucN1gqfvyB2Iap48XWx1W3tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264903; c=relaxed/simple;
	bh=Zc+wW02bH3J2UC1dwJRqoeiRcawvKwtWN3nEDGpFDPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NoO+GwIlo1lrBvHafUgqBpz+GxsKezLARmXA0Cx3JqFwH8mz3aktiGibh9Rp+Eomn4hOsfWvxSFqgAZ5hO1VetFbOBtraqu0RQDdL3Q4EreTVlsECr8oYcVio99ZXNn6pPoLu5dmskXPaT6wTtHJEYqy3rCWs+fP3PhD0ArmwDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=NkxjEHGM; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=VAp76v9wqr5uyKGx45JJw5dqdmqu/DJeqReZVoBu2X8=; b=NkxjEH
	GM5SP4QGNYvFOGC2jpJWrGU0XNHJDAGC9uKbfQIOK9AXmNFm0iHpYUOYZG9/+ivM
	mTWlR7CnR3mVFk5fmqBysMPTUCPpR9XlunOgGFWZNlu+X2/d/v9ozro08HU3QRjK
	DCgtekmMcrp3DNvauZQLGOSp84hDhjcYypUqD+VefmJYRhG52ME4A8AKtHFtMmzH
	3lz1E5SY5Rw9jh3Y25rQyZNaTv1nEN3r5gwyW8ARePKPX7aBGl5hSXvv7XXCnf6c
	SU0U8KxZfEwv7H7Gv8H6+6UxbU2UfMgeU0vOngStdf1yqEVJYBtULUZ3aaxutRln
	bIt3y+wU0mgyiizA==
Received: (qmail 3809579 invoked from network); 6 Jul 2024 13:21:26 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:26 +0200
X-UD-Smtp-Session: l3s3148p1@XZ93YZIcTpBQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-rpi-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/60] i2c: bcm2835: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:06 +0200
Message-ID: <20240706112116.24543-7-wsa+renesas@sang-engineering.com>
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
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/i2c/busses/i2c-bcm2835.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
index 3045ba82380d..ae42e37052a8 100644
--- a/drivers/i2c/busses/i2c-bcm2835.c
+++ b/drivers/i2c/busses/i2c-bcm2835.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * BCM2835 master mode driver
+ * BCM2835 I2C controller driver
  */
 
 #include <linux/clk.h>
@@ -25,7 +25,7 @@
 #define BCM2835_I2C_DEL		0x18
 /*
  * 16-bit field for the number of SCL cycles to wait after rising SCL
- * before deciding the slave is not responding. 0 disables the
+ * before deciding the target is not responding. 0 disables the
  * timeout detection.
  */
 #define BCM2835_I2C_CLKT	0x1c
@@ -223,7 +223,7 @@ static void bcm2835_drain_rxfifo(struct bcm2835_i2c_dev *i2c_dev)
 /*
  * Repeated Start Condition (Sr)
  * The BCM2835 ARM Peripherals datasheet mentions a way to trigger a Sr when it
- * talks about reading from a slave with 10 bit address. This is achieved by
+ * talks about reading from a target with 10 bit address. This is achieved by
  * issuing a write, poll the I2CS.TA flag and wait for it to be set, and then
  * issue a read.
  * A comment in https://github.com/raspberrypi/linux/issues/254 shows how the
@@ -390,8 +390,8 @@ static u32 bcm2835_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm bcm2835_i2c_algo = {
-	.master_xfer	= bcm2835_i2c_xfer,
-	.functionality	= bcm2835_i2c_func,
+	.xfer = bcm2835_i2c_xfer,
+	.functionality = bcm2835_i2c_func,
 };
 
 /*
-- 
2.43.0


