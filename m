Return-Path: <linux-i2c+bounces-2455-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 788618813F2
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 15:59:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 04BB11F216A9
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 14:59:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 835B44AED1;
	Wed, 20 Mar 2024 14:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KXTFQ+zc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A661F482D8
	for <linux-i2c@vger.kernel.org>; Wed, 20 Mar 2024 14:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710946593; cv=none; b=P0swamjL4nRpNVXsPfImZ1kXccTSImafeXeCQshBrb5urbZhykFLyedAk3Rv7LIsh+ZhKz68X2uEyJNFhYj6Ujwo3Po/bbQGndOSgS9R+/5Rbk1r6sNdmmL8F0+mC/9agsVF5ELdwXe22xjIMzYAWdpLcOlp72jfdtSYaVUHCDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710946593; c=relaxed/simple;
	bh=5UVNeTtHe0nu0ynldQ5Ekww8LNzR396AeiCeswX5Piw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T8zbTHe5hP43csASmvrjpPpNpFNk6IPGTWBCEvq9JkuKYBVSAHISJvoOLGvc5qQ4H6XeuvZf35rNDimqcWm+ohKw2o6YC+vWwpqvnZprnIARwbT+ebvRaAtZSPfsXvo9XT+LIbOsxuppWPGOUOIszvPymScwotlpT2RhcwYhsMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KXTFQ+zc; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a46ce2bd562so416982866b.2
        for <linux-i2c@vger.kernel.org>; Wed, 20 Mar 2024 07:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710946590; x=1711551390; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XmpUnjilSkXy310NsbYikELnKxJtidO5wHQsJzOa/ro=;
        b=KXTFQ+zcl0cbVy1K0cHjeSeGpkyUpsCsTymNGXe3KKCCHQhWo9vkUGJXPrXx+SQK0k
         6YKu2ldaWb3EHwy2QwEgIGf1Bz4DY0irALvcMtXnmjqkA7NUiVrtQsrDiIQqqZTSsBWQ
         4SLbw9xlHSPg7inoQJOSWr6ag+9xzflNW30HvCuTErBLDPDpcKGaeGlQ/TPYWunFfIUO
         nm0KBjNIF1aXdpD7onXLn/dhNr6LbOz05lcbsHjq4299wF3AN8JovnPXf5kPzJDhnLZp
         +QCt+y2g2feo+IVJNkiG7npLQjHcGNpRf5iUN+kUN7SL6pZbDYyblMP7eO2NpzfspIV/
         eGzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710946590; x=1711551390;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XmpUnjilSkXy310NsbYikELnKxJtidO5wHQsJzOa/ro=;
        b=TfBr2jYUKyf0Qo0Mrg5IAqe/YR3t3d1YvdAO7oTQFHl4+qmgYrWgodtf+h06INnnJQ
         5UDPutHPSSBMLQ+ysMxM9ou/6Z8SdUN6GFaN/3R4W37J/b1y5T3F5kXSCYZRZuhY1+Mh
         U3FPeX0QY4fgKG4T3e/7+SEIuhcLWVF1dqu0jSadUwocsC3mzJYPd23y6n1G6MuNniVz
         1xwy2NENIwWBsCdduZFHm1TpKgodgMtaQwIHaARKMjfMhUeI6oISJ9buZp+y6I9NhiMF
         aLbTqlg329Bawma5P3SVM8M6dhw1FWa3pgLZJCS0VtaaxutT/FV8DVObGxsWrlmOHIcK
         TWgw==
X-Gm-Message-State: AOJu0YwtpdhK0IiKAzrmZziKbgnFu2QcIq1KoX9pi9ZjRg1NuRZ85oOz
	CDoMvJZJzrBLXLGnPbOTYqjZB4Wegg+lfVGcgriG6qJpd00sbJ8uYjis7J6/
X-Google-Smtp-Source: AGHT+IHy8mHxbynVidibM8W7sqAN3BOlOBCzArcZfuGmJNRceJIH2r2Ni7ElcMX1UfsD0J4MLgwVLA==
X-Received: by 2002:a17:906:7c8e:b0:a46:69ec:c674 with SMTP id w14-20020a1709067c8e00b00a4669ecc674mr4239642ejo.35.1710946589734;
        Wed, 20 Mar 2024 07:56:29 -0700 (PDT)
Received: from ?IPV6:2a01:c22:7ab5:f000:5532:5729:57b2:4d0a? (dynamic-2a01-0c22-7ab5-f000-5532-5729-57b2-4d0a.c22.pool.telefonica.de. [2a01:c22:7ab5:f000:5532:5729:57b2:4d0a])
        by smtp.googlemail.com with ESMTPSA id dl19-20020a170907945300b00a44b90abb1dsm7277040ejc.110.2024.03.20.07.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 07:56:29 -0700 (PDT)
Message-ID: <700bbb84-90e1-4505-8ff0-3f17ea8bc631@gmail.com>
Date: Wed, 20 Mar 2024 15:56:29 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: i2c: designware: unhandled interrupt on N100 lpss channel 0
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>
References: <e3f2debf-c762-48d9-876e-bcb60841f909@gmail.com>
 <af839910-2c3d-4559-b8b3-1c6f2372144e@gmail.com>
 <af547aab-e957-4dbf-922d-e2ad13e19877@linux.intel.com>
 <ZfrvhvuW3ZgzWYjt@smile.fi.intel.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <ZfrvhvuW3ZgzWYjt@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.03.2024 15:15, Andy Shevchenko wrote:
> On Wed, Mar 20, 2024 at 03:37:34PM +0200, Jarkko Nikula wrote:
>> On 3/20/24 2:27 PM, Heiner Kallweit wrote:
>>> On 19.03.2024 22:11, Heiner Kallweit wrote:
>>>> On a N100-based mini pc I see the following. I found older reports with the same symptom,
>>>> but root cause seems to be different.
>>>>
>>>> - Interrupt 27 is not shared in my case
>>>> - I checked register values on entering the ISR. Interrupt mask and DW_IC_RAW_INTR_STAT
>>>>    are both 0.
>>>> - After an interrupt storm of 100,000 interrupts the interrupt gets disabled
>>>> - The issue affects channel 0 only
>>>>
>>>> If not the I2C IP, then who else can touch the interrupt line?
>>>
>>> I noticed that after including INTEL_IDMA64 in my config the problem no longer occurs.
>>> So there seems to be a dependency. Should it be reflected in Kconfig, e.g.
>>> make MFD_INTEL_LPSS dependent on INTEL_IDMA64, or let it imply INTEL_IDMA64?
>>>
>> Hmm.. interesting. I'd say BIOS perhaps has left the IDMA active and is
>> generating interrupts until the idma64 driver acknowledges it.
>>
>> There should not be generic dependency since the i2c_designware is not using
>> the DMA and a quick test on one platform where idma64 and i2c_designware are
>> sharing the same interrupt without CONFIG_INTEL_IDMA64 not set didn't show
>> similar behavior.
>>
>> Andy: Do you have any additional ideas or debug hints to this?
> 
> Can you share `cat /proc/interrupts` in non-working and working cases?
> 
> Just to confirm: loading idma64 driver fixes the issue, correct?
> 
I spoke too soon. Loading idma64 didn't actually fix the problem.
What happened:
Runtime PM kicked in and set the device to D3. Therefore reads to the idma64
status register returned 0xffffffff, resulting the idma64 ISR returning
IRQ_HANDLED. IRQ number still was rapidly growing.

After disabling RPM the problem is back.
Who else could pull the level-triggered interrupt high?

[    4.642978] irq 27: nobody cared (try booting with the "irqpoll" option)
[    4.643067] CPU: 3 PID: 0 Comm: swapper/3 Not tainted 6.8.0-next-20240312+ #5
[    4.643133] Hardware name: Default string Default string/Default string, BIOS ADLN.M6.SODIMM.ZB.CY.015 08/08/2023
[    4.643215] Call Trace:
[    4.643241]  <IRQ>
[    4.643266]  dump_stack_lvl+0x81/0xe0
[    4.643319]  dump_stack+0x10/0x20
[    4.643358]  __report_bad_irq+0x2b/0xc0
[    4.643403]  note_interrupt+0x28f/0x2d0
[    4.643442]  ? __this_cpu_preempt_check+0x13/0x20
[    4.643496]  handle_irq_event+0x70/0x80
[    4.643541]  handle_fasteoi_irq+0x90/0x210
[    4.643586]  __common_interrupt+0x6f/0x140
[    4.643633]  common_interrupt+0xab/0xd0
[    4.643672]  </IRQ>
[    4.643694]  <TASK>
[    4.643720]  asm_common_interrupt+0x27/0x40
[    4.643761] RIP: 0010:cpuidle_enter_state+0xff/0x4f0
[    4.643815] Code: 8b 00 48 0f a3 05 d1 5f 9d 00 0f 82 fd 02 00 00 31 ff e8 f4 e0 69 ff 80 7d cf 00 0f 85 cc 02 00 00 e8 65 bd 77 ff fb 45 85 ff <0f> 88 f4 01 00 00 49 63 f7 4c 89 f2 48 8d 04 76 48 8d 04 86 49 8d
[    4.643957] RSP: 0018:ffffb21dc017fe58 EFLAGS: 00000202
[    4.644010] RAX: 000000000007987d RBX: ffffd21dbfdac690 RCX: 0000000000000000
[    4.644069] RDX: 0000000000000000 RSI: ffffffff8f724a02 RDI: ffffffff8f710113
[    4.644128] RBP: ffffb21dc017fe98 R08: 0000000000000001 R09: 0000000000000000
[    4.644186] R10: 0000000000000001 R11: ffff91cfb7bad824 R12: 0000000000000001
[    4.644244] R13: ffffffff8f9b69a0 R14: 0000000114be1938 R15: 0000000000000001
[    4.644315]  ? cpuidle_enter_state+0xfb/0x4f0
[    4.644367]  cpuidle_enter+0x29/0x40
[    4.644409]  call_cpuidle+0x1d/0x40
[    4.644450]  do_idle+0x1c2/0x220
[    4.644489]  cpu_startup_entry+0x24/0x30
[    4.644529]  start_secondary+0xf9/0x100
[    4.644571]  common_startup_64+0x13e/0x148
[    4.644626]  </TASK>
[    4.644649] handlers:
[    4.644674] [<000000008b061326>] idma64_irq [idma64]
[    4.644852] [<000000008273d6d5>] i2c_dw_isr [i2c_designware_core]
[    4.644920] Disabling IRQ #27


            CPU0       CPU1       CPU2       CPU3
   8:          0          0          0          0  IR-IO-APIC    8-edge      rtc0
   9:          0         44          0          0  IR-IO-APIC    9-fasteoi   acpi
  16:          0          3          0          0  IR-IO-APIC   16-fasteoi   i801_smbus, idma64.6
  27:          0          0          0     112018  IR-IO-APIC   27-fasteoi   idma64.0, i2c_designware.0
  29:          0          0          0          0  IR-IO-APIC   29-fasteoi   idma64.2, i2c_designware.2
  31:          0          0          0          0  IR-IO-APIC   31-fasteoi   idma64.4, i2c_designware.4
  32:          0          0          0          0  IR-IO-APIC   32-fasteoi   idma64.5, i2c_designware.5
  33:          0          0          0          0  IR-IO-APIC   33-fasteoi   idma64.3, i2c_designware.3
  37:          0          0          0          0  IR-IO-APIC   37-fasteoi   idma64.7
  40:          0          0          0          0  IR-IO-APIC   40-fasteoi   idma64.1, i2c_designware.1


