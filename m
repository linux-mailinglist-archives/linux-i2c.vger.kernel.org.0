Return-Path: <linux-i2c+bounces-2116-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B79586F25B
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Mar 2024 21:21:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C82D1B21DDE
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Mar 2024 20:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB23C405FF;
	Sat,  2 Mar 2024 20:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PkpqE6bh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57372BAEB
	for <linux-i2c@vger.kernel.org>; Sat,  2 Mar 2024 20:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709410910; cv=none; b=kevlLPG+wmvOYV/Tql9xpNBbCvBUNpV0hMsjybSmA7nC4KR6Wf8klYbARKGIlczImF5Wim3Fy9TZ+JXJGIINcEh72y9ps7EE0LvqtbObCytpTfFJM5T5CZPnqorGdIzVEpsKfgMxj2hVAiJ2x5aTRCJs2aS/9wd40hOt12WGxD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709410910; c=relaxed/simple;
	bh=acUbXGL6mAUKTDPsMrRrnAAVA5csFV5iMoQV3jYsLTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Ng0ZNwTKYVYYq23Itas+2KawS7+5v6D4HXPcblaJV6ZqHxJbNFiSWAIpJofh/puGvZBVdiE4y67hm0kB3NVpQnqrIPyw10H4GogVEEIgQAynpEzBydnCrhEBzBJTB/lD+QBoXuQ4bWUUnOUdl/Bd1XG544FoVukn89oMat3PyPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PkpqE6bh; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2d29111272eso47671601fa.0
        for <linux-i2c@vger.kernel.org>; Sat, 02 Mar 2024 12:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709410907; x=1710015707; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=54Mzq0OKuoMdmrt/ER+io9I2K2NMjxf8XXs57mT/awg=;
        b=PkpqE6bhE4yoP8t5R0wRCEcBmYit+qcT1N9XLa5lP0cRLuN+jxDsqLW0tB7g9qNhD8
         cYwXSCjWxZ/F1Vyz3/KfI8V7Tl9OUvNDVL7oRfAqPtwUAkFIHq6W7lAhUTxI72n2Iodf
         cpLpvT/IKb0Tl/flJfcNX8gQYhpTcnnUPDBpUaay+X0mjXbNi/Fgw+DOjw9EQn3f0pkt
         OsWZgSwjC+0Iu3U/CnJbR2M5MNGMkCVrt5GE2hFKQjpSAvzvectLxOCVaIs0m5NDkqwG
         qaDmlC/UBMWaIbqIBigg5P6nziaseMtQCEJgUPjO77ntqqqk8fU8YQ4MJsoJvt9b5bSp
         35KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709410907; x=1710015707;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=54Mzq0OKuoMdmrt/ER+io9I2K2NMjxf8XXs57mT/awg=;
        b=mInwfqxdLS9vOQ3B3gjhl44nEIrH4j11MFhjEg1Uqv7ah+Fj4aiqKAy+MLSu4BwXOo
         4pqPpkB7NZq++5A7dnLMpsDCgxlI5QGAG6/IMDaagrq12sfrlrjhs36z7Ro5Id6JEXyH
         EF9TWo/VqMe/Cvl1tmj/E8ugAFDAlnALgWGQKFkHk0SfcsK+5h2iV+bny7vCh0HZ+Rqm
         QU9Y4GCwWnDuQPl6SlnduywjKJf9fhf+8okHH4I3yhhu6RMpIr/oj4TDo7MbBlniu7xn
         b53MmHYHv3fnMwV/rIe9wKJ9EeOIibQS+Z6sx9R210K07v4sv8NgvUcTqyd+zTti69NA
         WXuA==
X-Forwarded-Encrypted: i=1; AJvYcCUqI4aF1QiCsbXs7aip85Z9S4q4oYakW85CJEhwhr4enyYXS98o+H2/ZZo07tgmKDDBsXtYrcA8FNeHzhNNYwAbA/jRxR5+O1NO
X-Gm-Message-State: AOJu0YxyQ9pZT8lWrEXYxMo2LTd6lUGTQutIKPE3szumUinJ4DFX62vs
	2XS09EbOcuGkz4YeLpEA3puiWodwc2+xZW+nOkrJhabwnphUEaKK
X-Google-Smtp-Source: AGHT+IGMh7hlPKcx2q/fhc7OzV+6Ak4BFasWLQlVbOBH2wz5fvrXj5xUQ45rr0+vKo9aOvKMUWidUQ==
X-Received: by 2002:a2e:a272:0:b0:2d2:f394:fc19 with SMTP id k18-20020a2ea272000000b002d2f394fc19mr2768120ljm.27.1709410906585;
        Sat, 02 Mar 2024 12:21:46 -0800 (PST)
Received: from ?IPV6:2a01:c23:bcce:a400:2519:2036:7f0:6005? (dynamic-2a01-0c23-bcce-a400-2519-2036-07f0-6005.c23.pool.telefonica.de. [2a01:c23:bcce:a400:2519:2036:7f0:6005])
        by smtp.googlemail.com with ESMTPSA id v26-20020a50d59a000000b005643b41d128sm3013130edi.5.2024.03.02.12.21.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Mar 2024 12:21:45 -0800 (PST)
Message-ID: <b06a0a71-c30e-4288-b648-fba2c75a5131@gmail.com>
Date: Sat, 2 Mar 2024 21:21:45 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/2] i2c: smbus: Prepare i2c_register_spd for usage on
 muxed segments
Content-Language: en-US
To: Wolfram Sang <wsa@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Jean Delvare <jdelvare@suse.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <eac54582-44f6-4101-93d9-012eb4ee3241@gmail.com>
 <db378364-018e-4e6b-8e41-8cdd21ce2afd@gmail.com> <ZdxoVALRR8rz23Z5@shikoro>
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
In-Reply-To: <ZdxoVALRR8rz23Z5@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2024 11:32, Wolfram Sang wrote:
> Hi Heiner,
> 
>> +	/* Check whether we're a child adapter on a muxed segment */
> 
> The comment describes the 'if' but not 'then'. How about sth like "If we
> are a child on a muxed segment then limit slots to..."?
> 
OK, this would be better.

>> +	if (i2c_parent_is_i2c_adapter(adap)) {
>> +		slot_count = 8;
> 
> I don't know much about DMI. I just noticed that there are no printouts
> in this code path. Will there be one for the parent?
> 
With the patch as-is there's we omit printout for systems with > 8 memory
slots. I'm not aware of any way to find out how many memory slots belong to
a specific child bus segment. So all we could do is print per child segment
how many slots are populated. But we have a printout per populated slot
already: "Successfully instantiated SPD at 0x%hx\n"
So IMO we don't loose any relevant info.

>> +	} else {
>> +		if (slot_count > 8) {
>> +			dev_err(&adap->dev,
>> +				"More than 8 memory slots on a single bus, mux config missing?\n");
> 
> With this error message, I as a user would think I need to setup a mux
> config somewhere. But it is missing from DMI, or? Then, we should
> probably use even FW_BUG in the message?
> 
Actually a developer has to add the config to i801's mux_dmi_table[].
So yes, we should change the message to something like:
"More than 8 memory slots on a single bus, contact i801 maintainer to
add the missing mux configuration"

> Happy hacking,
> 
>    Wolfram
> 
Heiner

