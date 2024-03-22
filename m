Return-Path: <linux-i2c+bounces-2565-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A29AA8873E6
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 20:28:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6F421C21C67
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Mar 2024 19:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E351D7A122;
	Fri, 22 Mar 2024 19:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ceiLjTYk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D724879DDB
	for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 19:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711135693; cv=none; b=hY817hnFOY8JBNCpIzUuN7I8EdvFAkGoDQIoE/znnNUNim/PvtoBHnukoooasCdgTZt5vprJkQHGBVLOZ0/iA1K9x5DWMSdGYBNMdDipyab9qm+TudUpOStXfifJrEkW51DMio2aMtCznMP7euvgcrGTsrSuQVRJrHSApIRVL5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711135693; c=relaxed/simple;
	bh=n3F1WoRH2pVMJEcIGvhHQVNlcKNvZmhsjjec0KG6kbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CVU3hGYXAq0X7qKmpXTHsNaEeC/WjthHViWLCiTTnb/kx/Qw7okop/FU8XW9h9Mg4Wg5Vo5lqIZxGavn3sUxvoZ4ddZ+r6sQR3vZ8gdYcns3bsiLFEucCcl26fc3nQdmfS7dW70DjuBw0abEsMmqEE4RdMJsy1em4vGnbpmd+1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ceiLjTYk; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-56b0af675deso3129454a12.1
        for <linux-i2c@vger.kernel.org>; Fri, 22 Mar 2024 12:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711135690; x=1711740490; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qH7E/wjkQpYNJhV4UCa5l27FW6Q8Xkbbx26U6f2twvI=;
        b=ceiLjTYkKe8yVSiJNbsN9mR0KPxyWk42aecfx0gYPvvVfdqbEZfl2ai+jaWUnJU2Pl
         F3ZzzSh4Ew6WQCjnMmgzz/GmkX1PUL/OLN3fSU6sDHlOcjsf769+Eyb/zGQ0UphSotTJ
         nok3Erw7OjGSZxPfhEVRRaE/xUwXW31XoCv7VFPU3boWMSMHcmMgVCz9iI591tsGlw3q
         w4KcE8T2wTlpbsELnKltaoNZmwjdKHTqZa58WTFwjuTZbGzyu6jpxLd+cNEpjHfsmjNK
         AjqU+uU36NwZ2lab+oinEA43tHZIBn8uyKZRstNKCCD250DqH4bF9SWmN87Sg3VmpDh/
         0tyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711135690; x=1711740490;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qH7E/wjkQpYNJhV4UCa5l27FW6Q8Xkbbx26U6f2twvI=;
        b=NDRyHQUImeVnSAJvmkyqryu6wFIt2JXqBPc1KXVouOIVrDjVBAl/YjCD7b9ABYsG3o
         WXLkd2ynPf5V2XreMfEAh6JOax+1INfdu8O+AodyDg0s1pbvzrQVsRc/JF9AbFrJjxHX
         21pfk3Vm1IvCpk1tt/RCXfCsB8cY4GKW7uMaGC7R+lvP4+sZsB4GKoXg07fR9T/uNe39
         WiCCyluN2bmwk+BBOdG1wVYRzf3Axn5EACpxBKNYL/EzXmi0SOzAuVtkQ7uzb7D73Be0
         2VYeK2qLPfBWqtE/YTwv0vh8/qUkZzUZvsKSI76zymF05pwRL1B+wkl5Zia+vlVhnyV7
         NXqA==
X-Forwarded-Encrypted: i=1; AJvYcCUkjiifrsA//KM0/F52jXggA2SSna1uRv35wShqFRCudI/iiQKSs6tlxq7H0+ou3MDh6JKzDK156lI5wFGRXBM2U75LqHxp2+56
X-Gm-Message-State: AOJu0YzGIWT5173HTcLsPMaChoXu8986nuwXN0KGbesJTFxH4+7ZgjAv
	0NbbSkoAdUcX4Q1pArqrLuNKExYx5YfgixsAzbWTTxj2XP//aeZB
X-Google-Smtp-Source: AGHT+IGMempjnoD1MWx4iH0ULC1yrciLo35qJoRqxofyTh/2G3/7Gnb01H2/DmUGQaY1fA1l9cHwwA==
X-Received: by 2002:a50:d659:0:b0:565:665b:9c82 with SMTP id c25-20020a50d659000000b00565665b9c82mr343140edj.8.1711135689711;
        Fri, 22 Mar 2024 12:28:09 -0700 (PDT)
Received: from ?IPV6:2a01:c23:b9ee:2200:7d9e:a9c9:89ef:c58b? (dynamic-2a01-0c23-b9ee-2200-7d9e-a9c9-89ef-c58b.c23.pool.telefonica.de. [2a01:c23:b9ee:2200:7d9e:a9c9:89ef:c58b])
        by smtp.googlemail.com with ESMTPSA id ds2-20020a0564021cc200b00568d750f7b2sm122283edb.65.2024.03.22.12.28.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Mar 2024 12:28:09 -0700 (PDT)
Message-ID: <2cc45e8e-558d-4e7b-a370-1187bac939fa@gmail.com>
Date: Fri, 22 Mar 2024 20:28:08 +0100
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
References: <ZfrvhvuW3ZgzWYjt@smile.fi.intel.com>
 <700bbb84-90e1-4505-8ff0-3f17ea8bc631@gmail.com>
 <ZfsHyyrel-d1exxM@smile.fi.intel.com>
 <62500f74-8d73-40f3-80dd-36d3f70084f0@gmail.com>
 <ZftQKXWBKPj3ztYM@smile.fi.intel.com>
 <6d0b7ab5-7864-49f9-92ca-f3413fe6e1f9@gmail.com>
 <ZfwX8d0Ux4ZhpxIS@smile.fi.intel.com>
 <5f04727b-f566-4b01-a673-6375482811c6@gmail.com>
 <ZfxvhCRSQ-Cx_Spn@smile.fi.intel.com>
 <ef403546-f696-4adb-a441-1d8c71712704@gmail.com>
 <Zf2vVsiW2KCEQU-U@smile.fi.intel.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <Zf2vVsiW2KCEQU-U@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.03.2024 17:18, Andy Shevchenko wrote:
> On Thu, Mar 21, 2024 at 10:00:27PM +0100, Heiner Kallweit wrote:
>> On 21.03.2024 18:33, Andy Shevchenko wrote:
>>> On Thu, Mar 21, 2024 at 12:59:59PM +0100, Heiner Kallweit wrote:
>>>> On 21.03.2024 12:20, Andy Shevchenko wrote:
>>>>> On Wed, Mar 20, 2024 at 10:26:06PM +0100, Heiner Kallweit wrote:
>>>>>> On 20.03.2024 22:07, Andy Shevchenko wrote:
>>>>>>> On Wed, Mar 20, 2024 at 09:21:34PM +0100, Heiner Kallweit wrote:
>>>>>>>> On 20.03.2024 16:59, Andy Shevchenko wrote:
>>>>>>>>> On Wed, Mar 20, 2024 at 03:56:29PM +0100, Heiner Kallweit wrote:
> 
> ...
> 
>>>>>>>>>   grep 0000001b /sys/kernel/debug/pinctrl/*/pins
>>>>>>>>
>>>>>>>> pin 3 (GPPC_B_3) 3:INTC1057:00 GPIO 0x80100102 0x0000001b 0x00000000 [LOCKED tx]
>>>>>>>> pin 82 (GPP_F_7_EMMC_CMD) 135:INTC1057:00 GPIO 0x44000300 0x0000001b 0x00000000 [LOCKED full, ACPI]
>>>>>>>> pin 182 (GPPC_C_13) 269:INTC1057:00 GPIO 0x44000300 0x0000001b 0x00000000 [LOCKED full, ACPI]
>>>>>>>
>>>>>>> I was not correct, the value to grep is '0000[0-3][0-9a-f]1b' as there pull
>>>>>>> up/down can be enabled.
>>>>>>>
>>>>>> Result is the same
>>>>>>
>>>>>>> Nevertheless from the above the pin 3 is one that is enabled as GPIO input with
>>>>>>> RTE 27 and direct IRQ.  If it's a culprit, try to add in the pinctrl-intel.c at
>>>>>>> the end of .probe:
>>>>>>>
>>>>>>> 	{
>>>>>>> 		void __iomem *padcfg0;
>>>>>>> 	        u32 value;
>>>>>>>
>>>>>>> 		padcfg0 = intel_get_padcfg(pctrl, 3, PADCFG0);
>>>>>>>
>>>>>>> 		value = readl(padcfg0);
>>>>>>> 		value |= PADCFG0_GPIOTXDIS;
>>>>>>> 		value |= PADCFG0_GPIORXDIS;
>>>>>>> 		writel(value, padcfg0);
>>>>>>> 	}
>>>>>>>
>>>>>>> If it helps, it will show the BIOS bug (likely).
>>>>>>>
>>>>>> Wow, this indeed fixes the issue for me. Thanks a lot!
>>>>>
>>>>> Wow! Glad to hear this.
>>>>> (Side note, can you test the patch against idma64 I sent yesterday?
>>>>>  Tested-by tag will be appreciated!)
>>>>>
>>>> Done, sent the Tested-by
>>>
>>> Thank you!
>>>
>>>>> We may try to have the quirk in the kernel, but it might be (quite) tricky
>>>>> (see the link below).
>>>>>
>>>>> Can you share `acpidump -o n100-tables.dat` (the file) somewhere?
>>>>> I would like to see if this pin is anyhow being mentioned in the DSDT.
>>>>>
>>>> Attached. Compressed file isn't that big, so hope it's ok to send it
>>>> as an attachment.
>>>
>>> Yes, got it.
>>>
>>> Can you also share the output of
>>>
>>> 1) `dmesg` (when kernel command line has 'ignore_loglevel apic=debug');
>> attached
>>> 2) `lspci -nk -vv`;
>> attached
>>> 3) `grep -H 15 /sys/bus/acpi/devices/*/status`?
>>>
>> /sys/bus/acpi/devices/ACPI0003:00/status:15
>> /sys/bus/acpi/devices/ACPI000C:00/status:15
>> /sys/bus/acpi/devices/ACPI000E:00/status:15
>> /sys/bus/acpi/devices/device:4a/status:15
>> /sys/bus/acpi/devices/device:86/status:15
>> /sys/bus/acpi/devices/device:87/status:15
>> /sys/bus/acpi/devices/device:88/status:15
>> /sys/bus/acpi/devices/device:8a/status:15
>> /sys/bus/acpi/devices/device:8b/status:15
>> /sys/bus/acpi/devices/device:8c/status:15
>> /sys/bus/acpi/devices/INT33A1:00/status:15
>> /sys/bus/acpi/devices/INTC1041:00/status:15
>> /sys/bus/acpi/devices/INTC1048:00/status:15
>> /sys/bus/acpi/devices/INTC1057:00/status:15
>> /sys/bus/acpi/devices/INTC1070:00/status:15
>> /sys/bus/acpi/devices/INTC1099:00/status:15
>> /sys/bus/acpi/devices/MSFT0001:00/status:15
>> /sys/bus/acpi/devices/OVTI01AS:00/status:15
>> /sys/bus/acpi/devices/OVTID858:00/status:15
>> /sys/bus/acpi/devices/PNP0103:00/status:15
>> /sys/bus/acpi/devices/PNP0C09:00/status:15
>> /sys/bus/acpi/devices/PNP0C0C:00/status:15
>> /sys/bus/acpi/devices/PNP0C0D:00/status:15
>> /sys/bus/acpi/devices/PRP00001:00/status:15
>> /sys/bus/acpi/devices/TXNW3643:00/status:15
>> /sys/bus/acpi/devices/TXNW3643:01/status:15
> 
> Can you also add this
> 
>  grep -H 15 /sys/bus/acpi/devices/*/status | while read x; do grep -H . `dirname $x`/path; done
> 

/sys/bus/acpi/devices/ACPI0003:00/path:\_SB_.ADP1
/sys/bus/acpi/devices/ACPI000C:00/path:\_SB_.PAGD
/sys/bus/acpi/devices/ACPI000E:00/path:\_SB_.AWAC
/sys/bus/acpi/devices/device:4a/path:\_SB_.PC00.TCPU
/sys/bus/acpi/devices/device:86/path:\_SB_.PC00.THC0.TLC1
/sys/bus/acpi/devices/device:87/path:\_SB_.PC00.THC0.TLC2
/sys/bus/acpi/devices/device:88/path:\_SB_.PC00.THC0.TLC3
/sys/bus/acpi/devices/device:8a/path:\_SB_.PC00.THC1.TLC1
/sys/bus/acpi/devices/device:8b/path:\_SB_.PC00.THC1.TLC2
/sys/bus/acpi/devices/device:8c/path:\_SB_.PC00.THC1.TLC3
/sys/bus/acpi/devices/INT33A1:00/path:\_SB_.PEPD
/sys/bus/acpi/devices/INTC1041:00/path:\_SB_.IETM
/sys/bus/acpi/devices/INTC1048:00/path:\_SB_.PC00.LPCB.H_EC.TFN1
/sys/bus/acpi/devices/INTC1057:00/path:\_SB_.GPI0
/sys/bus/acpi/devices/INTC1070:00/path:\_SB_.HIDD
/sys/bus/acpi/devices/INTC1099:00/path:\_SB_.PC00.LPCB.CWDT
/sys/bus/acpi/devices/MSFT0001:00/path:\_SB_.PC00.LPCB.PS2K
/sys/bus/acpi/devices/OVTI01AS:00/path:\_SB_.PC00.LNK0
/sys/bus/acpi/devices/OVTID858:00/path:\_SB_.PC00.LNK1
/sys/bus/acpi/devices/PNP0103:00/path:\_SB_.PC00.LPCB.HPET
/sys/bus/acpi/devices/PNP0C09:00/path:\_SB_.PC00.LPCB.H_EC
/sys/bus/acpi/devices/PNP0C0C:00/path:\_SB_.PWRB
/sys/bus/acpi/devices/PNP0C0D:00/path:\_SB_.PC00.LPCB.H_EC.LID0
/sys/bus/acpi/devices/PRP00001:00/path:\_SB_.PC00.HDAS.IDA_.SNDW
/sys/bus/acpi/devices/TXNW3643:00/path:\_SB_.PC00.FLM0
/sys/bus/acpi/devices/TXNW3643:01/path:\_SB_.PC00.FLM1


> ?
> 
>>>>>> For my understanding: Shall we (kernel driver) rely on the BIOS to configure
>>>>>> GPIO's properly?
>>>>>
>>>>> Yes, but there are bugs.
>>>>> You may look, e.g., https://bugzilla.kernel.org/show_bug.cgi?id=214749.
>>>>>
>>>>>> Or better assume that GPIO's are in an unknown state on
>>>>>> driver load and configure them for our needs?
>>>>>
>>>>> It depends. But usually (> 99% cases) we rely on the firmware.
>>>>>
>>>>>> IOW: If we assume that other systems may have similar issues, should
>>>>>> "some driver" use e.g. the pinctrl API to configure relevant pins?
> 


