Return-Path: <linux-i2c+bounces-14870-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id C1641CE8811
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 02:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 6E47D30021F5
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Dec 2025 01:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C281420C488;
	Tue, 30 Dec 2025 01:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="KZPy0NC5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E0B21E2614
	for <linux-i2c@vger.kernel.org>; Tue, 30 Dec 2025 01:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767059225; cv=none; b=KgrygXVs3pban5cEnZAEZTwNaIHbI9I4ab5qvcOb2NXVHkV7iRC8FiAHLpUYWa8r2Vwx+9QvqMCemGB47hdh3DENNOA/Uv8+AbzWHoMNMijMgps6tHDfKaQxHQs5l3JrG+7EyPkx0Xkh3zRBZ0ShT9q2mrIf8avsEfUoONVTXNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767059225; c=relaxed/simple;
	bh=jlqIQKlYvkLjCzXyksQk1n/qM4/mPjttP55BeybqUeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AAH+Jk5ZqUFEfKWPtYoBkCyr+q4RQoo9Vfi8Xuk1dFtRapjXC6qgyAyUimq82rDDJNtWcyvCj7BGuF4JsrwHnnvUnsZ+82WcFpkCzKKMuPwWBBAQborvBmdCDBkRhMohSrJRLeflg6XkbpJbK/la4zzwyvtvxgifJ8RC55uFqKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=KZPy0NC5; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-88a2d21427dso99452386d6.3
        for <linux-i2c@vger.kernel.org>; Mon, 29 Dec 2025 17:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767059221; x=1767664021; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JH3g/0hBjrKT7jpi4PSChPr53ZMsYZmR4Xe/Dnjr8C4=;
        b=KZPy0NC5kKT+sO6ei5K8f6Y0rf4j1KMlKRq8U2M/VPKYiutwAl9cIaItK0eprbDqul
         pG0svkL6HdYwvq6xVCpBakkielgFIJrVs5gK7dnSy05pgwxlx4IvhN4Whs5lf8allVm7
         FpOxx0qE+1juJmEw9Wec8LljVTNue6TDR+WCiva5i6q2+r/HZ5DoMT7e+b2MFHu+LJF0
         vhFmqt1A48xw/mSsMM42APV366Mygi7XrslsgHL1eMR570wIieRFKMxeASGJLxG2RCpF
         5ODwOkfYdbE36yn+QR0bJ/QoVezm3ASuUrv/BIcxDkXbezSFhPNzp3lvkMOvzbkALcwZ
         ILSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767059221; x=1767664021;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JH3g/0hBjrKT7jpi4PSChPr53ZMsYZmR4Xe/Dnjr8C4=;
        b=iZV1Kip/Yn+34wKtbNhdEkRZL7k2N2ljd5DgMnXIk/7UMA7j8/iQTWYMkTnf2uT2Nw
         Xa0xbJuEDk0ftOZ2a1ngWRJC4qDgiuplxNZBLoQ89+j0r6rUCwOyJCyBKKROeBT5xc8M
         wsv9bhET9LaieClYqtZ00ipPIkEBVnm060VGIjd7xEUnwyYHVf+OpNB8gw8g5DysaNMz
         QNhlq613CvNiUYcZKzs7T4/n9uLc6BLvsXXgLP5zxrtTtRkS+uzjQHx9ZkVQSi9oy/va
         RCoVR5tuzcRri+sm6Dii3Nm5nSyE61Q7e8jdH74KqZNkkYgNQVjQUtayxwaO8nfn0Ei4
         XSeg==
X-Forwarded-Encrypted: i=1; AJvYcCWpnfkOxIKTNDWEFLBlrcUc+CNgDcXu9+Wkm5ewtoiCPlgImgONJMaKNGFBhuJG7DVXaKce84hKYv4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx68HV4Nb9dHtzDE3c0CTDUlGQOEfdIexJgg/HYB19KmHOCwndU
	eTtdG4Umgg15xrgA4W+Dwi58u0InKZR671uLNNcrHC0v9kE1e0occSQpF5dQb/gNuZU=
X-Gm-Gg: AY/fxX6ac+QvcRqOyIBLzCXjfNUEA06ohvoB5hfJsoxOQ2h3lZrEdic0dvvs9i98nkO
	bVz7C08uCySz4LiUjizGZRQMB6KuxxQIxVCdrpjq9L0QfDcUXKWYapARawE21SK5OLiiBXFuE3K
	l2bNO39qHYUEjTToBbqwq993fufBQaa/dLh2CTXCfsrnlnarIpWjTjIExMdDpIHYs+E0nKvHXy+
	j6N1oOaW+HMmgptzQ6czZ3JuTdWiZmcAAjq3I6Oz4iy4xru/qn/Ml2Wo/NEILF9TzaXU2vXqd0L
	l0L3qW7pLM1323J2fZ3dwXRWHw8ktR0Z9fgfzgvZqyHqWCrye4ErBU9YZ6T9Gz3L7h0Ew1uHnAB
	V4Lg9CcXCQq6fF0+yOaypNzW1N5Ur0Y2XTsoGmU96WibfzyBZ49XroPdm0U3fpCSML9bDZzrJvy
	4cUyou/b/uLd+CcngcI8KtXIFOviAcFipdMKXR+q8vHmq7+6meJBs=
X-Google-Smtp-Source: AGHT+IH4p1A30uXu3TD99f1+30CbrJGzeImlEYTCEw3r0NYjnmHP1a52MpRfSdM/LAChoyn1EIiZLQ==
X-Received: by 2002:ad4:5c68:0:b0:88f:caa1:ae21 with SMTP id 6a1803df08f44-88fcaa1aecbmr389519426d6.32.1767059221300;
        Mon, 29 Dec 2025 17:47:01 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d99d7a08asm244416516d6.38.2025.12.29.17.47.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Dec 2025 17:47:01 -0800 (PST)
Message-ID: <6ca28183-1687-4ddc-8b3c-5e5be4255561@riscstar.com>
Date: Mon, 29 Dec 2025 19:46:59 -0600
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] rtc: spacemit: default module when MFD_SPACEMIT_P1
 is enabled
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Andi Shyti <andi.shyti@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org
References: <20251225-p1-kconfig-fix-v4-0-44b6728117c1@linux.spacemit.com>
 <20251225-p1-kconfig-fix-v4-3-44b6728117c1@linux.spacemit.com>
 <202512251653368b33c7e7@mail.local>
 <4c7c0f69-4732-4f62-970a-2a9273b3b5c7@riscstar.com>
 <20251230005142d1bfc6f7@mail.local>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251230005142d1bfc6f7@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/29/25 6:51 PM, Alexandre Belloni wrote:
> On 29/12/2025 12:02:23-0600, Alex Elder wrote:
>> On 12/25/25 10:53 AM, Alexandre Belloni wrote:
>>> On 25/12/2025 15:46:33+0800, Troy Mitchell wrote:
>>>> The RTC driver defaulted to the same value as MFD_SPACEMIT_P1, which
>>>> caused it to be built-in automatically whenever the PMIC support was
>>>> set to y.
>>>>
>>>> This is not always desirable, as the RTC function is not required on
>>>> all platforms using the SpacemiT P1 PMIC.
>>>
>>> But then, can't people simply change the config? I don't feel like
>>> this is an improvement.
>>
>> It's not an improvement for people who want to use the SpacemiT
>> P1 PMIC, but it's an improvement for all the other RISC-V builds
>> using "defconfig" that would rather have that support be modular
>> to avoid needlessly consuming resources.
> 
> But then, wouldn't MFD_SPACEMIT_P1 be simply not set or set to m ? So
> this doesn't have any impact on other RISC-V builds while it makes
> people using the SpacemiT P1 PMIC jump through hoops to be able to use
> the RTC as this is a very uncommon way to set default values.
> 
> My point is:
>   - other RISC-V platforms would simply not select MFD_SPACEMIT_P1 or
>     have MFD_SPACEMIT_P1 set to m
>   - having RTC_DRV_SPACEMIT_P1 built-in by default when MFD_SPACEMIT_P1
>     is built-in doesn't really hurt any SpacemiT P1 users but would be
>     the expectation of those using the RTC.

The "hurt" isn't about P1 users, it's about everyone else.

>   - those wanting to optimise because they won't use the RTC, they can
>     already simply unselect RTC_DRV_SPACEMIT_P1 or set it to m.


The purpose is to make the driver a module (not built-in)
when "defconfig" is used (without the need for any Kconfig
fragments to unselect things).


In arch/riscv/configs/defconfig, we have this:
     CONFIG_ARCH_SPACEMIT=y

In drivers/mfd/Kconfig b/drivers/mfd/Kconfig, we have this
(added by patch 2 in this series):
     config MFD_SPACEMIT_P1
	default m if ARCH_SPACEMIT

So when using defconfig (alone), MFD_SPACEMIT_P1 is set to m,
to benefit non-SpacemiT RISC-V platforms.

This patch is trying to do the same thing for the RTC,
i.e. having RTC_DRV_SPACEMIT_P1 be defined as a module
by default.

I think you understand.

					-Alex
>> I haven't done any testing on this but it looks fine to me.
>>
>> Acked-by: Alex Elder <elder@riscstar.com>
>>
>> I think it's a small change worth merging.  I don't think
>> doing so does any harm.  Your call or course, Alexandre.
>>
>> 					-Alex
>>
>>>> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
>>>> ---
>>>>    drivers/rtc/Kconfig | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
>>>> index 50dc779f7f983074df7882200c90f0df21d142f2..53866493e9bbaf35ff0de85cbfe43e8343eadc1e 100644
>>>> --- a/drivers/rtc/Kconfig
>>>> +++ b/drivers/rtc/Kconfig
>>>> @@ -410,7 +410,7 @@ config RTC_DRV_SPACEMIT_P1
>>>>    	tristate "SpacemiT P1 RTC"
>>>>    	depends on ARCH_SPACEMIT || COMPILE_TEST
>>>>    	depends on MFD_SPACEMIT_P1
>>>> -	default MFD_SPACEMIT_P1
>>>> +	default m if MFD_SPACEMIT_P1
>>>>    	help
>>>>    	  Enable support for the RTC function in the SpacemiT P1 PMIC.
>>>>    	  This driver can also be built as a module, which will be called
>>>>
>>>> -- 
>>>> 2.52.0
>>>>
>>>
>>
> 


