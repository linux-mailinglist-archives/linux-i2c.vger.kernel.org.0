Return-Path: <linux-i2c+bounces-4322-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A1D915D70
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 05:45:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E6BA1F22663
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jun 2024 03:45:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 849EE32C85;
	Tue, 25 Jun 2024 03:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J2zgq7/9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D272F56;
	Tue, 25 Jun 2024 03:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719287134; cv=none; b=U0TLlLA01tEAqwYVs+nXRQ5KBbYe2S18uO9Sqwgpv5hkxRfqPmo/YQfWZfh5a5IAP9tEWNDnQJJuA7ks53v7pl+mrpfpAOYeFvuv79KSVcQYyaltvUqy48QuXZqM6m4kNQeL8gbJqN8cz6vZmmjQKtgbAhK9Y2stj50YTUq/4N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719287134; c=relaxed/simple;
	bh=akYYhE64gutriQphsCYtrgVyTh52zZni47qVxMnregk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BZGqWVOWE963zIn+m2xbJrWgUHyCa+qcCaq3M+PXPo1tvbI9dU7CW10wWm7LQSk9Zo9vVWcQgEx8HW5EfF71UECSze85RO/431QD0s6KSFRJ6Yd7mv36p+xnE0L3AAhD83Kf4AJKMv7GeevrW7bkJADfYACaYSCPBBbabejLZJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J2zgq7/9; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5b97a071c92so2427577eaf.1;
        Mon, 24 Jun 2024 20:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719287131; x=1719891931; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=nAGv1C3HZZdBM5385FH4CpehIrO1aLyESVw6wair3LM=;
        b=J2zgq7/9MdKLzYoCpX+qXzPRUHUAl2Awhaw4UtIBzs5Trx+uO/879y1qsXg1zIVe8I
         vunZVkEaKQTzXznZV481ZnbVQ5XV6OA831rrnZnWBcR7X/Z+cCkgbxMgsl6qAl0/xPyv
         u5/yheEI2L5I+RseFBUo/+Kfas9ei8lNkX1pKp6GpEDEiEtd3wDCZg3k9aY2C3T2ah9Z
         HVXWDvHXy+Xgzu0Rhzym173M5nL3PxmHN5MFt1jHwd28T25rkPCh1AU/HzIIQlhVTZX1
         hTlx213zFlIDSstsPAOwNRL3GJ9DMHNgYcR+oJ1H4oBxAgSZVuw7yVJzU5mffde9s8Y4
         XMJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719287131; x=1719891931;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nAGv1C3HZZdBM5385FH4CpehIrO1aLyESVw6wair3LM=;
        b=gH6wHAbpyz0RJlRF9nwLNMhGxNaxLCRepzHaqd7JYVqmxMxMixuETiJYY7Qpx6YjY0
         E519YmG8yWXiz+DCM5B6/d3E+4NB9Bpi7Do3rPCmzj2lPx4ibYHiYj9DRn97YFarmo/R
         46C0z+0KtLy/lKP97ugsvqUws/F3suL5IGxxin4YvPgWRsmQh9wQ7dteu+eidk4c8Zys
         jjdYahl9g5F9V60p1HN2dlzU8TqjHk1xbO4iEsAtUqK8o59dmtIp4Jz7P1uwDVKggLVl
         45qSHKrDTLI0w12wJZDwAlT6NARLtp/fmAjl19BirQMHCD2Cuc1reC6W99inc1P+3qiI
         VFgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNQpEu+cx4wj0MhG3DvzAVwBi7qCYCNgkq2PU8R8H0rYnOxvF9RrTBxQ/EBZbuFGmaxyh+N3lS+dIbSTy8k7BX0LJQeXCxov01s42hfdgC6OCryi41cGnqr0+JQXZW+oSpzy4WzHJFbEn/9ikypiZUMIsiqQ3BeUZe0mmjcVXLjnm6gcs=
X-Gm-Message-State: AOJu0YyAFfj0XtWHjmKGFevFuJ0P1m4MSMj4isKNOHLxx7RIqqLCNXSJ
	KupjxXlEhkmDci6/qVCG6bGC7lUWUb4KnJzUvKPkvTuhghJ1ilSs
X-Google-Smtp-Source: AGHT+IFuMpIiyI/ambneXj2V/8PhRkYWS8YSC9Jtn9HUyffHKT4WhBv98Y8lT8RDDOn1kRo/O911/g==
X-Received: by 2002:a05:6358:2823:b0:1a1:c5c6:9da6 with SMTP id e5c5f4694b2df-1a2389a5d8dmr871908455d.3.1719287131313;
        Mon, 24 Jun 2024 20:45:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-716ba5b5f7asm6051573a12.64.2024.06.24.20.45.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 20:45:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5a4e1cd6-5770-423b-9a25-a0fbfd93014a@roeck-us.net>
Date: Mon, 24 Jun 2024 20:45:27 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression caused by "eeprom: at24: Probe for DDR3 thermal sensor
 in the SPD case" - "sysfs: cannot create duplicate filename"
To: Heiner Kallweit <hkallweit1@gmail.com>, =?UTF-8?Q?Krzysztof_Ol=C4=99dzki?=
 <ole@ans.pl>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
 <797c8371-dff3-4112-9733-4d3119670dbf@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <797c8371-dff3-4112-9733-4d3119670dbf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/24/24 13:58, Heiner Kallweit wrote:
[ ... ]
> 
> Too me the issue also looks like a race. According to the OP's logs:
> - jc42 at 0x18 is instantiated successfully
> - jc42 at 0x19 returns -EBUSY. This is what is expected if the device
>    has been instantiated otherwise already.
> - jc42 at 0x1a returns -EEXIST. Here two instantiations of the the same
>    device seem to collide.
> - jc42 at 0x1b returns -EBUSY, like at 0x19.
> 
> So it looks like referenced change isn't wrong, but reveals an
> underlying issue with device instantiation races.

It isn't just a race, though. Try to unload the at24 (or ee1004 driver
for DDR4) and load it again, and you'll see the -EBUSY errors. Problem
is that instantiating those drivers _always_ triggers the call to
i2c_new_client_device() even if the jc42 device is already instantiated.
Unloading the spd/eeprom driver doesn't unload the jc42 driver,
so -EBUSY will be seen if the spd/eeprom driver is loaded again.

I have not been able to reproduce the backtrace with my systems, but those
are all with AMD CPUs using the piix4 driver, so timing is likely different.
Another difference is that my systems (with DDR4) use the ee1004 driver.
That driver instantiates the jc42 devices under a driver lock, so it is
guaranteed that a single instantiation doesn't interfere with other
instantiations running in parallel.

Guenter


