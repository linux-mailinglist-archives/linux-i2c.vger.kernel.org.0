Return-Path: <linux-i2c+bounces-8493-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D045F9F1339
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 18:08:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 134011886045
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Dec 2024 17:08:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DAFF1E47AE;
	Fri, 13 Dec 2024 17:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jc5rbykT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53FFC175AB;
	Fri, 13 Dec 2024 17:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734109717; cv=none; b=b4bfz56yWaZnbMa5QIX/VaGn7AW0CVpUANPcVUoJF77l585B5YeL+oqsriiPTkLNSPxBD1Etd+ak/KBzrTwkOuWQEEhyZkX6Jt6DRQh2H0U0pyZbeDwYWYDOoq33QqtLWZsAbCleRnqQDPZNkZxnAFusNjCXD1uhvPawlxumq04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734109717; c=relaxed/simple;
	bh=LAJeJTct7r8QPaM02vqQ+F4mdvWN06oz5yCwmbESdQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=C+guc8XR+51QkdqzDSdPvltGWEFiYNRwpHUiNb6gLqM/ZVA4bCAVDbiePPlV4WBhH4fVIH7KkA1Qjyeohw4XgFIThRC0KG+qYsTBQGhMgArGVtS3vlvbdRmsix1IrzUNjLZnlGlQUlNXbre2qPSc90f4s6fa0biK0JQCSBxMjbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jc5rbykT; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-725ed193c9eso1781061b3a.1;
        Fri, 13 Dec 2024 09:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734109713; x=1734714513; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=S4P5h27YPOkyA+5/aC4d0mYq670kQsIu4WEG26jSUHQ=;
        b=Jc5rbykTohfK6cL/6315chxsGhPpIjK33WU00zAXMOBHTRvcNAAf38lE0Atj5S75MD
         AHkSODDgu2I8esIXSs5VBz409bptjQs/DcmwDmVWR/SobW2xuTp13rRGtmaFUVKRS3Du
         l9yGfbIO12fgeeQb575TnZW4j+adlBcMVPO2Lf3HJ4cqDhHS7VPgOf+FO6qbO+238Fgc
         A+7OaCiIJYmIUYvF5CyIRshaD81fpKwSDQbd0CTQGA32reWb8uhsGbqZQSZ6iluPPAjL
         GgoSyhOLXCO28mnxt4eEbrPcQMXP0xX5sEIS9Voa/pwuOMm6ALHIajtQdEGx7icTf9ip
         Opaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734109713; x=1734714513;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S4P5h27YPOkyA+5/aC4d0mYq670kQsIu4WEG26jSUHQ=;
        b=TjPoF/ujuD/BLbhbmK8oOGrHKeRC/DjimetCkcMW+dw+ZSAe4/O7rM+d1/xt4OroDL
         /IYtd48GN58g3RfalJVgD15OjsoecggTSL+p9hFuSN0HCCQOGhRCbToQR/Tyo91yXAhK
         qAoESt/hKJAZMuLxbcF6OkNNGFvFj4pFCOIKaedAc2cnlJZBauvnuAGBakGHk1TF887O
         NkdR1pL0GNHQzfkIPSAKP8y9zxA/SzpSJOvkh38O3TndGlA10BnVYvjwRZHrFn4gHyPW
         eLkUhHYHr7/5zRuo50IKZIsY6YQu/T1vo3Jf/jpIvFbO6MwvV+IZG5qOFHcs43a9ezaY
         rHmg==
X-Forwarded-Encrypted: i=1; AJvYcCV9u97nageVwoJfeb8v2ytIl1KNd6K1eVOQ45xJ7EwoENEjypidZeJFinhguNRC6jT7VvOOOy4p2lo4@vger.kernel.org, AJvYcCVq+enJiK8xjXAbfTPJxFTi3IY+ahxrUqpCS80Y39hQlC0grMdIfMdjK9JEb44Gtg8jfEv3lYp/WjtC@vger.kernel.org, AJvYcCW/OUWZVdFDh3Epv3ZrLVkknartjsbnKt6qwCW6pe7YQCU+ZjxuV3mzGi4ogYP+EbGPzO0V1dE3BHCpW3g=@vger.kernel.org, AJvYcCWpKNVn+B8YSJ+XYc3W/c3wOyZYsz0KhK9gyB4H8cHKaVzclNzQrmSbO7UkPHvfYqLHpMEm9t1enuWa@vger.kernel.org, AJvYcCX4O/s/o92J7S82BXiJOqGTeCWcpVoYXk+daDdlx4YOxHXZi/hBE0xo2ExKhWuWq3G8kZ7d/xmcYpjrkTzG@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn8WRFs3Mtvlt+MoESVIIrQk1/KM091mNMSrKf2eoJIBtV02XM
	huPqwLGL4BmCiD9MvgvbDW1VUI1Psitm8R9M3JAJypZLn7mib1id
X-Gm-Gg: ASbGnctAJLT2s1IqAf8VXOPXPk1OWboK5MJqnIV6uS+xap9j2adJv2dkfdtTQuuUM++
	f3jMVkbEreROsLQFUMq2BNc6dH0Q/VWCzasCp8fBiKlhFg6QYWbjHLGTqaAauXdQwq0mVaW26+w
	u5sM3AAAu0Cg5pn7z+S4xYcOHiCLSsQyaZagSM+ORD1qJCcq8Hq5y5D8uy1gTWxXuMGhp0PPq/w
	lfcWe99TXHpJ7MP21Y3iMiUMLfpJetCYjUtnHIauXDlB8DnfiORgazv4seDZrEcMp3L1MZhFdjh
	JD57tszpaQdGIWUzj7pEgvgyWOj1FA==
X-Google-Smtp-Source: AGHT+IFNl1jFRcUys8+E1szg3JT/tH8apnoiFfDfmvVVa4TzEpKSuj2z6i8x4YQXRdjMljGMn4gdeA==
X-Received: by 2002:aa7:8b4e:0:b0:729:c7b:9385 with SMTP id d2e1a72fcca58-7290c7b9577mr4155847b3a.6.1734109713452;
        Fri, 13 Dec 2024 09:08:33 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ac5380sm13611b3a.5.2024.12.13.09.08.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 09:08:32 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2713e85d-f88a-49d6-8221-151e8631758c@roeck-us.net>
Date: Fri, 13 Dec 2024 09:08:30 -0800
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/4] hwmon: pmbus-core: Add label for fan and temp
To: Ninad Palsule <ninad@linux.ibm.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, eajames@linux.ibm.com, jdelvare@suse.com,
 corbet@lwn.net, joel@jms.id.au, andrew@codeconstruct.com.au,
 Delphine_CC_Chiu@Wiwynn.com, broonie@kernel.org, peteryin.openbmc@gmail.com,
 noahwang.wang@outlook.com, naresh.solanki@9elements.com, lukas@wunner.de,
 jbrunet@baylibre.com, patrick.rudolph@9elements.com,
 gregkh@linuxfoundation.org, peterz@infradead.org, pbiel7@gmail.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-i2c@vger.kernel.org
References: <20241212214927.3586509-1-ninad@linux.ibm.com>
 <20241212214927.3586509-2-ninad@linux.ibm.com>
 <f9d881b7-7301-476e-b281-0380dfcf0e10@roeck-us.net>
 <c7717f89-65cc-4668-a3e0-ee042cdcd426@linux.ibm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <c7717f89-65cc-4668-a3e0-ee042cdcd426@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/13/24 08:12, Ninad Palsule wrote:
> Hello Guenter,
> 
> On 12/12/24 16:06, Guenter Roeck wrote:
>> On 12/12/24 13:49, Ninad Palsule wrote:
>>> Adding label files for fan and temperature sensors in the power supply.
>>> The openbmc application dbus-sensor(psusensor) requires those files to
>>> consfigure those sensors.
>>> Note that prefix for temp label is temp[A..C] used instead of temp[1..3]
>>> as dbus-sensor(psusensor) application calculate index based on last
>>> digit in the name so we do not want to make index double digit after
>>> appending page index.
>>>
>>> Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
>>
>> We are not going to fix userspace problems in the kernel.
>>
>> Guenter
>>
> 
> Thanks for the quick review.
> 
> Sorry I am not clear on this. I feel that it is better to support labels for temperature
> 
> sensors and fans like other. Are you saying we should not support these labels or
> 
> I need update in the patch to support them better?
> 

There should be no such labels. Labels are supposed to have specific meanings,
such as "this is the CPU temperature sensor", not vague meanings such as "tempA".

Guenter


