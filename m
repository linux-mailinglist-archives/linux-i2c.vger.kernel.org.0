Return-Path: <linux-i2c+bounces-9006-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AF612A07853
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 14:58:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 934297A292C
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 13:58:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FD11218EAB;
	Thu,  9 Jan 2025 13:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YyD3lA40"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D96219A68
	for <linux-i2c@vger.kernel.org>; Thu,  9 Jan 2025 13:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736431088; cv=none; b=BTqsIHGIuVGLPyj3+prDGGUp0KFXGwqG1NtTQV1ns6sn9mNS2BsmsVeDWyKu9ZlgKlVtwOLFtG1rseJw/fVzDYvdeFBJdHGJRTI1JfGn6JfLU+jdfHST5CuHbuzFin3AGkxnXH2hONvVVxY24S0OPEnKRG6Gl66YGXWfCIpfz00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736431088; c=relaxed/simple;
	bh=My2YsQ2MBe5szhAobO/ofwHKVf1ArfkeICvsNmAtpYw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gmuXlBEnM65ThTW0YraPlRvfvXMneuwXJGnTAY9J55EB6LPYRn06uWn8r6vMdu88UiIW/9AxQ+eyO3q/GZpi5WK30qK8zFcsIuzeia/eXad86mHMcZyUz/HvyyPHrwOdo/CMhL9/8CtkxBvEcInkbJKnJV7xfQiIVTnB25/qQ1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YyD3lA40; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-436637e8c8dso10852255e9.1
        for <linux-i2c@vger.kernel.org>; Thu, 09 Jan 2025 05:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736431085; x=1737035885; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=JZyeUEWNh79pdXpryS5hoMP1q/p8gV32htGJqnMEj4Q=;
        b=YyD3lA40T3BQ5845SgWCxxGQdwDaerhr1hMeLBi4ETMuCjrutnpAb1dS+ztOZGo9HO
         BhY2TNybP+4bnHMZgI6ZYIcEbkzTawvoBKNswqkouFMzeREPHZB7w0K5tFDouXn3DX+w
         XBTqndnbpV1SwZ9kZ1523dxyzh0rqMR+9pkHAY6Qtw9qnO00bAZF5oLbc+6RH366ZL1s
         5CNLEPoqfE5NskjhEYoOCJvnSYoBfJO+lRbzs/CVkiPL7kxJjRkq/OMgkNnhcXpw+41z
         9Z3ltk+ZKJy+amwtko+G66YnKhmlzVXwRhJI0eNzsHdXGgj/8AWFosziL/1lzEzbVREQ
         9Aiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736431085; x=1737035885;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JZyeUEWNh79pdXpryS5hoMP1q/p8gV32htGJqnMEj4Q=;
        b=IjSFUjeOQeYnF2/nMa4ZNXQBLZ+2LjChje8qXMR080F/JY987cPQoEqdeSTZehmb0i
         9sWrM8snNS4gxbMVikZroAVeQwMDdJWaEgUnjU6AVUI5wWTl9I20z0ueHuBZDQqdbVwq
         Av+fuWnyOVMUTr3e/vJxk489MC74eAQVMtQE1DpEbaUeQA3wn8Tpe1Qq1UfSXyyA7BUP
         bTmwV7e/X2cvtEL/jZ/qgtAH2nRdD9D6O6nMQuLa87iQUliP104/mxzaRTW8cxnovR7Y
         BH0UCGy8pmBKbgVVlgVLGWaR+qcLyCGjUc52iTlJq7qgWOVtT2EQeejkvef344cU3ire
         I2pA==
X-Forwarded-Encrypted: i=1; AJvYcCUAMoOXmxgxVRxOFYfzsEucjK049W4mcToiBmlLJ31PWmY+3ErSAX/e4Kns9QWhu8dsR/t8+iLTT/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXVRg/pE9Ety4PshG5wtmNdYyv3WbWSspJLKZihn1HxRHS0LoB
	Y8S+ahndIpyHnQmP7ZY1OHQhS1rIHGrsCX8ab3vaBPcAnwGkb3cRBUCcmA==
X-Gm-Gg: ASbGncs7KrSZkUbv2qtIdwVA9UfDRW4YyZQlMfuMovT/O/I4IOZqJWifU8vfRBykssA
	HTwyekM5xRp/K0vMnlW7hJhzEZ5wj6Td58CsxKkj37a4t+0Dyoy3zkabem+ZVyegqfVSMO64cqO
	UeeSzR4pjYuwCanao9lKWP133FDD6yEzzEtZlS6L5tspFzTvTVxDa7eB9QlyHLJyaMfbjd46tbb
	d7UVF0EDAWu9TCDBC3s3v1XdsJnOaTtNpjVDNc5jwFfHZlP+qXxkY5kgYxAKaNP3f2w5hzHDi4V
	0BDjbtMc7fT+lYW1cKgbhPy9G9kkH1W4EokEqGhLN3yl+gjuzLMCWLQl1ZopGcJloBCNiycwNQ1
	HYSgDMSAJwyiQcpPCmQvA2U3MtIWsu+t5w9NODgzap3ZOnv/j
X-Google-Smtp-Source: AGHT+IH/5IL7CtY36Wax0Ja0qcOGms8ZbVcX5fj5FZC6WOvWDdZCI/hNelhZhsO2YrHMsDYRO3KZgg==
X-Received: by 2002:a05:600c:46c3:b0:432:7c08:d0ff with SMTP id 5b1f17b1804b1-436e26e22b1mr55870115e9.23.1736431084407;
        Thu, 09 Jan 2025 05:58:04 -0800 (PST)
Received: from ?IPV6:2a02:3100:ac5c:5700:b5a4:f9e2:5abd:2003? (dynamic-2a02-3100-ac5c-5700-b5a4-f9e2-5abd-2003.310.pool.telefonica.de. [2a02:3100:ac5c:5700:b5a4:f9e2:5abd:2003])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436e2da7768sm57196405e9.5.2025.01.09.05.58.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 05:58:03 -0800 (PST)
Message-ID: <e2c24c59-24c1-4694-bab3-c163d1579ba6@gmail.com>
Date: Thu, 9 Jan 2025 14:58:03 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: core: Improve i2c_new_scanned_device
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Wolfram Sang <wsa@kernel.org>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <f4110289-f7e9-471a-bb91-941c85bfb43e@gmail.com>
 <Z3-koEmVAGPCtV7z@shikoro>
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
In-Reply-To: <Z3-koEmVAGPCtV7z@shikoro>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.01.2025 11:27, Wolfram Sang wrote:
> On Tue, Jan 07, 2025 at 09:29:07PM +0100, Heiner Kallweit wrote:
>> Simplify the logic in this function. And as we're no longer limited to
>> C89, move the iterator variable declaration to the for loop.
>>
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> 
> Did you have HW to test this patch?
> 
No functional change is intended. I have hw using i801, which calls
i2c_register_spd() -> i2c_new_scanned_device(). With this patch
tools like decode-dimms still work.


