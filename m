Return-Path: <linux-i2c+bounces-10780-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id E121FAA9D91
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 22:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 37CAF7AC4BF
	for <lists+linux-i2c@lfdr.de>; Mon,  5 May 2025 20:49:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC0326A08C;
	Mon,  5 May 2025 20:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NR/62PU8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 046331D79A5;
	Mon,  5 May 2025 20:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746478242; cv=none; b=jg0ALmu+jSK+2yVkGM1x83q6jN9HLSKuiTtFFwoeU4akM4jzdnKQMAxcITRW4i2qsOytBKZDvvz8Ri/rw8lDictSVp29uo3o7EumuFBpkTLU6SeBnUut9sf+bX4oevHGie2Poi5b/NJogbqZjeQfW+govt9gLbsOXUATLR5cZK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746478242; c=relaxed/simple;
	bh=9TYwEBZs/GvR7/DYK3eMO8WVMZMTnhb2E3PN5UyGZOk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=bmMNL8JFAAOT4XLzqgR3LUTEQfZb3wBOBGHtP2CUleq6w9qdyoiNrYHU1+LfBokmqBTaqhAhNBLU+xdjd7GMpTPCwhGZl8fEILq2M3PDbmWHPzFV9MihU/c6MmSjprxWu82Ekjr3b1D9NPLCrC8yIZtFDCCWbve0z5eec5ecEtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NR/62PU8; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ff6cf448b8so6337200a91.3;
        Mon, 05 May 2025 13:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746478240; x=1747083040; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=JTjPxdMPmx0rSo3j6fxzsJZ2gZQSNJlySqm2GvohMEA=;
        b=NR/62PU8rcb66+MgUbGhm3hMBz+Kjn5ovde1ytvS7DV0sV0c55K+SoyfdIQX3sNYCy
         BgPvq7GRf1rgkt//OfTq/aqgNOcaEka4AHIKutD945DOabB0T3pKjMHfkgusI05Mm9xE
         wCf8wEqpdhTvGC6yO2VIo3hWWFAab4d0TSGcKec+W8Eqa7w0KazBYwYGQPGziXRq7ylZ
         YRfN9HjkgcuoV4E1lwpxg8tT15kS0lULACTJZKeodRzzsYJoWbwL2Gp1rrvDDw122vw4
         TeplzIGpDnTCrEh6b1wdA5lefYAolNOaz9ZX27Y4WCN562ffcEPWr3DeETpPr953ePwM
         otlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746478240; x=1747083040;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JTjPxdMPmx0rSo3j6fxzsJZ2gZQSNJlySqm2GvohMEA=;
        b=DUbsS9iQmW0zeP23/7swqUWKfjEz3zcT45HlSfw381D3Vki9aJMIRE57UMi9bHaf2Z
         m0F1AU989ijHHkw6htel+qMKfZgu40y5g1YbNWjYDQtrqAfY4zEjbZb5yzixmm03ScSU
         9bd8/cAnFIT+D5WT8CXUfQAPbPE880tfB+5YMoCZ4XNBsPCX7+amg2K9ZTlw06o7Mbea
         PDAmWVkxPeyCq4Xff1noEgV5op+POqrzRT89eP8m1ZhA+uTFG3HAlC5qA6n46nxcQ3ex
         Nl+6Id8htRrGhncfOsoe3HYUds0i/LiPQtVHqFGKREmoSRmUV3mD77S68Kxo55TPtbUv
         +z+A==
X-Forwarded-Encrypted: i=1; AJvYcCVB47BYfB/Qt48khFn9rd6Io8IVey7bKQyjGB9eaoTjs/5WWvChXVshQo1dU2shbHrGENO1464drVVy@vger.kernel.org, AJvYcCXkByEV4SwM7SThfHkiA/etSR7nEliOKCYVAFAYhyCIuU1WVyi4z8gsMehcsYXX1GTCRM3f+c/Kll8Jbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHCfrVj8vEF/qm+H5io/dsj6kE65tTZaZ/lgCoJcmrKtFPxN5l
	2scyZ2rt/vCFtGUpHmJnpsU5+ukr93izwKKWRQ2I+v8O4KRZTzGoN1EONw==
X-Gm-Gg: ASbGnctdfA3Gslj7nrxUwRyntdoNAx3ZH6dLhNIjhzTWDykW9WSjqt03aVCo9btyZFR
	sLIR2bV2bZPEFkJkIj/EkmvopPTXQmWRUgzCNYndx8NipRp6K+tn/ycumTjM5y3vubCGQZgxEX0
	aMEv2WMUupGwW0VZHkLl9RFD+rr5dR1yBo1ti3dc3VF0TESnvENy5ftgZ65Xv+hJhRdVTHWHAOl
	0XQyToPUtqCGB3/2NJ78PsISJQpVijUIqU4XcReRzxB1glWOWboUS3WQBFaAJKG5gCSKJ+YTPCl
	Tt1LLO7od4OHolGdRe1ohQvPX5435yrKgSgswCzGoNmm/SOzRK2/SSE6jwijItNYKEDuSCOoiTw
	5q4ZSCHmkI0bX9eex/kaYDwxO
X-Google-Smtp-Source: AGHT+IEmXY9DQNublSWqT5MFC+OyV4Axkp+OTniLBR5Jj+evQR2hSpc+PF0Sp6U2iI3EMMQB/8k4yQ==
X-Received: by 2002:a17:90b:17c5:b0:301:1c11:aa74 with SMTP id 98e67ed59e1d1-30a7f70554bmr435405a91.28.1746478240159;
        Mon, 05 May 2025 13:50:40 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4745f93asm9522666a91.3.2025.05.05.13.50.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 13:50:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e0e789b3-24c2-4ea3-9c79-fa815d801d83@roeck-us.net>
Date: Mon, 5 May 2025 13:50:38 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: PMBus memory overflow
To: Matt Corallo <yalbrymrb@mattcorallo.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-hwmon@vger.kernel.org, Linux I2C <linux-i2c@vger.kernel.org>
References: <336f298f-497f-4dd9-97ee-50b81221be06@roeck-us.net>
 <1b1eccff-a306-4e17-a6bf-fd3203c61605@mattcorallo.com>
 <1edc8396-535d-4cdf-bbb7-11d559d4c257@roeck-us.net>
 <cfc2b3c8-3f94-407a-a4d5-e7d81686eb2d@mattcorallo.com>
 <84258b48-03b5-4129-bed5-f8200996f2eb@roeck-us.net>
 <fcfd78d2-238d-4b68-b6ec-5ee809c4ef08@mattcorallo.com>
 <eb5796e8-de76-4e91-9192-65b9af7a4d49@roeck-us.net>
 <284466fd-39e8-419e-8af5-41dbabb788af@roeck-us.net>
 <d5abeb59-8286-425c-9f78-cd60b0e26ada@mattcorallo.com>
 <00baca6f-8046-46ae-a68c-525472562be7@roeck-us.net>
 <aAtEydwUfVcE0XeA@shikoro>
 <3a9ab7bf-6761-4a14-983e-e6bb288ce58a@mattcorallo.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <3a9ab7bf-6761-4a14-983e-e6bb288ce58a@mattcorallo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/5/25 13:41, Matt Corallo wrote:
> 
> 
> On 4/25/25 4:16 AM, Wolfram Sang wrote:
>>
>>> Wolfram, what do you suggest ? Fixing the cp2112 driver is obviously necessary, but
>>> I do wonder if a check such as the one above would be appropriate as well, possibly
>>> even combined with a WARN_ONCE().
>>
>> How annoying, there was still an unchecked case left? Sorry. Yes, the
>> core can have a check for a short-term solution. The long-term solution
>> is to support SMBUS3.x which allows for 255 byte transfers.
> 
> Thanks!
> 
> Any update here? I guess we already have a patch so no use in me trying to write one. Would be nice to get this in a pull so it can head through backports.
> 

Not from my side, sorry. I am deeply buried in work and don't have time for anything
that isn't super-urgent :-(

Guenter


