Return-Path: <linux-i2c+bounces-4289-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 58773914201
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 07:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7310D1C22832
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Jun 2024 05:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 547F417BBE;
	Mon, 24 Jun 2024 05:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpeK3FlY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D061401B;
	Mon, 24 Jun 2024 05:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719207201; cv=none; b=XaSDcX4SqBxck78n+yAkxabHjk7BY5CdU6dK8AX7WJ0NhvRZka9R6K/9EiMyKtOBONTyV2pNybgZnk9pmL2xOpu5dh0D4/zq6rZJ7hYmH0N6sY9u2yfBhs8L46+6clzjP/kicLbAXObbjE1QLKG67n0ImrCuGe8iFJaVzbtkCMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719207201; c=relaxed/simple;
	bh=z1BrGnYUDbKZmg3f6yiTPDOegDoG3pB03SchslQhc00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i3E5lMbGHXFvERvgxw4b4czW8+qp4cPa0eaY5/0A3SrJpUTGg+w+TJehS5k0Tb/5OoTGHNrdw9M+me4GNnNVsmfhzEj+Y+JRUPtc0WbU0XftpJhD1my2YmsWcVvpc2KG/9ULOb2go+MpX6ADbWW5gu/nn2NOZOnpOiCFqFVazl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JpeK3FlY; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2bfdae7997aso2954906a91.2;
        Sun, 23 Jun 2024 22:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719207198; x=1719811998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=LQiPoNMjcTW+RcRaWsx6OTjU9n4+EdUgmXoh3YXnEWw=;
        b=JpeK3FlYPJHcpsr/o+mqAtzACbpZFVG4ktMBaIABfMc8uLmaUIEojPiN19VcBvdEjt
         JqD+Mwu+JCXixCiWOUrg1ReLzSEoQIkdkIzmyo6yPI/tQm6AbKXMOcGDdlsVWQldeVN4
         6HXBJWWODMrk7YfjxoofIUZk0oIZvKOcLhG49EQAUgQ8ZiiICJzj68KPQNns3zXliOpO
         DrXoHXOqIKazXLlA8V+4YQ5arWRUot9zIFWQ5ULQvwzcm8QrBNsdwwswSRHjRtd1y5rd
         BazSGYIw5nNL1Acvg7AwD/iEVb/CaUM6bm5fnWvglkRhbkr7SHMIb02uJP515ao7gCQN
         HenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719207198; x=1719811998;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQiPoNMjcTW+RcRaWsx6OTjU9n4+EdUgmXoh3YXnEWw=;
        b=s4CfJtQLsKN+pCC34KuzkzJLQF68pITpFb8+6tlW729zZkDAweVoIFO2sEVp4oD5Dk
         KhkWbxD/Ja7e3izetsjdnwWKDVL3zAyHPuL0PM5K1qgSQJB40lp960q0oQQJYnZEAdmR
         CK0lb+hKFUWJlNP2A6T07bnhzhebJd9G5qceY5jaNfSmq/wy9MAh2qf0kVMc2qSDIpe4
         yf+WHdqG12/Mvgn6lP1kPjcScgzz1aIC6eDASpvTYVfT0rlEOl2jpnU+VomMpoFkY5Ia
         stTNpjr3P6WWBrXh8iMTeEW11OXdEZ58LhWGeNDtz1YygoJHnuvBDv6xa+okjAWvpZWU
         cM5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXGZEhl8ECCT16BUz0yIbhjRddlCw3hlDU4XafnVGZuyDrtNaSUQito532sdDRP36QU84mWWGwzaP8l4CEv2zfnyy5D/oQz/cnjz1I9JRyGNueGQMJKnOjyThlhsxUeQbRRt4iEPj0ayZFrp52Px64tLgmsUkKnlSYM9mwmw9zjgUKYef4=
X-Gm-Message-State: AOJu0Yxebg1P6orHn6kagOCcVkLxdvEX/DU9VGAQmEMPbidbwDgCSgAi
	aHBfVOYbV3azA9VmXQMbtGKZ29KqaOHn3uikBoB9Tg7DVfp8tYU9
X-Google-Smtp-Source: AGHT+IHp5jiX18y41qZljuRUfdpn/O4kTXimiTYloUVhVm1VsBcEXPntP3lGoyEmsNOkIl38I17aZQ==
X-Received: by 2002:a17:90b:e97:b0:2c7:b80f:75f2 with SMTP id 98e67ed59e1d1-2c86126b738mr2651574a91.23.1719207198304;
        Sun, 23 Jun 2024 22:33:18 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c7e4f03c4esm7943728a91.6.2024.06.23.22.33.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jun 2024 22:33:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0dfa2919-98eb-4433-acb4-aa1830787c9b@roeck-us.net>
Date: Sun, 23 Jun 2024 22:33:15 -0700
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
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: stable@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-hwmon@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <a57e9a39-13ce-4e4d-a7a1-c591f6b4ac65@ans.pl>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <a57e9a39-13ce-4e4d-a7a1-c591f6b4ac65@ans.pl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/23/24 11:47, Krzysztof Olędzki wrote:
> Hi,
> 
> After upgrading kernel to Linux 6.6.34 on one of my systems, I noticed "sysfs: cannot create duplicate filename" and i2c registration errors in dmesg, please see below.
> 
> This seems to be related to https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.6.y&id=4d5ace787273cb159bfdcf1c523df957938b3e42 - reverting the change fixes the problem.
> 
> Note that jc42 devices are registered correctly and work with and without the change.
> 

My guess is that the devices are fist instantiated through the jc42
driver's _detect function and then again from the at24 driver.
The at24 driver should possibly call i2c_new_scanned_device() instead
of i2c_new_client_device() to only instantiate the device if it wasn't
already instantiated.

Guenter

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
>                         (high = +91.0°C, hyst = +91.0°C)
>                         (crit = +95.0°C, hyst = +95.0°C)
> --
> jc42-i2c-12-19
> Adapter: SMBus I801 adapter at 3000
> temp1:        +33.5°C  (low  =  +0.0°C)
>                         (high = +91.0°C, hyst = +91.0°C)
>                         (crit = +95.0°C, hyst = +95.0°C)
> --
> jc42-i2c-12-1a
> Adapter: SMBus I801 adapter at 3000
> temp1:        +33.5°C  (low  =  +0.0°C)
>                         (high = +91.0°C, hyst = +91.0°C)
>                         (crit = +95.0°C, hyst = +95.0°C)
> --
> jc42-i2c-12-18
> Adapter: SMBus I801 adapter at 3000
> temp1:        +33.2°C  (low  =  +0.0°C)
>                         (high = +91.0°C, hyst = +91.0°C)
>                         (crit = +95.0°C, hyst = +95.0°C)
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
>   Krzysztof


