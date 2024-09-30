Return-Path: <linux-i2c+bounces-7090-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EF2989C4B
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 10:12:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9053F1F21101
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 08:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20775174EE4;
	Mon, 30 Sep 2024 08:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QgLtzwjS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375BD21105;
	Mon, 30 Sep 2024 08:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727683934; cv=none; b=DhvayrFgLMf1l1sawKCOBuwD2PFH6qq9Gco26CXgHBRLnFz12ZmDjDTEk27Z2pL6y2edpIjbD3y76x9zaDoek94Fsjox8fYIc/ogIslG3bAHzfPOncCvODUn0J79pd+xGKIsawtBvqzX+q3bW1PklP2WdDNDkHgUC3wREdVj7Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727683934; c=relaxed/simple;
	bh=jMYV+OsCdnKwrHOtjoPXKlOTUsr2kr1zI1bAUJAAmi8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rTY90HgYPZmvGsH59neUJNwsJVoqEPtx+I7A1XaS6LG8rcIN/cfqA9ITp8ao6e43XOd5GSg2Q2UCj4Gi1H4K++mIgD2gG8cJYWkrwahhQxVT0kjrAy78LUFYRfij8CU0AMcfDjWlmATGLcLLb+g8HtnqK+nGBBkCgbtRKXLkRWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QgLtzwjS; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5c876ed9c93so4018381a12.2;
        Mon, 30 Sep 2024 01:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727683931; x=1728288731; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/TGB6bH2TcqCgdjJpJteyQC0De+zldrrXfZ1oNFX+Lk=;
        b=QgLtzwjS8ciqzEyDwdS0HssYx6Ghuqk/AZiCYiYfEDTwpngvOy9t/aa0tPX8eX2mUT
         2UwluuOXoIu6HEaoZxctHyKgA0df/+xlU8niBgp0AxNPVnOEI5zBoImHA1arwjS4K6MI
         oxxuR+Q/qJ2YuAyAfIRvHfdnF/sBo92gnAnx+iOIFT5gvIuzDhohkTe56uefHUsTAak4
         lyo1O8h0g2MtbiosMo4p8el+I6cm/YfS4ECB8sMKN+42pD8qwVh9WDvBQg9qAPpoDk7B
         KnJPSLJVbpShZJpbfY4x61DrJdseYWDrCeOR/nNPatmltgkN9tcFcNlv204tlWQDJ4aX
         LwXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727683931; x=1728288731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/TGB6bH2TcqCgdjJpJteyQC0De+zldrrXfZ1oNFX+Lk=;
        b=XEmQiVNTpen8Jet8mPq5ODP9DuvNmNhoz4Jn56lvkLh6vY+3LgDmKvVPdW6P6HjPes
         1Z74+hoidUr92NkCEzZ1vJ0GsEZMH3RrYVY+B5lDZWmGD1kM+y9unhzfJ15vL/60vzOI
         dG7k+hiNAtqNOD7Ivka5ggbB2IJSTR5u01qLSOM/WYS8OHUyhM98DSYJHB8hw75BcJ1T
         PZaZKatWqAPxg/sGn2dnoK3yIvKDtdhcbJx+Ja8M2A1U28ZKpqgyOQl+OS0LuLUqMnQa
         xa/Q6S5ztxKdbL1NoUeeHdzjJCBSVb5SHS7vnCms13Gdnfy/51PncrN8Sbnu7R2ioQhq
         B2qg==
X-Forwarded-Encrypted: i=1; AJvYcCVlRr1Ty0KtYRsTaI9DfWh4uwCBLDMWHqv+yiSIU3EXgT1b3LsJQZofwaqs7VqoTIfVp3cSDx9+EpGm@vger.kernel.org, AJvYcCWFJs3FTV4UUcG3Bg+t4hvIzlrWEBULEMrWTIdJXx/tfXtuARqaeTNycGBIt5RmAAF14B4zWrUBFNo=@vger.kernel.org, AJvYcCX23zVB9+VOrL3XyCueS9tyiEHjFT8cPE+jJeShzn3rAplML7mtjyrv0AW172E5z5I5ZhKyryslGMAB@vger.kernel.org, AJvYcCX6NowBAnBGM3VaCqLoMXlqJGRvDz53vCNNN21YJx+oz0b5UCQjfgiUnSo5bldKWq6xW9icpF5cDhPBFw==@vger.kernel.org, AJvYcCXLUR8aV8EHKUtQYakuEpmHHbWbs7MwVNLFYhMEtKuTkViIbG319TXi1x9izXu5OojdGE4gXj7lCLO28vBo7qux@vger.kernel.org, AJvYcCXVKAYnl05l6GZpLXCRYV2114s1XsUSCOpao55wD3a98Yqf9+uyO/4R1YLfKYYo88Dx41CFKTGNfFFM@vger.kernel.org
X-Gm-Message-State: AOJu0YwLlWIfngxDagCTsaKo2SaoxK5t7ccDDo6In8vFouSGPHu1ivxd
	PLj0HMNG0WQ4OlL3WlndEBBtgFcpa/cF0A/LcE0aPjXMuYZ7T1Kj/qD8NOt6
X-Google-Smtp-Source: AGHT+IHwItsCLJWmACN7WgwJcigtet2UzUUCFHtY6IBa6j6Z1muQC67TRAPDAkpBaK8B64+FfGLNgQ==
X-Received: by 2002:a05:6402:5213:b0:5c8:8fe7:73a8 with SMTP id 4fb4d7f45d1cf-5c88fe774bdmr3833555a12.7.1727683931169;
        Mon, 30 Sep 2024 01:12:11 -0700 (PDT)
Received: from ?IPV6:2a02:8389:41cf:e200:880d:1266:eb97:7c18? (2a02-8389-41cf-e200-880d-1266-eb97-7c18.cable.dynamic.v6.surfer.at. [2a02:8389:41cf:e200:880d:1266:eb97:7c18])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c8824ba6a7sm4096681a12.27.2024.09.30.01.12.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Sep 2024 01:12:10 -0700 (PDT)
Message-ID: <23641fc9-9cdb-4a6c-a1a7-a2b49e949c04@gmail.com>
Date: Mon, 30 Sep 2024 10:12:08 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] i2c: Add driver for the RTL9300 I2C controller
To: Markus Elfring <Markus.Elfring@web.de>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 linux-i2c@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 =?UTF-8?Q?Thomas_Bogend=C3=B6rfer?= <tsbogend@alpha.franken.de>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>
References: <20240925215847.3594898-7-chris.packham@alliedtelesis.co.nz>
 <096aebcd-778c-4160-b478-bb26025f3940@web.de>
 <0c94d0fc-dc0c-4e35-a6c1-2d7e01a3eb43@alliedtelesis.co.nz>
 <4eb3dbbb-d3fd-43f4-b90d-9ecc222a87f6@web.de>
Content-Language: en-US, de-AT
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
In-Reply-To: <4eb3dbbb-d3fd-43f4-b90d-9ecc222a87f6@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30/09/2024 09:55, Markus Elfring wrote:
>>> …
>>>> +++ b/drivers/i2c/busses/i2c-rtl9300.c
>>>> @@ -0,0 +1,422 @@
>>> …
>>>> +static int rtl9300_i2c_smbus_xfer(struct i2c_adapter *adap, u16 addr, unsigned short flags,
>>>> +                  char read_write, u8 command, int size,
>>>> +                  union i2c_smbus_data *data)
>>>> +{
>>> …
>>>> +    mutex_lock(&i2c->lock);
>>>> +    if (chan->sda_pin != i2c->sda_pin) {
>>> …
>>>> +out_unlock:
>>>> +    mutex_unlock(&i2c->lock);
>>>> +
>>>> +    return ret;
>>>> +}
>>> …
>>>
>>> Under which circumstances would you become interested to apply a statement
>>> like “guard(mutex)(&i2c->lock);”?
>>> https://elixir.bootlin.com/linux/v6.11/source/include/linux/mutex.h#L196
>>
>> At this stage I don't what to change unless Andi insists that I do.
>>
>> I can't find much mention of using guard() on https://www.kernel.org/doc/html/latest/
> 
> Do you find any other information sources more encouraging?
> 
> 
>> but I can see enough examples (although notably none in drivers/i2c) that I _think_ I can see how I could use it.
> 
> See also (for example):
> Article “Linux Kernel Development - Automatic Cleanup”
> by Javier Carrasco Cruz
> 2024-06-17
> https://javiercarrascocruz.github.io/kernel-auto-cleanup-2#2-automatic-mutex-handling
> 
> Regards,
> Markus

My personal blog is definitely NOT an official or even reliable source
of information.

Thanks for referencing it, but please look for examples of guard() in
the kernel, because there are several examples for different kind of
mutexes. For example, IIO uses them widely. And they are really nice, so
I would recommend anyone using them whenever it makes sense.

Best regards,
Javier Carrasco

