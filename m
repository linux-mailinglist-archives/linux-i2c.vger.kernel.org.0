Return-Path: <linux-i2c+bounces-7350-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 840FB99BA86
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Oct 2024 19:20:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 064911F21B8C
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Oct 2024 17:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2288148314;
	Sun, 13 Oct 2024 17:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A93vlnrN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C85E231CB3;
	Sun, 13 Oct 2024 17:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728840051; cv=none; b=qBvW2anROP32wLwT2ZzgeNEnZ3NhnGRfoo9XDxlzP9DB0KDegvx5dIqHFo7vn2c5LQCF8GvBNioMR5GNC1nN4KKyuyX1fJVfkGDBpD1JYnymjR/nn26mppOy/h7WCVqVO2j70f7aQ9l3hE91rc2/4CndwCap5Cmr5B7tL07gcAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728840051; c=relaxed/simple;
	bh=ZIZ4aND6cBtGo4/l8TxZJoixLK3o881cXZMn/RfuJUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GVds7gdP2pMZiM16hfnVxtjyAr9pRU6JJSHaFsKNn689n3OULZ8A1+25811QVwR2CSbymuq23ur0W2BA3nEy3po7Qi6bwCsX9e4YG2Mw19jH4QilE7hbUMGwv7VQ/+uJf1rC4ITvmmu6/3MgguhGJX4CPhAs/y3g+I4zIBgCK7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A93vlnrN; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9a0cee600aso35174766b.1;
        Sun, 13 Oct 2024 10:20:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728840048; x=1729444848; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WDaOtjiSsbPwbmN8KeJN7YjVfXE3sYgZWBCbE/cppTc=;
        b=A93vlnrNrcSbDp53adYBc5FSzRBimhUM6dvPPgNxwEYdm6zM/rbwnya2Nng6PORM2P
         qyhMDk86fpSNmFxyFN4MFO0PgwjM3TM6S9ttZrD/QFOXJ43X1cauPNvNGRkLuFbr2tdR
         ylSciypUlbGH4IWoIIhTWuACrvne7RY+6YZo77bL8VGYFoWDSoBzd+MJ+ddUF2qYP4ON
         TaD78+zNw9C6xxuXoEB3rc1bIS5I0e8rrDo29IAagfRzgX6n/M8P05QXrdLMsaHQk6a3
         quuQcfxMovtoFRZuVISp8RCdpxrPJ+Pa7GLyqoEhNxyC4/gh8p/W2mEaQrO6577ltIhk
         P1HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728840048; x=1729444848;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WDaOtjiSsbPwbmN8KeJN7YjVfXE3sYgZWBCbE/cppTc=;
        b=WCudBKi0TcMMBgDvBJb6W1+YQ17rC9FsTlMN/anDuUzAism8wLvta1mJBu1D/TvZ8q
         PxEqZuKSt7224UVct+4xUJcCKuWlNcwue2EIWGziKJd95LK00aw66CDnk6eLNlBOAFGl
         mReI1GbrYMKFbA+IxLWnl0++nHDo4ohVHwvqTiDOPZr3CkW9Pr8j5Qy6FUwi/APDILml
         SUT16S/5Kdx/MYAtrkQfkyiuDcj1JhQixL584ey3jy7WXSPjwOCkaoUmEknHGROWXmjd
         Aw7TxZ36Tbu1Ut/gPJISsKMXP2y/3qTb3Vciv15IiR981Ej9o7iKeVt2yUSlCJUBaL8O
         aIlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOl3Urc2vE1jVz3E3sB430i1L/hbwI/1ITP5uegMufrN+6c86cLIvXc7NIxr6w1uUL3Go3ro1HX+g=@vger.kernel.org, AJvYcCX7I+vTeBD2jjktOeiSuP18voUXPIrmKBgKRMw6+9P4NzsuextpaeZ5vF2BWugcCwYzFtazjddeL94Z5Lg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi5ZuYjadWj/ZNpMinm081Uvv0vQPLcRyl29l8kvwDfVBNgF1O
	56M/IRr7gkwb4KKVp99ZfaE65gY3PgoaJmIsAEMimWN3W3NpkgPZ
X-Google-Smtp-Source: AGHT+IH+HzjLuvx9xr8WrWf/wgbO1LwMCb2jLjSRSbkDqGsnhCc8/DHSDs01AwguvuTIW0EcjPXvug==
X-Received: by 2002:a17:907:720b:b0:a99:ea2c:59d1 with SMTP id a640c23a62f3a-a99ea2c5ca8mr456724666b.26.1728840047359;
        Sun, 13 Oct 2024 10:20:47 -0700 (PDT)
Received: from [192.168.1.2] (178-253-131-3.3pp.slovanet.sk. [178.253.131.3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a0ced171asm52940566b.47.2024.10.13.10.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Oct 2024 10:20:46 -0700 (PDT)
Message-ID: <a77c83fb-45f2-4f77-846c-df441bc15436@gmail.com>
Date: Sun, 13 Oct 2024 19:20:44 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Wrong piix4_smbus address / slow trackpoint on Thinkpad P14s gen
 2 (AMD)
To: Mario Limonciello <mario.limonciello@amd.com>, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org
Cc: Andrew Duggan <aduggan@synaptics.com>,
 Benjamin Tissoires <btissoir@redhat.com>, Hans de Goede
 <hdegoede@redhat.com>, Wolfram Sang <wsa@kernel.org>,
 Andrea Ippolito <andrea.ippo@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
References: <CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com>
 <5105b392-dee9-85fb-eeba-75c7c951d295@gmail.com>
 <3409c03e-35fb-428a-9784-0069b63a83bb@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Miroslav_Bend=C3=ADk?= <miroslav.bendik@gmail.com>
In-Reply-To: <3409c03e-35fb-428a-9784-0069b63a83bb@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10. 10. 2024 18:25, Mario Limonciello wrote:
> On 2/12/2022 11:42, Miroslav Bendík wrote:
>> Hello,
>> i think, that SMBus works now pretty good and last problem is 
>> screaming interrupt from synaptics (1000 irq/s). I need little help 
>> to solve this problem.
>>
>> Little summary first:
>>
>> On this thinkpad is synaptics trackpoint/touchpad connected to PIIX4. 
>> To enable RMI4 mode, SMBus driver should support host notify 
>> protocol. I have added support of host notify and replaced active 
>> waiting transaction with completer + interrupt. Driver is now pretty 
>> stable and works way better, than old implementation. For example 
>> i2c-detect shows real devices (previous transaction code showed all 
>> addresses from 0x1c as active). Patch on following link is still 
>> hack, has hardcoded IRQ and supports host notifications and 
>> interrupts only on auxiliary port. I can implement other ports later.
>>
>> Patch: https://lore.kernel.org/all/c9b0b147-2907- 
>> ff41-4f13-464b3b891c50@wisdomtech.sk/
>> This patch includes PM register access using MMIO: https:// 
>> lore.kernel.org/all/20210715221828.244536-1-Terry.Bowman@amd.com/
>>
>> Now i can load psmouse synaptics_intertouch=1 and everything works 
>> great, but it uses 5% CPU and interrupt is called 1000/s. I have 
>> changed interrupt from rising edge to active low (it's PCIE, PCIE has 
>> active low) and i have many times checked if all interrupt bits are 
>> cleared in interrupt request. Yes, they are always cleared. 
>> Interrupts are generated only after first touch if i have compiled 
>> only F12. If i compile F03, then interrupts are generated immediately 
>> after load of psmouse. After unload, interrupts are not generated 
>> (i2c-piix4 still loaded).
>>
>> On this machine I2C is accessible using GPIO 19(SCL), 20(SDA). Using 
>> kernel thread with RT priority on isolated core i have tried to 
>> record pin values on GPIO pins. Latency is too high to record all 
>> transferred data. Some state changes are lost (approximately 1/50 
>> bits). Not too low to read reliably all data, but good enough to see 
>> what happens at bus level. Here is recorded file: 
>> https://mireq.linuxos.sk/kernel/ thinkpad_p14s/i2c_scl_sda.xz.
>>
>> Every byte is sample, first bit is SCL, second SDA. Sample rate is 
>> cca 500 000 Hz, but often drops under 100 000 (lost bit).
>>
>> On this screenshot is typical activity on bus: 
>> https://mireq.linuxos.sk/ kernel/thinkpad_p14s/i2c_1.png (pulseview 
>> with imported raw file)
>>
>> Zoom to two packet is here: https://mireq.linuxos.sk/kernel/ 
>> thinkpad_p14s/i2c_2.png
>>
>> First packet is SMBus host notify. Address 0x08 is SMBus host address 
>> and 0x58 is address of synaptics (0x2c << 1). Second packet is 
>> reading of interrupt status registers. Data 02 is length of interrupt 
>> status register (9 bits) and last 2 bytes are zero (idle, when moving 
>> cursor, then interrupt status register contains one bit set).
>>
>> Zoomed out: https://mireq.linuxos.sk/kernel/thinkpad_p14s/i2c_3.png
>>
>> Before transaction SMBus slave state machine is disabled and after 
>> transaction enabled. If notification is received when state machine 
>> is disabled, then device writes only address and don't get response. 
>> If driver runs with always enabled slave state machine, then output 
>> will contain only notify + read interrupt status pairs and no 
>> separate addresses, but with this mode bus collisions occur more often.
>>
>> Here is dmesg output: https://pastebin.com/RdDYHJn0
>>
>> Cursor is moved until 2862.8, then i have not touched trackpoint.
>>
>> Idle device don't produce bus collisions. Moving cursor produces 
>> collisions, but sample rate is stable 100Hz, which is way better, 
>> than <40 Hz with PS/2 mode. I don't know how to solve collisions. 
>> Maybe they are related to not silenced host notifications.
>>
>> If i were to be optimistic, then i would say that clearing interrupt 
>> vector will solve all problems. According old RMI4 documentation, 
>> reading from interrupt status register should clear interrupts 
>> (status register is cleared), but this don't prevent device form 
>> sending host notifications. Maybe exists new way to disable 
>> interrupts. I don't know, i have no access to current documentation.
>>
>> My device has this signature:
>> Synaptics, product: TM3471-030, fw id: 3418235
>>
>> Any help welcome.
>>
>
> Sorry to bump such an old thread, but AFAIK you never came up with a 
> good solution here.  I did want to point out that there was a very 
> recent submission by Shyam (CC'ed) [1] that adds an ASF driver (which 
> is an extension to PIIX4).  By default it's going to bind to an ACPI 
> ID that isn't present on your system (present on newer systems only) 
> but the hardware for ASF /should/ be present even on yours.
>
> So I was going to suggest if you still are interested in this to play 
> with that series and come up with a way to force using ASF (perhaps by 
> a DMI match for your system) and see how that goes.
>
> [1] 
> https://lore.kernel.org/all/20240923080401.2167310-1-Shyam-sundar.S-k@amd.com/
Hello.

Thanks for the update. It looks good as a separate driver. I had 
intended to split this driver, replace polling with interrupts, and 
convert all I/O calls to MMIO, similar to how a Windows driver operates. 
I paused the work because I needed documentation and fixes from other 
companies, and I resolved my issue using a different approach:

- I have not received a response from Synaptics.
- I have not received a response from Lenovo.
- I have fixed the original issue - 
https://patchwork.kernel.org/project/linux-input/patch/71d9dc66-9576-c26f-c9d9-129217f50255@gmail.com/#24848525
- Too many subsystems are affected, some of which are currently hardly 
fixable.

The biggest issue is interrupt support, which cannot be resolved with 
quirks alone.

My device has this DSDT ACPI entry:

  Name (_HID, "SMB0001")  // _HID: Hardware ID
  Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
  {
      IO (Decode16,
          0x0B20,             // Range Minimum
          0x0B20,             // Range Maximum
          0x20,               // Alignment
          0x20,               // Length
          )
      IRQ (Level, ActiveLow, Shared, )
          {7}
  })

This entry defines the IRQ number, trigger, and polarity. However, the 
kernel ignores this entry and only uses the "Interrupt Source Override" 
from the MADT table. Here are some potential solutions:

- Scan ACPI for interrupts and include them in overrides
   - Scanning might break or fix many drivers. This is a significant 
change that could affect numerous buggy BIOS ACPI implementations.

- Change the interrupt trigger and polarity on the fly in the ASF driver
   - The interrupt trigger cannot be changed with irq_set_type because 
it lacks an ioapic_ir_chip.irq_set_type implementation

- Implement a new quirk or hook to modify interrupts
   - This would involve extending the quirk system to allow changes to 
polarity/trigger before APIC initialization.

- Add the missing MADT table
   - Lenovo ignores this requirement.

Fixing this bug might break trackpoint support on ThinkPads, as the 
Synaptics firmware does not behave as described in the documentation.

Given the high potential for system instability with minimal gain, my 
requested feature may not be worth pursuing.

I can maybe help with testing this new ASF driver on older hardware 
without specific ACPI ID.

