Return-Path: <linux-i2c+bounces-4393-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB75C91A50B
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 13:25:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A1DCC28311D
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jun 2024 11:25:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9E92149C60;
	Thu, 27 Jun 2024 11:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ans.pl header.i=@ans.pl header.b="bP++RQQ9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.emenem.pl (cmyk.emenem.pl [217.79.154.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1CF148833;
	Thu, 27 Jun 2024 11:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.79.154.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719487515; cv=none; b=TJz99nU79TxzEjCqywGevMfMXUgxMsc2FJj+yQKib/vvhCkEd1tY/n1kIv3wAkh7sRk4FkhOIWz+vNBjQX4TJ/Hq9FRpHnRVzI0WzSWonkfNsoinCClpvxS5pN/Z1aq1hYlPCHSGQ8Qmde0tBO6UFcsbQmtVNkh9duMJcqaXdP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719487515; c=relaxed/simple;
	bh=Z4KsQd/1ziez+fSIw6VetVOOo83CDRC9tTpJc/n899U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p64MDDCbSD8TPSFIudcLqjGcqYHupktjCBg0BUXrG8Wvs8hBj8ATfXeSTOGlN3JBhOJMRMhDizOAbWmKRVeT5640auB2nW97aYC4XTpwf6s+UeZOAjkQJgt0dUovfjWdHfrdj4FEMuF0iECxgwNwSJ6z6qDWpYMPdXC6f889O/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ans.pl; spf=none smtp.mailfrom=ans.pl; dkim=pass (1024-bit key) header.d=ans.pl header.i=@ans.pl header.b=bP++RQQ9; arc=none smtp.client-ip=217.79.154.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ans.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ans.pl
X-Virus-Scanned: amavisd-new at emenem.pl
Received: from [192.168.1.10] (c-98-45-176-131.hsd1.ca.comcast.net [98.45.176.131])
	(authenticated bits=0)
	by cmyk.emenem.pl (8.17.1.9/8.17.1.9) with ESMTPSA id 45RBOXfH006191
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 27 Jun 2024 13:24:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ans.pl; s=20190507;
	t=1719487479; bh=k+CGpzPmyyeLy7CraZIMDwqjx/1Wpv82rcgGPlVnuvM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=bP++RQQ9/MbAb9U5MWKhLdCliR1ojTUhcxZm3mJZuiFntNxMb6Px9tY0wWUn0uiKy
	 sjOJQ+MQUULrp3OVtaeT6ndcbQZXupdDaPWevBNtiVDFfZnspc09ZdS/79+s6vJ/LL
	 p5ta59yCCLTsSueD2JhFrxxJDo3JxGl8Ddazxshs=
Message-ID: <7341b238-ef4e-46c6-8ab5-f66a3cff2be0@ans.pl>
Date: Thu, 27 Jun 2024 04:24:30 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression caused by "eeprom: at24: Probe for DDR3 thermal sensor
 in the SPD case" - "sysfs: cannot create duplicate filename"
To: Guenter Roeck <linux@roeck-us.net>,
        Heiner Kallweit
 <hkallweit1@gmail.com>,
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
From: =?UTF-8?Q?Krzysztof_Ol=C4=99dzki?= <ole@ans.pl>
Content-Language: en-US
In-Reply-To: <97c497ae-44f7-4cec-b7d9-f639e4597571@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.06.2024 at 07:54, Guenter Roeck wrote:
> On 6/24/24 01:38, Krzysztof Olędzki wrote:
>> On 23.06.2024 at 22:33, Guenter Roeck wrote:
>>> On 6/23/24 11:47, Krzysztof Olędzki wrote:
>>>> Hi,
>>>>
>>>> After upgrading kernel to Linux 6.6.34 on one of my systems, I noticed "sysfs: cannot create duplicate filename" and i2c registration errors in dmesg, please see below.
>>>>
>>>> This seems to be related to https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.6.y&id=4d5ace787273cb159bfdcf1c523df957938b3e42 - reverting the change fixes the problem.
>>>>
>>>> Note that jc42 devices are registered correctly and work with and without the change.
>>>>
>>>
>>> My guess is that the devices are fist instantiated through the jc42
>>> driver's _detect function and then again from the at24 driver.
>>> The at24 driver should possibly call i2c_new_scanned_device() instead
>>> of i2c_new_client_device() to only instantiate the device if it wasn't
>>> already instantiated.
>>
>> i2c_new_scanned_device() also calls i2c_default_probe() at the end (unless
>> different probe is provided) which seems risky given the comment that explains
>> that it would use quick write for that address. However, maybe it is safe in this case?
>> I wish we had a way to just tell "no probing is needed".
>>
> 
> Sorry, I don't understand why it would be less risky to just probe the device
> without such a test.


I'm referring to this comment on i2c_default_probe():

/*
 * Legacy default probe function, mostly relevant for SMBus. The default
 * probe method is a quick write, but it is known to corrupt the 24RF08
 * EEPROMs due to a state machine bug, and could also irreversibly
 * write-protect some EEPROMs, so for address ranges 0x30-0x37 and 0x50-0x5f,
 * we use a short byte read instead. Also, some bus drivers don't implement
 * quick write, so we fallback to a byte read in that case too.
 * On x86, there is another special case for FSC hardware monitoring chips,
 * which want regular byte reads (address 0x73.) Fortunately, these are the
 * only known chips using this I2C address on PC hardware.
 * Returns 1 if probe succeeded, 0 if not.
 */

<CUT>

>> For now compile-tested only given the write-test concern above.
>>
> 
> The device detect code in the i2c core does that same write-test that you
> are concerned about.


There is no write-test testing in i2c_new_client_device() and I cannot find how 
i2c_detect() would do that. However, after looking at this more, it seems that
we actually have jc42_detect() precisely for this, as this is what jc42.c
provides as the .detect callback.

> 
>> That said, I have some follow-up questions:
>>
>> 1. if the jc42 driver handles this already, I wonder what's the point of adding
>> at24_probe_temp_sensor()? Is there a situation where it would not do it properly?
>> Or do we expect to remove the probing functionally from jc42.c?
>>
> 
> The jc42 driver is not auto-loaded. When suggesting to remove the "probing
> functionally", I assume you mean to remove its detect function. That would only
> work if SPD EEPROMs were only connected to I2C adapters calling i2c_register_spd(),
> and if the systems with those adapters would support DMI.

I'm not suggesting to remove it. I'm just asking why we have two two different mechanisms
for doing the same thing and what is the plan longer term? A new code was added, where is
seems the old one has worked just fine. As you mentioned in the other response, it even
handles well a buggy DIMMS with their eeprom data incorrectly stating no temp sensor.
 
> In v6.9, i2c_register_spd() is only called from the i801 driver (Intel systems).
> In v6.11, piix4 (AMD) will be added. Even after that, all non-Intel / non-AMD systems
> would no longer be able to support jc42 compatible chips by just loading the jc42
> driver. That would not be acceptable.

Indeed.
 
>> 2. I don't understand why we are also getting the "Failed creating jc42" and
>> "sysfs: cannot create duplicate filename" errors since i2c_new_client_device() calls
>> i2c_check_addr_busy() on its own and should abort after the first error message?
>>
> 
> The "Failed creating" message is from the i2c core's detect function which
> is only called if a new i2c adapter is added. This is actually the case here,
> since the call sequence of the backtrace includes i801_probe(). It looks like
> i2c_detect() runs asynchronously and doesn't protect itself against having
> devices added to a bus while it is running on that same bus. That is just
> a guess, though - I have not tried to verify it.
> 
> That does suggest, though, that even your suggested code above might not
> completely fix the problem. It may be necessary to call i2c_lock_bus()
> or similar from i2c_new_scanned_device() and i2c_detect(), but I don't know
> if that is save, sufficient, or even possible.

Right... Which again brings the original question: is there a situation where
jc42 is not able to detect the temp sensors on its own?

Krzysztof

