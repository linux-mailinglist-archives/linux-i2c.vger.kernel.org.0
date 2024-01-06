Return-Path: <linux-i2c+bounces-1175-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D88825FD7
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 15:26:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBF311F227FD
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jan 2024 14:26:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BAD67490;
	Sat,  6 Jan 2024 14:26:29 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF20B7483;
	Sat,  6 Jan 2024 14:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.224] (ip5f5ae9df.dynamic.kabel-deutschland.de [95.90.233.223])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 7AC6961E5FE01;
	Sat,  6 Jan 2024 15:23:20 +0100 (CET)
Message-ID: <65457151-4ddc-4eb4-8e3b-b9c1098c23bb@molgen.mpg.de>
Date: Sat, 6 Jan 2024 15:23:19 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] i2c-i801 / dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>
Cc: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Eric Piel <eric.piel@tremplin-utc.net>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Dell.Client.Kernel@dell.com,
 Marius Hoch <mail@mariushoch.de>, Kai Heng Feng
 <kai.heng.feng@canonical.com>, Wolfram Sang <wsa@kernel.org>,
 platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20231224213629.395741-1-hdegoede@redhat.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20231224213629.395741-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Hans,


Thank you very much for working on this issue and even sending patches 
so quickly.


Am 24.12.23 um 22:36 schrieb Hans de Goede:

> Here is a patch series which implements my suggestions from:
> https://lore.kernel.org/linux-i2c/4820e280-9ca4-4d97-9d21-059626161bfc@molgen.mpg.de/
> to improve the lis3lv02d accel support on Dell laptops.
> 
> Jean, Andi the actual move is in patch 3/6 after some small prep patches
> on the dell-smo8800 side. My plan for merging this is to create
> an immutable branch based on 6.8-rc1 (once it is out) + these 6 patches and
> then send a pull-request for this. Can I have your Ack for the i2c-i801
> changes in patch 3/6? I think you'll like the changes there since they only
> remove code :)

> Hans de Goede (6):
>    platform/x86: dell-smo8800: Only load on Dell laptops
>    platform/x86: dell-smo8800: Change probe() ordering a bit
>    platform/x86: dell-smo8800: Move instantiation of lis3lv02d i2c_client from i2c-i801 to dell-smo8800
>    platform/x86: dell-smo8800: Pass the IRQ to the lis3lv02d i2c_client
>    platform/x86: dell-smo8800: Instantiate an i2c_client for the IIO st_accel driver
>    platform/x86: dell-smo8800: Add support for probing for the accelerometer i2c address
> 
>   drivers/i2c/busses/i2c-i801.c            | 122 --------
>   drivers/platform/x86/dell/dell-smo8800.c | 337 +++++++++++++++++++++--
>   2 files changed, 316 insertions(+), 143 deletions(-)

This Thursday, I tested this on the Dell Inc. XPS 15 7590/0VYV0G, BIOS 
1.24.0 09/11/2023.

First just with your patch-set and trying the parameter:

     [    0.000000] Command line: BOOT_IMAGE=/vmlinuz-6.7.0-rc8+ 
root=UUID=9fa41e21-7a5f-479e-afdc-9a5503368d8e ro quiet rd.luks=1 
rd.auto=1 dell-smo8800.probe_i2c_addr=0x29
     […]
     [   28.826356] smo8800 SMO8810:00: Accelerometer lis3lv02d is 
present on SMBus but its address is unknown, skipping registration
     [   28.826359] smo8800 SMO8810:00: Pass 
dell_smo8800.probe_i2c_addr=1 on the kernel commandline to probe, this 
may be dangerous!

I misread the parameter documentation, but didn’t see the message back 
then, and just saved the log files.

So, I added an entry for the device, and got:

     [   19.197838] smo8800 SMO8810:00: Registered lis2de12 
accelerometer on address 0x29


Kind regards,

Paul


PS: I still seem to miss some config option in my custom Linux kernel 
configuration, as with my self-built Linux kernel, the accelerometer is 
not detected as an input device.

```
$ sudo dmesg | grep input
[    0.648449] input: AT Translated Set 2 keyboard as 
/devices/platform/i8042/serio0/input/input0
[   19.164633] input: Intel HID events as 
/devices/platform/INT33D5:00/input/input2
[   19.176109] input: Intel HID 5 button array as 
/devices/platform/INT33D5:00/input/input3
[   19.200645] input: Lid Switch as 
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input4
[   19.230941] input: Power Button as 
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input5
[   19.231434] input: Sleep Button as 
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input6
[   19.350390] input: PC Speaker as /devices/platform/pcspkr/input/input7
[   19.996196] input: Dell WMI hotkeys as 
/devices/platform/PNP0C14:05/wmi_bus/wmi_bus-PNP0C14:05/9DBB5994-A997-11DA-B012-B622A1EF5492/input/input9
[   20.014546] input: SYNA2393:00 06CB:7A13 Mouse as 
/devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-SYNA2393:00/0018:06CB:7A13.0001/input/input10
[   20.047534] input: SYNA2393:00 06CB:7A13 Touchpad as 
/devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-SYNA2393:00/0018:06CB:7A13.0001/input/input11
[   20.047667] hid-generic 0018:06CB:7A13.0001: input,hidraw0: I2C HID 
v1.00 Mouse [SYNA2393:00 06CB:7A13] on i2c-SYNA2393:00
[   20.048874] input: WCOM490B:00 056A:490B Touchscreen as 
/devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-WCOM490B:00/0018:056A:490B.0002/input/input13
[   20.049014] input: WCOM490B:00 056A:490B as 
/devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-WCOM490B:00/0018:056A:490B.0002/input/input14
[   20.049089] input: WCOM490B:00 056A:490B Stylus as 
/devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-WCOM490B:00/0018:056A:490B.0002/input/input15
[   20.049186] input: WCOM490B:00 056A:490B as 
/devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-WCOM490B:00/0018:056A:490B.0002/input/input16
[   20.065066] input: WCOM490B:00 056A:490B Mouse as 
/devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-WCOM490B:00/0018:056A:490B.0002/input/input17
[   20.065360] hid-generic 0018:056A:490B.0002: input,hidraw1: I2C HID 
v1.00 Mouse [WCOM490B:00 056A:490B] on i2c-WCOM490B:00
[   20.760879] input: SYNA2393:00 06CB:7A13 Mouse as 
/devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-SYNA2393:00/0018:06CB:7A13.0001/input/input18
[   20.760979] input: SYNA2393:00 06CB:7A13 Touchpad as 
/devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-SYNA2393:00/0018:06CB:7A13.0001/input/input19
[   20.761032] hid-multitouch 0018:06CB:7A13.0001: input,hidraw0: I2C 
HID v1.00 Mouse [SYNA2393:00 06CB:7A13] on i2c-SYNA2393:00
[   21.083016] input: Wacom HID 490B Pen as 
/devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-WCOM490B:00/0018:056A:490B.0002/input/input21
[   21.083149] input: Wacom HID 490B Finger as 
/devices/pci0000:00/0000:00:15.0/i2c_designware.0/i2c-1/i2c-WCOM490B:00/0018:056A:490B.0002/input/input22
[   25.850198] input: Video Bus as 
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/LNXVIDEO:00/input/input24
[   25.850344] input: Video Bus as 
/devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:0b/LNXVIDEO:01/input/input25
[   26.027649] snd_hda_codec_realtek hdaudioC0D0:    inputs:
[   26.132076] input: HDA Intel PCH Headphone Mic as 
/devices/pci0000:00/0000:00:1f.3/sound/card0/input26
[   26.132148] input: HDA Intel PCH HDMI/DP,pcm=3 as 
/devices/pci0000:00/0000:00:1f.3/sound/card0/input27
[   26.132192] input: HDA Intel PCH HDMI/DP,pcm=7 as 
/devices/pci0000:00/0000:00:1f.3/sound/card0/input28
[   26.132233] input: HDA Intel PCH HDMI/DP,pcm=8 as 
/devices/pci0000:00/0000:00:1f.3/sound/card0/input29
[   28.659169] rfkill: input handler disabled
[   47.283492] rfkill: input handler enabled
[   52.883611] rfkill: input handler disabled
```

