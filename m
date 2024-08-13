Return-Path: <linux-i2c+bounces-5343-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABDB950AC1
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 18:50:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4D3201C21E14
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 16:50:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17E1A1A254B;
	Tue, 13 Aug 2024 16:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ans.pl header.i=@ans.pl header.b="f17/iu+2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.emenem.pl (cmyk.emenem.pl [217.79.154.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E28E1EA84;
	Tue, 13 Aug 2024 16:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.79.154.63
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723567805; cv=none; b=UzQ2ycveQq6dizyBtVzlx+QvQZlunIBlaROn4q0c8NQ+oKsjmELLSbOBR6pgYEHScBj5AS2uPmOPEpawHHJ2vpNx0TeMiYFxPolFDtTowdHCALuiN0uxNl07GJA9yWeiK8NCmQ1+Y76ug118+WOM5l/d723m8YdwI4yLcffSDu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723567805; c=relaxed/simple;
	bh=7FlvYxm1sHKssvEviLrXCVI4tO2CdU5hnY4jPFNEJ1w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M67scf+k4q4g2vHcBQtXxHhsqv22nSkjJE/qW3hfA4pkhzqcSCLJC3QtZfXSaenQfLRBVfN6LA02gdxpP+Lm6XNi1HloieDVR8C/NKTtTZ4d0O9H9Nvw6IOrtvN3sCrPl6ftTVmgDOGf/rFY2DBcD4N6Jn/AD6BVFRbDPgT3FG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ans.pl; spf=none smtp.mailfrom=ans.pl; dkim=pass (1024-bit key) header.d=ans.pl header.i=@ans.pl header.b=f17/iu+2; arc=none smtp.client-ip=217.79.154.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ans.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ans.pl
X-Virus-Scanned: amavisd-new at emenem.pl
Received: from [192.168.1.10] (c-98-45-176-131.hsd1.ca.comcast.net [98.45.176.131])
	(authenticated bits=0)
	by cmyk.emenem.pl (8.17.1.9/8.17.1.9) with ESMTPSA id 47DGSkN1013361
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 13 Aug 2024 18:28:48 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ans.pl; s=20190507;
	t=1723566531; bh=u/YKptwkKOxxpGKP2ofGDqmwMq4DvqlrFcaZ5HKAMeM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=f17/iu+2VneCVljPaWJBKMjd+pKkkGXP7pZbtGarKFGJxwnzi2P+LNG6dzfxQTuGo
	 LeLQ0ZE4ytKGtETliwD69hA2xQLz+wsRuN2Cl6uoN1n69p4jJv1ZAQ7qRJ5hSduotw
	 T8lDgmnv7xgJAL1e2hTndnA1FkhYyYztAmErhI8U=
Message-ID: <9479fe4e-eb0c-407e-84c0-bd60c15baf74@ans.pl>
Date: Tue, 13 Aug 2024 09:28:44 -0700
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Regression caused by "eeprom: at24: Probe for DDR3 thermal sensor
 in the SPD case" - "sysfs: cannot create duplicate filename"
To: Heiner Kallweit <hkallweit1@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: stable@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <a57e9a39-13ce-4e4d-a7a1-c591f6b4ac65@ans.pl>
 <3365237d-5fb7-4cbd-a1c0-aff39433f5c2@gmail.com>
 <be8eb641-a16d-4fc5-b4cc-35c663c37df7@ans.pl>
 <55445bee-03c6-4725-8b1d-5f656018a8af@ans.pl>
 <93f1b363-9d1e-4d18-991f-b85e7ec0cfb0@gmail.com>
From: =?UTF-8?Q?Krzysztof_Ol=C4=99dzki?= <ole@ans.pl>
Content-Language: en-US
In-Reply-To: <93f1b363-9d1e-4d18-991f-b85e7ec0cfb0@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 03.08.2024 at 10:19, Heiner Kallweit wrote:
> On 23.07.2024 16:12, Krzysztof Olędzki wrote:
>> On 06.07.2024 at 18:42, Krzysztof Olędzki wrote:
>>> On 02.07.2024 at 13:25, Heiner Kallweit wrote:
>>>> On 23.06.2024 20:47, Krzysztof Olędzki wrote:
>>>>> Hi,
>>>>>
>>>>> After upgrading kernel to Linux 6.6.34 on one of my systems, I noticed "sysfs: cannot create duplicate filename" and i2c registration errors in dmesg, please see below.
>>>>>
>>>>> This seems to be related to https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?h=linux-6.6.y&id=4d5ace787273cb159bfdcf1c523df957938b3e42 - reverting the change fixes the problem.
>>>
>>> <CUT>
>>>
>>>>
>>>> Could you please test whether the attached two experimental patches fix the issue for you?
>>>> They serialize client device instantiation per I2C adapter, and include the client device
>>>> name in the check whether a bus address is busy.
>>>
>>> Sadly, they crash the kernel.
>>>
>>> I will get serial console attached there next week, so will be able to capture the full crash.
>>> For now, I was able to obtain a photo. I'm very sorry for the quality, just wanted to provide
>>> something for now.
>>
>> Sorry it took me so long - my attempts to coordinate setting up serial console
>> were not successful, so it had to wait for me to go there in person...
>>
>> I have attached complete dmesg, summary:
>>
>> [   10.905953] rtmutex deadlock detected
>> [   10.909959] WARNING: CPU: 5 PID: 83 at kernel/locking/rtmutex.c:1642 __rt_mutex_slowlock_locked.constprop.0+0x10f/0x1a5
>> [   10.920961] CPU: 5 PID: 83 Comm: kworker/u16:3 Not tainted 6.6.34-o5 #1
>> [   10.929970] Hardware name: Dell Inc. PowerEdge T110 II/0PM2CW, BIOS 2.10.0 05/24/2018
>> [   10.938954] Workqueue: events_unbound async_run_entry_fn
>>
>>
>> [   11.336954] BUG: scheduling while atomic: kworker/u16:3/83/0x00000002
>> [   11.342953] Preemption disabled at:
>> [   11.342953] [<0000000000000000>] 0x0
>> [   11.350953] CPU: 5 PID: 83 Comm: kworker/u16:3 Tainted: G        W          6.6.34-o5 #1
>> [   11.361954] Hardware name: Dell Inc. PowerEdge T110 II/0PM2CW, BIOS 2.10.0 05/24/2018
>> [   11.369953] Workqueue: events_unbound async_run_entry_fn
>>
> Thanks a lot for the comprehensive info. Reason for the deadlock is that calls to
> i2c_new_client_device() can be nested. So another solution approach is needed.
> I'd appreciate if you could test also the new version below.

The patch did not apply cleanly for Linux-6.6, so I had to tweak it a little
bit for the include/linux/i2c.h part, but it does seem to work. Everything
gets detected and there are no warning / errors:


[    8.311414] i2c i2c-12: 4/4 memory slots populated (from DMI)
[    8.314112] at24 12-0050: 256 byte spd EEPROM, read-only
[    8.314856] i2c i2c-12: Successfully instantiated SPD at 0x50
[    8.317513] at24 12-0051: 256 byte spd EEPROM, read-only
[    8.318252] i2c i2c-12: Successfully instantiated SPD at 0x51
[    8.320909] at24 12-0052: 256 byte spd EEPROM, read-only
[    8.322126] i2c i2c-12: Successfully instantiated SPD at 0x52
[    8.325538] at24 12-0053: 256 byte spd EEPROM, read-only
[    8.326789] i2c i2c-12: Successfully instantiated SPD at 0x53

# sensors|grep -A2 jc42
jc42-i2c-12-19
Adapter: SMBus I801 adapter at 3000
temp1:        +36.5°C  (low  =  +0.0°C)
--
jc42-i2c-12-1b
Adapter: SMBus I801 adapter at 3000
temp1:        +35.0°C  (low  =  +0.0°C)
--
jc42-i2c-12-1a
Adapter: SMBus I801 adapter at 3000
temp1:        +36.0°C  (low  =  +0.0°C)
--
jc42-i2c-12-18
Adapter: SMBus I801 adapter at 3000
temp1:        +36.5°C  (low  =  +0.0°C)

Feel free to add:
Tested-by: Krzysztof Piotr Oledzki <ole@ans.pl>

Thanks,
 Krzysztof

