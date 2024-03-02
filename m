Return-Path: <linux-i2c+bounces-2115-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F6DF86F1C3
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Mar 2024 18:47:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C6201F2157A
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Mar 2024 17:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363282BB1D;
	Sat,  2 Mar 2024 17:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W/xEaePG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C802BB16
	for <linux-i2c@vger.kernel.org>; Sat,  2 Mar 2024 17:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709401636; cv=none; b=Fxhxw5+I/dLxvDRnIUamM+w5aPd3SuZvvXjokSLGSngwG4nKakt7BEfYndnFgj9xygE4rVf3ZtN21D2gEyeO5HYoGSTTiCKFhqWiiIeNfyEI2IQqcojxoTN5QN1IpKfVw1VoN9jIXkAvBEW9uk1g7AdU+VWpXeBIqdCZZK1X+SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709401636; c=relaxed/simple;
	bh=c4Qng8Lqqy7k4lOLuQMbxJ6hh2J56OBXbKRKoXt1Kc8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=lVg5VZ86NiYi9LYpCvdYI7JpxPpgdw8eLztnbceeXS3oT7l3IcvCoWzmmXkBEVZrDRjGkAL3NfHCWnjwrtWHdMySd0pJZAqh7Znukb5HBoL6d5jBE4R1hpyS5ChCmLQcAckkeYqL89kN5wspglQI8PufNQckJNMD9yU1aJeWYzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W/xEaePG; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-563c403719cso4637592a12.2
        for <linux-i2c@vger.kernel.org>; Sat, 02 Mar 2024 09:47:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709401633; x=1710006433; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=r0SnFufdR/uCrtXrhKUyqsUk0tkBVmIf2gTSiThy/88=;
        b=W/xEaePGjkmBpBvlo9qdytERNs7uvhwWsK65qkVNuzHBieD8z+Lc+Iy2I2375KJYww
         M8avg/NcDvW8v/MT7bYFZe7dXJPqiIGnv1CgZnpnn2Xd9l/YSSgFFjih+SpPG0PI7SCS
         dnD/1LE3htTSCjJc3pvaNW+RnrSrtP6smrVbtEjxxnmC0zOLBvctOEG+nKUq4NlmMAH7
         FStU82df+IZlLrrw5GSxl3+M3SbvlHhOqbFyeYxWAak9E0Grw7D9b1MypTCz4t1CgVu2
         VeKFSlZAJ9s6lw1C3+kPy8bD1NI2rju4U0CqFFQMl7YTHfabC/QsIerT2wp8M3eu+hj3
         ergQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709401633; x=1710006433;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r0SnFufdR/uCrtXrhKUyqsUk0tkBVmIf2gTSiThy/88=;
        b=bRpYceaJjgDFuMxIM3EryeuQvYkaVRxAhPS8Mb7/vC0JKakoVw0P4gubeZVDGZc7v/
         dbtiSWciUxzQrM7YbN53yKEVhZtzDNhlIl82qEb7LJB3R0P+4fyqC99O4KcWdLIvZUdB
         zg89O4nTii9i3o4A79PWeWW3popE0RjKuZWBhexcDt5bgV2paUmBzACrK+OOR7hDG2Ym
         +vxZz30g1x1hmrTQ8yRlNfXmZ+uxVGVGqS2P+0i7HesPk5LGrXQHgifiDm7zoBlixgRI
         /UJB28zUU2HfK/ax43U4eluKlW2dXjDn9KHcfVW48gzF2uwFatlw2UWlbLvI/g2kApSi
         xRfg==
X-Forwarded-Encrypted: i=1; AJvYcCU3VADm9R1ygQnS+Cvc406cq7OCtSUAsdyvAYABzP0sI0o+ClOVKCIte006yHS6HP83IgpiACAxZnvr6LH69ywBixqIsiFhrAwG
X-Gm-Message-State: AOJu0YzWgzWGZIyk6uRrfROV6wl3FXQQuh11Vkw4YxboplXVVWwLD3pn
	nZlBQ2eTEvwbhvhojQNGBIT+SlDtCIDOvePIoX9oJwxRWmUuuzwa
X-Google-Smtp-Source: AGHT+IF4G78vULoU0ATWLSnhcqbQom/BzKH+O134jBr11iDkI98UwoxPdNFgc3RhEiV3T/6KWdCHyw==
X-Received: by 2002:a17:906:4555:b0:a44:985f:e2ef with SMTP id s21-20020a170906455500b00a44985fe2efmr2955064ejq.77.1709401632470;
        Sat, 02 Mar 2024 09:47:12 -0800 (PST)
Received: from ?IPV6:2a01:c23:bcce:a400:2519:2036:7f0:6005? (dynamic-2a01-0c23-bcce-a400-2519-2036-07f0-6005.c23.pool.telefonica.de. [2a01:c23:bcce:a400:2519:2036:7f0:6005])
        by smtp.googlemail.com with ESMTPSA id d25-20020a1709067f1900b00a440e2ada28sm2893253ejr.201.2024.03.02.09.47.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Mar 2024 09:47:12 -0800 (PST)
Message-ID: <c2128de2-9ab9-4f47-9783-99e959e11920@gmail.com>
Date: Sat, 2 Mar 2024 18:47:12 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ipmi: ipmb: Remove I2C_CLASS_HWMON from drivers w/o
 detect and address_list
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Corey Minyard <minyard@acm.org>, Wolfram Sang <wsa@kernel.org>
Cc: openipmi-developer@lists.sourceforge.net,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <18568237-0b57-4b74-86ec-a6c358a4e058@gmail.com>
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
In-Reply-To: <18568237-0b57-4b74-86ec-a6c358a4e058@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.01.2024 16:15, Heiner Kallweit wrote:
> Class-based I2C probing requires detect() and address_list to be
> set in the I2C client driver, see checks in i2c_detect().
> It's misleading to declare I2C_CLASS_HWMON support if this
> precondition isn't met.
> 
Any feedback here? Should this better go through the I2C tree?

> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/char/ipmi/ipmi_ipmb.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/char/ipmi/ipmi_ipmb.c b/drivers/char/ipmi/ipmi_ipmb.c
> index 4e335832f..9e5c6d682 100644
> --- a/drivers/char/ipmi/ipmi_ipmb.c
> +++ b/drivers/char/ipmi/ipmi_ipmb.c
> @@ -567,7 +567,6 @@ static const struct i2c_device_id ipmi_ipmb_id[] = {
>  MODULE_DEVICE_TABLE(i2c, ipmi_ipmb_id);
>  
>  static struct i2c_driver ipmi_ipmb_driver = {
> -	.class		= I2C_CLASS_HWMON,
>  	.driver = {
>  		.name = DEVICE_NAME,
>  		.of_match_table = of_ipmi_ipmb_match,


