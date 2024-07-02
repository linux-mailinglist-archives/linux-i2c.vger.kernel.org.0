Return-Path: <linux-i2c+bounces-4587-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BD9924322
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 18:03:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2009C28BCFD
	for <lists+linux-i2c@lfdr.de>; Tue,  2 Jul 2024 16:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA35F1BD016;
	Tue,  2 Jul 2024 16:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZueNE306"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC57D1BC07B;
	Tue,  2 Jul 2024 16:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719936200; cv=none; b=h6GL0aa9Bd2NHMCyOu++gLeolbXwLmE8R52fsT19SWcmfyXzQB/mNFYwdGZdxgj7SStEow4RlVvcBZDKri2hD4VzE/tdYIgTmtIl5+6vBUR6OMCYwcvFsqtkQFHBel1ZozXhVHUQQY66BEJDY/nr38zuDWuQHsGsuEr2sMgWud8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719936200; c=relaxed/simple;
	bh=EetpY4q64pA1x1xJUgxN9lscBjQCG0Km3d5cTD1Caog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N9X1KE7EyaQgyor1h78L6mxOdOobPvKMUhc36IpgmrXfxnpMUEYtqLIFDQV//KKdnJ38SeeN8H6jgZ6IkKcGQFvLG7iFwaWepxzRiqyNpttfMN+KFwqMwnNU3h0iw1l8BqP4f49rLa72vPYU4W3Lp5PXg7bcE3mjRGYfPXEv6sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZueNE306; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-71871d5e087so2809212a12.1;
        Tue, 02 Jul 2024 09:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719936198; x=1720540998; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=VOCDEmYIHZROcBSdL0PJBK4WCgjYyChqfYQyzD3RlgY=;
        b=ZueNE3065NIwkEDWW24wiUL6wBEOpdE7CMLH+zkzuW0nIE5XyhRrs7O44cHbjN1iu5
         ek20EGymUyBuaHKfvZjWkco9GBxotZtf5IvQmkq44be1wkHspySacePk/JhtVEb4vF6Y
         YbGILh0h/U5R/ORqgqvIbxGIkLbzx5lXL7thPVYg39lZB+icyKcd1Y+H4GPmae5FWHPo
         VG9SKIVgjGwGthj4MOcY/7c4xtugKlUtncms0npoUvbsGPQrrwMN+EF/T8jiFRpRODQi
         f6Uqgc6SQhDeNgGUeutKtgPD3jqzJHUgvfr9Igp14zy1ogyRvmQutnXOjkko5g3fnH/U
         1YHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719936198; x=1720540998;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VOCDEmYIHZROcBSdL0PJBK4WCgjYyChqfYQyzD3RlgY=;
        b=M3Oa/VGvxXztGEuQ762gqiCiKq/2UdlHl1bfg/+JGgDbAoPQnBqDBUKWasYao2KUvG
         twvR9Gi+ixYsEDrsayD0mqZf27M5h1bOfie9+4+QxE5dbWkg5mC7xZggQaNmb0HWXGZB
         72WnuqlLIK+72uc8Dqc6GM6zrYj8UZaTC25d6TLQYkCSntYI3Wu3zEgQQywruclBsOTb
         9aRQFj3LaxZPx+go00YsCgjOQNlLfqg0A7J6nONqxsGGQo/GAiPl9zZ1MVBqNgQhf5lj
         6A2RL/TC9INy3pif3w7TXmKgp33LgMXy0xRbWFDD3MNUtxjsC6K4f4nbVAC8slQ3GljX
         3WEw==
X-Forwarded-Encrypted: i=1; AJvYcCXXNU47N74hEMkQSosP9+2RCTPUspEPmknCdZGmlBLN9GHM8qFeV01rjS6DgSAbdYFrf8k1MAtHPde5xBCiKFiHo9hi/OzM5Bm7qfEDecZQnpO/iszYAgtJl5xUP1CXqn6M1PAOTheP1ShGGFfF4xHyMothp+tGylKeZcKTJf/8Wian7K/Q10epxxMtwQxfKCbXk9P9w7vygYEj8PuqZHM2ovfUTH4KcY7gotYXk7wsY8IO785tgAqbTSsm
X-Gm-Message-State: AOJu0YwK3G/QZgupC3B43FxN6o1FV34QOjG4+gyBtAf9KA+KvZCKM67d
	WS71o7ZyTAPfsuh8I791lYD3eRQZE+ED9S8y5xFy3Jm/UcqrP3vh
X-Google-Smtp-Source: AGHT+IFj8+U1pU/WNiGVUnnG6j6JA6FBB1QeIhwSi1u2cdMTCD5/+oWwlDnfA0GZvnAsRvQmcs1f0w==
X-Received: by 2002:a05:6a20:43a2:b0:1bf:70c:b542 with SMTP id adf61e73a8af0-1bf070cc0a9mr9464264637.43.1719936196275;
        Tue, 02 Jul 2024 09:03:16 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-72c6c8ec501sm6750265a12.68.2024.07.02.09.03.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jul 2024 09:03:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <21146174-1903-4ef1-8e53-ac3982232418@roeck-us.net>
Date: Tue, 2 Jul 2024 09:03:11 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: Add MPS mp5920
To: Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Alex Vdovydchenko <keromvp@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sean Anderson <sean.anderson@linux.dev>,
 Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
 Alex Vdovydchenko <xzeol@yahoo.com>
References: <20240701145603.1507516-1-xzeol@yahoo.com>
 <20240701145603.1507516-2-xzeol@yahoo.com>
 <20240701-mug-scuttle-dfe4c84b4e0b@spud>
 <fcd91462-f8bb-4713-afc1-ba9473405396@kernel.org>
 <20240702-hacked-uncorrupt-f47bdc0ca8e3@spud>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240702-hacked-uncorrupt-f47bdc0ca8e3@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/2/24 08:44, Conor Dooley wrote:
> On Tue, Jul 02, 2024 at 03:10:38PM +0200, Krzysztof Kozlowski wrote:
>> On 01/07/2024 17:47, Conor Dooley wrote:
>>> On Mon, Jul 01, 2024 at 05:56:00PM +0300, Alex Vdovydchenko wrote:
>>>> Add support for MPS mp5920 controller
>>>>
>>>> Signed-off-by: Alex Vdovydchenko <xzeol@yahoo.com>
>>>
>>> Missing an ack from v2:
>>> https://lore.kernel.org/all/20240627-swivel-grower-002af077b654@spud/
>>> Acked-by: Conor Dooley <conor.dooley@microchip.com>
>>
>> That's third time you give the same ack. I suggest give up...
> 
> 
> Yeah, I guess. It's just not really any slower to re-ack than it is to
> complain about the ack being missing.


Makes me wonder though why I am still a kernel maintainer :-(.

Guenter


