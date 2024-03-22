Return-Path: <linux-i2c+bounces-2542-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E61DF886D61
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:39:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91145286753
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:39:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5211F482F3;
	Fri, 22 Mar 2024 13:27:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="dZhWVheL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5535664AE
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114051; cv=none; b=b9PwsYso4fODWS4LLrlLmFCgznG1fV0CasUyJ7b3vuXG3I24En5dLmzD3M2ykpLtn1QE+3FMTkZWUPENM/tI1wvO5v5OI3txjYulWaOKTUEVqlTYbic0xa660puf18ayzeOa3Uy0ih9Ctl4ivs94F4LywtxVqbbmk0hYGhYpykM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114051; c=relaxed/simple;
	bh=davqUUNYoFMJd9cuuCgS4qa50oOKjp/hyawfu0kSf8U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EHDS5yCwrmbdde3NcWhxoB3b9VYK0KqUGyS2KUxvMuejt2Iv02s2dvpitOfU/oMalrk7elNFZ+rsHdz3Fnswib2KhtICqdBq71tVvVZkjXAiWDBpudalQGJdJ+xZOlgR38RV7CtuQbGuJHD9upFCSucYs28KFcz2S2AWurIZyrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=dZhWVheL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=HNFDL564snpTrcZlSonI/bbMFLyUUlB4WqrmT/WwUQo=; b=dZhWVh
	eLxihLYJT4sUEdwllrstHBW+BF/bGt5PqsDqmrfOSZCIhUnAZiTmLDlR6fwxpXxM
	ImpUEkuObM5ymxmzs4HUgzEmzTkIF8tnVWAgbxxy1JbNjSZWdI8WNESgHs3Jm6Cp
	IWYo1hn8jhEWzs4XcieQbmLzRT2fjJWRbb/6HtQjdMAXDI62eGF9SVHrow17BydM
	FZBHcon3SCANlSaZ4Choslr7LK4eevjTrDGfBHov5gd/HVnohnX5vWUSdU8GKBb1
	EFNYLJvlCcyFOtry4GFmrs8hbwxQIW8BTzXPlv4c1QaO901qut0AQq+hnAxdiRiy
	VsnvYHmZuR2U7D6A==
Received: (qmail 3872067 invoked from network); 22 Mar 2024 14:27:07 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:27:07 +0100
X-UD-Smtp-Session: l3s3148p1@OfPFxz8UTpRehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 56/64] i2c: synquacer: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:49 +0100
Message-ID: <20240322132619.6389-57-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-synquacer.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/i2c/busses/i2c-synquacer.c b/drivers/i2c/busses/i2c-synquacer.c
index bbea521b05dd..2fa528daaf5f 100644
--- a/drivers/i2c/busses/i2c-synquacer.c
+++ b/drivers/i2c/busses/i2c-synquacer.c
@@ -66,16 +66,16 @@
 #define SYNQUACER_I2C_BUS_CLK_FR(rate)	(((rate) / 20000000) + 1)
 
 /* STANDARD MODE frequency */
-#define SYNQUACER_I2C_CLK_MASTER_STD(rate)			\
+#define SYNQUACER_I2C_CLK__STD(rate)			\
 	DIV_ROUND_UP(DIV_ROUND_UP((rate), I2C_MAX_STANDARD_MODE_FREQ) - 2, 2)
 /* FAST MODE frequency */
-#define SYNQUACER_I2C_CLK_MASTER_FAST(rate)			\
+#define SYNQUACER_I2C_CLK__FAST(rate)			\
 	DIV_ROUND_UP((DIV_ROUND_UP((rate), I2C_MAX_FAST_MODE_FREQ) - 2) * 2, 3)
 
 /* (clkrate <= 18000000) */
 /* calculate the value of CS bits in CCR register on standard mode */
 #define SYNQUACER_I2C_CCR_CS_STD_MAX_18M(rate)			\
-	   ((SYNQUACER_I2C_CLK_MASTER_STD(rate) - 65)		\
+	   ((SYNQUACER_I2C_CLK__STD(rate) - 65)		\
 					& SYNQUACER_I2C_CCR_CS_MASK)
 
 /* calculate the value of CS bits in CSR register on standard mode */
@@ -83,7 +83,7 @@
 
 /* calculate the value of CS bits in CCR register on fast mode */
 #define SYNQUACER_I2C_CCR_CS_FAST_MAX_18M(rate)			\
-	   ((SYNQUACER_I2C_CLK_MASTER_FAST(rate) - 1)		\
+	   ((SYNQUACER_I2C_CLK__FAST(rate) - 1)		\
 					& SYNQUACER_I2C_CCR_CS_MASK)
 
 /* calculate the value of CS bits in CSR register on fast mode */
@@ -92,22 +92,22 @@
 /* (clkrate > 18000000) */
 /* calculate the value of CS bits in CCR register on standard mode */
 #define SYNQUACER_I2C_CCR_CS_STD_MIN_18M(rate)			\
-	   ((SYNQUACER_I2C_CLK_MASTER_STD(rate) - 1)		\
+	   ((SYNQUACER_I2C_CLK__STD(rate) - 1)		\
 					& SYNQUACER_I2C_CCR_CS_MASK)
 
 /* calculate the value of CS bits in CSR register on standard mode */
 #define SYNQUACER_I2C_CSR_CS_STD_MIN_18M(rate)			\
-	   (((SYNQUACER_I2C_CLK_MASTER_STD(rate) - 1) >> 5)	\
+	   (((SYNQUACER_I2C_CLK__STD(rate) - 1) >> 5)	\
 					& SYNQUACER_I2C_CSR_CS_MASK)
 
 /* calculate the value of CS bits in CCR register on fast mode */
 #define SYNQUACER_I2C_CCR_CS_FAST_MIN_18M(rate)			\
-	   ((SYNQUACER_I2C_CLK_MASTER_FAST(rate) - 1)		\
+	   ((SYNQUACER_I2C_CLK__FAST(rate) - 1)		\
 					& SYNQUACER_I2C_CCR_CS_MASK)
 
 /* calculate the value of CS bits in CSR register on fast mode */
 #define SYNQUACER_I2C_CSR_CS_FAST_MIN_18M(rate)			\
-	   (((SYNQUACER_I2C_CLK_MASTER_FAST(rate) - 1) >> 5)	\
+	   (((SYNQUACER_I2C_CLK__FAST(rate) - 1) >> 5)	\
 					& SYNQUACER_I2C_CSR_CS_MASK)
 
 /* min I2C clock frequency 14M */
@@ -255,15 +255,13 @@ static void synquacer_i2c_hw_reset(struct synquacer_i2c *i2c)
 	WAIT_PCLK(100, i2c->pclkrate);
 }
 
-static int synquacer_i2c_master_start(struct synquacer_i2c *i2c,
+static int synquacer_i2c_start(struct synquacer_i2c *i2c,
 				      struct i2c_msg *pmsg)
 {
 	unsigned char bsr, bcr;
 
 	writeb(i2c_8bit_addr_from_msg(pmsg), i2c->base + SYNQUACER_I2C_REG_DAR);
 
-	dev_dbg(i2c->dev, "slave:0x%02x\n", pmsg->addr);
-
 	/* Generate Start Condition */
 	bsr = readb(i2c->base + SYNQUACER_I2C_REG_BSR);
 	bcr = readb(i2c->base + SYNQUACER_I2C_REG_BCR);
@@ -281,7 +279,7 @@ static int synquacer_i2c_master_start(struct synquacer_i2c *i2c,
 		       i2c->base + SYNQUACER_I2C_REG_BCR);
 	} else {
 		if (bcr & SYNQUACER_I2C_BCR_MSS) {
-			dev_dbg(i2c->dev, "not in master mode");
+			dev_dbg(i2c->dev, "not in host mode");
 			return -EAGAIN;
 		}
 		dev_dbg(i2c->dev, "Start Condition");
@@ -329,7 +327,7 @@ static int synquacer_i2c_doxfer(struct synquacer_i2c *i2c,
 	i2c->msg_idx = 0;
 	i2c->state = STATE_START;
 
-	ret = synquacer_i2c_master_start(i2c, i2c->msg);
+	ret = synquacer_i2c_start(i2c, i2c->msg);
 	if (ret < 0) {
 		dev_dbg(i2c->dev, "Address failed: (%d)\n", ret);
 		return ret;
@@ -429,7 +427,7 @@ static irqreturn_t synquacer_i2c_isr(int irq, void *dev_id)
 		i2c->msg++;
 
 		/* send the new start */
-		ret = synquacer_i2c_master_start(i2c, i2c->msg);
+		ret = synquacer_i2c_start(i2c, i2c->msg);
 		if (ret < 0) {
 			dev_dbg(i2c->dev, "restart error (%d)\n", ret);
 			synquacer_i2c_stop(i2c, -EAGAIN);
@@ -473,7 +471,7 @@ static irqreturn_t synquacer_i2c_isr(int irq, void *dev_id)
 		i2c->msg_idx++;
 		i2c->msg++;
 
-		ret = synquacer_i2c_master_start(i2c, i2c->msg);
+		ret = synquacer_i2c_start(i2c, i2c->msg);
 		if (ret < 0) {
 			dev_dbg(i2c->dev, "restart error (%d)\n", ret);
 			synquacer_i2c_stop(i2c, -EAGAIN);
@@ -521,7 +519,7 @@ static u32 synquacer_i2c_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm synquacer_i2c_algo = {
-	.master_xfer	= synquacer_i2c_xfer,
+	.xfer	= synquacer_i2c_xfer,
 	.functionality	= synquacer_i2c_functionality,
 };
 
-- 
2.43.0


