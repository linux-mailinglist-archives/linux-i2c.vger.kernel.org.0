Return-Path: <linux-i2c+bounces-2533-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDECD886D4A
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:36:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7D6F71F295A3
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:36:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 887F5633FE;
	Fri, 22 Mar 2024 13:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="EHt8A5K4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7C96312C
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:27:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114041; cv=none; b=eX6liWHJdAyTbWBTK/pN/Izmap/PmX7ScGlw2GPeg+T/IXWCGhAzw4ZJeLjcBQ2oYzj946wslB/aXUoWbxTj3d4E8wTGXsGxs40aDHXKs5aeFwsYpJc4aa2VgwxFsD+OjECrF2a25PDX3elsLFik5wuURpd5GdiXTttXrmnbl1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114041; c=relaxed/simple;
	bh=fdHLsR9DB1wn8D9bwxN/WM7+gQ8o/IS36gtdobO3PDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QyHUpdjt0sh5zImlbGMtHikLanZkYOik/EzlxxkP/jbnOmkGD+eOnMpg9SnnACyyRoBpD7vICy+tT2lxpgGxHiQ+h2zHGVp4Ci1JiG8a15jXH5i7J7ezrx1CR0iVeG0OWx9eYtED2fcsUw58/x1HdodlUnRPY/2drTrfh4DAqrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=EHt8A5K4; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=+hOidMzQoPW9FHhIvSwRON+Z3xIeGflbT7fmNTj31kw=; b=EHt8A5
	K4PaG12m12qc8DQFQX600kMWpr/bc6hl5B4LVHXRSeCg2rWPiwMWLAC0h4f7wZp0
	aC4CFWfOgRoORdJOTuDgGHrOnGMYvL2eufHzKH2SYPdfq3z00V8fL079lgA6LpjF
	OgOjYGlU1GkHjoRg/ZfW6S07owCZf09PC4WIkOLC0MrERZNdwBKvIyAwMXHhAZ6l
	r/k3cA26FwfwPbnOsSYTQXq+tIhbd9UAnjzi2ii3TxB6ILfl1Sqc+E0BiZ7FmkR9
	kAEXsRsWPCm/6HKJD6OvTd2eyHy0MFTRyzdJpf+ok0y+JmfT3STzNePa5g7WZGP8
	XlbsQAa86GIjBu9g==
Received: (qmail 3871717 invoked from network); 22 Mar 2024 14:27:00 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:27:00 +0100
X-UD-Smtp-Session: l3s3148p1@7yFVxz8UCJRehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 47/64] i2c: rk3x: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:40 +0100
Message-ID: <20240322132619.6389-48-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-rk3x.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-rk3x.c b/drivers/i2c/busses/i2c-rk3x.c
index 086fdf262e7b..01febd886bdd 100644
--- a/drivers/i2c/busses/i2c-rk3x.c
+++ b/drivers/i2c/busses/i2c-rk3x.c
@@ -28,8 +28,8 @@
 /* Register Map */
 #define REG_CON        0x00 /* control register */
 #define REG_CLKDIV     0x04 /* clock divisor register */
-#define REG_MRXADDR    0x08 /* slave address for REGISTER_TX */
-#define REG_MRXRADDR   0x0c /* slave register address for REGISTER_TX */
+#define REG_MRXADDR    0x08 /* client address for REGISTER_TX */
+#define REG_MRXRADDR   0x0c /* client register address for REGISTER_TX */
 #define REG_MTXCNT     0x10 /* number of bytes to be transmitted */
 #define REG_MRXCNT     0x14 /* number of bytes to be received */
 #define REG_IEN        0x18 /* interrupt enable */
@@ -68,8 +68,8 @@ enum {
 /* REG_IEN/REG_IPD bits */
 #define REG_INT_BTF       BIT(0) /* a byte was transmitted */
 #define REG_INT_BRF       BIT(1) /* a byte was received */
-#define REG_INT_MBTF      BIT(2) /* master data transmit finished */
-#define REG_INT_MBRF      BIT(3) /* master data receive finished */
+#define REG_INT_MBTF      BIT(2) /* host data transmit finished */
+#define REG_INT_MBRF      BIT(3) /* host data receive finished */
 #define REG_INT_START     BIT(4) /* START condition generated */
 #define REG_INT_STOP      BIT(5) /* STOP condition generated */
 #define REG_INT_NAKRCV    BIT(6) /* NACK received */
@@ -184,7 +184,7 @@ struct rk3x_i2c_soc_data {
  * @wait: the waitqueue to wait for i2c transfer
  * @busy: the condition for the event to wait for
  * @msg: current i2c message
- * @addr: addr of i2c slave device
+ * @addr: addr of i2c client device
  * @mode: mode of i2c transfer
  * @is_last_msg: flag determines whether it is the last msg in this transfer
  * @state: state of i2c transfer
@@ -979,7 +979,7 @@ static int rk3x_i2c_setup(struct rk3x_i2c *i2c, struct i2c_msg *msgs, int num)
 	/*
 	 * The I2C adapter can issue a small (len < 4) write packet before
 	 * reading. This speeds up SMBus-style register reads.
-	 * The MRXADDR/MRXRADDR hold the slave address and the slave register
+	 * The MRXADDR/MRXRADDR hold the client address and the client register
 	 * address in this case.
 	 */
 
@@ -1016,7 +1016,7 @@ static int rk3x_i2c_setup(struct rk3x_i2c *i2c, struct i2c_msg *msgs, int num)
 			addr |= 1; /* set read bit */
 
 			/*
-			 * We have to transmit the slave addr first. Use
+			 * We have to transmit the client addr first. Use
 			 * MOD_REGISTER_TX for that purpose.
 			 */
 			i2c->mode = REG_CON_MOD_REGISTER_TX;
@@ -1162,8 +1162,8 @@ static u32 rk3x_i2c_func(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm rk3x_i2c_algorithm = {
-	.master_xfer		= rk3x_i2c_xfer,
-	.master_xfer_atomic	= rk3x_i2c_xfer_polling,
+	.xfer		= rk3x_i2c_xfer,
+	.xfer_atomic	= rk3x_i2c_xfer_polling,
 	.functionality		= rk3x_i2c_func,
 };
 
-- 
2.43.0


