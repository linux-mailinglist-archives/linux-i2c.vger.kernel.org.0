Return-Path: <linux-i2c+bounces-1939-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B933860EEC
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 11:10:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FC901C2175F
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Feb 2024 10:09:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 876B95CDCE;
	Fri, 23 Feb 2024 10:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ivsYU7TL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2615CDCA;
	Fri, 23 Feb 2024 10:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708682994; cv=none; b=Z/51+0RSqTdCkkxWg8DORj12ro7/GFABXxyLhp82Idbw4srQjGn/0oYL/klOtq5QKJje739lmp4wWrRffQfyAmnt8jaFYX2S5CZg+pyGKzOFKgVHSSVmoLAHgUkFO3OvKSI9J1LtYM9SAqsuOe+SoI9pgkNmdPiY70LHoV1Txng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708682994; c=relaxed/simple;
	bh=URfFpOQ1isznRhH/xiFa04n/cMubW1udR/5z9a93b5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z8igX5c+MSgWn3kxyE7fSjZolnKt9oOyLPHkKOvw/NW9y/heNpWB4hXNhLuJODZfJqNbit5pncW+7mAfYK1d2myIBay5V5tycdclZ8y88V8duYUpCTjPCyc6LMjchtDn/YnRSJmF6L2LjZ3++kzn74LLgeEQSkrckt9oOvaLryw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ivsYU7TL; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708682992; x=1740218992;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=URfFpOQ1isznRhH/xiFa04n/cMubW1udR/5z9a93b5Q=;
  b=ivsYU7TLy9TC0jNoV1QP/ATbjwjFSBiORG+0g0yfMSaIEB9M71nj2exH
   jeAB360INsnhUawJ0Wi9h3VhoAdOB2wRYMDoHzSlU+wIyayOfDi/cNsL4
   WhjXYEH4o7a1pAkwcWM3gGBhN/ekDgCWA0wnWJ/NbbaXVfFzHVZZKNz6h
   xJBJuHx4FgZz1ofPhqu8pZx9kKJOeJCDCYLjQ75cXcQaTEjLKfmJrg+Cj
   aWiqHTL1nJC/f3jwCt/u9n3GvQAta2GoxM3r6WKgF+bGhNiBsujARQcea
   oRSwosR3/8i/fJFuUKQyjTjkf70AzdA3gCBQ+3UpdNUfztMBycRFJe6PG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="20527523"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="20527523"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2024 02:09:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5746931"
Received: from marquiz-s-2.fi.intel.com (HELO [10.237.72.58]) ([10.237.72.58])
  by fmviesa007.fm.intel.com with ESMTP; 23 Feb 2024 02:09:50 -0800
Message-ID: <f1631883-3a2b-4e48-aa37-77c8b4564229@linux.intel.com>
Date: Fri, 23 Feb 2024 12:09:49 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: irq/51-DLL075B:01 in D state without touchpad usage, interrupts
 increase
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: linux-i2c@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <9181c391-bb08-4c1e-ad27-94b8493df86d@molgen.mpg.de>
 <03572069-c9ab-4912-a6b1-9f9c26ae5384@linux.intel.com>
 <68a6e356-a53e-4bc2-8f5c-4ab36c0c3349@molgen.mpg.de>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <68a6e356-a53e-4bc2-8f5c-4ab36c0c3349@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/22/24 17:59, Paul Menzel wrote:
> Dear Jarkko,
> 
> 
> Thank you very much for your reply.
> 
> Am 22.02.24 um 16:16 schrieb Jarkko Nikula:
> 
>> On 2/20/24 18:15, Paul Menzel wrote:
> 
>>> On a Dell XPS 13 9360 with Debian sid/unstable and Linux 6.8-rc4+ 
>>> (and probably before), I sometimes notice the fan spinning up, and 
>>> trying to figure out why, I noticed that `top` showed 
>>> `irq/51-DLL075B:01` in state D (uninterruptible sleep (usually IO)). 
>>> That is without using the touchpad. I am using an external USB 
>>> keyboard and an external USB mouse.
>>>
>>>
>>>      $ sudo dmesg | grep -e "DMI:" -e "Linux version" -e microcode
>>>          [    0.000000] Linux version 6.8.0-rc4+ 
>>> (build@bohemianrhapsody.molgen.mpg.de) (gcc (Debian 13.2.0-13) 
>>> 13.2.0, GNU ld (GNU Binutils for Debian) 2.42) #25 SMP 
>>> PREEMPT_DYNAMIC Sat Feb 17 05:39:03 CET 2024
>>>      [    0.000000] DMI: Dell Inc. XPS 13 9360/0596KF, BIOS 2.21.0 
>>> 06/02/2022
>>>      [    0.367292] microcode: Current revision: 0x000000f4
>>>      [    0.367293] microcode: Updated early from: 0x000000f0
>>>
>>>      $ sudo dmesg | grep DLL075B
>>>      [    0.967975] input: DLL075B:01 06CB:76AF Mouse as 
>>> /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-DLL075B:01/0018:06CB:76AF.0001/input/input2
>>>      [    0.968302] input: DLL075B:01 06CB:76AF Touchpad as 
>>> /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-DLL075B:01/0018:06CB:76AF.0001/input/input3
>>>      [    0.968569] hid-generic 0018:06CB:76AF.0001: input,hidraw0: 
>>> I2C HID v1.00 Mouse [DLL075B:01 06CB:76AF] on i2c-DLL075B:01
>>>      [   19.753775] input: DLL075B:01 06CB:76AF Mouse as 
>>> /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-DLL075B:01/0018:06CB:76AF.0001/input/input17
>>>      [   19.753950] input: DLL075B:01 06CB:76AF Touchpad as 
>>> /devices/pci0000:00/0000:00:15.1/i2c_designware.1/i2c-2/i2c-DLL075B:01/0018:06CB:76AF.0001/input/input18
>>>      [   19.754654] hid-multitouch 0018:06CB:76AF.0001: 
>>> input,hidraw0: I2C HID v1.00 Mouse [DLL075B:01 06CB:76AF] on 
>>> i2c-DLL075B:01
>>>
>>>  From `top`:
>>>
>>>      206 root     -51   0       0      0      0 D   1,7   0,0   
>>> 8:45.46 irq/51-DLL075B:01
>>>
>>>      $ ps aux | grep 'irq/51'
>>>      root         206  0.2  0.0      0     0 ?        D    Feb17  
>>> 12:11 [irq/51-DLL075B:01]
>>>
>>> The interrupts increase though by around 610 per second (without 
>>> using the device):
>>>
>>>      $ for i in $(seq 1 10); do LANG= date; sudo grep -e '17:' -e 
>>> '51:' /proc/interrupts; sleep 1; done
>>>      Tue Feb 20 17:04:23 CET 2024
>>>        17: 1631256120          0          0    6452384  IR-IO-APIC 
>>> 17-fasteoi   idma64.1, i2c_designware.1
>>>        51:   25255617     109943          0          0  IR-IO-APIC 
>>> 51-fasteoi   DLL075B:01
>>>      Tue Feb 20 17:04:27 CET 2024
>>>        17: 1631295844          0          0    6452384  IR-IO-APIC 
>>> 17-fasteoi   idma64.1, i2c_designware.1
>>>        51:   25256229     109943          0          0  IR-IO-APIC 
>>> 51-fasteoi   DLL075B:01
>>>      Tue Feb 20 17:04:28 CET 2024
>>>        17: 1631335618          0          0    6452384  IR-IO-APIC 
>>> 17-fasteoi   idma64.1, i2c_designware.1
>>>        51:   25256843     109943          0          0  IR-IO-APIC 
>>> 51-fasteoi   DLL075B:01
>>>      Tue Feb 20 17:04:29 CET 2024
>>>        17: 1631375224          0          0    6452384  IR-IO-APIC 
>>> 17-fasteoi   idma64.1, i2c_designware.1
>>>        51:   25257454     109943          0          0  IR-IO-APIC 
>>> 51-fasteoi   DLL075B:01
>>>      Tue Feb 20 17:04:30 CET 2024
>>>        17: 1631415636          0          0    6452384  IR-IO-APIC 
>>> 17-fasteoi   idma64.1, i2c_designware.1
>>>        51:   25258076     109943          0          0  IR-IO-APIC 
>>> 51-fasteoi   DLL075B:01
>>>      Tue Feb 20 17:04:31 CET 2024
>>>        17: 1631455174          0          0    6452384  IR-IO-APIC 
>>> 17-fasteoi   idma64.1, i2c_designware.1
>>>        51:   25258687     109943          0          0  IR-IO-APIC 
>>> 51-fasteoi   DLL075B:01
>>>      Tue Feb 20 17:04:32 CET 2024
>>>        17: 1631494990          0          0    6452384  IR-IO-APIC 
>>> 17-fasteoi   idma64.1, i2c_designware.1
>>>        51:   25259300     109943          0          0  IR-IO-APIC 
>>> 51-fasteoi   DLL075B:01
>>>      Tue Feb 20 17:04:33 CET 2024
>>>        17: 1631534944          0          0    6452384  IR-IO-APIC 
>>> 17-fasteoi   idma64.1, i2c_designware.1
>>>        51:   25259915     109943          0          0  IR-IO-APIC 
>>> 51-fasteoi   DLL075B:01
>>>      Tue Feb 20 17:04:34 CET 2024
>>>        17: 1631574647          0          0    6452384  IR-IO-APIC 
>>> 17-fasteoi   idma64.1, i2c_designware.1
>>>        51:   25260527     109943          0          0  IR-IO-APIC 
>>> 51-fasteoi   DLL075B:01
>>>      Tue Feb 20 17:04:35 CET 2024
>>>        17: 1631613552          0          0    6452384  IR-IO-APIC 
>>> 17-fasteoi   idma64.1, i2c_designware.1
>>>        51:   25261130     109943          0          0  IR-IO-APIC 
>>> 51-fasteoi   DLL075B:01
>>>
>>> The D state increases the load average.
>>>
>>> Is that the expected behavior?
>>
>> No this is not. Touchpad appears to be firing interrupt line 51 
>> continuously and then drivers/hid/i2c-hid/i2c-hid-core.c: 
>> i2c_hid_irq() is trying to read input from touchpad over I2C bus.
>>
>> Not sure is this HW failure or system FW error (there are bad ACPI 
>> tables out there misconfiguring things etc).
> 
> It normally works, and I have no idea, if this even contributed to the 
> laggy system. Right now, the interrupts do not increase when *not* using 
> the touchpad or touchscreen.
> 
Ah, so it triggers randomly? When it happens does the situation remain 
or does it recover back to normal somehow, e.g. after touching the 
touchpad, unloading and loading the i2c_hid[_acpi] module, 
suspend/resume cycle, etc?

> If it helps, the output of `acpidump` is attached to the (unrelated) 
> Linux Kernel Bugzilla issue *Linux warning `usb: port power management 
> may be unreliable` on Dell XPS 13 9360* [1].
> 
> Do you have a suggestion, what I can do next time, this happens?
> 
I'd try to see is it possible to recover back to normal or is reboot 
required. That might give ideas what might trigger the situation.

> Could Linux detect this situation and log something?
> 
Don't know. Perhaps difficult to differentiate from normal touchpad use.

