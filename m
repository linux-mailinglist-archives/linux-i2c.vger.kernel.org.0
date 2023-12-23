Return-Path: <linux-i2c+bounces-975-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DC25E81D35E
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Dec 2023 10:40:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6F14EB22F63
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Dec 2023 09:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF2368F7E;
	Sat, 23 Dec 2023 09:40:25 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3C26116;
	Sat, 23 Dec 2023 09:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.6] (ip5f5af375.dynamic.kabel-deutschland.de [95.90.243.117])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 2E8EF61E5FE01;
	Sat, 23 Dec 2023 10:39:19 +0100 (CET)
Message-ID: <4820e280-9ca4-4d97-9d21-059626161bfc@molgen.mpg.de>
Date: Sat, 23 Dec 2023 10:39:18 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Hans de Goede <hdegoede@redhat.com>, Marius Hoch <mail@mariushoch.de>,
 Mario Limonciello <mario.limonciello@amd.com>, Dell.Client.Kernel@dell.com,
 Greg KH <gregkh@linuxfoundation.org>
Subject: Ideas for a generic solution to support accelerometer lis3lv02d in
 Dell laptops/notebooks?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Linux folks,


Currently, on Dell systems with the accelerometer lis3lv02d, its I²C 
address needs to be added to `dell_lis3lv02d_devices[]` in 
`drivers/i2c/busses/i2c-i801.c`.

In Linux 6.7-rc6 that array has nine elements, so only a small fraction 
of all Dell notebooks is listed. Searching the Linux logs uploaded to 
the Linux hardware database from May 2023 [1], there are around 129 
devices without support in the Linux kernel version the upload was done 
with.

Do you know, how the Microsoft Windows driver is doing this? Is it 
hard-coded there too, or can it be deduced somehow, for example from the 
ACPI tables?

I added some Kai-Heng and Hans to Cc as they might have contact. Dell 
offers or offered quite a few of the models with official Ubuntu 
support, so I would have hoped to have a generic solution for this. 
Maybe Mario can also forward it to the Dell team.


Kind regards,

Paul


[1]: https://github.com/linuxhw/Dmesg


PS: Dell devices in Linux hardware database with accelerometer:

linux-hardware-dmesg/Notebook/Dell (main)$ git grep -l ccelerome | cut 
-d '/' -f 1,2 | sort -u
Inspiron/Inspiron 11 - 3147
Inspiron/Inspiron 5520
Inspiron/Inspiron 7547
Inspiron/Inspiron 7548
Latitude/Latitude 12 Rugged Extreme
Latitude/Latitude 2110
Latitude/Latitude 2120
Latitude/Latitude 3330
Latitude/Latitude 3380
Latitude/Latitude 3400
Latitude/Latitude 3470
Latitude/Latitude 3480
Latitude/Latitude 3490
Latitude/Latitude 3500
Latitude/Latitude 3570
Latitude/Latitude 3580
Latitude/Latitude 3590
Latitude/Latitude 5280
Latitude/Latitude 5290
Latitude/Latitude 5400
Latitude/Latitude 5401
Latitude/Latitude 5410
Latitude/Latitude 5411
Latitude/Latitude 5414
Latitude/Latitude 5420 Rugged
Latitude/Latitude 5424 Rugged
Latitude/Latitude 5480
Latitude/Latitude 5490
Latitude/Latitude 5491
Latitude/Latitude 5500
Latitude/Latitude 5501
Latitude/Latitude 5510
Latitude/Latitude 5511
Latitude/Latitude 5531
Latitude/Latitude 5580
Latitude/Latitude 5590
Latitude/Latitude 5591
Latitude/Latitude 7214
Latitude/Latitude 7414
Latitude/Latitude 7424 Rugged Extreme
Latitude/Latitude E4310
Latitude/Latitude E5270
Latitude/Latitude E5410
Latitude/Latitude E5420
Latitude/Latitude E5420m
Latitude/Latitude E5430 non-vPro
Latitude/Latitude E5430 vPro
Latitude/Latitude E5440
Latitude/Latitude E5470
Latitude/Latitude E5510
Latitude/Latitude E5520
Latitude/Latitude E5520m
Latitude/Latitude E5530 non-vPro
Latitude/Latitude E5530 vPro
Latitude/Latitude E5540
Latitude/Latitude E5570
Latitude/Latitude E6220
Latitude/Latitude E6230
Latitude/Latitude E6320
Latitude/Latitude E6330
Latitude/Latitude E6410
Latitude/Latitude E6420
Latitude/Latitude E6430
Latitude/Latitude E6430s
Latitude/Latitude E6440
Latitude/Latitude E64406342Q0286-
Latitude/Latitude E6510
Latitude/Latitude E6520
Latitude/Latitude E6530
Latitude/Latitude E6540
Latitude/Latitude E7440
Latitude/Latitude XT3
Precision/Precision 3510
Precision/Precision 3520
Precision/Precision 3530
Precision/Precision 3540
Precision/Precision 3541
Precision/Precision 3550
Precision/Precision 3551
Precision/Precision 3571
Precision/Precision 5510
Precision/Precision 5520
Precision/Precision 5530
Precision/Precision 5540
Precision/Precision 7510
Precision/Precision 7520
Precision/Precision 7530
Precision/Precision 7540
Precision/Precision 7710
Precision/Precision 7720
Precision/Precision 7730
Precision/Precision 7740
Precision/Precision M2800
Precision/Precision M3800
Precision/Precision M4500
Precision/Precision M4600
Precision/Precision M4700
Precision/Precision M4800
Precision/Precision M6600
Precision/Precision M6700
Precision/Precision M6800
Studio/Studio 1458
Studio/Studio 1557
Studio/Studio 1558
Studio/Studio 1569
Studio/Studio 1747
Studio/Studio 1749
Unidentified/Unidentified System
Vostro/Vostro 3300
Vostro/Vostro 3350
Vostro/Vostro 3400
Vostro/Vostro 3500
Vostro/Vostro 3550
Vostro/Vostro 3560
Vostro/Vostro 3700
Vostro/Vostro 5468
Vostro/Vostro 5471
Vostro/Vostro 5568
Vostro/Vostro 7580
Vostro/Vostro V130
Vostro/Vostro V131
XPS/XPS 15 7590
XPS/XPS 15 9530
XPS/XPS 15 9550
XPS/XPS 15 9560
XPS/XPS 15 9570
XPS/XPS L401X
XPS/XPS L412Z
XPS/XPS L421X
XPS/XPS L501X
XPS/XPS L521X
XPS/XPS L701X

Unsupported:

$ git grep ccelerome | grep "is present on SMBus" | cut -d '/' -f 1,2 | 
sort -u | wc -l
129

