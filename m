Return-Path: <linux-i2c+bounces-2476-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F900886225
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Mar 2024 22:00:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8328AB21567
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Mar 2024 21:00:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03932135412;
	Thu, 21 Mar 2024 21:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hV3PXRYx"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34D6134CC2
	for <linux-i2c@vger.kernel.org>; Thu, 21 Mar 2024 21:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711054831; cv=none; b=HP+dKugQg7XUjow2/Af5Z5m+WWC9DQ9gHRhAI7rmW9KZmYC/fgvXY6ywoykvcRdBrI2GThrC6Nq4OobQ86Y9evuQIkb7UON/51xAe4HfGMOmNsMHsbddVVFz8hV80w5yU/xb7nJDyfoBtIZauO0ENXtDA7/cRMOuV7oppwSk0pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711054831; c=relaxed/simple;
	bh=7rNEdXxam0uMhbeDdXXPIRajSNMfBQhA5nI7xf8ccs8=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=HOyelaIomnsjH2Xag8k0LT+55N38DIx7wgm/R7obIq1L0ZURHDiHAeWqW9cavHkOx+MweR/gXbhoWNfqOGDxz6Gz8Ancp7BCuJ04ymMm+7/flVVYfjVFMVrevm13TSz3tIp9zQCcPMpjNJ8sdkp9ImHsRh2huUvWxf5hVBEt5Do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hV3PXRYx; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-563c595f968so1884065a12.0
        for <linux-i2c@vger.kernel.org>; Thu, 21 Mar 2024 14:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711054828; x=1711659628; darn=vger.kernel.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=b9SQDciTZLVT/w5TvRhClf+nYRzNyVhniwBqRoyBJWc=;
        b=hV3PXRYx4vsNNr1JojgJxH49Brl+kTqpoDHtOND86coSu5jdbjZzp6bnncGo8xNTB0
         8yEUa+zqJHcMhUlD8wYqAjJat9KJ7WY5t2fa8VuZSvQ63ti0X++WWeLNQUA7s7hQPfDX
         hwXgf14NpjnJHB/HEVIUJ7podnLERI1r+glNnDaUgBDyl7d1THRCPqNPymRkEdN32K5p
         OHD7wyybVghwT6a7B5XwgG0/QCKG2zR/8uKybaRlv0VhwMa+7LQjIqDkbvzBQW82UYwJ
         wUcaQF3hpqlWPHf+qWqaxQ8Gkxzm/VVu4bqdv5B2XW806wRFM33LxC1G8vRSvaHAwHuG
         6Xjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711054828; x=1711659628;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=b9SQDciTZLVT/w5TvRhClf+nYRzNyVhniwBqRoyBJWc=;
        b=GW+tXpwLmjN4IJkqD7NPEcJpu4hteZ7CKfOiiM6oxFYT7ZCskJxRkn9Fg7rcROGBxO
         MCZx2pfX0Lk5Dob09aTJuMWURGh0TChk8jhoH5I5D1fnKMKH/XKUBQy5EjSir2bowLsw
         hJDP5N3geOSmmzs8XNMVuOkbOUBJgNUB9F45ipfNLa/YaD9wEtLhdZ8DqqxocYTdV2cV
         Bf4wSRu0SvifDeBbLPQ8sP6foKAyFGT6fDhtrNDnIbk2tjWIfPJy20740pX/bDUpVFM4
         uLwpVQ8iL4mBk8TVdf8qgEKVSPoYHGpKp/eUJnR2RuKLQ5rt+n4tda/GxVG6bq+8x3q/
         x7Bw==
X-Forwarded-Encrypted: i=1; AJvYcCUq25/PCFZcFddfOhY17o5rdH58uy/+/JDMo7pBkr1FU2t015ts7F9ejE4diHxp8soyuAk9GyQWWdCtRy57Zplz3z253bFnbmQg
X-Gm-Message-State: AOJu0YwqFuTbjB1qNG5LTaQ+I56xQIVwlY4/k4YiLmxeFvnjP34lE8iV
	s9MIlJ4ePrBpRXaW+2PSawk7+meeoZ+InjuiTJJbN/7XBhjs5Jdf
X-Google-Smtp-Source: AGHT+IGpq2suSukfW8cb8llMXyMyqW0oOgxD6z+LrqSK+sz0mn4Ebr4jm8aIOfWvUiDfVhiKF14E4Q==
X-Received: by 2002:a17:906:6c89:b0:a46:637c:db67 with SMTP id s9-20020a1709066c8900b00a46637cdb67mr338178ejr.5.1711054827737;
        Thu, 21 Mar 2024 14:00:27 -0700 (PDT)
Received: from ?IPV6:2a01:c22:7b76:3a00:45cc:3970:b3a9:e61b? (dynamic-2a01-0c22-7b76-3a00-45cc-3970-b3a9-e61b.c22.pool.telefonica.de. [2a01:c22:7b76:3a00:45cc:3970:b3a9:e61b])
        by smtp.googlemail.com with ESMTPSA id d24-20020a17090648d800b00a465ee3d2cesm295882ejt.218.2024.03.21.14.00.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Mar 2024 14:00:26 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------m0RWbuUpESm8n0qcTjyl3sUB"
Message-ID: <ef403546-f696-4adb-a441-1d8c71712704@gmail.com>
Date: Thu, 21 Mar 2024 22:00:27 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: i2c: designware: unhandled interrupt on N100 lpss channel 0
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Andi Shyti <andi.shyti@kernel.org>
References: <af839910-2c3d-4559-b8b3-1c6f2372144e@gmail.com>
 <af547aab-e957-4dbf-922d-e2ad13e19877@linux.intel.com>
 <ZfrvhvuW3ZgzWYjt@smile.fi.intel.com>
 <700bbb84-90e1-4505-8ff0-3f17ea8bc631@gmail.com>
 <ZfsHyyrel-d1exxM@smile.fi.intel.com>
 <62500f74-8d73-40f3-80dd-36d3f70084f0@gmail.com>
 <ZftQKXWBKPj3ztYM@smile.fi.intel.com>
 <6d0b7ab5-7864-49f9-92ca-f3413fe6e1f9@gmail.com>
 <ZfwX8d0Ux4ZhpxIS@smile.fi.intel.com>
 <5f04727b-f566-4b01-a673-6375482811c6@gmail.com>
 <ZfxvhCRSQ-Cx_Spn@smile.fi.intel.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 xsFNBF/0ZFUBEAC0eZyktSE7ZNO1SFXL6cQ4i4g6Ah3mOUIXSB4pCY5kQ6OLKHh0FlOD5/5/
 sY7IoIouzOjyFdFPnz4Bl3927ClT567hUJJ+SNaFEiJ9vadI6vZm2gcY4ExdIevYHWe1msJF
 MVE4yNwdS+UsPeCF/6CQQTzHc+n7DomE7fjJD5J1hOJjqz2XWe71fTvYXzxCFLwXXbBiqDC9
 dNqOe5odPsa4TsWZ09T33g5n2nzTJs4Zw8fCy8rLqix/raVsqr8fw5qM66MVtdmEljFaJ9N8
 /W56qGCp+H8Igk/F7CjlbWXiOlKHA25mPTmbVp7VlFsvsmMokr/imQr+0nXtmvYVaKEUwY2g
 86IU6RAOuA8E0J5bD/BeyZdMyVEtX1kT404UJZekFytJZrDZetwxM/cAH+1fMx4z751WJmxQ
 J7mIXSPuDfeJhRDt9sGM6aRVfXbZt+wBogxyXepmnlv9K4A13z9DVLdKLrYUiu9/5QEl6fgI
 kPaXlAZmJsQfoKbmPqCHVRYj1lpQtDM/2/BO6gHASflWUHzwmBVZbS/XRs64uJO8CB3+V3fa
 cIivllReueGCMsHh6/8wgPAyopXOWOxbLsZ291fmZqIR0L5Y6b2HvdFN1Xhc+YrQ8TKK+Z4R
 mJRDh0wNQ8Gm89g92/YkHji4jIWlp2fwzCcx5+lZCQ1XdqAiHQARAQABzSZIZWluZXIgS2Fs
 bHdlaXQgPGhrYWxsd2VpdDFAZ21haWwuY29tPsLBjgQTAQgAOBYhBGxfqY/yOyXjyjJehXLe
 ig9U8DoMBQJf9GRVAhsDBQsJCAcCBhUKCQgLAgQWAgMBAh4BAheAAAoJEHLeig9U8DoMSycQ
 AJbfg8HZEK0ljV4M8nvdaiNixWAufrcZ+SD8zhbxl8GispK4F3Yo+20Y3UoZ7FcIidJWUUJL
 axAOkpI/70YNhlqAPMsuudlAieeYZKjIv1WV5ucNZ3VJ7dC+dlVqQdAr1iD869FZXvy91KhJ
 wYulyCf+s4T9YgmLC6jLMBZghKIf1uhSd0NzjyCqYWbk2ZxByZHgunEShOhHPHswu3Am0ftt
 ePaYIHgZs+Vzwfjs8I7EuW/5/f5G9w1vibXxtGY/GXwgGGHRDjFM7RSprGOv4F5eMGh+NFUJ
 TU9N96PQYMwXVxnQfRXl8O6ffSVmFx4H9rovxWPKobLmqQL0WKLLVvA/aOHCcMKgfyKRcLah
 57vGC50Ga8oT2K1g0AhKGkyJo7lGXkMu5yEs0m9O+btqAB261/E3DRxfI1P/tvDZpLJKtq35
 dXsj6sjvhgX7VxXhY1wE54uqLLHY3UZQlmH3QF5t80MS7/KhxB1pO1Cpcmkt9hgyzH8+5org
 +9wWxGUtJWNP7CppY+qvv3SZtKJMKsxqk5coBGwNkMms56z4qfJm2PUtJQGjA65XWdzQACib
 2iaDQoBqGZfXRdPT0tC1H5kUJuOX4ll1hI/HBMEFCcO8++Bl2wcrUsAxLzGvhINVJX2DAQaF
 aNetToazkCnzubKfBOyiTqFJ0b63c5dqziAgzsFNBF/0ZFUBEADF8UEZmKDl1w/UxvjeyAeX
 kghYkY3bkK6gcIYXdLRfJw12GbvMioSguvVzASVHG8h7NbNjk1yur6AONfbUpXKSNZ0skV8V
 fG+ppbaY+zQofsSMoj5gP0amwbwvPzVqZCYJai81VobefTX2MZM2Mg/ThBVtGyzV3NeCpnBa
 8AX3s9rrX2XUoCibYotbbxx9afZYUFyflOc7kEpc9uJXIdaxS2Z6MnYLHsyVjiU6tzKCiVOU
 KJevqvzPXJmy0xaOVf7mhFSNQyJTrZpLa+tvB1DQRS08CqYtIMxRrVtC0t0LFeQGly6bOngr
 ircurWJiJKbSXVstLHgWYiq3/GmCSx/82ObeLO3PftklpRj8d+kFbrvrqBgjWtMH4WtK5uN5
 1WJ71hWJfNchKRlaJ3GWy8KolCAoGsQMovn/ZEXxrGs1ndafu47yXOpuDAozoHTBGvuSXSZo
 ythk/0EAuz5IkwkhYBT1MGIAvNSn9ivE5aRnBazugy0rTRkVggHvt3/7flFHlGVGpBHxFUwb
 /a4UjJBPtIwa4tWR8B1Ma36S8Jk456k2n1id7M0LQ+eqstmp6Y+UB+pt9NX6t0Slw1NCdYTW
 gJezWTVKF7pmTdXszXGxlc9kTrVUz04PqPjnYbv5UWuDd2eyzGjrrFOsJEi8OK2d2j4FfF++
 AzOMdW09JVqejQARAQABwsF2BBgBCAAgFiEEbF+pj/I7JePKMl6Fct6KD1TwOgwFAl/0ZFUC
 GwwACgkQct6KD1TwOgxUfg//eAoYc0Vm4NrxymfcY30UjHVD0LgSvU8kUmXxil3qhFPS7KA+
 y7tgcKLHOkZkXMX5MLFcS9+SmrAjSBBV8omKoHNo+kfFx/dUAtz0lot8wNGmWb+NcHeKM1eb
 nwUMOEa1uDdfZeKef/U/2uHBceY7Gc6zPZPWgXghEyQMTH2UhLgeam8yglyO+A6RXCh+s6ak
 Wje7Vo1wGK4eYxp6pwMPJXLMsI0ii/2k3YPEJPv+yJf90MbYyQSbkTwZhrsokjQEaIfjrIk3
 rQRjTve/J62WIO28IbY/mENuGgWehRlTAbhC4BLTZ5uYS0YMQCR7v9UGMWdNWXFyrOB6PjSu
 Trn9MsPoUc8qI72mVpxEXQDLlrd2ijEWm7Nrf52YMD7hL6rXXuis7R6zY8WnnBhW0uCfhajx
 q+KuARXC0sDLztcjaS3ayXonpoCPZep2Bd5xqE4Ln8/COCslP7E92W1uf1EcdXXIrx1acg21
 H/0Z53okMykVs3a8tECPHIxnre2UxKdTbCEkjkR4V6JyplTS47oWMw3zyI7zkaadfzVFBxk2
 lo/Tny+FX1Azea3Ce7oOnRUEZtWSsUidtIjmL8YUQFZYm+JUIgfRmSpMFq8JP4VH43GXpB/S
 OCrl+/xujzvoUBFV/cHKjEQYBxo+MaiQa1U54ykM2W4DnHb1UiEf5xDkFd4=
In-Reply-To: <ZfxvhCRSQ-Cx_Spn@smile.fi.intel.com>

This is a multi-part message in MIME format.
--------------m0RWbuUpESm8n0qcTjyl3sUB
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.03.2024 18:33, Andy Shevchenko wrote:
> On Thu, Mar 21, 2024 at 12:59:59PM +0100, Heiner Kallweit wrote:
>> On 21.03.2024 12:20, Andy Shevchenko wrote:
>>> On Wed, Mar 20, 2024 at 10:26:06PM +0100, Heiner Kallweit wrote:
>>>> On 20.03.2024 22:07, Andy Shevchenko wrote:
>>>>> On Wed, Mar 20, 2024 at 09:21:34PM +0100, Heiner Kallweit wrote:
>>>>>> On 20.03.2024 16:59, Andy Shevchenko wrote:
>>>>>>> On Wed, Mar 20, 2024 at 03:56:29PM +0100, Heiner Kallweit wrote:
> 
> ...
> 
>>>>>>>   grep 0000001b /sys/kernel/debug/pinctrl/*/pins
>>>>>>
>>>>>> pin 3 (GPPC_B_3) 3:INTC1057:00 GPIO 0x80100102 0x0000001b 0x00000000 [LOCKED tx]
>>>>>> pin 82 (GPP_F_7_EMMC_CMD) 135:INTC1057:00 GPIO 0x44000300 0x0000001b 0x00000000 [LOCKED full, ACPI]
>>>>>> pin 182 (GPPC_C_13) 269:INTC1057:00 GPIO 0x44000300 0x0000001b 0x00000000 [LOCKED full, ACPI]
>>>>>
>>>>> I was not correct, the value to grep is '0000[0-3][0-9a-f]1b' as there pull
>>>>> up/down can be enabled.
>>>>>
>>>> Result is the same
>>>>
>>>>> Nevertheless from the above the pin 3 is one that is enabled as GPIO input with
>>>>> RTE 27 and direct IRQ.  If it's a culprit, try to add in the pinctrl-intel.c at
>>>>> the end of .probe:
>>>>>
>>>>> 	{
>>>>> 		void __iomem *padcfg0;
>>>>> 	        u32 value;
>>>>>
>>>>> 		padcfg0 = intel_get_padcfg(pctrl, 3, PADCFG0);
>>>>>
>>>>> 		value = readl(padcfg0);
>>>>> 		value |= PADCFG0_GPIOTXDIS;
>>>>> 		value |= PADCFG0_GPIORXDIS;
>>>>> 		writel(value, padcfg0);
>>>>> 	}
>>>>>
>>>>> If it helps, it will show the BIOS bug (likely).
>>>>>
>>>> Wow, this indeed fixes the issue for me. Thanks a lot!
>>>
>>> Wow! Glad to hear this.
>>> (Side note, can you test the patch against idma64 I sent yesterday?
>>>  Tested-by tag will be appreciated!)
>>>
>> Done, sent the Tested-by
> 
> Thank you!
> 
>>> We may try to have the quirk in the kernel, but it might be (quite) tricky
>>> (see the link below).
>>>
>>> Can you share `acpidump -o n100-tables.dat` (the file) somewhere?
>>> I would like to see if this pin is anyhow being mentioned in the DSDT.
>>>
>> Attached. Compressed file isn't that big, so hope it's ok to send it
>> as an attachment.
> 
> Yes, got it.
> 
> Can you also share the output of
> 
> 1) `dmesg` (when kernel command line has 'ignore_loglevel apic=debug');
attached
> 2) `lspci -nk -vv`;
attached
> 3) `grep -H 15 /sys/bus/acpi/devices/*/status`?
> 
/sys/bus/acpi/devices/ACPI0003:00/status:15
/sys/bus/acpi/devices/ACPI000C:00/status:15
/sys/bus/acpi/devices/ACPI000E:00/status:15
/sys/bus/acpi/devices/device:4a/status:15
/sys/bus/acpi/devices/device:86/status:15
/sys/bus/acpi/devices/device:87/status:15
/sys/bus/acpi/devices/device:88/status:15
/sys/bus/acpi/devices/device:8a/status:15
/sys/bus/acpi/devices/device:8b/status:15
/sys/bus/acpi/devices/device:8c/status:15
/sys/bus/acpi/devices/INT33A1:00/status:15
/sys/bus/acpi/devices/INTC1041:00/status:15
/sys/bus/acpi/devices/INTC1048:00/status:15
/sys/bus/acpi/devices/INTC1057:00/status:15
/sys/bus/acpi/devices/INTC1070:00/status:15
/sys/bus/acpi/devices/INTC1099:00/status:15
/sys/bus/acpi/devices/MSFT0001:00/status:15
/sys/bus/acpi/devices/OVTI01AS:00/status:15
/sys/bus/acpi/devices/OVTID858:00/status:15
/sys/bus/acpi/devices/PNP0103:00/status:15
/sys/bus/acpi/devices/PNP0C09:00/status:15
/sys/bus/acpi/devices/PNP0C0C:00/status:15
/sys/bus/acpi/devices/PNP0C0D:00/status:15
/sys/bus/acpi/devices/PRP00001:00/status:15
/sys/bus/acpi/devices/TXNW3643:00/status:15
/sys/bus/acpi/devices/TXNW3643:01/status:15

>>>> For my understanding: Shall we (kernel driver) rely on the BIOS to configure
>>>> GPIO's properly?
>>>
>>> Yes, but there are bugs.
>>> You may look, e.g., https://bugzilla.kernel.org/show_bug.cgi?id=214749.
>>>
>>>> Or better assume that GPIO's are in an unknown state on
>>>> driver load and configure them for our needs?
>>>
>>> It depends. But usually (> 99% cases) we rely on the firmware.
>>>
>>>> IOW: If we assume that other systems may have similar issues, should
>>>> "some driver" use e.g. the pinctrl API to configure relevant pins?
> 

--------------m0RWbuUpESm8n0qcTjyl3sUB
Content-Type: application/octet-stream; name="dmesg.log.xz"
Content-Disposition: attachment; filename="dmesg.log.xz"
Content-Transfer-Encoding: base64

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
Z/sCAAAAAARZWg==
--------------m0RWbuUpESm8n0qcTjyl3sUB
Content-Type: application/octet-stream; name="lspci.log.xz"
Content-Disposition: attachment; filename="lspci.log.xz"
Content-Transfer-Encoding: base64

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
xNACAJJOVJKxxGf7AgAAAAAEWVo=

--------------m0RWbuUpESm8n0qcTjyl3sUB--

