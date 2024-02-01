Return-Path: <linux-i2c+bounces-1600-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D6E1C8461CC
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 21:11:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F26EAB24E8C
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 20:11:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3A1D8529A;
	Thu,  1 Feb 2024 20:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oq2rD+Y2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB4DE8528E
	for <linux-i2c@vger.kernel.org>; Thu,  1 Feb 2024 20:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706818290; cv=none; b=EoJt7pGjhIJvPXSWpOKELWwj5o2j7pqMFJZOuL9FFKbw+NLP6YPBsC7Qft1dI+6hCF7RLXp24opQ0kg39qTNCsrjLgvyasBXmjnUhZ2u1Ww0M3xgTQsKw8zXnjrj+5DTePmM7rU4naEZ5x5JjK96qxPnq2QzQjDf0F6GhCZNlAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706818290; c=relaxed/simple;
	bh=UgWeAAVf9siBe++4hNWMaqXJoulggWwd4XWfymnlkgQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=LIGyYWJuOpkhc1xE3412GYpvK79N4+pa17dbpjDjJ2y+iFzo13S6dmnKX+4GVjnrxKPuNrKsbR5/hd53CjWbYXUBnl+1nYr55BvV31QsPzI685XSApmZfTAQWge9Tlh1vl9qrCh1ssblyC3sdwibMPZiiMv7wzvxLyGMXFfDSKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oq2rD+Y2; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a26f73732c5so208295066b.3
        for <linux-i2c@vger.kernel.org>; Thu, 01 Feb 2024 12:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706818287; x=1707423087; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lBXjT/pjd5QCS7CfT4+C53H6bHqWr9YfEtVQDFTqXT0=;
        b=Oq2rD+Y2zSuGk+mkG9cEfpv/zMa/NiMZBNHt06ieKJsRV+TQohtz1S69ipXpoQ6KCK
         ULTGbv+OwSzsyRZ2NCHqbf0CT2TZkcBSB1RySxBFuSi4bA03rTZ1IEYbtW1J8Azjoxt8
         oqrXZG0eT7SP4eTwPvehn995vb8TYQT/DYQ4rLQBsNhhsgcmjm20lKxEOH09+Qte6zn/
         W/JWSX1/fbSF/1qVIy6QpuQL8IHXMcQKpl/Qh94Gh/OTYkTldPQuKjtD4FwtkJYT5WQe
         FvhL1eWjUSq0rix4kRzyjxgeAzVgM2DYRRtF1rmliYI4EtYJjrEyLYziL+ZT2ESA3jMj
         iEDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706818287; x=1707423087;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBXjT/pjd5QCS7CfT4+C53H6bHqWr9YfEtVQDFTqXT0=;
        b=rGm1DG6jrxnf0lgnuZKGTKyqio7LiBea7apsM7h1JsPhAFOCDk0rxxbivJ9KYeVQpf
         5p/WpVgWD5k6h/ORbYxAEn7KEiiGqjxZxziOG0pMjjxxD8uiCtx3hJPKd3rZ4sXfO0ex
         +f7w4EpGtOT42mJRp1fE4nTI/HyyfIS1GjSE5pb2vtQryH9lJYRCP72p9a6dAqhMHGy5
         dDvYlATyoKNXJE7JeuCgDDBqv6s0NTp0X52+UgXeXZI3/nbMrs3g/gTAcFGxEnUvIXd0
         hof8QEqWbygmQeUIBAshQvbQx4KnWm97RiT/TmyH+WX+YNFlxQaD6HonAD8J93jx5lGM
         7ztg==
X-Gm-Message-State: AOJu0YxY1kr8Sw6Myct0qZYGg6Mue4BUa8djAgZyIfjGExWOchC42ctM
	Qkn9uUWnGVZMOWubs3+4el02bAATpI8rVHVL1yxIfsHVeasVTUEM9vq+WZ94
X-Google-Smtp-Source: AGHT+IFn+7/ow8pNYBvqPIFk4LzG/m32mAr7A0koTfX12eKqMwFDP821P8PGO5iVh5Z7izyF2wjw8g==
X-Received: by 2002:a17:907:7746:b0:a36:f811:44f5 with SMTP id kx6-20020a170907774600b00a36f81144f5mr128774ejc.47.1706818286730;
        Thu, 01 Feb 2024 12:11:26 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUsi6lUpl3WOttjDOeNuVjKwjuQ3PVTv5oQT19gccRDIsjFNtjh7SQL4gq+onwq0TvxdyzLn5juxWwjg8Z+BDNGAzzpmFBQL36OlqIq2lkFZno=
Received: from ?IPV6:2a01:c23:bcb7:3100:59fd:7b30:8e23:b0ac? (dynamic-2a01-0c23-bcb7-3100-59fd-7b30-8e23-b0ac.c23.pool.telefonica.de. [2a01:c23:bcb7:3100:59fd:7b30:8e23:b0ac])
        by smtp.googlemail.com with ESMTPSA id cb11-20020a170906a44b00b00a349318ea10sm114415ejb.199.2024.02.01.12.11.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 12:11:26 -0800 (PST)
Message-ID: <25037b79-7b38-4e0a-a5e9-91138e7e88e2@gmail.com>
Date: Thu, 1 Feb 2024 21:11:27 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 3/5] i2c: i801: Split i801_block_transaction
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <54845225-ffa5-4983-8bb5-3aa70ef72c72@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 xsFNBF/0ZFUBEAC0eZyktSE7ZNO1SFXL6cQ4i4g6Ah3mOUIXSB4pCY5kQ6OLKHh0FlOD5/5/
 sY7IoIouzOjyFdFPnz4Bl3927ClT567hUJJ+SNaFEiJ9vadI6vZm2gcY4ExdIevYHWe1msJF
 MVE4yNwdS+UsPeCF/6CQQTzHc+n7DomE7fjJD5J1hOJjqz2XWe71fTvYXzxCFLwXXbBiqDC9
 dNqOe5odPsa4TsWZ09T33g5n2nzTJs4Zw8fCy8rLqix/raVsqr8fw5qM66MVtdmEljFaJ9N8
 /W56qGCp+H8Igk/F7CjlbWXiOlKHA25mPTmbVp7VlFsvsmMokr/imQr+0nXtmvYVaKEUwY2g
 86IU6RAOuA8E0J5bD/BeyZdMyVEtX1kT404UJZekFytJZrDZetwxM/cAH+1fMx4z751WJmxQ
 J7mIXSPuDfeJhRDt9sGM6aRVfXbZt+wBogxyXepmnlv9K4A13z9DVLdKLrYUiu9/5QEl6fgI
 kPaXlAZmJsQfoKbmPqCHVRYj1lpQtDM/2/BO6gHASflWUHzwmBVZbS/XRs64uJO8CB3+V3fa
 cIivllReueGCMsHh6/8wgPAyopXOWOxbLsZ291fmZqIR0L5Y6b2HvdFN1Xhc+YrQ8TKK+Z4R
 mJRDh0wNQ8Gm89g92/YkHji4jIWlp2fwzCcx5+lZCQ1XdqAiHQARAQABzSZIZWluZXIgS2Fs
 bHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPsLBjgQTAQgAOBYhBGxfqY/yOyXjyjJehXLe
 ig9U8DoMBQJf9GRVAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHLeig9U8DoMSycQ
 AJbfg8HZEK0ljV4M8nvdaiNixWAufrcZ+SD8zhbxl8GispK4F3Yo+20Y3UoZ7FcIidJWUUJL
 axAOkpI/70YNhlqAPMsuudlAieeYZKjIv1WV5ucNZ3VJ7dC+dlVqQdAr1iD869FZXvy91KhJ
 wYulyCf+s4T9YgmLC6jLMBZghKIf1uhSd0NzjyCqYWbk2ZxByZHgunEShOhHPHswu3Am0ftt
 ePaYIHgZs+Vzwfjs8I7EuW/5/f5G9w1vibXxtGY/GXwgGGHRDjFM7RSprGOv4F5eMGh+NFUJ
 TU9N96PQYMwXVxnQfRXl8O6ffSVmFx4H9rovxWPKobLmqQL0WKLLVvA/aOHCcMKgfyKRcLah
 57vGC50Ga8oT2K1g0AhKGkyJo7lGXkMu5yEs0m9O+btqAB261/E3DRxfI1P/tvDZpLJKtq35
 dXsj6sjvhgX7VxXhY1wE54uqLLHY3UZQlmH3QF5t80MS7/KhxB1pO1Cpcmkt9hgyzH8+5org
 +9wWxGUtJWNP7CppY+qvv3SZtKJMKsxqk5coBGwNkMms56z4qfJm2PUtJQGjA65XWdzQACib
 2iaDQoBqGZfXRdPT0tC1H5kUJuOX4ll1hI/HBMEFCcO8++Bl2wcrUsAxLzGvhINVJX2DAQaF
 aNetToazkCnzubKfBOyiTqFJ0b63c5dqziAgzsFNBF/0ZFUBEADF8UEZmKDl1w/UxvjeyAeX
 kghYkY3bkK6gcIYXdLRfJw12GbvMioSguvVzASVHG8h7NbNjk1yur6AONfbUpXKSNZ0skV8V
 fG+ppbaY+zQofsSMoj5gP0amwbwvPzVqZCYJai81VobefTX2MZM2Mg/ThBVtGyzV3NeCpnBa
 8AX3s9rrX2XUoCibYotbbxx9afZYUFyflOc7kEpc9uJXIdaxS2Z6MnYLHsyVjiU6tzKCiVOU
 KJevqvzPXJmy0xaOVf7mhFSNQyJTrZpLa+tvB1DQRS08CqYtIMxRrVtC0t0LFeQGly6bOngr
 ircurWJiJKbSXVstLHgWYiq3/GmCSx/82ObeLO3PftklpRj8d+kFbrvrqBgjWtMH4WtK5uN5
 1WJ71hWJfNchKRlaJ3GWy8KolCAoGsQMovn/ZEXxrGs1ndafu47yXOpuDAozoHTBGvuSXSZo
 ythk/0EAuz5IkwkhYBT1MGIAvNSn9ivE5aRnBazugy0rTRkVggHvt3/7flFHlGVGpBHxFUwb
 /a4UjJBPtIwa4tWR8B1Ma36S8Jk456k2n1id7M0LQ+eqstmp6Y+UB+pt9NX6t0Slw1NCdYTW
 gJezWTVKF7pmTdXszXGxlc9kTrVUz04PqPjnYbv5UWuDd2eyzGjrrFOsJEi8OK2d2j4FfF++
 AzOMdW09JVqejQARAQABwsF2BBgBCAAgFiEEbF+pj/I7JePKMl6Fct6KD1TwOgwFAl/0ZFUC
 GwwACgkQct6KD1TwOgxUfg//eAoYc0Vm4NrxymfcY30UjHVD0LgSvU8kUmXxil3qhFPS7KA+
 y7tgcKLHOkZkXMX5MLFcS9+SmrAjSBBV8omKoHNo+kfFx/dUAtz0lot8wNGmWb+NcHeKM1eb
 nwUMOEa1uDdfZeKef/U/2uHBceY7Gc6zPZPWgXghEyQMTH2UhLgeam8yglyO+A6RXCh+s6ak
 Wje7Vo1wGK4eYxp6pwMPJXLMsI0ii/2k3YPEJPv+yJf90MbYyQSbkTwZhrsokjQEaIfjrIk3
 rQRjTve/J62WIO28IbY/mENuGgWehRlTAbhC4BLTZ5uYS0YMQCR7v9UGMWdNWXFyrOB6PjSu
 Trn9MsPoUc8qI72mVpxEXQDLlrd2ijEWm7Nrf52YMD7hL6rXXuis7R6zY8WnnBhW0uCfhajx
 q+KuARXC0sDLztcjaS3ayXonpoCPZep2Bd5xqE4Ln8/COCslP7E92W1uf1EcdXXIrx1acg21
 H/0Z53okMykVs3a8tECPHIxnre2UxKdTbCEkjkR4V6JyplTS47oWMw3zyI7zkaadfzVFBxk2
 lo/Tny+FX1Azea3Ce7oOnRUEZtWSsUidtIjmL8YUQFZYm+JUIgfRmSpMFq8JP4VH43GXpB/S
 OCrl+/xujzvoUBFV/cHKjEQYBxo+MaiQa1U54ykM2W4DnHb1UiEf5xDkFd4=
In-Reply-To: <54845225-ffa5-4983-8bb5-3aa70ef72c72@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

i2c and smbus block transaction handling have little in common,
therefore split this function to improve code readability.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 112 +++++++++++++++-------------------
 1 file changed, 50 insertions(+), 62 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 156bace92..24eb187db 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -802,77 +802,65 @@ static int i801_simple_transaction(struct i801_priv *priv, union i2c_smbus_data
 	return 0;
 }
 
-/* Block transaction function */
-static int i801_block_transaction(struct i801_priv *priv, union i2c_smbus_data *data,
-				  u8 addr, u8 hstcmd, char read_write, int command)
+static int i801_smbus_block_transaction(struct i801_priv *priv, union i2c_smbus_data *data,
+					u8 addr, u8 hstcmd, char read_write, int command)
 {
-	int result = 0;
-	unsigned char hostc;
-
 	if (read_write == I2C_SMBUS_READ && command == I2C_SMBUS_BLOCK_DATA)
 		data->block[0] = I2C_SMBUS_BLOCK_MAX;
 	else if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
 		return -EPROTO;
 
-	switch (command) {
-	case I2C_SMBUS_BLOCK_DATA:
-		i801_set_hstadd(priv, addr, read_write);
-		outb_p(hstcmd, SMBHSTCMD(priv));
-		break;
-	case I2C_SMBUS_I2C_BLOCK_DATA:
-		/*
-		 * NB: page 240 of ICH5 datasheet shows that the R/#W
-		 * bit should be cleared here, even when reading.
-		 * However if SPD Write Disable is set (Lynx Point and later),
-		 * the read will fail if we don't set the R/#W bit.
-		 */
-		i801_set_hstadd(priv, addr,
-				priv->original_hstcfg & SMBHSTCFG_SPD_WD ?
-				read_write : I2C_SMBUS_WRITE);
-		if (read_write == I2C_SMBUS_READ) {
-			/* NB: page 240 of ICH5 datasheet also shows
-			 * that DATA1 is the cmd field when reading
-			 */
-			outb_p(hstcmd, SMBHSTDAT1(priv));
-		} else
-			outb_p(hstcmd, SMBHSTCMD(priv));
-
-		if (read_write == I2C_SMBUS_WRITE) {
-			/* set I2C_EN bit in configuration register */
-			pci_read_config_byte(priv->pci_dev, SMBHSTCFG, &hostc);
-			pci_write_config_byte(priv->pci_dev, SMBHSTCFG,
-					      hostc | SMBHSTCFG_I2C_EN);
-		} else if (!(priv->features & FEATURE_I2C_BLOCK_READ)) {
-			dev_err(&priv->pci_dev->dev,
-				"I2C block read is unsupported!\n");
-			return -EOPNOTSUPP;
-		}
-		break;
-	case I2C_SMBUS_BLOCK_PROC_CALL:
+	if (command == I2C_SMBUS_BLOCK_PROC_CALL)
 		/* Needs to be flagged as write transaction */
 		i801_set_hstadd(priv, addr, I2C_SMBUS_WRITE);
+	else
+		i801_set_hstadd(priv, addr, read_write);
+	outb_p(hstcmd, SMBHSTCMD(priv));
+
+	if (priv->features & FEATURE_BLOCK_BUFFER)
+		return i801_block_transaction_by_block(priv, data, read_write, command);
+	else
+		return i801_block_transaction_byte_by_byte(priv, data, read_write, command);
+}
+
+static int i801_i2c_block_transaction(struct i801_priv *priv, union i2c_smbus_data *data,
+				      u8 addr, u8 hstcmd, char read_write, int command)
+{
+	int result;
+	u8 hostc;
+
+	if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
+		return -EPROTO;
+	/*
+	 * NB: page 240 of ICH5 datasheet shows that the R/#W bit should be cleared here,
+	 * even when reading. However if SPD Write Disable is set (Lynx Point and later),
+	 * the read will fail if we don't set the R/#W bit.
+	 */
+	i801_set_hstadd(priv, addr,
+			priv->original_hstcfg & SMBHSTCFG_SPD_WD ? read_write : I2C_SMBUS_WRITE);
+
+	/* NB: page 240 of ICH5 datasheet shows that DATA1 is the cmd field when reading */
+	if (read_write == I2C_SMBUS_READ)
+		outb_p(hstcmd, SMBHSTDAT1(priv));
+	else
 		outb_p(hstcmd, SMBHSTCMD(priv));
-		break;
+
+	if (read_write == I2C_SMBUS_WRITE) {
+		/* set I2C_EN bit in configuration register */
+		pci_read_config_byte(priv->pci_dev, SMBHSTCFG, &hostc);
+		pci_write_config_byte(priv->pci_dev, SMBHSTCFG, hostc | SMBHSTCFG_I2C_EN);
+	} else if (!(priv->features & FEATURE_I2C_BLOCK_READ)) {
+		pci_err(priv->pci_dev, "I2C block read is unsupported!\n");
+		return -EOPNOTSUPP;
 	}
 
-	/* Experience has shown that the block buffer can only be used for
-	   SMBus (not I2C) block transactions, even though the datasheet
-	   doesn't mention this limitation. */
-	if ((priv->features & FEATURE_BLOCK_BUFFER) &&
-	    command != I2C_SMBUS_I2C_BLOCK_DATA)
-		result = i801_block_transaction_by_block(priv, data,
-							 read_write,
-							 command);
-	else
-		result = i801_block_transaction_byte_by_byte(priv, data,
-							     read_write,
-							     command);
+	/* Block buffer isn't supported for I2C block transactions */
+	result = i801_block_transaction_byte_by_byte(priv, data, read_write, command);
 
-	if (command == I2C_SMBUS_I2C_BLOCK_DATA
-	 && read_write == I2C_SMBUS_WRITE) {
-		/* restore saved configuration register value */
+	/* restore saved configuration register value */
+	if (read_write == I2C_SMBUS_WRITE)
 		pci_write_config_byte(priv->pci_dev, SMBHSTCFG, hostc);
-	}
+
 	return result;
 }
 
@@ -903,10 +891,10 @@ static s32 i801_access(struct i2c_adapter *adap, u16 addr,
 		outb_p(inb_p(SMBAUXCTL(priv)) & (~SMBAUXCTL_CRC),
 		       SMBAUXCTL(priv));
 
-	if (size == I2C_SMBUS_BLOCK_DATA ||
-	    size == I2C_SMBUS_I2C_BLOCK_DATA ||
-	    size == I2C_SMBUS_BLOCK_PROC_CALL)
-		ret = i801_block_transaction(priv, data, addr, command, read_write, size);
+	if (size == I2C_SMBUS_BLOCK_DATA || size == I2C_SMBUS_BLOCK_PROC_CALL)
+		ret = i801_smbus_block_transaction(priv, data, addr, command, read_write, size);
+	else if (size == I2C_SMBUS_I2C_BLOCK_DATA)
+		ret = i801_i2c_block_transaction(priv, data, addr, command, read_write, size);
 	else
 		ret = i801_simple_transaction(priv, data, addr, command, read_write, size);
 
-- 
2.43.0



