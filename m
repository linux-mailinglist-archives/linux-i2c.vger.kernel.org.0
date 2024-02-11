Return-Path: <linux-i2c+bounces-1685-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 880BE850B45
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Feb 2024 20:39:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ACC181C21439
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Feb 2024 19:39:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E525DF08;
	Sun, 11 Feb 2024 19:39:02 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6695CDFD;
	Sun, 11 Feb 2024 19:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707680342; cv=none; b=rbcglZ2w4w81RwU4CJKZqNJACh5LfkvnTpHpFrVK4sDOg4lBMV3SeOP2CbqjDLJHKYYh0nuNQixaf58IWmRfirENX5kYcHVDzu3sF0tm048KPoSQA+1LygCVpoG7qXURIoenV65TYmgbw+HU2YF7mHYmVgiTcqpAah+wWKpHQto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707680342; c=relaxed/simple;
	bh=qFNrH1v8FCsfkKL3hN5m6PPj6hj8NT1EymKYFGntYjs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=sjekrrp/OW/tzVLKCeiJZQrW8L0c6SLxrv3gfdpzYNIGXqU4aGdwvdXqsMU6EfD7lVYgHBpyCWgXigzeVMIVJsoeEokYddCRwz/ydQ5oXt/NLavSw1mzUNYp1xSOJEwcDG9t/ywJFk0dJJxP75Rtv4lJsVNdl9M/Fyn1O64T4tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.224] (ip5f5aec7f.dynamic.kabel-deutschland.de [95.90.236.127])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 84EF461E5FE01;
	Sun, 11 Feb 2024 20:38:16 +0100 (CET)
Message-ID: <49d0a968-7570-43ac-963c-47b9c6dcc353@molgen.mpg.de>
Date: Sun, 11 Feb 2024 20:38:15 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: `intel_lpss_pci_driver_init` takes 23.8 ms
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Lee Jones <lee@kernel.org>, Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <ebd4dd9d-3710-4cbb-92d1-c3f73b66bc97@molgen.mpg.de>
 <20240208085928.GB689448@google.com> <ZcUQen0nYAAtZVw8@smile.fi.intel.com>
Content-Language: en-US
In-Reply-To: <ZcUQen0nYAAtZVw8@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

[Cc: +Jarkko]

Dear Andy,


Thank you for your quick reply.

Am 08.02.24 um 18:33 schrieb Andy Shevchenko:
> On Thu, Feb 08, 2024 at 08:59:28AM +0000, Lee Jones wrote:
>> On Tue, 06 Feb 2024, Paul Menzel wrote:
> 
>>> On the Dell XPS 13 9360 and Linux 6.8-rc3+, `intel_lpss_pci_driver_init()`
>>> takes 23.8 ms, making it one of Linux’ longer init functions on this device:
> 
> Does it mean on the previous releases it was different?
> I mean is it a regression or always was like this?

I do not know for sure. I think it has been always like this.

>>> ```
>>> [    0.000000] Linux version 6.8.0-rc3 (build@bohemianrhapsody.molgen.mpg.de) (gcc (Debian 13.2.0-13) 13.2.0, GNU ld (GNU Binutils for Debian) 2.42) #13 SMP PREEMPT_DYNAMIC Tue Feb 6 08:07:48 CET 2024
>>> [    0.000000] Command line: BOOT_IMAGE=/vmlinuz-6.8.0-rc3 root=UUID=32e29882-d94d-4a92-9ee4-4d03002bfa29 ro quiet pci=noaer mem_sleep_default=deep log_buf_len=8M cryptomgr.notests initcall_debug
>>> […]
>>> [    0.000000] DMI: Dell Inc. XPS 13 9360/0596KF, BIOS 2.21.0 06/02/2022
>>> […]
>>> [    0.785696] calling  intel_lpss_pci_driver_init+0x0/0xff0 [intel_lpss_pci] @ 153
>>> [    0.785704] calling  crct10dif_intel_mod_init+0x0/0xff0 [crct10dif_pclmul] @ 163
>>> [    0.785796] calling  drm_core_init+0x0/0xff0 [drm] @ 161
>>> [    0.785880] ACPI: bus type drm_connector registered
>>> [    0.785887] initcall drm_core_init+0x0/0xff0 [drm] returned 0 after 25 usecs
>>> [    0.785936] intel-lpss 0000:00:15.0: enabling device (0000 -> 0002)
>>> [    0.786210] idma64 idma64.0: Found Intel integrated DMA 64-bit
>>> [    0.786221] probe of idma64.0 returned 0 after 81 usecs
>>> […]
>>> [    0.801676] probe of i2c_designware.0 returned 0 after 15424 usecs
>>> [    0.801691] probe of 0000:00:15.0 returned 0 after 15973 usecs
>>> [    0.801870] intel-lpss 0000:00:15.1: enabling device (0000 -> 0002)
>>> [    0.802116] idma64 idma64.1: Found Intel integrated DMA 64-bit
>>> [    0.802123] probe of idma64.1 returned 0 after 55 usecs
>>> [    0.819818] probe of i2c_designware.1 returned 0 after 17646 usecs
>>> [    0.819832] probe of 0000:00:15.1 returned 0 after 18137 usecs
>>> [    0.819852] initcall intel_lpss_pci_driver_init+0x0/0xff0 [intel_lpss_pci] returned 0 after 23842 usecs
>>> ```
>>>
>>> Is this expected, that probing
>>>
>>>      00:15.1 Signal processing controller [1180]: Intel Corporation Sunrise Point-LP Serial IO I2C Controller #1 [8086:9d61] (rev 21)
>>>
>>> takes 18 ms?
> 
> And it seems that the real culprit is the DesingWare driver itself, am I wrong?

Yes, it looks like this. In the archive of Linux messages [1] of 
Hardware for Linux [2]

     git grep 'probe of i2c_designware' Notebook/

shows several devices with one probe time as long as 592 ms (ThinkPad 
ThinkPad X1 Extreme 20MFCTO1WW).

I tried to use pm-graph [3] to trace, what is happening, but as this is 
a module

     CONFIG_MFD_INTEL_LPSS=m
     # CONFIG_MFD_INTEL_LPSS_ACPI is not set
     CONFIG_MFD_INTEL_LPSS_PCI=m

tracing `intel_lpss_pci_driver()` does not work. I traced 
`mfd_add_devices()` instead

     initcall_debug log_buf_len=32M trace_buf_size=524288K 
trace_clock=global 
trace_options=nooverwrite,funcgraph-abstime,funcgraph-cpu,funcgraph-duration,funcgraph-proc,funcgraph-tail,nofuncgraph-overhead,context-info,graph-time 
ftrace=function_graph ftrace_graph_max_depth=25 
ftrace_graph_filter=mfd_add_devices

but this seems to have a big affect on ACPI/ASL operations, and 
execution time increases to 125 ms. This breaks down to

1.  `i2c_acpi_find_bus_speed()` (96.985 ms @ 3.008753), where 
`acpi_walk_namespace()` takes this time.
2.  `i2c_dw_probe_master()` (27.161 ms @ 3.105964) → 
i2c_add_numbered_adapter()` → `i2c_add_adapter()` → 
`i2c_register_adapter()` → `i2c_acpi_register_devices()` → 
`acpi_ns_walk_namespace()` (24.178 ms @ 3.108927)

No idea if this is a red herring, and the long time is actually do to 
something else. The ACPI tables are attached to another bug report in 
the Linux Kernel Bugzilla [1].


Kind regards,

Paul


[1]: https://bugzilla.kernel.org/show_bug.cgi?id=218465


Kind regards,

Paul


[1]: https://github.com/linuxhw/Dmesg
[2]: https://linux-hardware.org/
[3]: https://github.com/intel/pm-graph


```
$ git grep 'probe of i2c_designware' Notebook/
Notebook/ASUSTek Computer/VivoBook/VivoBook 15_ASUS Laptop 
X507MA_X507MA/2A5C75067695/CLEAR-LINUX-OS-29590/5.0.18-767.NATIVE/X86_64/11C13DA62B:[ 
   13.518781] probe of i2c_designware.0 returned 1 after 7213 usecs
Notebook/ASUSTek Computer/VivoBook/VivoBook 15_ASUS Laptop 
X507MA_X507MA/2A5C75067695/CLEAR-LINUX-OS-29590/5.0.18-767.NATIVE/X86_64/11C13DA62B:[ 
   13.744297] probe of i2c_designware.1 returned 1 after 224979 usecs
Notebook/ASUSTek Computer/VivoBook/VivoBook S13 
X330FL_S330FL/76D3A9436B98/ENDLESS-3.5.8-NEXTHW1/5.0.0-8-GENERIC/X86_64/CA394770BD:[ 
    3.124544] i2c_designware: probe of i2c_designware.0 failed with 
error -16
Notebook/ASUSTek 
Computer/X510/X510UAR/26DCC0805501/CLEAR-LINUX-OS-32480/5.5.6-914.NATIVE/X86_64/B73C34CE17:[ 
   10.962399] probe of i2c_designware.0 returned 1 after 9791 usecs
Notebook/ASUSTek 
Computer/X510/X510UAR/26DCC0805501/CLEAR-LINUX-OS-32480/5.5.6-914.NATIVE/X86_64/B73C34CE17:[ 
   11.051393] probe of i2c_designware.1 returned 1 after 84588 usecs
Notebook/Acer/Aspire/Aspire 
A515-52G/4369D864FF62/CLEAR-LINUX-OS-28720/5.0.7-727.NATIVE/X86_64/3FB9D9F561:[ 
    1.156442] probe of i2c_designware.0 returned 1 after 25026 usecs
Notebook/Acer/Aspire/Aspire 
A515-52G/4369D864FF62/CLEAR-LINUX-OS-28720/5.0.7-727.NATIVE/X86_64/3FB9D9F561:[ 
    1.214739] probe of i2c_designware.1 returned 1 after 53624 usecs
Notebook/Acer/Aspire/Aspire 
A515-52G/4369D864FF62/CLEAR-LINUX-OS-28720/5.0.7-727.NATIVE/X86_64/6C5781B14B:[ 
    1.156442] probe of i2c_designware.0 returned 1 after 25026 usecs
Notebook/Acer/Aspire/Aspire 
A515-52G/4369D864FF62/CLEAR-LINUX-OS-28720/5.0.7-727.NATIVE/X86_64/6C5781B14B:[ 
    1.214739] probe of i2c_designware.1 returned 1 after 53624 usecs
Notebook/Acer/Aspire/Aspire 
A515-52G/4369D864FF62/CLEAR-LINUX-OS-28720/5.0.7-727.NATIVE/X86_64/83A517D4ED:[ 
    1.156442] probe of i2c_designware.0 returned 1 after 25026 usecs
Notebook/Acer/Aspire/Aspire 
A515-52G/4369D864FF62/CLEAR-LINUX-OS-28720/5.0.7-727.NATIVE/X86_64/83A517D4ED:[ 
    1.214739] probe of i2c_designware.1 returned 1 after 53624 usecs
Notebook/Acer/Aspire/Aspire 
E5-576G/D393304386A2/CLEAR-LINUX-OS-29460/5.0.16-756.NATIVE/X86_64/97183F5186:[ 
    2.088584] probe of i2c_designware.0 returned 1 after 24819 usecs
Notebook/Acer/Aspire/Aspire 
ES1-572/C03C3C590F51/BLACKPANTHER-OS-18.1/4.18.16-DESKTOP-1BP/X86_64/F52BEBAFB1:[ 
   14.063397] i2c_designware: probe of i2c_designware.0 failed with 
error -16
Notebook/Acer/Aspire/Aspire 
ES1-572/C03C3C590F51/BLACKPANTHER-OS-18.1/4.18.16-DESKTOP-1BP/X86_64/F52BEBAFB1:[ 
   14.075372] i2c_designware: probe of i2c_designware.1 failed with 
error -16
Notebook/Acer/Nitro/Nitro 
AN515-51/2B880C8BA31C/BLACKPANTHER-OS-18.1/4.18.16-DESKTOP-1BP/X86_64/AAB0994586:[ 
   15.780370] i2c_designware: probe of i2c_designware.0 failed with 
error -16
Notebook/Acer/Nitro/Nitro 
AN515-51/2B880C8BA31C/BLACKPANTHER-OS-18.1/4.18.16-DESKTOP-1BP/X86_64/AAB0994586:[ 
   15.794277] i2c_designware: probe of i2c_designware.1 failed with 
error -16
Notebook/Acer/Swift/Swift 
SF114-32/F33F18023023/CLEAR-LINUX-OS-32400/5.5.6-914.NATIVE/X86_64/7990186D76:[ 
    4.510911] probe of i2c_designware.0 returned 1 after 31760 usecs
Notebook/Acer/Swift/Swift 
SF114-32/F33F18023023/CLEAR-LINUX-OS-32400/5.5.6-914.NATIVE/X86_64/846827952C:[ 
    4.510911] probe of i2c_designware.0 returned 1 after 31760 usecs
Notebook/Acer/Swift/Swift 
SF114-32/F33F18023023/CLEAR-LINUX-OS-32400/5.5.6-914.NATIVE/X86_64/93865EFE48:[ 
    4.510911] probe of i2c_designware.0 returned 1 after 31760 usecs
Notebook/Dell/G3/G3 
3590/46E6E4D9946A/UBUNTU-18.04/5.0.0-23-GENERIC/X86_64/76CD3DB0A0:[ 
13.093482] i2c_designware: probe of i2c_designware.0 failed with error -16
Notebook/Dell/G3/G3 
3590/46E6E4D9946A/UBUNTU-18.04/5.0.0-23-GENERIC/X86_64/91135FF479:[ 
12.735689] i2c_designware: probe of i2c_designware.0 failed with error -16
Notebook/Dell/G3/G3 
3590/B96A7159860A/DEBIAN-10/4.19.0-17-AMD64/X86_64/01A9560F9C:[ 
1.814297] i2c_designware: probe of i2c_designware.0 failed with error -16
Notebook/Dell/G3/G3 
3590/B96A7159860A/DEBIAN-10/4.19.0-17-AMD64/X86_64/16BDB588E1:[ 
1.749530] i2c_designware: probe of i2c_designware.0 failed with error -16
Notebook/Dell/G3/G3 
3590/EC0034E41469/LMDE-4/4.19.0-9-AMD64/X86_64/6B37AF517B:[    1.657712] 
i2c_designware: probe of i2c_designware.0 failed with error -16
Notebook/Dell/G7/G7 
7790/BCDC6A3A8597/UBUNTU-18.04/5.0.0-23-GENERIC/X86_64/1F292A4D7E:[ 
10.257859] i2c_designware: probe of i2c_designware.0 failed with error -16
Notebook/Hewlett-Packard/ENVY/ENVY Laptop 
13-ah1xxx/317371DCCB01/XUBUNTU-16.04/4.19.113-BRUNCH-SEBANC/X86_64/B9C34FDDC7:[ 
   18.813308] i2c_designware: probe of i2c_designware.0 failed with 
error -16
Notebook/Lenovo/IdeaPad/IdeaPad 120S-11IAP 
81A4/D3192698B654/CLEAR-LINUX-OS-29620/5.0.18-767.NATIVE/X86_64/217DC98A9F:[ 
    6.035137] probe of i2c_designware.0 returned 1 after 72526 usecs
Notebook/Lenovo/IdeaPad/IdeaPad 120S-11IAP 
81A4/D3192698B654/CLEAR-LINUX-OS-29620/5.0.18-767.NATIVE/X86_64/217DC98A9F:[ 
    6.121895] probe of i2c_designware.1 returned 1 after 85352 usecs
Notebook/Lenovo/IdeaPad/IdeaPad 120S-11IAP 
81A4/D3192698B654/CLEAR-LINUX-OS-29620/5.0.18-767.NATIVE/X86_64/C94D8180A7:[ 
    4.998776] probe of i2c_designware.0 returned 1 after 52354 usecs
Notebook/Lenovo/IdeaPad/IdeaPad 120S-11IAP 
81A4/D3192698B654/CLEAR-LINUX-OS-29620/5.0.18-767.NATIVE/X86_64/C94D8180A7:[ 
    5.114521] probe of i2c_designware.1 returned 1 after 114580 usecs
Notebook/Lenovo/IdeaPad/IdeaPad 330-15ICH 
81FK/1E42845A2DFD/CLEAR-LINUX-OS-30340/5.1.17-796.NATIVE/X86_64/1613715663:[ 
    3.011335] probe of i2c_designware.0 returned 1 after 176270 usecs
Notebook/Lenovo/IdeaPad/IdeaPad 330-15ICH 
81FK/1E42845A2DFD/CLEAR-LINUX-OS-30340/5.1.17-796.NATIVE/X86_64/1613715663:[ 
    3.030094] probe of i2c_designware.1 returned 1 after 17225 usecs
Notebook/Lenovo/IdeaPad/IdeaPad 330-15ICH 
81FK/1E42845A2DFD/CLEAR-LINUX-OS-30340/5.1.17-796.NATIVE/X86_64/AED8974317:[ 
    3.011335] probe of i2c_designware.0 returned 1 after 176270 usecs
Notebook/Lenovo/IdeaPad/IdeaPad 330-15ICH 
81FK/1E42845A2DFD/CLEAR-LINUX-OS-30340/5.1.17-796.NATIVE/X86_64/AED8974317:[ 
    3.030094] probe of i2c_designware.1 returned 1 after 17225 usecs
Notebook/Lenovo/IdeaPad/IdeaPad 330-15IKB 
81DE/1B94E7802D9C/CLEAR-LINUX-OS-29750/5.1.5-770.NATIVE/X86_64/70FECD4E42:[ 
    1.380181] probe of i2c_designware.0 returned 1 after 91158 usecs
Notebook/Lenovo/IdeaPad/IdeaPad 520-15IKB 
81BF/FFD9F0EE2300/BLACKPANTHER-OS-18.1/4.18.16-DESKTOP-1BP/X86_64/B34F8631C6:[ 
   20.167008] i2c_designware: probe of i2c_designware.0 failed with 
error -16
Notebook/Lenovo/Legion/Legion Y530-15ICH 
81FV/A94C3F5F954E/CLEAR-LINUX-OS-30970/5.2.13-832.NATIVE/X86_64/8DBE2671E7:[ 
    1.463780] probe of i2c_designware.0 returned 1 after 83811 usecs
Notebook/Lenovo/Legion/Legion Y530-15ICH 
81FV/A94C3F5F954E/CLEAR-LINUX-OS-30970/5.2.13-832.NATIVE/X86_64/8DBE2671E7:[ 
    1.495314] probe of i2c_designware.1 returned 1 after 30260 usecs
Notebook/Lenovo/ThinkPad/ThinkPad L490 
20Q5CTO1WW/66898CEB3E53/UBUNTU-18.04/5.0.0-23-GENERIC/X86_64/60BA0E3D0F:[ 
   19.547447] i2c_designware: probe of i2c_designware.0 failed with 
error -16
Notebook/Lenovo/ThinkPad/ThinkPad L490 
20Q5CTO1WW/66898CEB3E53/UBUNTU-18.04/5.0.0-23-GENERIC/X86_64/A3E9CA6D37:[ 
   19.547447] i2c_designware: probe of i2c_designware.0 failed with 
error -16
Notebook/Lenovo/ThinkPad/ThinkPad L490 
20Q5CTO1WW/DAF2856F5000/OL-8.1/4.18.0-147.5.1.EL8_1.X86_64/X86_64/D8B2C132C1:[ 
   16.720334] i2c_designware: probe of i2c_designware.0 failed with 
error -16
Notebook/Lenovo/ThinkPad/ThinkPad L590 
20Q7CTO1WW/6C112E45AACC/DEBIAN-10/4.19.0-17-AMD64/X86_64/EC305DDC45:[ 
2.210798] i2c_designware: probe of i2c_designware.0 failed with error -16
Notebook/Lenovo/ThinkPad/ThinkPad X1 Carbon 7th 
20QES2P401/24D0F5C46CEB/RHEL-8/4.18.0-147.EL8.X86_64/X86_64/7B90AA9C1B:[ 
   27.427196] i2c_designware: probe of i2c_designware.0 failed with 
error -16
Notebook/Lenovo/ThinkPad/ThinkPad X1 Carbon 7th 
20QES2P401/24D0F5C46CEB/RHEL-8/4.18.0-80.11.2.EL8_0.X86_64/X86_64/1858B15D73:[ 
   31.193231] i2c_designware: probe of i2c_designware.0 failed with 
error -16
Notebook/Lenovo/ThinkPad/ThinkPad X1 Extreme 
20MFCTO1WW/8F2B0B6760DC/CLEAR-LINUX-OS-26850/4.19.11-673.NATIVE/X86_64/1E7ADBE67A:[ 
    3.933830] probe of i2c_designware.0 returned 1 after 591873 usecs
Notebook/Lenovo/ThinkPad/ThinkPad X1 Extreme 
20MFCTO1WW/8F2B0B6760DC/CLEAR-LINUX-OS-26850/4.19.11-673.NATIVE/X86_64/A684D1AEEA:[ 
    3.933830] probe of i2c_designware.0 returned 1 after 591873 usecs
```

