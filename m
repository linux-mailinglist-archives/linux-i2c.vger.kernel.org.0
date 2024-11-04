Return-Path: <linux-i2c+bounces-7758-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B70759BB6F2
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 15:00:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 766D72848D7
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Nov 2024 14:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4944F1442F6;
	Mon,  4 Nov 2024 13:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fm+a2Eyk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6881D1419A9;
	Mon,  4 Nov 2024 13:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730728642; cv=none; b=gUSve94cocxRIY/7ZfBQ+qkPEQbhy0t0qiS3LK1pOzG813l0D9nqB0s97nht/Kw4BtkyOWIKYV9Eiqe7sWABkZrp6Urm16rCeyZ3C0yWXkXaJo15YpEMDHWOxZofYkUrdl0Zt0/PofNMcCNaxNA4sB+nU7uhlWVEV1mXLBsAVLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730728642; c=relaxed/simple;
	bh=m0f4VFrEcVOrYj5aWLUs3Rw2YFaDtOAggS3nvH063g0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kGFSAo6UVWVuC+wasxYtjVJbpbmhovrZC0w2C53SEupfuHZflGBHieir7c2X5i9QAUdespy46CKRnCZqBc7bXFof4AXi/4fme2nQ0e+ktHOiTC3SfaHGKGk9LMtJwDtl0skjEPtar7swmxtfeDwuhA5bKjeWwxaImslGt5dhV2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fm+a2Eyk; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-720d5ada03cso2939318b3a.1;
        Mon, 04 Nov 2024 05:57:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730728639; x=1731333439; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=5ieXOrRxIqJ7bVUdXB2d/xLhSWWicBwFVZ7YQZ8GPTs=;
        b=Fm+a2EykiCqJhFGHI9tMXM3Ay0kk2ebSIN2t0dH9EDlKokokjd5LV3w8A8K4a/IB5z
         ksR+B3aQboKd/VXJlhkfJXCMxNVMvRuq02QAXdxdE2+usAabPiffyk7MCviVndth2mSo
         d1qwvveCJWcn4oinu9bFmZjTFPcl8C5AnpVdZNx6n96Hs7KSRWTr7jKoO8eqbacR+UuM
         D2xxp0vftKXa9ypizYZ5hUAmc9obCNL0yEt44bSj+neB2WnRxE54a36RTT5NJOQmtUE0
         9187CAyEmngOCb1DO9BnI9npnemx+Ez9bwbFkHe4mbeM/hI3n9b6nJaF+3p9a6i7iu0X
         zztA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730728639; x=1731333439;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ieXOrRxIqJ7bVUdXB2d/xLhSWWicBwFVZ7YQZ8GPTs=;
        b=SiORIXLgnBMxIAjQy3P+poOXdpToNzBV2x7kXk1a2o3dlmqRFNPDIrxfibm63aUMcs
         0pqEqMyxhXRH75Ngsr+g6lRNKYJfVI6UCDNWQsciMhGtP+M/nWwPUjFRqK77JnRG6n5A
         skgxLaEk+n7pAtmFOZPNOVQVX1W10Uvv8XVQ+vnLrp37Gn8a08+VYiKEj5+VHeaCoLPp
         yQCWmlgPA/+TrVWXr5FubEhc5nOvwF2xIJfFI3yj1IMBgfVpKeeVRvSadfzTZCp2tcxV
         EwEtjrr4UK2+vKpiS1zEhzvda4rUg3mLQwa7v196CKmcaGZ/xrtJnx42sFDQnOAYDmEm
         BAqA==
X-Forwarded-Encrypted: i=1; AJvYcCU66B+ye6w8MbrbdktKmRh/vnTgJOgyQx/1C83F3vXyiOKA/mdpGtWB7og1B1vfu9S0OPFExf0RF4O3dl4=@vger.kernel.org, AJvYcCUWH8Ror2upF22VtH5Htie47n7qHWkyBh3neN5xwA9DRMiIFMEJMlh0zfmYQ9oO0u4njscotFdAJiEb@vger.kernel.org, AJvYcCUj3CQuBIjwSOX7Ct/17Lu+9JXmqKrQmbuF7qULYbiPHcPY59dztdiU1SclTqKVWtjn/YmegGQeBYGB@vger.kernel.org, AJvYcCV+LQpo8RQ1zNYXfFYQQbbh0E+YoWuwB21yPZhHWbZ/0lic/5I8xJ9oQDG6LAb8robB45J2zwqCIHTY2pv/@vger.kernel.org, AJvYcCWhbM4wzm9Fdz2i+pOORXPSM1EmFFTnuabsssD2d5/AHFPVkWVCe3MsANL97j+TwKJ71qVl0oPik9ks@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4psXp8SOvFP7UJxT67dBtGItZLQ+eUKniXo7DMm+piVIISwkY
	osH3cfLFes0azNiCyTdBMk3mEakQHypH06/EV5K4PP9hb4br/Mx8
X-Google-Smtp-Source: AGHT+IH81HbQrA3v1sF7j+/e52PtrsaBlbyWaew+ccwFsuoCafGrJH08GSAi3ETeqkfwdrkDfCcB1A==
X-Received: by 2002:a05:6a20:d501:b0:1d9:21fb:d31f with SMTP id adf61e73a8af0-1db91e8047bmr23198450637.45.1730728639476;
        Mon, 04 Nov 2024 05:57:19 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1b897csm7726281b3a.14.2024.11.04.05.57.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 05:57:18 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0d9f1a5a-aa1d-4e99-8df7-3deb08433dc1@roeck-us.net>
Date: Mon, 4 Nov 2024 05:57:17 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] hwmon: (pmbus/core) add wp module param
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Patrick Rudolph <patrick.rudolph@9elements.com>,
 Naresh Solanki <naresh.solanki@9elements.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20241024-tps25990-v3-0-b6a6e9d4b506@baylibre.com>
 <20241024-tps25990-v3-3-b6a6e9d4b506@baylibre.com>
 <47164712-876e-4bb8-a4fa-4b3d91f2554b@roeck-us.net>
 <1jjzdj5qyy.fsf@starbuckisacylon.baylibre.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <1jjzdj5qyy.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/24 00:43, Jerome Brunet wrote:
> On Fri 01 Nov 2024 at 08:08, Guenter Roeck <linux@roeck-us.net> wrote:
> 
>> On Thu, Oct 24, 2024 at 08:10:37PM +0200, Jerome Brunet wrote:
>>> Add a module parameter to force the write protection mode of pmbus chips.
>>>
>>> 2 protections modes are provided to start with:
>>> * 0: Remove the write protection if possible
>>> * 1: Enable full write protection if possible
>>>
>>> Of course, if the parameter is not provided, the default write protection
>>> status of the pmbus chips is left untouched.
>>>
>>> Suggested-by: Guenter Roeck <linux@roeck-us.net>
>>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>>> ---
>>>   Documentation/admin-guide/kernel-parameters.txt |  4 ++
>>>   drivers/hwmon/pmbus/pmbus_core.c                | 74 ++++++++++++++++++-------
>>>   2 files changed, 59 insertions(+), 19 deletions(-)
>>>
>>> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
>>> index 1518343bbe2237f1d577df5656339d6224b769be..aa79242fe0a9238f618182289f18563ed63cba1c 100644
>>> --- a/Documentation/admin-guide/kernel-parameters.txt
>>> +++ b/Documentation/admin-guide/kernel-parameters.txt
>>> @@ -4733,6 +4733,10 @@
>>>   			Format: { parport<nr> | timid | 0 }
>>>   			See also Documentation/admin-guide/parport.rst.
>>>   
>>> +	pmbus.wp=	[HW] PMBus Chips write protection forced mode
>>> +			Format: { 0 | 1 }
>>> +			See drivers/hwmon/pmbus/pmbus_core.c
>>> +
>>
>> I have always seen that file as applicable for core kernel parameters,
>> not for driver kernel parameters. I can not accept a global change like
>> this without guidance. Please explain why it is desirable to have this
>> parameter documented here and not in driver documentation.
> 
> No reason other than trying to document things the best I can.
> Other subsystemw are documenting things in here too, I just did the same
> 
> See 'regulator_ignore_unused' for example.
> 

Basic rule: You can find examples for everything in the kernel, including
dell_smm_hwmon in the same file. That doesn't make it better. It only shows
that I did not pay attention. Trying to add all the other 80+ module
parameters of hwmon drivers, or all the 5,000+ module parameters from all
drivers, into the same file would not scale well.

Please document the module parameter in Documentation/hwmon/pmbus-core.rst.

Thanks,
Guenter


