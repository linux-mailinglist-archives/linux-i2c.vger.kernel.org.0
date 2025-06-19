Return-Path: <linux-i2c+bounces-11531-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0A0AE0B8D
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jun 2025 18:58:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F98F1898B14
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jun 2025 16:58:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01D7128C5BD;
	Thu, 19 Jun 2025 16:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m0t7tM5d"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D107122B8CB;
	Thu, 19 Jun 2025 16:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750352289; cv=none; b=XBFd4D6kEZl/7Dg5FtRBc+foxxWjgR2pbS229KLhOwTjPHMoNle1k/VjBHSsLR14UYCKIsFkXXdcf2gdlK/6VrUs43LVKvBfIaokokbfA1bKsy+pHME66b9splWJneFyhHrPgYjq5VBPQ1/5Zd6eliC5AWqjSr3YCS4bklVWX04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750352289; c=relaxed/simple;
	bh=s5ZOASa6WLS2cPiUxuOX80JyD+Svxd5u6d546aAEOLw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M+zQOACQxb2W99yJzSrt7jnGgvvQrpUOoMpQX0yiRmPzO+yuOvOOVSHxAsthbZakxlJyscJJ9B9VOs/nOjrS69WsP0N8LC6sIvywukILx7ogaWBI5esArBeR5ZvYg0/3pcsvzucBzkINRNe2KW9W3bYXtTFL1wn8tEWnOznCFMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m0t7tM5d; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so753762b3a.1;
        Thu, 19 Jun 2025 09:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750352287; x=1750957087; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=2rnFT5DuBGy4VA1VZa7DHkJzfxqhbjN5PUPd9eN35Gs=;
        b=m0t7tM5dFT0a6XASVO4ZaWJ0fsbLfn9be+QtNUgsqaKFsg15l/hOpieAdkUuwg2jk/
         6IVrhp8yPiKZyR0kWfh7Lr83oIiYgaHoD6Wj4xwwpt2W10UO/NNDfWgov3Sw7j9UMZOE
         HYehBgIERx8RVq+cMN0wlv5pCpdl2Rng4F1sWS+GM1MbxBeb3aVNF2cAjjmQxhjURFEo
         HY4ptJW+dKWUGdx27lTjWNnuvjJyA0/wx1JojS5dgCyubRlWoXRRhl5D2N7SVfPvGM46
         b5x+ze4pu1h63mffyQUi8NeFGqKbGilkdBC1Rm3gueByUYrMDe1LUQWgqmsrTm5w26L8
         C3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750352287; x=1750957087;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2rnFT5DuBGy4VA1VZa7DHkJzfxqhbjN5PUPd9eN35Gs=;
        b=SWWO5ieLs5HmXQ0iMp7HK0oCiQy/W/+x3h99/n6yvtGPf6cU2rxJJuUHm+I4HCnq5l
         Zh/A/HL5rBI1WyEz/G2jH1bC5WdCsC2TbEvp4tgmyS1EIgiXmgOXn0HZULpC99r7L8+g
         vmSa2fCHLqhqYqTnxmQ9z4VKaZ2wvhMWZSPnpBmAZwOxVOdyv45wF0t0Z8Xna2kI2ECV
         AJgh2A3XzHkHEDVJj27eQ8aUz4i9Pvi5/4TUoLyBbFC9dk41A6L+N6dXYmeaCiWSCL7s
         5YeJXmR2yJOxsWWrvvA0EY35np3BG7Ml7Mcg8K6r8ynCfD4bzq6aB6Uf6TPg5ApfFwDV
         OIPw==
X-Forwarded-Encrypted: i=1; AJvYcCVMyFR1g8svamKOVrVueNcfe15C+VEuSTHEylcwnpFyDTgDXGw5oWOEvoceJB/CkBo862q3NdND@vger.kernel.org, AJvYcCVWY9eWgO9cPiiPtB4V3ZsttGotfZ+ngq8l116MFVlV6O4VOJY2QbCAU0bYU9Sry36SvX8OuTt2RnE=@vger.kernel.org, AJvYcCVecwQ7JVrRK1qVzzs9SyOQg5qJ1f6y56th0Eng25fa+mcNcS18XVyGtxgf9PTz/UShgwh2mq3JkCU1JJ62@vger.kernel.org, AJvYcCVq1qKOJzWdvbytpVi4icyZZRe6546uKVorf1JExy6D0cOZt4pMhz+4wYLMt1tkDHPmcwiWxHJfjZ4b@vger.kernel.org, AJvYcCVztd9Hwb+Hx0VRjQ2k06VRvDxMBtnlefN3fi1bjMcAiuOzR8STjwIBbPwWJ0bWaG1IB0uRv3arMMZx@vger.kernel.org, AJvYcCW0VtCFcN5VwCUJYgYvhOUhadg6GakXOLgDt2eiGok0cGmqntjMou1yqrEYWK3z2UhZLt/SzvEMAkJw@vger.kernel.org, AJvYcCWciP0Nd4tbVIeh8eVqmslBByhY+NxzmXbwAPrsiJ7r6QuT9kEMX46/5SZzCSPpXam1Jfu+KvAJKSpb04k=@vger.kernel.org, AJvYcCX9eu1ni2jg4ycE6P2X5Ipp2+lQDFVlwCD8pwxtuv+jKOgeN9NtWMQhvPHqF9N+klj3Gv/LUyRkrD/JOf+Knug=@vger.kernel.org, AJvYcCXypwjMZKuYIKYzl9bGnXuPXS6AgJF1cKCfDmT8j7TbMsqHC7c+tC/XeSM1V9u1wEvFrj6dsZsEVwuxwQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJoFyAFy8LKX/DKxk6aTrNvAz35FRbzOTQ0LGKzDZej8wsId9J
	XtFylkcvh4MzId27QfJdIAIipzdong6ueWxfzSp50sc/B+4gGpdifQHT
X-Gm-Gg: ASbGnctQpw+9cgm0LK7P8y+dQ/+Kkh5jUFgGel1SHyb5NnmuGUPysMm4ny4pMeM1BD5
	D2Bq850HWy8HqSfuHKcmqQ10iLFVDRwnjWtacmv8Hzd0XxYlzPaIaMU+o9XTbrRlNEP4DR0kfYO
	1n07rL+9xgo8et/aIWPzbcrQkvg86nKNvqpUxCcF2VwJpYIoT1sDWvhr93Qmc10c+rCZYmXp0L5
	2m0JSccKfMsD3U1Phiz3HWnmQxDisVn8aq7aC3VY6WtpsMDG8hK6mLHddA01IFEQRbpheupJyDo
	z4gmAH3vaRUy9KCjuDw4cIPRVIXjWO3Xc32WCJcSnzq3TDwJ5oQz7dzq+kBalsTpGKiwzAVIHaD
	tXcQvJyplwwWM+q8hAdJmek3RdK63aDAFIE8=
X-Google-Smtp-Source: AGHT+IHVgkwMyox7JNdBaTu6WW5a+95Eh8+mW43Bd/Q6utOPigDMF+qsXNYjmldg77lHHn990PE5Yg==
X-Received: by 2002:a05:6300:6e1a:b0:220:1843:3b7b with SMTP id adf61e73a8af0-22018433e0cmr3396942637.4.1750352286955;
        Thu, 19 Jun 2025 09:58:06 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a621ceasm252302b3a.97.2025.06.19.09.58.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 09:58:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <644dfd66-ad30-47cb-9ec4-50d9a003433b@roeck-us.net>
Date: Thu, 19 Jun 2025 09:58:04 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/7] mfd: Add core driver for Nuvoton NCT6694
To: Greg KH <gregkh@linuxfoundation.org>, Ming Yu <a0282524688@gmail.com>
Cc: Lee Jones <lee@kernel.org>, linus.walleij@linaro.org, brgl@bgdev.pl,
 andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org,
 jdelvare@suse.com, alexandre.belloni@bootlin.com,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org, Ming Yu <tmyu0@nuvoton.com>
References: <20250612140041.GF381401@google.com>
 <CAOoeyxVvZiD18qbGd5oUnqLNETKw50fJBjJO3vR50kon_a5_kA@mail.gmail.com>
 <20250612152313.GP381401@google.com>
 <CAOoeyxV-E_HQOBu0Pzfy0b0yJ2qbrW_C8pATCTWE4+PXqvHL6g@mail.gmail.com>
 <20250613131133.GR381401@google.com>
 <CAOoeyxXftk9QX_REgeQhuXSc9rEguzXkKVKDQdawU=NzGbo9oA@mail.gmail.com>
 <20250619115345.GL587864@google.com>
 <CAOoeyxXSTeypv2qQjcK1cSPtjch=gJGYzqoMsLQ-LJZ8Kwgd=w@mail.gmail.com>
 <20250619152814.GK795775@google.com>
 <CAOoeyxU7eQneBuxbBqepta29q_OHPzrkN4SKmj6RX72L3Euw5A@mail.gmail.com>
 <2025061910-skies-outgoing-89cc@gregkh>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <2025061910-skies-outgoing-89cc@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/19/25 09:20, Greg KH wrote:
> On Fri, Jun 20, 2025 at 12:03:01AM +0800, Ming Yu wrote:
>> Lee Jones <lee@kernel.org> 於 2025年6月19日 週四 下午11:28寫道：
>>>
>>> On Thu, 19 Jun 2025, Ming Yu wrote:
>>>
>>>> Lee Jones <lee@kernel.org> 於 2025年6月19日 週四 下午7:53寫道：
>>>>>
>>>>> On Fri, 13 Jun 2025, Ming Yu wrote:
>>>>>
>>>>>> Lee Jones <lee@kernel.org> 於 2025年6月13日 週五 下午9:11寫道：
>>>>>>>
>>>>>>> On Fri, 13 Jun 2025, Ming Yu wrote:
>>>>>>>
>>>>>>>> Lee Jones <lee@kernel.org> 於 2025年6月12日 週四 下午11:23寫道：
>>>>>>>>>
>>>>>>>>> On Thu, 12 Jun 2025, Ming Yu wrote:
>>>>>>>>>
>>>>>>>>>> Dear Lee,
>>>>>>>>>>
>>>>>>>>>> Thank you for reviewing,
>>>>>>>>>>
>>>>>>>>>> Lee Jones <lee@kernel.org> 於 2025年6月12日 週四 下午10:00寫道：
>>>>>>>>>>>
>>>>>>>>>> ...
>>>>>>>>>>>> +static const struct mfd_cell nct6694_devs[] = {
>>>>>>>>>>>> +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0),
>>>>>>>>>>>> +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 1),
>>>>>>>>>>>> +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 2),
>>>>>>>>>>>> +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 3),
>>>>>>>>>>>> +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 4),
>>>>>>>>>>>> +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 5),
>>>>>>>>>>>> +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 6),
>>>>>>>>>>>> +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 7),
>>>>>>>>>>>> +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 8),
>>>>>>>>>>>> +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 9),
>>>>>>>>>>>> +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 10),
>>>>>>>>>>>> +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 11),
>>>>>>>>>>>> +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 12),
>>>>>>>>>>>> +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 13),
>>>>>>>>>>>> +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 14),
>>>>>>>>>>>> +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 15),
>>>>>>>>>>>> +
>>>>>>>>>>>> +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 0),
>>>>>>>>>>>> +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 1),
>>>>>>>>>>>> +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 2),
>>>>>>>>>>>> +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 3),
>>>>>>>>>>>> +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 4),
>>>>>>>>>>>> +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 5),
>>>>>>>>>>>
>>>>>>>>>>> Why have we gone back to this silly numbering scheme?
>>>>>>>>>>>
>>>>>>>>>>> What happened to using IDA in the child driver?
>>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> In a previous version, I tried to maintain a static IDA in each
>>>>>>>>>> sub-driver. However, I didn’t consider the case where multiple NCT6694
>>>>>>>>>> devices are bound to the same driver — in that case, the IDs are not
>>>>>>>>>> fixed and become unusable for my purpose.
>>>>>>>>>
>>>>>>>>> Not sure I understand.
>>>>>>>>>
>>>>>>>>
>>>>>>>> As far as I know, if I maintain the IDA in the sub-drivers and use
>>>>>>>> multiple MFD_CELL_NAME("nct6694-gpio") entries in the MFD, the first
>>>>>>>> NCT6694 device bound to the GPIO driver will receive IDs 0~15.
>>>>>>>> However, when a second NCT6694 device is connected to the system, it
>>>>>>>> will receive IDs 16~31.
>>>>>>>> Because of this behavior, I switched back to using platform_device->id.
>>>>>>>
>>>>>>> Each of the devices will probe once.
>>>>>>>
>>>>>>> The first one will be given 0, the second will be given 1, etc.
>>>>>>>
>>>>>>> Why would you give multiple IDs to a single device bound to a driver?
>>>>>>>
>>>>>>
>>>>>> The device exposes multiple peripherals — 16 GPIO controllers, 6 I2C
>>>>>> adapters, 2 CAN FD controllers, and 2 watchdog timers. Each peripheral
>>>>>> is independently addressable, has its own register region, and can
>>>>>> operate in isolation. The IDs are used to distinguish between these
>>>>>> instances.
>>>>>> For example, the GPIO driver will be probed 16 times, allocating 16
>>>>>> separate gpio_chip instances to control 8 GPIO lines each.
>>>>>>
>>>>>> If another device binds to this driver, it is expected to expose
>>>>>> peripherals with the same structure and behavior.
>>>>>
>>>>> I still don't see why having a per-device IDA wouldn't render each
>>>>> probed device with its own ID.  Just as you have above.
>>>>>
>>>>
>>>> For example, when the MFD driver and the I2C sub-driver are loaded,
>>>> connecting the first NCT6694 USB device to the system results in 6
>>>> nct6694-i2c platform devices being created and bound to the
>>>> i2c-nct6694 driver. These devices receive IDs 0 through 5 via the IDA.
>>>>
>>>> However, when a second NCT6694 USB device is connected, its
>>>> corresponding nct6694-i2c platform devices receive IDs 6 through 11 —
>>>> instead of 0 through 5 as I originally expected.
>>>>
>>>> If I've misunderstood something, please feel free to correct me. Thank you!
>>>
>>> In the code above you register 6 I2C devices.  Each device will be
>>> assigned a platform ID 0 through 5. The .probe() function in the I2C
>>> driver will be executed 6 times.  In each of those calls to .probe(),
>>> instead of pre-allocating a contiguous assignment of IDs here, you
>>> should be able to use IDA in .probe() to allocate those same device IDs
>>> 0 through 5.
>>>
>>> What am I missing here?
>>>
>>
>> You're absolutely right in the scenario where a single NCT6694 device
>> is present. However, I’m wondering how we should handle the case where
>> a second or even third NCT6694 device is bound to the same MFD driver.
>> In that situation, the sub-drivers using a static IDA will continue
>> allocating increasing IDs, rather than restarting from 0 for each
>> device. How should this be handled?
> 
> What is wrong with increasing ids?  The id value means nothing, they
> just have to be unique.
> 

Unless they are used in the client driver as index into an array, as in
"this is the Nth instance of this device for this chip". There has to be
_some_ means to pass N to the client driver.

Guenter


