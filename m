Return-Path: <linux-i2c+bounces-1930-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FAF886055F
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 23:05:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 32A63B238C2
	for <lists+linux-i2c@lfdr.de>; Thu, 22 Feb 2024 22:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4279313793D;
	Thu, 22 Feb 2024 22:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iU+tgQOi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B88514B81E
	for <linux-i2c@vger.kernel.org>; Thu, 22 Feb 2024 22:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708639514; cv=none; b=GPEEAtO0Dq6PSnsTxbRDw5+aAklVtKpHKGtwNASmWVoQH2ooaLAxg8AZfumjQenWQKW25XbUBOkhlA91YZzUUr4dNwJr0lFJZUbkYeqXkplflyNXtpzp1sCB/Xc3D+XRuhm54S04qKWoEAkDRZEwbDJnvlxWhxWzBGeOtDe9bGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708639514; c=relaxed/simple;
	bh=tfDT7xciyX39mlUh3mFYFhPV4fShD/BTt5sgzCxYA90=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=oMHppbOam1z3ty1JjskXnQ8J9No3A4SsjVmBjrARv0d+3LrvhTloJUXOJVjaLRVz9fuJsmAKIoRNGcxwYxaNbg1qDxmJvOZrZeiWa+/4r0YsL99GFQ8GxfSNDieokxfaT7GwyQsdJTo1Unypf9EQXvGG94sXwDyhrkYpSZO763c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iU+tgQOi; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-55a035669d5so193986a12.2
        for <linux-i2c@vger.kernel.org>; Thu, 22 Feb 2024 14:05:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708639510; x=1709244310; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+tdrrwww+DM04gYXsI8ZlshOmyvIWp4GcqWwwiVsU8s=;
        b=iU+tgQOivcM0NDDrnL2Ncpl6kQXc2RaoQApUttlKZ356eKb4aqTdqYO/Qfryr15cQn
         IdoFUhXluXmLvyXXbJsEbv/NLp1GBNYmFFXGSyCSoHlcLhuKNXpD6BaICp/0hEHZeaQu
         km6+AwExs4MV5SapSxHjHn+gKxNtgCVm18TLOqljAcDmawmYH2GXQmHYD5HrOILWUmWw
         IlIRpS71V+4P7irUXlxHEjngbRILRWx10/l28p0LdNvshDjtuAg2N66wu6uMcGwrdZSn
         ZjM9osPj/jEvxi3jhbElWQhZbKoR3ZNrUKa0h+8uJGvXxXA2xe2RIXChSDRbc3lMfVvp
         vQmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708639510; x=1709244310;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+tdrrwww+DM04gYXsI8ZlshOmyvIWp4GcqWwwiVsU8s=;
        b=GLms3Ft/a39SlgHf+zUGHicrAUxHM/FSNzsnZu8QErKTC5FHW7a2LCp331PNyI7TlB
         f4cAFpNE62Bti++gVeRM724v6D04mQkr0rnuu4ZAS09Ggiv+Z/uHjzk/Ku64rDs2yJSd
         7UhI48mIoU6JNf1U/aASflHGxBBTqeXbCkX5Kg4YQfFVT5nojlc5Ztk1A7xielXNkZN0
         Jb6951hdVSRvbA9h/Db9u3dcY4oHof58vLnjsbazfTtU1cQ+R/3qvvFJQjevmz5rWmfQ
         B8r7Ye+YmsNAUXu7ugXkrsNso8HHpwWy+NYY8Qg47qrSpMEeZWGU/hoNrzXzPr2t1qWk
         MwoA==
X-Forwarded-Encrypted: i=1; AJvYcCVTrHCrekxXy/GGMCQ3AOW6FVEjpzYtOJF16t9kFmfvmHp2v+2V136SW8SBum3ij5Y3u5XZiuiVOAc/4GP1qkPAa3ACPcTmqMUb
X-Gm-Message-State: AOJu0YxdpmALYMaI69vfHEjv56E/pm/nnKE1mfiN9hsnjvdDslqo6pXD
	hvFg+XjT6qQsrTZXTJlUU3bEvemlXCsDbfMo6bgcnYUStDoidsTAQXP3PtLE
X-Google-Smtp-Source: AGHT+IFuw97QJBlnyFw/rA0NHBe1M2uvFwNlflcPL1QZb+4QbEQmvEzGIMb8eLrOtpBhW4GugxvDtA==
X-Received: by 2002:aa7:c350:0:b0:564:56e0:5643 with SMTP id j16-20020aa7c350000000b0056456e05643mr30925edr.27.1708639510253;
        Thu, 22 Feb 2024 14:05:10 -0800 (PST)
Received: from ?IPV6:2a01:c22:7266:d800:30f8:c84f:4a91:c419? (dynamic-2a01-0c22-7266-d800-30f8-c84f-4a91-c419.c22.pool.telefonica.de. [2a01:c22:7266:d800:30f8:c84f:4a91:c419])
        by smtp.googlemail.com with ESMTPSA id p4-20020a05640243c400b00560c6ff443esm5789843edc.66.2024.02.22.14.05.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 14:05:09 -0800 (PST)
Message-ID: <be84acb9-88af-44e0-9581-62fcefb6374e@gmail.com>
Date: Thu, 22 Feb 2024 23:05:12 +0100
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
 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
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
I checked, and it looks like this:
Best would be to check for binding gpio mux driver to platform device
"i2c-mux-gpio" has completed. But the bus notification doesn't work for
platform devices.
Instead we can check for the BUS_NOTIFY_ADD_DEVICE event for the
child i2c adapters. This *should* work.
I tested that the events are properly recognized. However I don't have
hw with a muxed SMBUS, so I can't test the actual functionality.
I'll submit a RFC patch.

> I'd really like to keep it inside i801 if possible. First, all these
> flags in mux drivers only for this corner case are relatively intrusive.
> Second, selecting SMBUS for I2C_MUX is also a tad too much for my taste.
> 
> I understand that removing CLASS_SPD is a worthy goal. So, if all fails
> we could still try this. But I'd think with bus_notifiers it should be
> possible to keep it all in i801.
> 
> Do you think this could work?
> 
> Happy hacking,
> 
>    Wolfram
> 
Heiner


