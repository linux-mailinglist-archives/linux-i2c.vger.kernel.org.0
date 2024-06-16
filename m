Return-Path: <linux-i2c+bounces-4050-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 127A8909FB1
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Jun 2024 22:26:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A606A282957
	for <lists+linux-i2c@lfdr.de>; Sun, 16 Jun 2024 20:26:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45DCD5490F;
	Sun, 16 Jun 2024 20:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQdTJOcY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D0754660;
	Sun, 16 Jun 2024 20:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718569595; cv=none; b=Z9den03t2kuBMsH+BUSiNTdIHBlGg3vixkIP4e9Eza7us45VUGgjPnGHjVpzmOuqAm86fnx/2q9d4EI/RDZqyy5GfGasxslnF0WHSNh7JvZtwf5+Z6tPshFqyQ9ldJ6F/+xMesuwEI7W4EFQYX/mrPf5wSqx5X2fXUwaFX9cD4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718569595; c=relaxed/simple;
	bh=GxHq1I1yK4ushy+cbVDTnikWctzsVLN0jARxQzbhmAE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aAsWaAwl/33EKEXLxbb3qT5d7hkjJ+qpYIVOc1neCyoEIVa2/RifmakwQHCmrUn/f0AktJL74J7yUJY6L3bS9MsIk87IK8A3jlAyPApm5EELyiUQAGbCdmDd6GJuPAsnRWhNhQyQA3KPKpdT/miduYP3YbjA502wYJQKn9DdWCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQdTJOcY; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-707040e3017so717711a12.3;
        Sun, 16 Jun 2024 13:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718569592; x=1719174392; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=rzZNLXZyAad49lqyEMwbFZUTxKz2TWCABxME8TyuxUY=;
        b=UQdTJOcYuqZJ8PZxKWB89xAG2Qt7Wee05o8j1FWvPQjE+Pv8tYv8wc3nnTjIAvd4zv
         FgJ2XB3tHT+brw9L39Meo3B00CtuNWSWF5aDZZ89eiStmz4JbMrnwU7s2GUqe7ehJ+gQ
         2LKOqxnBiiWFaM/cC497aPs4RSMFKxQoXTPnRzuvW9QfA3bTjGvkXSCDyajp6iWU7E7Q
         zTb2SLz8X8UfJCYWrYenD6+KLXtWobR4XVmicqhqLUwij2AvH+F/aaLx3qPASEn/0t/D
         eEmk2Kc5T/CHHS9QHdrgEBMTCBYiqoeVN4P1wWbcJ09mLOGulNphgLnu80dOAOZzYmcM
         45ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718569592; x=1719174392;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rzZNLXZyAad49lqyEMwbFZUTxKz2TWCABxME8TyuxUY=;
        b=qmhluW2GyVomikbDn7dHQq1Nh4wnsGyOORHNiSt5n6Vg5NMVk+eoZbO1vwj/dhqVOP
         Kg3GNVKqvAEuS6VuD5ZtkG0I3/Zfq6WnIfGFlf1GWwTxD1/wd7PYBVLg9Pbdth5qIsHI
         rNguRKdlFhQw52f7i6miydKwn0uh99u7KVq76UTZzQQRMaUgLT5eDARyeEJGJECymay1
         JZ6EMXbiq8zya0nP5yLyRYDJJR5dA5qgzZuL07h2NzeGukNZiTh8ku6tha6G2ArYBKvB
         p+6hu/cFnVNNjGyT/YPFN6em/AsTeQ1ld1JcgVHY5zC7rqZeNo3HxkzD0VIPLD4dGkBx
         /K+w==
X-Forwarded-Encrypted: i=1; AJvYcCWhqHdnxG4A022HWZYRA7oGyWKZ2g9jSipAkRyPTtfon13iqQKzXf+XUMMveRX0UiBi8JNnpkQK+T4PGH5B47Tnoc8K4JdB4UN1VrFwi8mo8ql0gluFmArfI+6mpMpW/Pxjcdyh3Jh1+hg/w0EyVHZu3fxU7HWD4u8KF22XnE/Ce+uCuHun
X-Gm-Message-State: AOJu0YynFzdlQdR6YFZAuqgDQ2QN5wLS1+NBLH5ivShsmB0osiOyVlq4
	Vj7uYptYmhnF47Ryn7EdPgvUf/6VvMayS4ZB92sP9PF0oenQilKU
X-Google-Smtp-Source: AGHT+IEkv9TFVryZMuRXnrW9c7YuK4/7rSSgV4AcCArj1ccOtH/22/ytdQGihbdr31j/txPe/Mzfvw==
X-Received: by 2002:a17:902:c20c:b0:1f8:44f8:a366 with SMTP id d9443c01a7336-1f8627ce3dfmr74464955ad.16.1718569592414;
        Sun, 16 Jun 2024 13:26:32 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f855f1a4fdsm67179965ad.233.2024.06.16.13.26.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jun 2024 13:26:31 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d2ba6ed1-3a6a-4481-9f43-265eee78c0c1@roeck-us.net>
Date: Sun, 16 Jun 2024 13:26:29 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFT PATCH] hwmon: (spd5118) Add support for Renesas/ITD SPD5118
 hub controllers
To: Armin Wolf <W_Armin@gmx.de>, linux-hwmon@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactcode.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Stephen Horvath <s.horvath@outlook.com.au>,
 Paul Menzel <pmenzel@molgen.mpg.de>, Sasha Kozachuk <skozachuk@google.com>,
 John Hamrick <johnham@google.com>
References: <20240614185924.604672-1-linux@roeck-us.net>
 <2046d2c3-bbf6-4842-bc51-b2f567f33c0a@gmx.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <2046d2c3-bbf6-4842-bc51-b2f567f33c0a@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Armin,

On 6/16/24 11:09, Armin Wolf wrote:
> Am 14.06.24 um 20:59 schrieb Guenter Roeck:
> 
>> The SPD5118 specification says, in its documentation of the page bits
>> in the MR11 register:
>>
>> "
>> This register only applies to non-volatile memory (1024) Bytes) access of
>> SPD5 Hub device.
>> For volatile memory access, this register must be programmed to '000'.
>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>> "
>>
>> Renesas/ITD SPD5118 hub controllers take this literally and disable access
>> to volatile memory if the page selected in MR11 is != 0. Since the BIOS or
>> ROMMON will access the non-volatile memory and likely select a page != 0,
>> this means that the driver will not instantiate since it can not identify
>> the chip. Even if the driver instantiates, access to volatile registers
>> is blocked after a nvram read operation which selects a page other than 0.
>>
>> To solve the problem, add initialization code to select page 0 during
>> probe. Before doing that, use basic validation to ensure that this is
>> really a SPD5118 device and not some random EEPROM. Explicitly select
>> page 0 when accessing the volatile register space, and protect volatile
>> register access against nvmem access using the device mutex.
> 
> Hi,
> 
> maybe we can use struct regmap_range_cfg so the paged register accesses are being
> done by the regmap code itself?
> 

In theory that might work, but regmap does not permit a selector register to
be part of another range. The first range would be the non-volatile registers,
and the selector register is part of that for all ranges.

I tried the following ranges configuration.

static const struct regmap_range_cfg spd5118_regmap_range_cfg[] = {
         {
         .selector_reg     = SPD5118_REG_I2C_LEGACY_MODE,
         .selector_mask    = SPD5118_LEGACY_PAGE_MASK,
         .selector_shift   = 0,
         .window_start     = 0,
         .window_len       = SPD5118_PAGE_SIZE,
         .range_min        = 0,
         .range_max        = SPD5118_PAGE_SIZE - 1,
         },
         {
         .selector_reg     = SPD5118_REG_I2C_LEGACY_MODE,
         .selector_mask    = SPD5118_LEGACY_PAGE_MASK,
         .selector_shift   = 0,
         .window_start     = SPD5118_PAGE_SIZE,
         .window_len       = SPD5118_PAGE_SIZE,
         .range_min        = SPD5118_PAGE_SIZE,
         .range_max        = 9 * SPD5118_PAGE_SIZE - 1,
         },
};

This results in

spd5118 0-0050: Range 0: selector for 1 in window
spd5118 0-0050: error -EINVAL: regmap init failed

If you have an idea how to configure the ranges differently,
please let me know.

Thanks,
Guenter


