Return-Path: <linux-i2c+bounces-7243-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B5D993879
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Oct 2024 22:44:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D51F1C239B1
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Oct 2024 20:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAC541DE4E9;
	Mon,  7 Oct 2024 20:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g22QbPV3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DEA81727
	for <linux-i2c@vger.kernel.org>; Mon,  7 Oct 2024 20:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728333876; cv=none; b=GOy98s5AZ5+f78HWR1x8kmzYrL6sOlewv0DU1xzSo3VTuCe0sXEWPqAaGXLadJGCx7T27DVjv9zahKo077TlnRT+e+nFGexIB3h5rE4+AuHxw9xRDh6Ao4CyGbjmf7ZqtQWhChXQR2I6tuIwliOXsn7fuzefLgTtJEMP6jSmrro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728333876; c=relaxed/simple;
	bh=rxHL/GSi1Slyb63/jsDjVM/mi7sUWM6QjPgR11NbX60=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Oc4KIFMqh9jOQtSXy49WSGTuzPO5A7WsoITvPMFb58nOW07+Zvw+5CAQ1RbQw0bg7VwW5uBUhVUtY9FnUSzaD5oFuHQ2CmalY/aYD9fwZEgQAuwelcrkfb2KeMqI6H3UfIn5z/TUrGzHQ9gN2aXdn+LbBdK72dReAyRfWzlSEmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g22QbPV3; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5c42f406e29so6520073a12.2
        for <linux-i2c@vger.kernel.org>; Mon, 07 Oct 2024 13:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728333873; x=1728938673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=3zLB0e6xuD8xqifL7PBE1zqB9Ybu7y5VLmKUW2TkKv0=;
        b=g22QbPV3LI0WveIyhDxGe6AaPrrB19+o9O7j2efUDwCbWvc2ZF+8B41QN997UcesEn
         JIwJ2YQHjmfXyNiBRc64zPWnDi7atFysMHO+EAy2jCNLHurPcSRq/MYD+4COUozQqC9R
         9diQEYFWlUC5jg1jSxzhBnbQA12SPNK5y27Vxm0cjWoAiFjf2y8jVSq/trW2Rucy5+qH
         M9ztoy8aZquVTTFQwwTaTOGMy3VINnXucUd6UNC9Uvna91o3UPxXomSbHyYiQ+L/5M2X
         g/SLB7aRRiOJMj8I4f8VHwo8CPDEH7pCESyuvJUJxV4YgxjDhYff37MS5sgrbTq73ckg
         SEFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728333873; x=1728938673;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3zLB0e6xuD8xqifL7PBE1zqB9Ybu7y5VLmKUW2TkKv0=;
        b=kujiDs2O0lMrWebt8/8awdVNVN3SSAMXGFAJnwxJxaDddREuCZ55tDCCQTnoz4cjVa
         WUqUmxE7e053+veWe52nDm+uC6Ih3EvLKZMr8VBX3s6W6SHyCbgkrhvgAeJG/Cu2g4ii
         2ffXLn7TUs5Q9U1jKwweyJ98LvBOI4v5D3p+qzVGPQrQJhZlsUPdDV+7mAOLFR5nsH7e
         chof57+pQwoRQLipUo0anM8aFUHKreo8j2tIfYM87hnE2q9tziF88jW4ub/gJkYokNbw
         FYvVU/3zypxbQNXfJ4xmMhvyt0vBjlx1G7/IANLi+L0I686/AgtLYNJaAN+cPkts76cx
         uH/g==
X-Gm-Message-State: AOJu0YwqL4/wjBon05FP/dQAsFGRwZcDMqFLtTBPQ/1NBeA8a7yD4VU9
	1PUlllqTf05CauJN/+v+Sw+1VClScfc+Y9kd92L+3GKlGSsDOmrDmPUfug==
X-Google-Smtp-Source: AGHT+IHm0LXTIaxudycLhWlJkZkdFbZ0d0JjXT9WyKfadNeZ0E24Ci4ipBSZVo12pKDQ4V68K8FHWA==
X-Received: by 2002:a17:907:96aa:b0:a99:497f:317 with SMTP id a640c23a62f3a-a99497f0634mr756077866b.62.1728333872157;
        Mon, 07 Oct 2024 13:44:32 -0700 (PDT)
Received: from ?IPV6:2a02:3100:a12d:4f00:a884:c611:9e1:3345? (dynamic-2a02-3100-a12d-4f00-a884-c611-09e1-3345.310.pool.telefonica.de. [2a02:3100:a12d:4f00:a884:c611:9e1:3345])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a9940f613c2sm333201166b.4.2024.10.07.13.44.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Oct 2024 13:44:31 -0700 (PDT)
Message-ID: <9b9e27b7-67f9-4343-8a61-3ff40e56b245@gmail.com>
Date: Mon, 7 Oct 2024 22:44:31 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/3] i2c: i801: Switch to iomapped register access
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <10d7eca3-0a2d-4db4-8498-e5b28bbf9261@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <10d7eca3-0a2d-4db4-8498-e5b28bbf9261@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Switch to iomapped rgeister access as a prerequisite for adding
support for MMIO register access.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 147 +++++++++++++++++-----------------
 1 file changed, 73 insertions(+), 74 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 2a2a0e3e7..4e1b1c825 100644
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
@@ -339,7 +339,7 @@ MODULE_PARM_DESC(disable_features, "Disable selected driver features:\n"
 
 static int i801_get_block_len(struct i801_priv *priv)
 {
-	u8 len = inb_p(SMBHSTDAT0(priv));
+	u8 len = ioread8(SMBHSTDAT0(priv));
 
 	if (len < 1 || len > I2C_SMBUS_BLOCK_MAX) {
 		pci_err(priv->pci_dev, "Illegal SMBus block read size %u\n", len);
@@ -356,9 +356,9 @@ static int i801_check_and_clear_pec_error(struct i801_priv *priv)
 	if (!(priv->features & FEATURE_SMBUS_PEC))
 		return 0;
 
-	status = inb_p(SMBAUXSTS(priv)) & SMBAUXSTS_CRCE;
+	status = ioread8(SMBAUXSTS(priv)) & SMBAUXSTS_CRCE;
 	if (status) {
-		outb_p(status, SMBAUXSTS(priv));
+		iowrite8(status, SMBAUXSTS(priv));
 		return -EBADMSG;
 	}
 
@@ -371,7 +371,7 @@ static int i801_check_pre(struct i801_priv *priv)
 {
 	int status, result;
 
-	status = inb_p(SMBHSTSTS(priv));
+	status = ioread8(SMBHSTSTS(priv));
 	if (status & SMBHSTSTS_HOST_BUSY) {
 		pci_err(priv->pci_dev, "SMBus is busy, can't use it!\n");
 		return -EBUSY;
@@ -380,7 +380,7 @@ static int i801_check_pre(struct i801_priv *priv)
 	status &= STATUS_FLAGS;
 	if (status) {
 		pci_dbg(priv->pci_dev, "Clearing status flags (%02x)\n", status);
-		outb_p(status, SMBHSTSTS(priv));
+		iowrite8(status, SMBHSTSTS(priv));
 	}
 
 	/*
@@ -406,12 +406,12 @@ static int i801_check_post(struct i801_priv *priv, int status)
 	 */
 	if (unlikely(status < 0)) {
 		/* try to stop the current command */
-		outb_p(SMBHSTCNT_KILL, SMBHSTCNT(priv));
+		iowrite8(SMBHSTCNT_KILL, SMBHSTCNT(priv));
 		usleep_range(1000, 2000);
-		outb_p(0, SMBHSTCNT(priv));
+		iowrite8(0, SMBHSTCNT(priv));
 
 		/* Check if it worked */
-		status = inb_p(SMBHSTSTS(priv));
+		status = ioread8(SMBHSTSTS(priv));
 		if ((status & SMBHSTSTS_HOST_BUSY) || !(status & SMBHSTSTS_FAILED))
 			pci_dbg(priv->pci_dev, "Failed terminating the transaction\n");
 		return -ETIMEDOUT;
@@ -461,7 +461,7 @@ static int i801_wait_intr(struct i801_priv *priv)
 
 	do {
 		usleep_range(250, 500);
-		status = inb_p(SMBHSTSTS(priv));
+		status = ioread8(SMBHSTSTS(priv));
 		busy = status & SMBHSTSTS_HOST_BUSY;
 		status &= STATUS_ERROR_FLAGS | SMBHSTSTS_INTR;
 		if (!busy && status)
@@ -479,7 +479,7 @@ static int i801_wait_byte_done(struct i801_priv *priv)
 
 	do {
 		usleep_range(250, 500);
-		status = inb_p(SMBHSTSTS(priv));
+		status = ioread8(SMBHSTSTS(priv));
 		if (status & (STATUS_ERROR_FLAGS | SMBHSTSTS_BYTE_DONE))
 			return status & STATUS_ERROR_FLAGS;
 	} while (time_is_after_eq_jiffies(timeout));
@@ -494,13 +494,13 @@ static int i801_transaction(struct i801_priv *priv, int xact)
 
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
@@ -509,7 +509,7 @@ static int i801_block_transaction_by_block(struct i801_priv *priv,
 					   union i2c_smbus_data *data,
 					   char read_write, int command)
 {
-	int i, len, status, xact;
+	int len, status, xact;
 
 	switch (command) {
 	case I2C_SMBUS_BLOCK_PROC_CALL:
@@ -523,14 +523,13 @@ static int i801_block_transaction_by_block(struct i801_priv *priv,
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
@@ -546,12 +545,11 @@ static int i801_block_transaction_by_block(struct i801_priv *priv,
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
 
@@ -574,17 +572,17 @@ static void i801_isr_byte_done(struct i801_priv *priv)
 
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
 
@@ -592,7 +590,7 @@ static irqreturn_t i801_host_notify_isr(struct i801_priv *priv)
 {
 	unsigned short addr;
 
-	addr = inb_p(SMBNTFDADD(priv)) >> 1;
+	addr = ioread8(SMBNTFDADD(priv)) >> 1;
 
 	/*
 	 * With the tested platforms, reading SMBNTFDDAT (22 + (p)->smba)
@@ -602,7 +600,7 @@ static irqreturn_t i801_host_notify_isr(struct i801_priv *priv)
 	i2c_handle_smbus_host_notify(&priv->adapter, addr);
 
 	/* clear Host Notify bit and return */
-	outb_p(SMBSLVSTS_HST_NTFY_STS, SMBSLVSTS(priv));
+	iowrite8(SMBSLVSTS_HST_NTFY_STS, SMBSLVSTS(priv));
 	return IRQ_HANDLED;
 }
 
@@ -633,12 +631,12 @@ static irqreturn_t i801_isr(int irq, void *dev_id)
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
 
@@ -648,7 +646,7 @@ static irqreturn_t i801_isr(int irq, void *dev_id)
 	 * so clear it always when the status is set.
 	 */
 	status &= STATUS_FLAGS | SMBHSTSTS_SMBALERT_STS;
-	outb_p(status, SMBHSTSTS(priv));
+	iowrite8(status, SMBHSTSTS(priv));
 
 	status &= STATUS_ERROR_FLAGS | SMBHSTSTS_INTR;
 	if (status) {
@@ -680,8 +678,8 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
 	len = data->block[0];
 
 	if (read_write == I2C_SMBUS_WRITE) {
-		outb_p(len, SMBHSTDAT0(priv));
-		outb_p(data->block[1], SMBBLKDAT(priv));
+		iowrite8(len, SMBHSTDAT0(priv));
+		iowrite8(data->block[1], SMBBLKDAT(priv));
 	}
 
 	if (command == I2C_SMBUS_I2C_BLOCK_DATA &&
@@ -700,14 +698,14 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
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
@@ -723,27 +721,27 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
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
@@ -751,7 +749,7 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
 
 static void i801_set_hstadd(struct i801_priv *priv, u8 addr, char read_write)
 {
-	outb_p((addr << 1) | (read_write & 0x01), SMBHSTADD(priv));
+	iowrite8((addr << 1) | (read_write & 0x01), SMBHSTADD(priv));
 }
 
 /* Single value transaction function */
@@ -768,30 +766,30 @@ static int i801_simple_transaction(struct i801_priv *priv, union i2c_smbus_data
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
@@ -807,12 +805,12 @@ static int i801_simple_transaction(struct i801_priv *priv, union i2c_smbus_data
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
 
@@ -833,7 +831,7 @@ static int i801_smbus_block_transaction(struct i801_priv *priv, union i2c_smbus_
 		i801_set_hstadd(priv, addr, I2C_SMBUS_WRITE);
 	else
 		i801_set_hstadd(priv, addr, read_write);
-	outb_p(hstcmd, SMBHSTCMD(priv));
+	iowrite8(hstcmd, SMBHSTCMD(priv));
 
 	if (priv->features & FEATURE_BLOCK_BUFFER)
 		return i801_block_transaction_by_block(priv, data, read_write, command);
@@ -859,9 +857,9 @@ static int i801_i2c_block_transaction(struct i801_priv *priv, union i2c_smbus_da
 
 	/* NB: page 240 of ICH5 datasheet shows that DATA1 is the cmd field when reading */
 	if (read_write == I2C_SMBUS_READ)
-		outb_p(hstcmd, SMBHSTDAT1(priv));
+		iowrite8(hstcmd, SMBHSTDAT1(priv));
 	else
-		outb_p(hstcmd, SMBHSTCMD(priv));
+		iowrite8(hstcmd, SMBHSTCMD(priv));
 
 	if (read_write == I2C_SMBUS_WRITE) {
 		/* set I2C_EN bit in configuration register */
@@ -904,9 +902,9 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 		&& size != I2C_SMBUS_I2C_BLOCK_DATA;
 
 	if (hwpec)	/* enable/disable hardware PEC */
-		outb_p(inb_p(SMBAUXCTL(priv)) | SMBAUXCTL_CRC, SMBAUXCTL(priv));
+		iowrite8(ioread8(SMBAUXCTL(priv)) | SMBAUXCTL_CRC, SMBAUXCTL(priv));
 	else
-		outb_p(inb_p(SMBAUXCTL(priv)) & (~SMBAUXCTL_CRC),
+		iowrite8(ioread8(SMBAUXCTL(priv)) & (~SMBAUXCTL_CRC),
 		       SMBAUXCTL(priv));
 
 	if (size == I2C_SMBUS_BLOCK_DATA || size == I2C_SMBUS_BLOCK_PROC_CALL)
@@ -922,13 +920,13 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
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
@@ -965,11 +963,11 @@ static void i801_enable_host_notify(struct i2c_adapter *adapter)
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
@@ -977,7 +975,7 @@ static void i801_disable_host_notify(struct i801_priv *priv)
 	if (!(priv->features & FEATURE_HOST_NOTIFY))
 		return;
 
-	outb_p(priv->original_slvcmd, SMBSLVCMD(priv));
+	iowrite8(priv->original_slvcmd, SMBSLVCMD(priv));
 }
 
 static const struct i2c_algorithm smbus_algorithm = {
@@ -1566,7 +1564,7 @@ static void i801_add_tco(struct i801_priv *priv)
 static bool i801_acpi_is_smbus_ioport(const struct i801_priv *priv,
 				      acpi_physical_address address)
 {
-	return address >= priv->smba &&
+	return address >= pci_resource_start(priv->pci_dev, SMBBAR) &&
 	       address <= pci_resource_end(priv->pci_dev, SMBBAR);
 }
 
@@ -1643,7 +1641,7 @@ static void i801_setup_hstcfg(struct i801_priv *priv)
 
 static void i801_restore_regs(struct i801_priv *priv)
 {
-	outb_p(priv->original_hstcnt, SMBHSTCNT(priv));
+	iowrite8(priv->original_hstcnt, SMBHSTCNT(priv));
 	pci_write_config_byte(priv->pci_dev, SMBHSTCFG, priv->original_hstcfg);
 }
 
@@ -1686,8 +1684,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	pcim_pin_device(dev);
 
 	/* Determine the address of the SMBus area */
-	priv->smba = pci_resource_start(dev, SMBBAR);
-	if (!priv->smba) {
+	if (!pci_resource_start(dev, SMBBAR)) {
 		pci_err(dev, "SMBus base address uninitialized, upgrade BIOS\n");
 		return -ENODEV;
 	}
@@ -1703,6 +1700,8 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		return err;
 	}
 
+	priv->smba = pcim_iomap_table(dev)[SMBBAR];
+
 	pci_read_config_byte(dev, SMBHSTCFG, &priv->original_hstcfg);
 	i801_setup_hstcfg(priv);
 	if (!(priv->original_hstcfg & SMBHSTCFG_HST_EN))
@@ -1718,7 +1717,7 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 
 	/* Clear special mode bits */
 	if (priv->features & (FEATURE_SMBUS_PEC | FEATURE_BLOCK_BUFFER))
-		outb_p(inb_p(SMBAUXCTL(priv)) &
+		iowrite8(ioread8(SMBAUXCTL(priv)) &
 		       ~(SMBAUXCTL_CRC | SMBAUXCTL_E32B), SMBAUXCTL(priv));
 
 	/* Default timeout in interrupt mode: 200 ms */
@@ -1754,9 +1753,9 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
 		priv->features &= ~FEATURE_HOST_NOTIFY;
 
 	/* Remember original Interrupt and Host Notify settings */
-	priv->original_hstcnt = inb_p(SMBHSTCNT(priv)) & ~SMBHSTCNT_KILL;
+	priv->original_hstcnt = ioread8(SMBHSTCNT(priv)) & ~SMBHSTCNT_KILL;
 	if (priv->features & FEATURE_HOST_NOTIFY)
-		priv->original_slvcmd = inb_p(SMBSLVCMD(priv));
+		priv->original_slvcmd = ioread8(SMBSLVCMD(priv));
 
 	i801_add_tco(priv);
 
@@ -1765,9 +1764,9 @@ static int i801_probe(struct pci_dev *dev, const struct pci_device_id *id)
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
2.46.2



