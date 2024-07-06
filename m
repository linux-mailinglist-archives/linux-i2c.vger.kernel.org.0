Return-Path: <linux-i2c+bounces-4709-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4787F929325
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:29:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04BB5281899
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:29:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A0E11667FA;
	Sat,  6 Jul 2024 11:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="j+XQVk6B"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE521607BD
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264931; cv=none; b=qwqpsu3df3Radt1J4lLXf3Mk5En9BDxERITDK7uZX4U4GE6G32k5TJ5jhOGUcE1lU271p+cGFU9pUqmFI6keSkmubyEeNksWQNuGk5P9MAWstOMquYuWqramEbOOXB7gCbhpW49efbJGsoS4o9WirO78h8INakOSJEhJWsxQ81U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264931; c=relaxed/simple;
	bh=fV4Z8lsCHMIKW0jWPNAkbOq3VO5joB0a9eHcp7lyDmA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GqsPi5MHbBMPLGcTP7VG2pYCF99dJBajV9IFaYvTnG0FM/nwcKFUPtu6t3rwflwyRTEohunDeNlt1vfewacpaQWTxZD5n/H8yzIOHqKxECZpWwNeNWkvZG/HnY4j13sQsybAr0/+FP/NXx4cFKejRN2v5M2+9qIStKFWUdRcs+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=j+XQVk6B; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=PAKZYb75MbZIlrhGBH5RBytdsA/Ghy1+cbVsoMUguWM=; b=j+XQVk
	6By7LGB9+eDr3bl7zhu3fBf+VSks0q75o31VUqvVX0emMpwM+CsUZ6ymb+9YSYx8
	qohWv0AypEpEDtJLjv5P46LcXQ1LamzfkP/NrE5XYU5R4TF2NDEbxfBts6h2rBZv
	f4IwEkgNZKKOlJi0uE5zwjp2cXBnihrZFJcJSjNsDgYX9rqfxolMiHwpM1MdMaCW
	xDiRxO5zfNS1DyF4BNft4ZouV6ESDM3DljsVSDsfNqcfCYlCRRg29yNLDvYRo/Oq
	f1wnw4tvsE7s6sTJ0mtMXsWvvY3XFMz9+Hf39Mng9NswBWePNQ0HaDN4YF+g9z4v
	pvBBbt3LA3FJs6Gw==
Received: (qmail 3810740 invoked from network); 6 Jul 2024 13:21:52 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:52 +0200
X-UD-Smtp-Session: l3s3148p1@pxj9YpIcUsJQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 42/60] i2c: rk3x: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:42 +0200
Message-ID: <20240706112116.24543-43-wsa+renesas@sang-engineering.com>
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
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/i2c/busses/i2c-rk3x.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index beca61700c89..4ef9bad77b85 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -28,8 +28,8 @@
 /* Register Map */
 #define REG_CON        0x00 /* control register */
 #define REG_CLKDIV     0x04 /* clock divisor register */
-#define REG_MRXADDR    0x08 /* slave address for REGISTER_TX */
-#define REG_MRXRADDR   0x0c /* slave register address for REGISTER_TX */
+#define REG_MRXADDR    0x08 /* target address for REGISTER_TX */
+#define REG_MRXRADDR   0x0c /* target register address for REGISTER_TX */
 #define REG_MTXCNT     0x10 /* number of bytes to be transmitted */
 #define REG_MRXCNT     0x14 /* number of bytes to be received */
 #define REG_IEN        0x18 /* interrupt enable */
@@ -68,8 +68,8 @@ enum {
 /* REG_IEN/REG_IPD bits */
 #define REG_INT_BTF       BIT(0) /* a byte was transmitted */
 #define REG_INT_BRF       BIT(1) /* a byte was received */
-#define REG_INT_MBTF      BIT(2) /* master data transmit finished */
-#define REG_INT_MBRF      BIT(3) /* master data receive finished */
+#define REG_INT_MBTF      BIT(2) /* controller data transmit finished */
+#define REG_INT_MBRF      BIT(3) /* controller data receive finished */
 #define REG_INT_START     BIT(4) /* START condition generated */
 #define REG_INT_STOP      BIT(5) /* STOP condition generated */
 #define REG_INT_NAKRCV    BIT(6) /* NACK received */
@@ -184,7 +184,7 @@ struct rk3x_i2c_soc_data {
  * @wait: the waitqueue to wait for i2c transfer
  * @busy: the condition for the event to wait for
  * @msg: current i2c message
- * @addr: addr of i2c slave device
+ * @addr: addr of i2c target device
  * @mode: mode of i2c transfer
  * @is_last_msg: flag determines whether it is the last msg in this transfer
  * @state: state of i2c transfer
@@ -979,7 +979,7 @@ static int rk3x_i2c_setup(struct rk3x_i2c *i2c, struct i2c_msg *msgs, int num)
 	/*
 	 * The I2C adapter can issue a small (len < 4) write packet before
 	 * reading. This speeds up SMBus-style register reads.
-	 * The MRXADDR/MRXRADDR hold the slave address and the slave register
+	 * The MRXADDR/MRXRADDR hold the target address and the target register
 	 * address in this case.
 	 */
 
@@ -1016,7 +1016,7 @@ static int rk3x_i2c_setup(struct rk3x_i2c *i2c, struct i2c_msg *msgs, int num)
 			addr |= 1; /* set read bit */
 
 			/*
-			 * We have to transmit the slave addr first. Use
+			 * We have to transmit the target addr first. Use
 			 * MOD_REGISTER_TX for that purpose.
 			 */
 			i2c->mode = REG_CON_MOD_REGISTER_TX;
@@ -1160,9 +1160,9 @@ static u32 rk3x_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm rk3x_i2c_algorithm = {
-	.master_xfer		= rk3x_i2c_xfer,
-	.master_xfer_atomic	= rk3x_i2c_xfer_polling,
-	.functionality		= rk3x_i2c_func,
+	.xfer = rk3x_i2c_xfer,
+	.xfer_atomic = rk3x_i2c_xfer_polling,
+	.functionality = rk3x_i2c_func,
 };
 
 static const struct rk3x_i2c_soc_data rv1108_soc_data = {
-- 
2.43.0


