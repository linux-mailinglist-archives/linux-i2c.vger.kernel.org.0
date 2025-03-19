Return-Path: <linux-i2c+bounces-9899-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C94A685A9
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 08:17:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0988719C410D
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 07:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8B7D191F92;
	Wed, 19 Mar 2025 07:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bn8cxk6X"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1FB22094
	for <linux-i2c@vger.kernel.org>; Wed, 19 Mar 2025 07:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742368656; cv=none; b=YNW5T9lXTTZqDB7nb1eKfke5Bt5fm3S287MDkA5SrzPmZ5QFoxts/7Xr/Gu2jmgMG4mEFt1FwMrBXoGzKUGAPBGPM64/DcRx7ofWJ0dBdOuX17TCfWjx59uK0qkNJcGJ5NbLeOp6vkWD3UMQde/Dmmo4b3qRbHmCy9msKV3Nkto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742368656; c=relaxed/simple;
	bh=uUuzxG+Pxs7o+39las6gvI2EkwXA4Pv/fhlA4ulZs2A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YmJznBD0DJqlzQOsoQIsw5TSoRZufnvNga2Dq6bUM0JewSFXJmFXRNnqtOl/eKUpt5nshZYulVX3e6KaTGbHvYirYHfC+LHOcGEGY8+iYNVlnvMRO7ltEtiqnOASHXWp+oX9gO1lqkve+CGJeYuPBMJXAIRvZotGd5oTHfDAPYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bn8cxk6X; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5e6f4b3ebe5so11013463a12.0
        for <linux-i2c@vger.kernel.org>; Wed, 19 Mar 2025 00:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742368652; x=1742973452; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=A87UuMAf7yIjvQtbtwez+nAYVQ5c5pEvYJCFYb8UpEU=;
        b=Bn8cxk6XCc/V7YvEMGSihNZ8IsVKiFGh+E76UExGYWyLccGQ4QGSyHwJrdzNWJXL7g
         pz2+2lGO7EbDvf5PMFHBKCJRWw+aMVGP3p2DYsKw5scQl7hNh3TZS+VJ9drkfYglO0x3
         uM+gVBOWMGMVlpeNkoNYcL10yWZ7sdEuux/VPASirzHfZCilz2zA85Y/za9wYghVsv7R
         w0PEEKKpGHt3+wbRKN8A3ntfSJ2UwWSQkA40bDisYDiw5WLIg0wxD2HrN5MpvBOke5H2
         l0ghlHQrNCKdOwzzVQ/Il1TI1+FYvwmJopmvR3mB/Yjv2go547UpILm6NDVXsi5iRuMK
         3lOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742368652; x=1742973452;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A87UuMAf7yIjvQtbtwez+nAYVQ5c5pEvYJCFYb8UpEU=;
        b=QdTMOAuYoUmW+6AuJs8Lw0JTh9qfJeY9nP+Gu1sA0ow41mwHZhfkjVxrAg6TVVtJBB
         ABA1f0AmJUkSRvCgkcPIFrn2hu260uCIbRWIUVjeUsI1f+JNcmIn7E+PwnBjEnXzg2Cb
         q7B2PrrKydX2gdms4mFLR+O80GYTgBRf2MNcaE8daKNgzQwApr/YYdhcBXiwkkiVq6g2
         Szhp1YPNgv+pUa17jOLeygv7rBTwc46HJdFjPUgtsQCWJKgDfzlXEpA5zePueSVyr98C
         pQXeVVrPKTvuKOCuNID/TGHvngs9DAZTwxYWkuwNZPm+Af7DIakLlClA9NmBLWoxfvxB
         98nA==
X-Forwarded-Encrypted: i=1; AJvYcCXGarHZhgsCN4esIomZ/Ity1obPSx376eoqzr4mWwf5xUaTkeYSJV9exNk/Ph9XcWBUUyW1vQXNlJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQyRdwkI49HAd2j+4ohGKldVEjQGwT4Awti3UmmX8X/2+QORFu
	Je3yjyNtIajyW//WGwe4Lr8C8MI3Hg5Pp2xViWCImBIrrmWriUlF
X-Gm-Gg: ASbGncsMapB152yXsmzDckgDr7UMeFNUQ67iGteZZyhK8qSb6u6mXbN+ZygYoPOiW/2
	xZWR2N7cgGb9kBD8BUTy3gm9SPjXuR8je7OOqLYmOD8zizPvAc8x4tCMQ2wTLm1+qX8jWUvXN9a
	6+/i+Wfr6GDM6g+8Q0HXYBSVTj65XFahdYdJoP3dJnDuZaeE84tDX3GAD76BokXHfOlcvgrWOUw
	4/w9S4EmFHNCF0MI7O7TGnB9VV7C8caP3XCNkYzDGnefYpWU2Gx8SDM0p8qYDXgtLtQYgGox92G
	ppiur63jbE+rnCESB18l3nQxvIwcDh29ZlhX6Smunf9ELIW231lsIjTFyWYqHAYFsf42sHI+pLn
	x4abxRzFz/hRvte3h9HwFifxhZ9bToE0CSaAzjnKStDWeCWAt0BuoRrz122Hcofg/1d/VdFxZbS
	JT8XCCkZznpO/737TJGH6grOACyybuq6BGz2GP
X-Google-Smtp-Source: AGHT+IFirs05pL7j3l4iEOxqXnci9BbbBpdmBIj4RKPX9UGaNeDTspEEhY3G9VwYVOhYn6j2Pz0aog==
X-Received: by 2002:a05:6402:42c6:b0:5de:4b81:d3fd with SMTP id 4fb4d7f45d1cf-5eb80d199f9mr1555962a12.13.1742368651806;
        Wed, 19 Mar 2025 00:17:31 -0700 (PDT)
Received: from ?IPV6:2a02:3100:a1d0:3200:e87f:873a:75da:53f4? (dynamic-2a02-3100-a1d0-3200-e87f-873a-75da-53f4.310.pool.telefonica.de. [2a02:3100:a1d0:3200:e87f:873a:75da:53f4])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5e816ad3937sm9182781a12.49.2025.03.19.00.17.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 00:17:31 -0700 (PDT)
Message-ID: <22641e59-8e70-46f4-b01f-5cc6c0b9d23e@gmail.com>
Date: Wed, 19 Mar 2025 08:17:37 +0100
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
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <6brcnuejsoor5ejbudtd4wxdrgjzntjat6hqwardxgxierujkg@qvswqhafv36y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 19.03.2025 00:22, Andi Shyti wrote:
> Hi Andy,
> 
> On Wed, Mar 19, 2025 at 12:18:47AM +0200, Andy Shevchenko wrote:
>> Wed, Mar 12, 2025 at 08:07:23PM +0100, Heiner Kallweit kirjoitti:
>>> Switch to iomapped register access as a prerequisite for adding
>>> support for MMIO register access.
>>
>> I believe that I at least discussed the similar change a few years ago or even
>> proposed a one. The problem here is that *_p() variants of IO port accessors
>> are not the same as non-_p ones. And commit message is kept silent about
>> possible consequences of this change.
>>
>> So, at bare minumum it would be good to test for some period of time before
>> going for it.
> 
> How would you do it?
> 

Documentation/driver-api/device-io.rst states that the artificially delayed
_p versions were needed on ISA devices. And in general I didn't find any hint
that the non-delayed versions ever caused issues on PCI devices.
On my system using the non-delayed version works fine, but I can't say 100%
that it's the same for the very first (> 25 yrs ago) chipsets supported by i801.

Likely users with old systems don't run -next kernels, therefore leaving
this change a full cycle in -next may not really help. We can argue that
we have the -rc period for testing (and reverting if needed).

> Andi

Heiner

