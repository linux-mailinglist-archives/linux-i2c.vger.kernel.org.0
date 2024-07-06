Return-Path: <linux-i2c+bounces-4719-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9139192933C
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 13:32:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B40F283672
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 11:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5A6A1386A7;
	Sat,  6 Jul 2024 11:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="E+bVB3Ul"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6098176ACD
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 11:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720264940; cv=none; b=f2z4KA0H17nWNx1TZ13MZKOeFEBntTKByMjMIwB3s5APkbEpYEsBmqjocnZkcp9CqmRQPBPqL+02+1INR99LrbUX7UjrMc2H97SsMG79FmCtq+CvausWEGOmLFGQ+Ss67C0YvHnOTCGsnJhLEYNHdR/uyeURBcPkBtsSi2Sj6Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720264940; c=relaxed/simple;
	bh=uto8Pdj1YRMUFV3G76FwUujDFt4c9/1d8SImzEdbYUU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WjqcSestSiuGMRytTu54ZPD6kQmMsYYxUifm+HUAlJigUZX+7yfeSLi0TBJ2DBYc6QR+/nsc0WEseIm4M5YvQI6SBGrCdGAMJ54ht8ml5XiUoV8k7HS+5tdjG92mCvwVn9S06i+a1449vEWy5TAKZ/UYQCO164lCmRc+ly7pmi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=E+bVB3Ul; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=pfpnH4vIg5DFjDwxK5vnInKOpo7NA3S1zIbA7Njtltc=; b=E+bVB3
	UllDwFTr5PSFY7Sdxs1VrH1uExrVIX5mwyrWVA7ZEFV77Vs3BtV/wOof13BXvD+V
	i3zWYn3dr5MavWdyr2dfxIOlREwotkyzIfSc+gibSBlH/kXlpcvfCH0qtYxcAgAa
	puxnOBt76ENE82byitv6pQ8kEbPG18NeSvPDRm1ad3BD5t1azqXwGLswHncfZhTS
	lF3raTAmKGJT0INjM3Jcd5Q46pMSWJfPfTNHMrJZePUZeOgSpZqjPGqrUzFr12Am
	xr+1UA8JpDCrX3Mi7yoX1p1nJiRgdcuc/xF4FUs9GLE6zeIq7PqAEO7hLESrQTcA
	FgnmuB2HaTGScX5g==
Received: (qmail 3811081 invoked from network); 6 Jul 2024 13:21:59 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 13:21:59 +0200
X-UD-Smtp-Session: l3s3148p1@fyFxY5IcjOFQT+F6
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 53/60] i2c: uniphier-f: reword according to newest specification
Date: Sat,  6 Jul 2024 13:20:53 +0200
Message-ID: <20240706112116.24543-54-wsa+renesas@sang-engineering.com>
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
 drivers/i2c/busses/i2c-uniphier-f.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-uniphier-f.c b/drivers/i2c/busses/i2c-uniphier-f.c
index 6c3dac2cf568..10a99cd08972 100644
--- a/drivers/i2c/busses/i2c-uniphier-f.c
+++ b/drivers/i2c/busses/i2c-uniphier-f.c
@@ -12,15 +12,15 @@
 #include <linux/platform_device.h>
 
 #define UNIPHIER_FI2C_CR	0x00	/* control register */
-#define     UNIPHIER_FI2C_CR_MST	BIT(3)	/* master mode */
+#define     UNIPHIER_FI2C_CR_MST	BIT(3)	/* controller mode */
 #define     UNIPHIER_FI2C_CR_STA	BIT(2)	/* start condition */
 #define     UNIPHIER_FI2C_CR_STO	BIT(1)	/* stop condition */
 #define     UNIPHIER_FI2C_CR_NACK	BIT(0)	/* do not return ACK */
 #define UNIPHIER_FI2C_DTTX	0x04	/* TX FIFO */
-#define     UNIPHIER_FI2C_DTTX_CMD	BIT(8)	/* send command (slave addr) */
+#define     UNIPHIER_FI2C_DTTX_CMD	BIT(8)	/* send command (target addr) */
 #define     UNIPHIER_FI2C_DTTX_RD	BIT(0)	/* read transaction */
 #define UNIPHIER_FI2C_DTRX	0x04	/* RX FIFO */
-#define UNIPHIER_FI2C_SLAD	0x0c	/* slave address */
+#define UNIPHIER_FI2C_SLAD	0x0c	/* target address */
 #define UNIPHIER_FI2C_CYC	0x10	/* clock cycle control */
 #define UNIPHIER_FI2C_LCTL	0x14	/* clock low period control */
 #define UNIPHIER_FI2C_SSUT	0x18	/* restart/stop setup time control */
@@ -96,7 +96,7 @@ static void uniphier_fi2c_fill_txfifo(struct uniphier_fi2c_priv *priv,
 	int fifo_space = UNIPHIER_FI2C_FIFO_SIZE;
 
 	/*
-	 * TX-FIFO stores slave address in it for the first access.
+	 * TX-FIFO stores target address in it for the first access.
 	 * Decrement the counter.
 	 */
 	if (first)
@@ -252,7 +252,7 @@ static void uniphier_fi2c_tx_init(struct uniphier_fi2c_priv *priv, u16 addr,
 
 	/* do not use TX byte counter */
 	writel(0, priv->membase + UNIPHIER_FI2C_TBC);
-	/* set slave address */
+	/* set target address */
 	writel(UNIPHIER_FI2C_DTTX_CMD | addr << 1,
 	       priv->membase + UNIPHIER_FI2C_DTTX);
 	/*
@@ -288,7 +288,7 @@ static void uniphier_fi2c_rx_init(struct uniphier_fi2c_priv *priv, u16 addr)
 
 	uniphier_fi2c_set_irqs(priv);
 
-	/* set slave address with RD bit */
+	/* set target address with RD bit */
 	writel(UNIPHIER_FI2C_DTTX_CMD | UNIPHIER_FI2C_DTTX_RD | addr << 1,
 	       priv->membase + UNIPHIER_FI2C_DTTX);
 }
@@ -310,9 +310,8 @@ static void uniphier_fi2c_recover(struct uniphier_fi2c_priv *priv)
 	i2c_recover_bus(&priv->adap);
 }
 
-static int uniphier_fi2c_master_xfer_one(struct i2c_adapter *adap,
-					 struct i2c_msg *msg, bool repeat,
-					 bool stop)
+static int uniphier_fi2c_xfer_one(struct i2c_adapter *adap, struct i2c_msg *msg,
+				  bool repeat, bool stop)
 {
 	struct uniphier_fi2c_priv *priv = i2c_get_adapdata(adap);
 	bool is_read = msg->flags & I2C_M_RD;
@@ -340,7 +339,7 @@ static int uniphier_fi2c_master_xfer_one(struct i2c_adapter *adap,
 		uniphier_fi2c_tx_init(priv, msg->addr, repeat);
 
 	/*
-	 * For a repeated START condition, writing a slave address to the FIFO
+	 * For a repeated START condition, writing a target address to the FIFO
 	 * kicks the controller. So, the UNIPHIER_FI2C_CR register should be
 	 * written only for a non-repeated START condition.
 	 */
@@ -403,8 +402,7 @@ static int uniphier_fi2c_check_bus_busy(struct i2c_adapter *adap)
 	return 0;
 }
 
-static int uniphier_fi2c_master_xfer(struct i2c_adapter *adap,
-				     struct i2c_msg *msgs, int num)
+static int uniphier_fi2c_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs, int num)
 {
 	struct i2c_msg *msg, *emsg = msgs + num;
 	bool repeat = false;
@@ -418,7 +416,7 @@ static int uniphier_fi2c_master_xfer(struct i2c_adapter *adap,
 		/* Emit STOP if it is the last message or I2C_M_STOP is set. */
 		bool stop = (msg + 1 == emsg) || (msg->flags & I2C_M_STOP);
 
-		ret = uniphier_fi2c_master_xfer_one(adap, msg, repeat, stop);
+		ret = uniphier_fi2c_xfer_one(adap, msg, repeat, stop);
 		if (ret)
 			return ret;
 
@@ -434,7 +432,7 @@ static u32 uniphier_fi2c_functionality(struct i2c_adapter *adap)
 }
 
 static const struct i2c_algorithm uniphier_fi2c_algo = {
-	.master_xfer = uniphier_fi2c_master_xfer,
+	.xfer = uniphier_fi2c_xfer,
 	.functionality = uniphier_fi2c_functionality,
 };
 
-- 
2.43.0


