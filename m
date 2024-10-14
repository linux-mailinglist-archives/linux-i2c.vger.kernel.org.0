Return-Path: <linux-i2c+bounces-7365-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A74C199CB6F
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2024 15:18:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67659282A4F
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2024 13:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7699A1AE001;
	Mon, 14 Oct 2024 13:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VoMMvLta"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3F71AAE23;
	Mon, 14 Oct 2024 13:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728911808; cv=none; b=STkM3mPMwTVR9oeasST+rfLOGu2ouZ/u9gAB7Eb+ZI1UTGKyBtDpe9D5FK7n9y1aYg3UPypk6pUE1bJKYHPtZ7rjxEzHz61aodbb7UanIkF+LdKAXimUvC4CYA70Z8LcM6RYmR/aVJ+s5/Bll3cAm5I5fvtrXrCufTjCpTkiSWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728911808; c=relaxed/simple;
	bh=kvvmChFrSbblWuUVErG1yoY692+URj+sFtAUcBkjepk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kCeGj/yUYchB26cE0kKAd1O9iKpS+jgF7VVodwp84rUiNI3ETeHlOCVsDcZrkHIXWE81zONUmU10RSVA7HCHIjn8QnEAmWANKdHFsZhozMsc8SiPSS4VIJG1kjH8uBJcCPhO09w0znjHwGwWQv77dp2rifBAFv+3IeqPwJ3MjnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VoMMvLta; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-37d495d217bso3803228f8f.0;
        Mon, 14 Oct 2024 06:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728911805; x=1729516605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t8AezVwPrFjuUUf+MrjbX+IGpei906KShJIFKpwBFic=;
        b=VoMMvLtat84k3aiAJ2vwkCVXPtsezvJEc6xB0SY4CuMBeHGJYMC+QJsOZmpotU8vTt
         /is/l1HVwYeqz5GlYQz3m5W+dHxl+69PrJQqzpI8JKt4n8IRSJF5fY3+mZ8M1+Io5+X9
         QS8kYbVYLYrI7cbU44auPgjvnB43vCf+xmf63TWF0aQH3cJtE54oIaUATMZCpwhcpos6
         m9VLKWcCUJLjQ798QnC+zh7ajyevYCVdRpYEMGI8PEVIpVqpgOfOz7/6xRmUf3FB+z50
         B30QOSfU6lD0mYl47mKimmYpCl7VOt7MkkVXdNA8NaFiGqJ5UQ6aYNZiRnhzA6xky5LE
         Fewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728911805; x=1729516605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t8AezVwPrFjuUUf+MrjbX+IGpei906KShJIFKpwBFic=;
        b=tPmuOXCykTsTCk3SlmS99vg2+Ab64J5ERMaUp4aMCm1+Rwtxl2bGRwlST1SFRjhix4
         e2mBhcD5OaxU/gH4iwkJENz5Qq1XlBfIdn6DCBQ548RMpko90QILl63NYEgkN20bZ3hb
         m6ratY9QChQZhdEx8D1ZX4WtopPMtjAqkWdpWhy6M0vd22jMT8y42/ULoSpAUtRtnZ8t
         nQTrIeHTsIiFfecy38nj1jbRThJXb1DPMn4zbi54T/yIxnHs3xBwSTTdvc9trr7L8sfD
         57AUvVCPoR9lWDH4SAKD3RKiDwjdhZs4uokLipJXAjQFaEeeGUdnF29HvxbNcM3Rps2Y
         saDA==
X-Forwarded-Encrypted: i=1; AJvYcCVKwUbi+NHUSDy1J1zM4DlKcbMSK8xeaL45UqH36QFOizz2Zp3T3+W+nIk/svtrbg+V/rnay0QwJ57Lct8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwIB0PL10xpSPuSsF+d99L8CdYmIGtDAdUlQfCTQalB5Tb7eZM
	z3w/fXeFLqCqs52Eyn5ukyIvz7cNDtvfYNjsNtqA4EZjcXv//qsg
X-Google-Smtp-Source: AGHT+IEkcxsBd8EXsI3mjGhSeBuRkydLwhmHeXnNkmO+AuXIs5FW/RFlG2XvEEvTWzZ/6bVzK2oHCQ==
X-Received: by 2002:adf:fcc3:0:b0:37d:542a:7995 with SMTP id ffacd0b85a97d-37d5ffb63d0mr7092665f8f.34.1728911804410;
        Mon, 14 Oct 2024 06:16:44 -0700 (PDT)
Received: from eichest-laptop.lan ([2a02:168:af72:0:d130:f8ef:c6c1:55ee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-430d748d42fsm153420425e9.43.2024.10.14.06.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 06:16:43 -0700 (PDT)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	l.stach@pengutronix.de,
	arnd@arndb.de,
	Frank.Li@nxp.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: [PATCH v5 3/3] i2c: imx: prevent rescheduling in non dma mode
Date: Mon, 14 Oct 2024 15:15:14 +0200
Message-ID: <20241014131635.205489-4-eichest@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241014131635.205489-1-eichest@gmail.com>
References: <20241014131635.205489-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

We are experiencing a problem with the i.MX I2C controller when
communicating with SMBus devices. We are seeing devices time-out because
the time between sending/receiving two bytes is too long, and the SMBus
device returns to the idle state. This happens because the i.MX I2C
controller sends and receives byte by byte. When a byte is sent or
received, we get an interrupt and can send or receive the next byte.

The current implementation sends a byte and then waits for an event
generated by the interrupt subroutine. After the event is received, the
next byte is sent and we wait again. This waiting allows the scheduler
to reschedule other tasks, with the disadvantage that we may not send
the next byte for a long time because the send task is not immediately
scheduled. For example, if the rescheduling takes more than 25ms, this
can cause SMBus devices to timeout and communication to fail.

This patch changes the behavior so that we do not reschedule the
send/receive task, but instead send or receive the next byte in the
interrupt subroutine. This prevents rescheduling and drastically reduces
the time between sending/receiving bytes. The cost in the interrupt
subroutine is relatively small, we check what state we are in and then
send/receive the next byte. Before we had to call wake_up, which is even
less expensive. However, we also had to do some scheduling, which
increased the overall cost compared to the new solution. The wake_up
function to wake up the send/receive task is now only called when an
error occurs or when the transfer is complete.

Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 drivers/i2c/busses/i2c-imx.c | 272 ++++++++++++++++++++++++++++++++---
 1 file changed, 249 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index e0821332c439a..44749e594ddb6 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -197,6 +197,17 @@ struct imx_i2c_dma {
 	enum dma_data_direction dma_data_dir;
 };
 
+enum imx_i2c_state {
+	IMX_I2C_STATE_DONE,
+	IMX_I2C_STATE_FAILED,
+	IMX_I2C_STATE_WRITE,
+	IMX_I2C_STATE_DMA,
+	IMX_I2C_STATE_READ,
+	IMX_I2C_STATE_READ_CONTINUE,
+	IMX_I2C_STATE_READ_BLOCK_DATA,
+	IMX_I2C_STATE_READ_BLOCK_DATA_LEN,
+};
+
 struct imx_i2c_struct {
 	struct i2c_adapter	adapter;
 	struct clk		*clk;
@@ -216,6 +227,12 @@ struct imx_i2c_struct {
 	struct i2c_client	*slave;
 	enum i2c_slave_event last_slave_event;
 
+	struct i2c_msg		*msg;
+	unsigned int		msg_buf_idx;
+	int			isr_result;
+	bool			is_lastmsg;
+	enum imx_i2c_state	state;
+
 	bool			multi_master;
 
 	/* For checking slave events. */
@@ -908,11 +925,156 @@ static int i2c_imx_unreg_slave(struct i2c_client *client)
 	return ret;
 }
 
+static inline int i2c_imx_isr_acked(struct imx_i2c_struct *i2c_imx)
+{
+	i2c_imx->isr_result = 0;
+
+	if (imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR) & I2SR_RXAK) {
+		i2c_imx->state = IMX_I2C_STATE_FAILED;
+		i2c_imx->isr_result = -ENXIO;
+		wake_up(&i2c_imx->queue);
+	}
+
+	return i2c_imx->isr_result;
+}
+
+static inline int i2c_imx_isr_write(struct imx_i2c_struct *i2c_imx)
+{
+	int result;
+
+	result = i2c_imx_isr_acked(i2c_imx);
+	if (result)
+		return result;
+
+	if (i2c_imx->msg->len == i2c_imx->msg_buf_idx)
+		return 0;
+
+	imx_i2c_write_reg(i2c_imx->msg->buf[i2c_imx->msg_buf_idx++], i2c_imx, IMX_I2C_I2DR);
+
+	return 1;
+}
+
+static inline int i2c_imx_isr_read(struct imx_i2c_struct *i2c_imx)
+{
+	int result;
+	unsigned int temp;
+
+	result = i2c_imx_isr_acked(i2c_imx);
+	if (result)
+		return result;
+
+	/* setup bus to read data */
+	temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+	temp &= ~I2CR_MTX;
+	if (i2c_imx->msg->len - 1)
+		temp &= ~I2CR_TXAK;
+
+	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+	imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR); /* dummy read */
+
+	return 0;
+}
+
+static inline void i2c_imx_isr_read_continue(struct imx_i2c_struct *i2c_imx)
+{
+	unsigned int temp;
+
+	if ((i2c_imx->msg->len - 1) == i2c_imx->msg_buf_idx) {
+		if (i2c_imx->is_lastmsg) {
+			/*
+			 * It must generate STOP before read I2DR to prevent
+			 * controller from generating another clock cycle
+			 */
+			temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+			if (!(temp & I2CR_MSTA))
+				i2c_imx->stopped =  1;
+			temp &= ~(I2CR_MSTA | I2CR_MTX);
+			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+		} else {
+			/*
+			 * For i2c master receiver repeat restart operation like:
+			 * read -> repeat MSTA -> read/write
+			 * The controller must set MTX before read the last byte in
+			 * the first read operation, otherwise the first read cost
+			 * one extra clock cycle.
+			 */
+			temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+			temp |= I2CR_MTX;
+			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+		}
+	} else if (i2c_imx->msg_buf_idx == (i2c_imx->msg->len - 2)) {
+		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+		temp |= I2CR_TXAK;
+		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+	}
+
+	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
+}
+
+static inline void i2c_imx_isr_read_block_data_len(struct imx_i2c_struct *i2c_imx)
+{
+	u8 len = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
+
+	if (len == 0 || len > I2C_SMBUS_BLOCK_MAX) {
+		i2c_imx->isr_result = -EPROTO;
+		i2c_imx->state = IMX_I2C_STATE_FAILED;
+		wake_up(&i2c_imx->queue);
+	}
+	i2c_imx->msg->len += len;
+}
+
 static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned int status)
 {
-	/* save status register */
-	i2c_imx->i2csr = status;
-	wake_up(&i2c_imx->queue);
+	/*
+	 * This state machine handles I2C reception and transmission in non-DMA
+	 * mode. We must process all the data in the ISR to reduce the delay
+	 * between two consecutive messages. If the data is not processed in
+	 * the ISR, SMBus devices may timeout, leading to a bus error.
+	 */
+	switch (i2c_imx->state) {
+	case IMX_I2C_STATE_DMA:
+		i2c_imx->i2csr = status;
+		wake_up(&i2c_imx->queue);
+		break;
+
+	case IMX_I2C_STATE_READ:
+		if (i2c_imx_isr_read(i2c_imx))
+			break;
+		i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
+		break;
+
+	case IMX_I2C_STATE_READ_CONTINUE:
+		i2c_imx_isr_read_continue(i2c_imx);
+		if (i2c_imx->msg_buf_idx == i2c_imx->msg->len) {
+			i2c_imx->state = IMX_I2C_STATE_DONE;
+			wake_up(&i2c_imx->queue);
+		}
+		break;
+
+	case IMX_I2C_STATE_READ_BLOCK_DATA:
+		if (i2c_imx_isr_read(i2c_imx))
+			break;
+		i2c_imx->state = IMX_I2C_STATE_READ_BLOCK_DATA_LEN;
+		break;
+
+	case IMX_I2C_STATE_READ_BLOCK_DATA_LEN:
+		i2c_imx_isr_read_block_data_len(i2c_imx);
+		i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
+		break;
+
+	case IMX_I2C_STATE_WRITE:
+		if (i2c_imx_isr_write(i2c_imx))
+			break;
+		i2c_imx->state = IMX_I2C_STATE_DONE;
+		wake_up(&i2c_imx->queue);
+		break;
+
+	default:
+		i2c_imx->i2csr = status;
+		i2c_imx->state = IMX_I2C_STATE_FAILED;
+		i2c_imx->isr_result = -EINVAL;
+		wake_up(&i2c_imx->queue);
+	}
 
 	return IRQ_HANDLED;
 }
@@ -959,6 +1121,8 @@ static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,
 	struct imx_i2c_dma *dma = i2c_imx->dma;
 	struct device *dev = &i2c_imx->adapter.dev;
 
+	i2c_imx->state = IMX_I2C_STATE_DMA;
+
 	dma->chan_using = dma->chan_tx;
 	dma->dma_transfer_dir = DMA_MEM_TO_DEV;
 	dma->dma_data_dir = DMA_TO_DEVICE;
@@ -1012,15 +1176,14 @@ static int i2c_imx_dma_write(struct imx_i2c_struct *i2c_imx,
 }
 
 static int i2c_imx_prepare_read(struct imx_i2c_struct *i2c_imx,
-				struct i2c_msg *msgs, bool atomic,
-				bool use_dma)
+				struct i2c_msg *msgs, bool use_dma)
 {
 	int result;
 	unsigned int temp = 0;
 
 	/* write slave address */
 	imx_i2c_write_reg(i2c_8bit_addr_from_msg(msgs), i2c_imx, IMX_I2C_I2DR);
-	result = i2c_imx_trx_complete(i2c_imx, atomic);
+	result = i2c_imx_trx_complete(i2c_imx, !use_dma);
 	if (result)
 		return result;
 	result = i2c_imx_acked(i2c_imx);
@@ -1058,7 +1221,9 @@ static int i2c_imx_dma_read(struct imx_i2c_struct *i2c_imx,
 	struct imx_i2c_dma *dma = i2c_imx->dma;
 	struct device *dev = &i2c_imx->adapter.dev;
 
-	result = i2c_imx_prepare_read(i2c_imx, msgs, false, true);
+	i2c_imx->state = IMX_I2C_STATE_DMA;
+
+	result = i2c_imx_prepare_read(i2c_imx, msgs, true);
 	if (result)
 		return result;
 
@@ -1139,8 +1304,8 @@ static int i2c_imx_dma_read(struct imx_i2c_struct *i2c_imx,
 	return 0;
 }
 
-static int i2c_imx_write(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
-			 bool atomic)
+static int i2c_imx_atomic_write(struct imx_i2c_struct *i2c_imx,
+				struct i2c_msg *msgs)
 {
 	int i, result;
 
@@ -1149,7 +1314,7 @@ static int i2c_imx_write(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
 
 	/* write slave address */
 	imx_i2c_write_reg(i2c_8bit_addr_from_msg(msgs), i2c_imx, IMX_I2C_I2DR);
-	result = i2c_imx_trx_complete(i2c_imx, atomic);
+	result = i2c_imx_trx_complete(i2c_imx, true);
 	if (result)
 		return result;
 	result = i2c_imx_acked(i2c_imx);
@@ -1163,7 +1328,7 @@ static int i2c_imx_write(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
 			"<%s> write byte: B%d=0x%X\n",
 			__func__, i, msgs->buf[i]);
 		imx_i2c_write_reg(msgs->buf[i], i2c_imx, IMX_I2C_I2DR);
-		result = i2c_imx_trx_complete(i2c_imx, atomic);
+		result = i2c_imx_trx_complete(i2c_imx, true);
 		if (result)
 			return result;
 		result = i2c_imx_acked(i2c_imx);
@@ -1173,19 +1338,44 @@ static int i2c_imx_write(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
 	return 0;
 }
 
-static int i2c_imx_atomic_write(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs)
+static int i2c_imx_write(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs)
 {
-	return i2c_imx_write(i2c_imx, msgs, true);
+	dev_dbg(&i2c_imx->adapter.dev, "<%s> write slave address: addr=0x%x\n",
+		__func__, i2c_8bit_addr_from_msg(msgs));
+
+	i2c_imx->state = IMX_I2C_STATE_WRITE;
+	i2c_imx->msg = msgs;
+	i2c_imx->msg_buf_idx = 0;
+
+	/*
+	 * By writing the device address we start the state machine in the ISR.
+	 * The ISR will report when it is done or when it fails.
+	 */
+	imx_i2c_write_reg(i2c_8bit_addr_from_msg(msgs), i2c_imx, IMX_I2C_I2DR);
+	wait_event_timeout(i2c_imx->queue,
+			   i2c_imx->state == IMX_I2C_STATE_DONE ||
+			   i2c_imx->state == IMX_I2C_STATE_FAILED,
+			   (msgs->len + 1) * HZ / 10);
+	if (i2c_imx->state == IMX_I2C_STATE_FAILED) {
+		dev_dbg(&i2c_imx->adapter.dev, "<%s> write failed with %d\n",
+			__func__, i2c_imx->isr_result);
+		return i2c_imx->isr_result;
+	}
+	if (i2c_imx->state != IMX_I2C_STATE_DONE) {
+		dev_err(&i2c_imx->adapter.dev, "<%s> write timedout\n", __func__);
+		return -ETIMEDOUT;
+	}
+	return 0;
 }
 
-static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
-			bool is_lastmsg, bool atomic)
+static int i2c_imx_atomic_read(struct imx_i2c_struct *i2c_imx,
+			       struct i2c_msg *msgs, bool is_lastmsg)
 {
 	int i, result;
 	unsigned int temp;
 	int block_data = msgs->flags & I2C_M_RECV_LEN;
 
-	result = i2c_imx_prepare_read(i2c_imx, msgs, atomic, false);
+	result = i2c_imx_prepare_read(i2c_imx, msgs, false);
 	if (result)
 		return result;
 
@@ -1195,7 +1385,7 @@ static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
 	for (i = 0; i < msgs->len; i++) {
 		u8 len = 0;
 
-		result = i2c_imx_trx_complete(i2c_imx, atomic);
+		result = i2c_imx_trx_complete(i2c_imx, true);
 		if (result)
 			return result;
 		/*
@@ -1226,7 +1416,7 @@ static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
 				temp &= ~(I2CR_MSTA | I2CR_MTX);
 				imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
 				if (!i2c_imx->stopped)
-					i2c_imx_bus_busy(i2c_imx, 0, atomic);
+					i2c_imx_bus_busy(i2c_imx, 0, true);
 			} else {
 				/*
 				 * For i2c master receiver repeat restart operation like:
@@ -1257,10 +1447,46 @@ static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
 	return 0;
 }
 
-static int i2c_imx_atomic_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
-			       bool is_lastmsg)
+static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
+			bool is_lastmsg)
 {
-	return i2c_imx_read(i2c_imx, msgs, is_lastmsg, true);
+	int block_data = msgs->flags & I2C_M_RECV_LEN;
+
+	dev_dbg(&i2c_imx->adapter.dev,
+		"<%s> write slave address: addr=0x%x\n",
+		__func__, i2c_8bit_addr_from_msg(msgs));
+
+	i2c_imx->is_lastmsg = is_lastmsg;
+
+	if (block_data)
+		i2c_imx->state = IMX_I2C_STATE_READ_BLOCK_DATA;
+	else
+		i2c_imx->state = IMX_I2C_STATE_READ;
+	i2c_imx->msg = msgs;
+	i2c_imx->msg_buf_idx = 0;
+
+	/*
+	 * By writing the device address we start the state machine in the ISR.
+	 * The ISR will report when it is done or when it fails.
+	 */
+	imx_i2c_write_reg(i2c_8bit_addr_from_msg(msgs), i2c_imx, IMX_I2C_I2DR);
+	wait_event_timeout(i2c_imx->queue,
+			   i2c_imx->state == IMX_I2C_STATE_DONE ||
+			   i2c_imx->state == IMX_I2C_STATE_FAILED,
+			   (msgs->len + 1) * HZ / 10);
+	if (i2c_imx->state == IMX_I2C_STATE_FAILED) {
+		dev_dbg(&i2c_imx->adapter.dev, "<%s> read failed with %d\n",
+			__func__, i2c_imx->isr_result);
+		return i2c_imx->isr_result;
+	}
+	if (i2c_imx->state != IMX_I2C_STATE_DONE) {
+		dev_err(&i2c_imx->adapter.dev, "<%s> read timedout\n", __func__);
+		return -ETIMEDOUT;
+	}
+	if (!i2c_imx->stopped)
+		return i2c_imx_bus_busy(i2c_imx, 0, false);
+
+	return 0;
 }
 
 static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
@@ -1334,14 +1560,14 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
 			else if (use_dma && !block_data)
 				result = i2c_imx_dma_read(i2c_imx, &msgs[i], is_lastmsg);
 			else
-				result = i2c_imx_read(i2c_imx, &msgs[i], is_lastmsg, false);
+				result = i2c_imx_read(i2c_imx, &msgs[i], is_lastmsg);
 		} else {
 			if (atomic)
 				result = i2c_imx_atomic_write(i2c_imx, &msgs[i]);
 			else if (use_dma)
 				result = i2c_imx_dma_write(i2c_imx, &msgs[i]);
 			else
-				result = i2c_imx_write(i2c_imx, &msgs[i], false);
+				result = i2c_imx_write(i2c_imx, &msgs[i]);
 		}
 		if (result)
 			goto fail0;
-- 
2.43.0


