Return-Path: <linux-i2c+bounces-5080-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B89AB93F818
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jul 2024 16:33:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C6AAB23762
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jul 2024 14:33:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF3B916D4C3;
	Mon, 29 Jul 2024 14:24:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HmNz/Y1m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C1E16C874;
	Mon, 29 Jul 2024 14:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722263042; cv=none; b=QDMVKL3aGXeJjwaR/MZkPr50pI+fphcrmaquVfOWgLD01qY18roSAXvCOlHIziaA6sOQiHPvK7wr/09Nbja+sAmfyDjbKHAelzwNCbVckjPwTSaTRYJwOAHG42sgPkn/i+AiKDa+kJcfOUyDwKSb1XS0NLABYoD8ZIU2vAbUgzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722263042; c=relaxed/simple;
	bh=/Wpe/5rYqdImbyCUVd1c11TTq1BqOeje/XYJfj5w1Ng=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cyZluvLon7QE4AOD0W7dsasoiCNR72pzcBt6++AWW839dP0pS0zW1/JCA9vdfej5C1WBeOlsLwPi67riN+RYcpkM50Cm68WScKphpKUnx0513zY8qen/dYCAaI+85HRq2Cjts8E88OPNniFEg2nhjaHjgGlVTn0r6n24GZzxlGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HmNz/Y1m; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1fc49c0aaffso18638075ad.3;
        Mon, 29 Jul 2024 07:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722263040; x=1722867840; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=p2ysJlNSRu0e/YbS024LG515JBsWr7m6Be9HrhDOPo4=;
        b=HmNz/Y1m1fzvN9inaK566Zl0ln93C/mZ1xltCCMrxBKHko9XIJhIslCcv5c4HX4C82
         01pPnkR2n/+4+ve6fACI0Tc7Pq30NRvCgS0O95j19dRAAzjfli0rKRmELF3EwYrdCGD7
         YNMC0flbP/kgXs6o5FAHxJCQw39uYSZPKvHGd9UcEZU9mHWH6o8nOeCeiFiHodQjn9n2
         wnIcNxqyOTIebE20lDun0VMEMspxSD5zJVQNOrbpip+VqOdmfARlZXY7mTNXUoyJD3DM
         rjCKXPl8/orbcZTJzDyd8WxIQiaH+IsBqkLVmMzPDsNBxhXwvPPxe2JC+ZMQabkVBoV9
         oF1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722263040; x=1722867840;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p2ysJlNSRu0e/YbS024LG515JBsWr7m6Be9HrhDOPo4=;
        b=Q+LrwMjxW3A1rJMD/d7pc4dIZL6bbnomVi7nipdD9j03oZNisD45J2uLICqH9vo5lj
         KwbbySRF3m0ppMfpDnuVZyzDGjp7zLvEtCNyG7OHObg5n2ty0bGSzdV693sdpv3/R736
         zDvarP/z21TEw3s+Eslrg1fkonaoo4RCr4QU6lYHPECP8HRviMlTZ0PbdhKT3zxlUoKg
         95eDVnVS1KX/S+FxOBx63gQz2/d8qjJVEXyL4UKhrBObJXCHTvCyL6c2FRCscGCOhHRr
         4zFiM42jldVRsgwC8tjSZrVTh2/2UwfmmjQDyMJCyKwy9uThHGJc6daVcs52ftZUnQ3l
         w5NQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkJYJZSeLoB88cxPNdLq++HIWA76i1jyiClrs9HRGwUkIKP0v8lBkRl8ISEsQn+/FFqVsR1bH5z60loyzwNohl9jn7Z0r9243mgmmhUeFOP0ZWVOoXH/8/c5rlgRxCTHJWZ9oQcGqh
X-Gm-Message-State: AOJu0Yx94Aekmz5b71BTDlk8HZCcUHm7d7z3DrooGtD6CGs865DhRc8k
	YX+5FPsUA6mLasCNIXm46QH4Fgj4q5us/jK85DtusAKLeKAkpT9Q7LgclQ==
X-Google-Smtp-Source: AGHT+IGM6FDVc1wL1cuIExdAjGhf3jvIBjOASAys1FEYBUj3AEU7eGT5WRJKXeC4mknY5mrBUUp6rw==
X-Received: by 2002:a17:902:f54d:b0:1fd:9044:13d8 with SMTP id d9443c01a7336-1ff047e43d5mr62893765ad.9.1722263039842;
        Mon, 29 Jul 2024 07:23:59 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ee15a9sm83575985ad.151.2024.07.29.07.23.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 07:23:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3adf0b8f-2e12-413a-a76f-866e56bf096c@roeck-us.net>
Date: Mon, 29 Jul 2024 07:23:57 -0700
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
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZqdLVg6IVTjsTWb4@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/29/24 00:57, Wolfram Sang wrote:
> Hi Guenter,
> 
> thanks for the feedback!
> 
>>> High level question: why the retry? Did you experience address
>>> collisions going away on the second try? My guess is that they would be
>>> mostly persistent, so we could call smbus_do_alert_force() right away?
>>>
>>
>> I honestly don't recall. I had some brute force code to trigger alerts
>> on connected chips. Maybe the idea was to catch situations where another
>> alert was raised after or during the first cycle.
> 
> Hmm, I'd think that SMBAlert then stays asserted and the whole alert
> handling will be started right away a second time? Given that all
> hardware works correctly, of course. Your setup showed that arbitration
> does not work well with actual hardware. Props for finding this out!
> 
>> As for "call smbus_do_alert_force() right away", I am not sure I understand.
>> Isn't that what the code is doing twice ?
> 
> It calls smbus_do_alert() twice (without '_force'). If that fails, it
> calls the _force version. I am wondering now if we can't call the _force
> version right after smbus_do_alert() fails once. Meaning we could remove
> all the "retries" code from your patch. If there is no clear reason for
> the code, not having it is easier to maintain. That's why I ask.
> 
> I hope the question is understandable now.
> 

I looked into the code again. The sequence is (or is supposed to be):

1st loop:
	if (!alert_pending)
		break;
	smbus_do_alert()
	if (failed at same address)
		smbus_do_alert_force()

2nd loop:
	if (!alert_pending)
		break;
	smbus_do_alert()
	if (failed at same address)
		break;

I think what you are suggesting is

1st loop:
	if (!alert_pending)
		break;
	smbus_do_alert()
	if (failed at same address)
		retries++;
2nd loop:
	if (!alert_pending)
		break;
	smbus_do_alert_force()
	if (failed at same address && retries)
		break;

But in reality that would not be much different because the alert status
is checked prior to calling smbus_do_alert() again.

With your suggestion (if I understand it correctly), the code would be
something like

                 /* Notify driver for the device which issued the alert */
                 status = device_for_each_child(&ara->adapter->dev, &data,
                                                retries ? smbus_do_alert_force : smbus_do_alert);
                 /*
                  * If we read the same address more than once, and the alert
                  * was not handled by a driver, it won't do any good to repeat
                  * the loop because it will never terminate.
                  * Bail out in this case.
                  * Note: This assumes that a driver with alert handler handles
                  * the alert properly and clears it if necessary.
                  */
                 if (data.addr == prev_addr && status != -EBUSY) {
                         /* retry once */
                         if (retries++)
                                 break;
                 } else {
                         retries = 0;
                 }

I don't know, I prefer my code. It keeps the exception /retry handling in one
place. Personal preference, maybe. Either case, retries could probably be made
a boolean.

Thanks,
Guenter


