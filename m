Return-Path: <linux-i2c+bounces-2545-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8F8886D68
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 14:39:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30ACB1C20754
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 13:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F6CD67A11;
	Fri, 22 Mar 2024 13:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="GBR34C5f"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3E166B55
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 13:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711114053; cv=none; b=AFCq8xLJsDhM6g6y8el2vMaDu/dvcIqZzfgQOGlGJ8oxiC8sstYeCme1+2ng5aAPKa9jEAVvDk20LccStATkYL+3Kpap0832r9Gs3yP+YVxJkgNikn/zyKyWsiSf+4+N4BFGp8wv7oz9IFlTa4/frt9IVAWs30IMlkBVN8hxJxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711114053; c=relaxed/simple;
	bh=jhLyTeGZk3WHRGR+u+Pnghl/gFGCXwj7rHn2zZb+SRY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SQPtSo2/LyRcK1E4huvupfNKkNeoICDf2jgy8IB8q6YYf/9TvDS29uxEM/dxHzGr3zCSV/R5Y/hoW4vFzdRm61oFfDDfwIknM5hjRVuNtFP3SDsoEuU5zIxCEiIOuuQthbPlu6YjiT0ticmj6Jo0UKoIaYuc6zYHLul0xVuULUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=GBR34C5f; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=ojlShxYbza+SZYG05qx4dWS+cyKPvErSpiJUhDaAhvw=; b=GBR34C
	5fRnZMFT00dyS/5pEocuK9pcD9YxRL7bfWCtpP9I8e5pKmx+AZcBca28bCKKCRSt
	L+54jpaVEYtYE1y/yWzxZ02ftHaUzQvcTOQlN/cc9dMj/umLYUKgfMfGBn3L6QlK
	8JmZY8i4uoy+FPbzk0MLBnBadkGRSytRjE70t14zCDhypDqcvUaGSSG2NkR/ObNd
	WPbdS+G9W1KcsAIURiKpMcTPVU7+BPcfncvj3JoyTEWJDmQmdEKVStqoyqF0Jtbf
	Ck7Kk+MWmmNTFxIpFCLmjeg2qSlRhcuVMNOsAeFQJS3T59f/tlaaj8b8/j7HOrzF
	DOA7a0sRCLH18MWg==
Received: (qmail 3872176 invoked from network); 22 Mar 2024 14:27:10 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Mar 2024 14:27:10 +0100
X-UD-Smtp-Session: l3s3148p1@Bzrrxz8UgoVehhtF
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 59/64] i2c: uniphier-f: reword according to newest specification
Date: Fri, 22 Mar 2024 14:25:52 +0100
Message-ID: <20240322132619.6389-60-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-uniphier-f.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/i2c/busses/i2c-uniphier-f.c b/drivers/i2c/busses/i2c-uniphier-f.c
index dbc91c7c3788..f075c83a81b9 100644
--- a/drivers/i2c/busses/i2c-uniphier-f.c
+++ b/drivers/i2c/busses/i2c-uniphier-f.c
@@ -12,15 +12,15 @@
 #include <linux/platform_device.h>
 
 #define UNIPHIER_FI2C_CR	0x00	/* control register */
-#define     UNIPHIER_FI2C_CR_MST	BIT(3)	/* master mode */
+#define     UNIPHIER_FI2C_CR_MST	BIT(3)	/* host mode */
 #define     UNIPHIER_FI2C_CR_STA	BIT(2)	/* start condition */
 #define     UNIPHIER_FI2C_CR_STO	BIT(1)	/* stop condition */
 #define     UNIPHIER_FI2C_CR_NACK	BIT(0)	/* do not return ACK */
 #define UNIPHIER_FI2C_DTTX	0x04	/* TX FIFO */
-#define     UNIPHIER_FI2C_DTTX_CMD	BIT(8)	/* send command (slave addr) */
+#define     UNIPHIER_FI2C_DTTX_CMD	BIT(8)	/* send command (client addr) */
 #define     UNIPHIER_FI2C_DTTX_RD	BIT(0)	/* read transaction */
 #define UNIPHIER_FI2C_DTRX	0x04	/* RX FIFO */
-#define UNIPHIER_FI2C_SLAD	0x0c	/* slave address */
+#define UNIPHIER_FI2C_SLAD	0x0c	/* client address */
 #define UNIPHIER_FI2C_CYC	0x10	/* clock cycle control */
 #define UNIPHIER_FI2C_LCTL	0x14	/* clock low period control */
 #define UNIPHIER_FI2C_SSUT	0x18	/* restart/stop setup time control */
@@ -96,7 +96,7 @@ static void uniphier_fi2c_fill_txfifo(struct uniphier_fi2c_priv *priv,
 	int fifo_space = UNIPHIER_FI2C_FIFO_SIZE;
 
 	/*
-	 * TX-FIFO stores slave address in it for the first access.
+	 * TX-FIFO stores client address in it for the first access.
 	 * Decrement the counter.
 	 */
 	if (first)
@@ -252,7 +252,7 @@ static void uniphier_fi2c_tx_init(struct uniphier_fi2c_priv *priv, u16 addr,
 
 	/* do not use TX byte counter */
 	writel(0, priv->membase + UNIPHIER_FI2C_TBC);
-	/* set slave address */
+	/* set client address */
 	writel(UNIPHIER_FI2C_DTTX_CMD | addr << 1,
 	       priv->membase + UNIPHIER_FI2C_DTTX);
 	/*
@@ -288,7 +288,7 @@ static void uniphier_fi2c_rx_init(struct uniphier_fi2c_priv *priv, u16 addr)
 
 	uniphier_fi2c_set_irqs(priv);
 
-	/* set slave address with RD bit */
+	/* set client address with RD bit */
 	writel(UNIPHIER_FI2C_DTTX_CMD | UNIPHIER_FI2C_DTTX_RD | addr << 1,
 	       priv->membase + UNIPHIER_FI2C_DTTX);
 }
@@ -310,7 +310,7 @@ static void uniphier_fi2c_recover(struct uniphier_fi2c_priv *priv)
 	i2c_recover_bus(&priv->adap);
 }
 
-static int uniphier_fi2c_master_xfer_one(struct i2c_adapter *adap,
+static int uniphier_fi2c_xfer_one(struct i2c_adapter *adap,
 					 struct i2c_msg *msg, bool repeat,
 					 bool stop)
 {
@@ -340,7 +340,7 @@ static int uniphier_fi2c_master_xfer_one(struct i2c_adapter *adap,
 		uniphier_fi2c_tx_init(priv, msg->addr, repeat);
 
 	/*
-	 * For a repeated START condition, writing a slave address to the FIFO
+	 * For a repeated START condition, writing a client address to the FIFO
 	 * kicks the controller. So, the UNIPHIER_FI2C_CR register should be
 	 * written only for a non-repeated START condition.
 	 */
@@ -404,7 +404,7 @@ static int uniphier_fi2c_check_bus_busy(struct i2c_adapter *adap)
 	return 0;
 }
 
-static int uniphier_fi2c_master_xfer(struct i2c_adapter *adap,
+static int uniphier_fi2c_xfer(struct i2c_adapter *adap,
 				     struct i2c_msg *msgs, int num)
 {
 	struct i2c_msg *msg, *emsg = msgs + num;
@@ -419,7 +419,7 @@ static int uniphier_fi2c_master_xfer(struct i2c_adapter *adap,
 		/* Emit STOP if it is the last message or I2C_M_STOP is set. */
 		bool stop = (msg + 1 == emsg) || (msg->flags & I2C_M_STOP);
 
-		ret = uniphier_fi2c_master_xfer_one(adap, msg, repeat, stop);
+		ret = uniphier_fi2c_xfer_one(adap, msg, repeat, stop);
 		if (ret)
 			return ret;
 
@@ -435,7 +435,7 @@ static u32 uniphier_fi2c_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm uniphier_fi2c_algo = {
-	.master_xfer = uniphier_fi2c_master_xfer,
+	.xfer = uniphier_fi2c_xfer,
 	.functionality = uniphier_fi2c_functionality,
 };
 
-- 
2.43.0


