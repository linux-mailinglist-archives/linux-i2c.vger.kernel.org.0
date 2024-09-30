Return-Path: <linux-i2c+bounces-7093-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A024989F1B
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 12:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 24E461C21A56
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 10:09:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 447D018858E;
	Mon, 30 Sep 2024 10:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MF7NjhB4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0AA2D613;
	Mon, 30 Sep 2024 10:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727690992; cv=none; b=TF1HsQ9yp3NwZ3JS7AHqsOo2Rxfzz5jf7eYwrUzW/anGrK+vZWNyyk1I4xIu1UXzihton9jcX/RboSy+AU/vOPyKpUjfAqVFC29vknsHQDCNRrg1dlFCsTdQ0A7WbNsokRN7b+0Sl4S6jMszo57vMOJnUB22akCpxHN1Sf9okCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727690992; c=relaxed/simple;
	bh=7z83m7qir7jZuGxm/6NOrVYo5kRCtN0whP1zE18+j4c=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hvxTsXgAUSUbbWiPZN+orFgNx0ldaqZTk5DNvmu6PRoVT8KdVvpAdqOg8f4LA+HgfjY5iFiGZautDUqwqcaa/QOckOYaQYipjeafKrz4u85TZOdLA2pEZxdi+AiC0nIwSFRe/syQThgl8S9pgl50PBtMR3okP4VwpOJy2ktBEWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MF7NjhB4; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cbbb1727eso36739475e9.2;
        Mon, 30 Sep 2024 03:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727690989; x=1728295789; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5KfSui0aOFe+9UyD1nFNDOA+zeu1vwSjXbxBufKn/k4=;
        b=MF7NjhB4WvF+Kxvg0bVxncL1EDfVlXNretP5o6CM8DIe/qTiQCOonk93CykSHBI9k8
         XF5bt3AFoWbvxFKkQbfr8WMSUB/hwNl4mULevFhVxOYToOLshePjD/YyfbxCgnA/ZuV6
         GhWaFhu5ScWFFBaPSxxzh8Hra0rbUpJEsyB1FVykhHQ9hqIKkO7gjN9WuSCItC88YBB3
         eV3zfD6YpdCgOihA7XPxAOUuDcOqNlhKSngYGPnOqFGecyytpYZAxbnGeYm2omxcpe4W
         fWkcWLEhwRKzsVXEIWEq/PXOirV6S965CtJinghaLr8khdjyLdpsSNWirXhKvxLGHPCc
         K/Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727690989; x=1728295789;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5KfSui0aOFe+9UyD1nFNDOA+zeu1vwSjXbxBufKn/k4=;
        b=E9jMb2AfqkQ0JeWvvL0tDnAFrEaxi6SZmT5zMs59xj+3nvXAfac4LZ6LOS6AO7pae3
         RhUO2s4Kak/CmwPuVMC0Y7iTRLW/nPbyF0JViSu1ZmaDdalCjvrssMWskUiYuTGa1b4t
         RYd3Shi5MUR2q28L93ztPdPkIV/AJlArwdluBdw/Y8+6TXVv6gDcqqBrY4dqiAxBy5U7
         cQzmbLISNDOKcM85juxF/eaczyLf9X1mN6Hhwr/F5H85XOH4zFfi2ikdyhfp/QtUDOn8
         amREt9oHTA9R/V0tKszlEQ6bm5Ldj/AGc3vFo2KfZ13mU1+QHVMWsOCwFu2jndll1RN8
         GC+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUaK9Ac2Vj7kPZ5bInyuB9GvplDhw5L8nK+VM37a9vIVniovwVjdg1JduPYfdVSB8qVtc9qD3XA2yb4vyI=@vger.kernel.org, AJvYcCXQ4qh0vjLENyzDG6+FhfDVK14YZF3COZD3TV91Cr8qFngX37IC7pDVBGpn8pP4FlRRRxEPfAMCSFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRufcVwjYdWBWlIZBkDfZ8EP7UmxMYogFduyKKG1/GZos/x4ev
	+b0YGgY4t4i2V6y13F9fgyOHgzAHVdpegJv53LdWc+G/ghCwcl3E
X-Google-Smtp-Source: AGHT+IHPBHonA75orOZDP/2r2hgxhT5OHWTQvDgalt4VBuLCT9NbjuF3PQ5+1jssVnAH9TTiuUDsZg==
X-Received: by 2002:adf:fe51:0:b0:37c:cf72:f248 with SMTP id ffacd0b85a97d-37cd5b10519mr6805304f8f.50.1727690988508;
        Mon, 30 Sep 2024 03:09:48 -0700 (PDT)
Received: from ?IPV6:2a02:3100:a43d:aa00:b1de:cfd2:c01d:61dd? (dynamic-2a02-3100-a43d-aa00-b1de-cfd2-c01d-61dd.310.pool.telefonica.de. [2a02:3100:a43d:aa00:b1de:cfd2:c01d:61dd])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-42f57debf07sm96965135e9.22.2024.09.30.03.09.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 03:09:47 -0700 (PDT)
Message-ID: <18306ded-6451-4880-9f74-6bceb0f26dea@gmail.com>
Date: Mon, 30 Sep 2024 12:10:03 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] i2c: Replace lists of special clients with
 flagging of such clients
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
 linux-sound@vger.kernel.org
References: <3982b2a6-975e-40d2-bf02-2155e5c36c14@gmail.com>
 <ZtQ0KMWUk9iAUCCl@shikoro>
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
In-Reply-To: <ZtQ0KMWUk9iAUCCl@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.09.2024 11:30, Wolfram Sang wrote:
> On Thu, Aug 22, 2024 at 09:45:37PM +0200, Heiner Kallweit wrote:
>> So far lists are used to track special clients, i.e. auto-detected and
>> userspace-created clients. The same functionality can be achieved much
>> simpler by flagging such clients.
> 
> This looks promising and I like the idea from a high-level perspective.
> Need to dive into the details. However, I think this is 6.13 material. I
> want to let it cook in linux-next for a full cycle.
> 
Now that 6.12-rc1 is out: Are you going to push this to linux-next?

