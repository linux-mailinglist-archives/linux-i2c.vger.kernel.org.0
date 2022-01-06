Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5F648699D
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Jan 2022 19:18:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242631AbiAFSSZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 6 Jan 2022 13:18:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240458AbiAFSSY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 6 Jan 2022 13:18:24 -0500
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C95DC061245;
        Thu,  6 Jan 2022 10:18:24 -0800 (PST)
Received: by mail-oi1-x22a.google.com with SMTP id v6so4835255oib.13;
        Thu, 06 Jan 2022 10:18:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=QeMXcbeimfZ2iZTaC2uYjjApoKuqksuCbWt0iqc9mW0=;
        b=h8qveZFMblwKPmP4v+dpfFOAKP7Ind8RU0uSvRNXfw9dOE4Q8uGDsClaMi+GZGhGWD
         CrRlE5fwKly0iY803m7UjYt4ryaer0aFN/fBaInP3uHEgre5uhLxHi9nBbtcKuwyq6C0
         hXP8rJlDYqD2bE6T/LwnBAXzoGXTGA0KpSYImviHci8wiwkPjuLx/bW48DOSvikYsORe
         ZMRGfqY9gXZR6nmDbbN3VkF0xgYaAVTnntsN7h3qi9tr4D3/aZGvIA8GbiCyxo3DqIwm
         Y0ZlU3ETMTS8JVhK6d+f3SYyTM1Sa/Ds5kWSBH1FR6mUP2p4DcLhP9H6ebLnjSz7D2+t
         gFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:to:cc:references:from:subject:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=QeMXcbeimfZ2iZTaC2uYjjApoKuqksuCbWt0iqc9mW0=;
        b=CoV6xzu4i9CMYYjxYWKJi65gznkC5OIelEY1WPeIY9QLhQc+AcImrilYKwDf5bnzhy
         rSLpZ7x8FpgoyHa9kELsg82fM1rY2M5NWZgqi/8e0IcUzeF7JiJw0zABnVdMfIgeFSwm
         mVsK5+3kqrx9LN+eOtn9vqyQO7Qv9zCbWHhKAAmcVOCjMtmzgsQHHjPMl9J5DHw6Ig3z
         y4u4CUHO8FdLyzYSQL7q3uCtQ0OsRV7MHHOhZ9hrC2oXKecLKdJ67z3VWRS/jeWI1wKU
         sLCFj7KH1oTS3Sz/3WzHyMRLWxtM9ggQLzzKuw0XicngK4IrstrlZCg7aaOpnbcXYbxB
         0wLA==
X-Gm-Message-State: AOAM531ih0yd+ZV3EKtppCPzCG1MwYxl7EktPDNjDflk8IUomsbgF3rR
        F4jhhfzCqJQOQ3s/cuS2nvw=
X-Google-Smtp-Source: ABdhPJxyjnQZoY3B0XnTlftHR+rJ/X13CxPI2mnbn5z8/hV+FF6GpPS+IDxnY+htkBKPVSSwto6kfw==
X-Received: by 2002:a05:6808:2207:: with SMTP id bd7mr7123072oib.12.1641493103803;
        Thu, 06 Jan 2022 10:18:23 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id bp11sm551260oib.38.2022.01.06.10.18.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jan 2022 10:18:23 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
To:     Terry.Bowman@amd.com, Jean Delvare <jdelvare@suse.de>,
        linux-i2c@vger.kernel.org, linux-watchdog@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, thomas.lendacky@amd.com
References: <20210715221828.244536-1-Terry.Bowman@amd.com>
 <20210907183720.6e0be6b6@endymion> <20211105170550.746443b9@endymion>
 <33a0cd08-a336-34b3-d36c-f827b8054e9e@amd.com>
 <c28ab909-99b4-b43c-e330-b07e35afb981@amd.com>
From:   Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] i2c: piix4: Replace piix4_smbus driver's cd6h/cd7h port
 io accesses with mmio accesses
Message-ID: <ebee1239-4ed4-8c68-54e0-f684cea71e93@roeck-us.net>
Date:   Thu, 6 Jan 2022 10:18:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <c28ab909-99b4-b43c-e330-b07e35afb981@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 1/4/22 11:34 AM, Terry Bowman wrote:
> Hi Jean and Guenter,
> 
> This is a gentle reminder to review my previous response when possible. Thanks!
> 
> Regards,
> Terry
> 
> On 12/13/21 11:48 AM, Terry Bowman wrote:
>> Hi Jean and Guenter,
>>
>> Jean, Thanks for your responses. I added comments below.
>>
>> I added Guenter to this email because his input is needed for adding the same
>> changes to the sp5100_tco driver. The sp5100_tco and piix4_smbus driver
>> must use the same synchronization logic for the shared register.
>>
>> On 11/5/21 11:05, Jean Delvare wrote:
>>> On Tue, 7 Sep 2021 18:37:20 +0200, Jean Delvare wrote:
>>>> More generally, I am worried about the overall design. The driver
>>>> originally used per-access I/O port requesting because keeping the I/O
>>>> ports busy all the time would prevent other drivers from working. Do we
>>>> still need to do the same with the new code? If it is possible and safe
>>>> to have a permanent mapping to the memory ports, that would be a lot
>>>> faster.
>>>>
>>
>> Permanent mapping would likely improve performance but will not provide the
>> needed synchronization. As you mentioned below the sp5100 driver only uses
>> the DECODEEN register during initialization but the access must be
>> synchronized or an i2c transaction or sp5100_tco timer enable access may be
>> lost. I considered alternatives but most lead to driver coupling or considerable
>> complexity.
>>
>>>> On the other hand, the read-modify-write cycle in
>>>> piix4_setup_sb800_smba() is unsafe if 2 drivers can actually call
>>>> request_mem_region() on the same memory area successfully.
>>>>
>>>> I'm not opposed to taking your patch with minimal changes (as long as
>>>> the code is safe) and working on performance improvements later.
>>>
>>
>> I confirmed through testing the request_mem_region() and request_muxed_region()
>> macros provide exclusive locking. One difference between the 2 macros is the
>> flag parameter, IORESOURCE_MUXED. request_muxed_region() uses the
>> IORESOURCE_MUXED flag to retry the region lock if it's already locked.
>> request_mem_region() does not use the IORESOURCE_MUXED and as a result will
>> return -EBUSY immediately if the region is already locked.
>>
>> I must clarify: the piix4_smbus v1 patch uses request_mem_region() which is not
>> correct because it doesn't retry locking an already locked region.  The driver
>> must support retrying the lock or piix4_smbus and sp5100_tco drivers may
>> potentially fail loading. I added proposed piix4_smbus v2 changes below to solve.
>>
>> I propose reusing the existing request_*() framework from include/linux/ioport.h
>> and kernel/resource.c. A new helper macro will be required to provide an
>> interface to the "muxed" iomem locking functionality already present in
>> kernel/resource.c. The new macro will be similar to request_muxed_region()
>> but will instead operate on iomem. This should provide the same performance
>> while using the existing framework.
>>
>> My plan is to add the following to include/linux/ioport.h in v2. This macro
>> will add the interface for using "muxed" iomem support:
>> #define request_mem_muxed_region(start,n,name)  __request_region(&iomem_resource, (start), (n), (name), IORESOURCE_MUXED)
>>
>> The proposed changes will need review from more than one subsystem maintainer.
>> The macro addition in include/linux/ioport.h would reside in a
>> different maintainer's tree than this driver. The change to use the
>> request_mem_muxed_region() macro will also be made to the sp5100_tco driver.
>> The v2 review will include maintainers from subsystems owning piix4_smbus
>> driver, sp5100_tco driver, and include/linux/ioport.h.
>>
>> The details provided above are described in a piix4_smbus context but would also be
>> applied to the sp5100_tco driver for synchronizing the shared register.
>>
>> Jean and Guenter, do you have concerns or changes you prefer to the proposal I
>> described above?
>>

I think you'll need approval from someone with authority to accept the
suggested change in include/linux/ioport.h. No idea who that would be.

Guenter

>>> I looked some more at the code. I was thinking that maybe if the
>>> registers accessed by the two drivers (i2c-piix4 and sp5100_tco) were
>>> disjoint, then each driver could simply request subsets of the mapped
>>> memory.
>>>
>>> Unfortunately, while most registers are indeed exclusively used by one
>>> of the drivers, there's one register (0x00 = IsaDecode) which is used
>>> by both. So this simple approach isn't possible.
>>>
>>> That being said, the register in question is only accessed at device
>>> initialization time (on the sp5100_tco side, that's in function
>>> sp5100_tco_setupdevice) and only for some devices (Embedded FCH). So
>>> one approach which may work is to let the i2c-piix4 driver instantiate
>>> the watchdog platform device in that case, instead of having sp5100_tco
>>> instantiate its own device as is currently the case. That way, the
>>> i2c-piix4 driver would request the "shared" memory area, perform the
>>> initialization steps for both functions (SMBus and watchdog) and then
>>> instantiate the watchdog device so that sp5100_tco gets loaded and goes
>>> on with the runtime management of the watchdog device.
>>>
>>> If I'm not mistaken, this is what the i2c-i801 driver is already doing
>>> for the watchdog device in all recent Intel chipsets. So maybe the same
>>> approach can work for the i2c-piix4 driver for the AMD chipsets.
>>> However I must confess that I did not try to do it nor am I familiar
>>> with the sp5100_tco driver details, so maybe it's not possible for some
>>> reason.
>>>
>>> If it's not possible then the only safe approach would be to migrate
>>> i2c-piix4 and sp5100_tco to a true MFD setup with 3 separate drivers:
>>> one new MFD PCI driver binding to the PCI device, providing access to
>>> the registers with proper locking, and instantiating the platform
>>> device, one driver for SMBus (basically i2c-piix4 converted to a
>>> platform driver and relying on the MFD driver for register access) and
>>> one driver for the watchdog (basically sp5100_tco converted to a
>>> platform driver and relying on the MFD driver for register access).
>>> That's a much larger change though, so I suppose we'd try avoid it if
>>> at all possible.
>>>

