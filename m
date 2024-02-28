Return-Path: <linux-i2c+bounces-2047-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B87186AFFC
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Feb 2024 14:10:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EFC51C210BA
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Feb 2024 13:10:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B178149E17;
	Wed, 28 Feb 2024 13:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CMog9+t9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E2514A4FC
	for <linux-i2c@vger.kernel.org>; Wed, 28 Feb 2024 13:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709125822; cv=none; b=jcpSVgwb75tt/8LfeJeo90sev/fVH5h9iGLiiXJVxm2yRb6Itc/s8UEMZz/+39VT6FCIw+dqPoMrGk9VGhS9uLcB3LwW/bcbMB+pIZBNdjHj6rBDS5vo9dpAVF9X6c7xZlI2AiU6jZjpFH/R/ODBTiJWDXWzwTdnVKt1Fd1qBiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709125822; c=relaxed/simple;
	bh=M4E1rwnTlnzfrruXE8DGxlNzb5PJaOHTEaClwvFTksE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DDuK76NYcLQwP7jWO1vu8f+bt+Hm+TTdAXbwusM7zvhZ1eVQekfOU51uwvi7wccSlHIrpva6idFzGJn1p98+/nbqv8JKIKXtfnVQVdO3ItA5O2nfy5QCrBhCu/+guEQoE9cWDDEFnW1ZLo+rmOwjhU46Uv2PaDfq6ZJlrr5s4GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CMog9+t9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709125819;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DexqIOoSO9KFMr8XQf/oDgjK6Z6M/Fq/dKZt8eVix00=;
	b=CMog9+t9+32ywa5Zv2PerG7WrzLFIL8XDjT9FIId7ZUCLQphngwZQ/yT7W38iR4Qdn3k6B
	68M4nCC+vWdBvllGjYBTdsCDIQJCHguhcRlvlxMQ1B0mGK+ccLHDgjRKa7JmcnyxY63VFm
	nHtA7f90H1SZNyViDDbgH88U86sSbsg=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-530-ByuCNzTBNZ29w5ZVGxCXSw-1; Wed, 28 Feb 2024 08:10:17 -0500
X-MC-Unique: ByuCNzTBNZ29w5ZVGxCXSw-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2d23293d981so36428371fa.3
        for <linux-i2c@vger.kernel.org>; Wed, 28 Feb 2024 05:10:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709125816; x=1709730616;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DexqIOoSO9KFMr8XQf/oDgjK6Z6M/Fq/dKZt8eVix00=;
        b=Ef28ydJNNw1uBMzQrdIC7OuJexK1G6+655MQZO4at8ceEtm3McyDgzyPsszwQUIRTW
         2E4mCG5h5E+tjJUCTKnUqPLiysjhaMetXfl5t4qSCmiIOjUNIfidhuQkuUt5gzuzOjho
         s8xY1mvgDNqhmMX90UMlPj1SiU5WptxnjWuqTVzWZLZFLSmPw2mSbqhYqI2LKonK4lpy
         1lLelZ+z25R+0Kh20xKsjF+oJuj7zYnHGUsglGcPzNi4JoLoGd+U0tbe9JK5QhpZjZxZ
         ndtMGZWVLNj/1JDpH34kh8JqGOTq+mLo0s3/7BHBEVjtyQ2aCMdJIUp9L6eioPInK21o
         O2DQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIs0vxqFAfmUusqb5Kyi4hiJwFUn17GNgBjt9F07mTZkximhTGii+FTUZ8MktLs+b2m2SwwUoulO7hWlsJUSsLp73kubkLZODY
X-Gm-Message-State: AOJu0YxY9WT7zz5khW7T5aXMtpuaDeh/iUSg7qOJC5KmPPI8gOfDZMlb
	+67gjtlFbthL0XaE+StRYE1Bl6bRHquyaLaYq7rMK8Cwh76rIAKESsClrJ3nqzV/Fj4a8EbTSe1
	N2bqZ47NdIS0VFPCOAbFYpJUz1gWgt4bW64xZm94mysxlAuCtvTTy+UD5hg==
X-Received: by 2002:a05:6512:282c:b0:512:a371:3b27 with SMTP id cf44-20020a056512282c00b00512a3713b27mr11104251lfb.13.1709125816191;
        Wed, 28 Feb 2024 05:10:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHWG4RNhU5mSzkXO97COQPuG5NqxMD1scCzapw5gUTR2z4HgXun7bjZqZsqL1t6MHT678WVZA==
X-Received: by 2002:a05:6512:282c:b0:512:a371:3b27 with SMTP id cf44-20020a056512282c00b00512a3713b27mr11104234lfb.13.1709125815792;
        Wed, 28 Feb 2024 05:10:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id c5-20020a0564021f8500b005653439cadcsm1778400edc.25.2024.02.28.05.10.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 05:10:15 -0800 (PST)
Message-ID: <4344926b-40e9-4423-b208-c18263248a82@redhat.com>
Date: Wed, 28 Feb 2024 14:10:14 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/6] platform/x86: dell-smo8800: Move instantiation of
 lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Content-Language: en-US, nl
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Jean Delvare <jdelvare@suse.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Paul Menzel <pmenzel@molgen.mpg.de>,
 Andi Shyti <andi.shyti@kernel.org>, eric.piel@tremplin-utc.net,
 Marius Hoch <mail@mariushoch.de>, Dell.Client.Kernel@dell.com,
 Kai Heng Feng <kai.heng.feng@canonical.com>,
 platform-driver-x86@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
 linux-i2c@vger.kernel.org
References: <20240106160935.45487-1-hdegoede@redhat.com>
 <20240106160935.45487-3-hdegoede@redhat.com>
 <20240107171055.ac7jtwhu2kbalaou@pali>
 <20240213173050.0cf4a58f@endymion.delvare>
 <3e5b47ce-29a9-43a3-92bc-599a9a716fbb@redhat.com>
 <20240227214011.xeys7rtukn6hksdw@pali>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20240227214011.xeys7rtukn6hksdw@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Pali,

On 2/27/24 22:40, Pali Rohár wrote:
> On Saturday 17 February 2024 11:33:21 Hans de Goede wrote:
>> Hi Jean,
>>
>> On 2/13/24 17:30, Jean Delvare wrote:
>>> Hi Pali, Hans,
>>>
>>> On Sun, 7 Jan 2024 18:10:55 +0100, Pali Rohár wrote:
>>>> On Saturday 06 January 2024 17:09:29 Hans de Goede wrote:
>>>>> It is not necessary to handle the Dell specific instantiation of
>>>>> i2c_client-s for SMO8xxx ACPI devices without an ACPI I2cResource
>>>>> inside the generic i801 I2C adapter driver.
>>>>>
>>>>> The kernel already instantiates platform_device-s for these ACPI devices
>>>>> and the drivers/platform/x86/dell/dell-smo8800.c driver binds to these
>>>>> platform drivers.
>>>>>
>>>>> Move the i2c_client instantiation from the generic i2c-i801 driver to
>>>>> the Dell specific dell-smo8800 driver.
>>>>>
>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>> ---
>>>>> Changes in v2:
>>>>> - Use a pci_device_id table to check for IDF (non main) i2c-i801 SMBusses
>>>>> - Add a comment documenting the IDF PCI device ids
>>>>> ---
>>>>>  drivers/i2c/busses/i2c-i801.c            | 126 +----------------------
>>>>>  drivers/platform/x86/dell/dell-smo8800.c | 121 +++++++++++++++++++++-
>>>>>  2 files changed, 123 insertions(+), 124 deletions(-)  
>>>>
>>>> I'm looking at this change again and I'm not not sure if it is a good
>>>> direction to do this movement. (...)
>>>
>>> Same feeling here. Having to lookup the parent i2c bus, which may or
>>> may not be present yet, doesn't feel good.
>>>
>>> I wouldn't object if everybody was happy with the move and moving the
>>> code was solving an actual issue, but that doesn't seem to be the case.
>>
>> I thought you would actually like getting this somewhat clunky code
>> which basically works around the hw not being properly described in
>> the ACPI tables out of the generic i2c-i801 code.
>>
>> I didn't get around to answer's Pali's concerns yet, so let me
>> start by addressing those since you indicate that you share Pali's
>> concerns:
>>
>> Pali wrote:
>>> Now after looking at this change again I see there a problem. If i2c-801
>>> driver initialize i2c-801 device after this smo8800 is called then
>>> accelerometer i2c device would not happen.
>>
>> That is a good point (which Jean also points out). But this can simply
>> be fixed by making the dell-smo8800's probe() method return -EPROBE_DEFER
>> if the i2c-i801 i2c-bus is not present yet (all designs using the
>> dell-smo8800 driver will have an i2c-bus so waiting for this to show
>> up should not cause regressions).
> 
> Adding EPROBE_DEFER just complicates the dependency and state model.
> I would really suggest to come up with a simpler solution, not too
> complicated where it is required to think a lot if is is correct and if
> all edge-cases are handled.

I'm not sure what you are worried about here. dell-smo8800 is
a leave driver, nothing inside the kernel depends on it being 
loaded or not. So there are no -EPROBE_DEFER complexities here,
yes -EPROBE_DEFER can become a bit hairy with complex dependency
graphs, but this is a very KISS case.

Are there any specific scenarios you are actually worried about
in this specific case?

>> If we can agree to move forward this series I'll fix this.
>>
>> Pali wrote:
>>> Also it has same problem if PCI i801 device is reloaded or reset.
>>
>> The i801 device is not hotplugable, so normally this will never
>> happen. If the user manually unbinds + rebinds the i2c-i801 driver
>> them the i2c_client for the smo88xx device will indeed get removed
>> and not re-added. But this will normally never happen and if
>> a user is manually poking things then the user can also unbind +
>> rebind the dell-mso8800 driver after the i2c-i801 rebind.
>> So I don't really see this as an issue.
> 
> Well, rmmod & modprobe is not the rare cases. Whatever developers say
> about rmmod (or modprobe -r or whatever is the way for unloading
> modules), this is something which is used by a lot of users and would be
> used. 

Many modules actually have bugs in there remove paths and crash,
this is really not a common case. Sometimes users use rmmod + modprobe
surrounding suspend/resume for e.g. a wifi driver to work around
suspend/resume problems but I have never heard of this being used
for a driver like i2c-i801.

And again if users are manually meddling with this, the they can
also rmmod + modprobe dell-smo8800 after re-modprobing i2c-i801.

>> With those remarks addressed let me try to explain why I think
>> that moving this to the dell-smo8800 code is a good idea:
>>
>> 1. It is a SMO88xx ACPI device specific kludge and as such IMHO
>> thus belongs in the driver for the SMO88xx ACPI platform_device.
> 
> I'm not sure if it belongs to "SMO88xx ACPI platform_device" but for
> sure I agree with you that it does not belong to i801 code. I would say
> that it belongs to some SMO8800 glue code -- because it is not the
> classic ACPI driver too. But I'm not against to have SMO glue code and
> SMO ACPI driver in one file (maybe it is even better to have it).

We are trying to get rid of acpi_driver drivers using only
platform_driver drivers for the platform_devices created for
ACPI devices / fwnodes which do not have another physical device.

Also we only want this workaround when the SMO88xx ACPI fwnode
is missing the I2cSerialBusV2 resource for the i2c_client and
conveniently the platform_device will only be created for
ACPI fwnodes without the I2cSerialBusV2 resource for proper
ACPI fwnodes which have the I2C resource an i2c_client will
be created instead. So putting the workaround in
the platform_driver automatically ensures that it only runs
when the ACPI fwnode is incomplete.


> 
>> The i2c-i801 driver gets loaded on every x86 system and it is
>> undesirable to have this extra code and the DMI table in RAM
>> on all those other systems.
> 
> I think we can take an assumption that ACPI SMO device does not change
> it existence or ACPI enabled/disabled state during runtime. So we can
> scan for ACPI SMO device just once in function stored in __init section
> called during the kernel/module initialization and cache the result
> (bool if device was found + its i2c address). After function marked as
> __init finish its job then together with DMI tables can be discarded
> from RAM. With this way it does take extra memory on every x86 system.
> Also we can combine this with an SMO config option, so the whole code
> "glue" code would not be compiled when SMO driver is not enabled via
> Kconfig.

This approach does not work because i2c-i801.c registers a PCI driver,
there is no guarantee that the adapter has already been probed and
an i2c_adapter has been created before it. A PCI driver's probe()
function must not be __init and thus any code which it calls also
must not be __init.

So the majority of the smo88xx handling can not be __init.

Regards,

Hans



