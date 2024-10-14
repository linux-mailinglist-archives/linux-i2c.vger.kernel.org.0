Return-Path: <linux-i2c+bounces-7367-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F06099D4EA
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2024 18:43:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 839C21C22F4D
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Oct 2024 16:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C551B85CD;
	Mon, 14 Oct 2024 16:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCICUq5q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF7818035;
	Mon, 14 Oct 2024 16:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728924193; cv=none; b=QGsEngYNwRxck0D0dgTdjYUB3PVALWs0jxo7NzpnNuZOeObatr+HG9ZJzHH86ffmel7u0bTUDoYV+jquYYALGMhXBnA2C3iEPOYuS1H3EAzDRtwy54RLKsnD+9oOp0oeuAoM6Aki1SigIrmAij8SxZA3R4OVWzDK+mEsYZyDryY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728924193; c=relaxed/simple;
	bh=lzQbvWGgjM2p3dl/tt6pzJHScH7SGAk9vndRgDcQn6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rj3w7ydj9ITLxDu/mD2qPZsDMkDrkaEMV8Q41dA1kjktLFGfl83MMANbeZlwQkAdglr9oeOti8wzwJGFrJK4URSn6epkTBjJyeuWpU+/QRzxdpQWS0lMsUrjPSDkZvNoiWTIMeNajG/C+gcPAMFEh8Ij8gJ1Fog0F2mQth/A/uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCICUq5q; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5c9150f9ed4so5770623a12.0;
        Mon, 14 Oct 2024 09:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728924189; x=1729528989; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mwJOsocKURrfl74kR7C7fHNXyzDnLnRAL5OlgpqEpgY=;
        b=hCICUq5qI9hVSUH6NYcqlVdnO2R11SJrSJbUAXDxUTN80Dr9R4C1m2cAZpt/qd31o2
         aremWWln1s79N2RiU8xXqMX04Tn9YID0zQLWIOGXotdE7erhaq6AL1YdBqEdAt88C3iy
         rkfn3lce4fQDHEYzZmCucbsaGp9PWvYXWoYUVDHMY9v+s8dxz2gcIEIlgV+dWLdIlviX
         MSer8tpJun/hFSGXw65fGB9xcUZm8dxAjqbwlsKzYPdCbgXioDl4dIvdDycVl40AIY/s
         BYehRMkw4rIqi9w0vu6+LLsOPv9iJCxLZTOI/z8gSJV0trsl6QuZQUJrOJLrCwlPNXqV
         IVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728924189; x=1729528989;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mwJOsocKURrfl74kR7C7fHNXyzDnLnRAL5OlgpqEpgY=;
        b=OC9wsTsovQX3TpWvaZovy58gJcQ8GI+fpMAHB4N0d+Ndp9HQNs+TIANRQa8Oyzp/pT
         h30pUSTAngM/enXK7beGT0xoV2GIa0UilQsU+32jz8aDydPn5b5hO43vgOZBn74/pSdg
         Jf6FiaUYjRaFS2tQP8ObOhrQI9hIScvCUSeATbfEogkI7MGOns9DAwZyEGXixpblnw+O
         7bna7JTYgTr48/rN5dEB6kEERNfsN5LtXEw86Uv/7/yqe5fBJ+hEVzt52EUsR37it78H
         2YEI1Y1hx/8CKqsa5DAr3vI6L3jWAIRCf74sk+vWVmPz9HEoG4cZDEGkyFbHtqWR8u7U
         GVow==
X-Forwarded-Encrypted: i=1; AJvYcCVbnKG7xS4HZ9lTaW4a0nsowVXvphJ5h7h+ZF8EvPPAiJRJHYBE2PsF8W/bPfLw3HLzDUfS9hxhBMzMK90=@vger.kernel.org, AJvYcCW7UycA11WgutkeoEwr5sVma6kUtMbYzTv4ADGDvLjv7YjbsAroZOlbo7LV6G3eEky3imXgX/UHCDk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVP5RZaiai56alDg8MSvfQP6fhS527iBlGsXmYa7NvaPHd3rk+
	zUhc7Z9D4LPH+j8ySqXJhJLrwmAkMOsPaNjBTYMM6l2jdMHSEUeSxNlBbTk8MKM=
X-Google-Smtp-Source: AGHT+IH1hXT8V/yB3ufznAAidLIqghNsu9betPcemoiQFBoBP1fFlzIBaRukssRnhQiqZj62RZnO5A==
X-Received: by 2002:a05:6402:27c8:b0:5c9:547d:99 with SMTP id 4fb4d7f45d1cf-5c9547d1521mr9534173a12.2.1728924189053;
        Mon, 14 Oct 2024 09:43:09 -0700 (PDT)
Received: from [192.168.1.2] (178-253-133-191.3pp.slovanet.sk. [178.253.133.191])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c93711a189sm5157948a12.24.2024.10.14.09.43.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Oct 2024 09:43:07 -0700 (PDT)
Message-ID: <2130afb8-8bf7-49da-b349-e99194042865@gmail.com>
Date: Mon, 14 Oct 2024 18:43:04 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Wrong piix4_smbus address / slow trackpoint on Thinkpad P14s gen
 2 (AMD)
Content-Language: en-US
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Mario Limonciello <mario.limonciello@amd.com>, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org
Cc: Andrew Duggan <aduggan@synaptics.com>,
 Benjamin Tissoires <btissoir@redhat.com>, Wolfram Sang <wsa@kernel.org>,
 Andrea Ippolito <andrea.ippo@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
References: <CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com>
 <5105b392-dee9-85fb-eeba-75c7c951d295@gmail.com>
 <3409c03e-35fb-428a-9784-0069b63a83bb@amd.com>
 <a77c83fb-45f2-4f77-846c-df441bc15436@gmail.com>
 <788ae95e-12d4-441e-a417-d04049cb8e2e@redhat.com>
 <e345c93e-224d-425e-9ebf-efe02d6b6718@amd.com>
From: =?UTF-8?Q?Miroslav_Bend=C3=ADk?= <miroslav.bendik@gmail.com>
In-Reply-To: <e345c93e-224d-425e-9ebf-efe02d6b6718@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14. 10. 2024 18:01, Shyam Sundar S K wrote:
>
> On 10/13/2024 23:23, Hans de Goede wrote:
>> Hi,
>>
>> On 13-Oct-24 7:20 PM, Miroslav Bendík wrote:
>>> On 10. 10. 2024 18:25, Mario Limonciello wrote:
>>>> On 2/12/2022 11:42, Miroslav Bendík wrote:
>>>>> Hello,
>>>>> i think, that SMBus works now pretty good and last problem is screaming interrupt from synaptics (1000 irq/s). I need little help to solve this problem.
>>>>>
>>>>> Little summary first:
>>>>>
>>>>> On this thinkpad is synaptics trackpoint/touchpad connected to PIIX4. To enable RMI4 mode, SMBus driver should support host notify protocol. I have added support of host notify and replaced active waiting transaction with completer + interrupt. Driver is now pretty stable and works way better, than old implementation. For example i2c-detect shows real devices (previous transaction code showed all addresses from 0x1c as active). Patch on following link is still hack, has hardcoded IRQ and supports host notifications and interrupts only on auxiliary port. I can implement other ports later.
>>>>>
>>>>> Patch: https://lore.kernel.org/all/c9b0b147-2907- ff41-4f13-464b3b891c50@wisdomtech.sk/
>>>>> This patch includes PM register access using MMIO: https:// lore.kernel.org/all/20210715221828.244536-1-Terry.Bowman@amd.com/
>>>>>
>>>>> Now i can load psmouse synaptics_intertouch=1 and everything works great, but it uses 5% CPU and interrupt is called 1000/s. I have changed interrupt from rising edge to active low (it's PCIE, PCIE has active low) and i have many times checked if all interrupt bits are cleared in interrupt request. Yes, they are always cleared. Interrupts are generated only after first touch if i have compiled only F12. If i compile F03, then interrupts are generated immediately after load of psmouse. After unload, interrupts are not generated (i2c-piix4 still loaded).
>>>>>
>>>>> On this machine I2C is accessible using GPIO 19(SCL), 20(SDA). Using kernel thread with RT priority on isolated core i have tried to record pin values on GPIO pins. Latency is too high to record all transferred data. Some state changes are lost (approximately 1/50 bits). Not too low to read reliably all data, but good enough to see what happens at bus level. Here is recorded file: https://mireq.linuxos.sk/kernel/ thinkpad_p14s/i2c_scl_sda.xz.
>>>>>
>>>>> Every byte is sample, first bit is SCL, second SDA. Sample rate is cca 500 000 Hz, but often drops under 100 000 (lost bit).
>>>>>
>>>>> On this screenshot is typical activity on bus: https://mireq.linuxos.sk/ kernel/thinkpad_p14s/i2c_1.png (pulseview with imported raw file)
>>>>>
>>>>> Zoom to two packet is here: https://mireq.linuxos.sk/kernel/ thinkpad_p14s/i2c_2.png
>>>>>
>>>>> First packet is SMBus host notify. Address 0x08 is SMBus host address and 0x58 is address of synaptics (0x2c << 1). Second packet is reading of interrupt status registers. Data 02 is length of interrupt status register (9 bits) and last 2 bytes are zero (idle, when moving cursor, then interrupt status register contains one bit set).
>>>>>
>>>>> Zoomed out: https://mireq.linuxos.sk/kernel/thinkpad_p14s/i2c_3.png
>>>>>
>>>>> Before transaction SMBus slave state machine is disabled and after transaction enabled. If notification is received when state machine is disabled, then device writes only address and don't get response. If driver runs with always enabled slave state machine, then output will contain only notify + read interrupt status pairs and no separate addresses, but with this mode bus collisions occur more often.
>>>>>
>>>>> Here is dmesg output: https://pastebin.com/RdDYHJn0
>>>>>
>>>>> Cursor is moved until 2862.8, then i have not touched trackpoint.
>>>>>
>>>>> Idle device don't produce bus collisions. Moving cursor produces collisions, but sample rate is stable 100Hz, which is way better, than <40 Hz with PS/2 mode. I don't know how to solve collisions. Maybe they are related to not silenced host notifications.
>>>>>
>>>>> If i were to be optimistic, then i would say that clearing interrupt vector will solve all problems. According old RMI4 documentation, reading from interrupt status register should clear interrupts (status register is cleared), but this don't prevent device form sending host notifications. Maybe exists new way to disable interrupts. I don't know, i have no access to current documentation.
>>>>>
>>>>> My device has this signature:
>>>>> Synaptics, product: TM3471-030, fw id: 3418235
>>>>>
>>>>> Any help welcome.
>>>>>
>>>> Sorry to bump such an old thread, but AFAIK you never came up with a good solution here.  I did want to point out that there was a very recent submission by Shyam (CC'ed) [1] that adds an ASF driver (which is an extension to PIIX4).  By default it's going to bind to an ACPI ID that isn't present on your system (present on newer systems only) but the hardware for ASF /should/ be present even on yours.
>>>>
>>>> So I was going to suggest if you still are interested in this to play with that series and come up with a way to force using ASF (perhaps by a DMI match for your system) and see how that goes.
>>>>
>>>> [1] https://lore.kernel.org/all/20240923080401.2167310-1-Shyam-sundar.S-k@amd.com/
>>> Hello.
>>>
>>> Thanks for the update. It looks good as a separate driver. I had intended to split this driver, replace polling with interrupts, and convert all I/O calls to MMIO, similar to how a Windows driver operates. I paused the work because I needed documentation and fixes from other companies, and I resolved my issue using a different approach:
>>>
>>> - I have not received a response from Synaptics.
>>> - I have not received a response from Lenovo.
>>> - I have fixed the original issue - https://patchwork.kernel.org/project/linux-input/patch/71d9dc66-9576-c26f-c9d9-129217f50255@gmail.com/#24848525
>>> - Too many subsystems are affected, some of which are currently hardly fixable.
>>>
>>> The biggest issue is interrupt support, which cannot be resolved with quirks alone.
> Do you mean the interrupt support from SMBus controller which happens
> via the piix4 driver?
>
> Note that SMBus controller do not support interrupt and the same has
> been documented in the datasheet:
>
> D14F0x03C [Interrupt Line] (FCH::SMBUSPCI::IntLine)
>
> 15:8 InterruptPin: Interrupt Pin. Read. Reset: Fixed,00h.
>
> ValidValues:
>
>
> Value 			Description
> -------------		-------------
> 00h 			This module does not generate interrupts.
> FFh-01h			Interrupt pin.
>
> Thanks,
> Shyam

Hello,

i am using ASF documentation (48751 Rev 3.03 - February 19, 2015 BKDG 
for AMD Family 16h Models 00h-0Fh Processors - 
https://www.amd.com/en/search/documentation/hub.html#q=BKDG%2048751).

There is a ASFx0A ASFStatus with SlaveIntr bit. Pointing device on my 
machine triggers interrupt 7 and it can be cleared using ASF when i move 
cursor using touchpad or trackpoint. It's possible to implement and 
enable I2C_CLIENT_HOST_NOTIFY flag on this hardware.

Another interrupt bit Intr from ASFx00 HostStatus is 1 after transfer 
(interrupt 7 is triggered). Transfer can be implemented without timers 
and active waiting on HostBusy status (there is a loop in 
piix4_transaction).

With regards
Miroslav Bendík

>
>>> My device has this DSDT ACPI entry:
>>>
>>>   Name (_HID, "SMB0001")  // _HID: Hardware ID
>>>   Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
>>>   {
>>>       IO (Decode16,
>>>           0x0B20,             // Range Minimum
>>>           0x0B20,             // Range Maximum
>>>           0x20,               // Alignment
>>>           0x20,               // Length
>>>           )
>>>       IRQ (Level, ActiveLow, Shared, )
>>>           {7}
>>>   })
>>>
>>> This entry defines the IRQ number, trigger, and polarity. However, the kernel ignores this entry and only uses the "Interrupt Source Override" from the MADT table.
>> Note that we already have a quirk table for this because this hits more
>> interrupts in the legacy ISA interrupt range, see:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/acpi/resource.c#n659
>>
>> note that the MADT table is already alway skipped on AMD systems,
>> but currently only for IRQs 1/12 which are the PS/2 kbd + mouse
>> IRQs.
>>
>> Regards,
>>
>> Hans
>>
>>

