Return-Path: <linux-i2c+bounces-2448-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A345E8811A2
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 13:27:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D6811C2152C
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 12:27:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28CA33FB85;
	Wed, 20 Mar 2024 12:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q0+gk4hj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D34D3F9DB
	for <linux-i2c@vger.kernel.org>; Wed, 20 Mar 2024 12:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710937658; cv=none; b=k6z7x0DegWPzkx150gb5uC88j7XDRadzy4uUGg0sRttn7tuO0hzgtgQNGN2Owpah+FbHY+3dUT2ZaWnWj/IUWE/mmXb80QK/Hs7Gfq+lnZGcAXfjgzMt8yUuaP2/u4n+zqT91OB/T3aAZatcJlnvuiPKTLx5KeoOrLTp85qdQF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710937658; c=relaxed/simple;
	bh=QLdAHj7IJHlgjYUoem4mIW/AIvZDHIGX3oFmQaZXV3Q=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=jBj7x49oyn9URIvNwsaion3SpwWkh3UQFvqV7pm/6lTOqtevdXZ5jqbgqms1biKGxPmLw3V3lQ60TQSe/Qss8EsHj00TSqUupbUzd0W5WzW5kS6S4tYhBOqvt0ozW4G3RnEenFAJRXnvI/Hho9QRUVGQErQBYS2QomNTm/Co5VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q0+gk4hj; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-55a179f5fa1so7747167a12.0
        for <linux-i2c@vger.kernel.org>; Wed, 20 Mar 2024 05:27:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710937655; x=1711542455; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=KP0863//IoMfXcUSCjh4Susnmx2RGFB+uey+2UlYjqk=;
        b=Q0+gk4hj19aExEZo5+/Xk10UrYkDYZaXYSMhX4yyMmC2iGgdKlh6uQ70HabxH1sSv7
         jjF/PzVPJQTS63ly7B0omDOEK6cid3N0ltI81+DeDBC45ImuOfhxIHcV9qmcKtmzkZ/t
         fhSIrlpXYjsMnQKf6dr+B2Onnq0IHDsuH/lKVTPOk+CBDebIW/CONXZ9wXHFyKDhQYgt
         MJFWo/gkSIK5kEthpe2F0LWJ6DhKJV23KPPu9qgxqtzd4QF24fx6wwzY58JZ9NaOeevf
         boXC6CUtX6sVHOvej8WhCc7IBU/6sxhuDlX4Bd7M4OeGUdfkYNoqpv7o0XmXY9EfP9pt
         YsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710937655; x=1711542455;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KP0863//IoMfXcUSCjh4Susnmx2RGFB+uey+2UlYjqk=;
        b=XSGKqVZhDUhi6CkqEkvw2CnLduzgzQgGws5uH7dpmzraIudZHf1vDVn0YwnyFLQkCa
         e/8nNnLo2prOcfp2Yi2JUabZjL6tPg8htlbF5k5btAKi03Vm4UQ/ZL/x2CgB8qrlXIuK
         Z4Ra8G9WFa7j0KqTb0/bBJQwVLl4NWxNKEiWIw2lQuMSFYWme6owb3Dl5XGg8oo5rRp4
         Y/qwqVqvZ9mtB3XW04PH99tqS3b6boIqLr907VMz1ft5HIc8feB4kjpaB3HQx7gBYKnb
         xI0fEmin98dNo5w5c8/SMUhj69s9KMMj6XiawHRrz8scATcIj8oyzI3nki341IIC+KWt
         z+EQ==
X-Gm-Message-State: AOJu0Yx9b9+BZSrNZUn09aRPXQn2hvLa1rPYgltzk/kOAvB+mSfCR6oE
	WEBKj/Acw0PZNVWo1Kl0eXDiDuv6YzwUnbGO+JBv5TZPFEh/ZiYJ
X-Google-Smtp-Source: AGHT+IGekEy/VZW8+1NzHIg/icubF0mGW0E1Dygx6qG4vh7oe9DQ68/S3Kmbig//2FSxfMjzuZ4ing==
X-Received: by 2002:a05:6402:1d2b:b0:566:41f4:a0ea with SMTP id dh11-20020a0564021d2b00b0056641f4a0eamr1007201edb.37.1710937655301;
        Wed, 20 Mar 2024 05:27:35 -0700 (PDT)
Received: from ?IPV6:2a01:c22:7ab5:f000:edb2:a5ff:f53a:48f4? (dynamic-2a01-0c22-7ab5-f000-edb2-a5ff-f53a-48f4.c22.pool.telefonica.de. [2a01:c22:7ab5:f000:edb2:a5ff:f53a:48f4])
        by smtp.googlemail.com with ESMTPSA id d14-20020a056402400e00b0056bb1b017besm619230eda.23.2024.03.20.05.27.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Mar 2024 05:27:34 -0700 (PDT)
Message-ID: <af839910-2c3d-4559-b8b3-1c6f2372144e@gmail.com>
Date: Wed, 20 Mar 2024 13:27:35 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: i2c: designware: unhandled interrupt on N100 lpss channel 0
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>
References: <e3f2debf-c762-48d9-876e-bcb60841f909@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <e3f2debf-c762-48d9-876e-bcb60841f909@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.03.2024 22:11, Heiner Kallweit wrote:
> On a N100-based mini pc I see the following. I found older reports with the same symptom,
> but root cause seems to be different.
> 
> - Interrupt 27 is not shared in my case
> - I checked register values on entering the ISR. Interrupt mask and DW_IC_RAW_INTR_STAT
>   are both 0.
> - After an interrupt storm of 100,000 interrupts the interrupt gets disabled
> - The issue affects channel 0 only
> 
> If not the I2C IP, then who else can touch the interrupt line?

I noticed that after including INTEL_IDMA64 in my config the problem no longer occurs.
So there seems to be a dependency. Should it be reflected in Kconfig, e.g.
make MFD_INTEL_LPSS dependent on INTEL_IDMA64, or let it imply INTEL_IDMA64?

> May the BIOS play a role here? I have few ACPI errors on boot, and it seems the vendor
> of this dirt-cheap device didn't give much love to the BIOS.
> 
> 
> [    5.228854] irq 27: nobody cared (try booting with the "irqpoll" option)
> [    5.228929] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 6.8.0-next-20240312+ #4
> [    5.228981] Hardware name: Default string Default string/Default string, BIOS ADLN.M6.SODIMM.ZB.CY.015 08/08/2023
> [    5.229045] Call Trace:
> [    5.229065]  <IRQ>
> [    5.229084]  dump_stack_lvl+0x81/0xe0
> [    5.229125]  dump_stack+0x10/0x20
> [    5.229154]  __report_bad_irq+0x2b/0xc0
> [    5.229190]  note_interrupt+0x28f/0x2d0
> [    5.229220]  ? __this_cpu_preempt_check+0x13/0x20
> [    5.229262]  handle_irq_event+0x70/0x80
> [    5.229296]  handle_fasteoi_irq+0x90/0x210
> [    5.229331]  __common_interrupt+0x6f/0x140
> [    5.229369]  common_interrupt+0xab/0xd0
> [    5.229403]  </IRQ>
> [    5.229420]  <TASK>
> [    5.229440]  asm_common_interrupt+0x27/0x40
> [    5.229476] RIP: 0010:cpuidle_enter_state+0xff/0x4f0
> [    5.229516] Code: 8b 00 48 0f a3 05 c1 7f 9d 00 0f 82 fd 02 00 00 31 ff e8 a4 03 6a ff 80 7d cf 00 0f 85 cc 02 00 00 e8 15 e0 77 ff fb 45 85 ff <0f> 88 f4 01 00 00 49 63 f7 4c 89 f2 48 8d 04 76 48 8d 04 86 49 8d
> [    5.229627] RSP: 0018:ffffa6c44016fe58 EFLAGS: 00000202
> [    5.229668] RAX: 000000000007a19b RBX: ffffc6c43fcac660 RCX: 0000000000000000
> [    5.229715] RDX: 0000000000000000 RSI: ffffffff89323d8f RDI: ffffffff8930f62b
> [    5.229760] RBP: ffffa6c44016fe98 R08: 0000000000000001 R09: 0000000000000000
> [    5.229806] R10: 0000000000000001 R11: ffffa2a0b7aad824 R12: 0000000000000001
> [    5.229851] R13: ffffffff895b69a0 R14: 0000000137a9c564 R15: 0000000000000001
> [    5.229907]  ? cpuidle_enter_state+0xfb/0x4f0
> [    5.229946]  cpuidle_enter+0x29/0x40
> [    5.229978]  call_cpuidle+0x1d/0x40
> [    5.230010]  do_idle+0x1c2/0x220
> [    5.230040]  cpu_startup_entry+0x24/0x30
> [    5.230072]  start_secondary+0xf9/0x100
> [    5.230105]  common_startup_64+0x13e/0x148
> [    5.230148]  </TASK>
> [    5.230166] handlers:
> [    5.230185] [<00000000a498cda6>] i2c_dw_isr [i2c_designware_core]
> [    5.230354] Disabling IRQ #27
> 
> 
>             CPU0       CPU1       CPU2       CPU3
>    8:          0          0          0          0  IR-IO-APIC    8-edge      rtc0
>    9:          0         51          0          0  IR-IO-APIC    9-fasteoi   acpi
>   16:          0          3          0          0  IR-IO-APIC   16-fasteoi   i801_smbus
>   27:          0     100000          0          0  IR-IO-APIC   27-fasteoi   i2c_designware.0
>   29:          0          0          0          0  IR-IO-APIC   29-fasteoi   i2c_designware.2
>   31:          0          0          0          0  IR-IO-APIC   31-fasteoi   i2c_designware.4
>   32:          0          0          0          0  IR-IO-APIC   32-fasteoi   i2c_designware.5
>   33:          0          0          0          0  IR-IO-APIC   33-fasteoi   i2c_designware.3
>   40:          0          0          0          0  IR-IO-APIC   40-fasteoi   i2c_designware.1
> 
> Thanks, Heiner


