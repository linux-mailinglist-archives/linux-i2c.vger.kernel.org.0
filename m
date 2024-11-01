Return-Path: <linux-i2c+bounces-7736-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7661C9B9AA2
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 23:07:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08DF21F216A8
	for <lists+linux-i2c@lfdr.de>; Fri,  1 Nov 2024 22:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D67E1E32A4;
	Fri,  1 Nov 2024 22:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbhRH8lc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BCF140E34;
	Fri,  1 Nov 2024 22:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730498840; cv=none; b=AQLa8sV0LDnBvS5xCUTukrVHD7EiJD7254gncjKpyxFCex1HIUedbuRcW4AIV9+qVWQhb/M8nQcjyEXjmzw31B/vz7cFV8cYS71Xd0tc1H8EJLhxHPHXP8P9Go6Q1lnKpkz+uKSJi7fwSaDK5YRrnJjWsuDNnWeXgXRf4/tbUCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730498840; c=relaxed/simple;
	bh=baZnBNj4NAOv0aRBf2Iwb8WvUzZyOXbN4wXex4xp3I4=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Nv+V7GaNp1qj/oyn//tC74P/areYR/aJTRuPAb8Y6EnaSVgKjp9AnIMmQS+RpLbvZ5SdhHHSGpFeXSETBgOAbYuoy7YQdeySWhp1cBzYLEtY0F2Xny6zlAAWxFFdrIbGO7u4iQmd2BlQNaVV1MxccS+b1PmYPmX9AJQ3bWAc4RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HbhRH8lc; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5c9850ae22eso3144892a12.3;
        Fri, 01 Nov 2024 15:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730498837; x=1731103637; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iUYaJD8ZOyiRWQdQoggrKZqhdcuq4HjGmlFr5/3nZX0=;
        b=HbhRH8lc0X/wmuky0bH03D3nEFCGJjkiQMIF6uYKK38xBonsBTSYZdxe648ypRZhOB
         j6MJq3rImis91jsKXp4/4Y1Y6sakQTFYGxapiD5McmfhmYO70mQGlrawhfBfiIgoKaA0
         Zyv2gJyVBm7MZWs6X2K85IfirHYrOvfmRrGLDq19wXKrFue8a509O+cNzAgpp41FNi4U
         lSqpV5J9lWOMnvkrYL+1t4w3llLCN22NjWmwneSdnEvinuG6DI3vXwfE7gLlDeAMi3IN
         vyAhNCTNVtAufh2LO8zvmDQzznOVCVuW3QNUg1q79JaCxvCZkcWjy/RGnRZnjLY30BiN
         IfNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730498837; x=1731103637;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iUYaJD8ZOyiRWQdQoggrKZqhdcuq4HjGmlFr5/3nZX0=;
        b=UkFNRaWEGCiBPtEAwunPTVBlygDvpAvK549Xw7fp3Sxbl9k8LdT0TnV2oEnW+SDQuX
         oE4mCYzPx58bS3fPtJWxWaYe6VNdqacAay9IK311vVHhB5EZwWLQ9buMXm292TTOoZ/0
         YkAmCaG0asFbVTIbXtEffbCzjVG7xXaUTJM8UV+NGmuOe9xJdWkNKnKMkIq0WRMTF/4a
         2X3q+4t/SCQmT2zaP3VNR7VFFxdrbIoj56lcdi4kTNO2VLbwcHnoV4vMz21lJnBLZrEY
         KF3XFDe/A7gSgm1NgTbErg+cMjtdbNGfcMRhnA8hQXTghHuG7/KKHjrABByNamSo4me+
         4+9Q==
X-Forwarded-Encrypted: i=1; AJvYcCURI8MxXlW4OLaSKHAyV77V7tSySG9ziFEqWz4QRyKB8zXhZbIsvidi0X5zQ1eqzXOXqs+wgqMMs44Xyw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMiljc+jcMCnqFlk7Yucg5roohabYTjKxP5CPI1QTEykijR5sb
	+sV49evsCe85OIQwZ4yvzDEE0YtkYlRkJjohj/Gvqtrr6lczldSt
X-Google-Smtp-Source: AGHT+IGTzoinwAs0HB2KaUy8Q2PVuipe+af5VzWpZIvD/NAtYiXQ5uXiuWi4rui0BjYfffh0SlFfLQ==
X-Received: by 2002:a17:907:1b84:b0:a99:e4a2:1cda with SMTP id a640c23a62f3a-a9de632d08dmr1514977466b.56.1730498836625;
        Fri, 01 Nov 2024 15:07:16 -0700 (PDT)
Received: from ?IPV6:2a02:3100:9dbc:bd00:c5db:e5ed:512d:1904? (dynamic-2a02-3100-9dbc-bd00-c5db-e5ed-512d-1904.310.pool.telefonica.de. [2a02:3100:9dbc:bd00:c5db:e5ed:512d:1904])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a9e564c4fafsm231646866b.47.2024.11.01.15.07.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 15:07:15 -0700 (PDT)
Message-ID: <7f8156b6-b4fd-44f2-915a-5519f780bfdd@gmail.com>
Date: Fri, 1 Nov 2024 23:07:14 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 1/4] ALSA: ppc: Remove i2c client removal hack
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 linux-sound@vger.kernel.org
References: <97970201-24fd-473d-b20a-d21d2cd468f3@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <97970201-24fd-473d-b20a-d21d2cd468f3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The i2c_driver.clients list is internal to I2C core and is going
to be removed.  No driver should access it. Unregister the
i2c client explicitly before deleting the i2c driver.

Reviewed-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 sound/ppc/keywest.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/sound/ppc/keywest.c b/sound/ppc/keywest.c
index 3d3513d9d..4ce81ac7f 100644
--- a/sound/ppc/keywest.c
+++ b/sound/ppc/keywest.c
@@ -61,12 +61,6 @@ static int keywest_attach_adapter(struct i2c_adapter *adapter)
 		return -ENODEV;
 	}
 	
-	/*
-	 * Let i2c-core delete that device on driver removal.
-	 * This is safe because i2c-core holds the core_lock mutex for us.
-	 */
-	list_add_tail(&keywest_ctx->client->detected,
-		      &to_i2c_driver(keywest_ctx->client->dev.driver)->clients);
 	return 0;
 }
 
@@ -99,6 +93,7 @@ static struct i2c_driver keywest_driver = {
 void snd_pmac_keywest_cleanup(struct pmac_keywest *i2c)
 {
 	if (keywest_ctx && keywest_ctx == i2c) {
+		i2c_unregister_device(keywest_ctx->client);
 		i2c_del_driver(&keywest_driver);
 		keywest_ctx = NULL;
 	}
-- 
2.47.0



