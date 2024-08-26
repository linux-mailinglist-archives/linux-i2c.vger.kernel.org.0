Return-Path: <linux-i2c+bounces-5800-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D351995F069
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 14:05:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02FAD1C21B53
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 12:05:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 163441714A9;
	Mon, 26 Aug 2024 12:05:37 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3AC78C73;
	Mon, 26 Aug 2024 12:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724673936; cv=none; b=q7dv2PNgJ/+FEme1daJpV8JJq6PW05GBJQq/PHtz+EEU0i6n7M56Ig4y4OGugY5VX2ljIkpYEBD/5wV3053GqYTrWYLHzMBTbM4soxw/4RY7ueFzcfBc1mlAHk2c5QkXTlwOA5bsInIa2KYNuFfTt/m018fnU/R7RNBokC8ViDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724673936; c=relaxed/simple;
	bh=oc9W5d/6IUY+1cM7KqxrujEt2RBf5ueRAy2nAm8Znyw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O2oQ7JJj7B8gfvUvLDiLHKtVA3LfcRmgoX8byArNj/OEoi4Jzjgc8B+4/QGw3SdYbQVn3NObKo0afQlyV6x3dhY3Mtn36m6LvL89UFiXDOAz0zfmHgBtgCcgHN56A8Iz5DEb1NImXXvTzNS7SsQtyXwFctBuD/34nLGlWsAwXRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.224] (ip5f5aead7.dynamic.kabel-deutschland.de [95.90.234.215])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id E9C6A61E5FE05;
	Mon, 26 Aug 2024 14:05:17 +0200 (CEST)
Message-ID: <0d0d69b9-6c46-4d7b-9ae7-2a8970f89555@molgen.mpg.de>
Date: Mon, 26 Aug 2024 14:05:17 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: irq/51-DLL075B:01 in D state without touchpad usage, interrupts
 increase
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <9181c391-bb08-4c1e-ad27-94b8493df86d@molgen.mpg.de>
 <03572069-c9ab-4912-a6b1-9f9c26ae5384@linux.intel.com>
 <68a6e356-a53e-4bc2-8f5c-4ab36c0c3349@molgen.mpg.de>
 <f1631883-3a2b-4e48-aa37-77c8b4564229@linux.intel.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <f1631883-3a2b-4e48-aa37-77c8b4564229@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Jarkko,


Sorry for the late reply.

Am 23.02.24 um 11:09 schrieb Jarkko Nikula:
> On 2/22/24 17:59, Paul Menzel wrote:

>> Am 22.02.24 um 16:16 schrieb Jarkko Nikula:
>>
>>> On 2/20/24 18:15, Paul Menzel wrote:
>>
>>>> On a Dell XPS 13 9360 with Debian sid/unstable and Linux 6.8-rc4+ 
>>>> (and probably before), I sometimes notice the fan spinning up, and 
>>>> trying to figure out why, I noticed that `top` showed `irq/51- 
>>>> DLL075B:01` in state D (uninterruptible sleep (usually IO)). That is 
>>>> without using the touchpad. I am using an external USB keyboard and 
>>>> an external USB mouse.
>>>>
>>>>
>>>>      $ sudo dmesg | grep -e "DMI:" -e "Linux version" -e microcode
>>>>          [    0.000000] Linux version 6.8.0-rc4+ (build@bohemianrhapsody.molgen.mpg.de) (gcc (Debian 13.2.0-13) 13.2.0, GNU ld (GNU Binutils for Debian) 2.42) #25 SMP PREEMPT_DYNAMIC Sat Feb 17 05:39:03 CET 2024
>>>>      [    0.000000] DMI: Dell Inc. XPS 13 9360/0596KF, BIOS 2.21.0 06/02/2022
>>>>      [    0.367292] microcode: Current revision: 0x000000f4
>>>>      [    0.367293] microcode: Updated early from: 0x000000f0
>>>>
>>>>      $ sudo dmesg | grep DLL075B
>>>>      [    0.967975] input: DLL075B:01 06CB:76AF Mouse as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-DLL075B:01/0018:06CB:76AF.0001/input/input2
>>>>      [    0.968302] input: DLL075B:01 06CB:76AF Touchpad as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-DLL075B:01/0018:06CB:76AF.0001/input/input3
>>>>      [    0.968569] hid-generic 0018:06CB:76AF.0001: input,hidraw0: I2C HID v1.00 Mouse [DLL075B:01 06CB:76AF] on i2c-DLL075B:01
>>>>      [   19.753775] input: DLL075B:01 06CB:76AF Mouse as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-DLL075B:01/0018:06CB:76AF.0001/input/input17
>>>>      [   19.753950] input: DLL075B:01 06CB:76AF Touchpad as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-DLL075B:01/0018:06CB:76AF.0001/input/input18
>>>>      [   19.754654] hid-multitouch 0018:06CB:76AF.0001: input,hidraw0: I2C HID v1.00 Mouse [DLL075B:01 06CB:76AF] on i2c-DLL075B:01
>>>>
>>>>  From `top`:
>>>>
>>>>      206 root     -51   0       0      0      0 D   1,7   0,0 8:45.46 irq/51-DLL075B:01
>>>>
>>>>      $ ps aux | grep 'irq/51'
>>>>      root         206  0.2  0.0      0     0 ?        D    Feb17 12:11 [irq/51-DLL075B:01]
>>>>
>>>> The interrupts increase though by around 610 per second (without 
>>>> using the device):
>>>>
>>>>      $ for i in $(seq 1 10); do LANG= date; sudo grep -e '17:' -e '51:' /proc/interrupts; sleep 1; done
>>>>      Tue Feb 20 17:04:23 CET 2024
>>>>        17: 1631256120          0          0    6452384  IR-IO-APIC 17-fasteoi   idma64.1, i2c_designware.1
>>>>        51:   25255617     109943          0          0  IR-IO-APIC 51-fasteoi   DLL075B:01
>>>>      Tue Feb 20 17:04:27 CET 2024
>>>>        17: 1631295844          0          0    6452384  IR-IO-APIC 17-fasteoi   idma64.1, i2c_designware.1
>>>>        51:   25256229     109943          0          0  IR-IO-APIC 51-fasteoi   DLL075B:01
>>>>      Tue Feb 20 17:04:28 CET 2024
>>>>        17: 1631335618          0          0    6452384  IR-IO-APIC 17-fasteoi   idma64.1, i2c_designware.1
>>>>        51:   25256843     109943          0          0  IR-IO-APIC 51-fasteoi   DLL075B:01
>>>>      Tue Feb 20 17:04:29 CET 2024
>>>>        17: 1631375224          0          0    6452384  IR-IO-APIC 17-fasteoi   idma64.1, i2c_designware.1
>>>>        51:   25257454     109943          0          0  IR-IO-APIC 51-fasteoi   DLL075B:01
>>>>      Tue Feb 20 17:04:30 CET 2024
>>>>        17: 1631415636          0          0    6452384  IR-IO-APIC 17-fasteoi   idma64.1, i2c_designware.1
>>>>        51:   25258076     109943          0          0  IR-IO-APIC 51-fasteoi   DLL075B:01
>>>>      Tue Feb 20 17:04:31 CET 2024
>>>>        17: 1631455174          0          0    6452384  IR-IO-APIC 17-fasteoi   idma64.1, i2c_designware.1
>>>>        51:   25258687     109943          0          0  IR-IO-APIC 51-fasteoi   DLL075B:01
>>>>      Tue Feb 20 17:04:32 CET 2024
>>>>        17: 1631494990          0          0    6452384  IR-IO-APIC 17-fasteoi   idma64.1, i2c_designware.1
>>>>        51:   25259300     109943          0          0  IR-IO-APIC 51-fasteoi   DLL075B:01
>>>>      Tue Feb 20 17:04:33 CET 2024
>>>>        17: 1631534944          0          0    6452384  IR-IO-APIC 17-fasteoi   idma64.1, i2c_designware.1
>>>>        51:   25259915     109943          0          0  IR-IO-APIC 51-fasteoi   DLL075B:01
>>>>      Tue Feb 20 17:04:34 CET 2024
>>>>        17: 1631574647          0          0    6452384  IR-IO-APIC 17-fasteoi   idma64.1, i2c_designware.1
>>>>        51:   25260527     109943          0          0  IR-IO-APIC 51-fasteoi   DLL075B:01
>>>>      Tue Feb 20 17:04:35 CET 2024
>>>>        17: 1631613552          0          0    6452384  IR-IO-APIC 17-fasteoi   idma64.1, i2c_designware.1
>>>>        51:   25261130     109943          0          0  IR-IO-APIC 51-fasteoi   DLL075B:01
>>>>
>>>> The D state increases the load average.
>>>>
>>>> Is that the expected behavior?
>>>
>>> No this is not. Touchpad appears to be firing interrupt line 51 
>>> continuously and then drivers/hid/i2c-hid/i2c-hid-core.c: 
>>> i2c_hid_irq() is trying to read input from touchpad over I2C bus.
>>>
>>> Not sure is this HW failure or system FW error (there are bad ACPI 
>>> tables out there misconfiguring things etc).
>>
>> It normally works, and I have no idea, if this even contributed to the 
>> laggy system. Right now, the interrupts do not increase when *not* 
>> using the touchpad or touchscreen.
>
> Ah, so it triggers randomly?

Often I only notice it after resuming from ACPI S3 with an USB-C 
multi-port adapter connected, so not using the touchpad at all.

> When it happens does the situation remain or does it recover back to
> normal somehow, e.g. after touching the touchpad, unloading and
> loading the i2c_hid[_acpi] module, suspend/ resume cycle, etc?

After touching the touchpad, the interrupt storm stops.

>> If it helps, the output of `acpidump` is attached to the (unrelated) 
>> Linux Kernel Bugzilla issue *Linux warning `usb: port power management 
>> may be unreliable` on Dell XPS 13 9360* [1].
>>
>> Do you have a suggestion, what I can do next time, this happens?
>
> I'd try to see is it possible to recover back to normal or is reboot 
> required. That might give ideas what might trigger the situation.
> 
>> Could Linux detect this situation and log something?
>>
> Don't know. Perhaps difficult to differentiate from normal touchpad use.

Interrupt 17 seems to be fired almost 40.000 times per second. Could 
this be an indicator?


Kind regards,

Paul

