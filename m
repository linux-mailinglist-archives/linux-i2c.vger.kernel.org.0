Return-Path: <linux-i2c+bounces-1901-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E6C85E879
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 20:57:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED4CF1C20BDD
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Feb 2024 19:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0261292C2;
	Wed, 21 Feb 2024 19:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aymdnGFd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77EA85C52
	for <linux-i2c@vger.kernel.org>; Wed, 21 Feb 2024 19:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708544765; cv=none; b=WEE/BfjoOouNI9m6E51TuKM3FKneW8RcX1MZ1Gflp3vTE6ZFXNYbs0eQMjug0TV/qMA3c6Tpm0DFyJxWqdkqDmF0nb5RD723mvzGukqOYkwzxje1rsiDkC5PcU7ard1GigYQ+ASs4z6VpgOk1kZlzle47UreqiA5fiRIbghSlCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708544765; c=relaxed/simple;
	bh=7Ll6/TBA8nCgCmrbxkZmAOSm4KIDyOEkO3qizEz4MfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Spzm7WWFrx2BcqjFKiNTEaUuU1XqKCa3rzqYxuYYqob2aqI6lPf57EsDE6pezXDbaQ1axB1pxDbTQuek9y4uyfu9cDG2kRI+dcV9WUBMJ6g3UB9sD05NidRp6Di5jm1hl9kU4qm6IAqL8gWkxspbN8oX7JyfYyp9/ECsaubXW98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aymdnGFd; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-412700a7207so7476225e9.2
        for <linux-i2c@vger.kernel.org>; Wed, 21 Feb 2024 11:46:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708544762; x=1709149562; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=TfCjlVnEbtTBaaLhm4WkHZ1M0zJcudvMOmzz9GwWNcs=;
        b=aymdnGFdesnmtr8T5Pm78A5gBfLHSv/3oeRkrO0n8TKcv2fI0nWlgR7AcigSJbxbRk
         /Wpx6wJPjdcKrsIP2L/tpjbpBB6gH3+u8WIz3G+chCYrRTNjR+qgt7kiVQ5yIF5+Mks5
         uhcVBUEJFhanTaWj7AHZKqWM7KP775fK0vBuTfZgx+hxaeT46Q84i0znBF0rV/oIG34J
         CGrP8duYh16NqF933E+3bBST4LffPGBLuAl8JK4VWkfbSdNfbxYOP8a9FdoH6pqaJRkh
         0PjP57ffoMT+/qgwDXMf91MOzu5AryK7DKzhZGXHWTDQNuUlTNhzrNpTepjFRMIXtPmC
         L0mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708544762; x=1709149562;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TfCjlVnEbtTBaaLhm4WkHZ1M0zJcudvMOmzz9GwWNcs=;
        b=wU4djmvuySUWRHR2aBJU8uhS9aLXeXl4fGS6MFUSS6E+0iYTnfYB0b7Rmb352fMheh
         Euet8c4zgLUaUxBxU1wHHM1knWh6F2Et0KvkhCKkd0c/4sv4XcXVbSvxB6qSv2nZpuLj
         fzO6CdNVg7ia+PiDWSIHoE4XUSyxsRbP5dlDb24qm/AtD3C66USH80mIFu1d9H5a6ESl
         e95JuVu5htp4j50Y/gXF/yhjWa5L4xjtVBJXQyGvarHkWbXoRTGOjHRpM9748kqEXEBp
         OZBAoOraBNyiexanvirzWx+K+ChlMl61RDJYUl2qc9/VYi2Lx1xFHUY/UkxzVPPNaDj/
         lmdw==
X-Forwarded-Encrypted: i=1; AJvYcCV+Xo6uJ589yUWjfAdnz7723FjKYvsrfky/+oBBhGMmtmcrcRQeMn5N9LhOxnc+868XvcOTqdVpZMEEVHXRJDw0zDdIHs+maJ+e
X-Gm-Message-State: AOJu0Yy1z7lVIdLrCxJ948tuUYvGcaVjuGroS5gELVjOcJWEvZOUVBB7
	kM6VvClBXEoOihjzbnP5DghMUEMW5MfMUZT9wna6itVTpIkd7yiJ
X-Google-Smtp-Source: AGHT+IH1laR5cPPKw6MGaihhhrl0DfV2FoqBOzcxaXxFP6zk4bdDjL69Ojz8vbOUmaLvNzZvpSo7aw==
X-Received: by 2002:a05:6000:22f:b0:33d:409b:5738 with SMTP id l15-20020a056000022f00b0033d409b5738mr7162375wrz.26.1708544761692;
        Wed, 21 Feb 2024 11:46:01 -0800 (PST)
Received: from ?IPV6:2a01:c22:6e67:5300:9dc5:383f:2ded:f0d5? (dynamic-2a01-0c22-6e67-5300-9dc5-383f-2ded-f0d5.c22.pool.telefonica.de. [2a01:c22:6e67:5300:9dc5:383f:2ded:f0d5])
        by smtp.googlemail.com with ESMTPSA id e6-20020adfa446000000b0033d76a5bec1sm3664967wra.15.2024.02.21.11.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 11:46:01 -0800 (PST)
Message-ID: <254ad327-3956-4fe5-866a-23653967506a@gmail.com>
Date: Wed, 21 Feb 2024 20:46:00 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] i2c: Support i2c_register_spd() on multiplexed bus
 segments
To: Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Peter Rosin <peda@axentia.se>,
 Peter Korsgaard <peter.korsgaard@barco.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <9f37f64e-f5b8-4928-8716-6d2846c2688a@gmail.com>
 <ZdYwuELMH0r8EFU7@shikoro>
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
In-Reply-To: <ZdYwuELMH0r8EFU7@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 21.02.2024 18:19, Wolfram Sang wrote:
> Hi Heiner,
> 
>> Note: i801 creates the mux platform device, loading and probing of the
>> mux driver may be asynchronous. Therefore we can't call i2c_register_spd()
>> for the muxed segments from i801. Instead we have to add a flag to the
>> platform data, so that the mux driver knows it's supposed to call
>> i2c_register_spd().
> 
> Has it been considered to use a bus_notifier and check for
> BUS_NOTIFY_BOUND_DRIVER?
> 
> I'd really like to keep it inside i801 if possible. First, all these
> flags in mux drivers only for this corner case are relatively intrusive.
> Second, selecting SMBUS for I2C_MUX is also a tad too much for my taste.
> 
Right, it's not as clean as I would like to have it.
So far I didn't see any other/better option.

> I understand that removing CLASS_SPD is a worthy goal. So, if all fails
> we could still try this. But I'd think with bus_notifiers it should be
> possible to keep it all in i801.
> 
> Do you think this could work?
> 
Thanks for the hint. I have to admit I wasn't aware of this option.
I'll check and will come back to you.

> Happy hacking,
> 
>    Wolfram
> 
Heiner

