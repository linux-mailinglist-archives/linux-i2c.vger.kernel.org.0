Return-Path: <linux-i2c+bounces-2119-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 420CB86F46E
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Mar 2024 11:41:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 700761C20D97
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Mar 2024 10:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E21D79F5;
	Sun,  3 Mar 2024 10:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V3lDqMHX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5A7B653
	for <linux-i2c@vger.kernel.org>; Sun,  3 Mar 2024 10:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709462509; cv=none; b=TLs1+870wVFWOHQUIP11bCs7gO2PW3W0jVRERCpAqYC1f6HUDYLj+lV5XEJ2qsFH8RDL2yOzrV43yipC2mwYaAYbZjNvBOlBgxW1at+gQ7rm1sGGqKsEkqchKNDE9SePbAPHkMJmnVJI+Ww71ORxog6smXFSScn+i7Ml8jp0QZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709462509; c=relaxed/simple;
	bh=KPzCYh2fKv69DPiXR/3zeAu/HDIBjv5Qk3PADwFfMmg=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=f/9ypyMxonx4A4mu/DipH/cVxpTLzR4GC0Cy6CvymDHy+nE+OToXKMrmUzYYP2VpQbkr9YBSZV7otiJi4OtZe1O9Q30BK8kBF46O5pkNHu1TnuGwsaL7crlv1sFzoVqErlqdhnhLwjnl1+SnXEGJqKc4DJhINmfKJeuZzbnlfxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V3lDqMHX; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-33e2268ed96so1533240f8f.3
        for <linux-i2c@vger.kernel.org>; Sun, 03 Mar 2024 02:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709462506; x=1710067306; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qF69gJSZVeaA5DDO/eCH4/kzm77b0C/vbT+1KUq97qo=;
        b=V3lDqMHXMX8IX/PDkS8nwlUzpkHi+GgCZS+2api0Erk/FfAkQLYPgZqX3sXh5JklKP
         ThyAQbU3PhXg3OZeMGOQw22qTY7mY2k7BxlZA3k6SLYhuaZcOxgDFWs05yiTf6fyEYJV
         BKUfm7Zhdk3q+ZCBXxNrni5Xj/t8r0KBVNIcjw/TgXxPB6OJBd6k2GSYtR5SXTbys3Te
         Iy1YbLt9cEbfZzgF6UEzB5lT6ajq8ClGVIR/5y19ns8WCcK2a1zWQ74ORpE+rbXB3bMw
         rgRi3MIuKvS0WZ8t6+0ncV4ujswNejNpss1Vm/Casn4bQIJChCkORoeezKV9zpHNoykL
         21jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709462506; x=1710067306;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qF69gJSZVeaA5DDO/eCH4/kzm77b0C/vbT+1KUq97qo=;
        b=gFK+4lJRATiMlbyGlh5Yorpo2JwckhE4mXgo0I6p3jiuLlPK0jb+NT8r2t+7LiKxk8
         2f54II/wilWl/O+aaMAIInhgxsmSZ9do3nJJ5I/H4qmUgTr3ir+eF1rQB/EwrEiDRIR3
         QteyJDGP1EAgchQ2YLrlkfBsK5Lb8c97uBKuMP6xR2mLW305RD9LwH0+ocDaqNjD48XB
         pWIdTBzLb75Yj5TEWvWSrv2hEa5DoAYNhbxFiRI8UZc77lUYyXYgRVbhSmChR79iYOx8
         E8S8OByKBiDtVdo9yRzqPNyBGlKfuTt4LZln86Ai4ADMnoGu+7UH+C69RxE2abwu/0pY
         J+pQ==
X-Gm-Message-State: AOJu0Yx5KBH5kLiTvf3wu9alzu3GdFdf6X2KnIoNvZ03rBEoK7QYmQz6
	bFn78yPrniVOAtXA5h/XdVMmpUrnE3+Byrv93PzgNDzooH1qB+L8
X-Google-Smtp-Source: AGHT+IGJSh0CI/C8o723ZPWCDulCb5z7K/l4VRFvgkfYUcq5sfOqLhZen0HcnWpoEbkwxVlgqF16kg==
X-Received: by 2002:a5d:4a88:0:b0:33d:354a:99a2 with SMTP id o8-20020a5d4a88000000b0033d354a99a2mr4734086wrq.4.1709462505379;
        Sun, 03 Mar 2024 02:41:45 -0800 (PST)
Received: from ?IPV6:2a01:c22:6e8f:5600:94da:8563:d193:d5c4? (dynamic-2a01-0c22-6e8f-5600-94da-8563-d193-d5c4.c22.pool.telefonica.de. [2a01:c22:6e8f:5600:94da:8563:d193:d5c4])
        by smtp.googlemail.com with ESMTPSA id i16-20020a5d55d0000000b0033cffd1a302sm9329135wrw.57.2024.03.03.02.41.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Mar 2024 02:41:45 -0800 (PST)
Message-ID: <5c8f5f27-9d81-46dd-92d3-d13478b4448b@gmail.com>
Date: Sun, 3 Mar 2024 11:41:44 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Wolfram Sang <wsa@kernel.org>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2] i2c: i801: Avoid potential double call to
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
Cc: stable@vger.kernel.org
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v2:
- cc stable
- free memory allocated for the lookup table
---
 drivers/i2c/busses/i2c-i801.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
index 291c609d1..9c624f31c 100644
--- a/drivers/i2c/busses/i2c-i801.c
+++ b/drivers/i2c/busses/i2c-i801.c
@@ -1428,7 +1428,6 @@ static void i801_add_mux(struct i801_priv *priv)
 		lookup->table[i] = GPIO_LOOKUP(mux_config->gpio_chip,
 					       mux_config->gpios[i], "mux", 0);
 	gpiod_add_lookup_table(lookup);
-	priv->lookup = lookup;
 
 	/*
 	 * Register the mux device, we use PLATFORM_DEVID_NONE here
@@ -1442,7 +1441,10 @@ static void i801_add_mux(struct i801_priv *priv)
 				sizeof(struct i2c_mux_gpio_platform_data));
 	if (IS_ERR(priv->mux_pdev)) {
 		gpiod_remove_lookup_table(lookup);
+		devm_kfree(dev, lookup);
 		dev_err(dev, "Failed to register i2c-mux-gpio device\n");
+	} else {
+		priv->lookup = lookup;
 	}
 }
 
-- 
2.44.0


