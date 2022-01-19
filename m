Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C52D493ECF
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 18:08:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354621AbiASRIi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 19 Jan 2022 12:08:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237375AbiASRIi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 19 Jan 2022 12:08:38 -0500
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54D03C061574;
        Wed, 19 Jan 2022 09:08:38 -0800 (PST)
Received: by mail-oi1-x22f.google.com with SMTP id s9so5085182oib.11;
        Wed, 19 Jan 2022 09:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6WelN89hEfp4KJejxcgAq95DIN16jm2x1el3Hukn54g=;
        b=i9p9llDsUWmzBJJDx5LWLvER43VrqCJIH4EjiWsYV9oyJQtDG/YP0Kb0aUKwwkTVKS
         i7wHjmsAN93cQC0MxqDJuLIav3QxOc9lEbdsdnLQbbsWcbomlxwNAO89wj0r9pEsmzz5
         mmBNorNXQLXZjx3ZisUqKBvIzRR07nVqXyhgbSeyQsejzaao2oSudRpDL+q68lsrC9FC
         QLoDubk8+ZCrHcl7BErGnrcFWnCOpLm2nvjvlUMM36JvlLYYOEthmfXSKXo6e/bbu7pA
         JV4likXkt5fg7523ire3XslmYlCcD9x+sz3Wm47hUwmLI8oUKohKURaZGvp5VSnM84DC
         nVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6WelN89hEfp4KJejxcgAq95DIN16jm2x1el3Hukn54g=;
        b=nthTuUTwGpK3C/i8Q5tR5L9DBCTBUAOJypic75pa5tryGcqOdnJx/5dfvS9MbRRsJ2
         DPuMo/fGxjxMaoHCZwgEKaZFmXfJH4rJIMU1uvjtMYGRxqeE/3WzhJfLqjSBZnPgJoBB
         S4hn3df+NCwYQy4iXSIvSd1Cr1crne7S9hwYDQxc9zetsf0BdRgIi4aIbMmqvKIZyzFm
         XY+qJXHRtC2ejtlaISRuyErJylSqTScTZjFXcM0aB87vBv/Rk4cuA19F2uiVfRV2GqhU
         g0r0CptfB1VFw8pAD8vUC1cwcKQtnTT3Lje6Ek5k2WBfA8NuKlvWOey96eqUYs0aVxT/
         aBiw==
X-Gm-Message-State: AOAM533uL1YTqF7ERdlT/a6ybsCNKR2TtTf845Y2TGRXorUhAYBlWQSL
        dSLB6VVVsY54k0Gb2S7Grds=
X-Google-Smtp-Source: ABdhPJyOugbTInEEu//Tx5ttiC0TcU+tzGCFvpdXT66QJ0v39dR0PH0fNmzoqUfEuYFFxFFFFR1Igw==
X-Received: by 2002:a05:6808:14ca:: with SMTP id f10mr3896046oiw.162.1642612117681;
        Wed, 19 Jan 2022 09:08:37 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 44sm141801otl.15.2022.01.19.09.08.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jan 2022 09:08:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v3 2/4] Watchdog: sp5100_tco: Refactor MMIO base address
 initialization
To:     Terry Bowman <Terry.Bowman@amd.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-watchdog@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Wolfram Sang <wsa@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Robert Richter <rrichter@amd.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Mario Limonciello <Mario.Limonciello@amd.com>
References: <20220118202234.410555-1-terry.bowman@amd.com>
 <20220118202234.410555-3-terry.bowman@amd.com>
 <CAHp75VdBFN+QMJpYDp8ytGGrBKYyjxU8u=Xrn44Lc3UGLPRQOA@mail.gmail.com>
 <b609230d-37e5-d7a3-3dff-5980c1cca5f7@amd.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <e558133e-b222-6cd8-6e18-162a45cb12fa@roeck-us.net>
Date:   Wed, 19 Jan 2022 09:08:34 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <b609230d-37e5-d7a3-3dff-5980c1cca5f7@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 1/19/22 8:57 AM, Terry Bowman wrote:
> 
> 
> On 1/19/22 5:53 AM, Andy Shevchenko wrote:
>> On Tue, Jan 18, 2022 at 10:23 PM Terry Bowman <terry.bowman@amd.com> wrote:
>>>
>>> Combine MMIO base address and alternate base address detection. Combine
>>> based on layout type. This will simplify the function by eliminating
>>> a switch case.
>>>
>>> Move existing request/release code into functions. This currently only
>>> supports port I/O request/release. The move into a separate function
>>> will make it ready for adding MMIO region support.
>>
>> ...
>>
>>> To: Guenter Roeck <linux@roeck-us.net>
>>> To: linux-watchdog@vger.kernel.org
>>> To: Jean Delvare <jdelvare@suse.com>
>>> To: linux-i2c@vger.kernel.org
>>> To: Wolfram Sang <wsa@kernel.org>
>>> To: Andy Shevchenko <andy.shevchenko@gmail.com>
>>> To: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>>> Cc: linux-kernel@vger.kernel.org
>>> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
>>> Cc: Robert Richter <rrichter@amd.com>
>>> Cc: Thomas Lendacky <thomas.lendacky@amd.com>
>>
>> Same comment to all your patches.
> 
> Ok. I'll reduce the patches' to/cc list to only contain maintainers owning
> the current patch. I prefer to leave the lengthy list in the cover letter
> if that is ok because it will not be added to the tree but will provide
> context this series has multiple systems and may need communication
> between maintainers. I'll use the -to & -cc commandline as you mentioned to
> send to the longer list of recipients without cluttering the patch. Let me
> know if you prefer otherwise.
>>
>> ...
>>
>>> +static int __sp5100_tco_prepare_base(struct sp5100_tco *tco,
>>> +                                    u32 mmio_addr,
>>> +                                    const char *dev_name)
>>> +{
>>> +       struct device *dev = tco->wdd.parent;
>>
>>> +       int ret = 0;
>>
>> Not really used variable.
> 
> Yes, I'll remove 'ret' and set hardcoded 0 return value below.
> 
>>
>>> +       if (!mmio_addr)
>>> +               return -ENOMEM;
>>> +
>>> +       if (!devm_request_mem_region(dev, mmio_addr,
>>> +                                   SP5100_WDT_MEM_MAP_SIZE,
>>> +                                   dev_name)) {
>>> +               dev_dbg(dev, "MMIO address 0x%08x already in use\n",
>>> +                       mmio_addr);
>>> +               return -EBUSY;
>>> +       }
>>> +
>>> +       tco->tcobase = devm_ioremap(dev, mmio_addr,
>>> +                                   SP5100_WDT_MEM_MAP_SIZE);
>>> +       if (!tco->tcobase) {
>>> +               dev_dbg(dev, "MMIO address 0x%08x failed mapping.\n",
>>> +                       mmio_addr);
>>
>>> +               devm_release_mem_region(dev, mmio_addr,
>>> +                                       SP5100_WDT_MEM_MAP_SIZE);
>>
>> Why? If it's a short live mapping, do not use devm.
> 
> This region isn't short lived. This is a region request for the
> WDT registers used through the lifetime of the driver.
>                                                                                  
> The short lived mapping you may be thinking of is in
> sp5100_tco_setupdevice_mmio() from patch 3. The first register in
> this region is FCH::PM::DECODEEN and is used to setup the mmio_addr
> and alt_mmio_addr MMIO (longterm) regions.
> 
>>
>>> +               return -ENOMEM;
>>> +       }
>>
>>> +       dev_info(dev, "Using 0x%08x for watchdog MMIO address\n",
>>> +                mmio_addr);
>>
>> Unneeded noise.
> 
> This was present pre-series. The current driver dmesg output with default
> logging settings is:
> 
> dmesg | grep -i sp5100
> [    8.508515] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
> [    8.525172] sp5100-tco sp5100-tco: Using 0xfeb00000 for watchdog MMIO address
> [    8.539912] sp5100-tco sp5100-tco: initialized. heartbeat=60 sec (nowayout=0)
> 
> I'll remove the dev_info.
> 
>>
>>> +       return ret;
>>
>> On top of above it's a NIH devm_ioremap_resource().
> 
> I'm not familiar with NIH term. My friends google and grep weren't much help.
> 
>>
>>> +}
>>
>>
>> ...
>>
>>> +       int ret = 0;
>>
>> Redundant assignment.
> 
> Thanks. I'll leave the variable but remove the 0 assignment in the definition.
> 
>>
>> ...
>>
>>> +       /* Check MMIO address conflict */
>>> +       ret = __sp5100_tco_prepare_base(tco, mmio_addr, dev_name);
>>
>>> +
>>> +       /* Check alternate MMIO address conflict */
>>
>> Unify this with the previous comment.
> 
> Ok
> 
>>
>>> +       if (ret)
>>> +               ret = __sp5100_tco_prepare_base(tco, alt_mmio_addr,
>>> +                                               dev_name);
>>
>> ...
>>
>>> +               if (alt_mmio_addr & ((SB800_ACPI_MMIO_DECODE_EN |
>>> +                                     SB800_ACPI_MMIO_SEL) !=
>>> +                                    SB800_ACPI_MMIO_DECODE_EN)) {
>>
>> The split looks ugly. Consider to use temporary variables or somehow
>> rearrange the condition that it doesn't break in the middle of the one
>> logical token.
> 
> I'll try splitting at the '&' as Guenter mentioned in other email.
> 
>>
>>> +                       alt_mmio_addr &= ~0xFFF;
>>
>> Why capital letters?
> 
> This was already present pre-series. I'll change to lowercase to make it
> consistent with the other constants in the file.
> 
>>
>>> +                       alt_mmio_addr += SB800_PM_WDT_MMIO_OFFSET;
>>> +               }
>>
>> ...
>>
>>> +               if (!(alt_mmio_addr & (((SB800_ACPI_MMIO_DECODE_EN |
>>> +                                      SB800_ACPI_MMIO_SEL)) !=
>>> +                     SB800_ACPI_MMIO_DECODE_EN))) {
>>
>> Ditto.
> 
> My understanding is #defines should be capitalized. No?
> 

I think that Ditto referred to the line split comment.

Guenter

>>
>>> +                       alt_mmio_addr &= ~0xFFF;
>>
>> Ditto.
> 
> Another uppercase constant I will make lowercase.
> 
>>
>>> +                       alt_mmio_addr += SB800_PM_WDT_MMIO_OFFSET;
>>
>> ...
>>
>> Okay, I see this is the original code like this... Perhaps it makes
>> sense to reshuffle them (indentation-wise) at the same time and
>> mention this in the changelog.
>>
>> ...
>>
>>>          release_region(SP5100_IO_PM_INDEX_REG, SP5100_PM_IOPORTS_SIZE);
>>
>> Is it still needed? I have no context to say if devm_iomap() and this
>> are not colliding, please double check the correctness.
>>
> 
> Yes, this is needed. The release/request in sp5100_tco_setupdevice() is
> for the non-efch mmio layout cases. It is using port I/O registers to
> detect mmio_addr, alt_mmio_addr, and configure the device.
> 
> Regards,
> Terry Bowman
> 

