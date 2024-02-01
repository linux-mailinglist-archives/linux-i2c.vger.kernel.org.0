Return-Path: <linux-i2c+bounces-1602-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB30D8461D0
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 21:14:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 65C321F24A38
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 20:14:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7C685293;
	Thu,  1 Feb 2024 20:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHy0b/Nc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163298527E
	for <linux-i2c@vger.kernel.org>; Thu,  1 Feb 2024 20:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706818459; cv=none; b=lvAPWtjDt2Ymijp5hL4YJjL7C7/gpocC61Oz0pxXjnHX3zZozG4f485EnheDWnD0SHq8QiMHqSK5Wy/Zef0a4oDqnWh2VclcUUm2aYCohBl51qfWdBQWFTHt9RzNtr55a6qXh09LUXTulWNGfLNeqtT4JrB4ArifS0nAwJ+Flxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706818459; c=relaxed/simple;
	bh=kmGxJ+th+CyHg41CR7R0tPldVDDidf85ZtRyciUrk+s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=UzhYl4yrHlqbT5mnY/IrNPnRrARIGT86Gt1RLd+PMHuGUdBrial0X3Fewx14noQv9ejchFeDJqBt7t9BZtiO5kSVfgx98cWQNawijBnhXU6pNuTwNl9PLxUgEtXogkIhGbJ4q5YEG22YbnUBONlL6nZr2g9oZ9/AHP/59HwlfT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHy0b/Nc; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a359e6fde44so142115766b.3
        for <linux-i2c@vger.kernel.org>; Thu, 01 Feb 2024 12:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706818456; x=1707423256; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=DA4VcpHeL8FllydO+CljKhyboV14PR/HZGqZXTalrAU=;
        b=jHy0b/NcvTVBakuUzAycl/eLa91HLGKKoPB10E2col+H2RYghryEIul76A/lDLmVQS
         DKmTi2YYVJZ/ckcNJlkHYyv7Pfbg1XdtfAEQvNrXaWsS/Flksz1410olZSi+b+ZUp/S0
         JQ+bEs8zLgzsHrvebs1SyDKTsVxrq86S8Ed5BZUpO1AkQAI6AV0nji9VuD/qxnIb1zz1
         1xd1+T+utCAf9nHH8TurdXs98F92ALxYavxVFw8GSZmE87gEugu79KBrOPsQTPhbO/gx
         WFc/nq9CXujqYpmmhNGIbmFO5YiypdKHzkitCapKfl4REvvtGmPUL0e2oHuvCzBzW44K
         GUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706818456; x=1707423256;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DA4VcpHeL8FllydO+CljKhyboV14PR/HZGqZXTalrAU=;
        b=ZyrEfK84iARo13vul1weokqo89RaB1TyvUb6rKJpsy1D0qvuvvRvWhw/yQGlolMi4l
         1psDREh7UFBL/3kSqeyIyIU8LyM3uVm02t/yXv5Twyn1J2elzPSI0uHAJ4O0FFIsC01m
         uGGF5poy952FW4JT2CiA6KpBNOtgt345pMNgYt+y5mumzebXaz5tp0iXz8z/7TeMQKTM
         BgggcYCAHVfAI5mRnX82uVYUxRJ3/a+x4DsSOTUAqPTCLhqKmI1Xzbs2T3/6Pjk+WbmF
         +KSzbfgzDNnhg3XA+ETQusKws2L0R+YvLXwn964T7xQN2KCiWyzGpy9fnJ9WiZx303Vu
         gPTQ==
X-Gm-Message-State: AOJu0Yx6eo0zNuPSPrIxX5zqKKffccKZstqOP1RBgk3Juyxsb4zWoWYQ
	xKcc4VFJ0HeOYqwcysJLgIRJTcE4rP17tZh/7DLXF7N9jwNZwpB+
X-Google-Smtp-Source: AGHT+IHPQ+9DiEp+ZESqxazY0uWQnxS46IrzHjpl3WXMU7/TsunMx3cC68mreoTpOv18m3GYXIhGcw==
X-Received: by 2002:a17:906:5fd7:b0:a35:ba57:42bc with SMTP id k23-20020a1709065fd700b00a35ba5742bcmr4467226ejv.64.1706818456141;
        Thu, 01 Feb 2024 12:14:16 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXrW7cTFkiTyfW4vP9NfXaYIC7JDSHSwNXpD0u9fmkWyGVEny2DRx9lyI5i+OuxZZlDv4j64lQu2XTYZMtT9Dc2tF+ddLGzTd97jUR0BBJF9gM=
Received: from ?IPV6:2a01:c23:bcb7:3100:59fd:7b30:8e23:b0ac? (dynamic-2a01-0c23-bcb7-3100-59fd-7b30-8e23-b0ac.c23.pool.telefonica.de. [2a01:c23:bcb7:3100:59fd:7b30:8e23:b0ac])
        by smtp.googlemail.com with ESMTPSA id g21-20020a170906595500b00a3109a492d4sm126321ejr.20.2024.02.01.12.14.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 12:14:15 -0800 (PST)
Message-ID: <5fa1476a-083c-48a8-a71d-a46a1ed8f1fa@gmail.com>
Date: Thu, 1 Feb 2024 21:14:16 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 5/5] i2c: i801: Add helper i801_get_block_len
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

Avoid code duplication and factor out retrieving and checking the
block length value to new helper i801_get_block_len().

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- in the error case go to label out instead of directly bailing
  out in i801_block_transaction_by_block()
---
 drivers/i2c/busses/i2c-i801.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 514711406..c4af2f3ca 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -330,6 +330,18 @@ MODULE_PARM_DESC(disable_features, "Disable selected driver features:\n"
 	"\t\t  0x10  don't use interrupts\n"
 	"\t\t  0x20  disable SMBus Host Notify ");
 
+static int i801_get_block_len(struct i801_priv *priv)
+{
+	u8 len = inb_p(SMBHSTDAT0(priv));
+
+	if (len < 1 || len > I2C_SMBUS_BLOCK_MAX) {
+		pci_err(priv->pci_dev, "Illegal SMBus block read size %u\n", len);
+		return -EPROTO;
+	}
+
+	return len;
+}
+
 static int i801_check_and_clear_pec_error(struct i801_priv *priv)
 {
 	u8 status;
@@ -525,12 +537,11 @@ static int i801_block_transaction_by_block(struct i801_priv *priv,
 
 	if (read_write == I2C_SMBUS_READ ||
 	    command == I2C_SMBUS_BLOCK_PROC_CALL) {
-		len = inb_p(SMBHSTDAT0(priv));
-		if (len < 1 || len > I2C_SMBUS_BLOCK_MAX) {
-			status = -EPROTO;
+		status = i801_get_block_len(priv);
+		if (status < 0)
 			goto out;
-		}
 
+		len = status;
 		data->block[0] = len;
 		for (i = 0; i < len; i++)
 			data->block[i + 1] = inb_p(SMBBLKDAT(priv));
@@ -548,14 +559,11 @@ static void i801_isr_byte_done(struct i801_priv *priv)
 		 * and read the block length from SMBHSTDAT0.
 		 */
 		if (priv->len == SMBUS_LEN_SENTINEL) {
-			priv->len = inb_p(SMBHSTDAT0(priv));
-			if (priv->len < 1 || priv->len > I2C_SMBUS_BLOCK_MAX) {
-				dev_err(&priv->pci_dev->dev,
-					"Illegal SMBus block read size %d\n",
-					priv->len);
+			priv->len = i801_get_block_len(priv);
+			if (priv->len < 0)
 				/* FIXME: Recover */
 				priv->len = I2C_SMBUS_BLOCK_MAX;
-			}
+
 			priv->data[-1] = priv->len;
 		}
 
@@ -707,11 +715,8 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
 		 * and read the block length from SMBHSTDAT0.
 		 */
 		if (len == SMBUS_LEN_SENTINEL) {
-			len = inb_p(SMBHSTDAT0(priv));
-			if (len < 1 || len > I2C_SMBUS_BLOCK_MAX) {
-				dev_err(&priv->pci_dev->dev,
-					"Illegal SMBus block read size %d\n",
-					len);
+			len = i801_get_block_len(priv);
+			if (len < 0) {
 				/* Recover */
 				while (inb_p(SMBHSTSTS(priv)) &
 				       SMBHSTSTS_HOST_BUSY)
-- 
2.43.0



