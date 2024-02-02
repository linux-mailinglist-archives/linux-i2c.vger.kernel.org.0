Return-Path: <linux-i2c+bounces-1613-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8756846901
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Feb 2024 08:06:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 615332960F8
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Feb 2024 07:06:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED28617C60;
	Fri,  2 Feb 2024 07:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RpFmY5E+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297AB17C67
	for <linux-i2c@vger.kernel.org>; Fri,  2 Feb 2024 07:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706857592; cv=none; b=FmO6lAw8ny99GHLPq2svkZOZHTuuMAPEy6k+BSpZilH6Skr1P4ZrUxN4Qf7S+K6h7ct16j51ME73RwLW9NTQD8Oq1p0U8ONKJTzIYmLwvcW7aDK9BCYCjS81rPsgJLi7gVx2GnP6bONzb9Op3M+oQSYO29p7bMQ0ejlti1g5xRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706857592; c=relaxed/simple;
	bh=dJWpJxmWVYgcHkY3YoLw4L9O6QS4Xq/IR5XUlCyZiAA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=hZ6RmIbfywzYc68vaDIur7mYRB+toOm+1OvxIWj1QpgIYWlQyPJwYE3XZ4SA2SOM0Vcx76AhsyTNMx6Sx79zxf3OLyXZ57YcCIGHec3Kj60gKlUh4MpXJnJdKEa5RwZlLrmwJ5tUgjEHG3yuIWCb4rvh4zIqqeHzX41FRBMhvkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RpFmY5E+; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a3604697d63so266565066b.3
        for <linux-i2c@vger.kernel.org>; Thu, 01 Feb 2024 23:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706857589; x=1707462389; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2P+2nWu3iGITgq75CUIQnkUJLgdxtzlwZ1tx/cks1Mw=;
        b=RpFmY5E+4DQC4pdMvFLwJnb0h8kH5D/s/AZSPSEorwDXW/LIp7TOVCXSXdnssAjFwh
         tx9hLa7TfnBTUZIP8vbj5vkfpzGNwVS0Uvd96eo9oTlPOBGVnFN3A86HfgjnrlMfunuz
         P3k+nKBSi9Unpk+TOE51ZnhZB/ETMu5/T+NfArcLRl/Y/0BQoDsm0x+N1RuJORNVK/AE
         8LSb4wPd2Cv8H0LHtRJhhfKVcdgDrUMIMCjm+l/rFzFUmDvk10fOZ1cjg2J6gUq4AiyP
         kw0tkPWSTp8pbxRb3jAJmOK4XKQzGBrb3EnSYAYAizkr5l3Pnh+QdGsJ9MOxDdAUASyw
         iXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706857589; x=1707462389;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2P+2nWu3iGITgq75CUIQnkUJLgdxtzlwZ1tx/cks1Mw=;
        b=jdKvLIy73SSj4cih4fS2fa73L7iieWkRIroIlGRk/c6BOr55y9MfgLYBzK8idTu+WF
         TJkkMEmPNHoNnOdQ4Qx7xkXKe6vIsDVGs1Q7iBe4MhN5oYOv97VZrRPEwQvE3MmKidHD
         NO6OvJ7IHxPP+p0cC+yKG4BU7+usmh0e+C+/pDm8VNIMPixLNXv/qY19O4cvAE54d/pU
         I6T21c9XaIPoU1PZZqkzBNlOLMzumVBwQealC+BjbxJzTtF+qwmprDK2kVt9z1wmiHV2
         x2fAdSp6QT3jVQeNX1CFguzhaPsY9xKHt/tbEIeeB6R9BREf0Ocs7EjW+cEZqD/d6LL9
         H7bw==
X-Gm-Message-State: AOJu0Yy/nh2NozWyMtdnBjBD1O2kT8TSmHk0BCgKR2sLmHMGgDrwLUdz
	zsxOMw1t0L2ptitJxCVTIT0+QYkGObuszl2H6OJ4j4Rtb4bFScxx
X-Google-Smtp-Source: AGHT+IFkEvNW0LIlSKYB5s907dm1q0yVmS+N5y7lEP3MfcIqf9bZV4f+9YR+AUrP5+C2UOcW24Bg7A==
X-Received: by 2002:a17:906:bce7:b0:a31:45a6:2bb5 with SMTP id op7-20020a170906bce700b00a3145a62bb5mr4952665ejb.40.1706857588993;
        Thu, 01 Feb 2024 23:06:28 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCV/hmJnhgT+YerZWQc+655k1uTzMbo3XtRz5je6R0RsbQCCWGMLKXw5pJIK0FMuB1B3rZ/PV3oCNB608G6rQIz/RFrtnjv5cGQSi4l3VQAI7g7L/Cixr3x2pqeNJ4lFAgK4m2pEkqHpcQ==
Received: from ?IPV6:2a01:c22:7392:d000:5c1a:bcfc:a8a4:5bea? (dynamic-2a01-0c22-7392-d000-5c1a-bcfc-a8a4-5bea.c22.pool.telefonica.de. [2a01:c22:7392:d000:5c1a:bcfc:a8a4:5bea])
        by smtp.googlemail.com with ESMTPSA id c3-20020a170906340300b00a35a659cab5sm568494ejb.179.2024.02.01.23.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 23:06:28 -0800 (PST)
Message-ID: <c7e808ba-b333-4c5c-be75-7b74e02aad95@gmail.com>
Date: Fri, 2 Feb 2024 08:06:30 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 5/5] i2c: i801: Add helper i801_get_block_len
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
index 15d251288..918c794c7 100644
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
@@ -549,14 +560,11 @@ static void i801_isr_byte_done(struct i801_priv *priv)
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
 
@@ -709,11 +717,8 @@ static int i801_block_transaction_byte_by_byte(struct i801_priv *priv,
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



