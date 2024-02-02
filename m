Return-Path: <linux-i2c+bounces-1612-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 591CB8468ED
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Feb 2024 08:04:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C28CE1F24C3D
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Feb 2024 07:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA22517597;
	Fri,  2 Feb 2024 07:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P3gwwH/9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D214171DC
	for <linux-i2c@vger.kernel.org>; Fri,  2 Feb 2024 07:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706857448; cv=none; b=fm9CdiHfyNyBx60imTMS5FSgg4WlTaW5uZd9fy6zj2bzYm9e3tTQcWwVb/dsucv2XGOOVmeZ5K8n1yNaxPaHQfkvSR2dTPrHKbKIy4UmQUuYobhBfaJk3sq0+DI1DK8fyeKY9tKxr0XwR9jLZK5x256YER0RNz7AG14R8WNDmVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706857448; c=relaxed/simple;
	bh=B6Qu0TCnqA4qwCcbjIirDQcSbwjV75MQrchziOJUKPg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LSiFMQzUX4ugI9uUH9EzrdTbVAClgUQ7tw/MD2/9JFWUVegq/YKVtABquX1uJYA1S5y87gHtOh0vMJKRTTm1h/XOtq+Kb+KvI07XywG2yR+7hfTHJm6fhajRoxDvcS5JPd8fbfSANv2Bar0nmt7+DbcOZWElwzxiEq2/IrdZyHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P3gwwH/9; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a35e65df2d8so234039866b.0
        for <linux-i2c@vger.kernel.org>; Thu, 01 Feb 2024 23:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706857444; x=1707462244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=V/D3Ff0Cu4iOaNHj5XI9RwoCc3FRzrRWDfHTEUSNZvg=;
        b=P3gwwH/9VwapTqp76yL5vB8scXNb2UN3Z81F2p581Q1XETR6+nNHJbkHagnAccHn5E
         BNIHkuG/Q1XDeni5Wc7chV3EeE0wxZwcEXgo23RMH73RAbAM0ZFqyJJqJRxYzGNvkdnF
         Dex7l8SRp8+ab01xRbT5DETvT4hnw4xIkSmwSOGSb7iPrnBM2LMtfGVg818QYKw9FL7j
         HjwNtdW2071opqfunfNlgkN+iSdnei7gfOhx0BwlOzKvsP09SLl+dkyz29zAVhDf1d02
         fTZSbRJLTt46PbWru0+VRMzz5BJtWLRUUoZiRC7LG8/wigykiXgfYYcEK6TsSt7Kj8JO
         4rBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706857444; x=1707462244;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V/D3Ff0Cu4iOaNHj5XI9RwoCc3FRzrRWDfHTEUSNZvg=;
        b=KjibktsEVJLsRrRuaDiJpyBnW5D2jdtUIIXkBqGaHJF+XShHwbjTovsGVR57H47Y/f
         rmuaGyz+bhmQGmdqjShYsDN7929TkS3ZZsU6GqW+1HoHjKLJgzOlV2q/l8xYgW3/LOtQ
         Fv24E80tYs1YeqlTByztinHwxX1TYdNfgPvc84ah4tzianFSaHVN5I5TM3yq5QdFxiLp
         i0ffgDF7wfbQaGP5j0aF2Y8+CQ4HhthHR+pcz3klAMniFu/bSVtmA0rFWVnfIvcYLN3c
         mC1gaq/ylwEPC/cYwkvY3Z7mRmOeZ5rHHRvKdba+2DsB8KUWJgJFViZAx7FdSPyrqqxM
         70bg==
X-Gm-Message-State: AOJu0YzLcwsguvgoGcGjUH/+13ZeVjWA7Irc21M11pCJAP0xYZT2okM8
	s+slugJ+euLuzyvykG8m5cZPmq3pUOsAmN02WdPBDKJw9ZsKhwai
X-Google-Smtp-Source: AGHT+IEFYChIaVd0Iqy02qiDFBgVl8K6McznvmbVRzshmE/+HjzlAoW9fo++DUgLAIGDbGJMcGIjrg==
X-Received: by 2002:a17:907:b9d4:b0:a2b:a7e:3496 with SMTP id xa20-20020a170907b9d400b00a2b0a7e3496mr843966ejc.28.1706857444122;
        Thu, 01 Feb 2024 23:04:04 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUmBLY2hFJ++zC6eh9tFbrlGcFGaSEN0wdB/5brlhXCpAmie9wvrFO0tMESz2+4OyhJ2MmjWowvAiu7ZJgJb6MI9DptJqfhcUi9va+JaYWBVrMl5InMl/YiOkr19TRxfH/U4CRskyUtOA==
Received: from ?IPV6:2a01:c22:7392:d000:5c1a:bcfc:a8a4:5bea? (dynamic-2a01-0c22-7392-d000-5c1a-bcfc-a8a4-5bea.c22.pool.telefonica.de. [2a01:c22:7392:d000:5c1a:bcfc:a8a4:5bea])
        by smtp.googlemail.com with ESMTPSA id c3-20020a170906340300b00a35a659cab5sm563728ejb.179.2024.02.01.23.04.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 23:04:03 -0800 (PST)
Message-ID: <0af53713-4b30-458e-9970-260a38871506@gmail.com>
Date: Fri, 2 Feb 2024 08:04:06 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 4/5] i2c: i801: Add SMBUS_LEN_SENTINEL
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <4e4ec801-474c-472f-b90d-edd1efd68d24@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <4e4ec801-474c-472f-b90d-edd1efd68d24@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add a sentinel length value that is used to check whether we should
read and use the length value provided by the slave device.
This simplifies the currently used checks.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
  - add comments
v3:
 - fix comment style
---
 drivers/i2c/busses/i2c-i801.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 24eb187db..15d251288 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -205,6 +205,8 @@
 #define STATUS_FLAGS		(SMBHSTSTS_BYTE_DONE | SMBHSTSTS_INTR | \
 				 STATUS_ERROR_FLAGS)
 
+#define SMBUS_LEN_SENTINEL (I2C_SMBUS_BLOCK_MAX + 1)
+
 /* Older devices have their ID defined in <linux/pci_ids.h> */
 #define PCI_DEVICE_ID_INTEL_COMETLAKE_SMBUS		0x02a3
 #define PCI_DEVICE_ID_INTEL_COMETLAKE_H_SMBUS		0x06a3
@@ -541,9 +543,12 @@ static int i801_block_transaction_by_block(struct i801_priv *priv,
 static void i801_isr_byte_done(struct i801_priv *priv)
 {
 	if (priv->is_read) {
-		/* For SMBus block reads, length is received with first byte */
-		if (((priv->cmd & 0x1c) == I801_BLOCK_DATA) &&
-		    (priv->count == 0)) {
+		/*
+		 * At transfer start i801_smbus_block_transaction() marks
+		 * the block length as invalid. Check for this sentinel value
+		 * and read the block length from SMBHSTDAT0.
+		 */
+		if (priv->len == SMBUS_LEN_SENTINEL) {
 			priv->len = inb_p(SMBHSTDAT0(priv));
 			if (priv->len < 1 || priv->len > I2C_SMBUS_BLOCK_MAX) {
 				dev_err(&priv->pci_dev->dev,
@@ -698,8 +703,12 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
 		if (status)
 			return status;
 
-		if (i == 1 && read_write == I2C_SMBUS_READ
-		 && command != I2C_SMBUS_I2C_BLOCK_DATA) {
+		/*
+		 * At transfer start i801_smbus_block_transaction() marks
+		 * the block length as invalid. Check for this sentinel value
+		 * and read the block length from SMBHSTDAT0.
+		 */
+		if (len == SMBUS_LEN_SENTINEL) {
 			len = inb_p(SMBHSTDAT0(priv));
 			if (len < 1 || len > I2C_SMBUS_BLOCK_MAX) {
 				dev_err(&priv->pci_dev->dev,
@@ -806,7 +815,8 @@ static int i801_smbus_block_transaction(struct i801_priv *priv, union i2c_smbus_
 					u8 addr, u8 hstcmd, char read_write, int command)
 {
 	if (read_write == I2C_SMBUS_READ && command == I2C_SMBUS_BLOCK_DATA)
-		data->block[0] = I2C_SMBUS_BLOCK_MAX;
+		/* Mark block length as invalid */
+		data->block[0] = SMBUS_LEN_SENTINEL;
 	else if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
 		return -EPROTO;
 
-- 
2.43.0



