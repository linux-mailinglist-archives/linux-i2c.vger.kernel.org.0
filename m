Return-Path: <linux-i2c+bounces-1936-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D548B860B2D
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 08:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 802B72863D0
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 07:11:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4CB912E6F;
	Fri, 23 Feb 2024 07:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hh73C0Vv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BDB125A3
	for <linux-i2c@vger.kernel.org>; Fri, 23 Feb 2024 07:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708672271; cv=none; b=SHjYLV6JzA9+9/PkI1vJSukBD2CA5zeple3ZxtAkzyrvxm6ExTcn+F7i9DE0zHBMorRqCEOtP0ELUXkxTjPQQGVqA+S6Z0txtqaJji3v5F7V3Gc38c31HmF1dSOozkzDV48wgcuUYIMUVN+I16Ps8OWGMzDQKMmfbpm0v8lFE3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708672271; c=relaxed/simple;
	bh=YliwFBMJF4zkCiyflNotemaQorgRQ/dTRkNV5rddX7E=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=B/5R8+hn179Y1UXzmeFiz2E4KXw9oL6ErIWDlvE5wKouwj8s2gc4Dlj9qu9TXAqpagl93YscDvSA4AGMRKpPRaewJFG3UiaFtDctl9WQrzLfEIthJmoxyiE6ItXvJr2/rNvMWVyP7nCbvVgPeWSmVaKjKh0m9IIFu5YuTeEByaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hh73C0Vv; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a293f2280c7so8958766b.1
        for <linux-i2c@vger.kernel.org>; Thu, 22 Feb 2024 23:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708672268; x=1709277068; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gNorqfPz48n2gSgfDLTXPuvOl++yE6JTbsDUr7tGReY=;
        b=Hh73C0VvJQpkhZih2FbJXWaSRmMAwEPm13FaKbeEMtB4OpAK7gCmkhxManVqs13F1f
         wcVczl983/1WvJlZgtitCclmnj+yFL3WPCbfhbXKV2W+G0h2RpmN3/EYFKMVUSjEgrVT
         7oYF0CuZF7WSwfhwDU/rOWiFss2ngocP0pZ6BHSp4Xes7fsV3vKNKFOlshLr9Kam8f6Y
         e1P60iG9Mkyy/qcrfAs1cxZNS8qb7Vq9pGaqcp/43WB/8ToBVdRRGxTwzLoEbp/vqpP4
         9O+8EasIKPureYPzdIVYsN24arwbOH0jamIc6RzANypIZjtV4QBwNPJIZHkjVFnom1Ea
         cV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708672268; x=1709277068;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gNorqfPz48n2gSgfDLTXPuvOl++yE6JTbsDUr7tGReY=;
        b=f1A3u4+w7oPLwnKB/LHC/64fgjjXur//813P3cASluE2hp9lgSQAkyyV0RV7v0v6Hm
         mli0GTd0pLKHMSxSA/f2DI3RWO6KRotl2395cXkea09WTI+aqE7vIZY4wZKGxt8wghTB
         1aScwjh1ofjj5zXbndIjMnApTNzypPVx1SmOrA5/EUKjhJq5o3UafhNnA9KrOobyvsKl
         Rhs3rOid9AVX7qSQfj/eb0wvvRqs/vJLlSNmthNMx9UqDgu2F3Ad7Pfq36JjijQy6nr6
         My1O1SQ/KRo7fHVwxcyMh1nnZZm7o7KYlUvbldsLWeUFkTYbVIT5iftevHOGCDjz0pOP
         pM/A==
X-Gm-Message-State: AOJu0YwHnpICA7ULLp4lI0CzhsfCDgGspTOc9CXrf4g0oVIGL2YQbZJH
	+868xgWulYO4c/bjONzWLebdzbIHJdNR846iO3YGI7uiXOQhJ5HRh1lIUs3T
X-Google-Smtp-Source: AGHT+IE7NUpgL4HaR+LTsXUyh2mcQb62PftkPZmOKgN1LJiEjVYuQ3+qBqrSYlFV0sC5fP9CD8UCjw==
X-Received: by 2002:a17:906:6dc4:b0:a3f:d026:b05a with SMTP id j4-20020a1709066dc400b00a3fd026b05amr343301ejt.47.1708672267929;
        Thu, 22 Feb 2024 23:11:07 -0800 (PST)
Received: from ?IPV6:2a01:c23:c403:8000:4442:2b24:9c18:44ef? (dynamic-2a01-0c23-c403-8000-4442-2b24-9c18-44ef.c23.pool.telefonica.de. [2a01:c23:c403:8000:4442:2b24:9c18:44ef])
        by smtp.googlemail.com with ESMTPSA id ll5-20020a170907190500b00a3f2a25d84csm2483214ejc.41.2024.02.22.23.11.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 23:11:07 -0800 (PST)
Message-ID: <39f39c4e-b997-4698-8406-4d514a530d0d@gmail.com>
Date: Fri, 23 Feb 2024 08:11:10 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] i2c: i801: Avoid potential double call to
 gpiod_remove_lookup_table
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

If registering the platform device fails, the lookup table is
removed in the error path. On module removal we would try to
remove the lookup table again. Fix this by leaving it to
i801_del_mux() to clean up.

Fixes: d308dfbf62ef ("i2c: mux/i801: Switch to use descriptor passing")
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/busses/i2c-i801.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 4b9d04f20..223cd2b84 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1457,10 +1457,8 @@ static void i801_add_mux(struct i801_priv *priv)
 	priv->mux_pdev = platform_device_register_data(dev, "i2c-mux-gpio",
 				PLATFORM_DEVID_NONE, &gpio_data,
 				sizeof(struct i2c_mux_gpio_platform_data));
-	if (IS_ERR(priv->mux_pdev)) {
-		gpiod_remove_lookup_table(lookup);
+	if (IS_ERR(priv->mux_pdev))
 		dev_err(dev, "Failed to register i2c-mux-gpio device\n");
-	}
 }
 
 static void i801_del_mux(struct i801_priv *priv)
-- 
2.43.2


