Return-Path: <linux-i2c+bounces-1601-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C49CF8461CD
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 21:12:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 31EC21F24795
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 20:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B84E885293;
	Thu,  1 Feb 2024 20:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fwmasc7a"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04A18529A
	for <linux-i2c@vger.kernel.org>; Thu,  1 Feb 2024 20:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706818356; cv=none; b=uK01QXcYsijfw1N1u/oJN/T/qCQvXMME7RJF81RNcjml6w6yIKH7dUUZ2nRUfcQe+nd9GcaE/LuLn76WUZc0GOLS8doxDKMo4B9jheXv31c87Rv4YI6mq61/I9qfxvb7slu4czykSm9NYyXMfGN1C3deFOVBTedrl343lBmS1YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706818356; c=relaxed/simple;
	bh=2HJ+B16mLkvhL0iUt3gQQJ+TpCBoeqWfPrrpvGZAdc4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=X5JW9UZnDFcuxFEH9/UxrVmKMKEMUKQjq4OW8mNkYULcfi0v4GCuceih0IJ6mfyFFxocVFGDRuGT7u6wB9LvtRJEZd/6Ib8tbSCtOAUc1FK+w5A9XDLZhpck51UGjz/OOtMRjX6ONZO1h2SwcowP3D8q3nDqdRH56C5mjh+Xqbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fwmasc7a; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-55f19a3ca7aso4787747a12.1
        for <linux-i2c@vger.kernel.org>; Thu, 01 Feb 2024 12:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706818353; x=1707423153; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vot9IyyGdhvJEfeD3k6UjAazk9zF3vdcSvI6M1mka4g=;
        b=fwmasc7anlcqgq8ITyIXXRVvsCvZ/oTR93wCo1VeJ/npHUu9AilBzObK7lXZw9KDaf
         SMDJO1LnMeHCe2Jvnvni6y48SXs9TPBFCrkqU/o/IUwQog+Sk1iJLdh0bgd2v4FEm5x1
         DIGY5PAGjgQiimy22Yy7tUUDgad61ojx3H/I0yzE5A7+pVaXQv36E/ZXRfkWomXsphA2
         6SIyC7uh7eYFkfLhpIHJ3GmQTzFf/0M+XjJNSEupdqzmlYdy+V9yrS7G5fMW9p//GXVT
         SoL8ds0PIzIYoCMgvqOk1/xG++SjvjQe1bC4xPRv/baVgnRH75Mg11pwgZLrZviOT4Z2
         PNRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706818353; x=1707423153;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vot9IyyGdhvJEfeD3k6UjAazk9zF3vdcSvI6M1mka4g=;
        b=FSMiqeNJG6DBtg+xU6WzBgcbat4kE1JzYWOzQjvu+j0XzzvIQ3H2qrjxG8Yypkw5xt
         e/DtTQ5Hk1Ii/gVHANbeZSbymaWCBcApBhKNjDPy62QiGbqKHJra66KwRk0dqA+V8OOl
         A912/pmhSQ9IBKC7qIJ8orIbIxinjP0lWkx8Rw7731mAerCTNHowZUn/YSalODmieFa2
         0QZH2ohKenhLI9qIv7appVqzaLb1scD1eOg+P5kAEpsuPL4nafCAowXU/hKFUI7O6U5L
         kUyq2Xkka+98mB1D24jnju8+ulWGY5aN8Zsw6wY9m3DpxfkrcctILnylNrnQEF0xSsx3
         Lo9w==
X-Gm-Message-State: AOJu0Yz1m7ZvmzQCOeEJ3eEDG7eHL/y1Gr09C7ewoPz4GNAHmia91VOV
	wR23hBvtrcdc2VQA3mkslFu89j5mUUVHNEOV7DiMMgZXbaNCzS+T
X-Google-Smtp-Source: AGHT+IGvatJ6JW6ZqMzqkl9ycP12Wu7uZTmZ1YF1LJd2DHaOwDoa1g3hdMYVTlPun8eOLMJOZZTTdg==
X-Received: by 2002:a17:906:af09:b0:a35:6669:9fe with SMTP id lx9-20020a170906af0900b00a35666909femr71727ejb.32.1706818352826;
        Thu, 01 Feb 2024 12:12:32 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWd+8BXrWXpDnm4fwSRU4LJc6+EsUT16x5wOogmdaUbQZCumRqPsDDGDk1cb1I6FnBz7oLI+U0h9ALIrotTaGwrr7tgTNrtxIUztkZnmn5/OJk=
Received: from ?IPV6:2a01:c23:bcb7:3100:59fd:7b30:8e23:b0ac? (dynamic-2a01-0c23-bcb7-3100-59fd-7b30-8e23-b0ac.c23.pool.telefonica.de. [2a01:c23:bcb7:3100:59fd:7b30:8e23:b0ac])
        by smtp.googlemail.com with ESMTPSA id cb11-20020a170906a44b00b00a349318ea10sm114415ejb.199.2024.02.01.12.12.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 12:12:32 -0800 (PST)
Message-ID: <9d06c7d6-8c62-4e44-9e3e-334ac14e38a1@gmail.com>
Date: Thu, 1 Feb 2024 21:12:33 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 4/5] i2c: i801: Add SMBUS_LEN_SENTINEL
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <54845225-ffa5-4983-8bb5-3aa70ef72c72@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <54845225-ffa5-4983-8bb5-3aa70ef72c72@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add a sentinel length value that is used to check whether we should
read and use the length value provided by the slave device.
This simplifies the currently used checks.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- add comments
---
 drivers/i2c/busses/i2c-i801.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 24eb187db..514711406 100644
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
@@ -541,9 +543,11 @@ static int i801_block_transaction_by_block(struct i801_priv *priv,
 static void i801_isr_byte_done(struct i801_priv *priv)
 {
 	if (priv->is_read) {
-		/* For SMBus block reads, length is received with first byte */
-		if (((priv->cmd & 0x1c) == I801_BLOCK_DATA) &&
-		    (priv->count == 0)) {
+		/* At transfer start i801_smbus_block_transaction() marks
+		 * the block length as invalid. Check for this sentinel value
+		 * and read the block length from SMBHSTDAT0.
+		 */
+		if (priv->len == SMBUS_LEN_SENTINEL) {
 			priv->len = inb_p(SMBHSTDAT0(priv));
 			if (priv->len < 1 || priv->len > I2C_SMBUS_BLOCK_MAX) {
 				dev_err(&priv->pci_dev->dev,
@@ -698,8 +702,11 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
 		if (status)
 			return status;
 
-		if (i == 1 && read_write == I2C_SMBUS_READ
-		 && command != I2C_SMBUS_I2C_BLOCK_DATA) {
+		/* At transfer start i801_smbus_block_transaction() marks
+		 * the block length as invalid. Check for this sentinel value
+		 * and read the block length from SMBHSTDAT0.
+		 */
+		if (len == SMBUS_LEN_SENTINEL) {
 			len = inb_p(SMBHSTDAT0(priv));
 			if (len < 1 || len > I2C_SMBUS_BLOCK_MAX) {
 				dev_err(&priv->pci_dev->dev,
@@ -806,7 +813,7 @@ static int i801_smbus_block_transaction(struct i801_priv *priv, union i2c_smbus_
 					u8 addr, u8 hstcmd, char read_write, int command)
 {
 	if (read_write == I2C_SMBUS_READ && command == I2C_SMBUS_BLOCK_DATA)
-		data->block[0] = I2C_SMBUS_BLOCK_MAX;
+		data->block[0] = SMBUS_LEN_SENTINEL; /* Mark block length as invalid */
 	else if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
 		return -EPROTO;
 
-- 
2.43.0



