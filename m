Return-Path: <linux-i2c+bounces-977-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8AA81D407
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Dec 2023 13:45:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 519B71F224DB
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Dec 2023 12:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0FDED29E;
	Sat, 23 Dec 2023 12:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hL8OhLs8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46AFD28A
	for <linux-i2c@vger.kernel.org>; Sat, 23 Dec 2023 12:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1703335547;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sLJFSQIp7fhvFcRrwCoza2064ZaOYLPHw4qUqiS9L7g=;
	b=hL8OhLs8g5BMoyntu3aL9YUVlG/G1HK0kldGcLR00hpzh10ul05CeXXRZ93vouHh29S9y9
	cIZRCRbadUfy3fSPK18oOEzhr5GtJdqrouh5EH5Vdf4u1MMGW1NbB7hq/sAgsQ797AH9QR
	lIVyzGlebfWsLWN1NMAhX+x1iNvYscU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-Dwr1Hd6CPEGq-IOAwFdAsA-1; Sat, 23 Dec 2023 07:45:36 -0500
X-MC-Unique: Dwr1Hd6CPEGq-IOAwFdAsA-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-40d2fa6b23eso23376955e9.2
        for <linux-i2c@vger.kernel.org>; Sat, 23 Dec 2023 04:45:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703335535; x=1703940335;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sLJFSQIp7fhvFcRrwCoza2064ZaOYLPHw4qUqiS9L7g=;
        b=eGvgUBSYHBaLFPHPs3D+wXbtXow3t9qXSwixRLh8Z/wdD7K3JVbaTE1zZ9gvNHx+xR
         Rqu9FsqJoYyeT0S6Re6oHcTeQ1Qc2tAvUw+OH70cIaoaQsFWQm8Z+Dx493pQg5jnjeSF
         XwejWXOU1owYCFs5Vomg0pRHXGVOVW92RXYvzRn2AsdPASizlnk4Cs8ipX1OOKRTxj+U
         Crp3BCA9nva3BJOQgMQFR65zyvCXMCp6L2obySIs2FsjEZqgrlmojjnvpvGV0UjO4XSG
         R7YQ1gsQ/BYN9Nw88nJAUJOjJYp/fbJL5WlksVDD/2vEgiwa9u9B+FyYfD0275F/BIgT
         QH8g==
X-Gm-Message-State: AOJu0YyBpEworX6s2R1Sx5RuFW4KANk5WiNRXtzIbWoH+GcCq+Y+sQfi
	HFZWGt7GXQVVG2ZJbLgrWDZz7ZIZNe4pDfWiCU4YuvkWHFNZ94c2Oxe7L+TlN/AvHUjIszFGDo/
	QNbGBesKbjgYaVgk5ySjrnifKFQnv
X-Received: by 2002:a05:600c:5405:b0:40d:4502:741c with SMTP id he5-20020a05600c540500b0040d4502741cmr993934wmb.125.1703335534960;
        Sat, 23 Dec 2023 04:45:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/uwyO8H99ZELdCyDLDo/sXgLdn7RQB2aBdzj4SaKIZW+k1CAkDFaKjT3blQp8tsVXKBEzgg==
X-Received: by 2002:a05:600c:5405:b0:40d:4502:741c with SMTP id he5-20020a05600c540500b0040d4502741cmr993917wmb.125.1703335534465;
        Sat, 23 Dec 2023 04:45:34 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id j1-20020a170906094100b00a26ae006522sm2302712ejd.122.2023.12.23.04.45.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Dec 2023 04:45:33 -0800 (PST)
Message-ID: <a1128471-bbff-4124-a7e5-44de4b1730b7@redhat.com>
Date: Sat, 23 Dec 2023 13:45:32 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Ideas for a generic solution to support accelerometer lis3lv02d
 in Dell laptops/notebooks?
Content-Language: en-US, nl
To: Paul Menzel <pmenzel@molgen.mpg.de>, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Kai-Heng Feng <kai.heng.feng@canonical.com>, Marius Hoch
 <mail@mariushoch.de>, Mario Limonciello <mario.limonciello@amd.com>,
 Dell.Client.Kernel@dell.com, Greg KH <gregkh@linuxfoundation.org>
References: <4820e280-9ca4-4d97-9d21-059626161bfc@molgen.mpg.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <4820e280-9ca4-4d97-9d21-059626161bfc@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Paul,

On 12/23/23 10:39, Paul Menzel wrote:
> Dear Linux folks,
> 
> 
> Currently, on Dell systems with the accelerometer lis3lv02d, its I²C address needs to be added to `dell_lis3lv02d_devices[]` in `drivers/i2c/busses/i2c-i801.c`.
> 
> In Linux 6.7-rc6 that array has nine elements, so only a small fraction of all Dell notebooks is listed. Searching the Linux logs uploaded to the Linux hardware database from May 2023 [1], there are around 129 devices without support in the Linux kernel version the upload was done with.
> 
> Do you know, how the Microsoft Windows driver is doing this? Is it hard-coded there too, or can it be deduced somehow, for example from the ACPI tables?
> 
> I added some Kai-Heng and Hans to Cc as they might have contact. Dell offers or offered quite a few of the models with official Ubuntu support, so I would have hoped to have a generic solution for this. Maybe Mario can also forward it to the Dell team.

Interesting question.

So there are really 2 issues here:

a. The probe problem you are describing

b. The support for the lis3lv02d is using an old misc-char + input(evdev)
   userspace API defined in:
   drivers/platform/x86/dell/dell-smo8800.c
   drivers/misc/lis3lv02d/lis3lv02d[_i2c].c

   where as it really should be using the IIO interface like
   almost all other accelerometer chips are doing. There even
   already is a driver for this:
   drivers/iio/accel/st_accel[_i2c].c

Here is what I believe should be done to fix this:

1. The handling of instantiating the i2c-client really does NOT
   belong in drivers/i2c/busses/i2c-i801.c instead some code
   should be added to drivers/platform/x86/dell/dell-smo8800.c
   for finding the right i2c-bus and then the code to instantiate
   the i2c_client for the lis3lv02d device should be moved to
   drivers/platform/x86/dell/dell-smo8800.c .

2. Add a "probe_i2c_address" bool module option and when this
   is set try to read the WHO_AM_I register, see
   drivers/misc/lis3lv02d/lis3lv02d.c
   and if this succeeds and gives a known model id then
   continue with the found i2c_address. This should first
   try address 0x29 which seems to be the most common and
   then try 0x18 and then give up.

   This should also modify the dmesg "Accelerometer lis3lv02d is
   present on SMBus but its address is unknown, skipping registration\n"

   message to hint at trying to use the probe_i2c_address option
   with a remark that this could theoretically be dangerous for
   the laptop.

   And likewise when probe_i2c_address option is set and the
   laptop model is not in the DMI list then on successful
   probe print a message to please report the i2c-address upstream.

   This should resolve (a) from above.

3. Once we have the i2c-client instantiation in dell-smo8800.c
   we can add a "use_misc_lis3lv02d" boolean module option there
   which defaults to false.

   And then if we know the i2c-address and use_misc_lis3lv02d is false:
   2.1 register the i2c_client with "lis3lv02dl_accel"
       as type instead of "lis3lv02dl", note I think we may need
       to use different type-s depending on the WHO_AM_I register
       value, the st_accel.c code needs to be checked for this.
   2.2 pass the interrupt to the i2c_client driver by setting
       it in board_info
   2.3 do not register the dell-smo8800.c IRQ handler
       (the i2c_client will own the IRQ)
   2.4 do not register the dell-smo8800.c misc char device

   This solves (b) from above giving us a more standard accel
   userspace interface. We do need to evaluate how this
   impacts iio-sensor-proxy though, since this now may start
   doing screen-rotation based on this!

If you plan to work on this please let me know. I think
the trickiest issue is going to be to find the right i2c-bus
in dell-smo8800.c.

Regards,

Hans






> [1]: https://github.com/linuxhw/Dmesg
> 
> 
> PS: Dell devices in Linux hardware database with accelerometer:
> 
> linux-hardware-dmesg/Notebook/Dell (main)$ git grep -l ccelerome | cut -d '/' -f 1,2 | sort -u
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
> $ git grep ccelerome | grep "is present on SMBus" | cut -d '/' -f 1,2 | sort -u | wc -l
> 129
> 


