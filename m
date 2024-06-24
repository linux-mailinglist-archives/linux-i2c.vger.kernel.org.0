Return-Path: <linux-i2c+bounces-4310-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBA7915399
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 18:25:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF7F21C20859
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 16:25:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E730719DFB0;
	Mon, 24 Jun 2024 16:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IfNlybxC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1823C3BBEA;
	Mon, 24 Jun 2024 16:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719246240; cv=none; b=pAPaLg8A6SaIoGgHl8QJYj9F13Q1T+Rd+Igeqq30KUDClfwnPHIDbT/nnJwVk2ELwqAccwx3m7noFWssqvl84nfbYALRgZXKvk2cPu/0C/eBVEu18m5MJIdizKdnmRijX09eM9Flx2SBVyuqoeq4HuSxtq/vSd5f7O5dy/vCNd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719246240; c=relaxed/simple;
	bh=+eBIeVrIJD++n/NSAuh6WeP3yslrINZ6lCOQeUUBoFk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=nSu9V+lalmuO/EmxzfnnGKUZeRTAco70taAkhVKpDHR4UmNx2r64H5aXuIrKiOoc/WkbStCCNPncd6kVEt3cjmLbzwyNZxQojDfAc2isnOVzomqt1SLqEHBx94Y00fXpZY7aYEQSjHIPFqlQPfJrPwAIol+xHhDNTXn7nq2D1yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IfNlybxC; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7066f68e22cso1303337b3a.2;
        Mon, 24 Jun 2024 09:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719246238; x=1719851038; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=1ybx5MVtGZCgmx+dK4yMNsCUvY5sltUR+PwrGVhhEgM=;
        b=IfNlybxC0YDJ5LWs4CHsFuO7bGV2f1WYSFr+x1nWcyUWXvI7LgAGleSxtsvN5vTPZH
         AtM4eyc7O2vu8D5GXcmGNjCatNBxGzuZnJQjbTH5OhABP9oNzJTrdfMDmF5LH1fLTUit
         4X5q3S7IUtfe7CiiqOkyMTmZSpc/I8Qn9iHMF62gGJUMTKY6hNYKRE13DlE46teSLAEp
         z+WAiygy1XK3trZ9cQplggnIj5FPgqTENWKUaAR6IEUrd3lGI8mehQgaPw9xajsgLNot
         y28NPtBdRl1uGEaYbACdYU/EyKZfQ2GA4RqqlteNMDqXpigx9Udf7WJ9X6/LnYQKRzIS
         jgvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719246238; x=1719851038;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1ybx5MVtGZCgmx+dK4yMNsCUvY5sltUR+PwrGVhhEgM=;
        b=E5QNaxQ7lehH56oJFdXVnpjxYoPWNynTszfByrTbfIVTXGRuC3aSNx5ypi8gRjlyH6
         qZ1Y+6Zp+6hu8dEpxU6zrMFV81DPWi+T0Ql31Gdkrxb7zP58hpj5M2PH/xD9Xvih18vq
         s/UPgvPJ/D66CMq5KniiDBE4eWJl1s3nCEq5fHdEUN+SBHhz4H4+0wwbci8xY3tpmSK+
         RhPuar2ndEFJszfo7a/QxEGv+uqbi2rG5TOQKjaVSYyZdkniUWQkvp4mFO9DEMG35agV
         kkYC5a+yL2eiJ18niEJCRbEF8NY/7cW7a80Xi9/Uew+bbd1yBPU83OCZyU11Hl9OEuLe
         EddA==
X-Forwarded-Encrypted: i=1; AJvYcCWxfpNmwieS6NyaNvZzOoYKuiEC3gz87+neU0U81z+4HzNN+mZRpBS0EGDwttSlpg7Kub//BYw2RTElvkpmhU2fLFI3dqhjV2najL/YRo3K54nTzplQNznHgNWKo/5x+W/fNOl96+OP+hKZs1/4r7IXV2ppQJP/hIsAFK7v4/WLh0Fn6ZM=
X-Gm-Message-State: AOJu0Yz8WHu1vOpAaiwnFmU8lAeVu1bxrvCLCWYNxXhi2vU68R+OvhBR
	2DgLe12orpvphifpsk3u6dGaJaPO45LXeR5ynKrahyIlhwd/CPgW
X-Google-Smtp-Source: AGHT+IFX94My+LC6fNixecp3qCmDOgpw+PEJqo1lUdHYT1eKEYptlfQ10u0p3FSBrcbqQ7KjfYJL/A==
X-Received: by 2002:a05:6a00:2d9:b0:705:e5da:8290 with SMTP id d2e1a72fcca58-70670fd5feamr5565778b3a.24.1719246238164;
        Mon, 24 Jun 2024 09:23:58 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70672f89fc0sm3505903b3a.85.2024.06.24.09.23.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 09:23:57 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f91aee3c-9a24-4f4b-aa03-1707283512a0@roeck-us.net>
Date: Mon, 24 Jun 2024 09:23:55 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression caused by "eeprom: at24: Probe for DDR3 thermal sensor
 in the SPD case" - "sysfs: cannot create duplicate filename"
From: Guenter Roeck <linux@roeck-us.net>
To: =?UTF-8?Q?Krzysztof_Ol=C4=99dzki?= <ole@ans.pl>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Wolfram Sang <wsa@the-dreams.de>
Cc: stable@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-hwmon@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <a57e9a39-13ce-4e4d-a7a1-c591f6b4ac65@ans.pl>
 <0dfa2919-98eb-4433-acb4-aa1830787c9b@roeck-us.net>
 <77c1b740-9e6d-40f7-83f0-9a949366f1c9@ans.pl>
 <97c497ae-44f7-4cec-b7d9-f639e4597571@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <97c497ae-44f7-4cec-b7d9-f639e4597571@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/24 07:54, Guenter Roeck wrote:
[ ... ]

>> That said, I have some follow-up questions:
>>
>> 1. if the jc42 driver handles this already, I wonder what's the point of adding
>> at24_probe_temp_sensor()? Is there a situation where it would not do it properly?
>> Or do we expect to remove the probing functionally from jc42.c?
>>
> 
> The jc42 driver is not auto-loaded. When suggesting to remove the "probing
> functionally", I assume you mean to remove its detect function. That would only
> work if SPD EEPROMs were only connected to I2C adapters calling i2c_register_spd(),
> and if the systems with those adapters would support DMI.
> 
> In v6.9, i2c_register_spd() is only called from the i801 driver (Intel systems).
> In v6.11, piix4 (AMD) will be added. Even after that, all non-Intel / non-AMD systems
> would no longer be able to support jc42 compatible chips by just loading the jc42
> driver. That would not be acceptable.
> 

There is another reason to not remove the detect function, one that I just found in
my system when I tried to reproduce the problem: While SPD data is supposed to identify
if a DIMM supports a temperature sensor, this is not always the case. The DIMMs
in one of my systems (F4-3200C14-16GTZSW) do support temperature sensors, but the
respective bit in the SPD data is not set. From raw SPD data:

000000 23 10 0c 02 85 21 00 08 00 40 00 03 09 03 00 00
                                                  ^^
Bit 7 is supposed to be set but isn't.

This means that the thermal sensors on the DIMMs in my system would not be instantiated
without detect function and require manual instantiation.

Guenter


