Return-Path: <linux-i2c+bounces-3358-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8DC8B884A
	for <lists+linux-i2c@lfdr.de>; Wed,  1 May 2024 11:57:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 55807284856
	for <lists+linux-i2c@lfdr.de>; Wed,  1 May 2024 09:57:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1550851036;
	Wed,  1 May 2024 09:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fzrg6AGB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46EC74204E;
	Wed,  1 May 2024 09:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714557458; cv=none; b=d6JVldnoxc25rcIzIZULQV+0mysgNG3wCcg+xi+wjkUj5hAGTuZwoKLkxhweL04bdpBjzsC5vvHrbth3HZ5Qlv2OiuwQ0e2QkUT3zCeS8J0m+3ucllrQlbXDqmUvlrBpWz/MIR2CNP74qbu383saiW2N7rUthqR+Iiso8qPa200=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714557458; c=relaxed/simple;
	bh=uHjuZymU8rJM3QgibLsF3vk/zLyr+vaHm37zuhvjp4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Yqcl2oZeVXRWt+vWHqyl+b6DIxoAtFYpH7ubrvgUiiLO8n6r9Vfl0sOlRPhz7TOIsMAL6/qpST60+20U95TG1mY47ghCvDOCvEOS3uGsT7Xnz56TOF9ij3v9qUH4KvQKlv3QjtFYEgQwSZkXTU4TtJS2uZTm4gHz8ITZlM6Omq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fzrg6AGB; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-34d91612218so325693f8f.0;
        Wed, 01 May 2024 02:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714557455; x=1715162255; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4oDIOb3C5vhDh/1VRCUSrzOSaVfVN4qzH6+BtXKOoMo=;
        b=Fzrg6AGBMz5xNel3SEk7PLP8DReBpaSCC07y6nAlx6IHh0QP/QLUmSyWpj9Tc2lTUw
         YC7SGePf4hv+RMnZnodDNoPTCHepZl3eZftt/x4m1Nu2sjU+UMrRIZvARyO8hxY/I1h9
         HB74Y09rYgSUajZ8brGSx7IwsintRfH9hu+PudL6ZLGFHy4nxZqr+HMJH7ORK3/Z8KFj
         mQWuK5rZThYNP7UpaYL2ObTO+9QO16WG+LmZK3JGmPCtgWw4L+s7oSuHO/Ec3DhqwHmJ
         7AZhSFph4U7AAMffvVEX6ZFyQcIDpYQADfL474K16VYdqRLbTrqWtJ8eZz0Up2EzkWUT
         wUGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714557455; x=1715162255;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4oDIOb3C5vhDh/1VRCUSrzOSaVfVN4qzH6+BtXKOoMo=;
        b=TUmOruC4QSUVU1j5jz7qdsX7LirKOdccELH2JLySQHFyThoEDoNxaNqRJc1vm+GTVp
         f53Gq/ecA4HznQuR2CFfAx2V5/HoNHZLp9Hqy0rxqk2Y1xceljZNGLS2Y7KC5RrxcbCu
         flUUK6oGW3bCv6u+wUpWjQEa6wnM37FH6lV4Xg8D50THTFecZITBAYNliOJtmpd1k8V3
         hQBMwyo7qCEM4KTl9rsEAg5wwBI5hUUOllVYd/r8ny0U42kS7QhZAHdnoAt9eRLWvnBF
         ooiII7xKKQR5AMxWzv9+EDQNlLH9IOzOZlZzx6ZdQxfMCwglIUr5uslyZo5rRK4mRzx+
         TDKA==
X-Forwarded-Encrypted: i=1; AJvYcCUp7nd8ipioRxqS2MX3bhsqjip07uJtTug1VQFOqR5KoNwH18j98XPmjgPhIwUQXegYjFmypvDYSJSq+CEKPhcylGW3rJ0Ojmxo/N3zxyc9TE8DvbaGMMTYe5yar7e5C7mjMf9HL1FD
X-Gm-Message-State: AOJu0Yxi9drMd02xeD4hkNEyr40PwUSh0ZS5uSBZcr37U0kq2EuyVFpP
	G64L/KtcwP7WV02Kbna4a58U3oR7/nn6sN5wezXhpaDc6HSkbw/xDe4iWg==
X-Google-Smtp-Source: AGHT+IFfBytAiEHhq+M5kUrhVxE8T2wIQuj0VPVrgjphB77it1u4fY9kvSE2l6yxNOpIklwap9WQvw==
X-Received: by 2002:a5d:44cd:0:b0:34c:78dd:9348 with SMTP id z13-20020a5d44cd000000b0034c78dd9348mr1676972wrr.23.1714557455120;
        Wed, 01 May 2024 02:57:35 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6e83:f200:4039:91f4:350:8df8? (dynamic-2a01-0c22-6e83-f200-4039-91f4-0350-8df8.c22.pool.telefonica.de. [2a01:c22:6e83:f200:4039:91f4:350:8df8])
        by smtp.googlemail.com with ESMTPSA id e18-20020a056000195200b003462fec9f5asm33962966wry.62.2024.05.01.02.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 May 2024 02:57:34 -0700 (PDT)
Message-ID: <6a8f1302-1905-4bc4-84b0-a00558ebecdb@gmail.com>
Date: Wed, 1 May 2024 11:57:34 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Regression] dmesg warnings after "i2c: smbus: Support up to 8
 SPD EEPROMs"
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
 Jean Delvare <jdelvare@suse.de>, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, ruirui.yang@linux.dev,
 Wolfram Sang <wsa@kernel.org>
References: <53582ef1-6d05-4379-a445-5f879cd676b8@o2.pl>
 <20240501072744.2xm4v3idjjsehwkq@ninjato>
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
In-Reply-To: <20240501072744.2xm4v3idjjsehwkq@ninjato>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.05.2024 09:27, Wolfram Sang wrote:
> 
> Adding Heiner...
> 
> On Tue, Apr 30, 2024 at 09:39:03PM +0200, Mateusz Jończyk wrote:
>> Hello,
>>
>> I have received a regression report on
>> commit 13e3a512a29001c ("i2c: smbus: Support up to 8 SPD EEPROMs")
>> as I was subscribed to some kernel Bugzilla thread and I'm posting it here
>> to make you aware of it.
>>
>> This thread was
>>
>> Bug 213345 - i801_smbus: Timeout waiting for interrupt, driver can't access SMBus 
>>
>> ruirui.yang@linux.dev on 2024-04-19 08:22:57 UTC wrote:
>>> I got similar issue on thinkpad X1 gen9 with latest 6.9.0-rc4+
>>> Git bisect the first bad commit is "13e3a512a29001c  i2c: smbus: Support up to 8 SPD EEPROMs
>>> "

Thanks for the report. Repeating what I just commented in bugzilla:

The mentioned commit showed up in 6.8 only, but the problem reports
date back to at least 5.12. Original bug report in bugzilla is from
2021. So I don't think this commit is the culprit.

What is the latest known good kernel version?
How about LTS version 6.6?

>>>
>>> modprobe without param:
>>> [ 1290.401393] i801_smbus 0000:00:1f.4: SPD Write Disable is set
>>> [ 1290.401486] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
>>> [ 1290.403340] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
>>> [ 1290.403383] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
>>> [ 1290.403410] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
>>> [ 1290.403437] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
>>> [ 1290.403465] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
>>> [ 1290.403492] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
>>> [ 1290.403519] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
>>> [ 1290.403546] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
>>>
>>> with param 
>>> [ 1314.568785] i801_smbus 0000:00:1f.4: Interrupt disabled by user
>>> [ 1314.568837] i801_smbus 0000:00:1f.4: SPD Write Disable is set
>>> [ 1314.568894] i801_smbus 0000:00:1f.4: SMBus using po*lling
>>> [ 1314.570230] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
>>> [ 1314.570257] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
>>> [ 1314.570283] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
>>> [ 1314.570310] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
>>> [ 1314.570336] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
>>> [ 1314.570362] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
>>> [ 1314.570389] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
>>> [ 1314.570415] i801_smbus 0000:00:1f.4: SMBus is busy, can't use it!
>>
>> Link: https://bugzilla.kernel.org/show_bug.cgi?id=213345
>>
>> The param mentioned was i2c-i801.disable_features=0x10, which disables interrupt usage
>> of this driver.
>>
>> Please decide if this is serious enough to warrant a revert.
>>
>> Greetings,
>> Mateusz
>>
>>
Heiner


