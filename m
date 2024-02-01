Return-Path: <linux-i2c+bounces-1599-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 495E08461CA
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 21:10:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F399F28B71D
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Feb 2024 20:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21EEE8529D;
	Thu,  1 Feb 2024 20:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AWMRhv1m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360BC8527E
	for <linux-i2c@vger.kernel.org>; Thu,  1 Feb 2024 20:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706818241; cv=none; b=h39qrv7t0y1QvVmfeRS4MAVKqMxbZ5NlXUGAd5vRA409JIg+r+LWJALqkf1qSX1RWqgWj1SLJcF5sq0HjlsDdMof2Yqp+zGfV0ZPsv2/Ur1oVy0lsMWQE0f3SsUc0yV7LfKHevT7vHcksFJSQvF6A5cQoRY+UlCYLwDnRYgM8BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706818241; c=relaxed/simple;
	bh=sZ4YMnMvS2zY1pxZsRbIn281S8F6stxr1kpbIEqhu9E=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=gyo3AZDEWSRcNY2Tb8LXVj621q8QATgDWBkeSMB9qo7qkzHL71x+HIcW6J7K+LNK4Ne2aqbNMOG9+hbOfHKanit467h8FflIPcgeFx5O0LAoKrlSOsO0Y0a02uvCtulhWRgNSEbovQ++ITs8QdAZ72WssXVNSz6nmz43UGA7q3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AWMRhv1m; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a2f22bfb4e6so191466366b.0
        for <linux-i2c@vger.kernel.org>; Thu, 01 Feb 2024 12:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706818238; x=1707423038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cOIynYLi9FGxEBRCi2RBYZT7yHEai3R+oCc9L2iUbk0=;
        b=AWMRhv1m2RL0JTuYLVMvJKQAr5UnkKzsRxmBIjI4ZecIKyuS8HApAylui6KIRAqEfH
         Nu3K3oNIIKCXO/WBplCLIyn2t890Amg7iFQSDDidjDc1xnpxG/z5V2ChYfKNM+4rxmaL
         /LriC9wfPVEVIcd1Brly2/lqAHHsoWpmMzMfDa3hx7/o48h5Ak/CK0dfbSAgij/IV2kt
         MH3x37JKMhualtNwzX3yfuaSj+TZyEqmMgDogYs4uBWYWZtt+OCcgEi03yTUQ5lRyACh
         BjhOAeTk0LnucsUDW1AtTwDnyAOcXEnpK+a9YAGZmhBDvCxO2DXP2OsGhuFJZuEO1okX
         1IdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706818238; x=1707423038;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cOIynYLi9FGxEBRCi2RBYZT7yHEai3R+oCc9L2iUbk0=;
        b=HGkjDZvgxKvBLSuFL/cPRYEzpZ9K2ypqbmSDjFaETJ58kYNifZMqqGboXWwCyAc5K1
         mz88lFl4/VVwB7uwIPZgbfAmhEtGPxmZ2x2BaXY8zaZy34CQNYJDJRNN2x5Wmo2CfukR
         h+b3q3hs5jotLeuLG78WKykYRTNOdoFKCQT/Wi0DHOxj0bnKUQ8Wd5Pupz4C5QZHZmkc
         WdIdv662jOnFDKFpOuycFCM6tLyV1NqDf+gTZUntIBb6EWlB8IQMQlymA+8yRkwGr54J
         fAW+FPaOozoRVeFq0i6d/pIQbAx0HefcEEscrCcJw6whW4Z/YMZ7JB82jQDb6N+45+u2
         w8tw==
X-Gm-Message-State: AOJu0Yxr+XlunicB9JWLFAPGZoA2B7xCoG2zP9p1h+CP2wWsJ/PPOEtU
	i3C1BUDFJF2sRHVBkDxXx0NK01lRNLz3FW+yFhfCT3F765ABkWAB
X-Google-Smtp-Source: AGHT+IEyeBWbEf9E7xOt/9agB/7RwI8l316dHD0YLKE7cFXxRwRngI3D9o87vVkOGcgKl9/7lUYDHA==
X-Received: by 2002:a17:906:6885:b0:a36:6c85:5192 with SMTP id n5-20020a170906688500b00a366c855192mr4250154ejr.10.1706818237865;
        Thu, 01 Feb 2024 12:10:37 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCU/aiVLZfl+v3XVmPtSFJoyU31TVDBb54EN5HF1Yg0afTFSuYX+2b2I01dFjM7Wnkym5ZvWwK5GsIAieyPM+htMgaJk2lFw9b/YOtUt3Gm44lQ=
Received: from ?IPV6:2a01:c23:bcb7:3100:59fd:7b30:8e23:b0ac? (dynamic-2a01-0c23-bcb7-3100-59fd-7b30-8e23-b0ac.c23.pool.telefonica.de. [2a01:c23:bcb7:3100:59fd:7b30:8e23:b0ac])
        by smtp.googlemail.com with ESMTPSA id cb11-20020a170906a44b00b00a349318ea10sm114415ejb.199.2024.02.01.12.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 12:10:37 -0800 (PST)
Message-ID: <da8e59b4-8871-4734-ae42-ba024be364d3@gmail.com>
Date: Thu, 1 Feb 2024 21:10:38 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/5] i2c: i801: Add helper i801_check_and_clear_pec_error
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

Avoid code duplication and factor out checking and clearing PEC error
bit to new helper i801_check_and_clear_pec_error().

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 38 ++++++++++++++++++++++-------------
 1 file changed, 24 insertions(+), 14 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 44ae6326d..156bace92 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -328,11 +328,27 @@ MODULE_PARM_DESC(disable_features, "Disable selected driver features:\n"
 	"\t\t  0x10  don't use interrupts\n"
 	"\t\t  0x20  disable SMBus Host Notify ");
 
+static int i801_check_and_clear_pec_error(struct i801_priv *priv)
+{
+	u8 status;
+
+	if (!(priv->features & FEATURE_SMBUS_PEC))
+		return 0;
+
+	status = inb_p(SMBAUXSTS(priv)) & SMBAUXSTS_CRCE;
+	if (status) {
+		outb_p(status, SMBAUXSTS(priv));
+		return -EBADMSG;
+	}
+
+	return 0;
+}
+
 /* Make sure the SMBus host is ready to start transmitting.
    Return 0 if it is, -EBUSY if it is not. */
 static int i801_check_pre(struct i801_priv *priv)
 {
-	int status;
+	int status, result;
 
 	status = inb_p(SMBHSTSTS(priv));
 	if (status & SMBHSTSTS_HOST_BUSY) {
@@ -353,13 +369,9 @@ static int i801_check_pre(struct i801_priv *priv)
 	 * the hardware was already in this state when the driver
 	 * started.
 	 */
-	if (priv->features & FEATURE_SMBUS_PEC) {
-		status = inb_p(SMBAUXSTS(priv)) & SMBAUXSTS_CRCE;
-		if (status) {
-			pci_dbg(priv->pci_dev, "Clearing aux status flags (%02x)\n", status);
-			outb_p(status, SMBAUXSTS(priv));
-		}
-	}
+	result = i801_check_and_clear_pec_error(priv);
+	if (result)
+		pci_dbg(priv->pci_dev, "Clearing aux status flag CRCE\n");
 
 	return 0;
 }
@@ -408,14 +420,12 @@ static int i801_check_post(struct i801_priv *priv, int status)
 		 * bit is harmless as long as it's cleared before
 		 * the next operation.
 		 */
-		if ((priv->features & FEATURE_SMBUS_PEC) &&
-		    (inb_p(SMBAUXSTS(priv)) & SMBAUXSTS_CRCE)) {
-			outb_p(SMBAUXSTS_CRCE, SMBAUXSTS(priv));
-			result = -EBADMSG;
-			dev_dbg(&priv->pci_dev->dev, "PEC error\n");
+		result = i801_check_and_clear_pec_error(priv);
+		if (result) {
+			pci_dbg(priv->pci_dev, "PEC error\n");
 		} else {
 			result = -ENXIO;
-			dev_dbg(&priv->pci_dev->dev, "No response\n");
+			pci_dbg(priv->pci_dev, "No response\n");
 		}
 	}
 	if (status & SMBHSTSTS_BUS_ERR) {
-- 
2.43.0



