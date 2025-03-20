Return-Path: <linux-i2c+bounces-9956-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A91A6AEF7
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 21:06:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 182061892573
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Mar 2025 20:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B62D227E93;
	Thu, 20 Mar 2025 20:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GueXCpU/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C112F28
	for <linux-i2c@vger.kernel.org>; Thu, 20 Mar 2025 20:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742501184; cv=none; b=CKHUTn7i958bDK+/1FEROsk7K7k+DNJMUZh3i6WhskJoRfedZ431xe7DvMTBsPk9Wlj8V2GGchQGc0PRGmTvf3ZKfVOO50EUh3aEmenp3vKjb16c7+m/EyDbjMtt6fd6WFCeCJkVx3rS+pLLlAeU3YuEWxdUEajhGAsl1QSe7o8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742501184; c=relaxed/simple;
	bh=qLEcaIws1PlzlofSc0dDZyzSR4Dja5xC+PZCuHGIWns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cWqOVFnFGQ2ceA50WyX4gLYMF+E8uppqBJG9hAevGcci+mhUFuxoaXgCpORwq799FX1X6Nyv08H/3ptEDB6x8J8nm3ObSB3C3tBKOu3OP4jH5C1oI3SyDGh0Ws0lgC4EqopiN8s3jbGMFKkwgoGgEztHoRoMxqaltzL8jZaVM9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GueXCpU/; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-ac298c8fa50so225672666b.1
        for <linux-i2c@vger.kernel.org>; Thu, 20 Mar 2025 13:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742501181; x=1743105981; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=71MmqD1HZh7QqADxybGfPo+PmDkjAzUx5o+mQPAp9FM=;
        b=GueXCpU/mTrCR2UaHRWxLoJGC7WVgOAZq3yKYD+5Z2xSp0CmfGgkEXedYAhNgFF760
         MBd4nkFRQUcBWcVkzZU4ZXqTE8Oe7VqRDEdd90WzD6Rp4N0n2sraw4E9HPgahvhfPpr4
         Hp/gSw4pOMcHdfHIEzN6dtcFmUUe3fIRqBuHT9/ssFY9h+cooPlWcXBadDGFrjU74Csw
         CI+7Df/tdc6ssdqWAg+d5NatEVxtOuzMmUm2KkUcOhg1CmS/sljqBNbFbuC1J447XPY1
         GIJ4mYwze7CsBxLIsGkMWZUdLtp0NB5iOJtKB6IZQjHAiXzSRMU5rIRV4Dxe6nyvRvF+
         iK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742501181; x=1743105981;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71MmqD1HZh7QqADxybGfPo+PmDkjAzUx5o+mQPAp9FM=;
        b=KROfGwow+XWwyRkLJEpwUZ3sbh5QJydjp4eKXlQQ51r3PtlNYalsG2062K2g/qgJVn
         CzL4dfjNxZUnD0ljUPa2/6Wrc9L6xAK3TWPCmFvbWZoVVqObVynG+uuxqICybeOsL2tP
         4wZQLv4nhXVpVVkYqB2IW/4iYsXJHdUmiJ/X3HQ31McQ1eEAS0FSnCLKMJbZDoY46j22
         ibrVLHrGAU/+vu67bxUHbGhvfqHAMRlks7V/+hFAviN499560GmWFX8LgAe3q6ShkS9Q
         1/k2YYvIgxcRk1WuK6xPkKNmjSMTCtv9PwOR+pBFJ79DnUR78ccRqPJXCC66/WuQ+u2h
         RicA==
X-Forwarded-Encrypted: i=1; AJvYcCVKxoIA+rlF42YMJZhfKmlp6wU2rZ8p6fGM/sOnwcTNK4Imjuk7q+Gv8MpKCjw/H1PLuLerbWDvvn0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSK/dpeGF6X8KtnIjbmhNFAHLLI3ybRc5z2hiU9OKwiUHqVBiB
	9JCPfqUGi40qZsWTQPHgxZQ6tZmQEaSnepa03C1bRF9D4kNT9Pza
X-Gm-Gg: ASbGncsd+tBnILacYC5LT78mXfjBBvjpge4VZJXY1eq9iSMgI7mshXYarat7QK3ULyx
	Yrpeo5geJTlAX83kr7sfVNF4Z2kd1aI/8CFyCBPXj91kkiftm/37L3cgScaMClHi/vQmYq/O7YR
	kQM+EylMJhhnvafWvagHUuMnMJrrRkXK6awShLZcZQUtLEDvQ1QjfhTIOY18Y59o71lscPCBKFm
	ov1XGEWYWdSvtkWGtR8T7ArS/+hfCv91dmsO86A64+hZFNNzGeomAtbNGDbGl4kwNmqc8fYDUKD
	22oCx6iIulmhheONo3qoACM4EcuVgmVAUSDU3oWJsOX/4cr6FdmwQs89WS3ioVb91NXGvH/MYdu
	LarxEtY7SHzrGbO3t3w22PJ05AZavnUnXGXmo0BFWpMSR/JHOeQSKzOrmNBdjZ06Q/ZsrFHf05S
	ciNhK0B5uCbvjvvKHhFP5ocSM6bGqnsxia4Xvo
X-Google-Smtp-Source: AGHT+IGmOmnUhHfXZIMiXjsYya6mvBzDkARD8U25M705Jv/9LJN5DPdTHSJVaM9C9cVdgb7Z+GouGA==
X-Received: by 2002:a17:907:d2dc:b0:ac1:e6bd:a568 with SMTP id a640c23a62f3a-ac3f26ae269mr57934466b.37.1742501181045;
        Thu, 20 Mar 2025 13:06:21 -0700 (PDT)
Received: from ?IPV6:2a02:3100:aee2:2f00:6437:eeed:7bfb:54fa? (dynamic-2a02-3100-aee2-2f00-6437-eeed-7bfb-54fa.310.pool.telefonica.de. [2a02:3100:aee2:2f00:6437:eeed:7bfb:54fa])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5ebccfb0e97sm238594a12.45.2025.03.20.13.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 13:06:20 -0700 (PDT)
Message-ID: <84ea8650-53d8-4ab9-bcdb-af35960a9beb@gmail.com>
Date: Thu, 20 Mar 2025 21:06:29 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i2c: i801: Switch to iomapped register access
To: Andi Shyti <andi.shyti@kernel.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <28ad9377-6d8a-4259-8cd4-7edaa00e26d7@gmail.com>
 <67535b17-c3fb-4507-b083-9c1884b4dd7d@gmail.com>
 <Z9nxRwoeLEriKP84@surfacebook.localdomain>
 <6brcnuejsoor5ejbudtd4wxdrgjzntjat6hqwardxgxierujkg@qvswqhafv36y>
 <22641e59-8e70-46f4-b01f-5cc6c0b9d23e@gmail.com>
 <CAHp75Vdem-DBERs18=VqO+MUh=5Nyg9XLp8Jg-NuQ1Zk7cjFeg@mail.gmail.com>
 <74d8af68-88f5-484a-9854-e00f4b0e33c1@gmail.com>
 <CAHp75VcskbS7mxQxFwhqdSH-KMKLG6E8oeRDV8VhmK=FE2NiXA@mail.gmail.com>
 <f47ebf6f-4cae-4868-98de-7c6a1d2634c9@gmail.com>
 <22rlfg3yhjz6pshwirss3qgen2egl3qinftjshfhbiq7gu3z5u@lttl44appp7y>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <22rlfg3yhjz6pshwirss3qgen2egl3qinftjshfhbiq7gu3z5u@lttl44appp7y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.03.2025 22:53, Andi Shyti wrote:
> On Wed, Mar 19, 2025 at 09:26:35PM +0100, Heiner Kallweit wrote:
>> On 19.03.2025 20:48, Andy Shevchenko wrote:
>>> On Wed, Mar 19, 2025 at 9:33 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>>> On 19.03.2025 09:23, Andy Shevchenko wrote:
>>>>> On Wed, Mar 19, 2025 at 9:17 AM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>>>>> On 19.03.2025 00:22, Andi Shyti wrote:
>>>>>>> On Wed, Mar 19, 2025 at 12:18:47AM +0200, Andy Shevchenko wrote:
>>>>>>>> Wed, Mar 12, 2025 at 08:07:23PM +0100, Heiner Kallweit kirjoitti:
>>>>>
>>>>>>>>> Switch to iomapped register access as a prerequisite for adding
>>>>>>>>> support for MMIO register access.
>>>>>>>>
>>>>>>>> I believe that I at least discussed the similar change a few years ago or even
>>>>>>>> proposed a one. The problem here is that *_p() variants of IO port accessors
>>>>>>>> are not the same as non-_p ones. And commit message is kept silent about
>>>>>>>> possible consequences of this change.
>>>>>>>>
>>>>>>>> So, at bare minumum it would be good to test for some period of time before
>>>>>>>> going for it.
>>>>>>>
>>>>>>> How would you do it?
>>>>>>
>>>>>> Documentation/driver-api/device-io.rst states that the artificially delayed
>>>>>> _p versions were needed on ISA devices. And in general I didn't find any hint
>>>>>> that the non-delayed versions ever caused issues on PCI devices.
>>>>>
>>>>> At least put this in the commit message. It will show that you were aware of _p.
>>>>>
>>>>>> On my system using the non-delayed version works fine, but I can't say 100%
>>>>>> that it's the same for the very first (> 25 yrs ago) chipsets supported by i801.
>>>>>>
>>>>>> Likely users with old systems don't run -next kernels, therefore leaving
>>>>>> this change a full cycle in -next may not really help. We can argue that
>>>>>> we have the -rc period for testing (and reverting if needed).
>>>>>
>>>>> My main concern is to make no regressions for most currently used
>>>>> cases, that's why one cycle in Linux Next is better than none.
>>>>
>>>> Even ICH7 datasheet from 2012 mentions that SMBus register space is also
>>>> memory-mapped. So all systems from at least the last 10 yrs should use MMIO
>>>> instead of PMIO now, and therefore not be affected by switching to non-delayed
>>>> PMIO access. This should significantly reduce the risk you're referring to.
>>>
>>> Cool! So, can we just put a summary into the commit message of all
>>> findings, worries (or their absence)?
>>>
>> Sure. Would be a question to Andi how this should be done technically.
> 
> yes, please do and I will update the commit. You can even provide
> the new commit message in reply to this email and I will update
> the rest.
> 
Updated commit message for d4ac3f93ff23:

Switch to iomapped register access as a prerequisite for adding
support for MMIO register access.

This changes replaces the delayed inb_p/outb_p calls with calls to
ioread8/iowrite8 which don't have this extra delay. According to
Documentation/driver-api/device-io.rst the _p versions are needed
for ISA device access only, therefore switching to the non-delayed
versions should not cause problems. However a certain risk remains,
which on the other hand is significantly reduced by the fact that
recent systems will use MMIO instead of PIO. ICH7 datasheet from 2012
mentions already that SMBus register space is also memory-mapped.
So all systems from at least the last 10 yrs should be safe.


> Thanks,
> Andi

Heiner

