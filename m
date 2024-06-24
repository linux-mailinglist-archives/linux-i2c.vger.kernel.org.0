Return-Path: <linux-i2c+bounces-4320-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E33915861
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 22:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CDCEAB22251
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 20:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D641A073B;
	Mon, 24 Jun 2024 20:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RQLYbvOB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2F245010;
	Mon, 24 Jun 2024 20:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719262685; cv=none; b=purKF5xwz2MjRnL4G5FDjGXjEjvhRioT7ic5Vbhl1Jt5zdAi+GRgJedav0cnOjCdFfootqzTvzMv12lx67FxpAu9uW2F5n80KxHlUbthKubnRWvF8S8GtJJ5nhZOdHuNVpFe350wDMUmvW1WPvHz5yryl2AxJSOv54NOquevT24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719262685; c=relaxed/simple;
	bh=zj50skJPvJRf7JfXy6CIJbCp6EetG/W94ej3/nQ3+BE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ky5Q/ThHMDKCNq5E1zOUxopM8HWEsxfjmGPT/lSJozwMumMknaz7ZJIdZhl7oiiZ91nl6ZdXrHrf0YLry9WZJrY70LGpIRBu8fGxgxnesB3kn2ums64LbQo4eDgcrKwvDPXzBCr8Z9xg/9E1Aa4acA0FjjECTuVQ9gAn2aPiNj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RQLYbvOB; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a7252bfe773so171848366b.1;
        Mon, 24 Jun 2024 13:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719262682; x=1719867482; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4Ohnk9BHFu/EJmzXal9cNmUB7ZWVcATXjjC+GZKOHz4=;
        b=RQLYbvOBLnfZ6IoZbD0phB7Ewwz5/l0jizmYAj2Cb2zrKtAktqAx7BBqIa3zDA4h8a
         0t7C+K9fLR62hTAgFgF2BZNQny8UUDPwqhQ8cUX3C2b3gEHdcTwtQMNZKeB7eECV+WQz
         Grt/NvzS7UqVAfwX0/Tz/jyp25nWnkIMgsxS2QwUqSvnpTeVigxApxFD4CdYj/OcWkeM
         y1fAJEjIWaxBydMR0+INwGv2AEE2YIe3Igtk1bYzM5I1CKs23Lg0Mnq0gUVob1JyAi/s
         QEZ9xtj4a3JXUEPXi/I4poSkniwqI4MJBI8zYSjFvk/fyOOzvaiwNq2J7CuJjYl4z95g
         gRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719262682; x=1719867482;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Ohnk9BHFu/EJmzXal9cNmUB7ZWVcATXjjC+GZKOHz4=;
        b=LDKeU6FD/43vsnX4UlfZKbRCD7+LJlQrZTKRMa4nVoyXg3VtkqfeytCySzVdwqSoGP
         9BAkdjYXGtA27GkUY6OCA/tDa97cBDhrCu/rqmsC2IqmqyKqutmLPKw1vuRcslaUU7Uf
         Vad0cCSgKt72nUE5yoCt8GAcHzwq4AROB450H92ukInauBbDfARpFFNCgYS21kYtViAT
         vSOBEFE8+j9UuWxLZ/znrN6JycLrZOwXEu1+aENdbQV6nTc/v2qevW91Qk3rP7AwWAai
         jFtYsbAIYOxZ21agWpC97P1VYXysRbLPNGyOOQ2b/i9K280W0pfhxvMmEPDmy20tYubn
         yOpg==
X-Forwarded-Encrypted: i=1; AJvYcCVzDMfC+R/o/SbS3axImmp+X5aISiSkyCo9yIet5mmult24u7A5sfAIQC7dlVKsGudyYKg9dZ3h8Vf/IvS6XJZ19nyAZA3CY46A2kxA0jPsVndB/C/Mnw6Ha50hL+icqINvZ6fnkwhWh0r76cuz2m2hmeu/LrtMDWFTfgYEwyzT2pmwTVg=
X-Gm-Message-State: AOJu0Ywtl2UEbD0sLntXudi8wZeaMjqVOkp8Uo7926g2h8sxmBs35Lsn
	60dhStqxgFb3cpdofaT8W/1+rxqypC+jesKLalvYMbJum1ThbKbM
X-Google-Smtp-Source: AGHT+IEsxeZJ6VpPpIjo7zyVqgFT7luxLgOUgrUTPrJf7cWRQN/Fk/KldGVgaOD/hTUl/x66ksckfw==
X-Received: by 2002:a17:906:7746:b0:a6f:3210:ac1d with SMTP id a640c23a62f3a-a7245df6125mr325802166b.63.1719262682115;
        Mon, 24 Jun 2024 13:58:02 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c07d:2d00:ad78:a407:846a:969b? (dynamic-2a01-0c23-c07d-2d00-ad78-a407-846a-969b.c23.pool.telefonica.de. [2a01:c23:c07d:2d00:ad78:a407:846a:969b])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a6fe8c018fasm310522666b.21.2024.06.24.13.58.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jun 2024 13:58:01 -0700 (PDT)
Message-ID: <797c8371-dff3-4112-9733-4d3119670dbf@gmail.com>
Date: Mon, 24 Jun 2024 22:58:53 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression caused by "eeprom: at24: Probe for DDR3 thermal sensor
 in the SPD case" - "sysfs: cannot create duplicate filename"
To: Guenter Roeck <linux@roeck-us.net>, =?UTF-8?Q?Krzysztof_Ol=C4=99dzki?=
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
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 xsFNBF/0ZFUBEAC0eZyktSE7ZNO1SFXL6cQ4i4g6Ah3mOUIXSB4pCY5kQ6OLKHh0FlOD5/5/
 sY7IoIouzOjyFdFPnz4Bl3927ClT567hUJJ+SNaFEiJ9vadI6vZm2gcY4ExdIevYHWe1msJF
 MVE4yNwdS+UsPeCF/6CQQTzHc+n7DomE7fjJD5J1hOJjqz2XWe71fTvYXzxCFLwXXbBiqDC9
 dNqOe5odPsa4TsWZ09T33g5n2nzTJs4Zw8fCy8rLqix/raVsqr8fw5qM66MVtdmEljFaJ9N8
 /W56qGCp+H8Igk/F7CjlbWXiOlKHA25mPTmbVp7VlFsvsmMokr/imQr+0nXtmvYVaKEUwY2g
 86IU6RAOuA8E0J5bD/BeyZdMyVEtX1kT404UJZekFytJZrDZetwxM/cAH+1fMx4z751WJmxQ
 J7mIXSPuDfeJhRDt9sGM6aRVfXbZt+wBogxyXepmnlv9K4A13z9DVLdKLrYUiu9/5QEl6fgI
 kPaXlAZmJsQfoKbmPqCHVRYj1lpQtDM/2/BO6gHASflWUHzwmBVZbS/XRs64uJO8CB3+V3fa
 cIivllReueGCMsHh6/8wgPAyopXOWOxbLsZ291fmZqIR0L5Y6b2HvdFN1Xhc+YrQ8TKK+Z4R
 mJRDh0wNQ8Gm89g92/YkHji4jIWlp2fwzCcx5+lZCQ1XdqAiHQARAQABzSZIZWluZXIgS2Fs
 bHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPsLBjgQTAQgAOBYhBGxfqY/yOyXjyjJehXLe
 ig9U8DoMBQJf9GRVAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHLeig9U8DoMSycQ
 AJbfg8HZEK0ljV4M8nvdaiNixWAufrcZ+SD8zhbxl8GispK4F3Yo+20Y3UoZ7FcIidJWUUJL
 axAOkpI/70YNhlqAPMsuudlAieeYZKjIv1WV5ucNZ3VJ7dC+dlVqQdAr1iD869FZXvy91KhJ
 wYulyCf+s4T9YgmLC6jLMBZghKIf1uhSd0NzjyCqYWbk2ZxByZHgunEShOhHPHswu3Am0ftt
 ePaYIHgZs+Vzwfjs8I7EuW/5/f5G9w1vibXxtGY/GXwgGGHRDjFM7RSprGOv4F5eMGh+NFUJ
 TU9N96PQYMwXVxnQfRXl8O6ffSVmFx4H9rovxWPKobLmqQL0WKLLVvA/aOHCcMKgfyKRcLah
 57vGC50Ga8oT2K1g0AhKGkyJo7lGXkMu5yEs0m9O+btqAB261/E3DRxfI1P/tvDZpLJKtq35
 dXsj6sjvhgX7VxXhY1wE54uqLLHY3UZQlmH3QF5t80MS7/KhxB1pO1Cpcmkt9hgyzH8+5org
 +9wWxGUtJWNP7CppY+qvv3SZtKJMKsxqk5coBGwNkMms56z4qfJm2PUtJQGjA65XWdzQACib
 2iaDQoBqGZfXRdPT0tC1H5kUJuOX4ll1hI/HBMEFCcO8++Bl2wcrUsAxLzGvhINVJX2DAQaF
 aNetToazkCnzubKfBOyiTqFJ0b63c5dqziAgzsFNBF/0ZFUBEADF8UEZmKDl1w/UxvjeyAeX
 kghYkY3bkK6gcIYXdLRfJw12GbvMioSguvVzASVHG8h7NbNjk1yur6AONfbUpXKSNZ0skV8V
 fG+ppbaY+zQofsSMoj5gP0amwbwvPzVqZCYJai81VobefTX2MZM2Mg/ThBVtGyzV3NeCpnBa
 8AX3s9rrX2XUoCibYotbbxx9afZYUFyflOc7kEpc9uJXIdaxS2Z6MnYLHsyVjiU6tzKCiVOU
 KJevqvzPXJmy0xaOVf7mhFSNQyJTrZpLa+tvB1DQRS08CqYtIMxRrVtC0t0LFeQGly6bOngr
 ircurWJiJKbSXVstLHgWYiq3/GmCSx/82ObeLO3PftklpRj8d+kFbrvrqBgjWtMH4WtK5uN5
 1WJ71hWJfNchKRlaJ3GWy8KolCAoGsQMovn/ZEXxrGs1ndafu47yXOpuDAozoHTBGvuSXSZo
 ythk/0EAuz5IkwkhYBT1MGIAvNSn9ivE5aRnBazugy0rTRkVggHvt3/7flFHlGVGpBHxFUwb
 /a4UjJBPtIwa4tWR8B1Ma36S8Jk456k2n1id7M0LQ+eqstmp6Y+UB+pt9NX6t0Slw1NCdYTW
 gJezWTVKF7pmTdXszXGxlc9kTrVUz04PqPjnYbv5UWuDd2eyzGjrrFOsJEi8OK2d2j4FfF++
 AzOMdW09JVqejQARAQABwsF2BBgBCAAgFiEEbF+pj/I7JePKMl6Fct6KD1TwOgwFAl/0ZFUC
 GwwACgkQct6KD1TwOgxUfg//eAoYc0Vm4NrxymfcY30UjHVD0LgSvU8kUmXxil3qhFPS7KA+
 y7tgcKLHOkZkXMX5MLFcS9+SmrAjSBBV8omKoHNo+kfFx/dUAtz0lot8wNGmWb+NcHeKM1eb
 nwUMOEa1uDdfZeKef/U/2uHBceY7Gc6zPZPWgXghEyQMTH2UhLgeam8yglyO+A6RXCh+s6ak
 Wje7Vo1wGK4eYxp6pwMPJXLMsI0ii/2k3YPEJPv+yJf90MbYyQSbkTwZhrsokjQEaIfjrIk3
 rQRjTve/J62WIO28IbY/mENuGgWehRlTAbhC4BLTZ5uYS0YMQCR7v9UGMWdNWXFyrOB6PjSu
 Trn9MsPoUc8qI72mVpxEXQDLlrd2ijEWm7Nrf52YMD7hL6rXXuis7R6zY8WnnBhW0uCfhajx
 q+KuARXC0sDLztcjaS3ayXonpoCPZep2Bd5xqE4Ln8/COCslP7E92W1uf1EcdXXIrx1acg21
 H/0Z53okMykVs3a8tECPHIxnre2UxKdTbCEkjkR4V6JyplTS47oWMw3zyI7zkaadfzVFBxk2
 lo/Tny+FX1Azea3Ce7oOnRUEZtWSsUidtIjmL8YUQFZYm+JUIgfRmSpMFq8JP4VH43GXpB/S
 OCrl+/xujzvoUBFV/cHKjEQYBxo+MaiQa1U54ykM2W4DnHb1UiEf5xDkFd4=
In-Reply-To: <97c497ae-44f7-4cec-b7d9-f639e4597571@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.06.2024 16:54, Guenter Roeck wrote:
> On 6/24/24 01:38, Krzysztof Olędzki wrote:
>> On 23.06.2024 at 22:33, Guenter Roeck wrote:
>>> On 6/23/24 11:47, Krzysztof Olędzki wrote:
>>>> Hi,
>>>>
>>>> After upgrading kernel to Linux 6.6.34 on one of my systems, I noticed "sysfs: cannot create duplicate filename" and i2c registration errors in dmesg, please see below.
>>>>
>>>> This seems to be related to https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.6.y&id=4d5ace787273cb159bfdcf1c523df957938b3e42 - reverting the change fixes the problem.
>>>>
>>>> Note that jc42 devices are registered correctly and work with and without the change.
>>>>
>>>
>>> My guess is that the devices are fist instantiated through the jc42
>>> driver's _detect function and then again from the at24 driver.
>>> The at24 driver should possibly call i2c_new_scanned_device() instead
>>> of i2c_new_client_device() to only instantiate the device if it wasn't
>>> already instantiated.
>>
>> i2c_new_scanned_device() also calls i2c_default_probe() at the end (unless
>> different probe is provided) which seems risky given the comment that explains
>> that it would use quick write for that address. However, maybe it is safe in this case?
>> I wish we had a way to just tell "no probing is needed".
>>
> 
> Sorry, I don't understand why it would be less risky to just probe the device
> without such a test.
> 
>> We also know the exact address so no scanning is needed.
>>
>> Perhaps it would be better to just call i2c_check_addr_busy() in
>> at24_probe_temp_sensor()?
>>
>> Something like this:
>> --- a/drivers/misc/eeprom/at24.c    2024-06-24 09:16:11.251855130 +0200
>> +++ b/drivers/misc/eeprom/at24.c    2024-06-24 09:27:01.158170725 +0200
>> @@ -603,6 +603,10 @@
>>         info.addr = 0x18 | (client->addr & 7);
>>   +    /* The device may be already instantiated through the jc42 driver */
>> +    if (i2c_check_addr_busy(client->adapter, info.addr))
>> +        return;
>> +
>>       i2c_new_client_device(client->adapter, &info);
>>   }
>>
>> Unfortunately, i2c_check_addr_busy is not exported and declared as static,
> 
> That is why I did not suggest that.
> 
>> I assume intentionally? Unless this can be changed, we are back to the original
>> recommendation:
>>
>> --- a/drivers/misc/eeprom/at24.c    2024-06-24 09:16:11.251855130 +0200
>> +++ b/drivers/misc/eeprom/at24.c    2024-06-24 10:25:39.142567472 +0200
>> @@ -585,6 +585,7 @@
>>   {
>>       struct at24_data *at24 = i2c_get_clientdata(client);
>>       struct i2c_board_info info = { .type = "jc42" };
>> +    unsigned short addr_list[] = { 0, I2C_CLIENT_END };
>>       int ret;
>>       u8 val;
>>   @@ -601,9 +602,10 @@
>>       if (ret || !(val & BIT(7)))
>>           return;
>>   -    info.addr = 0x18 | (client->addr & 7);
>> +    addr_list[0] = 0x18 | (client->addr & 7);
>>   -    i2c_new_client_device(client->adapter, &info);
>> +    /* The device may be already instantiated through the jc42 driver */
>> +    i2c_new_scanned_device(client->adapter, &info, addr_list, NULL);
>>   }
>>     static int at24_probe(struct i2c_client *client)
>>
>> For now compile-tested only given the write-test concern above.
>>
> 
> The device detect code in the i2c core does that same write-test that you
> are concerned about.
> 
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
>> 2. I don't understand why we are also getting the "Failed creating jc42" and
>> "sysfs: cannot create duplicate filename" errors since i2c_new_client_device() calls
>> i2c_check_addr_busy() on its own and should abort after the first error message?
>>
> 
> The "Failed creating" message is from the i2c core's detect function which
> is only called if a new i2c adapter is added. This is actually the case here,
> since the call sequence of the backtrace includes i801_probe(). It looks like
> i2c_detect() runs asynchronously and doesn't protect itself against having
> devices added to a bus while it is running on that same bus. That is just
> a guess, though - I have not tried to verify it.
> 

Too me the issue also looks like a race. According to the OP's logs:
- jc42 at 0x18 is instantiated successfully
- jc42 at 0x19 returns -EBUSY. This is what is expected if the device
  has been instantiated otherwise already.
- jc42 at 0x1a returns -EEXIST. Here two instantiations of the the same
  device seem to collide.
- jc42 at 0x1b returns -EBUSY, like at 0x19.

So it looks like referenced change isn't wrong, but reveals an
underlying issue with device instantiation races.
I'll have a look how this could be fixed.

> That does suggest, though, that even your suggested code above might not
> completely fix the problem. It may be necessary to call i2c_lock_bus()
> or similar from i2c_new_scanned_device() and i2c_detect(), but I don't know
> if that is save, sufficient, or even possible.
> 
>> 3. (unrelated but found while looking at the code) The comment for
>> delete_device_store() seems to be outdated as it mentions i2c_sysfs_new_device
>> which does not exist any longer, as it was renamed in
>> "i2c: core: Use DEVICE_ATTR_*() helper macros" back in 2019:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/i2c/i2c-core-base.c?id=54a19fd4a6402ef47fce5c3a5374c71f52373c40 -
>>
>> For the Greg's question if it is also in 6.9: I have not tested that kernel yet,
>> but unless there have been some recent changes in the i2c code I would expect
>> it should behave the same way. If required, I should be able to do this next week.
>>
> Agreed.
> 
> Guenter
> 


