Return-Path: <linux-i2c+bounces-5702-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BDB95BF16
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 21:47:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA763B2116A
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Aug 2024 19:47:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C381D0492;
	Thu, 22 Aug 2024 19:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XSvgCjUY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7BF7CF16;
	Thu, 22 Aug 2024 19:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724356041; cv=none; b=hYTR6UEIb3G45Ca0YEIWcLmrsVmaza9VH5PDNhxQghzEDjTj4xbd0F8tiplMZUTZHVhqeY1AjjfI/T8nykvJQA8Iqkd0UMsWrRP3V8e1QYUrMFlhjj0VADV4vAuNkVxgcF3vJOBWDEpd0tgZOSu7jJtOPMADft+cl6q14rsWuhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724356041; c=relaxed/simple;
	bh=95M2pYBv8kJ4XtKvQd2P3AMbUptJ33Vh+TVHfgXrg68=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HXA0BpqgeaNQeaVDlxrCqPXJBSAoDAShB+j8RZwO+ubxYgPWOhddBvRUs6a15Oz+UJ3ZpoI5lPSNvte/xVSFZw9PKLfvIyiclYectLtDfytz39VSBHpFVy0shw93hLxeJmygu26lhE1axf9FhzjwEAnNhQk+WdYtWsNSycbCGi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XSvgCjUY; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a86933829dcso135829166b.3;
        Thu, 22 Aug 2024 12:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724356038; x=1724960838; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OS5hdBLMjeepQt5jihnSH9xs/IrBga29YUL1v7SAGNc=;
        b=XSvgCjUYJz4cthHKz7doKSZF8ieDbqjnzWhzWXFuYM9iLs9RmIAvIqkDtwbv7lF7CD
         7jd3GmDd7CALnlDo8HqaUXnATyuIp7yBQEEYIFduAB1IBPV7st6TWWYND8K8dIKHZ6FQ
         k86UlnTJ0B86EkrWiMKyNXnUkedAeNcGytYgBZwD4fWgRUMjrLIwZr6HKk7+JgxiMsdd
         fu9foKPmxvAPqJyezNIsTJktjTD4GQBwEYUavpe41LdnhVZQAPkPVSPr73Zgetif6Uqf
         NlPSdHfHyaop2pRQ7VvX4TGN5c+NB2Feq6uUQJBL7nErEuGfWMEC2UyMFIFnx82kXi9y
         5HrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724356038; x=1724960838;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OS5hdBLMjeepQt5jihnSH9xs/IrBga29YUL1v7SAGNc=;
        b=vUNh3aDzdlpkKY2/+hwEiltrXBUQ45PnfsJi9fdIepVIz5iPF6c2iPQtHO/4tXvH/K
         o3KoLqs7+2NIxpeqANWvsYfpra1vmsXhvMHSD/FJ7bCL/5udgi8EkFCD+DxOftlxnpNF
         G9zGsqLvC6bzda5ldwxndX7XiWSNqm33ab8FS164Lkiz+uQhgAkJazhhvagrEAHAnJbJ
         b9CZYYqzQ6PXEN400YCc404/nQzOpOBYp94K0GGKrl3giviltU9FtvqwECAgzFBJacqP
         r6yZJOAnWTdIenhMLxSS2M06mgmM9et9uX9xX9gd8P/jPHWt+uG6K4KZaQLWV1GJf5jd
         Drug==
X-Forwarded-Encrypted: i=1; AJvYcCXtpz2mOIVcbZppVFVs8NHqvRzFHF8qnuWwXmOyzc7RX6ZDimqe62Hko4i5O7JPSSkkM6cky3AhaHLfwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz77XyS8ebLggmGPQ70hQ6PiU+laQInluH/RlHiSp0qLUqdweLD
	cZCG4AkY5CLORhqZsEy/jggb2lzy3eyw7KLIvB/x7Ca0f36RYGaTqUUFrJGP
X-Google-Smtp-Source: AGHT+IFkOFckROnQ8nohuFVtnc9HBTBh5gL1t6YK4Yzlk/RQpMT85RjX6YbvzaHX3RY2qObbJi1+Qw==
X-Received: by 2002:a17:907:1b1a:b0:a80:f6a0:9c3c with SMTP id a640c23a62f3a-a866ee6448bmr501012066b.0.1724356037805;
        Thu, 22 Aug 2024 12:47:17 -0700 (PDT)
Received: from ?IPV6:2a02:3100:9dc4:2200:e9ea:53e6:39db:eab3? (dynamic-2a02-3100-9dc4-2200-e9ea-53e6-39db-eab3.310.pool.telefonica.de. [2a02:3100:9dc4:2200:e9ea:53e6:39db:eab3])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a868f4f41edsm156428266b.199.2024.08.22.12.47.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 12:47:17 -0700 (PDT)
Message-ID: <55cab333-c9ca-4edd-a002-1e2b650a9f5a@gmail.com>
Date: Thu, 22 Aug 2024 21:47:18 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 1/4] ALSA: ppc: Remove i2c client removal hack
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 linux-sound@vger.kernel.org
References: <3982b2a6-975e-40d2-bf02-2155e5c36c14@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <3982b2a6-975e-40d2-bf02-2155e5c36c14@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The i2c_driver.clients list is internal to I2C core and is going
to be removed.  No driver should access it. Unregister the
i2c client explicitly before deleting the i2c driver.

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
2.46.0



