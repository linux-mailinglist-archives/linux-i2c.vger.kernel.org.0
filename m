Return-Path: <linux-i2c+bounces-5986-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0879680D7
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 09:44:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2EED01C21F99
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Sep 2024 07:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D95E6183CCB;
	Mon,  2 Sep 2024 07:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GBZMlgKl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DC117DFFA;
	Mon,  2 Sep 2024 07:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725263019; cv=none; b=aN5cpOtvfAlIWFb8/y1OQ4HAnnoRKyoe+mti6eyhkdSYfIbwGJgtWKnNsv6KHENM1rT/II8a+KGz5WKjYoeJM6Ztc8LQRiyYiZBw+TNtI+e7uj12Pzg7Fql5hhkLPj7M1+driZIkxeIMyZKk4J7+g3W0M5cTEsIt+tDTxs6LK6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725263019; c=relaxed/simple;
	bh=jCdQS2njW69Z61Z85AFkcNyViqbNZBaUT4KnGKlajIw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IKa8NU4B2XdYxMb9F/EaszY+3tkTwCgafmPBRZ+c76/LeiC2LatPu1IgnKN5H33XX1DN+0riv+WQkl8AfnIYMYwYZcBEsy6mxrDD8x9KZ8PszeURFVE+YIARctIDidaWBW7Js4/jYRHXz7m3cpKvISXx8pLr/IhFdhBuOOp5Q7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GBZMlgKl; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c255e3c327so935594a12.1;
        Mon, 02 Sep 2024 00:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725263016; x=1725867816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhXn8yzBmBetRaq5gwnzPTgSSOE3n3HbgWNjkP9ceck=;
        b=GBZMlgKlbfJVSbPqM/ZEs+LWCLSt+86Q8+ORM0TZ2G9NZMQlWf7xNg6FNvL8BeB/gb
         06un14duMKhKeDzGtigyz7JO8fR/ziJqdPsUod5EYUJg3+/zrej0LanbczdgV9pOPaFn
         PbBj1xW6Ruy1xaj2ANMJItlKYn8EcK7h6PGVYk7jS8oWX5+rHPYMb4ZobH2M/EybHdI0
         +yzJRvlzNdTSVccVzCQpe3igesKFtYZJA1J93LTG6eMCc+ollDZ4O8nvJuOVa1/j4OSr
         0r7kt4Tx8EaIJJLqia+wzupupYNS/TJvA2+L26CKryf4F0bTGie04cSC579XuLWTpqcc
         hzJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725263016; x=1725867816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhXn8yzBmBetRaq5gwnzPTgSSOE3n3HbgWNjkP9ceck=;
        b=t2HclLaerPtaCAuhoghQnQaS01VKfzIwPoQt4L8q1GrvF4uuKMxa8ZpBiXHjoWmIaK
         sXWqLyPIOQBubAp7NFUDj1ksoGvP0aEOmQYHx+WZv9Sl1o+A5bYK+zvIw4NYOyBUH5xm
         QGq/F2fwKjwKYiW4jeta+qqTDs43ZPy88OQcvPKVIoX6PnBSJzg7+yPF9QnVR/ySqubT
         2Ra1d8JmPE/9x3GUa/uTvzV/AWsoZWHncOpRUpGPxALIYNQeISjhj9zJszYp0wgFcm2Q
         0jq7dx0C23waaxpewLKikYT9XPOPnceBLESfKjpmAEiiKKtivGt4TEmn/3g10AapYBPc
         xy5g==
X-Forwarded-Encrypted: i=1; AJvYcCUPxIK2McDznJ9ynshR+vF/5WelqYA0hTyr1UicsSRMTnILD5rnexcM+8qQVu2fUZz1XiFaQQkKibjpT6g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTDWNg6M7pcbays1kafETflBT96CsjecPESsLCk7YwzJWw0y3g
	4SZvMhqlQZ4/KtJgdzs1ooJOezVwe77Ma6VpzPcO46fiazd4ZM6p
X-Google-Smtp-Source: AGHT+IHiDu66PFT4NbI9XCCDykJ+zbc3l+Z3gf+wyx1pxTHnxU/1Kf6dpoiZq5hhs53tpTHzDM/f6g==
X-Received: by 2002:a05:6402:4310:b0:5a2:2654:7fc4 with SMTP id 4fb4d7f45d1cf-5c25c3a717amr2166864a12.8.1725263015871;
        Mon, 02 Sep 2024 00:43:35 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:3786:cf07:4865:dc9f])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c24ff04551sm1975931a12.35.2024.09.02.00.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 00:43:35 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	Frank.Li@nxp.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v3 2/4] i2c: imx: separate atomic, dma and non-dma use case
Date: Mon,  2 Sep 2024 09:42:02 +0200
Message-ID: <20240902074330.6349-3-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240902074330.6349-1-eichest@gmail.com>
References: <20240902074330.6349-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Separate the atomic, dma and non-dma use case as a preparation step for
moving the non-dma use case to the isr to avoid rescheduling while a
transfer is in progress.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/i2c/busses/i2c-imx.c | 107 +++++++++++++++++++++++------------
 1 file changed, 70 insertions(+), 37 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 1add946e3bc20..2e86d363e186d 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1011,6 +1011,43 @@ static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,
 	return i2c_imx_acked(i2c_imx);
 }
 
+static int i2c_imx_prepare_read(struct imx_i2c_struct *i2c_imx,
+			       struct i2c_msg *msgs, bool atomic,
+			       bool use_dma)
+{
+	int result;
+	unsigned int temp = 0;
+
+	/* write slave address */
+	imx_i2c_write_reg(i2c_8bit_addr_from_msg(msgs), i2c_imx, IMX_I2C_I2DR);
+	result = i2c_imx_trx_complete(i2c_imx, atomic);
+	if (result)
+		return result;
+	result = i2c_imx_acked(i2c_imx);
+	if (result)
+		return result;
+
+	dev_dbg(&i2c_imx->adapter.dev, "<%s> setup bus\n", __func__);
+
+	/* setup bus to read data */
+	temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+	temp &= ~I2CR_MTX;
+
+	/*
+	 * Reset the I2CR_TXAK flag initially for SMBus block read since the
+	 * length is unknown
+	 */
+	if (msgs->len - 1)
+		temp &= ~I2CR_TXAK;
+	if (use_dma)
+		temp |= I2CR_DMAEN;
+
+	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+	imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR); /* dummy read */
+
+	return 0;
+}
+
 static int i2c_imx_dma_read(struct imx_i2c_struct *i2c_imx,
 			struct i2c_msg *msgs, bool is_lastmsg)
 {
@@ -1021,6 +1058,11 @@ static int i2c_imx_dma_read(struct imx_i2c_struct *i2c_imx,
 	struct imx_i2c_dma *dma = i2c_imx->dma;
 	struct device *dev = &i2c_imx->adapter.dev;
 
+	result = i2c_imx_prepare_read(i2c_imx, msgs, false, true);
+	if (result)
+		return result;
+
+	dev_dbg(&i2c_imx->adapter.dev, "<%s> read data\n", __func__);
 
 	dma->chan_using = dma->chan_rx;
 	dma->dma_transfer_dir = DMA_DEV_TO_MEM;
@@ -1131,50 +1173,24 @@ static int i2c_imx_write(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
 	return 0;
 }
 
+static int i2c_imx_atomic_write(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs)
+{
+	return i2c_imx_write(i2c_imx, msgs, true);
+}
+
 static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
 			bool is_lastmsg, bool atomic)
 {
 	int i, result;
 	unsigned int temp;
 	int block_data = msgs->flags & I2C_M_RECV_LEN;
-	int use_dma = i2c_imx->dma && msgs->flags & I2C_M_DMA_SAFE &&
-		msgs->len >= DMA_THRESHOLD && !block_data;
 
-	dev_dbg(&i2c_imx->adapter.dev,
-		"<%s> write slave address: addr=0x%x\n",
-		__func__, i2c_8bit_addr_from_msg(msgs));
-
-	/* write slave address */
-	imx_i2c_write_reg(i2c_8bit_addr_from_msg(msgs), i2c_imx, IMX_I2C_I2DR);
-	result = i2c_imx_trx_complete(i2c_imx, atomic);
+	result = i2c_imx_prepare_read(i2c_imx, msgs, atomic, false);
 	if (result)
 		return result;
-	result = i2c_imx_acked(i2c_imx);
-	if (result)
-		return result;
-
-	dev_dbg(&i2c_imx->adapter.dev, "<%s> setup bus\n", __func__);
-
-	/* setup bus to read data */
-	temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
-	temp &= ~I2CR_MTX;
-
-	/*
-	 * Reset the I2CR_TXAK flag initially for SMBus block read since the
-	 * length is unknown
-	 */
-	if ((msgs->len - 1) || block_data)
-		temp &= ~I2CR_TXAK;
-	if (use_dma)
-		temp |= I2CR_DMAEN;
-	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
-	imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR); /* dummy read */
 
 	dev_dbg(&i2c_imx->adapter.dev, "<%s> read data\n", __func__);
 
-	if (use_dma)
-		return i2c_imx_dma_read(i2c_imx, msgs, is_lastmsg);
-
 	/* read data */
 	for (i = 0; i < msgs->len; i++) {
 		u8 len = 0;
@@ -1241,6 +1257,12 @@ static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
 	return 0;
 }
 
+static int i2c_imx_atomic_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
+			bool is_lastmsg)
+{
+	return i2c_imx_read(i2c_imx, msgs, is_lastmsg, true);
+}
+
 static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
 			       struct i2c_msg *msgs, int num, bool atomic)
 {
@@ -1248,6 +1270,7 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
 	int result;
 	bool is_lastmsg = false;
 	struct imx_i2c_struct *i2c_imx = i2c_get_adapdata(adapter);
+	int use_dma = 0;
 
 	/* Start I2C transfer */
 	result = i2c_imx_start(i2c_imx, atomic);
@@ -1300,15 +1323,25 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
 			(temp & I2SR_SRW ? 1 : 0), (temp & I2SR_IIF ? 1 : 0),
 			(temp & I2SR_RXAK ? 1 : 0));
 #endif
+
+		use_dma = i2c_imx->dma && msgs[i].len >= DMA_THRESHOLD &&
+			msgs[i].flags & I2C_M_DMA_SAFE;
 		if (msgs[i].flags & I2C_M_RD) {
-			result = i2c_imx_read(i2c_imx, &msgs[i], is_lastmsg, atomic);
+			int block_data = msgs->flags & I2C_M_RECV_LEN;
+
+			if (atomic)
+				result = i2c_imx_atomic_read(i2c_imx, &msgs[i], is_lastmsg);
+			else if (use_dma && !block_data)
+				result = i2c_imx_dma_read(i2c_imx, &msgs[i], is_lastmsg);
+			else
+				result = i2c_imx_read(i2c_imx, &msgs[i], is_lastmsg, false);
 		} else {
-			if (!atomic &&
-			    i2c_imx->dma && msgs[i].len >= DMA_THRESHOLD &&
-				msgs[i].flags & I2C_M_DMA_SAFE)
+			if (atomic)
+				result = i2c_imx_atomic_write(i2c_imx, &msgs[i]);
+			else if (use_dma)
 				result = i2c_imx_dma_write(i2c_imx, &msgs[i]);
 			else
-				result = i2c_imx_write(i2c_imx, &msgs[i], atomic);
+				result = i2c_imx_write(i2c_imx, &msgs[i], false);
 		}
 		if (result)
 			goto fail0;
-- 
2.43.0


