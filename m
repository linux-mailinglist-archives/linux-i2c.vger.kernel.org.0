Return-Path: <linux-i2c+bounces-4505-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3641991CD8A
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2024 16:09:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A08301F22051
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2024 14:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E63E3BBC1;
	Sat, 29 Jun 2024 14:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAZERnbu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DA029429;
	Sat, 29 Jun 2024 14:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719670184; cv=none; b=qfcfqy09qZwJAAw90fg4S4GrnjHzz2GS2j/14eK0FlsXXcf+Ymn2u9JA1dsBnbqwS0gjLAjPwOF5F7nHieIbuLHdEoVtTM+dyX3o/DaO/Ji/Sw6soBbuaOqCTaW9dKCUU1d+Na+PMeRm8NZaUuf8RFRYs5rVz+ZEw7JsB4IK4og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719670184; c=relaxed/simple;
	bh=qidqv+3+yc4iAU/4uTFwaHupGUAA32Klrwo7vaMgXCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P/6KBDM5ZAkncFm3BE+dNopNYdm2mDi7ix/IjQ+HdOeCnre2Hi4KEd5PXjnsx7QJ2/x7JaMeHs6GxT+1IRT9BGDy0hYoDLM2iocDo0F66+uLXhYBfZbsG7/QHfBQhjVGrwt1zOQj4UCH2XZRK32RNs9pivj9ZsqaJcsWL84wvxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nAZERnbu; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-706a4a04891so1072993b3a.3;
        Sat, 29 Jun 2024 07:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719670182; x=1720274982; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Uc/shT8LqLSzfQOGIW8uApf23cdrjjd3SgxuZNz1P6U=;
        b=nAZERnbuCNBQU3JGMA8As9xA+uLAVqL6ogcHXO/GVByuE3I+uY5zKPV79V3uywkU7Y
         Cx5vY+JtE6ARJY9m/vdjUNyABinJuVtc+olEMkp5WcSjZYaZjrL/M8r2P7YQmzE79DMr
         WvmUrQ9uhx0rRB6k4P4gNxONutvXpDoRxdgfzvCLehUOzGgl5w1vWXYAcvJI8qoIMncR
         KinhLMLJ8cgdWVZPMHvCeZQz5k71IxpJfKbU8u+bYYaCF7jRlFXowXa4tBIpEgLEj43+
         xS0ks6s0PQ08IapImx1ncMHSOzs9kpHfbI8kXOVDNBTxr8yd8OQY4TzFwtK948oKFzqV
         nOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719670182; x=1720274982;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uc/shT8LqLSzfQOGIW8uApf23cdrjjd3SgxuZNz1P6U=;
        b=TSEKjp2wTgRD20JNg8KKAz6vJ9GesLZzwFSHqmwUHmRPiK18WmJgCl7RsWLnZCxGpt
         /I0X1yseItNywjzNBDoDIUrWtCwoD9KF3RsEA5sF2hhcZqub0XttIE+SGAh/tVSnlQVS
         4aPLmE+/HgTeUvL5LBlfEpWCL22nGgwSCVJawj2zMTrORy+01p5bbiT9tXPlJ/ucw/L1
         EjzR555wruw1M+LE3OMYPjxHnqW6qGzMjklDqiq5UtJ7SH5ULUA3l/Dd6daIypGp49gX
         3jZDLgudEgaCafIev6tNxectRpgqNukP9mTojJmMrORwcxAn2BFwHQDFtjDP2ZwsGIyC
         D9tQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHcXwJQ/K5/5x7o7yokPOBUcFVg8VAByuTceF+hB6zlp0yk075RVTfRl44CNqdVKKtTG4Dospg7CnedpvElLajwVQA3/1oU5qTRx8onOG5tcQo7xbnb8FIumFlWszaRoW7L1uUxLpA
X-Gm-Message-State: AOJu0YxyPDVw2/JCo7XbXyc3ld+RyR61QZrYr5DWJkSzo1cnDJj6QJDs
	/IgCGHRG2rGY8nSxDBGG7BYQgYbRE1F6hiX/hXP0t61F+kY0WIgG
X-Google-Smtp-Source: AGHT+IGrZaLDg45Wz9YLM8sohVKuta+tS9lS0SVQ6ZuHKOCq4WCAkkurVVSVn8iKUTbcNeH9+tA3nw==
X-Received: by 2002:a05:6a20:7f9f:b0:1bd:1ab1:e90c with SMTP id adf61e73a8af0-1bef6138c16mr1168998637.15.1719670181515;
        Sat, 29 Jun 2024 07:09:41 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10d1b56sm32618615ad.41.2024.06.29.07.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 07:09:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <094fad89-b5b9-4dc3-975d-13a841e212ae@roeck-us.net>
Date: Sat, 29 Jun 2024 07:09:39 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] i2c: piix4: Register SPDs
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
References: <20240627-piix4-spd-v2-0-617ce47b8ff4@weissschuh.net>
 <20240627-piix4-spd-v2-4-617ce47b8ff4@weissschuh.net>
 <2bbdb1bd-ea4d-4c14-9ea7-9fce09ac76b7@roeck-us.net>
 <afd11870-eab1-4b90-9b81-2a7c84be46e5@t-8ch.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <afd11870-eab1-4b90-9b81-2a7c84be46e5@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/29/24 00:19, Thomas Weißschuh wrote:
> On 2024-06-28 16:09:09+0000, Guenter Roeck wrote:
>> On 6/27/24 10:48, Thomas Weißschuh wrote:
>>> The piix4 I2C bus can carry SPDs, register them if present.
>>> Only look on bus 0, as this is where the SPDs seem to be located.
>>>
>>> Only the first 8 slots are supported. If the system has more,
>>> then these will not be visible.
>>>
>>> The AUX bus can not be probed as on some platforms it reports all
>>> devices present and all reads return "0".
>>> This would allow the ee1004 to be probed incorrectly.
>>
>> Was this reported somewhere ? I don't see it happen on any of my systems
>> (of course that doesn't really mean anything).
> 
> It happened on one of the big server systems I tested on.
> 

>>> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
>>
>> Reviewed-and-tested-by: Guenter Roeck <linux@roeck-us.net>
> 
> Thanks!
> 
> FYI, combined tags are discouraged by
> Documentation/process/maintainer-tip.rst:
> 
>    Please do not use combined tags, e.g. ``Reported-and-tested-by``, as
>    they just complicate automated extraction of tags.
> 
> I'll add the tags in split form to the patch.
> 

NP with me. though strictly speaking that only applies to the tip tree.
I started using it after someone else asked for it, but I don't like it
too much anyway. Combining it was an attempt to avoid the "please
combine ..." feedback ;-).

On a side note, I also applied the other three patches, but I am not sure
if that counts as "Tested", so I didn't send a tag for those.

Thanks,
Guenter


