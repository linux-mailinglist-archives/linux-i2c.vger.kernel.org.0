Return-Path: <linux-i2c+bounces-4507-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C13B891CF3B
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2024 23:56:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6DF472821A9
	for <lists+linux-i2c@lfdr.de>; Sat, 29 Jun 2024 21:56:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF2113DBBC;
	Sat, 29 Jun 2024 21:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZtxQDik+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7C22574F;
	Sat, 29 Jun 2024 21:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719698204; cv=none; b=WXH1dyL7T66+HmE4tcKv0ZJLqocgERLVN8ZGMMEbZiijAsZ/kMOQR8iEBVtuoBB6WmYzeCcJ7xN6HoAqZIM2+K5p1/SqXimF+ZJA4lOCZGjFbUNJxtRXpc0qTdOXG4jaensB2RjTJ2wRykZdmuK/nGdsDRLIclgqcQ7ihQehATA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719698204; c=relaxed/simple;
	bh=2SqD/S+lTZt/1eGc9gGuAA/M+u0pR32hC3KnA24ZuJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TkbdRfyXzqeGAD2x5vfbUNhHxGZ953FzJ6TcwQFEJANcmJP2B36ef4ghv6A7Ca35chinLI7d6nVHr/O0GSaO9FMo9NNPSTNjhTCSUd8tnHuUsCrjRL63yLtDkTImMFqjd0hwmdHtT5gVpT7+qU5K2h5Bth1JvIENAtT3Vcl9qm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZtxQDik+; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-57d06101d76so2037155a12.3;
        Sat, 29 Jun 2024 14:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719698201; x=1720303001; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UJ050AVfcVQGQxR6McWtlK57oDagEHehihSC/4Bd9sw=;
        b=ZtxQDik+Ykn0HAR8L0TCuoLSHczuXrWb3othfyx1otdFMbkh1/pPplrFtKIKVDl5ap
         Xqyppy4/mZVGjh0CnhQEy8DKhSr6l5v4KScYiLcSJt8yNcqP9eqtcyz5KleMCrwaxnup
         r6bkg7bq7ycbGa5i16QLe2KnHt6HYeS2BEVmMM/Huy6isnEKLq2/HIAWVDSPJe7ZgIIK
         /2TQsil2rmktrpEJdsWywGwFdfoOHAt2H3AFzZ6Km9Fnbkj1TvXIxb8TeJSPAOTMh0a2
         IArz2lWlv5DpRJ9jCWqAFCeY0Q6QKhp0vu+/2Dn+oDfYlTEwFdmIAYPu0OO7P6Uxz8UE
         sioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719698201; x=1720303001;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UJ050AVfcVQGQxR6McWtlK57oDagEHehihSC/4Bd9sw=;
        b=wcKNTio3LXg/US/TzVLkDfGvExVZLoaSwRJBOfEVPc2+E+Mtv3tsxXv4lqzRkdjTOt
         Cu39N75viToD84Tf5XIDZLBQG0jBAS6NbttYTZP3f6CZky/J84PAWNm1JQZS7fiBW1B1
         azZ4eD59v+sAj0ji3mvY9LaP7GbEU6Ekkv84OIrv2KkpQunq2otLQhoIgLhuB+TrbEIO
         03Cxx1+EWSuU/EUpE8u+WsDKoH1M3iM1Bgd8XS+hLUAg1YXADqN5Hi6/zVV3XfvWokxm
         XDkkxMBjpjHZDvHl+vZtZvHEumPatytCCi5BGgQNwDJJGBRTE8AOX1S2z/PYUtjzzeiw
         LYpw==
X-Forwarded-Encrypted: i=1; AJvYcCXAWB6zRcPKtZlNMDrn67Yh6HDmXcemBozgfe3VIT29a+nwJLfs4jGRahCR9EE0IpNd0hcSuJiFKeYXWJwX27pR3jocw/sAoe3Uop5jUuzQyWpqkji5V1qVajfUH82jtiGLBzeMAcfHgEnNyVp0o+3lePxxJFKAE8zAE3D8C7Lg/GWghaY=
X-Gm-Message-State: AOJu0YzSWNUI1LsNo/Uy0VysAl3IP0NAWip4DWQ4q2OreEi93G3zqVT4
	ezen+PrZafYVD//gztSC56+s9wTULbJY5nMmgO9aM4Q0OOsogX0wnvd/KA==
X-Google-Smtp-Source: AGHT+IH0s9apEg5LulNUUy3kx8A+vi8qYJn/PGkzSiotOHemWI7sy4cmaCEq3kXLfVKhZNI9uUlZmQ==
X-Received: by 2002:a17:907:86a9:b0:a6f:9ded:3200 with SMTP id a640c23a62f3a-a751440233emr130222966b.3.1719698200774;
        Sat, 29 Jun 2024 14:56:40 -0700 (PDT)
Received: from ?IPV6:2a01:c23:c588:e100:b576:b9a1:a7cb:98f6? (dynamic-2a01-0c23-c588-e100-b576-b9a1-a7cb-98f6.c23.pool.telefonica.de. [2a01:c23:c588:e100:b576:b9a1:a7cb:98f6])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-a72ae5ac5b8sm181077166b.14.2024.06.29.14.56.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jun 2024 14:56:40 -0700 (PDT)
Message-ID: <99d1f4bf-ce92-4e03-8945-8170ea96fc59@gmail.com>
Date: Sat, 29 Jun 2024 23:56:39 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression caused by "eeprom: at24: Probe for DDR3 thermal sensor
 in the SPD case" - "sysfs: cannot create duplicate filename"
To: =?UTF-8?Q?Krzysztof_Ol=C4=99dzki?= <ole@ans.pl>,
 Guenter Roeck <linux@roeck-us.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Wolfram Sang <wsa@the-dreams.de>
Cc: stable@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-hwmon@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <a57e9a39-13ce-4e4d-a7a1-c591f6b4ac65@ans.pl>
 <0dfa2919-98eb-4433-acb4-aa1830787c9b@roeck-us.net>
 <77c1b740-9e6d-40f7-83f0-9a949366f1c9@ans.pl>
 <97c497ae-44f7-4cec-b7d9-f639e4597571@roeck-us.net>
 <7341b238-ef4e-46c6-8ab5-f66a3cff2be0@ans.pl>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <7341b238-ef4e-46c6-8ab5-f66a3cff2be0@ans.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27.06.2024 13:24, Krzysztof Olędzki wrote:
> On 24.06.2024 at 07:54, Guenter Roeck wrote:
>> On 6/24/24 01:38, Krzysztof Olędzki wrote:
>>> On 23.06.2024 at 22:33, Guenter Roeck wrote:
>>>> On 6/23/24 11:47, Krzysztof Olędzki wrote:
>>>>> Hi,
>>>>>
>>>>> After upgrading kernel to Linux 6.6.34 on one of my systems, I noticed "sysfs: cannot create duplicate filename" and i2c registration errors in dmesg, please see below.
>>>>>
>>>>> This seems to be related to https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.6.y&id=4d5ace787273cb159bfdcf1c523df957938b3e42 - reverting the change fixes the problem.
>>>>>
>>>>> Note that jc42 devices are registered correctly and work with and without the change.
>>>>>
>>>>
>>>> My guess is that the devices are fist instantiated through the jc42
>>>> driver's _detect function and then again from the at24 driver.
>>>> The at24 driver should possibly call i2c_new_scanned_device() instead
>>>> of i2c_new_client_device() to only instantiate the device if it wasn't
>>>> already instantiated.
>>>
>>> i2c_new_scanned_device() also calls i2c_default_probe() at the end (unless
>>> different probe is provided) which seems risky given the comment that explains
>>> that it would use quick write for that address. However, maybe it is safe in this case?
>>> I wish we had a way to just tell "no probing is needed".
>>>
>>
>> Sorry, I don't understand why it would be less risky to just probe the device
>> without such a test.
> 
> 
> I'm referring to this comment on i2c_default_probe():
> 
> /*
>  * Legacy default probe function, mostly relevant for SMBus. The default
>  * probe method is a quick write, but it is known to corrupt the 24RF08
>  * EEPROMs due to a state machine bug, and could also irreversibly
>  * write-protect some EEPROMs, so for address ranges 0x30-0x37 and 0x50-0x5f,
>  * we use a short byte read instead. Also, some bus drivers don't implement
>  * quick write, so we fallback to a byte read in that case too.
>  * On x86, there is another special case for FSC hardware monitoring chips,
>  * which want regular byte reads (address 0x73.) Fortunately, these are the
>  * only known chips using this I2C address on PC hardware.
>  * Returns 1 if probe succeeded, 0 if not.
>  */
> 
> <CUT>
> 
>>> For now compile-tested only given the write-test concern above.
>>>
>>
>> The device detect code in the i2c core does that same write-test that you
>> are concerned about.
> 
> 
> There is no write-test testing in i2c_new_client_device() and I cannot find how 
> i2c_detect() would do that. However, after looking at this more, it seems that
> we actually have jc42_detect() precisely for this, as this is what jc42.c
> provides as the .detect callback.
> 
>>
>>> That said, I have some follow-up questions:
>>>
>>> 1. if the jc42 driver handles this already, I wonder what's the point of adding
>>> at24_probe_temp_sensor()? Is there a situation where it would not do it properly?
>>> Or do we expect to remove the probing functionally from jc42.c?
>>>
>>
>> The jc42 driver is not auto-loaded. When suggesting to remove the "probing
>> functionally", I assume you mean to remove its detect function. That would only
>> work if SPD EEPROMs were only connected to I2C adapters calling i2c_register_spd(),
>> and if the systems with those adapters would support DMI.
> 
> I'm not suggesting to remove it. I'm just asking why we have two two different mechanisms
> for doing the same thing and what is the plan longer term? A new code was added, where is
> seems the old one has worked just fine. As you mentioned in the other response, it even
> handles well a buggy DIMMS with their eeprom data incorrectly stating no temp sensor.
>  
Auto-probing (scanning) is a legacy mechanism, and all use cases but hwmon have been
removed meanwhile. One of the reasons is that the detect i2c access could do harm to
a device of another type that sits on one of the scanned addresses.
Explicit instantiation is preferred.

Another reason why explicit instantiation is preferred: It allows auto-loading of
i2c client driver modules. W/o explicit instantiation jc42 needs to be loaded
manually (or by some user space tool).


It seems we have two issues:
1. Calls to i2c_new_client_device() aren't serialized. Parallel instantiation
   of the same device can cause errors like reported here.
2. i2c_new_client_device() complains also if the same device has been instantiated
   already.

Issue 2 we may be able to tackle w/o big effort:
So far we just check for registered clients with the same bus address, and complain
if found. It should be possible (not tested yet) to include the client device name
in the check. If the names are identical, then we can assume it's the same device
that has been registered by other means already, and silence the error message.

>> In v6.9, i2c_register_spd() is only called from the i801 driver (Intel systems).
>> In v6.11, piix4 (AMD) will be added. Even after that, all non-Intel / non-AMD systems
>> would no longer be able to support jc42 compatible chips by just loading the jc42
>> driver. That would not be acceptable.
> 
> Indeed.
>  
>>> 2. I don't understand why we are also getting the "Failed creating jc42" and
>>> "sysfs: cannot create duplicate filename" errors since i2c_new_client_device() calls
>>> i2c_check_addr_busy() on its own and should abort after the first error message?
>>>
>>
>> The "Failed creating" message is from the i2c core's detect function which
>> is only called if a new i2c adapter is added. This is actually the case here,
>> since the call sequence of the backtrace includes i801_probe(). It looks like
>> i2c_detect() runs asynchronously and doesn't protect itself against having
>> devices added to a bus while it is running on that same bus. That is just
>> a guess, though - I have not tried to verify it.
>>
>> That does suggest, though, that even your suggested code above might not
>> completely fix the problem. It may be necessary to call i2c_lock_bus()
>> or similar from i2c_new_scanned_device() and i2c_detect(), but I don't know
>> if that is save, sufficient, or even possible.
> 
> Right... Which again brings the original question: is there a situation where
> jc42 is not able to detect the temp sensors on its own?
> 
> Krzysztof


