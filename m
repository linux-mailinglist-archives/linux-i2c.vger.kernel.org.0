Return-Path: <linux-i2c+bounces-7855-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 256D49BF518
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 19:19:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 490951C235D1
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Nov 2024 18:19:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 214D9207A3F;
	Wed,  6 Nov 2024 18:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hyP0kr3P"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F71617BB0F;
	Wed,  6 Nov 2024 18:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730917164; cv=none; b=AnctvX5xtFvwiAC/4r0GmieyNIitWawiTwuf1J41JNqZekY86X21LwQVolUTqBQVdqbmRk+guqbZdQSNJHLd8K7xfxvsKfmdBg3Yiyerq+CxfGDM9zxLVQ+EtoDOpfkt9I0rMRZtTvw/KIozGCoK1Noa5LZbHFhww060J1vIXLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730917164; c=relaxed/simple;
	bh=1utzmWPtOPf4qReDKLQv7MJbFCLzwTUC0N3ytTzrPEM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=igr+/7BRSGeBnRaKf4IwBClFcHhInvspbkG2QH/2SYDHMyuTgcHATmQC0qX0rV0AOrs2Pa3w9/h6GKhG3b53c0MpDAvocWePc7W5X6L8Ku1Z76RPa5sZTq/sfFJJSlGQoJkre+p+uAF5036VQRzOT7mvBSuWWWFX7VRfJlFMh+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hyP0kr3P; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71e7086c231so23759b3a.0;
        Wed, 06 Nov 2024 10:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730917162; x=1731521962; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=d3c+N0CJTSWnLeYAlGgxGiATnh5BDQ/EwFOdUlhU0vE=;
        b=hyP0kr3PI1j2umZv5X96v2kBxL/Th5eZW9QeHE7j60z1WDTxLuYXVBtQk6dPTPmn2L
         sEBuw6xvft4Trg2PqPVXlf4o31bwhmW5FnO5EvgZeieM9pbMr83tGrFY1QX1Cqz63eGc
         k3Bbi6y8rTAoiCphZwKnVX233cni+m/m9fFK5ZNIj2BYAzzL4f5m4lXUcUDhi2M2W7my
         V1LICJPLg4mwgEXBjb+YLkZ2Fsfy/jIeZQaa52C0vgaqJUu7sS4r1AysW31sgs2tfO3s
         MaqMePeYOwJYJANcvzn3vyuwUFbr5Owz48HLR9wvqf+dM4QbmExQjUlqfeKFPWVs0RKP
         aZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730917162; x=1731521962;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3c+N0CJTSWnLeYAlGgxGiATnh5BDQ/EwFOdUlhU0vE=;
        b=Tn4lizjhpmLNLv8nNYJI89ChqehgVttIh9Hdki5uBlikPWsNWnHX1b60TeocqpxFSU
         XO0nYq3Orivcd2QDjSO0Gu8TVLGpuHpNmNsLcXu7fWOS9VxdSLtF/+//XhlFOWoVWBqr
         oqpzXA/Wo9uucDUO6V+XZhkGi9btI86hHfvqsMvCLib9UarM3LOA/b+89De+CTXdC+BM
         LMbqV7g12r+Pr/nWy8FXlwReFOm8sEmM1C5V266jccV9nmZdQtvfrVhrOZsxBTFpYCqE
         qB5Lz0IcqaS3/kjN3koK/S6yNA49vsGAuPjW9g8x5n3xJBp4AKzWdLVufrKdSwn035lr
         TqLw==
X-Forwarded-Encrypted: i=1; AJvYcCUh/Du+S6vRlMdWrhay3Nm4VZohKr363vSZ6PJqSUt/e5RqXf/ljsNYiR7hhW8O96SHwd4B0zNN0PG106s=@vger.kernel.org, AJvYcCUsggFVjeFNjiCJJ6eL4dvAJv5d/LpoZwEHB9DnNDUH4rESZWQFzvnPy8ZCafZuQWXCXPjI6fXyBVNY@vger.kernel.org, AJvYcCVlq8UaueQasOQyY4KGkrUiG1edaw0c5oqoA1oB76D6HcStik+Aqp9KDl0y31+yfaQLn+MCn3Dn4MzgWhZO@vger.kernel.org, AJvYcCVyQhcVFllJ+lEMCTstTjDTO5PCqgLdfhi3Xsdj8JGDH77MfiWZYmSNHTuTHbLJElsK+dwrcat+Im+x@vger.kernel.org, AJvYcCWnk+mIBPLB4GeHoLhvNzwA8ZnMniFVOcdSr3RrHWj6+qBsj8YsXvE8FffQCXif+oFc01YBdIKxXRMG@vger.kernel.org
X-Gm-Message-State: AOJu0YytI9HnFk/4IwnlpK52rT6PKjuGcqDUZ9iyS/K2Q5vhi+liEUpf
	sFMbqLJ9z9YqGIq1L6jhwON2pvlYl2Uhs77GvlCOcz1euuOdUIUO
X-Google-Smtp-Source: AGHT+IGR3mJj6z5qvj2jLCfbkquSRqF6PutIQQjR7Oce8uwCn1kL4mBvwHNZ/QAmImgiGrG4kgkGuw==
X-Received: by 2002:a05:6a00:b86:b0:71e:7c92:a192 with SMTP id d2e1a72fcca58-72063093594mr52681338b3a.24.1730917162106;
        Wed, 06 Nov 2024 10:19:22 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bbfc35b2sm12186289b3a.0.2024.11.06.10.19.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 10:19:21 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f6e9cc1a-bdd7-4231-844e-2d8c5c3be50f@roeck-us.net>
Date: Wed, 6 Nov 2024 10:19:19 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: trivial-devices: add ltp8800
To: Conor Dooley <conor@kernel.org>
Cc: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Peter Yin <peteryin.openbmc@gmail.com>,
 Noah Wang <noahwang.wang@outlook.com>, Marek Vasut <marex@denx.de>,
 Lukas Wunner <lukas@wunner.de>
References: <20241106030918.24849-1-cedricjustine.encarnacion@analog.com>
 <20241106030918.24849-2-cedricjustine.encarnacion@analog.com>
 <8e4dc080-d779-4b06-8fd1-74784e06323a@roeck-us.net>
 <20241106-gatherer-glancing-495dbf9d86c7@spud>
 <20241106-overcast-yummy-9c6462ff2640@spud>
 <2b731ba8-1b6b-41eb-bae9-3403555506ef@roeck-us.net>
 <20241106-splurge-slaw-b4f1d33e4b09@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241106-splurge-slaw-b4f1d33e4b09@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/6/24 08:54, Conor Dooley wrote:
> On Wed, Nov 06, 2024 at 08:43:54AM -0800, Guenter Roeck wrote:
>> On 11/6/24 08:11, Conor Dooley wrote:
>>> On Wed, Nov 06, 2024 at 04:06:02PM +0000, Conor Dooley wrote:
>>>> On Tue, Nov 05, 2024 at 08:34:01PM -0800, Guenter Roeck wrote:
>>>>> On 11/5/24 19:09, Cedric Encarnacion wrote:
>>>>>> Add Analog Devices LTP8800-1A, LTP8800-2, and LTP8800-4A DC/DC μModule
>>>>>> regulator.
>>>>
>>>> A single compatible for 3 devices is highly suspect. What is
>>>> different between these devices?
>>>
>>> Additionally, looking at one of the datasheets, this has several inputs
>>> that could be controlled by a GPIO, a clock input and several supply
>>> inputs. It also has a regulator output. I don't think it is suitable for
>>> trivial-devices.yaml.
>>>
>>
>> All PMBus devices are by definition regulators with input and output voltages.
>> After all, PMBus stands for "Power Management Bus". Some of them are listed
>> in trivial devices, some are not. Is that a general guidance, or in other
>> words should I (we) automatically reject patches adding PMBus devices
>> to the trivial devices file ?
> 
> Personally I like what Jonathan does for iio devices, where he requires
> input supplies to be documented, which in turns means they can't go into
> trivial-devices.yaml. I wanted to add an input supply option to
> trivial-devices.yaml but ?Rob? was not a fan.

I may be missing something, but doesn't every chip have an input supply ?
granted, PMBus chips often have more than one, but still ...

> In this case it would need a dedicated binding to document the regulator
> child node and permit things like regulator-always-on or for any
> consumers of the regulator to exist. I suppose that probably applies to
> all pmbus bindings?

Yes. There may be a few exceptions, for example if a fan controller is
modeled as PMBus device, but that is rare. From a driver perspective,
exposing regulator nodes is optional, though.

> In this case, there seems to be an input "sync" clock that may need to
> be enabled, which is another nail in the coffin for
> trivial-devices.yaml.

I really don't know if it is a good idea to expose such data. That clock can
be connected to ground. It is only necessary in power-sharing configurations,
and requires all chips to use the same clock. I'd assume it to be a fixed clock
in pretty much all circumstances. The frequency needs to be configured into
the chip, but that needs to be done during board manufacturing because it
determines the switching frequency. Writing wrong data into the chip may
render the board unusable or even destroy it (I destroyed several PMBus chips
myself while playing with such parameters on evaluation boards). Maybe there
is some use case where changing the configuration is necessary, but I am not
in favor of exposing it due to the risk involved.

Thanks,
Guenter


