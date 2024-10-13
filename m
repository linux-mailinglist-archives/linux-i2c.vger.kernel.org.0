Return-Path: <linux-i2c+bounces-7351-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8DE99BAAA
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Oct 2024 19:53:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F2B31C20B38
	for <lists+linux-i2c@lfdr.de>; Sun, 13 Oct 2024 17:53:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D1B148316;
	Sun, 13 Oct 2024 17:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JPKQQDNU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B89F12CDBA
	for <linux-i2c@vger.kernel.org>; Sun, 13 Oct 2024 17:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728842016; cv=none; b=KQno7i1uqqcOGkqJw6AQtSSVdZGFPmOxZ/mII7ivGAGJ2Bglf8L2HWSLPUSyd9x2MPLwz6i+D6LId++xW2sLn0C8SYlEeWCa2Ve5zb6VCQ9Cyr+O3qN7ZaBhRBeX7SIJg1NpeRUEp2exjtAz1IfaUaSq+2QgTW+K68DfV9/qft0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728842016; c=relaxed/simple;
	bh=OFZfDS8DhWUIhDsgLsmI6MdwsESTURUhv7/78NQssEc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o6Su2AnUuoY6B6kPL16QKvo1Bc8PtGMibx3dAA9VO0bqJCqS9SbHd7pKbhQRZf4uuVWVbW4+DdUEi5rz7dU+7toVRfINtPmVqGk8M+aXnJgd52gzxeFL9eLJa90GmUWx8l1a53E6J0cISDTLn52CN77Cillf2qdK6vZOwL/CgzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JPKQQDNU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728842013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WnJfvH4FRjozhs9VUCIDauKVH+BUjFyzhg7/DN/Qvyg=;
	b=JPKQQDNUS1TTsfmOKS8UNyuovLAqb9L/Dg/NQeeROftSVdmLYmE7jYgt2ZhhDdgvXBrD/4
	WU0DlPTLNLMnLXL2j0I9O+e9wB7DwboW/7mh79rm1fXTAQDZHNnWgRqUEBrNPFrDpBg4vI
	HL9namhSJ7u/2x+k6/wij53G0O1YhLU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-dLGdppZyPimPfv0hdNKaZg-1; Sun, 13 Oct 2024 13:53:31 -0400
X-MC-Unique: dLGdppZyPimPfv0hdNKaZg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a99efe7369dso100401866b.0
        for <linux-i2c@vger.kernel.org>; Sun, 13 Oct 2024 10:53:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728842010; x=1729446810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WnJfvH4FRjozhs9VUCIDauKVH+BUjFyzhg7/DN/Qvyg=;
        b=JdB4YrsgZaAYFJJSchUvsEirIfqgs4Hv7gBjU1ih7pXveTWISQp0w3ZTcV1cWiygNT
         EMMluJDaZHWVyuvprRvrPecscGy+2+LdV1oTiNsczjT4n5OYZ+QUmAvaq2xJBHXGibQE
         rwZZFMNjfNXPPVKF64Gw2a7Ln9Uaijad0q5s4WtzUIGxQh1DLTZq31poBIyaYh2W8teB
         yWkwOpoy179LSIOWkzKNw7STnZoW35NQr45nYRRcqIvle1b+uUVCcEAaIwwy7d4Z+hmP
         ThDTTCYSvuiCRWThSCi3O2XS40JvtwDyG5DxlDYUhIaFmIgWuVdggSrKBqHEGhUkjQJR
         eDnQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUEpgo6M32qc/xJiE8V0cTArTEeFyrz4bMLmBkVHTbsS/yt7zYb2iBSzDULIExUW/7m3UyhrF/UE4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr4M62M1RY/ib3Ym5tNLuGozMGWOI/bYAvOfTcQL7j3lIkign8
	MujBXNomSQ7/efLJegN3V+O4F+Qhl9PfFifeU2PnaGydA2ZXCja4S7d40iUfuzMDuHWa6TpEfLo
	AOJ4hHDckY04azVJ7hpIjr/CqE1A7d02VDauM6oEsQb2iiszIuh0uWrH59A==
X-Received: by 2002:a17:906:d552:b0:a99:ff33:9ba5 with SMTP id a640c23a62f3a-a99ff33a3ebmr222088566b.24.1728842010333;
        Sun, 13 Oct 2024 10:53:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEME7Ta3rlNHJr5ig58o4DA10xktOMQoZXs78zPWF1dMITrW+DA3qoo41jO3h7dFMFuitsKtQ==
X-Received: by 2002:a17:906:d552:b0:a99:ff33:9ba5 with SMTP id a640c23a62f3a-a99ff33a3ebmr222087666b.24.1728842009781;
        Sun, 13 Oct 2024 10:53:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99a7ec549csm472398566b.27.2024.10.13.10.53.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Oct 2024 10:53:29 -0700 (PDT)
Message-ID: <788ae95e-12d4-441e-a417-d04049cb8e2e@redhat.com>
Date: Sun, 13 Oct 2024 19:53:28 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Wrong piix4_smbus address / slow trackpoint on Thinkpad P14s gen
 2 (AMD)
To: =?UTF-8?Q?Miroslav_Bend=C3=ADk?= <miroslav.bendik@gmail.com>,
 Mario Limonciello <mario.limonciello@amd.com>, linux-i2c@vger.kernel.org,
 linux-input@vger.kernel.org
Cc: Andrew Duggan <aduggan@synaptics.com>,
 Benjamin Tissoires <btissoir@redhat.com>, Wolfram Sang <wsa@kernel.org>,
 Andrea Ippolito <andrea.ippo@gmail.com>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
References: <CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com>
 <5105b392-dee9-85fb-eeba-75c7c951d295@gmail.com>
 <3409c03e-35fb-428a-9784-0069b63a83bb@amd.com>
 <a77c83fb-45f2-4f77-846c-df441bc15436@gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a77c83fb-45f2-4f77-846c-df441bc15436@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 13-Oct-24 7:20 PM, Miroslav Bendík wrote:
> On 10. 10. 2024 18:25, Mario Limonciello wrote:
>> On 2/12/2022 11:42, Miroslav Bendík wrote:
>>> Hello,
>>> i think, that SMBus works now pretty good and last problem is screaming interrupt from synaptics (1000 irq/s). I need little help to solve this problem.
>>>
>>> Little summary first:
>>>
>>> On this thinkpad is synaptics trackpoint/touchpad connected to PIIX4. To enable RMI4 mode, SMBus driver should support host notify protocol. I have added support of host notify and replaced active waiting transaction with completer + interrupt. Driver is now pretty stable and works way better, than old implementation. For example i2c-detect shows real devices (previous transaction code showed all addresses from 0x1c as active). Patch on following link is still hack, has hardcoded IRQ and supports host notifications and interrupts only on auxiliary port. I can implement other ports later.
>>>
>>> Patch: https://lore.kernel.org/all/c9b0b147-2907- ff41-4f13-464b3b891c50@wisdomtech.sk/
>>> This patch includes PM register access using MMIO: https:// lore.kernel.org/all/20210715221828.244536-1-Terry.Bowman@amd.com/
>>>
>>> Now i can load psmouse synaptics_intertouch=1 and everything works great, but it uses 5% CPU and interrupt is called 1000/s. I have changed interrupt from rising edge to active low (it's PCIE, PCIE has active low) and i have many times checked if all interrupt bits are cleared in interrupt request. Yes, they are always cleared. Interrupts are generated only after first touch if i have compiled only F12. If i compile F03, then interrupts are generated immediately after load of psmouse. After unload, interrupts are not generated (i2c-piix4 still loaded).
>>>
>>> On this machine I2C is accessible using GPIO 19(SCL), 20(SDA). Using kernel thread with RT priority on isolated core i have tried to record pin values on GPIO pins. Latency is too high to record all transferred data. Some state changes are lost (approximately 1/50 bits). Not too low to read reliably all data, but good enough to see what happens at bus level. Here is recorded file: https://mireq.linuxos.sk/kernel/ thinkpad_p14s/i2c_scl_sda.xz.
>>>
>>> Every byte is sample, first bit is SCL, second SDA. Sample rate is cca 500 000 Hz, but often drops under 100 000 (lost bit).
>>>
>>> On this screenshot is typical activity on bus: https://mireq.linuxos.sk/ kernel/thinkpad_p14s/i2c_1.png (pulseview with imported raw file)
>>>
>>> Zoom to two packet is here: https://mireq.linuxos.sk/kernel/ thinkpad_p14s/i2c_2.png
>>>
>>> First packet is SMBus host notify. Address 0x08 is SMBus host address and 0x58 is address of synaptics (0x2c << 1). Second packet is reading of interrupt status registers. Data 02 is length of interrupt status register (9 bits) and last 2 bytes are zero (idle, when moving cursor, then interrupt status register contains one bit set).
>>>
>>> Zoomed out: https://mireq.linuxos.sk/kernel/thinkpad_p14s/i2c_3.png
>>>
>>> Before transaction SMBus slave state machine is disabled and after transaction enabled. If notification is received when state machine is disabled, then device writes only address and don't get response. If driver runs with always enabled slave state machine, then output will contain only notify + read interrupt status pairs and no separate addresses, but with this mode bus collisions occur more often.
>>>
>>> Here is dmesg output: https://pastebin.com/RdDYHJn0
>>>
>>> Cursor is moved until 2862.8, then i have not touched trackpoint.
>>>
>>> Idle device don't produce bus collisions. Moving cursor produces collisions, but sample rate is stable 100Hz, which is way better, than <40 Hz with PS/2 mode. I don't know how to solve collisions. Maybe they are related to not silenced host notifications.
>>>
>>> If i were to be optimistic, then i would say that clearing interrupt vector will solve all problems. According old RMI4 documentation, reading from interrupt status register should clear interrupts (status register is cleared), but this don't prevent device form sending host notifications. Maybe exists new way to disable interrupts. I don't know, i have no access to current documentation.
>>>
>>> My device has this signature:
>>> Synaptics, product: TM3471-030, fw id: 3418235
>>>
>>> Any help welcome.
>>>
>>
>> Sorry to bump such an old thread, but AFAIK you never came up with a good solution here.  I did want to point out that there was a very recent submission by Shyam (CC'ed) [1] that adds an ASF driver (which is an extension to PIIX4).  By default it's going to bind to an ACPI ID that isn't present on your system (present on newer systems only) but the hardware for ASF /should/ be present even on yours.
>>
>> So I was going to suggest if you still are interested in this to play with that series and come up with a way to force using ASF (perhaps by a DMI match for your system) and see how that goes.
>>
>> [1] https://lore.kernel.org/all/20240923080401.2167310-1-Shyam-sundar.S-k@amd.com/
> Hello.
> 
> Thanks for the update. It looks good as a separate driver. I had intended to split this driver, replace polling with interrupts, and convert all I/O calls to MMIO, similar to how a Windows driver operates. I paused the work because I needed documentation and fixes from other companies, and I resolved my issue using a different approach:
> 
> - I have not received a response from Synaptics.
> - I have not received a response from Lenovo.
> - I have fixed the original issue - https://patchwork.kernel.org/project/linux-input/patch/71d9dc66-9576-c26f-c9d9-129217f50255@gmail.com/#24848525
> - Too many subsystems are affected, some of which are currently hardly fixable.
> 
> The biggest issue is interrupt support, which cannot be resolved with quirks alone.
> 
> My device has this DSDT ACPI entry:
> 
>  Name (_HID, "SMB0001")  // _HID: Hardware ID
>  Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
>  {
>      IO (Decode16,
>          0x0B20,             // Range Minimum
>          0x0B20,             // Range Maximum
>          0x20,               // Alignment
>          0x20,               // Length
>          )
>      IRQ (Level, ActiveLow, Shared, )
>          {7}
>  })
> 
> This entry defines the IRQ number, trigger, and polarity. However, the kernel ignores this entry and only uses the "Interrupt Source Override" from the MADT table.

Note that we already have a quirk table for this because this hits more
interrupts in the legacy ISA interrupt range, see:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/acpi/resource.c#n659

note that the MADT table is already alway skipped on AMD systems,
but currently only for IRQs 1/12 which are the PS/2 kbd + mouse
IRQs.

Regards,

Hans



