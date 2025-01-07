Return-Path: <linux-i2c+bounces-8952-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E783A04AF0
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 21:24:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E49091885A60
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2025 20:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0BF41F4735;
	Tue,  7 Jan 2025 20:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fuisAbzQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CC91F63EA
	for <linux-i2c@vger.kernel.org>; Tue,  7 Jan 2025 20:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736281474; cv=none; b=dbpJDI/I+s01An206wO2YP+8smGf/DGvZoTrjpIv6UYOmvYRNR+An8Si/zmWGs3sMV/ypuB+AIybiP5KEiy7vaHMFwpBXPFbCaZdnAMTCE/oA9HI1oaG2VVNiAbv3iAgzRz4oK0DaL/B6htRY4tW1AvSEvAikuvLjkbdpx1P7wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736281474; c=relaxed/simple;
	bh=aOqbDJRoCwikGBgixHiZRExGVu5rSkeY8hGq629ui+U=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=ukGA3VthM1+PvuJww0H9WnkBEYTN9yG46+AVui0W1SzwE0l6n59QmdVvN0unwJ21hkPVbMcw/0R4I8gDMdXJWPz6WmjN89/goRBW8LR2s90AQ/QP5Ykwo1jNQqjxwbIg9Kcw6tDoTsOtYuvRqDo+GGGZoCtXZN92A4n1TUGGJZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fuisAbzQ; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aaef00ab172so1831172866b.3
        for <linux-i2c@vger.kernel.org>; Tue, 07 Jan 2025 12:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736281471; x=1736886271; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+tHDWFAPTGj7RED9GGmz3UZZAIXKNVYfpitnJIGBGh8=;
        b=fuisAbzQrtqigHOB7aMjAaFnIfOQEWGSYAPC5e6Z5N3gqkh62X6wrYgKjVZazqkPDy
         69Mni8K+yg2O64BppR4I7/F4sPbqCz6C581g+ePXTMS+x2GKQ5xbyZ1VpZoQnozK+Sfa
         EevbRdtSZqz82cCY8cfekYUtFg2xuFDfSS29c3vFOBUgaMEOIEQCRxs+5nda3grTOPgr
         wBz8TJYrw8sygPGXiuWuu2WkluqllgQZX/MmDkbSwGcPZMeIaDzOqCq4zlRb4vghMLuz
         N+T1WYhYL8O+uvgPUC3J93/kzMl7mOHyar5PHhd8Gh/7RTL+vDeM6CMzKEeCdEitfzbE
         wjFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736281471; x=1736886271;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+tHDWFAPTGj7RED9GGmz3UZZAIXKNVYfpitnJIGBGh8=;
        b=hKx6NY33goZZl25zhY7RhKGB8T3gaBEBOp2+N4OzelsC4+PK04DrdQOSYJromzjh33
         oqRGWc6KBM2ntVlMcmkw5rp3WKgWgQgz7WN3297lHEr7ZIL0eWokg+FkJ173F3duCqvs
         C056yeLrPtSFzqMqWNoeDhEIp4Q8nA4PjjBWqRhqzEWfNkha4Jz4WHqd/9UXqMs103Fu
         5huEdEA0BTfyHNqG6+LnVJ6IzXPUFGSUgSyXA4B9d9Le9+mY0yqU/nEfV4StPng0l7i5
         9W+nLiQ7HhT1xwQ1t53KbeixHQCmeY63LFmkJJHGCYbyHPc7Pnlee3LyZKzPM4mXPjoe
         zOJA==
X-Gm-Message-State: AOJu0YxWLjhAUE97ODaibH+28rWE67q4xtbUffzkVdP3EoEPPt7key5O
	c5mGopJwCH4xm8rR5ZEo4bOz6b1H1kuVpCoDxi1XvEftrK4Cr69XenIoag==
X-Gm-Gg: ASbGncskvOJjUEWRAVNzAQiUXTx3B6t9ne6HBZrwnYncREAAj2imt/AwMLZOzMz1xt+
	eJZImrr7eaTp1TdV+Hj5T5KOckFBSuFIQk80D3oRxW5KvlrJjfsT9vPxCyKvAD3lEqX4uQk2eMZ
	oLmV+3pD8R8x9vNA9zDXJNHibODvK4xPeANYXbSJ6oEHpyKG7UgrvIUxWuC9d86lzrlxIj51hdm
	VHeRgEMRpSFsbqpp2o+cGehSBEGkt1GHWZdzMhshmhGNF9rDA6L1QKmOgLJsIG2HZvMhOgLvcov
	2lRS317UhItyi+4/kVP6nhoY1WWdQKCkQfnBxrbg4ypTEufueyY/xb4GQcmjLiY04zIV97NVGX3
	/GEPUoEGDVsvUArifcRj/YF3+aPn+/ZEA9z3724E/i3smbGap
X-Google-Smtp-Source: AGHT+IFhLs/WlV9/lp4mcHoifTa/vueV5mFJkSXK8rMp4y/NdMWWi/p8Q+Muf35XsBWedISXvt1uAQ==
X-Received: by 2002:a05:6402:35ca:b0:5d0:d818:559d with SMTP id 4fb4d7f45d1cf-5d972e0b954mr458206a12.11.1736281470966;
        Tue, 07 Jan 2025 12:24:30 -0800 (PST)
Received: from ?IPV6:2a02:3100:a00f:1000:a57d:a6cf:6f93:badf? (dynamic-2a02-3100-a00f-1000-a57d-a6cf-6f93-badf.310.pool.telefonica.de. [2a02:3100:a00f:1000:a57d:a6cf:6f93:badf])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aac0e830b2dsm2408998466b.8.2025.01.07.12.24.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 12:24:30 -0800 (PST)
Message-ID: <29ff7e5a-fea6-4e2a-9bf1-baa69d77821c@gmail.com>
Date: Tue, 7 Jan 2025 21:24:29 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Wolfram Sang <wsa@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: core: Allocate temp client on the stack in i2c_detect
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The temp client is used only in scope of this function, so there's no
benefit in dynamic allocation.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/i2c-core-base.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index c21a16aa9..39de0e485 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -2461,7 +2461,7 @@ static int i2c_detect_address(struct i2c_client *temp_client,
 static int i2c_detect(struct i2c_adapter *adapter, struct i2c_driver *driver)
 {
 	const unsigned short *address_list;
-	struct i2c_client *temp_client;
+	struct i2c_client temp_client;
 	int i, err = 0;
 
 	address_list = driver->address_list;
@@ -2482,22 +2482,19 @@ static int i2c_detect(struct i2c_adapter *adapter, struct i2c_driver *driver)
 		return 0;
 
 	/* Set up a temporary client to help detect callback */
-	temp_client = kzalloc(sizeof(struct i2c_client), GFP_KERNEL);
-	if (!temp_client)
-		return -ENOMEM;
-	temp_client->adapter = adapter;
+	memset(&temp_client, 0, sizeof(temp_client));
+	temp_client.adapter = adapter;
 
 	for (i = 0; address_list[i] != I2C_CLIENT_END; i += 1) {
 		dev_dbg(&adapter->dev,
 			"found normal entry for adapter %d, addr 0x%02x\n",
 			i2c_adapter_id(adapter), address_list[i]);
-		temp_client->addr = address_list[i];
-		err = i2c_detect_address(temp_client, driver);
+		temp_client.addr = address_list[i];
+		err = i2c_detect_address(&temp_client, driver);
 		if (unlikely(err))
 			break;
 	}
 
-	kfree(temp_client);
 	return err;
 }
 
-- 
2.47.1


