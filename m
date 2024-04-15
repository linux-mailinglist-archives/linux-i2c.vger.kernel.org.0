Return-Path: <linux-i2c+bounces-2944-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C72D78A5C64
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 22:47:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D0C501C22224
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Apr 2024 20:47:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 959EA15688F;
	Mon, 15 Apr 2024 20:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7y91YoZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E592E8593F;
	Mon, 15 Apr 2024 20:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713214029; cv=none; b=X3kTnwrLQaNRqyk0fSo3oUefacBFJVZRtzlYrpcnY+SEmspdc6j262nxcbbEh1nNUgmSqmxP5ZwKVEu9ScYVMsvXhy3xbIB745+SNLnikbGU66Zuv6lvS0q0d/Uj5Ew9zuxoBpGVFtCwQBWI+NK4vRYPiaBskcnEGbJJoIssq0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713214029; c=relaxed/simple;
	bh=rKQxqiOc24yAqZ8+WV4C807wrnLvAlxgII/T2xlkmxo=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=e7ekdJ60fjnJeHPhYSkGeprRgwIJdIqOxkrZqaz+7u5nRXBGzWreqO+QTYCAltBvaj2ZcUIkh3tEBqYY6QbAh1sysfj8Ml7bsAc/9jcgq9Fb3FuUB/Ud9x8wTkwVIyw1Zk7n9oYZ9reBOEKnPIBl4LkKAmJrqr6GA/yAwa2QLp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7y91YoZ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5176f217b7bso6345135e87.0;
        Mon, 15 Apr 2024 13:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713214026; x=1713818826; darn=vger.kernel.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqIpRwfBXkboOTjdLwcXtzjuj+hvC7wTERgvCChos8I=;
        b=F7y91YoZ+2LRIYCJdQz16UP3MNAk4q5Q29+ohV6i9aCbRNj+Gw5RNIylhkALLL7M37
         Eifbw5TBQDqV6h3Vw7YjWEmtmGh9pdo3l0h2o8CGuqy4K7Sy0t3UcKZl27OOAt0q5cNm
         0hzAyACOcek6EWAwSVufdjemrWFTiyzW8LJRUIkAyW+QxJBiZ03scEi0N7ElS9bRqnmb
         5qOTkbN7XwMikabysbJkuV9lkV2OWhgW+NzmlOaHEfFeSaoleo65jeh0hFdikRjwywIL
         ws2eN7UAgItFsYpp/j5+IqMTXQZQVHw4DYTuF8yAXBStYzPzLjhEh4u3dmx1LTOaNwyY
         qusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713214026; x=1713818826;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nqIpRwfBXkboOTjdLwcXtzjuj+hvC7wTERgvCChos8I=;
        b=mjMyRI8PJYYlgOnv22dFf3siRuZchj83UocxyNobNtIeEV9F45qhNClW6nGd1amJ3W
         LUqxfXWAtJFTuBZ/Yps9GWRNYiDug4HSTY3R9WXHIhddAimP2vObrR43OUgG92+/spmf
         b3G4rfxanQudT7ZnQZAIlnl/glqPwMZRr7oc5dPWkHRZFuxFseuzFFT4dPoCv6IOHk7e
         IgqllKYcOLDv26bxrXWTlNwdCjbl6P2NJGtBgIvIhaxxEyWob5ShPh/cFOSWkjJ1bTh2
         8GwfOsOVVmY328qvDuyiEql4UaWxj76Fj+WpusMq+Cm+wC4oxxZpb1nNNcIZeFIg7yFh
         WJsA==
X-Forwarded-Encrypted: i=1; AJvYcCXGp/jm2wPOioimhD0oRsiqsjuVyxlA/IQlRgl53b8YxWdOXvZT9ZojMbapmZCe8L+GbYt7WT7gOsm1TV7ldDbwpQNjjEvaK2Qt2yA=
X-Gm-Message-State: AOJu0YwNRex13wk7QZp4jfz5QqDfGMMyefP6+1O12MLTuKZD/ZxJeer2
	Dl9Wh8/96UaL5R0rsr8WZ2Ug/V4zVfvAyF9pcYM0g7M2bahNAdNT
X-Google-Smtp-Source: AGHT+IGr5+7YY0V743DEnriHeie/y3xoiv8dwGsfi77gJg4AI9czgRYnZ4GUJJRb8c6DRs2u9y386A==
X-Received: by 2002:a19:381c:0:b0:518:ed96:6b12 with SMTP id f28-20020a19381c000000b00518ed966b12mr2534238lfa.61.1713214025876;
        Mon, 15 Apr 2024 13:47:05 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6fba:a100:5c1:bdd1:c074:ea9f? (dynamic-2a01-0c22-6fba-a100-05c1-bdd1-c074-ea9f.c22.pool.telefonica.de. [2a01:c22:6fba:a100:5c1:bdd1:c074:ea9f])
        by smtp.googlemail.com with ESMTPSA id m19-20020a17090679d300b00a4e03c28fd5sm5929136ejo.43.2024.04.15.13.47.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Apr 2024 13:47:05 -0700 (PDT)
Message-ID: <90a0786f-136b-4097-9def-8d52e9e5d3cc@gmail.com>
Date: Mon, 15 Apr 2024 22:47:04 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Wolfram Sang <wsa@the-dreams.de>, Peter Korsgaard
 <peter.korsgaard@barco.com>, Peter Rosin <peda@axentia.se>,
 Guenter Roeck <linux@roeck-us.net>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH 0/4] i2c: Remove I2C_CLASS_SPD
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Only remaining client driver supporting I2C_CLASS_SPD is jc42. This
type of thermal sensor can be found on several DDR3/DDR4 modules.
i2c_register_spd() instantiates also such thermal sensor i2c devices.
Since 71b494e043d2 ("i2c: i801: Call i2c_register_spd for muxed child
segments") i2c_register_spd() is called also for the remaining use case,
systems with muxed SMBUS segments for SPD EEPROMs. i801 was the last
bus driver supporting I2C_CLASS_SPD.
Therefore I2C_CLASS_SPD class-based instantiation isn't needed any longer,
and we can remove it completely.

I propose to handle this series via the I2C tree.

Heiner Kallweit (4):
  i2c: i801: Remove usage of I2C_CLASS_SPD
  i2c: mux: gpio: remove support for class-based device instantiation
  hwmon: jc42: Remove I2C_CLASS_SPD support
  i2c: Remove I2C_CLASS_SPD

 drivers/hwmon/jc42.c                       | 2 +-
 drivers/i2c/busses/i2c-i801.c              | 4 ----
 drivers/i2c/muxes/i2c-mux-gpio.c           | 3 +--
 include/linux/i2c.h                        | 1 -
 include/linux/platform_data/i2c-mux-gpio.h | 2 --
 5 files changed, 2 insertions(+), 10 deletions(-)

-- 
2.44.0


