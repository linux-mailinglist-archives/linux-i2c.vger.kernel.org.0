Return-Path: <linux-i2c+bounces-2458-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF21881885
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 21:21:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F4B11C2208F
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 20:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041F985643;
	Wed, 20 Mar 2024 20:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q75f2Z2o"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DE529CE8
	for <linux-i2c@vger.kernel.org>; Wed, 20 Mar 2024 20:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710966099; cv=none; b=PscuuY3VDQcdMJ9zvE11S8G3BwUh3BbImEuFn0FvRed8yguz1/mD5xhkD7uwM0FC9I4SF9eglXMReWvyhCuoYvA16CL/fdSCSaX2wUZLwggYtLYUQ35Fy1BybHtjDNYuvZ81w0iK56jqnjqmrCGyuOYxionxs1Nsuk+aTC39kA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710966099; c=relaxed/simple;
	bh=a/LLGTBXF8BldDzwVlTNFtqQum8IoddNJPKNmZpZwTc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=od7wdjK9wVd4UPLGZ8XM6KeVYzEsNKNZUQrucolL8ASgkUpn4xFVouRV4rDYyqViw6h1USzdw10HTlUR5itzdzMmPudREImFQn3jTN+7MOr0UZcNfcJJbtnFj/tBCsOPA+muSX1F7V4eiAJgdqaQKbLRDP5T8ZSGtsfXccenNBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q75f2Z2o; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a46dec5d00cso32388766b.0
        for <linux-i2c@vger.kernel.org>; Wed, 20 Mar 2024 13:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710966095; x=1711570895; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h01aUG8GlL1cq5k7qUay1sCMvzYOvokcxtc7z9+klFk=;
        b=Q75f2Z2o9Ct4SF+RYqKFZ1N0t03F5gRZmAK9GAq8I5SNUg5GTbmrXn0Ou44V1C74Jk
         +b7J8dJ3jJReQME88rxtJE7z1th4xGVqzTZr3fcWIa5GeBpzzZn22tS8fqrHOGkGp38h
         4KDTOuy1lx7XMnMTPHV/j9SxbcFNmwm+yjZfsBOeIz3LuJGsDNGsW77pzsUaWh848YiA
         kd+z/lBHKh2g9h7k6gLsn/3qxy1iuElWas1NOSz4RrSmJ+YRwkcMfnBAggRc10wLV+nQ
         00QiMNLZLb4dLt3laFbIVmBxtc6tqUhQKVaGyeFyZpeIO2GukyKIcN1SAw2Cx6wEq+gu
         6kQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710966095; x=1711570895;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h01aUG8GlL1cq5k7qUay1sCMvzYOvokcxtc7z9+klFk=;
        b=o/VahMUE+BckgvZkqxXBqob3bnq8gg12c49dMkhQzQfExLkFKgzwMl93cNP2U70Tyd
         hKqN4i9zgmwhYjGDsKiS2vEMStGmN86gB7a+qfUU5TH4wuOecNBjCjbhp3bQWXkXaUUK
         N3HcIcnjULcsaTzS8HT/mnoRwvGggA8cDWXRIkkxVY2HejMnaRPrSCTJjaP0NJWmh13/
         ZELSoATKYSRVSgkmojw/PH1TiDsmzLgtqwMPwPl9/kEAPaHq+qOuaxovNYrrZZpeUgvW
         NNhKcvLMr5a4cRWN9tOsb7s+D5u7QgHei+/3t8NrPxgdpEWvYb0vY/ky4xnrWrB1vBc2
         0d8A==
X-Forwarded-Encrypted: i=1; AJvYcCVD4Kudc7Bog6d6T7toN4gy0xd1aO2m8mHyHZa0fvOaGC7toxQ8AnYf7a9gaKiRDxR/QYVWoWPVqu1DCXZAAEkvX0NySeraGU5g
X-Gm-Message-State: AOJu0YyxY3yJlB7wZQ73tXE/qzMKYWuCLLFLaVfOzqthMIYEn947nDs2
	UdC8nOvw7kudI+dWcBNaOil7SL1ooprDg3uT6AEpybzwCVDNwY2f
X-Google-Smtp-Source: AGHT+IGoT0yMUrpM8JzPpK/NZIOo0BfnrB+nY2oUrai2PFnbJNrjMM25phGd+8BVINmOEtmgY/D0lw==
X-Received: by 2002:a17:907:8e9a:b0:a46:5f6c:e04b with SMTP id tx26-20020a1709078e9a00b00a465f6ce04bmr15726511ejc.52.1710966095181;
        Wed, 20 Mar 2024 13:21:35 -0700 (PDT)
Received: from ?IPV6:2a01:c22:7ab5:f000:819a:3b4d:1a79:9330? (dynamic-2a01-0c22-7ab5-f000-819a-3b4d-1a79-9330.c22.pool.telefonica.de. [2a01:c22:7ab5:f000:819a:3b4d:1a79:9330])
        by smtp.googlemail.com with ESMTPSA id h21-20020a17090619d500b00a46447348e8sm7671717ejd.191.2024.03.20.13.21.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 13:21:34 -0700 (PDT)
Message-ID: <62500f74-8d73-40f3-80dd-36d3f70084f0@gmail.com>
Date: Wed, 20 Mar 2024 21:21:34 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: i2c: designware: unhandled interrupt on N100 lpss channel 0
Content-Language: en-US
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>
References: <e3f2debf-c762-48d9-876e-bcb60841f909@gmail.com>
 <af839910-2c3d-4559-b8b3-1c6f2372144e@gmail.com>
 <af547aab-e957-4dbf-922d-e2ad13e19877@linux.intel.com>
 <ZfrvhvuW3ZgzWYjt@smile.fi.intel.com>
 <700bbb84-90e1-4505-8ff0-3f17ea8bc631@gmail.com>
 <ZfsHyyrel-d1exxM@smile.fi.intel.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <ZfsHyyrel-d1exxM@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.03.2024 16:59, Andy Shevchenko wrote:
> On Wed, Mar 20, 2024 at 03:56:29PM +0100, Heiner Kallweit wrote:
>> On 20.03.2024 15:15, Andy Shevchenko wrote:
>>> On Wed, Mar 20, 2024 at 03:37:34PM +0200, Jarkko Nikula wrote:
>>>> On 3/20/24 2:27 PM, Heiner Kallweit wrote:
>>>>> On 19.03.2024 22:11, Heiner Kallweit wrote:
>>>>>> On a N100-based mini pc I see the following. I found older reports with the same symptom,
>>>>>> but root cause seems to be different.
>>>>>>
>>>>>> - Interrupt 27 is not shared in my case
>>>>>> - I checked register values on entering the ISR. Interrupt mask and DW_IC_RAW_INTR_STAT
>>>>>>    are both 0.
>>>>>> - After an interrupt storm of 100,000 interrupts the interrupt gets disabled
>>>>>> - The issue affects channel 0 only
>>>>>>
>>>>>> If not the I2C IP, then who else can touch the interrupt line?
>>>>>
>>>>> I noticed that after including INTEL_IDMA64 in my config the problem no longer occurs.
>>>>> So there seems to be a dependency. Should it be reflected in Kconfig, e.g.
>>>>> make MFD_INTEL_LPSS dependent on INTEL_IDMA64, or let it imply INTEL_IDMA64?
>>>>>
>>>> Hmm.. interesting. I'd say BIOS perhaps has left the IDMA active and is
>>>> generating interrupts until the idma64 driver acknowledges it.
>>>>
>>>> There should not be generic dependency since the i2c_designware is not using
>>>> the DMA and a quick test on one platform where idma64 and i2c_designware are
>>>> sharing the same interrupt without CONFIG_INTEL_IDMA64 not set didn't show
>>>> similar behavior.
>>>>
>>>> Andy: Do you have any additional ideas or debug hints to this?
>>>
>>> Can you share `cat /proc/interrupts` in non-working and working cases?
>>>
>>> Just to confirm: loading idma64 driver fixes the issue, correct?
>>>
>> I spoke too soon. Loading idma64 didn't actually fix the problem.
>> What happened:
>> Runtime PM kicked in and set the device to D3. Therefore reads to the idma64
>> status register returned 0xffffffff, resulting the idma64 ISR returning
>> IRQ_HANDLED.
> 
> Okay, bug in idma4 driver then :-) Good catch!
> 
>> IRQ number still was rapidly growing.
>>
>> After disabling RPM the problem is back.
>> Who else could pull the level-triggered interrupt high?
> 
> Need to understand a bit about RTE programming.
> You need to add 'apic=debug' to the kernel command line and look for IRQ 27
> related bits, and also makes sense to collect this

IOAPIC[0]: Preconfigured routing entry (2-27 -> IRQ 27 Level:1 ActiveLow:1)

For the sake of completeness I add below the output of dmesg | grep -i apic

> 
>   grep 0000001b /sys/kernel/debug/pinctrl/*/pins
> 

pin 3 (GPPC_B_3) 3:INTC1057:00 GPIO 0x80100102 0x0000001b 0x00000000 [LOCKED tx]
pin 82 (GPP_F_7_EMMC_CMD) 135:INTC1057:00 GPIO 0x44000300 0x0000001b 0x00000000 [LOCKED full, ACPI]
pin 182 (GPPC_C_13) 269:INTC1057:00 GPIO 0x44000300 0x0000001b 0x00000000 [LOCKED full, ACPI]

> it will show the GPIO pins related to RTE 27 (and we can check if direct IRQ is
> enabled there).
> 
>> [    4.642978] irq 27: nobody cared (try booting with the "irqpoll" option)
>> [    4.643067] CPU: 3 PID: 0 Comm: swapper/3 Not tainted 6.8.0-next-20240312+ #5
>> [    4.643133] Hardware name: Default string Default string/Default string, BIOS ADLN.M6.SODIMM.ZB.CY.015 08/08/2023
>> [    4.643215] Call Trace:
>> [    4.643241]  <IRQ>
>> [    4.643266]  dump_stack_lvl+0x81/0xe0
>> [    4.643319]  dump_stack+0x10/0x20
>> [    4.643358]  __report_bad_irq+0x2b/0xc0
>> [    4.643403]  note_interrupt+0x28f/0x2d0
>> [    4.643442]  ? __this_cpu_preempt_check+0x13/0x20
>> [    4.643496]  handle_irq_event+0x70/0x80
>> [    4.643541]  handle_fasteoi_irq+0x90/0x210
>> [    4.643586]  __common_interrupt+0x6f/0x140
>> [    4.643633]  common_interrupt+0xab/0xd0
>> [    4.643672]  </IRQ>
>> [    4.643694]  <TASK>
>> [    4.643720]  asm_common_interrupt+0x27/0x40
>> [    4.643761] RIP: 0010:cpuidle_enter_state+0xff/0x4f0
>> [    4.643815] Code: 8b 00 48 0f a3 05 d1 5f 9d 00 0f 82 fd 02 00 00 31 ff e8 f4 e0 69 ff 80 7d cf 00 0f 85 cc 02 00 00 e8 65 bd 77 ff fb 45 85 ff <0f> 88 f4 01 00 00 49 63 f7 4c 89 f2 48 8d 04 76 48 8d 04 86 49 8d
>> [    4.643957] RSP: 0018:ffffb21dc017fe58 EFLAGS: 00000202
>> [    4.644010] RAX: 000000000007987d RBX: ffffd21dbfdac690 RCX: 0000000000000000
>> [    4.644069] RDX: 0000000000000000 RSI: ffffffff8f724a02 RDI: ffffffff8f710113
>> [    4.644128] RBP: ffffb21dc017fe98 R08: 0000000000000001 R09: 0000000000000000
>> [    4.644186] R10: 0000000000000001 R11: ffff91cfb7bad824 R12: 0000000000000001
>> [    4.644244] R13: ffffffff8f9b69a0 R14: 0000000114be1938 R15: 0000000000000001
>> [    4.644315]  ? cpuidle_enter_state+0xfb/0x4f0
>> [    4.644367]  cpuidle_enter+0x29/0x40
>> [    4.644409]  call_cpuidle+0x1d/0x40
>> [    4.644450]  do_idle+0x1c2/0x220
>> [    4.644489]  cpu_startup_entry+0x24/0x30
>> [    4.644529]  start_secondary+0xf9/0x100
>> [    4.644571]  common_startup_64+0x13e/0x148
>> [    4.644626]  </TASK>
>> [    4.644649] handlers:
>> [    4.644674] [<000000008b061326>] idma64_irq [idma64]
>> [    4.644852] [<000000008273d6d5>] i2c_dw_isr [i2c_designware_core]
>> [    4.644920] Disabling IRQ #27
>>
>>
>>             CPU0       CPU1       CPU2       CPU3
>>    8:          0          0          0          0  IR-IO-APIC    8-edge      rtc0
>>    9:          0         44          0          0  IR-IO-APIC    9-fasteoi   acpi
>>   16:          0          3          0          0  IR-IO-APIC   16-fasteoi   i801_smbus, idma64.6
>>   27:          0          0          0     112018  IR-IO-APIC   27-fasteoi   idma64.0, i2c_designware.0
>>   29:          0          0          0          0  IR-IO-APIC   29-fasteoi   idma64.2, i2c_designware.2
>>   31:          0          0          0          0  IR-IO-APIC   31-fasteoi   idma64.4, i2c_designware.4
>>   32:          0          0          0          0  IR-IO-APIC   32-fasteoi   idma64.5, i2c_designware.5
>>   33:          0          0          0          0  IR-IO-APIC   33-fasteoi   idma64.3, i2c_designware.3
>>   37:          0          0          0          0  IR-IO-APIC   37-fasteoi   idma64.7
>>   40:          0          0          0          0  IR-IO-APIC   40-fasteoi   idma64.1, i2c_designware.1
>>
> 

[    0.000000] Command line: initrd=\intel-ucode.img initrd=\initramfs-linux.img root=/dev/nvme0n1p2 rw apic=debug
[    0.000000] APIC: Static calls initialized
[    0.001448] ACPI: APIC 0x000000007341E000 0001DC (v05 ALASKA A M I    01072009 AMI  01000013)
[    0.001547] ACPI: Reserving APIC table memory at [mem 0x7341e000-0x7341e1db]
[    0.001589] mapped APIC to ffffffffff5fc000 (        fee00000)
[    0.021194] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.021196] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    0.021198] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    0.021199] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[    0.021201] ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
[    0.021202] ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
[    0.021203] ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
[    0.021205] ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
[    0.021206] ACPI: LAPIC_NMI (acpi_id[0x09] high edge lint[0x1])
[    0.021207] ACPI: LAPIC_NMI (acpi_id[0x0a] high edge lint[0x1])
[    0.021209] ACPI: LAPIC_NMI (acpi_id[0x0b] high edge lint[0x1])
[    0.021210] ACPI: LAPIC_NMI (acpi_id[0x0c] high edge lint[0x1])
[    0.021211] ACPI: LAPIC_NMI (acpi_id[0x0d] high edge lint[0x1])
[    0.021213] ACPI: LAPIC_NMI (acpi_id[0x0e] high edge lint[0x1])
[    0.021214] ACPI: LAPIC_NMI (acpi_id[0x0f] high edge lint[0x1])
[    0.021215] ACPI: LAPIC_NMI (acpi_id[0x10] high edge lint[0x1])
[    0.021217] ACPI: LAPIC_NMI (acpi_id[0x11] high edge lint[0x1])
[    0.021218] ACPI: LAPIC_NMI (acpi_id[0x12] high edge lint[0x1])
[    0.021219] ACPI: LAPIC_NMI (acpi_id[0x13] high edge lint[0x1])
[    0.021221] ACPI: LAPIC_NMI (acpi_id[0x14] high edge lint[0x1])
[    0.021222] ACPI: LAPIC_NMI (acpi_id[0x15] high edge lint[0x1])
[    0.021223] ACPI: LAPIC_NMI (acpi_id[0x16] high edge lint[0x1])
[    0.021225] ACPI: LAPIC_NMI (acpi_id[0x17] high edge lint[0x1])
[    0.021226] ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
[    0.021279] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
[    0.021287] Int: type 0, pol 0, trig 0, bus 00, IRQ 00, APIC ID 2, APIC INT 02
[    0.021292] Int: type 0, pol 1, trig 3, bus 00, IRQ 09, APIC ID 2, APIC INT 09
[    0.021295] Int: type 0, pol 0, trig 0, bus 00, IRQ 01, APIC ID 2, APIC INT 01
[    0.021297] Int: type 0, pol 0, trig 0, bus 00, IRQ 03, APIC ID 2, APIC INT 03
[    0.021299] Int: type 0, pol 0, trig 0, bus 00, IRQ 04, APIC ID 2, APIC INT 04
[    0.021300] Int: type 0, pol 0, trig 0, bus 00, IRQ 05, APIC ID 2, APIC INT 05
[    0.021302] Int: type 0, pol 0, trig 0, bus 00, IRQ 06, APIC ID 2, APIC INT 06
[    0.021304] Int: type 0, pol 0, trig 0, bus 00, IRQ 07, APIC ID 2, APIC INT 07
[    0.021306] Int: type 0, pol 0, trig 0, bus 00, IRQ 08, APIC ID 2, APIC INT 08
[    0.021307] Int: type 0, pol 0, trig 0, bus 00, IRQ 0a, APIC ID 2, APIC INT 0a
[    0.021309] Int: type 0, pol 0, trig 0, bus 00, IRQ 0b, APIC ID 2, APIC INT 0b
[    0.021311] Int: type 0, pol 0, trig 0, bus 00, IRQ 0c, APIC ID 2, APIC INT 0c
[    0.021313] Int: type 0, pol 0, trig 0, bus 00, IRQ 0d, APIC ID 2, APIC INT 0d
[    0.021314] Int: type 0, pol 0, trig 0, bus 00, IRQ 0e, APIC ID 2, APIC INT 0e
[    0.021316] Int: type 0, pol 0, trig 0, bus 00, IRQ 0f, APIC ID 2, APIC INT 0f
[    0.021345] mapped IOAPIC to ffffffffff5fb000 (fec00000)
[    0.021769] Kernel command line: initrd=\intel-ucode.img initrd=\initramfs-linux.img root=/dev/nvme0n1p2 rw apic=debug
[    0.077440] APIC: Switch to symmetric I/O mode setup
[    0.077586] DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000 IOMMU 1
[    0.077618] DMAR-IR: Queued invalidation will be enabled to support x2apic and Intr-remapping.
[    0.079697] DMAR-IR: Enabled IRQ remapping in x2apic mode
[    0.079716] x2apic enabled
[    0.079925] APIC: Switched APIC routing to: cluster x2apic
[    0.084973] ENABLING IO-APIC IRQs
[    0.084989] init IO_APIC IRQs
[    0.084991]  apic 2 pin 0 not connected
[    0.085011] IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000001 SID:00F7 SQ:0 SVT:1)
[    0.085036] IOAPIC[0]: Preconfigured routing entry (2-1 -> IRQ 1 Level:0 ActiveLow:0)
[    0.085046] IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000001 SID:00F7 SQ:0 SVT:1)
[    0.085065] IOAPIC[0]: Preconfigured routing entry (2-2 -> IRQ 0 Level:0 ActiveLow:0)
[    0.085074] IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000001 SID:00F7 SQ:0 SVT:1)
[    0.085092] IOAPIC[0]: Preconfigured routing entry (2-3 -> IRQ 3 Level:0 ActiveLow:0)
[    0.085100] IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000001 SID:00F7 SQ:0 SVT:1)
[    0.085119] IOAPIC[0]: Preconfigured routing entry (2-4 -> IRQ 4 Level:0 ActiveLow:0)
[    0.085131] IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000001 SID:00F7 SQ:0 SVT:1)
[    0.085149] IOAPIC[0]: Preconfigured routing entry (2-5 -> IRQ 5 Level:0 ActiveLow:0)
[    0.085158] IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000001 SID:00F7 SQ:0 SVT:1)
[    0.085176] IOAPIC[0]: Preconfigured routing entry (2-6 -> IRQ 6 Level:0 ActiveLow:0)
[    0.085184] IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000001 SID:00F7 SQ:0 SVT:1)
[    0.085203] IOAPIC[0]: Preconfigured routing entry (2-7 -> IRQ 7 Level:0 ActiveLow:0)
[    0.085210] IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000001 SID:00F7 SQ:0 SVT:1)
[    0.085229] IOAPIC[0]: Preconfigured routing entry (2-8 -> IRQ 8 Level:0 ActiveLow:0)
[    0.085237] IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000001 SID:00F7 SQ:0 SVT:1)
[    0.085255] IOAPIC[0]: Preconfigured routing entry (2-9 -> IRQ 9 Level:1 ActiveLow:0)
[    0.085263] IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000001 SID:00F7 SQ:0 SVT:1)
[    0.085282] IOAPIC[0]: Preconfigured routing entry (2-10 -> IRQ 10 Level:0 ActiveLow:0)
[    0.085291] IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000001 SID:00F7 SQ:0 SVT:1)
[    0.085309] IOAPIC[0]: Preconfigured routing entry (2-11 -> IRQ 11 Level:0 ActiveLow:0)
[    0.085325] IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000001 SID:00F7 SQ:0 SVT:1)
[    0.085343] IOAPIC[0]: Preconfigured routing entry (2-12 -> IRQ 12 Level:0 ActiveLow:0)
[    0.085351] IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000001 SID:00F7 SQ:0 SVT:1)
[    0.085369] IOAPIC[0]: Preconfigured routing entry (2-13 -> IRQ 13 Level:0 ActiveLow:0)
[    0.085377] IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000001 SID:00F7 SQ:0 SVT:1)
[    0.085395] IOAPIC[0]: Preconfigured routing entry (2-14 -> IRQ 14 Level:0 ActiveLow:0)
[    0.085403] IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000001 SID:00F7 SQ:0 SVT:1)
[    0.085422] IOAPIC[0]: Preconfigured routing entry (2-15 -> IRQ 15 Level:0 ActiveLow:0)
[    0.085427]  apic 2 pin 16 not connected
[    0.085429]  apic 2 pin 17 not connected
[    0.085431]  apic 2 pin 18 not connected
[    0.085433]  apic 2 pin 19 not connected
[    0.085434]  apic 2 pin 20 not connected
[    0.085436]  apic 2 pin 21 not connected
[    0.085438]  apic 2 pin 22 not connected
[    0.085440]  apic 2 pin 23 not connected
[    0.085442]  apic 2 pin 24 not connected
[    0.085443]  apic 2 pin 25 not connected
[    0.085445]  apic 2 pin 26 not connected
[    0.085447]  apic 2 pin 27 not connected
[    0.085449]  apic 2 pin 28 not connected
[    0.085451]  apic 2 pin 29 not connected
[    0.085452]  apic 2 pin 30 not connected
[    0.085454]  apic 2 pin 31 not connected
[    0.085456]  apic 2 pin 32 not connected
[    0.085458]  apic 2 pin 33 not connected
[    0.085460]  apic 2 pin 34 not connected
[    0.085461]  apic 2 pin 35 not connected
[    0.085463]  apic 2 pin 36 not connected
[    0.085465]  apic 2 pin 37 not connected
[    0.085467]  apic 2 pin 38 not connected
[    0.085468]  apic 2 pin 39 not connected
[    0.085470]  apic 2 pin 40 not connected
[    0.085472]  apic 2 pin 41 not connected
[    0.085474]  apic 2 pin 42 not connected
[    0.085476]  apic 2 pin 43 not connected
[    0.085477]  apic 2 pin 44 not connected
[    0.085479]  apic 2 pin 45 not connected
[    0.085481]  apic 2 pin 46 not connected
[    0.085483]  apic 2 pin 47 not connected
[    0.085485]  apic 2 pin 48 not connected
[    0.085486]  apic 2 pin 49 not connected
[    0.085488]  apic 2 pin 50 not connected
[    0.085490]  apic 2 pin 51 not connected
[    0.085492]  apic 2 pin 52 not connected
[    0.085493]  apic 2 pin 53 not connected
[    0.085495]  apic 2 pin 54 not connected
[    0.085497]  apic 2 pin 55 not connected
[    0.085499]  apic 2 pin 56 not connected
[    0.085501]  apic 2 pin 57 not connected
[    0.085502]  apic 2 pin 58 not connected
[    0.085504]  apic 2 pin 59 not connected
[    0.085506]  apic 2 pin 60 not connected
[    0.085508]  apic 2 pin 61 not connected
[    0.085510]  apic 2 pin 62 not connected
[    0.085511]  apic 2 pin 63 not connected
[    0.085513]  apic 2 pin 64 not connected
[    0.085515]  apic 2 pin 65 not connected
[    0.085517]  apic 2 pin 66 not connected
[    0.085519]  apic 2 pin 67 not connected
[    0.085520]  apic 2 pin 68 not connected
[    0.085522]  apic 2 pin 69 not connected
[    0.085524]  apic 2 pin 70 not connected
[    0.085526]  apic 2 pin 71 not connected
[    0.085527]  apic 2 pin 72 not connected
[    0.085529]  apic 2 pin 73 not connected
[    0.085531]  apic 2 pin 74 not connected
[    0.085533]  apic 2 pin 75 not connected
[    0.085535]  apic 2 pin 76 not connected
[    0.085536]  apic 2 pin 77 not connected
[    0.085538]  apic 2 pin 78 not connected
[    0.085540]  apic 2 pin 79 not connected
[    0.085542]  apic 2 pin 80 not connected
[    0.085544]  apic 2 pin 81 not connected
[    0.085545]  apic 2 pin 82 not connected
[    0.085547]  apic 2 pin 83 not connected
[    0.085549]  apic 2 pin 84 not connected
[    0.085551]  apic 2 pin 85 not connected
[    0.085552]  apic 2 pin 86 not connected
[    0.085554]  apic 2 pin 87 not connected
[    0.085556]  apic 2 pin 88 not connected
[    0.085558]  apic 2 pin 89 not connected
[    0.085560]  apic 2 pin 90 not connected
[    0.085561]  apic 2 pin 91 not connected
[    0.085563]  apic 2 pin 92 not connected
[    0.085565]  apic 2 pin 93 not connected
[    0.085567]  apic 2 pin 94 not connected
[    0.085569]  apic 2 pin 95 not connected
[    0.085570]  apic 2 pin 96 not connected
[    0.085572]  apic 2 pin 97 not connected
[    0.085574]  apic 2 pin 98 not connected
[    0.085576]  apic 2 pin 99 not connected
[    0.085577]  apic 2 pin 100 not connected
[    0.085579]  apic 2 pin 101 not connected
[    0.085581]  apic 2 pin 102 not connected
[    0.085583]  apic 2 pin 103 not connected
[    0.085585]  apic 2 pin 104 not connected
[    0.085587]  apic 2 pin 105 not connected
[    0.085588]  apic 2 pin 106 not connected
[    0.085590]  apic 2 pin 107 not connected
[    0.085592]  apic 2 pin 108 not connected
[    0.085594]  apic 2 pin 109 not connected
[    0.085595]  apic 2 pin 110 not connected
[    0.085597]  apic 2 pin 111 not connected
[    0.085599]  apic 2 pin 112 not connected
[    0.085601]  apic 2 pin 113 not connected
[    0.085603]  apic 2 pin 114 not connected
[    0.085604]  apic 2 pin 115 not connected
[    0.085606]  apic 2 pin 116 not connected
[    0.085608]  apic 2 pin 117 not connected
[    0.085610]  apic 2 pin 118 not connected
[    0.085611]  apic 2 pin 119 not connected
[    0.439206] ACPI: Using IOAPIC for interrupt routing
[    0.888327] IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000001 SID:00F7 SQ:0 SVT:1)
[    0.888340] IOAPIC[0]: Preconfigured routing entry (2-16 -> IRQ 16 Level:1 ActiveLow:1)
[    0.924695] IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000001 SID:00F7 SQ:0 SVT:1)
[    0.924712] IOAPIC[0]: Preconfigured routing entry (2-18 -> IRQ 18 Level:1 ActiveLow:1)
[    0.926473] IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000001 SID:00F7 SQ:0 SVT:1)
[    0.926487] IOAPIC[0]: Preconfigured routing entry (2-16 -> IRQ 16 Level:1 ActiveLow:1)
[    0.927996] IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000001 SID:00F7 SQ:0 SVT:1)
[    0.928009] IOAPIC[0]: Preconfigured routing entry (2-19 -> IRQ 19 Level:1 ActiveLow:1)
[    0.950816] ... APIC ID:      00000000 (0)
[    0.950828] ... APIC VERSION: 01060015
[    0.950869] number of IO-APIC #2 registers: 120.
[    0.950870] testing the IO APIC.......................
[    0.950910] IO APIC #2......
[    0.950913] .......    : physical APIC id: 02
[    0.950921] .......     : IO APIC version: 20
[    0.950926] IOAPIC 0:
[    2.325225] IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000001 SID:00F7 SQ:0 SVT:1)
[    2.325240] IOAPIC[0]: Preconfigured routing entry (2-27 -> IRQ 27 Level:1 ActiveLow:1)
[    2.351687] IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000001 SID:00F7 SQ:0 SVT:1)
[    2.351698] IOAPIC[0]: Preconfigured routing entry (2-40 -> IRQ 40 Level:1 ActiveLow:1)
[    2.367659] IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000001 SID:00F7 SQ:0 SVT:1)
[    2.367669] IOAPIC[0]: Preconfigured routing entry (2-29 -> IRQ 29 Level:1 ActiveLow:1)
[    2.385216] IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000001 SID:00F7 SQ:0 SVT:1)
[    2.385228] IOAPIC[0]: Preconfigured routing entry (2-33 -> IRQ 33 Level:1 ActiveLow:1)
[    2.414104] IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000001 SID:00F7 SQ:0 SVT:1)
[    2.414113] IOAPIC[0]: Preconfigured routing entry (2-31 -> IRQ 31 Level:1 ActiveLow:1)
[    2.427592] IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000001 SID:00F7 SQ:0 SVT:1)
[    2.427603] IOAPIC[0]: Preconfigured routing entry (2-32 -> IRQ 32 Level:1 ActiveLow:1)
[    2.534690] IOAPIC[2]: Set IRTE entry (P:1 FPD:0 Dst_Mode:1 Redir_hint:1 Trig_Mode:0 Dlvry_Mode:0 Avail:0 Vector:EF Dest:00000001 SID:00F7 SQ:0 SVT:1)
[    2.534700] IOAPIC[0]: Preconfigured routing entry (2-37 -> IRQ 37 Level:1 ActiveLow:1)


