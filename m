Return-Path: <linux-i2c+bounces-3955-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08726902628
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 17:55:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DAB82814A1
	for <lists+linux-i2c@lfdr.de>; Mon, 10 Jun 2024 15:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8359143720;
	Mon, 10 Jun 2024 15:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IkZiEQhb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2C0142620;
	Mon, 10 Jun 2024 15:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718034931; cv=none; b=kaOgkI1q4bJgn/QMVukabk2owg0TsnSQEVrVqz4UOiurE26panj7m3iq3PNi2C+I/H196Bap686OeodkqS1h1/D3azd2Fgbe5XvG7nAyDiULEfPGFuBjmgM6TLAlqUKpwFyBcnGPbhKD/OxVVUnC71l17qFavOPl+tfqd37bEOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718034931; c=relaxed/simple;
	bh=0UAOy9iN/3VaU4DeCVfVA/APVIl8ZsWFbJBPb0K/yFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ea2mYxyD17DJDJuMhX08l4bRWErL5Z5oXOJbO1X410vKsp59ubKyhzs7z8u6lf7S4hYwNjMH/onJR1vQ9acRscJjfcNPTEnP7M+cX5B9yKh3nNCcv3KqV7uinfeKpn1LYyX8Hf2ZyEMcT6YDyv6TmMSRqd6RZvFOvpotz+LRJm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IkZiEQhb; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2c195eb9af3so90548a91.0;
        Mon, 10 Jun 2024 08:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718034929; x=1718639729; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=/z9wCsj/Fmg2uAjDDnmr4Npa382kmTNiC957TY/YawU=;
        b=IkZiEQhb46XInDECwqc6gS5Gyov6o45EvOuQMSlP+E2ujZBoET6b2U9MWm0MOny7Cc
         Pv/MoNB4fXt/gyrCIF8ZbGWUHquzOr+8qP0MaI0MDh6y/I4pdetrRWVnNlZwDq2N3ahi
         AkQXxnZccpUvsbXwuQvQzZ8KvwBaNC3iSTYdZdhHcb79gV/YixiNsXvn0tar7PxQ423Q
         WQePT4VUh6bCXg/1uIa0mfyNdNJqUiLboenkyr95OVpwLQ7Uodkd3Mo8Jkgx0/Kgx+CD
         tJ5R68P306QLQo1Pnp811pYwhFw+88Gii69oyb/irPO1eiPV2rzXnJsF5n0a4f+Yobt+
         7qwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718034929; x=1718639729;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/z9wCsj/Fmg2uAjDDnmr4Npa382kmTNiC957TY/YawU=;
        b=Io9n6FjVrO4DASRxGhizX/+vk5VyNQHAz24Q6Lg77mb/VYEUHgpBiRwdDqzD5A1mW7
         sVWTFtBjb71CT3KKcWxbWl0pvkGIq9tZl+Hdge+3yI12CvrVUlGPgVTzt5/Rj5OcQdEG
         2aRm1YFpevyh73GYire51RWZbRPqlF9Sb+k9gk3k/8+Ld1EPhs5IU61XHi0+ychbQtUA
         DZJyfagG5TDBgEBRpqakkN+pJWp3B+DZkU0zYPhHog61gAjeCQoj69Q8zHvPfj+Aw9+H
         FcpHXl39h8Lvuw6fqEllW1MxLgZjlbR5L/60YGuv5P/ufIQ/XZh1NArmoeApy1a1vhIZ
         fgKg==
X-Forwarded-Encrypted: i=1; AJvYcCVabRk0z1OxEXrRBNdiNpUC4Q83/m8gf3gxGI/2UcnctxTaHN1J90Aalu4tbF6doA+YCjG7zONQLxDoo9nnb2Idsb1HJBdRzF0J5hG2hKJ+wg22h9K0+tANPnWlJ4aaaXTKuASRFZbTR+bbgxLNWvgt/MJ2m0AmngSoFDEY05egQmimM3pAlr4WUGOO56CDMDN7PsXerhjdxEwtZsugvZEd
X-Gm-Message-State: AOJu0Yx17+QkljLer8MX9Dr/+BoKwUI8VvvKWCmfat+duQUkFE6iktkz
	hpgACWRUhAaLc/0+cSKmVi7xWGD9ym2S7E9T/qbvz4g8gyot/HRD
X-Google-Smtp-Source: AGHT+IEOtZHkEZ180ah272mtnveSAqhNzLRQ3xHgJE7hlmjqg8aropZ+yP48JBqTZCTOonAsyWj/HQ==
X-Received: by 2002:a17:90a:f98d:b0:2c3:7e3:6be0 with SMTP id 98e67ed59e1d1-2c307e36c7emr2895674a91.31.1718034929238;
        Mon, 10 Jun 2024 08:55:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c28066d573sm10747274a91.17.2024.06.10.08.55.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Jun 2024 08:55:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <79f406ae-cfc9-48bb-9c80-20f998c40b69@roeck-us.net>
Date: Mon, 10 Jun 2024 08:55:26 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] i2c: smbus: Support DDR5 SPD EEPROMs
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Armin Wolf <W_Armin@gmx.de>, linux-hwmon@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 =?UTF-8?Q?Ren=C3=A9_Rebe?= <rene@exactcode.de>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Stephen Horvath <s.horvath@outlook.com.au>
References: <20240604040237.1064024-1-linux@roeck-us.net>
 <20240604040237.1064024-6-linux@roeck-us.net>
 <c939b0c7-2c8c-4cf1-8d5c-9309ce0b371a@gmx.de>
 <txliuvufu6muqucno2uex2q6xvnveozpjzahx7zryqlvvvzrs7@flv2zztine6r>
 <a7e38754-ff1a-4e15-99b2-4785827efc83@roeck-us.net>
 <ib6p4ivqdn56l3jzzarsoeijjhwak33bmqvj2qiddbhxdqzchk@txl4gdslx4gq>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ib6p4ivqdn56l3jzzarsoeijjhwak33bmqvj2qiddbhxdqzchk@txl4gdslx4gq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/10/24 07:52, Wolfram Sang wrote:
> 
>>> Yes, maybe this could be simplified to "(LP)DDR memory types"
>>>
>>
>> I rephrased it to "Only works for (LP)DDR memory types up to DDR5".
> 
> Thanks!
> 
>> How about "Only works on systems with 1 to 8 memory slots" ?
> 
> This is a question for Heiner. I'd think it is is still correct, but I
> don't know exactly.
> 

My interpretation was that it should work if the DIMMs are connected to
multiplexed I2C busses, but probably not if they are connected to
different adapters. The error message in that case is a bit misleading,
though, because it claims that "More than 8 memory slots on a single bus",
which isn't necessarily the case. For example, it should be perfectly valid
to have up to 24 DIMMs in this system.

i2c-0/name:SMBus PIIX4 adapter port 0 at 0b00
i2c-1/name:SMBus PIIX4 adapter port 2 at 0b00
i2c-2/name:SMBus PIIX4 adapter port 1 at 0b20

... but I guess that is a question for someone with such a system to answer.

Ultimately the handling of systems with more than 8 memory slots will need
to be updated at some point. On my systems, with 'i2c: piix4: Register SPDs'
applied, I see

i2c i2c-0: 4/4 memory slots populated (from DMI)
     [my system is running 6.6.y which still generates that message]
i2c i2c-0: Successfully instantiated SPD at 0x50
i2c i2c-0: Successfully instantiated SPD at 0x51
i2c i2c-0: Successfully instantiated SPD at 0x52
i2c i2c-0: Successfully instantiated SPD at 0x53
i2c i2c-1: 4/4 memory slots populated (from DMI)
i2c i2c-2: 4/4 memory slots populated (from DMI)

meaning the function is called for each adapter (which makes sense).
However, the code counting the DIMMs doesn't really take the adapter
into account, meaning adapters 1 and 2 are still probed even though
all DIMMs were already instantiated from adapter 0.

On a system with more than 8 DIMMs connected to different piix4 adapters
(without mux) we'd probably see something like

i2c i2c-0: More than 8 memory slots on a single bus, contact i801 maintainer ...
i2c i2c-1: More than 8 memory slots on a single bus, contact i801 maintainer ...
i2c i2c-2: More than 8 memory slots on a single bus, contact i801 maintainer ...

which wouldn't be very helpful. I think the main problem may be that
the i801 driver implements sub-adapters as muxes, but the piix4 driver
doesn't do (or need) that. The message is also i801 centric which doesn't
apply anymore after 'i2c: piix4: Register SPDs' is applied.

However, I would not want to even try changing that code without access
to a system using piix4 and supporting more than 8 memory slots.

Thanks,
Guenter


