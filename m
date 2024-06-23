Return-Path: <linux-i2c+bounces-4287-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFBA913D9E
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 21:00:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 54C4C1F21903
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Jun 2024 19:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9087D1836D8;
	Sun, 23 Jun 2024 19:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ans.pl header.i=@ans.pl header.b="i4YLnqOv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.emenem.pl (cmyk.emenem.pl [217.79.154.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250A714884C;
	Sun, 23 Jun 2024 19:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.79.154.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719169233; cv=none; b=YZYCcM2sxd9zUdptnlAWSx6T1lFzhQsoNH0SRSit9hdFf0+txOXUGeFsah4Igv3rXrS60aq4yfKHIiwo2iC6ZujHkD9ottD2so+P49n3euWKgL5GEC8q+ZZd7GQ85bEXIVsCpI7AFg13wXLehTc9gU42I2xDqlfxOS3x6wFlqWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719169233; c=relaxed/simple;
	bh=qzc1rsDiN8j7iEnMzlh7jqK3ss+j7dWOOp7vhyRU7YY=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=SufqUtcgmGplruBJuj6mIuo/bczupl8PXIPPuw+7FMU9vyh/m8fkjHqC1CLuee4Unjp2qAFvtmKnhtjwmMkKwruSBokxMi7G+kHnCb+8k6i/916M8QZnEVtaY/z/g7Qf6rF2DsFNlWr8vvaxFVmHSZi8EEZmXOxQOTZVPmeVN9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ans.pl; spf=none smtp.mailfrom=ans.pl; dkim=pass (1024-bit key) header.d=ans.pl header.i=@ans.pl header.b=i4YLnqOv; arc=none smtp.client-ip=217.79.154.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ans.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ans.pl
X-Virus-Scanned: amavisd-new at emenem.pl
Received: from [192.168.1.10] (c-98-45-176-131.hsd1.ca.comcast.net [98.45.176.131])
	(authenticated bits=0)
	by cmyk.emenem.pl (8.17.1.9/8.17.1.9) with ESMTPSA id 45NIlfW5005236
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sun, 23 Jun 2024 20:47:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ans.pl; s=20190507;
	t=1719168466; bh=blP9kTlShQLTEEvQ48fKrZcg3eT1y3M9qA5WwxT5rN4=;
	h=Date:From:To:Cc:Subject;
	b=i4YLnqOv6jMrMjpF5FKdSZmRcyUvkxVNDtrc6u8ant03qzut3cSXx/kL8V/SsRuED
	 fdXc0JR9hOG3L/v/us8Drcv5gOFXoD/xKSWtHarq/VvAcsZXRubWXHZxsi2J2X8kdh
	 gkYziZhyEEJYrX/ZGSlEUQbIPknOvDASrsq0U0t8=
Message-ID: <a57e9a39-13ce-4e4d-a7a1-c591f6b4ac65@ans.pl>
Date: Sun, 23 Jun 2024 11:47:39 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: =?UTF-8?Q?Krzysztof_Ol=C4=99dzki?= <ole@ans.pl>
To: Heiner Kallweit <hkallweit1@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: stable@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Regression caused by "eeprom: at24: Probe for DDR3 thermal sensor in
 the SPD case" - "sysfs: cannot create duplicate filename"
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

After upgrading kernel to Linux 6.6.34 on one of my systems, I noticed "sysfs: cannot create duplicate filename" and i2c registration errors in dmesg, please see below.

This seems to be related to https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.6.y&id=4d5ace787273cb159bfdcf1c523df957938b3e42 - reverting the change fixes the problem.

Note that jc42 devices are registered correctly and work with and without the change.

# grep . /sys/devices/pci0000:00/0000:00:1f.3/i2c-12/12-*/name
/sys/devices/pci0000:00/0000:00:1f.3/i2c-12/12-0018/name:jc42
/sys/devices/pci0000:00/0000:00:1f.3/i2c-12/12-0019/name:jc42
/sys/devices/pci0000:00/0000:00:1f.3/i2c-12/12-001a/name:jc42
/sys/devices/pci0000:00/0000:00:1f.3/i2c-12/12-001b/name:jc42
/sys/devices/pci0000:00/0000:00:1f.3/i2c-12/12-0050/name:spd
/sys/devices/pci0000:00/0000:00:1f.3/i2c-12/12-0051/name:spd
/sys/devices/pci0000:00/0000:00:1f.3/i2c-12/12-0052/name:spd
/sys/devices/pci0000:00/0000:00:1f.3/i2c-12/12-0053/name:spd

# sensors|grep -A4 jc42-i2c
jc42-i2c-12-1b
Adapter: SMBus I801 adapter at 3000
temp1:        +33.2°C  (low  =  +0.0°C)
                       (high = +91.0°C, hyst = +91.0°C)
                       (crit = +95.0°C, hyst = +95.0°C)
--
jc42-i2c-12-19
Adapter: SMBus I801 adapter at 3000
temp1:        +33.5°C  (low  =  +0.0°C)
                       (high = +91.0°C, hyst = +91.0°C)
                       (crit = +95.0°C, hyst = +95.0°C)
--
jc42-i2c-12-1a
Adapter: SMBus I801 adapter at 3000
temp1:        +33.5°C  (low  =  +0.0°C)
                       (high = +91.0°C, hyst = +91.0°C)
                       (crit = +95.0°C, hyst = +95.0°C)
--
jc42-i2c-12-18
Adapter: SMBus I801 adapter at 3000
temp1:        +33.2°C  (low  =  +0.0°C)
                       (high = +91.0°C, hyst = +91.0°C)
                       (crit = +95.0°C, hyst = +95.0°C)


dmesg:
[    0.000000] DMI: Dell Inc. PowerEdge T110 II/0PM2CW, BIOS 2.10.0 05/24/2018
(...)
[    7.681132] i2c_dev: i2c /dev entries driver
[    7.687116] i2c i2c-12: 4/4 memory slots populated (from DMI)
[    7.690623] at24 12-0050: 256 byte spd EEPROM, read-only
[    7.691812] i2c i2c-12: Successfully instantiated SPD at 0x50
[    7.698246] at24 12-0051: 256 byte spd EEPROM, read-only
[    7.699465] i2c i2c-12: Successfully instantiated SPD at 0x51
[    7.700043] i2c i2c-12: Failed to register i2c client jc42 at 0x19 (-16)
[    7.700047] i2c i2c-12: Failed creating jc42 at 0x19
[    7.705248] sysfs: cannot create duplicate filename '/devices/pci0000:00/0000:00:1f.3/i2c-12/12-001a'
[    7.711617]  <TASK>
[    7.712612]  dump_stack_lvl+0x37/0x4a
[    7.712612]  sysfs_warn_dup+0x55/0x61
[    7.715616]  sysfs_create_dir_ns+0xa6/0xd2
[    7.716620]  kobject_add_internal+0xc3/0x1c0
[    7.716620]  kobject_add+0xba/0xe4
[    7.719615]  ? device_add+0x53/0x726
[    7.720611]  device_add+0x132/0x726
[    7.720611]  i2c_new_client_device+0x1ee/0x246
[    7.723616]  at24_probe+0x5f8/0x666
[    7.724642]  ? __pfx_at24_read+0x10/0x10
[    7.724642]  ? __pfx_at24_write+0x10/0x10
[    7.724642]  ? __pfx___device_attach_driver+0x10/0x10
[    7.727619]  i2c_device_probe+0x1b7/0x240
[    7.728612]  really_probe+0x101/0x248
[    7.728612]  __driver_probe_device+0xbb/0xed
[    7.731620]  driver_probe_device+0x1a/0x72
[    7.732621]  __device_attach_driver+0x82/0x96
[    7.732621]  bus_for_each_drv+0xa6/0xd4
[    7.732621]  __device_attach+0xa8/0x12a
[    7.735619]  bus_probe_device+0x31/0x95
[    7.736614]  device_add+0x265/0x726
[    7.736614]  i2c_new_client_device+0x1ee/0x246
[    7.739618]  i2c_register_spd+0x1a1/0x1ed
[    7.740613]  i801_probe+0x589/0x603
[    7.740613]  ? up_write+0x37/0x4d
[    7.740613]  ? kernfs_add_one+0x104/0x126
[    7.743618]  ? __raw_spin_unlock_irqrestore+0x14/0x29
[    7.744612]  pci_device_probe+0xbe/0x12f
[    7.744612]  really_probe+0x101/0x248
[    7.744612]  __driver_probe_device+0xbb/0xed
[    7.747618]  driver_probe_device+0x1a/0x72
[    7.748612]  __driver_attach_async_helper+0x2d/0x42
[    7.748612]  async_run_entry_fn+0x25/0xa0
[    7.748612]  process_scheduled_works+0x193/0x291
[    7.748612]  worker_thread+0x1c5/0x21f
[    7.751619]  ? __pfx_worker_thread+0x10/0x10
[    7.752611]  kthread+0xf6/0xfe
[    7.752611]  ? __pfx_kthread+0x10/0x10
[    7.752611]  ret_from_fork+0x23/0x35
[    7.755621]  ? __pfx_kthread+0x10/0x10
[    7.756613]  ret_from_fork_asm+0x1b/0x30
[    7.756613]  </TASK>
[    7.759637] i2c i2c-12: Failed to register i2c client jc42 at 0x1a (-17)
[    7.760815] at24 12-0052: 256 byte spd EEPROM, read-only
[    7.762047] i2c i2c-12: Successfully instantiated SPD at 0x52
[    7.765252] i2c i2c-12: Failed to register i2c client jc42 at 0x1b (-16)
[    7.766126] at24 12-0053: 256 byte spd EEPROM, read-only
[    7.767584] i2c i2c-12: Successfully instantiated SPD at 0x53

Thanks,
 Krzysztof

