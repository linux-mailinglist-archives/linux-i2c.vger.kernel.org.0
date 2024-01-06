Return-Path: <linux-i2c+bounces-1188-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC97826093
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 17:15:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18E4D282C1A
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 16:15:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADF8B848D;
	Sat,  6 Jan 2024 16:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H9Xds684"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB758847C
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jan 2024 16:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704557750;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hnW3FoZU4ydIxsyoIoIbsYuXC4X6H1FGjlC8vdMwAjo=;
	b=H9Xds684zzv77CPsnArksuWgX6yenDi8ZHLIFVCOFdJZypyhsXeb/8GspnuQwslWeMQPRE
	tAQPgP0TIUeJV71llGkVf4b/sDMRupE1RoJjJNUAFqzvNt0T4acSK7u3RsE9MjhuBdy44k
	j/KqgCPYhw/4ucaXIg92eaTqTr/HOCo=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-4buhhYk2OXCVc1EWruSGgQ-1; Sat, 06 Jan 2024 11:15:48 -0500
X-MC-Unique: 4buhhYk2OXCVc1EWruSGgQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-40d1ffbc3b8so4375285e9.0
        for <linux-i2c@vger.kernel.org>; Sat, 06 Jan 2024 08:15:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704557747; x=1705162547;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hnW3FoZU4ydIxsyoIoIbsYuXC4X6H1FGjlC8vdMwAjo=;
        b=TAvmw17ZIPiXc1AXmVp0Dva/P4xmo/L5qrQv1+5HqkcKQrwGTOXpwf8zgQ4il00fAb
         M9IAKwZi5zrokmzUsuEvRh2WFjI3/nqsyLhBTLXCFphB2LntCR6kdMXrUSXyfeDwp9FZ
         l/SgMMbLa/wzsUYGFrjWEPgJgokpaMghNEcSJ6X3JbqoaKZe2863GaOqTi7WrvrM7IFn
         sZ9aSrUwZe86D2mNTYGzQTcrbZswx3e159QBBvdVWjZ1Zpbk1SgK/Gg16ijk/yZI/Qsc
         fXS4frdnOJR2cF3gddCnrX9CEEK52tIdeXHu9MSVARt1p5JYCoas1+4F8fma0otiZ6zq
         dUKw==
X-Gm-Message-State: AOJu0YwS16/vGGnIg0wN8qEMveqTT/gRLg3ZOsiIlyXYr36WPyZe5Pal
	PgSy266KrNxHIt1xqeFZmNqeKN43UbJcarTaWbvbk+VUKVsA4J/ur59s/g3sJCwsmYql26fFcoC
	0/OEJVCLLpc489ponATqFSUa9Zia2
X-Received: by 2002:a05:600c:1e1d:b0:40d:414a:3151 with SMTP id ay29-20020a05600c1e1d00b0040d414a3151mr352518wmb.307.1704557747431;
        Sat, 06 Jan 2024 08:15:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFwp4lDQ3BFIe1831Pa6Dklc+q7njLREvUclUv/dwXYRtKWy8LcS0tgCHI3yumJf9dUGiyKJg==
X-Received: by 2002:a05:600c:1e1d:b0:40d:414a:3151 with SMTP id ay29-20020a05600c1e1d00b0040d414a3151mr352496wmb.307.1704557746755;
        Sat, 06 Jan 2024 08:15:46 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id f2-20020a05651c03c200b002cd1edfdda5sm688889ljp.64.2024.01.06.08.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Jan 2024 08:15:46 -0800 (PST)
Message-ID: <2af43c2f-6b6a-4080-90a4-dc655cedd8a2@redhat.com>
Date: Sat, 6 Jan 2024 17:15:44 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] i2c-i801 / dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Content-Language: en-US, nl
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Eric Piel <eric.piel@tremplin-utc.net>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Dell.Client.Kernel@dell.com,
 Marius Hoch <mail@mariushoch.de>, Kai Heng Feng
 <kai.heng.feng@canonical.com>, Wolfram Sang <wsa@kernel.org>,
 platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20231224213629.395741-1-hdegoede@redhat.com>
 <65457151-4ddc-4eb4-8e3b-b9c1098c23bb@molgen.mpg.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <65457151-4ddc-4eb4-8e3b-b9c1098c23bb@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Paul,

On 1/6/24 15:23, Paul Menzel wrote:
> Dear Hans,
> 
> 
> Thank you very much for working on this issue and even sending patches so quickly.

You're welcome this was a nice little project to work on during the holidays.

> Am 24.12.23 um 22:36 schrieb Hans de Goede:
> 
>> Here is a patch series which implements my suggestions from:
>> https://lore.kernel.org/linux-i2c/4820e280-9ca4-4d97-9d21-059626161bfc@molgen.mpg.de/
>> to improve the lis3lv02d accel support on Dell laptops.
>>
>> Jean, Andi the actual move is in patch 3/6 after some small prep patches
>> on the dell-smo8800 side. My plan for merging this is to create
>> an immutable branch based on 6.8-rc1 (once it is out) + these 6 patches and
>> then send a pull-request for this. Can I have your Ack for the i2c-i801
>> changes in patch 3/6? I think you'll like the changes there since they only
>> remove code :)
> 
>> Hans de Goede (6):
>>    platform/x86: dell-smo8800: Only load on Dell laptops
>>    platform/x86: dell-smo8800: Change probe() ordering a bit
>>    platform/x86: dell-smo8800: Move instantiation of lis3lv02d i2c_client from i2c-i801 to dell-smo8800
>>    platform/x86: dell-smo8800: Pass the IRQ to the lis3lv02d i2c_client
>>    platform/x86: dell-smo8800: Instantiate an i2c_client for the IIO st_accel driver
>>    platform/x86: dell-smo8800: Add support for probing for the accelerometer i2c address
>>
>>   drivers/i2c/busses/i2c-i801.c            | 122 --------
>>   drivers/platform/x86/dell/dell-smo8800.c | 337 +++++++++++++++++++++--
>>   2 files changed, 316 insertions(+), 143 deletions(-)
> 
> This Thursday, I tested this on the Dell Inc. XPS 15 7590/0VYV0G, BIOS 1.24.0 09/11/2023.

Interesting, can you run:

sudo acpidump -o acpidump.txt and then send me a private email
with the generated acpidump.txt attached ?

> 
> First just with your patch-set and trying the parameter:
> 
>     [    0.000000] Command line: BOOT_IMAGE=/vmlinuz-6.7.0-rc8+ root=UUID=9fa41e21-7a5f-479e-afdc-9a5503368d8e ro quiet rd.luks=1 rd.auto=1 dell-smo8800.probe_i2c_addr=0x29
>     […]
>     [   28.826356] smo8800 SMO8810:00: Accelerometer lis3lv02d is present on SMBus but its address is unknown, skipping registration
>     [   28.826359] smo8800 SMO8810:00: Pass dell_smo8800.probe_i2c_addr=1 on the kernel commandline to probe, this may be dangerous!
> 
> I misread the parameter documentation, but didn’t see the message back then, and just saved the log files.
> 
> So, I added an entry for the device, and got:
> 
>     [   19.197838] smo8800 SMO8810:00: Registered lis2de12 accelerometer on address 0x29

Ok, that looks good. Can you provide the output of:

cat /sys/class/dmi/id/product_name

So that we can also add an entry for this upstream ?

> PS: I still seem to miss some config option in my custom Linux kernel configuration, as with my self-built Linux kernel, the accelerometer is not detected as an input device.

Right, v1 of my patches changed the code to by default instantiate an i2c_client
to which the st_accel IIO driver will bind. Using the IIO framework is
how accelerometers are handled normally and the handling of these "freefall" 
sensors so far has been a bit different, so I tried to make them more like
normal accelerometers which don't do the joystick emulation.

But Pali and Andy pointed out to me that there is userspace code out
there relying on /dev/freefall, so for v2 of the patches I've kept
the old behavior by default.

I've just posted v2 of the patches.

Note with v1 you can also get the old behavior by adding
dell_smo8800.use_misc_lis3lv02d=1 to the kernel commandline.

Adding that (or switching to the v2 patches) should give you
an input device.

Regards,

Hans






> 
> ```
> $ sudo dmesg | grep input
> [    0.648449] input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input0
> [   19.164633] input: Intel HID events as /devices/platform/INT33D5:00/input/input2
> [   19.176109] input: Intel HID 5 button array as /devices/platform/INT33D5:00/input/input3
> [   19.200645] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input4
> [   19.230941] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input5
> [   19.231434] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input6
> [   19.350390] input: PC Speaker as /devices/platform/pcspkr/input/input7
> [   19.996196] input: Dell WMI hotkeys as /devices/platform/PNP0C14:05/wmi_bus/wmi_bus-PNP0C14:05/9DBB5994-A997-11DA-B012-B622A1EF5492/input/input9
> [   20.014546] input: SYNA2393:00 06CB:7A13 Mouse as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-SYNA2393:00/0018:06CB:7A13.0001/input/input10
> [   20.047534] input: SYNA2393:00 06CB:7A13 Touchpad as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-SYNA2393:00/0018:06CB:7A13.0001/input/input11
> [   20.047667] hid-generic 0018:06CB:7A13.0001: input,hidraw0: I2C HID v1.00 Mouse [SYNA2393:00 06CB:7A13] on i2c-SYNA2393:00
> [   20.048874] input: WCOM490B:00 056A:490B Touchscreen as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-WCOM490B:00/0018:056A:490B.0002/input/input13
> [   20.049014] input: WCOM490B:00 056A:490B as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-WCOM490B:00/0018:056A:490B.0002/input/input14
> [   20.049089] input: WCOM490B:00 056A:490B Stylus as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-WCOM490B:00/0018:056A:490B.0002/input/input15
> [   20.049186] input: WCOM490B:00 056A:490B as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-WCOM490B:00/0018:056A:490B.0002/input/input16
> [   20.065066] input: WCOM490B:00 056A:490B Mouse as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-WCOM490B:00/0018:056A:490B.0002/input/input17
> [   20.065360] hid-generic 0018:056A:490B.0002: input,hidraw1: I2C HID v1.00 Mouse [WCOM490B:00 056A:490B] on i2c-WCOM490B:00
> [   20.760879] input: SYNA2393:00 06CB:7A13 Mouse as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-SYNA2393:00/0018:06CB:7A13.0001/input/input18
> [   20.760979] input: SYNA2393:00 06CB:7A13 Touchpad as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-SYNA2393:00/0018:06CB:7A13.0001/input/input19
> [   20.761032] hid-multitouch 0018:06CB:7A13.0001: input,hidraw0: I2C HID v1.00 Mouse [SYNA2393:00 06CB:7A13] on i2c-SYNA2393:00
> [   21.083016] input: Wacom HID 490B Pen as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-WCOM490B:00/0018:056A:490B.0002/input/input21
> [   21.083149] input: Wacom HID 490B Finger as /devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-WCOM490B:00/0018:056A:490B.0002/input/input22
> [   25.850198] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input24
> [   25.850344] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:0b/LNXVIDEO:01/input/input25
> [   26.027649] snd_hda_codec_realtek hdaudioC0D0:    inputs:
> [   26.132076] input: HDA Intel PCH Headphone Mic as /devices/pci0000:00/0000:00:1f.3/sound/card0/input26
> [   26.132148] input: HDA Intel PCH HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input27
> [   26.132192] input: HDA Intel PCH HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input28
> [   26.132233] input: HDA Intel PCH HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:1f.3/sound/card0/input29
> [   28.659169] rfkill: input handler disabled
> [   47.283492] rfkill: input handler enabled
> [   52.883611] rfkill: input handler disabled
> ```
> 


