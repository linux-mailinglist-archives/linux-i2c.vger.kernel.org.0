Return-Path: <linux-i2c+bounces-2946-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEA68A5C6C
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 22:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCCC11C20F51
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 20:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90249156966;
	Mon, 15 Apr 2024 20:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gakCMFA3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50AB15688A;
	Mon, 15 Apr 2024 20:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713214127; cv=none; b=VIH1uLNnqTGvMVYeYT+SkNyk7LQkCoRJG94i/zL/caiG0mndKezpc/Ai5EfvSrs9FPkOfRiYMhfaXOIe2oTh+CyxWqdMxuQ9RudQJbbTFl76LPDUWb5rkGCoQJwya+OUixt39jSrRUe32xROEkrNpufIbN7C8X8wish9FGt1Q/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713214127; c=relaxed/simple;
	bh=E6k+7t2zK1hZ93mZ886ImpZZlWkQmDFiUMw7DfTqecY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=acuBXXlRFxpHjl0J+6qraQwl+i7zXahwUsCBqCf9jTgFOGv/IRvEpn3bYiRBSMUVa8P5339VyMnzdxnRUc9B+uf7GgbISIubdgVTLUUowTTJUOz2mgJzz2yBfpfE3Jf+LUC1C7pqLef9TaRtxMiqvMQgITVr/4uKIx2lECfLE08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gakCMFA3; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-56e78970853so7249025a12.0;
        Mon, 15 Apr 2024 13:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713214124; x=1713818924; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aUWZVs6B5B0Htbl4tJInfJJjBW57zG9RmY29XTSMOI0=;
        b=gakCMFA3AW52png2g4cwCSoN4fVPzKM7TX4347CPzuvGO2psiMTxeBW71debqWpB2b
         3RXAmQFEYAaYtLIVtNENvbWXRneCVkWWQbK7y3AOO8ic5Z9Xd8yFYNvLoJYc3yUtk4O5
         eR2VaCMk0HrtiJ8BFKDJ/NgOMtx6hcxYJVSnd0HYSkdW4yJAz+kD1Z0q9rn/uZQoHkbJ
         UP/sHs60e3X7ZTKT4l6aTZo3njaSLIWJW2COFkIaw25xcTJTeTaockUAjVlBbr8t7Qxi
         yUXFCkaL8GM3k3nBXsPNcGBa3odX4FifeYc4FGneYuGWj5LQoWrbVNH6akR1lCiWI5In
         H/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713214124; x=1713818924;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aUWZVs6B5B0Htbl4tJInfJJjBW57zG9RmY29XTSMOI0=;
        b=swK44iz3cAXzjKL3qfMbsyODgPuuLX9QJZTZx4IDNrsaiyRf1J1NkkLL2MzgSMbgz8
         DB8jr0+h2t1tI7zeDKP484nd4eFASZI7rAiDA14aADKNwXfoKaevcaWUswmwFg7wcwJi
         YQqlUIJiAf6wHclCNb9j5advXXtiMfm6BG7c7DneLOmXS2g3624EodcwDzxG36S7CMaw
         NJ+1AiGD8DM1wUT2+ave5rqCg7MRa83qKOWwlJDi0ZqS2adTYbBztZ8R8p+xRqA86dL2
         uGcmmxUQCF7cQUibeBR7y1um8OFJjOqBMEvPLETR2bCematfPVJ66nBR+CibfuL3cAp6
         V2pw==
X-Forwarded-Encrypted: i=1; AJvYcCUbLNmsaw0yCj4k6lDC4E+HY/HKZr/BEdKikPJKLowTM3B1QscexM49zhr+LnFxug+ZezCgEGnJP1MHlXPArqwoni1KK/xTBKD5Zrs=
X-Gm-Message-State: AOJu0Yzdps6mu1wLdAuvP9Onx3iLPM+RMDvItDKsz9lVRLvHxjZ23EqG
	OatTNEc/qaWxVNgddb/3ljFMopJ3T/VPZ0juwQEU6BV8Hm1NEfUnhN+ndw==
X-Google-Smtp-Source: AGHT+IHXMQjX4oIiK0fj2s8Utj9bGalht5nbd34CWd1ILPRnGJbQf9aEAS1tAh3GAJlYWrRQQYjIiQ==
X-Received: by 2002:a17:906:cb95:b0:a52:67cd:1a71 with SMTP id mf21-20020a170906cb9500b00a5267cd1a71mr513774ejb.28.1713214123748;
        Mon, 15 Apr 2024 13:48:43 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6fba:a100:5c1:bdd1:c074:ea9f? (dynamic-2a01-0c22-6fba-a100-05c1-bdd1-c074-ea9f.c22.pool.telefonica.de. [2a01:c22:6fba:a100:5c1:bdd1:c074:ea9f])
        by smtp.googlemail.com with ESMTPSA id x26-20020a170906b09a00b00a46caa13e67sm5860082ejy.105.2024.04.15.13.48.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 13:48:43 -0700 (PDT)
Message-ID: <309ce021-c7ae-4498-88db-37c06f7cc34d@gmail.com>
Date: Mon, 15 Apr 2024 22:48:42 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 2/4] i2c: mux: gpio: remove support for class-based device
 instantiation
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Wolfram Sang <wsa@the-dreams.de>, Peter Korsgaard
 <peter.korsgaard@barco.com>, Peter Rosin <peda@axentia.se>,
 Guenter Roeck <linux@roeck-us.net>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
References: <90a0786f-136b-4097-9def-8d52e9e5d3cc@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <90a0786f-136b-4097-9def-8d52e9e5d3cc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

i801 as only user of gpio i2c mux removed support for class-based device
instantiation on muxed busses. Class-based device instantiation is a
legacy mechanism and shouldn't be used in new code, therefore remove
support also here.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/i2c/muxes/i2c-mux-gpio.c           | 3 +--
 include/linux/platform_data/i2c-mux-gpio.h | 2 --
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/i2c/muxes/i2c-mux-gpio.c b/drivers/i2c/muxes/i2c-mux-gpio.c
index 6b979a0a6..0fbb33a3d 100644
--- a/drivers/i2c/muxes/i2c-mux-gpio.c
+++ b/drivers/i2c/muxes/i2c-mux-gpio.c
@@ -206,9 +206,8 @@ static int i2c_mux_gpio_probe(struct platform_device *pdev)
 
 	for (i = 0; i < mux->data.n_values; i++) {
 		u32 nr = mux->data.base_nr ? (mux->data.base_nr + i) : 0;
-		unsigned int class = mux->data.classes ? mux->data.classes[i] : 0;
 
-		ret = i2c_mux_add_adapter(muxc, nr, mux->data.values[i], class);
+		ret = i2c_mux_add_adapter(muxc, nr, mux->data.values[i], 0);
 		if (ret)
 			goto add_adapter_failed;
 	}
diff --git a/include/linux/platform_data/i2c-mux-gpio.h b/include/linux/platform_data/i2c-mux-gpio.h
index 5e4c2c272..816a4cd3c 100644
--- a/include/linux/platform_data/i2c-mux-gpio.h
+++ b/include/linux/platform_data/i2c-mux-gpio.h
@@ -18,7 +18,6 @@
  * @values: Array of bitmasks of GPIO settings (low/high) for each
  *	position
  * @n_values: Number of multiplexer positions (busses to instantiate)
- * @classes: Optional I2C auto-detection classes
  * @idle: Bitmask to write to MUX when idle or GPIO_I2CMUX_NO_IDLE if not used
  */
 struct i2c_mux_gpio_platform_data {
@@ -26,7 +25,6 @@ struct i2c_mux_gpio_platform_data {
 	int base_nr;
 	const unsigned *values;
 	int n_values;
-	const unsigned *classes;
 	unsigned idle;
 };
 
-- 
2.44.0



