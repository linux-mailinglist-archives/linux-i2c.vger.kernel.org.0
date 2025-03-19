Return-Path: <linux-i2c+bounces-9919-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 800A2A69A2A
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 21:26:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D166A467FD9
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 20:26:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A368F1DED4B;
	Wed, 19 Mar 2025 20:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iWSHmOuP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1671B0F20
	for <linux-i2c@vger.kernel.org>; Wed, 19 Mar 2025 20:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742415993; cv=none; b=rPcosjFGs4UVbsCS/Y0L8RD5kxMw0K9aGy2Al5rU42Y3exO4zojjONrxIwnPezdtaMQCXso/+Mfqdgww4H3KFKRLzWavnuDfoVGej5V3K12xMvbcDUEIuvHP0URAZMzFE+YpOgLBhdBx8R65/rNsrY1W2GAwL7rPBC32jkB8a5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742415993; c=relaxed/simple;
	bh=zxTGDxMpAWMx3Mb03/bIaHS1sb40ux+O2oWpZVzuUXU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CGETLLRujD43SThdLnq9yOg75Z5GxBZD+/BjVcuHn6lN3M1FBSV3XuKJ/2I5DQg9n7MBTeYE8W8QKnl399iHA1Me4WlWE639oRYhK8pxmOOO3IF7i7N2zXx38yLpYG5aegaHaC2xteeUgaat4G0XVIeslWMyKIUPMJn/a6nrzwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iWSHmOuP; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5e5c9662131so96154a12.3
        for <linux-i2c@vger.kernel.org>; Wed, 19 Mar 2025 13:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742415990; x=1743020790; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vSSHsZIUpoP1IokitRH0RUwy0OnPlJMewsdwqYTqCac=;
        b=iWSHmOuPyrjkkYpP2Iv3DGZNPKYtVyIO8RLs+7K/003aaX6fi4lLGdjvX1G9oAauEr
         1Vond7uFfYMdfiJJbi6rmKZ/pwoSnqnlxVu8kgkzzdbyvIYzFlJwN5ll1raPTb5chNpp
         ia6/YJufCk+u/+VPV0O+PARhhxF7m/VsY8tCufAdLoKXRAXbVSTWt3glOjJXbAd9z+26
         5UZhXfNE6hIoU3YWh5imNr8450PHCNbWRhRaoI8nKXNeR1kh0lSuGPAdz4MZDZ07zEOn
         9GWTYXcyAXoovdYWzGnUWFoegTklcYj0IeNDdn7Loqj9HFDmHw/YyqfQxtAbVRuLhdGH
         1TeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742415990; x=1743020790;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vSSHsZIUpoP1IokitRH0RUwy0OnPlJMewsdwqYTqCac=;
        b=VGuYCfOJWBxXam+kdMD4+yyA5gh8N8CsxLvKk+WFfZjR44JHGrr4RpLGWvN4QHvvXJ
         KTHkkDR9K0ga9weKOZz3mXDWiPFqgjV1Ow+eRVaI3DmXP3si3EBL3uSGAla0hI4Ktk46
         lW/XltQpaWkqoj/B6rpEXzm+Mpk5/kRzX+qsqHq/lGjIXHw9GFaREmXF9YlPnfEALV1A
         y2q4v6LpsP3zjdsJaHrVtPdrTl2cO7KgJMoAZ8pM+7PUVo6U8Ja8HAahewoE2nehu+Th
         TIrGxPr/shkXVH9gopTt/+V9jd0DeWj8OtnBAkvb6tGJGeAswjNXscwcI1ySQX/l2Oyw
         8kgA==
X-Forwarded-Encrypted: i=1; AJvYcCW8LhlAK+a3g25zhSMQeOt4Z8OEAmPY4KnJ4O+2cgMCbK+2d4naNEOziFc8sZk9i56eEEwestGPtBc=@vger.kernel.org
X-Gm-Message-State: AOJu0YydI9JPjOBUSiu2gZkpojUgB9jWMxNjfGKb2rs8H0EaNoKpGFFU
	vDxbYDwH4uEyTllL/noeCJKAbbWsa4gFq1TBQa7IYrvd7X6z28ea
X-Gm-Gg: ASbGncvP+u20S3gtNNZa3gsncZ/m/xWAp1gZY5Xi0ulLmSekzsJo8vRfBudVDUZRMjh
	l4x6oa0rpKH3HDP+ERaPPgsggcWwJHbb0/DdrMar6OjWB5cgrleFQGpYj4LaYUnjG56urduW/KC
	SJLRljRnn69d+i43PROBC3Sk5mwQQAMVOp2xwhwo+3/r+PpTxYI0E9sR3SObQhFEFURttEpUej0
	85h0fTF1C0cvrASBTAIMJub4FP61nCFzrofIOVn3bh9h91guLTBcGSLNZ/vmicEjM6XS79OG7hg
	InNdXwWzhqI0jg+7PuYnCYoKqqbAHDzxQUtL28dYpnsQe9wsjmgIYdyJWn0fGskRmaUic9MgGna
	zVVNlDp0hR0PsCZP/fm7CZGr45ymk8kPWNb8WjA9tu5BM04ooWnpuJDWjif0LVer5pYx8xkD8bJ
	mE5niffi1EcQsJf+AfmgGzkwHHqTnYHz7fLPbp
X-Google-Smtp-Source: AGHT+IER77ubbalMZ6okjUOF6w/bMgaIRWlmyfHifjj2m3L5myMtj+hJEeR68iSHMXRp69YPhrZAnQ==
X-Received: by 2002:a05:6402:d0d:b0:5dc:7643:4f3d with SMTP id 4fb4d7f45d1cf-5eb9eee0416mr549863a12.1.1742415989701;
        Wed, 19 Mar 2025 13:26:29 -0700 (PDT)
Received: from ?IPV6:2a02:3100:a1d0:3200:e9ff:1d3c:4abb:ae78? (dynamic-2a02-3100-a1d0-3200-e9ff-1d3c-4abb-ae78.310.pool.telefonica.de. [2a02:3100:a1d0:3200:e9ff:1d3c:4abb:ae78])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5e816ad3d1asm9426684a12.55.2025.03.19.13.26.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 13:26:28 -0700 (PDT)
Message-ID: <f47ebf6f-4cae-4868-98de-7c6a1d2634c9@gmail.com>
Date: Wed, 19 Mar 2025 21:26:35 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i2c: i801: Switch to iomapped register access
To: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Andi Shyti <andi.shyti@kernel.org>
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
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <CAHp75VcskbS7mxQxFwhqdSH-KMKLG6E8oeRDV8VhmK=FE2NiXA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.03.2025 20:48, Andy Shevchenko wrote:
> On Wed, Mar 19, 2025 at 9:33 PM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>> On 19.03.2025 09:23, Andy Shevchenko wrote:
>>> On Wed, Mar 19, 2025 at 9:17 AM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>>> On 19.03.2025 00:22, Andi Shyti wrote:
>>>>> On Wed, Mar 19, 2025 at 12:18:47AM +0200, Andy Shevchenko wrote:
>>>>>> Wed, Mar 12, 2025 at 08:07:23PM +0100, Heiner Kallweit kirjoitti:
>>>
>>>>>>> Switch to iomapped register access as a prerequisite for adding
>>>>>>> support for MMIO register access.
>>>>>>
>>>>>> I believe that I at least discussed the similar change a few years ago or even
>>>>>> proposed a one. The problem here is that *_p() variants of IO port accessors
>>>>>> are not the same as non-_p ones. And commit message is kept silent about
>>>>>> possible consequences of this change.
>>>>>>
>>>>>> So, at bare minumum it would be good to test for some period of time before
>>>>>> going for it.
>>>>>
>>>>> How would you do it?
>>>>
>>>> Documentation/driver-api/device-io.rst states that the artificially delayed
>>>> _p versions were needed on ISA devices. And in general I didn't find any hint
>>>> that the non-delayed versions ever caused issues on PCI devices.
>>>
>>> At least put this in the commit message. It will show that you were aware of _p.
>>>
>>>> On my system using the non-delayed version works fine, but I can't say 100%
>>>> that it's the same for the very first (> 25 yrs ago) chipsets supported by i801.
>>>>
>>>> Likely users with old systems don't run -next kernels, therefore leaving
>>>> this change a full cycle in -next may not really help. We can argue that
>>>> we have the -rc period for testing (and reverting if needed).
>>>
>>> My main concern is to make no regressions for most currently used
>>> cases, that's why one cycle in Linux Next is better than none.
>>
>> Even ICH7 datasheet from 2012 mentions that SMBus register space is also
>> memory-mapped. So all systems from at least the last 10 yrs should use MMIO
>> instead of PMIO now, and therefore not be affected by switching to non-delayed
>> PMIO access. This should significantly reduce the risk you're referring to.
> 
> Cool! So, can we just put a summary into the commit message of all
> findings, worries (or their absence)?
> 
Sure. Would be a question to Andi how this should be done technically.


