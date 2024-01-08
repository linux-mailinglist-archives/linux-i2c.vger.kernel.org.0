Return-Path: <linux-i2c+bounces-1206-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D820C826CD4
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 12:31:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A1D01F224A7
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Jan 2024 11:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C68F14A9F;
	Mon,  8 Jan 2024 11:31:04 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B116614A93;
	Mon,  8 Jan 2024 11:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.6] (unknown [95.90.244.77])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 822E061E5FE03;
	Mon,  8 Jan 2024 12:29:40 +0100 (CET)
Message-ID: <a504d2b4-44f3-4e47-8566-d2b32451d861@molgen.mpg.de>
Date: Mon, 8 Jan 2024 12:29:39 +0100
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
 <65457151-4ddc-4eb4-8e3b-b9c1098c23bb@molgen.mpg.de>
 <2af43c2f-6b6a-4080-90a4-dc655cedd8a2@redhat.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <2af43c2f-6b6a-4080-90a4-dc655cedd8a2@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Hans,


Again, thank you for your reply.


Am 06.01.24 um 17:15 schrieb Hans de Goede:

> On 1/6/24 15:23, Paul Menzel wrote:

[…]

>> Am 24.12.23 um 22:36 schrieb Hans de Goede:
>>
>>> Here is a patch series which implements my suggestions from:
>>> https://lore.kernel.org/linux-i2c/4820e280-9ca4-4d97-9d21-059626161bfc@molgen.mpg.de/
>>> to improve the lis3lv02d accel support on Dell laptops.
>>>
>>> Jean, Andi the actual move is in patch 3/6 after some small prep patches
>>> on the dell-smo8800 side. My plan for merging this is to create
>>> an immutable branch based on 6.8-rc1 (once it is out) + these 6 patches and
>>> then send a pull-request for this. Can I have your Ack for the i2c-i801
>>> changes in patch 3/6? I think you'll like the changes there since they only
>>> remove code :)
>>
>>> Hans de Goede (6):
>>>     platform/x86: dell-smo8800: Only load on Dell laptops
>>>     platform/x86: dell-smo8800: Change probe() ordering a bit
>>>     platform/x86: dell-smo8800: Move instantiation of lis3lv02d i2c_client from i2c-i801 to dell-smo8800
>>>     platform/x86: dell-smo8800: Pass the IRQ to the lis3lv02d i2c_client
>>>     platform/x86: dell-smo8800: Instantiate an i2c_client for the IIO st_accel driver
>>>     platform/x86: dell-smo8800: Add support for probing for the accelerometer i2c address
>>>
>>>    drivers/i2c/busses/i2c-i801.c            | 122 --------
>>>    drivers/platform/x86/dell/dell-smo8800.c | 337 +++++++++++++++++++++--
>>>    2 files changed, 316 insertions(+), 143 deletions(-)
>>
>> This Thursday, I tested this on the Dell Inc. XPS 15 7590/0VYV0G, BIOS 1.24.0 09/11/2023.
> 
> Interesting, can you run:
> 
> sudo acpidump -o acpidump.txt and then send me a private email
> with the generated acpidump.txt attached ?

Please find it in the Linux Kernel Bugzilla [1], where I attached it to 
another issue.

>> First just with your patch-set and trying the parameter:
>>
>>      [    0.000000] Command line: BOOT_IMAGE=/vmlinuz-6.7.0-rc8+ root=UUID=9fa41e21-7a5f-479e-afdc-9a5503368d8e ro quiet rd.luks=1 rd.auto=1 dell-smo8800.probe_i2c_addr=0x29
>>      […]
>>      [   28.826356] smo8800 SMO8810:00: Accelerometer lis3lv02d is present on SMBus but its address is unknown, skipping registration
>>      [   28.826359] smo8800 SMO8810:00: Pass dell_smo8800.probe_i2c_addr=1 on the kernel commandline to probe, this may be dangerous!
>>
>> I misread the parameter documentation, but didn’t see the message back then, and just saved the log files.
>>
>> So, I added an entry for the device, and got:
>>
>>      [   19.197838] smo8800 SMO8810:00: Registered lis2de12 accelerometer on address 0x29
> 
> Ok, that looks good. Can you provide the output of:
> 
> cat /sys/class/dmi/id/product_name

 From my upload to Hardware for Linux [2]:

XPS 15 7590

> So that we can also add an entry for this upstream ?

I already sent a patch, that got applied [3].

>> PS: I still seem to miss some config option in my custom Linux
>> kernel configuration, as with my self-built Linux kernel, the
>> accelerometer is not detected as an input device.
> 
> Right, v1 of my patches changed the code to by default instantiate an i2c_client
> to which the st_accel IIO driver will bind. Using the IIO framework is
> how accelerometers are handled normally and the handling of these "freefall"
> sensors so far has been a bit different, so I tried to make them more like
> normal accelerometers which don't do the joystick emulation.
> 
> But Pali and Andy pointed out to me that there is userspace code out
> there relying on /dev/freefall, so for v2 of the patches I've kept
> the old behavior by default.
> 
> I've just posted v2 of the patches.
> 
> Note with v1 you can also get the old behavior by adding
> dell_smo8800.use_misc_lis3lv02d=1 to the kernel commandline.
> 
> Adding that (or switching to the v2 patches) should give you
> an input device.

Thank you very much. I am going to test them as soon as possible.


Kind regards,

Paul


[1]: https://bugzilla.kernel.org/show_bug.cgi?id=218287
      "`ACPI Error: AE_ERROR, Returned by Handler for [PCI_Config] 
(20230628/evregion-300)`"
[2]: https://linux-hardware.org/?probe=74136911a0&log=dmidecode
[3]: 
https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git/commit/?h=i2c/for-next&id=dc3293b460db70e3b5b76175d1a158dc802b9740

