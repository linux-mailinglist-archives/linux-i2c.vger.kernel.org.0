Return-Path: <linux-i2c+bounces-920-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B8781A7DF
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 22:08:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A0651F23A38
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Dec 2023 21:07:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A40414879E;
	Wed, 20 Dec 2023 21:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnEmSUWF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E546C48780
	for <linux-i2c@vger.kernel.org>; Wed, 20 Dec 2023 21:07:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33678156e27so70872f8f.1
        for <linux-i2c@vger.kernel.org>; Wed, 20 Dec 2023 13:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703106471; x=1703711271; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P0bXIhX+As+sgTpJV4+MRQyPFw6mSo37z8/HwSLHj8U=;
        b=RnEmSUWFA37HyLSXVPgrL/XPeJs9KsTVDI/PKCYdH9EB0WXKKSxoa7d7em2beZYSES
         KhxfwaMMw4eVDmi030bvUn7ng4CzCyaXtVKQF8ehFDjX3tKSjRaWBSc9/gMn/+mvor1P
         FE02Kz2qMwDpQV3Q5fzyHqo4FoGrZnrN7KkdVKh31b6Rv6u+gAerQ2uGl8tBcrDlHkMY
         BMCYJvYds1fiCJQZyJi5uTTzI/RVtOfoZKXaYyWw679pxDozjGt8MN3hd2SZRrx6cZeh
         li5ICz2CtrHb2yiHmLxjsawP+Ab+AiQrmWA5kpeZfxs2Z1qp84mNAignYEIDsy/DN7Wf
         lHsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703106471; x=1703711271;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P0bXIhX+As+sgTpJV4+MRQyPFw6mSo37z8/HwSLHj8U=;
        b=qFO/oN2diHkVvotHF6o5MApPlHIyCt7vBgyVCdwtj67jFyifte23yDXxdk3ZudIgN7
         qWRi+RP/1pb7icw5WYCnW21cMdgEJPN+bQBNK1BdwJWOj0Y6cOdiLhPVlVPR5FuM5wLV
         LA65jAtIENWpM0oa3yrfirTxiDb4Q9gNArl5Z5142Q8NBnrnzH4yzDwMtBV7w0WL2FF6
         3vzkem2HBv+ZDzolUho7iU+8c+aEkN2hOkfLokmoQbEsi7szJwAG5dPiSXdp5+t+ZwXK
         IOqvEUYVMerd2P7xgGPOIRBV1ej4x74fNkBlI+LlEEAu8SseQ1fMP9kjY1iZEMheF3pu
         OKeA==
X-Gm-Message-State: AOJu0YxSTQUVkQZo6uIUwe1EzkCtDeMmHcev6nHFIddSruA0DB/vEzbi
	I74mV/5Dw+Ph8tkGNW5q9/I=
X-Google-Smtp-Source: AGHT+IGftrX+bAzfPFS9nQSZIaPROGrjAC6v1lFkLOqJTnInzRi+XXoPlq8MBF/DerxM4oMwX9TFog==
X-Received: by 2002:a05:6000:120b:b0:336:7f93:3dcc with SMTP id e11-20020a056000120b00b003367f933dccmr147564wrx.81.1703106470747;
        Wed, 20 Dec 2023 13:07:50 -0800 (PST)
Received: from ?IPV6:2a01:c23:c0e1:2b00:cc8d:2472:9da4:1ff3? (dynamic-2a01-0c23-c0e1-2b00-cc8d-2472-9da4-1ff3.c23.pool.telefonica.de. [2a01:c23:c0e1:2b00:cc8d:2472:9da4:1ff3])
        by smtp.googlemail.com with ESMTPSA id ev12-20020a056402540c00b005537b9f7ce7sm255284edb.68.2023.12.20.13.07.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Dec 2023 13:07:50 -0800 (PST)
Message-ID: <a9ab1201-58fe-4b86-81fc-b58ce0b3cd2c@gmail.com>
Date: Wed, 20 Dec 2023 22:07:50 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] i2c: i801: Use I2C_CLASS_HWMON for i2c mux children
Content-Language: en-US
To: Jean Delvare <jdelvare@suse.de>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
 Peter Korsgaard <peter.korsgaard@barco.com>, Peter Rosin <peda@axentia.se>
References: <45c5366f-cbee-4c7d-bb62-a446935b2729@gmail.com>
 <20231106155036.366fb752@endymion.delvare>
 <a22978a4-88e4-46f4-b71c-032b22321599@gmail.com>
 <20231109145212.01f7b597@endymion.delvare>
 <4fdf5873-b366-4601-a9cd-58814eed321d@gmail.com>
 <20231110120822.7a81421e@endymion.delvare>
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <20231110120822.7a81421e@endymion.delvare>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10.11.2023 12:08, Jean Delvare wrote:
> Hi Heiner,
> 
> On Thu, 9 Nov 2023 17:34:15 +0100, Heiner Kallweit wrote:
>> On 09.11.2023 14:52, Jean Delvare wrote:
>>> For example, if DMI data says the system is using DDR4 and we were able
>>> to detect and instantiate an ee1004 SPD device at I2C address 0x50 then
>>> we should probe for a JC42.4-compliant temperature sensor device at I2C
>>> address 0x18. An SPD EEPROM at 0x51 would correspond to a possible
>>> JC42.4-compliant device at 0x19, and so on.
>>
>> Nice idea. How about our ASUS use case in i801? i2c_register_spd() isn't
>> called in case of muxing, neither for the parent nor for the mux children.
> 
> When I introduced i2c_register_spd(), I wanted to go one step at a
> time, as I didn't know what to expect due to the wide variety of
> systems affected. For this reason, systems where the SMBus is
> multiplexed were originally excluded. There's also a limitation in the
> function itself, on the number of memory slots, which is 4 for now, but
> could be lifted to 8 (maximum number of memory slots connected to a
> single SMBus segment).
> 
> The Asus boards we are talking about may have more than 8 memory slots,
> so they would fail the test. If we want to be able to use
> i2c_register_spd() on these boards, some adjustments will be needed.
> For example, we could add a parameter to bypass the memory slot
> counting, so that the function could be called on children segments
> (only a subset of the memory slots will be connected to that segment,
> so the total slot count it irrelevant). We would ignore the DMI data
> and hard-code dimm_count to 8 in that case, to probe all possible
> addresses.
> 
> Another approach would be to add a parameter (probably a bit field)
> describing which addresses should be probed, instead of guessing that
> from the dimm_count collected from DMI data. For the Asus boards in
> question, the information is known, and this would speed things up a
> bit by not probing addresses which can't possibly correspond to a
> memory module on a given board. That's only a minor optimization
> though, so not necessarily worth it. OTOH having that possibility would
> give more control on the probing, which may be useful for specific
> boards.
> 

Apart from the described extension of i2c_register_spd() I wonder where
to best call it for the muxed smbus segments.

At first I think we have to make the assumption that in case of muxing
memory slots are on the muxed child segments only.
At least I don't see an easy way to deal with the potential scenario that
some memory slots are on the parent segment, and some on muxed segments.

i801_add_mux() instantiates the i2c-mux-gpio platform device, and I think
loading and probing the i2c-mux-gpio driver can happen asynchronously.
This would mean we can't call i2c_register_spd() for the child segments
from i801. So we may have to call it from the i2c-mux-gpio driver.


