Return-Path: <linux-i2c+bounces-4395-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E66191A658
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 14:13:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27C281C21232
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 12:13:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93CBF15278C;
	Thu, 27 Jun 2024 12:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ans.pl header.i=@ans.pl header.b="VSrKkyrQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.emenem.pl (cmyk.emenem.pl [217.79.154.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B5214882B;
	Thu, 27 Jun 2024 12:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.79.154.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719490377; cv=none; b=iTVoho0ZDAcGtSbfwCxNkhFBKm/ey2Ni8zn2EOR9F/Iav8eNaxv9bUBvkj3Dy6l7PKYzrMSfYVyf8uukn9IEeXSdirjjrNCotG1tBcqO45jDhC3TL4CmXg7noD5Tq11b0MJ0l1hKHjomDYyRrZb71ngdMZM/bRJUZ3iui2DS+Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719490377; c=relaxed/simple;
	bh=vUrIpTG9oETZl1YZ1umSdqMPHIfCPEeA5plf7s/3hfc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=fT19FNTVliuGrWfpAT19qnaFTP02ydjZcUPv1ooTGpQJO69d7X+N6sbrw75zBF7KpM+cZEjUee4d0L/kZTMLvQ+D9rBy6q2/KY5usA8crUQPpMPnWPvCTngsyxpn/2pWq/FyOTEUc3w2jYzwkpLmWYuU9C7r4BZ0R+dCqBDl3SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ans.pl; spf=none smtp.mailfrom=ans.pl; dkim=pass (1024-bit key) header.d=ans.pl header.i=@ans.pl header.b=VSrKkyrQ; arc=none smtp.client-ip=217.79.154.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ans.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ans.pl
X-Virus-Scanned: amavisd-new at emenem.pl
Received: from [192.168.1.10] (c-98-45-176-131.hsd1.ca.comcast.net [98.45.176.131])
	(authenticated bits=0)
	by cmyk.emenem.pl (8.17.1.9/8.17.1.9) with ESMTPSA id 45RCCIVZ008585
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 27 Jun 2024 14:12:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ans.pl; s=20190507;
	t=1719490342; bh=QBvgsSy1scU8OJ7RBK3h/br+lN+Asf3nUcLwIGTo24U=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To;
	b=VSrKkyrQMoZHRLuxCqHs9nCAl3SGe/VrIxYlZRAwLA0j2hlPY9p2GrGdfEfVLP4d2
	 dnqAfwewGbrFE9EagdbNlpPYjLsFsamRqwyyGs3i8Q1ZyoxRGYJRxyTb014Q4XBSko
	 bHa0LkF0H8m9wycWirvuOxBTuEy4NCT4ye2TeW7g=
Message-ID: <ee1996fa-4cdd-4897-b7fa-800cc9863599@ans.pl>
Date: Thu, 27 Jun 2024 05:12:17 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression caused by "eeprom: at24: Probe for DDR3 thermal sensor
 in the SPD case" - "sysfs: cannot create duplicate filename"
From: =?UTF-8?Q?Krzysztof_Ol=C4=99dzki?= <ole@ans.pl>
To: Guenter Roeck <linux@roeck-us.net>,
        Heiner Kallweit
 <hkallweit1@gmail.com>,
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
 <797c8371-dff3-4112-9733-4d3119670dbf@gmail.com>
 <5a4e1cd6-5770-423b-9a25-a0fbfd93014a@roeck-us.net>
 <9541ab9f-0f13-4856-85f0-14615b77142f@ans.pl>
Content-Language: en-US
In-Reply-To: <9541ab9f-0f13-4856-85f0-14615b77142f@ans.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.06.2024 at 04:29, Krzysztof Olędzki wrote:
> On 24.06.2024 at 20:45, Guenter Roeck wrote:
>> On 6/24/24 13:58, Heiner Kallweit wrote:
>> [ ... ]
>>>
>>> Too me the issue also looks like a race. According to the OP's logs:
>>> - jc42 at 0x18 is instantiated successfully
>>> - jc42 at 0x19 returns -EBUSY. This is what is expected if the device
>>>    has been instantiated otherwise already.
>>> - jc42 at 0x1a returns -EEXIST. Here two instantiations of the the same
>>>    device seem to collide.
>>> - jc42 at 0x1b returns -EBUSY, like at 0x19.
>>>
>>> So it looks like referenced change isn't wrong, but reveals an
>>> underlying issue with device instantiation races.
>>
>> It isn't just a race, though. Try to unload the at24 (or ee1004 driver
>> for DDR4) and load it again, and you'll see the -EBUSY errors. Problem
>> is that instantiating those drivers _always_ triggers the call to
>> i2c_new_client_device() even if the jc42 device is already instantiated.
>> Unloading the spd/eeprom driver doesn't unload the jc42 driver,
>> so -EBUSY will be seen if the spd/eeprom driver is loaded again.
>>
>> I have not been able to reproduce the backtrace with my systems, but those
>> are all with AMD CPUs using the piix4 driver, so timing is likely different.
>> Another difference is that my systems (with DDR4) use the ee1004 driver.
>> That driver instantiates the jc42 devices under a driver lock, so it is
>> guaranteed that a single instantiation doesn't interfere with other
>> instantiations running in parallel.
> 
> Right, sorry for not mentioning this in the original report:
> 
> [    0.269013] pci 0000:00:1f.3: [8086:1c22] type 00 class 0x0c0500
> [    0.269098] pci 0000:00:1f.3: reg 0x10: [mem 0xc3a02000-0xc3a020ff 64bit]
> [    0.269186] pci 0000:00:1f.3: reg 0x20: [io  0x3000-0x301f]
> [    0.334962] pci 0000:00:1f.3: Adding to iommu group 7
> [    7.874736] i801_smbus 0000:00:1f.3: SMBus using PCI interrupt
> 
> $ lspci -s 0000:00:1f.3 -vvnn
> 00:1f.3 SMBus [0c05]: Intel Corporation 6 Series/C200 Series Chipset Family SMBus Controller [8086:1c22] (rev 04)
>         Subsystem: Dell Device [1028:04de]
>         Control: I/O+ Mem+ BusMaster- SpecCycle- MemWINV- VGASnoop- ParErr- Stepping- SERR- FastB2B- DisINTx-
>         Status: Cap- 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort- <TAbort- <MAbort- >SERR- <PERR- INTx-
>         Interrupt: pin C routed to IRQ 19
>         IOMMU group: 7
>         Region 0: Memory at c3a02000 (64-bit, non-prefetchable) [size=256]
>         Region 4: I/O ports at 3000 [size=32]
>         Kernel driver in use: i801_smbus

Also, here is a different trace showing a different code path, which even more suggest a race:

[    7.871973] i2c_dev: i2c /dev entries driver
[    7.878215] i2c i2c-12: 4/4 memory slots populated (from DMI)
[    7.881116] at24 12-0050: 256 byte spd EEPROM, read-only
[    7.881887] i2c i2c-12: Successfully instantiated SPD at 0x50
[    7.894183] at24 12-0051: 256 byte spd EEPROM, read-only
[    7.895910] i2c i2c-12: Failed to register i2c client jc42 at 0x19 (-16)
[    7.896039] i2c i2c-12: Successfully instantiated SPD at 0x51
[    7.896850] i2c i2c-12: Failed creating jc42 at 0x19
[    7.903444] sysfs: cannot create duplicate filename '/devices/pci0000:00/0000:00:1f.3/i2c-12/12-001a'
[    7.904085] at24 12-0052: 256 byte spd EEPROM, read-only
[    7.905284] Hardware name: Dell Inc. PowerEdge T110 II/0PM2CW, BIOS 2.10.0 05/24/2018
[    7.905284] Call Trace:
[    7.905284]  <TASK>
[    7.909238]  dump_stack_lvl+0x37/0x4a
[    7.910488] at24 12-0053: 256 byte spd EEPROM, read-only
[    7.909855]  sysfs_warn_dup+0x55/0x61
[    7.911456] i2c i2c-12: Successfully instantiated SPD at 0x53
[    7.911597]  sysfs_create_dir_ns+0xa6/0xd2
[    7.911597]  kobject_add_internal+0xc3/0x1c0
[    7.914606]  kobject_add+0xba/0xe4
[    7.915595]  ? device_add+0x53/0x726
[    7.915595]  device_add+0x132/0x726
[    7.916622]  i2c_new_client_device+0x1ee/0x246
[    7.916622]  i2c_detect.isra.0+0x17c/0x223
[    7.918603]  ? __pfx___process_new_driver+0x10/0x10
[    7.919603]  __process_new_driver+0x17/0x1e
[    7.919603]  bus_for_each_dev+0x8b/0xcf
[    7.920595]  ? __pfx___process_new_driver+0x10/0x10
[    7.920595]  i2c_for_each_dev+0x2d/0x49
[    7.922608]  i2c_register_driver+0x51/0x63
[    7.922608]  ? __pfx_jc42_driver_init+0x10/0x10
[    7.923595]  do_one_initcall+0x93/0x182
[    7.924601]  kernel_init_freeable+0x1be/0x204
[    7.924601]  ? __pfx_kernel_init+0x10/0x10
[    7.924601]  kernel_init+0x15/0x110
[    7.926609]  ret_from_fork+0x23/0x35
[    7.927602]  ? __pfx_kernel_init+0x10/0x10
[    7.927602]  ret_from_fork_asm+0x1b/0x30
[    7.927602]  </TASK>
[    7.929937] kobject: kobject_add_internal failed for 12-001a with -EEXIST, don't try to register things with the same name in the same directory.
[    7.932129] i2c i2c-12: Failed to register i2c client jc42 at 0x1a (-17)
[    7.933257] i2c i2c-12: Failed creating jc42 at 0x1a

Note there is no warning for 0x18 and 0x1b.

# sensors|grep jc42-i2c|sort
jc42-i2c-12-18
jc42-i2c-12-19
jc42-i2c-12-1a
jc42-i2c-12-1b


Krzysztof


