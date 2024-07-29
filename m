Return-Path: <linux-i2c+bounces-5082-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D17A93FDA4
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jul 2024 20:44:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 97114B20C72
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jul 2024 18:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E31ED1862B7;
	Mon, 29 Jul 2024 18:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EggXI0G9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202968061C;
	Mon, 29 Jul 2024 18:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722278671; cv=none; b=OgNjcacqqmbsYGS7SN1wBouvWo+Vw0wCuW4SJopbPkT3gZWTrUkQoq9tvhr3XvGU0DDuUJsuVZYIEAGck3mcvmsrTUzMVsf/Wt1+HvnKTsnPUwAAj/1Bx9vgb0Zgkz7367olMJIDgHSlkd7bbMlsKJRkVCIuJdrbZInTB8IwO7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722278671; c=relaxed/simple;
	bh=Li9Qv0F3OtZT63D2Ttl4r8tsHmJ2LCjg1Y3aEAbr0YI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Tsj4VhU+L5kOWkgTRGGCvpT5Qw8VQlienCFYlbCDU39B020e4c5P2UgH4u2rqHXN8JOkLKba2t92qMavu2eUQWZiUvF4+1QVwRhwxYJs1HJH/OFKG1W+ASPfFOcWFBgwS6hgby/36y8gbFR7ZhqH/wrhi200Ha499Fvh4zbHcWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EggXI0G9; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-6c5bcb8e8edso2788774a12.2;
        Mon, 29 Jul 2024 11:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722278669; x=1722883469; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=UB0U60gxgWPGK6J/uwfeq1MccFvXaRCTKVbjL8V3OJo=;
        b=EggXI0G9ODM2EsxJoSBfIJTjaLHgsFvFLjRtyVCvhaxvGo4lxZqQS6hlJSfU4We8+/
         yP3mFC9vU51MYekl4plQgH3FCepqoPlltzXtZdIKmTqCmeA5RT7rXI2lLGiiLJNkGlgi
         2L4DWhlvuK9TEcLpjBnbmYwi/tTv2StE10LXjJOehbtTUc+dvGUHNXO/STEklE+Z3/kt
         LqYWKermoR04QpTyOGd1QDICms5Iw8bYVRoX4fcJ8nsM9BpqiX6FipeDwIHT/v22A1/Q
         FAMU5lCZVxayl39Te4zbjc7RAIJUNQA1M04Dma+VvIVMUe7VAI+h2SF7rEuzVMXzFuyO
         OtUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722278669; x=1722883469;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UB0U60gxgWPGK6J/uwfeq1MccFvXaRCTKVbjL8V3OJo=;
        b=bk6mjwrBplbWIuaFCdQaaRHywBqFu6J+IOJQzY9RnA7p83TAHN121LG2njrs8ZrOj2
         e9ocWaIiWRid1I7er9ZNPnSITbx0gMU7n3LrGXAxie1pZi6DKc15mFmxQHRGsuoyLoH3
         VxWTI8ZRPQ5ByYA4s/1rDjpZscjeFs/DLNWZqCGFGBtcTSsfGz6pM5kICc591DptPlJy
         Q7LKkfzFkddBwSV/PFaEb+xwgAk85v9GCtPmz/4fTGdP2mu8C91FI+l01KjiCZPlMXdO
         wOqI1OJIR+KCaWhMV0r1dALLWPOSKz/GSVJCvITXLLx5HS2b3uZn9JHt+aNLSc8+Q4lJ
         gUxQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5fP6vA0IwqmxhVeLqlZlgkkxLNKQyzd5KdKpqMGSxqDGBQrV0vQGtmzUgOl1pQIEoCL1Caynh4eka2FSxnNBvSqQhcUbFikGi/TCHux4MFaeflyy/GFKJxj5Jdz1u6woHPDbi/2ot
X-Gm-Message-State: AOJu0YyHzqw4QZEsIiqc7XvegYQ6y9ZrNUyL72MUqUgfnl3pEROIm5dS
	H77XA10aXDKnn76IlcWQ60ZHNgaeb4JvOsoKlW713YZnz+cngxXX
X-Google-Smtp-Source: AGHT+IGx3mxZ7EVwiJH5mWg8pUKF+sISjIt4tEqbfBvC7JWBvnmueQgzwEfKFWJ/PUy9csOpCJEiUg==
X-Received: by 2002:a05:6a21:3399:b0:1c2:8cc4:9084 with SMTP id adf61e73a8af0-1c4a13a3558mr11915795637.34.1722278669281;
        Mon, 29 Jul 2024 11:44:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7a9fa49c20fsm6435237a12.79.2024.07.29.11.44.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 11:44:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c58ca576-2763-4f73-bc0e-c33677c5228b@roeck-us.net>
Date: Mon, 29 Jul 2024 11:44:26 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: smbus: Send alert notifications to all devices
 if source not found
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Wolfram Sang <wsa@kernel.org>, Jean Delvare <khali@linux-fr.org>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220110172857.2980523-1-linux@roeck-us.net>
 <20220110172857.2980523-3-linux@roeck-us.net> <ZqakaAn3f9Kg6Lgy@shikoro>
 <7ad68f35-2e90-41b7-a95d-efe5f7db8f3b@roeck-us.net>
 <ZqdLVg6IVTjsTWb4@shikoro>
 <3adf0b8f-2e12-413a-a76f-866e56bf096c@roeck-us.net>
 <ZqfhPffOTu53bfwU@shikoro>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZqfhPffOTu53bfwU@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/24 11:36, Wolfram Sang wrote:
> 
>> I looked into the code again. The sequence is (or is supposed to be):
>>
>> 1st loop:
>> 	if (!alert_pending)
>> 		break;
>> 	smbus_do_alert()
>> 	if (failed at same address)
>> 		smbus_do_alert_force()
>>
>> 2nd loop:
>> 	if (!alert_pending)
>> 		break;
>> 	smbus_do_alert()
>> 	if (failed at same address)
>> 		break;
>>
>> I think what you are suggesting is
> ...
> 
> What I am suggesting is more like this:
> 
> 1st loop:
> 
>   	smbus_do_alert()
> 	//impossible to have same address on first run, so go to 2nd loop
> 
> 2nd loop:
> 
>   	smbus_do_alert()
>   	if (failed at same address)
>   		smbus_do_alert_force()
> 		break;
> 
> As I understand it, your sequence is missing "my" 1st loop with the
> invalid address, so you will end up having 3 loops altogether?
> 
> The code I am suggesting is bascially yours without the retries
> variable:
> 
> 	status = device_for_each_child(&ara->adapter->dev, &data,
> 				       smbus_do_alert);
> 	if (data.addr == prev_addr && status != -EBUSY) {
> 		device_for_each_child(&ara->adapter->dev, &data,
> 				      smbus_do_alert_force);
> 		break;
> 	}
> 	prev_addr = data.addr;
> 
> Makes sense or am I missing something?
> 

Yes, that should work and is indeed simpler. You are correct, the
additional loop should not be necessary since smbus_do_alert_force()
should already call all connected drivers and hopefully clear
the alert condition on those.

Thanks,
Guenter


