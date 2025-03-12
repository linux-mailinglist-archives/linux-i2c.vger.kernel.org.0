Return-Path: <linux-i2c+bounces-9813-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D7EA5E41F
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 20:07:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 590203A5889
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Mar 2025 19:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD1CA255E3C;
	Wed, 12 Mar 2025 19:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eU25/q+m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417AF205ADB
	for <linux-i2c@vger.kernel.org>; Wed, 12 Mar 2025 19:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741806441; cv=none; b=WI6Ruz/GigtzJFBU4DFJL8oyeoaC0Wjrtc3vLKR3rcIcCOIZxDGXFvFTx3+eS4oM47U4Z9NveT6ma0nPImUhEvvRatA6Y0rtqOdbN/RM1Pw2ph6OLsk3eHd0iNuRbO623lJebHxC103xHeuvRLGjWBE/F5XECzFpA8lNTLT4JMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741806441; c=relaxed/simple;
	bh=Hmtv3Zb6eqUjLrIl3jqGpAD14b9yOlSyNQC7LQgM1io=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Ek6yiLLfzY29cYaEpmVD/mbeTuCPGUTbVhzhoVcaJ4hcwusbieJLiqLAFGFIjLfpfuXa32hUf7Ryg8t4wfsZfd+7u3mC5xdkltGcochYSNNJSo6qEyC+9t7R4xadKNOzRsmf0IC9lj719kAt3w+aEj8krvVyTkkVWUngv3XJ5EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eU25/q+m; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf58eea0fso984295e9.0
        for <linux-i2c@vger.kernel.org>; Wed, 12 Mar 2025 12:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741806437; x=1742411237; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nIWY/AlNEEl9LiInxZNXxCKd87fouEkZfR+VZuUP5uI=;
        b=eU25/q+mvRnPinblFC8UUNeb/m1og85G0GhaGye7QkIsJOvWOQBBLeTZihIDgLKXfR
         7KJYRQRv7X9CXxd0r2filey/GrfONoqrre1AI5tcobnYTnQdMCp1RVHTr7mesr0ygA37
         VKYb7ZBSIyvNrjztoiEFikdMLF8V32i706FcisoAHQlfemJUcSF2hWUgF4BPEJ6ogAss
         9PFXXg5fPVjoagrsmk0q2jfRqsUH2SH2Nt6vU3OLEWEF0+O5aIDeBdVyJCsbwSjVJ9wl
         kDpeLKYQRmEWuPE8tGDJDA2MAVSUTTUPn6Rep+6T2sLPVNpB3pRVui//yk9C2ootAX/l
         CQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741806437; x=1742411237;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nIWY/AlNEEl9LiInxZNXxCKd87fouEkZfR+VZuUP5uI=;
        b=B8JeB1sf9gOTs9BjTo9T8z/L5P8QOL7K30P0e2FDcrMu4cHkwiwffyMvnRpYdummOv
         yk/lZ8kVA2HehMzj6xqhJ8nKkGXFMV62QojgFpHNg+CHIS5+7ObHruR7ozh1ee/YokY5
         fy00v/ka5HQUB6pNzYpF5Mq83ZFH9a6o6CQBu1sPvCnaX0QCct2+K0f3NfECKmHDvuPi
         7fX4V7NSrq6IRsRtxfq7nJxE644SnQdi9Yba9ioVof90U03pZqJarbcjE2F0A7B6GH8/
         QnCjNE70GdRTcTHrPAn4Om2T3TmCpWEDPURbZdPhRAziksqyJEOgsi+BbKAEaYRc0nj+
         wFJA==
X-Gm-Message-State: AOJu0YxHiA9a6lh/8MH1f0H2h92Qdraa0G0OB71VOEm7M75zqquqc2yw
	rBRenPmLao2ZfP1x/aWlwSFSNxDAyLTV28E0FrKoIj2kHMECRTx6MVM9IMD+
X-Gm-Gg: ASbGncsT0wd4qnbA3khAbE2aXL9cwjD4Q6vM57eqs0rzD6YXHO4ZwUYUNuJ9YFyjwnL
	Ii8a7Yqewv8On0K34+uhojYcU3pmHODhVRnio8BRzPhS3rhe/OYKOHL3H2ah1RiCma0cHfvgilj
	M6iCa/O0DKPqDBPD6dwV75ZguaeAs3CfkHAc968UX2ahyURkyz4M25Q7YmCLE8Dc/Z7OH/NbhVc
	fLqgDhGQ6NGiTX+vsK5tgYxNRQH6qTpv7GgntcqpO8fCgwUc0749W7dyKZmBM0f7kNpLWkiTtGb
	1Fc3mdF7FWdbhPoM/B2raUyijIhXRynDwHa2qcBnwhRda7gDgVktV15YTsuh/sf0pXhHLLsbnGr
	aG6wW8DfEROzn8M3IcgtW28E8DPiut+xz2I1YaY3695ZgF+z2WvzmYkMcL/mdMZKCHl5vxJ81rJ
	eXwJKSrdl4IdM8C9dFxhqN9lGMkTiiC239EuO9ovUm3MRM3FA=
X-Google-Smtp-Source: AGHT+IFre5I3mtVr84wpneTT5D+WjvZNQekBlV12nK/R5TpfvpjG42gD97YO95AB1T8wvyaAhvxEPg==
X-Received: by 2002:a05:6000:2a0d:b0:391:3b1b:f3b7 with SMTP id ffacd0b85a97d-39264694cffmr6043115f8f.28.1741806437388;
        Wed, 12 Mar 2025 12:07:17 -0700 (PDT)
Received: from ?IPV6:2a02:3100:a4d2:5c00:ad7a:ba59:161c:c724? (dynamic-2a02-3100-a4d2-5c00-ad7a-ba59-161c-c724.310.pool.telefonica.de. [2a02:3100:a4d2:5c00:ad7a:ba59:161c:c724])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d0a72eda5sm30223875e9.2.2025.03.12.12.07.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Mar 2025 12:07:16 -0700 (PDT)
Message-ID: <67535b17-c3fb-4507-b083-9c1884b4dd7d@gmail.com>
Date: Wed, 12 Mar 2025 20:07:23 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 1/2] i2c: i801: Switch to iomapped register access
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <28ad9377-6d8a-4259-8cd4-7edaa00e26d7@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <28ad9377-6d8a-4259-8cd4-7edaa00e26d7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Switch to iomapped register access as a prerequisite for adding
support for MMIO register access.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 149 +++++++++++++++++-----------------
 1 file changed, 73 insertions(+), 76 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 6a4147054..bf5702ccb 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -276,7 +276,7 @@ struct i801_mux_config {
 
 struct i801_priv {
 	struct i2c_adapter adapter;
-	unsigned long smba;
+	void __iomem *smba;
 	unsigned char original_hstcfg;
 	unsigned char original_hstcnt;
 	unsigned char original_slvcmd;
@@ -345,7 +345,7 @@ static int i801_wait_intr(struct i801_priv *priv)
 
 	do {
 		usleep_range(250, 500);
-		status = inb_p(SMBHSTSTS(priv));
+		status = ioread8(SMBHSTSTS(priv));
 		busy = status & SMBHSTSTS_HOST_BUSY;
 		status &= STATUS_ERROR_FLAGS | SMBHSTSTS_INTR;
 		if (!busy && status)
@@ -363,7 +363,7 @@ static int i801_wait_byte_done(struct i801_priv *priv)
 
 	do {
 		usleep_range(250, 500);
-		status = inb_p(SMBHSTSTS(priv));
+		status = ioread8(SMBHSTSTS(priv));
 		if (status & (STATUS_ERROR_FLAGS | SMBHSTSTS_BYTE_DONE))
 			return status & STATUS_ERROR_FLAGS;
 	} while (time_is_after_eq_jiffies(timeout));
@@ -373,7 +373,7 @@ static int i801_wait_byte_done(struct i801_priv *priv)
 
 static int i801_get_block_len(struct i801_priv *priv)
 {
-	u8 len = inb_p(SMBHSTDAT0(priv));
+	u8 len = ioread8(SMBHSTDAT0(priv));
 
 	if (len < 1 || len > I2C_SMBUS_BLOCK_MAX) {
 		pci_err(priv->pci_dev, "Illegal SMBus block read size %u\n", len);
@@ -390,9 +390,9 @@ static int i801_check_and_clear_pec_error(struct i801_priv *priv)
 	if (!(priv->features & FEATURE_SMBUS_PEC))
 		return 0;
 
-	status = inb_p(SMBAUXSTS(priv)) & SMBAUXSTS_CRCE;
+	status = ioread8(SMBAUXSTS(priv)) & SMBAUXSTS_CRCE;
 	if (status) {
-		outb_p(status, SMBAUXSTS(priv));
+		iowrite8(status, SMBAUXSTS(priv));
 		return -EBADMSG;
 	}
 
@@ -405,7 +405,7 @@ static int i801_check_pre(struct i801_priv *priv)
 {
 	int status, result;
 
-	status = inb_p(SMBHSTSTS(priv));
+	status = ioread8(SMBHSTSTS(priv));
 	if (status & SMBHSTSTS_HOST_BUSY) {
 		pci_err(priv->pci_dev, "SMBus is busy, can't use it!\n");
 		return -EBUSY;
@@ -414,7 +414,7 @@ static int i801_check_pre(struct i801_priv *priv)
 	status &= STATUS_FLAGS;
 	if (status) {
 		pci_dbg(priv->pci_dev, "Clearing status flags (%02x)\n", status);
-		outb_p(status, SMBHSTSTS(priv));
+		iowrite8(status, SMBHSTSTS(priv));
 	}
 
 	/*
@@ -440,9 +440,9 @@ static int i801_check_post(struct i801_priv *priv, int status)
 	 */
 	if (unlikely(status < 0)) {
 		/* try to stop the current command */
-		outb_p(SMBHSTCNT_KILL, SMBHSTCNT(priv));
+		iowrite8(SMBHSTCNT_KILL, SMBHSTCNT(priv));
 		status = i801_wait_intr(priv);
-		outb_p(0, SMBHSTCNT(priv));
+		iowrite8(0, SMBHSTCNT(priv));
 
 		/* Check if it worked */
 		if (status < 0 || !(status & SMBHSTSTS_FAILED))
@@ -493,13 +493,13 @@ static int i801_transaction(struct i801_priv *priv, int xact)
 
 	if (priv->features & FEATURE_IRQ) {
 		reinit_completion(&priv->done);
-		outb_p(xact | SMBHSTCNT_INTREN | SMBHSTCNT_START,
+		iowrite8(xact | SMBHSTCNT_INTREN | SMBHSTCNT_START,
 		       SMBHSTCNT(priv));
 		result = wait_for_completion_timeout(&priv->done, adap->timeout);
 		return result ? priv->status : -ETIMEDOUT;
 	}
 
-	outb_p(xact | SMBHSTCNT_START, SMBHSTCNT(priv));
+	iowrite8(xact | SMBHSTCNT_START, SMBHSTCNT(priv));
 
 	return i801_wait_intr(priv);
 }
@@ -508,7 +508,7 @@ static int i801_block_transaction_by_block(struct i801_priv *priv,
 					   union i2c_smbus_data *data,
 					   char read_write, int command)
 {
-	int i, len, status, xact;
+	int len, status, xact;
 
 	switch (command) {
 	case I2C_SMBUS_BLOCK_PROC_CALL:
@@ -522,14 +522,13 @@ static int i801_block_transaction_by_block(struct i801_priv *priv,
 	}
 
 	/* Set block buffer mode */
-	outb_p(inb_p(SMBAUXCTL(priv)) | SMBAUXCTL_E32B, SMBAUXCTL(priv));
+	iowrite8(ioread8(SMBAUXCTL(priv)) | SMBAUXCTL_E32B, SMBAUXCTL(priv));
 
 	if (read_write == I2C_SMBUS_WRITE) {
 		len = data->block[0];
-		outb_p(len, SMBHSTDAT0(priv));
-		inb_p(SMBHSTCNT(priv));	/* reset the data buffer index */
-		for (i = 0; i < len; i++)
-			outb_p(data->block[i+1], SMBBLKDAT(priv));
+		iowrite8(len, SMBHSTDAT0(priv));
+		ioread8(SMBHSTCNT(priv));	/* reset the data buffer index */
+		iowrite8_rep(SMBBLKDAT(priv), data->block + 1, len);
 	}
 
 	status = i801_transaction(priv, xact);
@@ -545,12 +544,11 @@ static int i801_block_transaction_by_block(struct i801_priv *priv,
 		}
 
 		data->block[0] = len;
-		inb_p(SMBHSTCNT(priv));	/* reset the data buffer index */
-		for (i = 0; i < len; i++)
-			data->block[i + 1] = inb_p(SMBBLKDAT(priv));
+		ioread8(SMBHSTCNT(priv));	/* reset the data buffer index */
+		ioread8_rep(SMBBLKDAT(priv), data->block + 1, len);
 	}
 out:
-	outb_p(inb_p(SMBAUXCTL(priv)) & ~SMBAUXCTL_E32B, SMBAUXCTL(priv));
+	iowrite8(ioread8(SMBAUXCTL(priv)) & ~SMBAUXCTL_E32B, SMBAUXCTL(priv));
 	return status;
 }
 
@@ -573,17 +571,17 @@ static void i801_isr_byte_done(struct i801_priv *priv)
 
 		/* Read next byte */
 		if (priv->count < priv->len)
-			priv->data[priv->count++] = inb(SMBBLKDAT(priv));
+			priv->data[priv->count++] = ioread8(SMBBLKDAT(priv));
 		else
 			pci_dbg(priv->pci_dev, "Discarding extra byte on block read\n");
 
 		/* Set LAST_BYTE for last byte of read transaction */
 		if (priv->count == priv->len - 1)
-			outb_p(priv->cmd | SMBHSTCNT_LAST_BYTE,
+			iowrite8(priv->cmd | SMBHSTCNT_LAST_BYTE,
 			       SMBHSTCNT(priv));
 	} else if (priv->count < priv->len - 1) {
 		/* Write next byte, except for IRQ after last byte */
-		outb_p(priv->data[++priv->count], SMBBLKDAT(priv));
+		iowrite8(priv->data[++priv->count], SMBBLKDAT(priv));
 	}
 }
 
@@ -591,7 +589,7 @@ static irqreturn_t i801_host_notify_isr(struct i801_priv *priv)
 {
 	unsigned short addr;
 
-	addr = inb_p(SMBNTFDADD(priv)) >> 1;
+	addr = ioread8(SMBNTFDADD(priv)) >> 1;
 
 	/*
 	 * With the tested platforms, reading SMBNTFDDAT (22 + (p)->smba)
@@ -601,7 +599,7 @@ static irqreturn_t i801_host_notify_isr(struct i801_priv *priv)
 	i2c_handle_smbus_host_notify(&priv->adapter, addr);
 
 	/* clear Host Notify bit and return */
-	outb_p(SMBSLVSTS_HST_NTFY_STS, SMBSLVSTS(priv));
+	iowrite8(SMBSLVSTS_HST_NTFY_STS, SMBSLVSTS(priv));
 	return IRQ_HANDLED;
 }
 
@@ -632,12 +630,12 @@ static irqreturn_t i801_isr(int irq, void *dev_id)
 		return IRQ_NONE;
 
 	if (priv->features & FEATURE_HOST_NOTIFY) {
-		status = inb_p(SMBSLVSTS(priv));
+		status = ioread8(SMBSLVSTS(priv));
 		if (status & SMBSLVSTS_HST_NTFY_STS)
 			return i801_host_notify_isr(priv);
 	}
 
-	status = inb_p(SMBHSTSTS(priv));
+	status = ioread8(SMBHSTSTS(priv));
 	if ((status & (SMBHSTSTS_BYTE_DONE | STATUS_ERROR_FLAGS)) == SMBHSTSTS_BYTE_DONE)
 		i801_isr_byte_done(priv);
 
@@ -647,7 +645,7 @@ static irqreturn_t i801_isr(int irq, void *dev_id)
 	 * so clear it always when the status is set.
 	 */
 	status &= STATUS_FLAGS | SMBHSTSTS_SMBALERT_STS;
-	outb_p(status, SMBHSTSTS(priv));
+	iowrite8(status, SMBHSTSTS(priv));
 
 	status &= STATUS_ERROR_FLAGS | SMBHSTSTS_INTR;
 	if (status) {
@@ -679,8 +677,8 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
 	len = data->block[0];
 
 	if (read_write == I2C_SMBUS_WRITE) {
-		outb_p(len, SMBHSTDAT0(priv));
-		outb_p(data->block[1], SMBBLKDAT(priv));
+		iowrite8(len, SMBHSTDAT0(priv));
+		iowrite8(data->block[1], SMBBLKDAT(priv));
 	}
 
 	if (command == I2C_SMBUS_I2C_BLOCK_DATA &&
@@ -699,14 +697,14 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
 		priv->data = &data->block[1];
 
 		reinit_completion(&priv->done);
-		outb_p(priv->cmd | SMBHSTCNT_START, SMBHSTCNT(priv));
+		iowrite8(priv->cmd | SMBHSTCNT_START, SMBHSTCNT(priv));
 		result = wait_for_completion_timeout(&priv->done, adap->timeout);
 		return result ? priv->status : -ETIMEDOUT;
 	}
 
 	if (len == 1 && read_write == I2C_SMBUS_READ)
 		smbcmd |= SMBHSTCNT_LAST_BYTE;
-	outb_p(smbcmd | SMBHSTCNT_START, SMBHSTCNT(priv));
+	iowrite8(smbcmd | SMBHSTCNT_START, SMBHSTCNT(priv));
 
 	for (i = 1; i <= len; i++) {
 		status = i801_wait_byte_done(priv);
@@ -722,27 +720,27 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
 			len = i801_get_block_len(priv);
 			if (len < 0) {
 				/* Recover */
-				while (inb_p(SMBHSTSTS(priv)) &
+				while (ioread8(SMBHSTSTS(priv)) &
 				       SMBHSTSTS_HOST_BUSY)
-					outb_p(SMBHSTSTS_BYTE_DONE,
+					iowrite8(SMBHSTSTS_BYTE_DONE,
 					       SMBHSTSTS(priv));
-				outb_p(SMBHSTSTS_INTR, SMBHSTSTS(priv));
+				iowrite8(SMBHSTSTS_INTR, SMBHSTSTS(priv));
 				return -EPROTO;
 			}
 			data->block[0] = len;
 		}
 
 		if (read_write == I2C_SMBUS_READ) {
-			data->block[i] = inb_p(SMBBLKDAT(priv));
+			data->block[i] = ioread8(SMBBLKDAT(priv));
 			if (i == len - 1)
-				outb_p(smbcmd | SMBHSTCNT_LAST_BYTE, SMBHSTCNT(priv));
+				iowrite8(smbcmd | SMBHSTCNT_LAST_BYTE, SMBHSTCNT(priv));
 		}
 
 		if (read_write == I2C_SMBUS_WRITE && i+1 <= len)
-			outb_p(data->block[i+1], SMBBLKDAT(priv));
+			iowrite8(data->block[i+1], SMBBLKDAT(priv));
 
 		/* signals SMBBLKDAT ready */
-		outb_p(SMBHSTSTS_BYTE_DONE, SMBHSTSTS(priv));
+		iowrite8(SMBHSTSTS_BYTE_DONE, SMBHSTSTS(priv));
 	}
 
 	return i801_wait_intr(priv);
@@ -750,7 +748,7 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
 
 static void i801_set_hstadd(struct i801_priv *priv, u8 addr, char read_write)
 {
-	outb_p((addr << 1) | (read_write & 0x01), SMBHSTADD(priv));
+	iowrite8((addr << 1) | (read_write & 0x01), SMBHSTADD(priv));
 }
 
 /* Single value transaction function */
@@ -767,30 +765,30 @@ static int i801_simple_transaction(struct i801_priv *priv, union i2c_smbus_data
 	case I2C_SMBUS_BYTE:
 		i801_set_hstadd(priv, addr, read_write);
 		if (read_write == I2C_SMBUS_WRITE)
-			outb_p(hstcmd, SMBHSTCMD(priv));
+			iowrite8(hstcmd, SMBHSTCMD(priv));
 		xact = I801_BYTE;
 		break;
 	case I2C_SMBUS_BYTE_DATA:
 		i801_set_hstadd(priv, addr, read_write);
 		if (read_write == I2C_SMBUS_WRITE)
-			outb_p(data->byte, SMBHSTDAT0(priv));
-		outb_p(hstcmd, SMBHSTCMD(priv));
+			iowrite8(data->byte, SMBHSTDAT0(priv));
+		iowrite8(hstcmd, SMBHSTCMD(priv));
 		xact = I801_BYTE_DATA;
 		break;
 	case I2C_SMBUS_WORD_DATA:
 		i801_set_hstadd(priv, addr, read_write);
 		if (read_write == I2C_SMBUS_WRITE) {
-			outb_p(data->word & 0xff, SMBHSTDAT0(priv));
-			outb_p((data->word & 0xff00) >> 8, SMBHSTDAT1(priv));
+			iowrite8(data->word & 0xff, SMBHSTDAT0(priv));
+			iowrite8((data->word & 0xff00) >> 8, SMBHSTDAT1(priv));
 		}
-		outb_p(hstcmd, SMBHSTCMD(priv));
+		iowrite8(hstcmd, SMBHSTCMD(priv));
 		xact = I801_WORD_DATA;
 		break;
 	case I2C_SMBUS_PROC_CALL:
 		i801_set_hstadd(priv, addr, I2C_SMBUS_WRITE);
-		outb_p(data->word & 0xff, SMBHSTDAT0(priv));
-		outb_p((data->word & 0xff00) >> 8, SMBHSTDAT1(priv));
-		outb_p(hstcmd, SMBHSTCMD(priv));
+		iowrite8(data->word & 0xff, SMBHSTDAT0(priv));
+		iowrite8((data->word & 0xff00) >> 8, SMBHSTDAT1(priv));
+		iowrite8(hstcmd, SMBHSTCMD(priv));
 		read_write = I2C_SMBUS_READ;
 		xact = I801_PROC_CALL;
 		break;
@@ -806,12 +804,12 @@ static int i801_simple_transaction(struct i801_priv *priv, union i2c_smbus_data
 	switch (command) {
 	case I2C_SMBUS_BYTE:
 	case I2C_SMBUS_BYTE_DATA:
-		data->byte = inb_p(SMBHSTDAT0(priv));
+		data->byte = ioread8(SMBHSTDAT0(priv));
 		break;
 	case I2C_SMBUS_WORD_DATA:
 	case I2C_SMBUS_PROC_CALL:
-		data->word = inb_p(SMBHSTDAT0(priv)) +
-			     (inb_p(SMBHSTDAT1(priv)) << 8);
+		data->word = ioread8(SMBHSTDAT0(priv)) +
+			     (ioread8(SMBHSTDAT1(priv)) << 8);
 		break;
 	}
 
@@ -832,7 +830,7 @@ static int i801_smbus_block_transaction(struct i801_priv *priv, union i2c_smbus_
 		i801_set_hstadd(priv, addr, I2C_SMBUS_WRITE);
 	else
 		i801_set_hstadd(priv, addr, read_write);
-	outb_p(hstcmd, SMBHSTCMD(priv));
+	iowrite8(hstcmd, SMBHSTCMD(priv));
 
 	if (priv->features & FEATURE_BLOCK_BUFFER)
 		return i801_block_transaction_by_block(priv, data, read_write, command);
@@ -858,9 +856,9 @@ static int i801_i2c_block_transaction(struct i801_priv *priv, union i2c_smbus_da
 
 	/* NB: page 240 of ICH5 datasheet shows that DATA1 is the cmd field when reading */
 	if (read_write == I2C_SMBUS_READ)
-		outb_p(hstcmd, SMBHSTDAT1(priv));
+		iowrite8(hstcmd, SMBHSTDAT1(priv));
 	else
-		outb_p(hstcmd, SMBHSTCMD(priv));
+		iowrite8(hstcmd, SMBHSTCMD(priv));
 
 	if (read_write == I2C_SMBUS_WRITE) {
 		/* set I2C_EN bit in configuration register */
@@ -903,9 +901,9 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 		&& size != I2C_SMBUS_I2C_BLOCK_DATA;
 
 	if (hwpec)	/* enable/disable hardware PEC */
-		outb_p(inb_p(SMBAUXCTL(priv)) | SMBAUXCTL_CRC, SMBAUXCTL(priv));
+		iowrite8(ioread8(SMBAUXCTL(priv)) | SMBAUXCTL_CRC, SMBAUXCTL(priv));
 	else
-		outb_p(inb_p(SMBAUXCTL(priv)) & (~SMBAUXCTL_CRC),
+		iowrite8(ioread8(SMBAUXCTL(priv)) & (~SMBAUXCTL_CRC),
 		       SMBAUXCTL(priv));
 
 	if (size == I2C_SMBUS_BLOCK_DATA || size == I2C_SMBUS_BLOCK_PROC_CALL)
@@ -921,13 +919,13 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 	 * time, so we forcibly disable it after every transaction.
 	 */
 	if (hwpec)
-		outb_p(inb_p(SMBAUXCTL(priv)) & ~SMBAUXCTL_CRC, SMBAUXCTL(priv));
+		iowrite8(ioread8(SMBAUXCTL(priv)) & ~SMBAUXCTL_CRC, SMBAUXCTL(priv));
 out:
 	/*
 	 * Unlock the SMBus device for use by BIOS/ACPI,
 	 * and clear status flags if not done already.
 	 */
-	outb_p(SMBHSTSTS_INUSE_STS | STATUS_FLAGS, SMBHSTSTS(priv));
+	iowrite8(SMBHSTSTS_INUSE_STS | STATUS_FLAGS, SMBHSTSTS(priv));
 
 	pm_runtime_mark_last_busy(&priv->pci_dev->dev);
 	pm_runtime_put_autosuspend(&priv->pci_dev->dev);
@@ -964,11 +962,11 @@ static void i801_enable_host_notify(struct i2c_adapter *adapter)
 	 * from the SMB_ALERT signal because the driver does not support
 	 * SMBus Alert.
 	 */
-	outb_p(SMBSLVCMD_HST_NTFY_INTREN | SMBSLVCMD_SMBALERT_DISABLE |
+	iowrite8(SMBSLVCMD_HST_NTFY_INTREN | SMBSLVCMD_SMBALERT_DISABLE |
 	       priv->original_slvcmd, SMBSLVCMD(priv));
 
 	/* clear Host Notify bit to allow a new notification */
-	outb_p(SMBSLVSTS_HST_NTFY_STS, SMBSLVSTS(priv));
+	iowrite8(SMBSLVSTS_HST_NTFY_STS, SMBSLVSTS(priv));
 }
 
 static void i801_disable_host_notify(struct i801_priv *priv)
@@ -976,7 +974,7 @@ static void i801_disable_host_notify(struct i801_priv *priv)
 	if (!(priv->features & FEATURE_HOST_NOTIFY))
 		return;
 
-	outb_p(priv->original_slvcmd, SMBSLVCMD(priv));
+	iowrite8(priv->original_slvcmd, SMBSLVCMD(priv));
 }
 
 static const struct i2c_algorithm smbus_algorithm = {
@@ -1441,7 +1439,7 @@ static void i801_add_tco(struct i801_priv *priv)
 static bool i801_acpi_is_smbus_ioport(const struct i801_priv *priv,
 				      acpi_physical_address address)
 {
-	return address >= priv->smba &&
+	return address >= pci_resource_start(priv->pci_dev, SMBBAR) &&
 	       address <= pci_resource_end(priv->pci_dev, SMBBAR);
 }
 
@@ -1518,7 +1516,7 @@ static void i801_setup_hstcfg(struct i801_priv *priv)
 
 static void i801_restore_regs(struct i801_priv *priv)
 {
-	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
+	iowrite8(priv->original_hstcnt, SMBHSTCNT(priv));
 	pci_write_config_byte(priv->pci_dev, SMBHSTCFG, priv->original_hstcfg);
 }
 
@@ -1564,8 +1562,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	}
 
 	/* Determine the address of the SMBus area */
-	priv->smba = pci_resource_start(dev, SMBBAR);
-	if (!priv->smba) {
+	if (!pci_resource_start(dev, SMBBAR)) {
 		pci_err(dev, "SMBus base address uninitialized, upgrade BIOS\n");
 		return -ENODEV;
 	}
@@ -1573,12 +1570,12 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	if (i801_acpi_probe(priv))
 		return -ENODEV;
 
-	err = pcim_iomap_regions(dev, 1 << SMBBAR, DRV_NAME);
-	if (err) {
+	priv->smba = pcim_iomap_region(dev, SMBBAR, DRV_NAME);
+	if (IS_ERR(priv->smba)) {
 		pci_err(dev, "Failed to request SMBus region %pr\n",
 			pci_resource_n(dev, SMBBAR));
 		i801_acpi_remove(priv);
-		return err;
+		return PTR_ERR(priv->smba);
 	}
 
 	pci_read_config_byte(dev, SMBHSTCFG, &priv->original_hstcfg);
@@ -1596,7 +1593,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	/* Clear special mode bits */
 	if (priv->features & (FEATURE_SMBUS_PEC | FEATURE_BLOCK_BUFFER))
-		outb_p(inb_p(SMBAUXCTL(priv)) &
+		iowrite8(ioread8(SMBAUXCTL(priv)) &
 		       ~(SMBAUXCTL_CRC | SMBAUXCTL_E32B), SMBAUXCTL(priv));
 
 	/* Default timeout in interrupt mode: 200 ms */
@@ -1632,9 +1629,9 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		priv->features &= ~FEATURE_HOST_NOTIFY;
 
 	/* Remember original Interrupt and Host Notify settings */
-	priv->original_hstcnt = inb_p(SMBHSTCNT(priv)) & ~SMBHSTCNT_KILL;
+	priv->original_hstcnt = ioread8(SMBHSTCNT(priv)) & ~SMBHSTCNT_KILL;
 	if (priv->features & FEATURE_HOST_NOTIFY)
-		priv->original_slvcmd = inb_p(SMBSLVCMD(priv));
+		priv->original_slvcmd = ioread8(SMBSLVCMD(priv));
 
 	i801_add_tco(priv);
 
@@ -1643,9 +1640,9 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	 * to instantiante i2c_clients, do not change.
 	 */
 	snprintf(priv->adapter.name, sizeof(priv->adapter.name),
-		 "SMBus %s adapter at %04lx",
+		 "SMBus %s adapter at %s",
 		 (priv->features & FEATURE_IDF) ? "I801 IDF" : "I801",
-		 priv->smba);
+		 pci_name(dev));
 
 	err = i2c_add_adapter(&priv->adapter);
 	if (err) {
-- 
2.48.1



