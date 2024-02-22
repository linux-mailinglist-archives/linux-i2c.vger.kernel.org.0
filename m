Return-Path: <linux-i2c+bounces-1921-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B5785FD6A
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 16:59:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A27802835FF
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 15:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 897D814E2E8;
	Thu, 22 Feb 2024 15:59:25 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E59512FF8D;
	Thu, 22 Feb 2024 15:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708617565; cv=none; b=Hze+TCvfxw3e/yOh7nNDck6L/taUEd/ksLwNv3Tm2y8cpCSRdwOswaz0QcQhX4S/mzwjlGH2ZkuVoWp+WstI7UIk1nvj199WTOGnCs71LdZbL30vUITZgUepvzVDUotM3Z+oZU4MZZBwG0depQynaxIb16/7y3a4ASSKTyQ21do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708617565; c=relaxed/simple;
	bh=z5n+lwB1B7hTQ61nqf7g5g6JVx5KRYUBVhYnLqa19OM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oxPKnNJt2KrCSzDd02L23ACbsuLW+Le7J2QD1Jngn5LCt3SCQO99bf/5nq15XoIbYbd4xNOtHM7rjqpvYoQ37I+rgfCxWxtDAai6OkMZZiXZs86lPekd7JAT28hwi7UpklsmrWmoJrTEh8AyEH6rpUW65uF8JJUMUvYqRFZuflA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [141.14.220.34] (g34.guest.molgen.mpg.de [141.14.220.34])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id E17AE61E5FE01;
	Thu, 22 Feb 2024 16:59:03 +0100 (CET)
Message-ID: <68a6e356-a53e-4bc2-8f5c-4ab36c0c3349@molgen.mpg.de>
Date: Thu, 22 Feb 2024 16:59:03 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: irq/51-DLL075B:01 in D state without touchpad usage, interrupts
 increase
Content-Language: en-US
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <9181c391-bb08-4c1e-ad27-94b8493df86d@molgen.mpg.de>
 <03572069-c9ab-4912-a6b1-9f9c26ae5384@linux.intel.com>
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <03572069-c9ab-4912-a6b1-9f9c26ae5384@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Jarkko,


Thank you very much for your reply.

Am 22.02.24 um 16:16 schrieb Jarkko Nikula:

> On 2/20/24 18:15, Paul Menzel wrote:

>> On a Dell XPS 13 9360 with Debian sid/unstable and Linux 6.8-rc4+ (and 
>> probably before), I sometimes notice the fan spinning up, and trying 
>> to figure out why, I noticed that `top` showed `irq/51-DLL075B:01` in 
>> state D (uninterruptible sleep (usually IO)). That is without using 
>> the touchpad. I am using an external USB keyboard and an external USB 
>> mouse.
>>
>>
>>      $ sudo dmesg | grep -e "DMI:" -e "Linux version" -e microcode
>>          [    0.000000] Linux version 6.8.0-rc4+ (build@bohemianrhapsody.molgen.mpg.de) (gcc (Debian 13.2.0-13) 13.2.0, GNU ld (GNU Binutils for Debian) 2.42) #25 SMP PREEMPT_DYNAMIC Sat Feb 17 05:39:03 CET 2024
>>      [    0.000000] DMI: Dell Inc. XPS 13 9360/0596KF, BIOS 2.21.0 06/02/2022
>>      [    0.367292] microcode: Current revision: 0x000000f4
>>      [    0.367293] microcode: Updated early from: 0x000000f0
>>
>>      $ sudo dmesg | grep DLL075B
>>      [    0.967975] input: DLL075B:01 06CB:76AF Mouse as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-DLL075B:01/0018:06CB:76AF.0001/input/input2
>>      [    0.968302] input: DLL075B:01 06CB:76AF Touchpad as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-DLL075B:01/0018:06CB:76AF.0001/input/input3
>>      [    0.968569] hid-generic 0018:06CB:76AF.0001: input,hidraw0: I2C HID v1.00 Mouse [DLL075B:01 06CB:76AF] on i2c-DLL075B:01
>>      [   19.753775] input: DLL075B:01 06CB:76AF Mouse as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-DLL075B:01/0018:06CB:76AF.0001/input/input17
>>      [   19.753950] input: DLL075B:01 06CB:76AF Touchpad as /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-DLL075B:01/0018:06CB:76AF.0001/input/input18
>>      [   19.754654] hid-multitouch 0018:06CB:76AF.0001: input,hidraw0: I2C HID v1.00 Mouse [DLL075B:01 06CB:76AF] on i2c-DLL075B:01
>>
>>  From `top`:
>>
>>      206 root     -51   0       0      0      0 D   1,7   0,0   8:45.46 irq/51-DLL075B:01
>>
>>      $ ps aux | grep 'irq/51'
>>      root         206  0.2  0.0      0     0 ?        D    Feb17  12:11 [irq/51-DLL075B:01]
>>
>> The interrupts increase though by around 610 per second (without using 
>> the device):
>>
>>      $ for i in $(seq 1 10); do LANG= date; sudo grep -e '17:' -e '51:' /proc/interrupts; sleep 1; done
>>      Tue Feb 20 17:04:23 CET 2024
>>        17: 1631256120          0          0    6452384  IR-IO-APIC 17-fasteoi   idma64.1, i2c_designware.1
>>        51:   25255617     109943          0          0  IR-IO-APIC 51-fasteoi   DLL075B:01
>>      Tue Feb 20 17:04:27 CET 2024
>>        17: 1631295844          0          0    6452384  IR-IO-APIC 17-fasteoi   idma64.1, i2c_designware.1
>>        51:   25256229     109943          0          0  IR-IO-APIC 51-fasteoi   DLL075B:01
>>      Tue Feb 20 17:04:28 CET 2024
>>        17: 1631335618          0          0    6452384  IR-IO-APIC 17-fasteoi   idma64.1, i2c_designware.1
>>        51:   25256843     109943          0          0  IR-IO-APIC 51-fasteoi   DLL075B:01
>>      Tue Feb 20 17:04:29 CET 2024
>>        17: 1631375224          0          0    6452384  IR-IO-APIC 17-fasteoi   idma64.1, i2c_designware.1
>>        51:   25257454     109943          0          0  IR-IO-APIC 51-fasteoi   DLL075B:01
>>      Tue Feb 20 17:04:30 CET 2024
>>        17: 1631415636          0          0    6452384  IR-IO-APIC 17-fasteoi   idma64.1, i2c_designware.1
>>        51:   25258076     109943          0          0  IR-IO-APIC 51-fasteoi   DLL075B:01
>>      Tue Feb 20 17:04:31 CET 2024
>>        17: 1631455174          0          0    6452384  IR-IO-APIC 17-fasteoi   idma64.1, i2c_designware.1
>>        51:   25258687     109943          0          0  IR-IO-APIC 51-fasteoi   DLL075B:01
>>      Tue Feb 20 17:04:32 CET 2024
>>        17: 1631494990          0          0    6452384  IR-IO-APIC 17-fasteoi   idma64.1, i2c_designware.1
>>        51:   25259300     109943          0          0  IR-IO-APIC 51-fasteoi   DLL075B:01
>>      Tue Feb 20 17:04:33 CET 2024
>>        17: 1631534944          0          0    6452384  IR-IO-APIC 17-fasteoi   idma64.1, i2c_designware.1
>>        51:   25259915     109943          0          0  IR-IO-APIC 51-fasteoi   DLL075B:01
>>      Tue Feb 20 17:04:34 CET 2024
>>        17: 1631574647          0          0    6452384  IR-IO-APIC 17-fasteoi   idma64.1, i2c_designware.1
>>        51:   25260527     109943          0          0  IR-IO-APIC 51-fasteoi   DLL075B:01
>>      Tue Feb 20 17:04:35 CET 2024
>>        17: 1631613552          0          0    6452384  IR-IO-APIC 17-fasteoi   idma64.1, i2c_designware.1
>>        51:   25261130     109943          0          0  IR-IO-APIC 51-fasteoi   DLL075B:01
>>
>> The D state increases the load average.
>>
>> Is that the expected behavior?
>
> No this is not. Touchpad appears to be firing interrupt line 51 
> continuously and then drivers/hid/i2c-hid/i2c-hid-core.c: i2c_hid_irq() 
> is trying to read input from touchpad over I2C bus.
> 
> Not sure is this HW failure or system FW error (there are bad ACPI 
> tables out there misconfiguring things etc).

It normally works, and I have no idea, if this even contributed to the 
laggy system. Right now, the interrupts do not increase when *not* using 
the touchpad or touchscreen.

If it helps, the output of `acpidump` is attached to the (unrelated) 
Linux Kernel Bugzilla issue *Linux warning `usb: port power management 
may be unreliable` on Dell XPS 13 9360* [1].

Do you have a suggestion, what I can do next time, this happens?

Could Linux detect this situation and log something?


Kind regards,

Paul


[1]: https://bugzilla.kernel.org/show_bug.cgi?id=218465

