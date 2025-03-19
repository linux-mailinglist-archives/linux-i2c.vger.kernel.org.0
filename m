Return-Path: <linux-i2c+bounces-9917-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7870BA69985
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 20:37:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DB241885434
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Mar 2025 19:34:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A834B2144A2;
	Wed, 19 Mar 2025 19:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZzIaA2yL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B18DC1F4164
	for <linux-i2c@vger.kernel.org>; Wed, 19 Mar 2025 19:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742412831; cv=none; b=keZZvjxdNKZKbVvfmF5UwNNOf+OGa7yLZ02Uk4KdGeeUtXbGhBAykm1o40C/LJf9E3LLvoI+L8X0gr1oewBjDGxwJcpfyPQ9dOm9SwllgmJn0m+1nd9p9j01C9UzP7XeH9v1AL0jUD9fyK++zileITAmW+e+iHhJmJL3rj0p9ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742412831; c=relaxed/simple;
	bh=U/wPPTD+OIyhpxDklN5uRCYdQ5xgWTWqN3uJ5xyhO54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LmHtlxJV9Q7vMlDwThorWgAuZ6wJVOyqIj0IotFAf/z1mhs3r3D8QbVu11dg2+h4j94IGksKG4o4jiVOSIZi+YincuIildKvPY8wiCNHIl9yyEKL1eoqm40jaJ+Bagge6MYdd/HrzoxNk6hYRl/ZiCCBS5cF/hnWP5sTxvIAa0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZzIaA2yL; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso72648a12.0
        for <linux-i2c@vger.kernel.org>; Wed, 19 Mar 2025 12:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742412828; x=1743017628; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=GrVkILJ+rWWOgotUF5ROSx9fMQclx+uDCTNnt9xHPAs=;
        b=ZzIaA2yLvw/plhIeFiliUFONHwIlfSKq7hUueIzdayp3iHutv0H++hRR/NicKwjzYZ
         pdpGHTDTURZS0XnllsZ/bVCuztxLFChxy12AVaxJ+tBWed2m2e04lA5Hc/q4T33joqK0
         2AQGVDZa6r+CLMSMdBM+gzzVg4lvSfWWaGRJEsYL4uBBhjq2ibIC/g19PEnID51xIbI1
         /a762e29/29ahNcyGc9MZPBUGT6HS7n+kZFJmlKyGX+Zyr+aIanxcs2J4jBMnPbL6p7U
         C27VRaK+RrDXn98vGm3C5hBEpeEtAWWr6Z+X9qlFu8qmAv34Af3wxzgqyO0DvFh5eh9t
         57aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742412828; x=1743017628;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrVkILJ+rWWOgotUF5ROSx9fMQclx+uDCTNnt9xHPAs=;
        b=YwbaYgAd3h2A5x726mEZpQIL1yA8LGd6DG3/r9NNf/LYp2T5H8CyOl7ws7kElw7M/L
         0NN4lU4KfAY+EaJX1jfN2/Hq0SsSppOFkmyq+oSAZwJ4yC4erVWCQoifEMZfEX1mph5H
         PQxV7NMjbTSrmriJFrkyNkuV2JWcaiIqQEKaCctDxd1QKSheQeMPsurTms9sgasEJo28
         T5vjrAbL9xt3Ko49R7chzW8M+DKsCBywk650kt96rH+waGo9GSKvQLdRvC6klSR/ER1z
         99bUz3un/oB64IuKcrfiPaawr2yxOg7zvt6wKUc64VCw6ydd75RXCi6iHHVJPv3/HDKY
         MvsA==
X-Forwarded-Encrypted: i=1; AJvYcCXE08SE162sEpD1tGUTQZTkAwXj1qUdDOChcaNYSObl8rvCUKwoFrGyLck736oNofb9XKYR2tZq8OM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQk7H5lutyGf2J83eQtigYStCrkt7ZKdCT/MyGDK4xnVd0uLs1
	BZ7rx0zGj+LmNv72yz7SkoZxairZpiKFB0pk26yFBxfI4AcXUsEd
X-Gm-Gg: ASbGncsBm0OrrRm0DWkxQm08IlxZ2ws0NzRyq9SDUt1aehrwOQbo/q5Aq4QvF/+y4Mu
	NejFvVI/s64UpwxZD5EeetreulOMyzxnoWeJgBRXxpf/9mzy7oSprOLeyTSOyHa6/s7An/aWBUM
	l67mXn/u8VNeBvNCP8SwrZ4CoAVNmHjtwjDHfJCEdGdjIV1WVCGZzy7Z41hosxu1xH3z0NyyzNF
	K9IS/1Q97F/dDmnP4TXKJVVeQLwVdpQUiRJ6zKoJf3pN5UPvwLC3vabucBTzbE6uFFdtepO4IQA
	DgIUn8Cwbrf17Y0tKxZJSPnF+0HCOvUmeaftLsv8DouXuCWRKZfzB3dWd3hVzBlgCeo2x35b2bv
	/XPr3yO26J6zadUDQVRwoQ/vP6PT+X3N00Mic7K2ldo/7ngc7COA6By0xZ66HXgoqxzIjFO38Hw
	XD913K9pPpL3V/fhfOIdY1e+vF8CFfZBHZZ1q3
X-Google-Smtp-Source: AGHT+IEjcGUHvSm34mwx2134u3gbfh/GVlPKDDdGJocXVhK5w3HYdozioyJigHWC9bT7n2b3OxjJmg==
X-Received: by 2002:a05:6402:5209:b0:5e5:bde4:7575 with SMTP id 4fb4d7f45d1cf-5eb80ca7068mr4152193a12.1.1742412827620;
        Wed, 19 Mar 2025 12:33:47 -0700 (PDT)
Received: from ?IPV6:2a02:3100:a1d0:3200:e9ff:1d3c:4abb:ae78? (dynamic-2a02-3100-a1d0-3200-e9ff-1d3c-4abb-ae78.310.pool.telefonica.de. [2a02:3100:a1d0:3200:e9ff:1d3c:4abb:ae78])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-5eb5c958bc3sm2367038a12.51.2025.03.19.12.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Mar 2025 12:33:47 -0700 (PDT)
Message-ID: <74d8af68-88f5-484a-9854-e00f4b0e33c1@gmail.com>
Date: Wed, 19 Mar 2025 20:33:52 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i2c: i801: Switch to iomapped register access
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <28ad9377-6d8a-4259-8cd4-7edaa00e26d7@gmail.com>
 <67535b17-c3fb-4507-b083-9c1884b4dd7d@gmail.com>
 <Z9nxRwoeLEriKP84@surfacebook.localdomain>
 <6brcnuejsoor5ejbudtd4wxdrgjzntjat6hqwardxgxierujkg@qvswqhafv36y>
 <22641e59-8e70-46f4-b01f-5cc6c0b9d23e@gmail.com>
 <CAHp75Vdem-DBERs18=VqO+MUh=5Nyg9XLp8Jg-NuQ1Zk7cjFeg@mail.gmail.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <CAHp75Vdem-DBERs18=VqO+MUh=5Nyg9XLp8Jg-NuQ1Zk7cjFeg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.03.2025 09:23, Andy Shevchenko wrote:
> On Wed, Mar 19, 2025 at 9:17 AM Heiner Kallweit <hkallweit1@gmail.com> wrote:
>> On 19.03.2025 00:22, Andi Shyti wrote:
>>> On Wed, Mar 19, 2025 at 12:18:47AM +0200, Andy Shevchenko wrote:
>>>> Wed, Mar 12, 2025 at 08:07:23PM +0100, Heiner Kallweit kirjoitti:
> 
> 
>>>>> Switch to iomapped register access as a prerequisite for adding
>>>>> support for MMIO register access.
>>>>
>>>> I believe that I at least discussed the similar change a few years ago or even
>>>> proposed a one. The problem here is that *_p() variants of IO port accessors
>>>> are not the same as non-_p ones. And commit message is kept silent about
>>>> possible consequences of this change.
>>>>
>>>> So, at bare minumum it would be good to test for some period of time before
>>>> going for it.
>>>
>>> How would you do it?
>>
>> Documentation/driver-api/device-io.rst states that the artificially delayed
>> _p versions were needed on ISA devices. And in general I didn't find any hint
>> that the non-delayed versions ever caused issues on PCI devices.
> 
> At least put this in the commit message. It will show that you were aware of _p.
> 
>> On my system using the non-delayed version works fine, but I can't say 100%
>> that it's the same for the very first (> 25 yrs ago) chipsets supported by i801.
>>
>> Likely users with old systems don't run -next kernels, therefore leaving
>> this change a full cycle in -next may not really help. We can argue that
>> we have the -rc period for testing (and reverting if needed).
> 
> My main concern is to make no regressions for most currently used
> cases, that's why one cycle in Linux Next is better than none.
> 

Even ICH7 datasheet from 2012 mentions that SMBus register space is also
memory-mapped. So all systems from at least the last 10 yrs should use MMIO
instead of PMIO now, and therefore not be affected by switching to non-delayed
PMIO access. This should significantly reduce the risk you're referring to.


