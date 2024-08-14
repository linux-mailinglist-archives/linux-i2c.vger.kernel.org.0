Return-Path: <linux-i2c+bounces-5411-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 430E7952312
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 22:07:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B625B2207E
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Aug 2024 20:07:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D6C61AED23;
	Wed, 14 Aug 2024 20:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AdDX04iF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B65011BBBD9
	for <linux-i2c@vger.kernel.org>; Wed, 14 Aug 2024 20:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723666058; cv=none; b=a9z5+T1pmItHLwwoonZf79sPj2PM4HNxCrVy23pOzw21DSkc/NfztDQUeHi1C8N5G5k4BS6TFXYwRCa/r43j7sN9/D0uv39qQ8d0zev3EC8Vd6FtEGXi8cUGISuOdPk/csGWg7t1Oqg3VvUaESetB9hT5/iPSFcgGs84F6vMk+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723666058; c=relaxed/simple;
	bh=CX65OWsHa7kzdB32ajULgwGIPtd8Vf0gQejfYvctHvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fRFSHZ23PsZ9KuSft18LRagSghcHiGq7MneLcrjhyQSudPewF6ZPfYC2kbA3S2vULRh4fxppb4dZcF3XK+k/v4B3DGbSPWe0oLXlJwhRXp8RQqRSvHO/0lUBcO1Qd1htf+py9AI16tHfz2S5P/5egtCUMM9MHxBLwEP3yb7FsH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AdDX04iF; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42816ca797fso1015645e9.2
        for <linux-i2c@vger.kernel.org>; Wed, 14 Aug 2024 13:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723666055; x=1724270855; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=j14weULwMQ/W5wQPbeu/dqItzb+GIueftvPFVJKkYYY=;
        b=AdDX04iFifFmDi06w0j1kmzK54UzpTD4iYpPKcMjEXlafrs8Ea5EWgK7r873bOzAKi
         2dtS79zgE63aI9sbdGJk15QHY5WrQH4l/hUfHsHHuxQCtrWDE1gqakYD8RzQBRjo+XG3
         ML6PR3NMUMVMaZzNdJlOmTt2UEqtgyJdb0mkDP27OhXGsJEAudfwiKonGtphAOmTkykP
         490PZSj/opj03xczboGSK9BkYdBxna2YA9wgHXCMnaPQ4FDPM/Ia1YxhdhNYp+Zovn2h
         Phwlg6kgI5E3Xb7e1c+jPjoibhjhLuyhnzNAafjvL95OGz3wg5hAbqbY2vmWSuNJ0aEG
         O/hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723666055; x=1724270855;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j14weULwMQ/W5wQPbeu/dqItzb+GIueftvPFVJKkYYY=;
        b=w2TY1J1yTbwalCCJrv9uA4x1wMELXKhayfaNN3o3vlHpJhECB2iBlEKHzDuR7Fa3zQ
         kdSFRam4EFQpbi2dT+qRpPrUhlsBPxlO74vahe+pvBtV7Mb4qR2zafkf72pkxf1CLHiQ
         OAAmn9QgLr9J3bmSawWtF6c9uwfOm8YN/C1fHhO66UKYKiXku3BLpAS5fNRmCnBqzjnp
         OKsUzr+AZzwg7hMsQwXs8YLpRLP0kve5t5crn/fTTJGXG5oAPF7lmZicxa7APPZbb/Y7
         RAcT6Ve6HHgoVKDm1Cs9dvi2SsiCe1KlheTsZouArl6rlJfwuP3GmEj1O2yglsoZ0Gzh
         TBIA==
X-Forwarded-Encrypted: i=1; AJvYcCUPJvIbVo7zlQawGKy1TS14P1bC5B9RNaP6H2rEyEy2zsnBls0CtcLQcei2nULl63Ruz11krGb6ARhYalrjEEvJGPc4SRCMULSU
X-Gm-Message-State: AOJu0Yx59dNknpmGzL1qUPneXw/flymsWZb2e++1CB+GYFNxxpOJIyjy
	dsAsAeunnwI6S438BnGS9AaWlBz/FAXrwPs5UzLfa+Qz7De7Wekpe70irw==
X-Google-Smtp-Source: AGHT+IFwIzuBgmCaPjLs3RTausENoRSgBHMsHL9trSYcD22S+kJ8IaYwGO+VGD9mVvAiMz0315mAEA==
X-Received: by 2002:a5d:6949:0:b0:368:74a8:6c34 with SMTP id ffacd0b85a97d-371777b8591mr2528738f8f.36.1723666054568;
        Wed, 14 Aug 2024 13:07:34 -0700 (PDT)
Received: from ?IPV6:2a01:c22:6f61:0:4d9e:1dd3:f660:6d9f? (dynamic-2a01-0c22-6f61-0000-4d9e-1dd3-f660-6d9f.c22.pool.telefonica.de. [2a01:c22:6f61:0:4d9e:1dd3:f660:6d9f])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-36e4c93708asm13675665f8f.29.2024.08.14.13.07.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Aug 2024 13:07:34 -0700 (PDT)
Message-ID: <7163e4f8-d25b-4a3e-8c9b-fba5ad648302@gmail.com>
Date: Wed, 14 Aug 2024 22:07:33 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: core: Lock address during client device
 instantiation
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Wolfram Sang <wsa@kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 Krzysztof Piotr Oledzki <ole@ans.pl>
References: <3b1964fa-56fd-464f-93d3-98d46c70b872@gmail.com>
 <ZryRqVexisiS-SGp@shikoro>
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
In-Reply-To: <ZryRqVexisiS-SGp@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 14.08.2024 13:14, Wolfram Sang wrote:
> Hi Heiner,
> 
> thanks for tackling this!
> 
>> +static int i2c_lock_addr(struct i2c_adapter *adap, unsigned short addr,
>> +			 unsigned short flags)
> 
> What about just using 'struct i2c_client *client' here as an argument.
> It has all we need and it currently seems unlikely that we need to call
> it from somewhere else where we need this seperation.
> 
I did it this way in the RFC version. Passing addr and flags as separate
arguments is intentional because the current patch is good enough to
prevent the reported issue, but there's still a small chance of races.
Not necessarily as a fix, but as an improvement we may call i2c_lock_addr()
in i2c_detect_address() and i2c_new_scanned_device(), before the call to
i2c_check_addr_busy(). Apart from requiring an unlocked version of
i2c_new_client_device(), this would include calls where separate arguments
are better.

>> +	if (!(flags & I2C_CLIENT_TEN) && !(flags & I2C_CLIENT_SLAVE) &&
> 
> From a pedantic point of view, I don't see a reason for not handling
> those two cases above. I hate to be pedantic because 10-bit mode is

I considered just the case of parallel auto-detection. But right, we can
also have the case that explicit kernel space instantiation and
instantiation from user space race. 

> practically unused (and I am tempted to remove support for it once in a
> while because it makes other solutions clumsy). And the other one is
> super unlikely to happen because the backends do not autoload. However,
> it is theoretically possible if someone loads a devicetree overlay and
> initiates via sysfs at the same time. I liked the solution with the
> bitfield and atomic access, but maybe a linked list is better?
> 
Well, the answer may depend on the definition of better. With a linked
list we may be able to save a few byte in the i2c_adapter struct,
but the code would become more complex. We need a mutex to protect
list operations, and we have to dynamically allocate list elements
consisting of at least the address and a list_head.
Last but not least the check whether an address is locked would become
more complex and expensive.

Even for 10bit addresses the bitmap would have just 128 bytes.
A single list_head has 16bytes (on 64 bit systems), for a mutex
it depends on the kernel config, etc. So we don't gain much
with a linked list.

Not being a politician, but being open for compromises:
We could include slave addresses in the address locking, but still
exclude 10bit addresses. Then the bitmap has only 16 bytes.

> Happy hacking,
> 
>    Wolfram
> 
Heiner


