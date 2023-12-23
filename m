Return-Path: <linux-i2c+bounces-976-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCA081D3FB
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Dec 2023 13:19:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BCA51C21565
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Dec 2023 12:19:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DB00D278;
	Sat, 23 Dec 2023 12:19:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lu1i+UCu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A4AD270;
	Sat, 23 Dec 2023 12:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0F3C433C8;
	Sat, 23 Dec 2023 12:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703333984;
	bh=rHTtxHf9a3r4vHR095B9f16IsZX5OlwLQpQs/jrKrM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lu1i+UCub3bVYPAFVUbt96J9iYE38QtWbUazww2LxmfsUF4I47xIjcu50GhjHHYgZ
	 Vp2G++oq36HrQIz4Kjl8qX8srMImw+M/R9HGOdYcILe8KdiW8mrmXAhigzKtPmK3OK
	 MF+f8wPWe4U8XgIvdkN5ILgRawQS2gK9vNGnMp5eVmkVi3eC1rYk2e4/7obNTNvHKR
	 Y97dHXbhbnRWpKw4BP3PbBEY7di4EjTKk3nI0H/aaxgdZt9fJacZFSll0kj3XJj0yr
	 j1jacGgeL4DvU/0GBaAAvyITDfk8hAeFCTMXZijQ6r5MD9daUO1fJDkFXpTek0Y8ps
	 yVnxh8Yt/cFFw==
Received: by pali.im (Postfix)
	id 8CA35A3B; Sat, 23 Dec 2023 13:19:41 +0100 (CET)
Date: Sat, 23 Dec 2023 13:19:41 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Kai-Heng Feng <kai.heng.feng@canonical.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Marius Hoch <mail@mariushoch.de>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Dell.Client.Kernel@dell.com, Greg KH <gregkh@linuxfoundation.org>
Subject: Re: Ideas for a generic solution to support accelerometer lis3lv02d
 in Dell laptops/notebooks?
Message-ID: <20231223121941.65di3dimdht4kyw5@pali>
References: <4820e280-9ca4-4d97-9d21-059626161bfc@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4820e280-9ca4-4d97-9d21-059626161bfc@molgen.mpg.de>
User-Agent: NeoMutt/20180716

On Saturday 23 December 2023 10:39:18 Paul Menzel wrote:
> Dear Linux folks,
> 
> 
> Currently, on Dell systems with the accelerometer lis3lv02d, its I²C address
> needs to be added to `dell_lis3lv02d_devices[]` in
> `drivers/i2c/busses/i2c-i801.c`.

Hello. This is because smbus bus do not have smart discovery
capabilities like PCIe or USB buses. The device address has to be
somewhere stored. And at the moment it is in the parent bus driver.

> In Linux 6.7-rc6 that array has nine elements, so only a small fraction of
> all Dell notebooks is listed. Searching the Linux logs uploaded to the Linux
> hardware database from May 2023 [1], there are around 129 devices without
> support in the Linux kernel version the upload was done with.

In Dell ACPI device table is already stored information if the smbus
device is present in the laptop or not. And there is (or at least was
for older models) also interrupt number in ACPI device resource list.
Kernel driver already registers for interrupt events.

What is missing the ACPI device resource list is that smbus device
address on which is device listening. Or better, it was missing for
older models. I have not checked new models.

Why it is missing, I have no idea. As ACPI tables are passed to kernel
by laptop firmware (BIOS/UEFI) I bet that this is just a programming
error that somebody forgot to put this information there.

I think that it was Mario who is the past confirmed smbus address of few
models and confirmed also information that address is not really stored
in the ACPI tables.

Before taking any future steps it would be needed to confirm if the
smbus device address is still missing in the ACPI device resource list
in the new laptop models.

> Do you know, how the Microsoft Windows driver is doing this? Is it
> hard-coded there too, or can it be deduced somehow, for example from the
> ACPI tables?

In past on Windows laptops it was always needed to install correct and
specific version of drivers for every laptop, I would not be surprised
that smbus device address can be there hardcoded too. I really do not
remember details, it is years ago when I was looking at this particular
problem. But these practises do not (or at least should not) apply to
modern Windows machines, so it can be possible that new Windows drivers
can discover it somehow (read from BIOS, UEFI, EEPROM, ACPI methods,
etc.). Or there is another option: There is no Windows driver for it at
all (and so no problem).

If you have such new laptops then the best for you is to do inspection.
Look how is device driver registered, how the application communicate
with drivers, look at device resources, etc... Basically Linux kernel
driver should use same resources as the Windows kernel driver.

> I added some Kai-Heng and Hans to Cc as they might have contact. Dell offers
> or offered quite a few of the models with official Ubuntu support, so I
> would have hoped to have a generic solution for this. Maybe Mario can also
> forward it to the Dell team.

This is really question for Dell people.

We have done the best what we were able, but internal wiring of the
Dell laptop boards and how it is reported to the operating system is
really what only Dell firmware people or other Dell team can do it.

> 
> 
> Kind regards,
> 
> Paul
> 
> 
> [1]: https://github.com/linuxhw/Dmesg
> 
> 
> PS: Dell devices in Linux hardware database with accelerometer:
> 
> linux-hardware-dmesg/Notebook/Dell (main)$ git grep -l ccelerome | cut -d
> '/' -f 1,2 | sort -u
> Inspiron/Inspiron 11 - 3147
> Inspiron/Inspiron 5520
> Inspiron/Inspiron 7547
> Inspiron/Inspiron 7548
> Latitude/Latitude 12 Rugged Extreme
> Latitude/Latitude 2110
> Latitude/Latitude 2120
> Latitude/Latitude 3330
> Latitude/Latitude 3380
> Latitude/Latitude 3400
> Latitude/Latitude 3470
> Latitude/Latitude 3480
> Latitude/Latitude 3490
> Latitude/Latitude 3500
> Latitude/Latitude 3570
> Latitude/Latitude 3580
> Latitude/Latitude 3590
> Latitude/Latitude 5280
> Latitude/Latitude 5290
> Latitude/Latitude 5400
> Latitude/Latitude 5401
> Latitude/Latitude 5410
> Latitude/Latitude 5411
> Latitude/Latitude 5414
> Latitude/Latitude 5420 Rugged
> Latitude/Latitude 5424 Rugged
> Latitude/Latitude 5480
> Latitude/Latitude 5490
> Latitude/Latitude 5491
> Latitude/Latitude 5500
> Latitude/Latitude 5501
> Latitude/Latitude 5510
> Latitude/Latitude 5511
> Latitude/Latitude 5531
> Latitude/Latitude 5580
> Latitude/Latitude 5590
> Latitude/Latitude 5591
> Latitude/Latitude 7214
> Latitude/Latitude 7414
> Latitude/Latitude 7424 Rugged Extreme
> Latitude/Latitude E4310
> Latitude/Latitude E5270
> Latitude/Latitude E5410
> Latitude/Latitude E5420
> Latitude/Latitude E5420m
> Latitude/Latitude E5430 non-vPro
> Latitude/Latitude E5430 vPro
> Latitude/Latitude E5440
> Latitude/Latitude E5470
> Latitude/Latitude E5510
> Latitude/Latitude E5520
> Latitude/Latitude E5520m
> Latitude/Latitude E5530 non-vPro
> Latitude/Latitude E5530 vPro
> Latitude/Latitude E5540
> Latitude/Latitude E5570
> Latitude/Latitude E6220
> Latitude/Latitude E6230
> Latitude/Latitude E6320
> Latitude/Latitude E6330
> Latitude/Latitude E6410
> Latitude/Latitude E6420
> Latitude/Latitude E6430
> Latitude/Latitude E6430s
> Latitude/Latitude E6440
> Latitude/Latitude E64406342Q0286-
> Latitude/Latitude E6510
> Latitude/Latitude E6520
> Latitude/Latitude E6530
> Latitude/Latitude E6540
> Latitude/Latitude E7440
> Latitude/Latitude XT3
> Precision/Precision 3510
> Precision/Precision 3520
> Precision/Precision 3530
> Precision/Precision 3540
> Precision/Precision 3541
> Precision/Precision 3550
> Precision/Precision 3551
> Precision/Precision 3571
> Precision/Precision 5510
> Precision/Precision 5520
> Precision/Precision 5530
> Precision/Precision 5540
> Precision/Precision 7510
> Precision/Precision 7520
> Precision/Precision 7530
> Precision/Precision 7540
> Precision/Precision 7710
> Precision/Precision 7720
> Precision/Precision 7730
> Precision/Precision 7740
> Precision/Precision M2800
> Precision/Precision M3800
> Precision/Precision M4500
> Precision/Precision M4600
> Precision/Precision M4700
> Precision/Precision M4800
> Precision/Precision M6600
> Precision/Precision M6700
> Precision/Precision M6800
> Studio/Studio 1458
> Studio/Studio 1557
> Studio/Studio 1558
> Studio/Studio 1569
> Studio/Studio 1747
> Studio/Studio 1749
> Unidentified/Unidentified System
> Vostro/Vostro 3300
> Vostro/Vostro 3350
> Vostro/Vostro 3400
> Vostro/Vostro 3500
> Vostro/Vostro 3550
> Vostro/Vostro 3560
> Vostro/Vostro 3700
> Vostro/Vostro 5468
> Vostro/Vostro 5471
> Vostro/Vostro 5568
> Vostro/Vostro 7580
> Vostro/Vostro V130
> Vostro/Vostro V131
> XPS/XPS 15 7590
> XPS/XPS 15 9530
> XPS/XPS 15 9550
> XPS/XPS 15 9560
> XPS/XPS 15 9570
> XPS/XPS L401X
> XPS/XPS L412Z
> XPS/XPS L421X
> XPS/XPS L501X
> XPS/XPS L521X
> XPS/XPS L701X
> 
> Unsupported:
> 
> $ git grep ccelerome | grep "is present on SMBus" | cut -d '/' -f 1,2 | sort
> -u | wc -l
> 129

