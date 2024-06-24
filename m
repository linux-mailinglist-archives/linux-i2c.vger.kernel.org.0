Return-Path: <linux-i2c+bounces-4307-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B6ACF915121
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 16:58:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DCED281F23
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 14:58:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C758019DF6B;
	Mon, 24 Jun 2024 14:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mC0eodYs"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971AF19D076;
	Mon, 24 Jun 2024 14:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719240878; cv=none; b=pDyU/5xYNaF4FxHZe61+95TPV56qrEPm18y0M6sG1BHGlmotL8PxXxCQnBX3aqGafWyScUJb5wFYEph2hR1h5+4fuXMnL7BjYE71RMDoLgOZVC3VNEjs9zgpi7oNuyKjG/Ll46FzyClwx/uE9RHy4+wG7J1nKohm25a4uiDYtuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719240878; c=relaxed/simple;
	bh=ubszA2T2ZnmWVLrWo+0kXAjH8JDUBjcrYhRXfOviaig=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g/m43YlHCdboVh5DBkQLMklTdHTvy/pVbfyhTKB+d/OruWKbl8unuxLS4qROK7lsZW4kp+sGdwfZs3wM2zJeCBUemEevin+WUwtSW6q80F0CQSKTt2UiA53WD4A0BInlI4W7hED1ZFN/SRAxXWOjCXMaN2fiNtBzD5qmX4smknA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mC0eodYs; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70670188420so1286081b3a.2;
        Mon, 24 Jun 2024 07:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719240876; x=1719845676; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=i15gCCRMxT+T7KuN9icAKmkZQ5Qch5YOTU0YhUcQzQ4=;
        b=mC0eodYs22JXGhOpdugMw5M7EgJHmsrgDh2qyz1ivJ3U/wYcwtbtaPizOM46CXLzIh
         IbomF0K3Ky1DhPr1tC+jm1txcI7rmAoN8gE7cojRr5su0sVqFvXC5Anz/MGA0uMCpCdq
         YwDTmOWTlQC3mVxCaJzusyBUiBdJ8jf3BcCslp2XSV+LH9Gkh1C9tdsfRQMhBenOg3pv
         g+MqbaW+uXwnrjbmEEeWl/9s8s2KSBqoVrKWWDe4xguOo8jOIsaxZ+jZr2gU9p6irPMr
         tz+NL4PqiefoYLDg443hz5aUX3rHWmAhCqyDrpSmhjcXlJlgeRMGhwe0NLEUhtKqephK
         TyCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719240876; x=1719845676;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i15gCCRMxT+T7KuN9icAKmkZQ5Qch5YOTU0YhUcQzQ4=;
        b=hAQKngHE6AkNIk+ajqNAk6TCrXZqPHiGJy7AI5JbU5BjcfL3QQSifjTC0RqFMj9ift
         2nWGlCmm4oUUI4ETqY1wbKbRoco6brOR/RbclOWgopAWhD1gfm9DYhOJ9ypkl008yYi+
         mP9kfA3Pzv16r6sHL2SkJtVCgbHWkfGGF7C6YAVsWnNY4ukUQlrXjFmvo1y6LQSlAYW2
         gDAMRXqPnWbVqt04Rh5nrmMG3neBrLDzjjZYMtRfnAj4EhYQ+yjynGNdhuiCKFC3fyiw
         BsBhm+Qtixl9frIrw8MqenhR2RnWgEcQ/Ly+FpoyLRQr2vB1ny1okZ5gIsdI5Edbzv7T
         pJHg==
X-Forwarded-Encrypted: i=1; AJvYcCVT5+j96BxZPviWCwujBwJHWAKpBM5P5r2mwhHWJ3QjjKShB222WmSwiwTfTrYqFkLm7AEsrICW/wlklbGjhxtYf/D52hHlWHP9DYFikby4cVC/Et3Ts2iHHoC7/htdlDAzRr9WHbUFSnnTrln1XYxtBu4Bjg4AV7oWTXJo5ARUhRSqsOc=
X-Gm-Message-State: AOJu0Yzxs5DpWDQMhZO/o9/50+yYqvDVkiw9oTGgXUi/92lIxJADxyCw
	t7WWgxgMs7PcpcSNhgycmMCxOy+Ys3mXvC+h4o7sRoDS11k59kAp
X-Google-Smtp-Source: AGHT+IEtJApU60aOHaKwRbwHhBMnYjNjJ0Ai6pHfnroeneE/qvGUTu2NwzDIv4qQbKZpaQGoYC2Yaw==
X-Received: by 2002:a05:6a00:6ca3:b0:706:89cb:6f97 with SMTP id d2e1a72fcca58-70689cb73c8mr2031657b3a.5.1719240875673;
        Mon, 24 Jun 2024 07:54:35 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70676011861sm2992969b3a.131.2024.06.24.07.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 07:54:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <97c497ae-44f7-4cec-b7d9-f639e4597571@roeck-us.net>
Date: Mon, 24 Jun 2024 07:54:32 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression caused by "eeprom: at24: Probe for DDR3 thermal sensor
 in the SPD case" - "sysfs: cannot create duplicate filename"
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
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <77c1b740-9e6d-40f7-83f0-9a949366f1c9@ans.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/24/24 01:38, Krzysztof Olędzki wrote:
> On 23.06.2024 at 22:33, Guenter Roeck wrote:
>> On 6/23/24 11:47, Krzysztof Olędzki wrote:
>>> Hi,
>>>
>>> After upgrading kernel to Linux 6.6.34 on one of my systems, I noticed "sysfs: cannot create duplicate filename" and i2c registration errors in dmesg, please see below.
>>>
>>> This seems to be related to https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.6.y&id=4d5ace787273cb159bfdcf1c523df957938b3e42 - reverting the change fixes the problem.
>>>
>>> Note that jc42 devices are registered correctly and work with and without the change.
>>>
>>
>> My guess is that the devices are fist instantiated through the jc42
>> driver's _detect function and then again from the at24 driver.
>> The at24 driver should possibly call i2c_new_scanned_device() instead
>> of i2c_new_client_device() to only instantiate the device if it wasn't
>> already instantiated.
> 
> i2c_new_scanned_device() also calls i2c_default_probe() at the end (unless
> different probe is provided) which seems risky given the comment that explains
> that it would use quick write for that address. However, maybe it is safe in this case?
> I wish we had a way to just tell "no probing is needed".
> 

Sorry, I don't understand why it would be less risky to just probe the device
without such a test.

> We also know the exact address so no scanning is needed.
> 
> Perhaps it would be better to just call i2c_check_addr_busy() in
> at24_probe_temp_sensor()?
> 
> Something like this:
> --- a/drivers/misc/eeprom/at24.c	2024-06-24 09:16:11.251855130 +0200
> +++ b/drivers/misc/eeprom/at24.c	2024-06-24 09:27:01.158170725 +0200
> @@ -603,6 +603,10 @@
>   
>   	info.addr = 0x18 | (client->addr & 7);
>   
> +	/* The device may be already instantiated through the jc42 driver */
> +	if (i2c_check_addr_busy(client->adapter, info.addr))
> +		return;
> +
>   	i2c_new_client_device(client->adapter, &info);
>   }
> 
> Unfortunately, i2c_check_addr_busy is not exported and declared as static,

That is why I did not suggest that.

> I assume intentionally? Unless this can be changed, we are back to the original
> recommendation:
> 
> --- a/drivers/misc/eeprom/at24.c	2024-06-24 09:16:11.251855130 +0200
> +++ b/drivers/misc/eeprom/at24.c	2024-06-24 10:25:39.142567472 +0200
> @@ -585,6 +585,7 @@
>   {
>   	struct at24_data *at24 = i2c_get_clientdata(client);
>   	struct i2c_board_info info = { .type = "jc42" };
> +	unsigned short addr_list[] = { 0, I2C_CLIENT_END };
>   	int ret;
>   	u8 val;
>   
> @@ -601,9 +602,10 @@
>   	if (ret || !(val & BIT(7)))
>   		return;
>   
> -	info.addr = 0x18 | (client->addr & 7);
> +	addr_list[0] = 0x18 | (client->addr & 7);
>   
> -	i2c_new_client_device(client->adapter, &info);
> +	/* The device may be already instantiated through the jc42 driver */
> +	i2c_new_scanned_device(client->adapter, &info, addr_list, NULL);
>   }
>   
>   static int at24_probe(struct i2c_client *client)
> 
> For now compile-tested only given the write-test concern above.
> 

The device detect code in the i2c core does that same write-test that you
are concerned about.

> That said, I have some follow-up questions:
> 
> 1. if the jc42 driver handles this already, I wonder what's the point of adding
> at24_probe_temp_sensor()? Is there a situation where it would not do it properly?
> Or do we expect to remove the probing functionally from jc42.c?
> 

The jc42 driver is not auto-loaded. When suggesting to remove the "probing
functionally", I assume you mean to remove its detect function. That would only
work if SPD EEPROMs were only connected to I2C adapters calling i2c_register_spd(),
and if the systems with those adapters would support DMI.

In v6.9, i2c_register_spd() is only called from the i801 driver (Intel systems).
In v6.11, piix4 (AMD) will be added. Even after that, all non-Intel / non-AMD systems
would no longer be able to support jc42 compatible chips by just loading the jc42
driver. That would not be acceptable.

> 2. I don't understand why we are also getting the "Failed creating jc42" and
> "sysfs: cannot create duplicate filename" errors since i2c_new_client_device() calls
> i2c_check_addr_busy() on its own and should abort after the first error message?
> 

The "Failed creating" message is from the i2c core's detect function which
is only called if a new i2c adapter is added. This is actually the case here,
since the call sequence of the backtrace includes i801_probe(). It looks like
i2c_detect() runs asynchronously and doesn't protect itself against having
devices added to a bus while it is running on that same bus. That is just
a guess, though - I have not tried to verify it.

That does suggest, though, that even your suggested code above might not
completely fix the problem. It may be necessary to call i2c_lock_bus()
or similar from i2c_new_scanned_device() and i2c_detect(), but I don't know
if that is save, sufficient, or even possible.

> 3. (unrelated but found while looking at the code) The comment for
> delete_device_store() seems to be outdated as it mentions i2c_sysfs_new_device
> which does not exist any longer, as it was renamed in
> "i2c: core: Use DEVICE_ATTR_*() helper macros" back in 2019:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/i2c/i2c-core-base.c?id=54a19fd4a6402ef47fce5c3a5374c71f52373c40 -
> 
> For the Greg's question if it is also in 6.9: I have not tested that kernel yet,
> but unless there have been some recent changes in the i2c code I would expect
> it should behave the same way. If required, I should be able to do this next week.
> 
Agreed.

Guenter


