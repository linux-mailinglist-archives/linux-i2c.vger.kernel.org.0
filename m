Return-Path: <linux-i2c+bounces-4594-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B2219924925
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 22:26:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 365FA1F233DB
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 20:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7275C201253;
	Tue,  2 Jul 2024 20:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QjclEhbl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1DA200135;
	Tue,  2 Jul 2024 20:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719951951; cv=none; b=BVTxdvVVCGZfQX22RooCAjyjMg2pUdkNabIK0CV2QftaoE1nWEwB1FEYcW0EQzMdf+r0qbcjJRTwY2DBeTUjp4cgPcQR70R9pmc0cWjvU2JyYpEmuUaTj5uFxNqKhTQ3JKYPtnEIzGxCb4GD8wQhtAAmQqnSrUTeTnLlyB9Zb1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719951951; c=relaxed/simple;
	bh=SCjox0ZdLOCci4q6shlA8jEvx8NBC0syRB6Kqkw0Dx0=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=XTQBYdLwfPvoRoSAK36kw9JzIHX2Z4KByp83sR2jOATuP8A+ql+cXmhlcSTc+XCd+BpZkE39uDdW9Hr/PHcxI8Y9usHpkFJu9SA1D8ChOM68YCnOfDNayKLKzmzWLVO0k3CNVZoVJeqTYLqUcZO04f5xFw1vaR9mJMu8iy3M5Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QjclEhbl; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a72517e6225so539715766b.0;
        Tue, 02 Jul 2024 13:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719951947; x=1720556747; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=27thwQQcaboPCMSPqBVtnFHaRqcWRs+tH3NLgSvJ6MM=;
        b=QjclEhblKG1YoQIyiiI5rsCPqE9TpWa9vQUp5Kj9HS2bQyK/SW88cUgPQcJoroVA4F
         0g3v/8v+UDQ7Km/LruQAuTKQXvlOzIFeH+B4egwdr3/Y/mxVlCU1MMp6X5OkdZimA+L/
         De/D/gPon+/we7/d1KcErwr3/JvytDcjDIPRgvSZCgjISLU7V9W4lzFXQvt5FsKepv2N
         sTlDBM2HkSVPJDxHuXU4jo+TFs53RLR/5TsyIn+Y2AcSh7QNIR7HzxDwGPUuhMAzCZS+
         Oqq1QieENx8I/NGRXvnWByvyFWOCbn4LSUbdkYUOEl+An6DbzBXHSXkN4I7aLomDUNzu
         F/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719951947; x=1720556747;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=27thwQQcaboPCMSPqBVtnFHaRqcWRs+tH3NLgSvJ6MM=;
        b=Z3S4WrNAdgHqjVXJr4wXVJyc7jZhtz+h24jYmhHF2a9a2SjsQL/vZFq2CMPijsHXh+
         irttUFjXi27jPTFS+niTBfZnurmuYIMVTA1R7FMgMdPw9cR8VW7xpa8a0hBLToy3EuXa
         yFkEf/koWBWckE+s5lleIisS8sK7EbPv8oC++VQYXHhOrSBAK0EH0FpkUykvtCpWCWBm
         rWY6EzzmZeM+25zsdd5e11r553qd/IotnGYWTSYB9Tu+ajqpN7ecsaveunNUXeCbmCWi
         pYEAC0c25MHWTQhr9+6JvDVydOYAxf9pV3ESXK6/u8qCdT1qNEfXbWi4Y49fiQhAKArm
         2nrw==
X-Forwarded-Encrypted: i=1; AJvYcCX+7QePpIZgTqUUM+GOYz6icMiDBbhPSMQ35tggPUZxoGPB5Ocym8G99QgkxiPEYYQi159cu7Pz2GeJyeaauRR4M6IEg5DbWCfUfQF3i6YeN+3YWzrZx8kKvJKDBNbLbGpHFbQVfPkwzKzSRjf0UERJF5rCvp1zsfIJRLSDOm3wHo2P9PU=
X-Gm-Message-State: AOJu0YznBi0TRL1GfjjNO1pvCBMR4HXMPuvJniU0Qz+yh+t03LL2hV44
	OAfPLfdtJF+OqymoNMW/eo9Exkng2hlMw80Bflzl1vsG0f6jWtK2vDeD8g==
X-Google-Smtp-Source: AGHT+IHCjkTUsW/hO9Y9pFD/w4fLu24Ys6E2XNSDfSK5oJdnuGNPkoykEKzha2kqPeoZbrmbdKgSqw==
X-Received: by 2002:a17:907:3f09:b0:a6f:4ae3:5324 with SMTP id a640c23a62f3a-a7514438c75mr797468366b.40.1719951946870;
        Tue, 02 Jul 2024 13:25:46 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6ee6:6100:a816:1371:21d6:2544? (dynamic-2a01-0c22-6ee6-6100-a816-1371-21d6-2544.c22.pool.telefonica.de. [2a01:c22:6ee6:6100:a816:1371:21d6:2544])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a72ab0b56absm449675266b.197.2024.07.02.13.25.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 13:25:45 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------Z1TIodgfP0JzfXXIP94x6dei"
Message-ID: <3365237d-5fb7-4cbd-a1c0-aff39433f5c2@gmail.com>
Date: Tue, 2 Jul 2024 22:25:44 +0200
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: stable@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-hwmon@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <a57e9a39-13ce-4e4d-a7a1-c591f6b4ac65@ans.pl>
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
In-Reply-To: <a57e9a39-13ce-4e4d-a7a1-c591f6b4ac65@ans.pl>

This is a multi-part message in MIME format.
--------------Z1TIodgfP0JzfXXIP94x6dei
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23.06.2024 20:47, Krzysztof Olędzki wrote:
> Hi,
> 
> After upgrading kernel to Linux 6.6.34 on one of my systems, I noticed "sysfs: cannot create duplicate filename" and i2c registration errors in dmesg, please see below.
> 
> This seems to be related to https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.6.y&id=4d5ace787273cb159bfdcf1c523df957938b3e42 - reverting the change fixes the problem.
> 
> Note that jc42 devices are registered correctly and work with and without the change.
> 
> # grep . /sys/devices/pci0000:00/0000:00:1f.3/i2c-12/12-*/name
> /sys/devices/pci0000:00/0000:00:1f.3/i2c-12/12-0018/name:jc42
> /sys/devices/pci0000:00/0000:00:1f.3/i2c-12/12-0019/name:jc42
> /sys/devices/pci0000:00/0000:00:1f.3/i2c-12/12-001a/name:jc42
> /sys/devices/pci0000:00/0000:00:1f.3/i2c-12/12-001b/name:jc42
> /sys/devices/pci0000:00/0000:00:1f.3/i2c-12/12-0050/name:spd
> /sys/devices/pci0000:00/0000:00:1f.3/i2c-12/12-0051/name:spd
> /sys/devices/pci0000:00/0000:00:1f.3/i2c-12/12-0052/name:spd
> /sys/devices/pci0000:00/0000:00:1f.3/i2c-12/12-0053/name:spd
> 
> # sensors|grep -A4 jc42-i2c
> jc42-i2c-12-1b
> Adapter: SMBus I801 adapter at 3000
> temp1:        +33.2°C  (low  =  +0.0°C)
>                        (high = +91.0°C, hyst = +91.0°C)
>                        (crit = +95.0°C, hyst = +95.0°C)
> --
> jc42-i2c-12-19
> Adapter: SMBus I801 adapter at 3000
> temp1:        +33.5°C  (low  =  +0.0°C)
>                        (high = +91.0°C, hyst = +91.0°C)
>                        (crit = +95.0°C, hyst = +95.0°C)
> --
> jc42-i2c-12-1a
> Adapter: SMBus I801 adapter at 3000
> temp1:        +33.5°C  (low  =  +0.0°C)
>                        (high = +91.0°C, hyst = +91.0°C)
>                        (crit = +95.0°C, hyst = +95.0°C)
> --
> jc42-i2c-12-18
> Adapter: SMBus I801 adapter at 3000
> temp1:        +33.2°C  (low  =  +0.0°C)
>                        (high = +91.0°C, hyst = +91.0°C)
>                        (crit = +95.0°C, hyst = +95.0°C)
> 
> 
> dmesg:
> [    0.000000] DMI: Dell Inc. PowerEdge T110 II/0PM2CW, BIOS 2.10.0 05/24/2018
> (...)
> [    7.681132] i2c_dev: i2c /dev entries driver
> [    7.687116] i2c i2c-12: 4/4 memory slots populated (from DMI)
> [    7.690623] at24 12-0050: 256 byte spd EEPROM, read-only
> [    7.691812] i2c i2c-12: Successfully instantiated SPD at 0x50
> [    7.698246] at24 12-0051: 256 byte spd EEPROM, read-only
> [    7.699465] i2c i2c-12: Successfully instantiated SPD at 0x51
> [    7.700043] i2c i2c-12: Failed to register i2c client jc42 at 0x19 (-16)
> [    7.700047] i2c i2c-12: Failed creating jc42 at 0x19
> [    7.705248] sysfs: cannot create duplicate filename '/devices/pci0000:00/0000:00:1f.3/i2c-12/12-001a'
> [    7.711617]  <TASK>
> [    7.712612]  dump_stack_lvl+0x37/0x4a
> [    7.712612]  sysfs_warn_dup+0x55/0x61
> [    7.715616]  sysfs_create_dir_ns+0xa6/0xd2
> [    7.716620]  kobject_add_internal+0xc3/0x1c0
> [    7.716620]  kobject_add+0xba/0xe4
> [    7.719615]  ? device_add+0x53/0x726
> [    7.720611]  device_add+0x132/0x726
> [    7.720611]  i2c_new_client_device+0x1ee/0x246
> [    7.723616]  at24_probe+0x5f8/0x666
> [    7.724642]  ? __pfx_at24_read+0x10/0x10
> [    7.724642]  ? __pfx_at24_write+0x10/0x10
> [    7.724642]  ? __pfx___device_attach_driver+0x10/0x10
> [    7.727619]  i2c_device_probe+0x1b7/0x240
> [    7.728612]  really_probe+0x101/0x248
> [    7.728612]  __driver_probe_device+0xbb/0xed
> [    7.731620]  driver_probe_device+0x1a/0x72
> [    7.732621]  __device_attach_driver+0x82/0x96
> [    7.732621]  bus_for_each_drv+0xa6/0xd4
> [    7.732621]  __device_attach+0xa8/0x12a
> [    7.735619]  bus_probe_device+0x31/0x95
> [    7.736614]  device_add+0x265/0x726
> [    7.736614]  i2c_new_client_device+0x1ee/0x246
> [    7.739618]  i2c_register_spd+0x1a1/0x1ed
> [    7.740613]  i801_probe+0x589/0x603
> [    7.740613]  ? up_write+0x37/0x4d
> [    7.740613]  ? kernfs_add_one+0x104/0x126
> [    7.743618]  ? __raw_spin_unlock_irqrestore+0x14/0x29
> [    7.744612]  pci_device_probe+0xbe/0x12f
> [    7.744612]  really_probe+0x101/0x248
> [    7.744612]  __driver_probe_device+0xbb/0xed
> [    7.747618]  driver_probe_device+0x1a/0x72
> [    7.748612]  __driver_attach_async_helper+0x2d/0x42
> [    7.748612]  async_run_entry_fn+0x25/0xa0
> [    7.748612]  process_scheduled_works+0x193/0x291
> [    7.748612]  worker_thread+0x1c5/0x21f
> [    7.751619]  ? __pfx_worker_thread+0x10/0x10
> [    7.752611]  kthread+0xf6/0xfe
> [    7.752611]  ? __pfx_kthread+0x10/0x10
> [    7.752611]  ret_from_fork+0x23/0x35
> [    7.755621]  ? __pfx_kthread+0x10/0x10
> [    7.756613]  ret_from_fork_asm+0x1b/0x30
> [    7.756613]  </TASK>
> [    7.759637] i2c i2c-12: Failed to register i2c client jc42 at 0x1a (-17)
> [    7.760815] at24 12-0052: 256 byte spd EEPROM, read-only
> [    7.762047] i2c i2c-12: Successfully instantiated SPD at 0x52
> [    7.765252] i2c i2c-12: Failed to register i2c client jc42 at 0x1b (-16)
> [    7.766126] at24 12-0053: 256 byte spd EEPROM, read-only
> [    7.767584] i2c i2c-12: Successfully instantiated SPD at 0x53
> 
> Thanks,
>  Krzysztof

Could you please test whether the attached two experimental patches fix the issue for you?
They serialize client device instantiation per I2C adapter, and include the client device
name in the check whether a bus address is busy.

--------------Z1TIodgfP0JzfXXIP94x6dei
Content-Type: text/plain; charset=UTF-8;
 name="0001-i2c-Include-device-name-in-check-i2c_check_addr_busy.patch"
Content-Disposition: attachment;
 filename*0="0001-i2c-Include-device-name-in-check-i2c_check_addr_busy.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSBjNjRiMjNhNTgzZmI5ODdlOTM1MjgwMzNiZjYwMzM5MThjYmFmMTA1IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21h
aWwuY29tPgpEYXRlOiBUdWUsIDIgSnVsIDIwMjQgMjE6NTQ6NDcgKzAyMDAKU3ViamVjdDog
W1BBVENIIDEvMl0gaTJjOiBJbmNsdWRlIGRldmljZSBuYW1lIGluIGNoZWNrIGkyY19jaGVj
a19hZGRyX2J1c3koKQoKU2lnbmVkLW9mZi1ieTogSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdl
aXQxQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL2kyYy9pMmMtY29yZS1iYXNlLmMgfCA1MCAr
KysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MzIgaW5zZXJ0aW9ucygrKSwgMTggZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9pMmMvaTJjLWNvcmUtYmFzZS5jIGIvZHJpdmVycy9pMmMvaTJjLWNvcmUtYmFzZS5jCmlu
ZGV4IDQ5ZmRjYjNlYi4uYTZjMjk3NGI5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2kyYy9pMmMt
Y29yZS1iYXNlLmMKKysrIGIvZHJpdmVycy9pMmMvaTJjLWNvcmUtYmFzZS5jCkBAIC03Nzks
NTUgKzc3OSw2NyBAQCBpbnQgaTJjX2NoZWNrXzdiaXRfYWRkcl92YWxpZGl0eV9zdHJpY3Qo
dW5zaWduZWQgc2hvcnQgYWRkcikKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGludCBfX2ky
Y19jaGVja19hZGRyX2J1c3koc3RydWN0IGRldmljZSAqZGV2LCB2b2lkICphZGRycCkKK3N0
YXRpYyBpbnQgX19pMmNfY2hlY2tfYWRkcl9idXN5KHN0cnVjdCBkZXZpY2UgKmRldiwgdm9p
ZCAqZGF0YSkKIHsKIAlzdHJ1Y3QgaTJjX2NsaWVudAkqY2xpZW50ID0gaTJjX3ZlcmlmeV9j
bGllbnQoZGV2KTsKLQlpbnQJCQlhZGRyID0gKihpbnQgKilhZGRycDsKKwlzdHJ1Y3QgaTJj
X2NsaWVudAkqY2wgPSBkYXRhOworCisJaWYgKGNsaWVudCAmJiBpMmNfZW5jb2RlX2ZsYWdz
X3RvX2FkZHIoY2xpZW50KSA9PSBjbC0+YWRkcikgeworCQlpZiAoc3RyY21wKGNsaWVudC0+
bmFtZSwgY2wtPm5hbWUpKQorCQkJcmV0dXJuIC1FQlVTWTsKKwkJZWxzZQorCQkJLyoKKwkJ
CSAqIElmIHdlIGZpbmQgYSBkZXZpY2Ugd2l0aCB0aGUgc2FtZSBuYW1lIG9uIHRoZSBhZGRy
ZXNzLAorCQkJICogdGhlbiBhc3N1bWUgd2UgaGF2ZSBiZWVuIGluc3RhbnRpYXRlZCBieSBv
dGhlciBtZWFucyBhbHJlYWR5CisJCQkgKi8KKwkJCXJldHVybiAtRUVYSVNUOworCX0KIAot
CWlmIChjbGllbnQgJiYgaTJjX2VuY29kZV9mbGFnc190b19hZGRyKGNsaWVudCkgPT0gYWRk
cikKLQkJcmV0dXJuIC1FQlVTWTsKIAlyZXR1cm4gMDsKIH0KIAogLyogd2FsayB1cCBtdXgg
dHJlZSAqLwotc3RhdGljIGludCBpMmNfY2hlY2tfbXV4X3BhcmVudHMoc3RydWN0IGkyY19h
ZGFwdGVyICphZGFwdGVyLCBpbnQgYWRkcikKK3N0YXRpYyBpbnQgaTJjX2NoZWNrX211eF9w
YXJlbnRzKHN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcHRlciwgc3RydWN0IGkyY19jbGllbnQg
KmNsKQogewogCXN0cnVjdCBpMmNfYWRhcHRlciAqcGFyZW50ID0gaTJjX3BhcmVudF9pc19p
MmNfYWRhcHRlcihhZGFwdGVyKTsKIAlpbnQgcmVzdWx0OwogCi0JcmVzdWx0ID0gZGV2aWNl
X2Zvcl9lYWNoX2NoaWxkKCZhZGFwdGVyLT5kZXYsICZhZGRyLAotCQkJCQlfX2kyY19jaGVj
a19hZGRyX2J1c3kpOworCXJlc3VsdCA9IGRldmljZV9mb3JfZWFjaF9jaGlsZCgmYWRhcHRl
ci0+ZGV2LCBjbCwgX19pMmNfY2hlY2tfYWRkcl9idXN5KTsKIAogCWlmICghcmVzdWx0ICYm
IHBhcmVudCkKLQkJcmVzdWx0ID0gaTJjX2NoZWNrX211eF9wYXJlbnRzKHBhcmVudCwgYWRk
cik7CisJCXJlc3VsdCA9IGkyY19jaGVja19tdXhfcGFyZW50cyhwYXJlbnQsIGNsKTsKIAog
CXJldHVybiByZXN1bHQ7CiB9CiAKIC8qIHJlY3Vyc2UgZG93biBtdXggdHJlZSAqLwotc3Rh
dGljIGludCBpMmNfY2hlY2tfbXV4X2NoaWxkcmVuKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9p
ZCAqYWRkcnApCitzdGF0aWMgaW50IGkyY19jaGVja19tdXhfY2hpbGRyZW4oc3RydWN0IGRl
dmljZSAqZGV2LCB2b2lkICpjbCkKIHsKIAlpbnQgcmVzdWx0OwogCiAJaWYgKGRldi0+dHlw
ZSA9PSAmaTJjX2FkYXB0ZXJfdHlwZSkKLQkJcmVzdWx0ID0gZGV2aWNlX2Zvcl9lYWNoX2No
aWxkKGRldiwgYWRkcnAsCi0JCQkJCQlpMmNfY2hlY2tfbXV4X2NoaWxkcmVuKTsKKwkJcmVz
dWx0ID0gZGV2aWNlX2Zvcl9lYWNoX2NoaWxkKGRldiwgY2wsIGkyY19jaGVja19tdXhfY2hp
bGRyZW4pOwogCWVsc2UKLQkJcmVzdWx0ID0gX19pMmNfY2hlY2tfYWRkcl9idXN5KGRldiwg
YWRkcnApOworCQlyZXN1bHQgPSBfX2kyY19jaGVja19hZGRyX2J1c3koZGV2LCBjbCk7CiAK
IAlyZXR1cm4gcmVzdWx0OwogfQogCi1zdGF0aWMgaW50IGkyY19jaGVja19hZGRyX2J1c3ko
c3RydWN0IGkyY19hZGFwdGVyICphZGFwdGVyLCBpbnQgYWRkcikKK3N0YXRpYyBpbnQgaTJj
X2NoZWNrX2FkZHJfYnVzeShzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXB0ZXIsIGludCBhZGRy
LCBjb25zdCBjaGFyICpuYW1lKQogewogCXN0cnVjdCBpMmNfYWRhcHRlciAqcGFyZW50ID0g
aTJjX3BhcmVudF9pc19pMmNfYWRhcHRlcihhZGFwdGVyKTsKKwlzdHJ1Y3QgaTJjX2NsaWVu
dCBjbCA9IHt9OwogCWludCByZXN1bHQgPSAwOwogCisJY2wuYWRkciA9IGFkZHI7CisJaWYg
KG5hbWUpCisJCXN0cnNjcHkoY2wubmFtZSwgbmFtZSwgc2l6ZW9mKGNsLm5hbWUpKTsKKwog
CWlmIChwYXJlbnQpCi0JCXJlc3VsdCA9IGkyY19jaGVja19tdXhfcGFyZW50cyhwYXJlbnQs
IGFkZHIpOworCQlyZXN1bHQgPSBpMmNfY2hlY2tfbXV4X3BhcmVudHMocGFyZW50LCAmY2wp
OwogCiAJaWYgKCFyZXN1bHQpCi0JCXJlc3VsdCA9IGRldmljZV9mb3JfZWFjaF9jaGlsZCgm
YWRhcHRlci0+ZGV2LCAmYWRkciwKKwkJcmVzdWx0ID0gZGV2aWNlX2Zvcl9lYWNoX2NoaWxk
KCZhZGFwdGVyLT5kZXYsICZjbCwKIAkJCQkJCWkyY19jaGVja19tdXhfY2hpbGRyZW4pOwog
CiAJcmV0dXJuIHJlc3VsdDsKQEAgLTk2Myw3ICs5NzUsOSBAQCBpMmNfbmV3X2NsaWVudF9k
ZXZpY2Uoc3RydWN0IGkyY19hZGFwdGVyICphZGFwLCBzdHJ1Y3QgaTJjX2JvYXJkX2luZm8g
Y29uc3QgKmluZgogCX0KIAogCS8qIENoZWNrIGZvciBhZGRyZXNzIGJ1c2luZXNzICovCi0J
c3RhdHVzID0gaTJjX2NoZWNrX2FkZHJfYnVzeShhZGFwLCBpMmNfZW5jb2RlX2ZsYWdzX3Rv
X2FkZHIoY2xpZW50KSk7CisJc3RhdHVzID0gaTJjX2NoZWNrX2FkZHJfYnVzeShhZGFwLCBp
MmNfZW5jb2RlX2ZsYWdzX3RvX2FkZHIoY2xpZW50KSwgY2xpZW50LT5uYW1lKTsKKwlpZiAo
c3RhdHVzID09IC1FRVhJU1QpCisJCWdvdG8gb3V0X2Vycl9zaWxlbnQ7CiAJaWYgKHN0YXR1
cykKIAkJZ290byBvdXRfZXJyOwogCkBAIC0yNDQ0LDcgKzI0NTgsNyBAQCBzdGF0aWMgaW50
IGkyY19kZXRlY3RfYWRkcmVzcyhzdHJ1Y3QgaTJjX2NsaWVudCAqdGVtcF9jbGllbnQsCiAJ
fQogCiAJLyogU2tpcCBpZiBhbHJlYWR5IGluIHVzZSAoNyBiaXQsIG5vIG5lZWQgdG8gZW5j
b2RlIGZsYWdzKSAqLwotCWlmIChpMmNfY2hlY2tfYWRkcl9idXN5KGFkYXB0ZXIsIGFkZHIp
KQorCWlmIChpMmNfY2hlY2tfYWRkcl9idXN5KGFkYXB0ZXIsIGFkZHIsIE5VTEwpKQogCQly
ZXR1cm4gMDsKIAogCS8qIE1ha2Ugc3VyZSB0aGVyZSBpcyBzb21ldGhpbmcgYXQgdGhpcyBh
ZGRyZXNzICovCkBAIC0yNTU5LDcgKzI1NzMsNyBAQCBpMmNfbmV3X3NjYW5uZWRfZGV2aWNl
KHN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcCwKIAkJfQogCiAJCS8qIENoZWNrIGFkZHJlc3Mg
YXZhaWxhYmlsaXR5ICg3IGJpdCwgbm8gbmVlZCB0byBlbmNvZGUgZmxhZ3MpICovCi0JCWlm
IChpMmNfY2hlY2tfYWRkcl9idXN5KGFkYXAsIGFkZHJfbGlzdFtpXSkpIHsKKwkJaWYgKGky
Y19jaGVja19hZGRyX2J1c3koYWRhcCwgYWRkcl9saXN0W2ldLCBOVUxMKSkgewogCQkJZGV2
X2RiZygmYWRhcC0+ZGV2LAogCQkJCSJBZGRyZXNzIDB4JTAyeCBhbHJlYWR5IGluIHVzZSwg
bm90IHByb2JpbmdcbiIsCiAJCQkJYWRkcl9saXN0W2ldKTsKLS0gCjIuNDUuMgoK
--------------Z1TIodgfP0JzfXXIP94x6dei
Content-Type: text/plain; charset=UTF-8;
 name="0002-i2c-Serialize-client-device-instantiation.patch"
Content-Disposition: attachment;
 filename="0002-i2c-Serialize-client-device-instantiation.patch"
Content-Transfer-Encoding: base64

RnJvbSA5OGM1YTllMDE4YzE4ODA2NGRlYTJkZWJhZTc2NTFlOGIxZTZkMjU4IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBIZWluZXIgS2FsbHdlaXQgPGhrYWxsd2VpdDFAZ21h
aWwuY29tPgpEYXRlOiBTdW4sIDMwIEp1biAyMDI0IDIyOjU2OjEzICswMjAwClN1YmplY3Q6
IFtQQVRDSCAyLzJdIGkyYzogU2VyaWFsaXplIGNsaWVudCBkZXZpY2UgaW5zdGFudGlhdGlv
bgoKU2lnbmVkLW9mZi1ieTogSGVpbmVyIEthbGx3ZWl0IDxoa2FsbHdlaXQxQGdtYWlsLmNv
bT4KLS0tCiBkcml2ZXJzL2kyYy9pMmMtY29yZS1iYXNlLmMgfCA0NSArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKystLS0tLS0tCiBpbmNsdWRlL2xpbnV4L2kyYy5oICAgICAgICAg
fCAgMyArKysKIDIgZmlsZXMgY2hhbmdlZCwgNDAgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2kyYy9pMmMtY29yZS1iYXNlLmMgYi9kcml2
ZXJzL2kyYy9pMmMtY29yZS1iYXNlLmMKaW5kZXggYTZjMjk3NGI5Li4yZmQzYTU0MzIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvaTJjL2kyYy1jb3JlLWJhc2UuYworKysgYi9kcml2ZXJzL2ky
Yy9pMmMtY29yZS1iYXNlLmMKQEAgLTkyOCw3ICs5MjgsNyBAQCBpbnQgaTJjX2Rldl9pcnFf
ZnJvbV9yZXNvdXJjZXMoY29uc3Qgc3RydWN0IHJlc291cmNlICpyZXNvdXJjZXMsCiB9CiAK
IC8qKgotICogaTJjX25ld19jbGllbnRfZGV2aWNlIC0gaW5zdGFudGlhdGUgYW4gaTJjIGRl
dmljZQorICogX19pMmNfbmV3X2NsaWVudF9kZXZpY2UgLSBpbnN0YW50aWF0ZSBhbiBpMmMg
ZGV2aWNlCiAgKiBAYWRhcDogdGhlIGFkYXB0ZXIgbWFuYWdpbmcgdGhlIGRldmljZQogICog
QGluZm86IGRlc2NyaWJlcyBvbmUgSTJDIGRldmljZTsgYnVzX251bSBpcyBpZ25vcmVkCiAg
KiBDb250ZXh0OiBjYW4gc2xlZXAKQEAgLTk0NCw3ICs5NDQsNyBAQCBpbnQgaTJjX2Rldl9p
cnFfZnJvbV9yZXNvdXJjZXMoY29uc3Qgc3RydWN0IHJlc291cmNlICpyZXNvdXJjZXMsCiAg
KiBpMmNfdW5yZWdpc3Rlcl9kZXZpY2UoKTsgb3IgYW4gRVJSX1BUUiB0byBkZXNjcmliZSB0
aGUgZXJyb3IuCiAgKi8KIHN0cnVjdCBpMmNfY2xpZW50ICoKLWkyY19uZXdfY2xpZW50X2Rl
dmljZShzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXAsIHN0cnVjdCBpMmNfYm9hcmRfaW5mbyBj
b25zdCAqaW5mbykKK19faTJjX25ld19jbGllbnRfZGV2aWNlKHN0cnVjdCBpMmNfYWRhcHRl
ciAqYWRhcCwgc3RydWN0IGkyY19ib2FyZF9pbmZvIGNvbnN0ICppbmZvKQogewogCXN0cnVj
dCBpMmNfY2xpZW50ICpjbGllbnQ7CiAJYm9vbCBuZWVkX3B1dCA9IGZhbHNlOwpAQCAtMTAy
NSw2ICsxMDI1LDIwIEBAIGkyY19uZXdfY2xpZW50X2RldmljZShzdHJ1Y3QgaTJjX2FkYXB0
ZXIgKmFkYXAsIHN0cnVjdCBpMmNfYm9hcmRfaW5mbyBjb25zdCAqaW5mCiAJCWtmcmVlKGNs
aWVudCk7CiAJcmV0dXJuIEVSUl9QVFIoc3RhdHVzKTsKIH0KK0VYUE9SVF9TWU1CT0xfR1BM
KF9faTJjX25ld19jbGllbnRfZGV2aWNlKTsKKworCitzdHJ1Y3QgaTJjX2NsaWVudCAqCitp
MmNfbmV3X2NsaWVudF9kZXZpY2Uoc3RydWN0IGkyY19hZGFwdGVyICphZGFwLCBzdHJ1Y3Qg
aTJjX2JvYXJkX2luZm8gY29uc3QgKmluZm8pCit7CisJc3RydWN0IGkyY19jbGllbnQgKmNs
OworCisJcnRfbXV0ZXhfbG9ja19uZXN0ZWQoJmFkYXAtPmNsaWVudF9sb2NrLCBpMmNfYWRh
cHRlcl9kZXB0aChhZGFwKSk7CisJY2wgPSBfX2kyY19uZXdfY2xpZW50X2RldmljZShhZGFw
LCBpbmZvKTsKKwlydF9tdXRleF91bmxvY2soJmFkYXAtPmNsaWVudF9sb2NrKTsKKworCXJl
dHVybiBjbDsKK30KIEVYUE9SVF9TWU1CT0xfR1BMKGkyY19uZXdfY2xpZW50X2RldmljZSk7
CiAKIC8qKgpAQCAtMTUxNiw2ICsxNTMwLDcgQEAgc3RhdGljIGludCBpMmNfcmVnaXN0ZXJf
YWRhcHRlcihzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXApCiAKIAlhZGFwLT5sb2NrZWRfZmxh
Z3MgPSAwOwogCXJ0X211dGV4X2luaXQoJmFkYXAtPmJ1c19sb2NrKTsKKwlydF9tdXRleF9p
bml0KCZhZGFwLT5jbGllbnRfbG9jayk7CiAJcnRfbXV0ZXhfaW5pdCgmYWRhcC0+bXV4X2xv
Y2spOwogCW11dGV4X2luaXQoJmFkYXAtPnVzZXJzcGFjZV9jbGllbnRzX2xvY2spOwogCUlO
SVRfTElTVF9IRUFEKCZhZGFwLT51c2Vyc3BhY2VfY2xpZW50cyk7CkBAIC0yNDU3LDEzICsy
NDcyLDE1IEBAIHN0YXRpYyBpbnQgaTJjX2RldGVjdF9hZGRyZXNzKHN0cnVjdCBpMmNfY2xp
ZW50ICp0ZW1wX2NsaWVudCwKIAkJcmV0dXJuIGVycjsKIAl9CiAKKwlydF9tdXRleF9sb2Nr
X25lc3RlZCgmYWRhcHRlci0+Y2xpZW50X2xvY2ssIGkyY19hZGFwdGVyX2RlcHRoKGFkYXB0
ZXIpKTsKKwogCS8qIFNraXAgaWYgYWxyZWFkeSBpbiB1c2UgKDcgYml0LCBubyBuZWVkIHRv
IGVuY29kZSBmbGFncykgKi8KIAlpZiAoaTJjX2NoZWNrX2FkZHJfYnVzeShhZGFwdGVyLCBh
ZGRyLCBOVUxMKSkKLQkJcmV0dXJuIDA7CisJCWdvdG8gb3V0OwogCiAJLyogTWFrZSBzdXJl
IHRoZXJlIGlzIHNvbWV0aGluZyBhdCB0aGlzIGFkZHJlc3MgKi8KIAlpZiAoIWkyY19kZWZh
dWx0X3Byb2JlKGFkYXB0ZXIsIGFkZHIpKQotCQlyZXR1cm4gMDsKKwkJZ290byBvdXQ7CiAK
IAkvKiBGaW5hbGx5IGNhbGwgdGhlIGN1c3RvbSBkZXRlY3Rpb24gZnVuY3Rpb24gKi8KIAlt
ZW1zZXQoJmluZm8sIDAsIHNpemVvZihzdHJ1Y3QgaTJjX2JvYXJkX2luZm8pKTsKQEAgLTI0
NzIsNyArMjQ4OSw5IEBAIHN0YXRpYyBpbnQgaTJjX2RldGVjdF9hZGRyZXNzKHN0cnVjdCBp
MmNfY2xpZW50ICp0ZW1wX2NsaWVudCwKIAlpZiAoZXJyKSB7CiAJCS8qIC1FTk9ERVYgaXMg
cmV0dXJuZWQgaWYgdGhlIGRldGVjdGlvbiBmYWlscy4gV2UgY2F0Y2ggaXQKIAkJICAgaGVy
ZSBhcyB0aGlzIGlzbid0IGFuIGVycm9yLiAqLwotCQlyZXR1cm4gZXJyID09IC1FTk9ERVYg
PyAwIDogZXJyOworCQlpZiAoZXJyID09IC1FTk9ERVYpCisJCQllcnIgPSAwOworCQlnb3Rv
IG91dDsKIAl9CiAKIAkvKiBDb25zaXN0ZW5jeSBjaGVjayAqLwpAQCAtMjUwMCw3ICsyNTE5
LDkgQEAgc3RhdGljIGludCBpMmNfZGV0ZWN0X2FkZHJlc3Moc3RydWN0IGkyY19jbGllbnQg
KnRlbXBfY2xpZW50LAogCQkJZGV2X2VycigmYWRhcHRlci0+ZGV2LCAiRmFpbGVkIGNyZWF0
aW5nICVzIGF0IDB4JTAyeFxuIiwKIAkJCQlpbmZvLnR5cGUsIGluZm8uYWRkcik7CiAJfQot
CXJldHVybiAwOworb3V0OgorCXJ0X211dGV4X3VubG9jaygmYWRhcHRlci0+Y2xpZW50X2xv
Y2spOworCXJldHVybiBlcnI7CiB9CiAKIHN0YXRpYyBpbnQgaTJjX2RldGVjdChzdHJ1Y3Qg
aTJjX2FkYXB0ZXIgKmFkYXB0ZXIsIHN0cnVjdCBpMmNfZHJpdmVyICpkcml2ZXIpCkBAIC0y
NTU5LDExICsyNTgwLDE0IEBAIGkyY19uZXdfc2Nhbm5lZF9kZXZpY2Uoc3RydWN0IGkyY19h
ZGFwdGVyICphZGFwLAogCQkgICAgICAgdW5zaWduZWQgc2hvcnQgY29uc3QgKmFkZHJfbGlz
dCwKIAkJICAgICAgIGludCAoKnByb2JlKShzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXAsIHVu
c2lnbmVkIHNob3J0IGFkZHIpKQogeworCXN0cnVjdCBpMmNfY2xpZW50ICpjbDsKIAlpbnQg
aTsKIAogCWlmICghcHJvYmUpCiAJCXByb2JlID0gaTJjX2RlZmF1bHRfcHJvYmU7CiAKKwly
dF9tdXRleF9sb2NrX25lc3RlZCgmYWRhcC0+Y2xpZW50X2xvY2ssIGkyY19hZGFwdGVyX2Rl
cHRoKGFkYXApKTsKKwogCWZvciAoaSA9IDA7IGFkZHJfbGlzdFtpXSAhPSBJMkNfQ0xJRU5U
X0VORDsgaSsrKSB7CiAJCS8qIENoZWNrIGFkZHJlc3MgdmFsaWRpdHkgKi8KIAkJaWYgKGky
Y19jaGVja183Yml0X2FkZHJfdmFsaWRpdHlfc3RyaWN0KGFkZHJfbGlzdFtpXSkgPCAwKSB7
CkBAIC0yNTg3LDExICsyNjExLDE2IEBAIGkyY19uZXdfc2Nhbm5lZF9kZXZpY2Uoc3RydWN0
IGkyY19hZGFwdGVyICphZGFwLAogCiAJaWYgKGFkZHJfbGlzdFtpXSA9PSBJMkNfQ0xJRU5U
X0VORCkgewogCQlkZXZfZGJnKCZhZGFwLT5kZXYsICJQcm9iaW5nIGZhaWxlZCwgbm8gZGV2
aWNlIGZvdW5kXG4iKTsKLQkJcmV0dXJuIEVSUl9QVFIoLUVOT0RFVik7CisJCWNsID0gRVJS
X1BUUigtRU5PREVWKTsKKwkJZ290byBvdXQ7CiAJfQogCiAJaW5mby0+YWRkciA9IGFkZHJf
bGlzdFtpXTsKLQlyZXR1cm4gaTJjX25ld19jbGllbnRfZGV2aWNlKGFkYXAsIGluZm8pOwor
CWNsID0gX19pMmNfbmV3X2NsaWVudF9kZXZpY2UoYWRhcCwgaW5mbyk7CisKK291dDoKKwly
dF9tdXRleF91bmxvY2soJmFkYXAtPmNsaWVudF9sb2NrKTsKKwlyZXR1cm4gY2w7CiB9CiBF
WFBPUlRfU1lNQk9MX0dQTChpMmNfbmV3X3NjYW5uZWRfZGV2aWNlKTsKIApkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9saW51eC9pMmMuaCBiL2luY2x1ZGUvbGludXgvaTJjLmgKaW5kZXggNDI0
YWNiOThjLi45ODFiMTYxNDcgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvaTJjLmgKKysr
IGIvaW5jbHVkZS9saW51eC9pMmMuaApAQCAtNDU3LDYgKzQ1Nyw4IEBAIHN0cnVjdCBpMmNf
Ym9hcmRfaW5mbyB7CiAgKi8KIHN0cnVjdCBpMmNfY2xpZW50ICoKIGkyY19uZXdfY2xpZW50
X2RldmljZShzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXAsIHN0cnVjdCBpMmNfYm9hcmRfaW5m
byBjb25zdCAqaW5mbyk7CitzdHJ1Y3QgaTJjX2NsaWVudCAqCitfX2kyY19uZXdfY2xpZW50
X2RldmljZShzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmFkYXAsIHN0cnVjdCBpMmNfYm9hcmRfaW5m
byBjb25zdCAqaW5mbyk7CiAKIC8qIElmIHlvdSBkb24ndCBrbm93IHRoZSBleGFjdCBhZGRy
ZXNzIG9mIGFuIEkyQyBkZXZpY2UsIHVzZSB0aGlzIHZhcmlhbnQKICAqIGluc3RlYWQsIHdo
aWNoIGNhbiBwcm9iZSBmb3IgZGV2aWNlIHByZXNlbmNlIGluIGEgbGlzdCBvZiBwb3NzaWJs
ZQpAQCAtNzI1LDYgKzcyNyw3IEBAIHN0cnVjdCBpMmNfYWRhcHRlciB7CiAJLyogZGF0YSBm
aWVsZHMgdGhhdCBhcmUgdmFsaWQgZm9yIGFsbCBkZXZpY2VzCSovCiAJY29uc3Qgc3RydWN0
IGkyY19sb2NrX29wZXJhdGlvbnMgKmxvY2tfb3BzOwogCXN0cnVjdCBydF9tdXRleCBidXNf
bG9jazsKKwlzdHJ1Y3QgcnRfbXV0ZXggY2xpZW50X2xvY2s7CiAJc3RydWN0IHJ0X211dGV4
IG11eF9sb2NrOwogCiAJaW50IHRpbWVvdXQ7CQkJLyogaW4gamlmZmllcyAqLwotLSAKMi40
NS4yCgo=

--------------Z1TIodgfP0JzfXXIP94x6dei--

