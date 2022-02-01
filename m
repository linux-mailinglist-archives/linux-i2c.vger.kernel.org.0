Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DAB74A680F
	for <lists+linux-i2c@lfdr.de>; Tue,  1 Feb 2022 23:36:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241452AbiBAWgi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Feb 2022 17:36:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235380AbiBAWgg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Feb 2022 17:36:36 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F1A8C061714;
        Tue,  1 Feb 2022 14:36:36 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id p3-20020a0568301d4300b005a7a702f921so860918oth.9;
        Tue, 01 Feb 2022 14:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rruHlI71IVnsctxkm2K7muRq26h/I63Aku9v7y+wB9g=;
        b=exG7uRmuhfLG+HfBxgkjQKxj9Whwoo0jGYSJNOPlwLoqW06rlw+/AIJ/BignzAgisD
         w0QG/zfPWPtstuTN+VeYjIgYmdIHl2F3Bh5k85g2HwYgV/Fe6RJfJWxUIEsIOlsk9vOv
         LjO+BnsZmxg3njmD9POrPK/CUxJ0Rir9cUIRnQD22thBvxXkd5t2oBHJGlQ3Gp86wjZa
         88ipWvSsKo3Hwbvye33ziSvcMP/XMQ5dUiCgfvthFigsSHH7uG3Zxood5cik5roZrvoS
         rmE5P/T+ZActsSto06DebnTEz/73CejMeeZPiPiyqS9B88akQRpUXf6IgRoYWofBZ4yh
         kMUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
         :subject:content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=rruHlI71IVnsctxkm2K7muRq26h/I63Aku9v7y+wB9g=;
        b=JyXGcXunuhcwcVmXx34E23xtkPMoAYL7Byb6+n1B7k+78LuL2PElSeHxIQywONGwsx
         wO4VevlX2w0ER1UtS7kKm8L/bEfQKTKbtkXPoR6iraKPuiMHLlfmlcIZJ1PXv3JqKzwB
         n0evWue0zXsSyio0ONBGupfrz7eZMynFUxOKJlJ3OdRGiNPWcqW8AiPOYSjhZTJa3hiu
         Xr0Oyw8jvuSGw1kMWCG8ks25wRvqgT5G6+asi+lnbNqkY5ffYMZlaz7nHy1j+qqMA2ZD
         9qsIKwwlFxKAnkCoHukSsCxQZWIysyuVaRjLwojOUHKFBQijYRdc2GhVxmKPVSwi3hMf
         pYgg==
X-Gm-Message-State: AOAM531ZtY4ZDzNyZ38mEM21a4h/CItIhq4xwp6ir3m+Mq7hZE8Frpr0
        aeBRncbfrY4B+tHMk6dx7Y4=
X-Google-Smtp-Source: ABdhPJxGHFy795BCE8KSMO7OBHotDW6Kv5GCdCVADyu8cl1VVAoFNVib7VN0Gm1meOjzY3WPqTMduA==
X-Received: by 2002:a9d:62da:: with SMTP id z26mr14687051otk.26.1643754995390;
        Tue, 01 Feb 2022 14:36:35 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k3sm17406361otl.41.2022.02.01.14.36.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Feb 2022 14:36:34 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9e330860-e225-6e69-f2ed-0bf11372c3ce@roeck-us.net>
Date:   Tue, 1 Feb 2022 14:36:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v4 2/4] Watchdog: sp5100_tco: Refactor MMIO base address
 initialization
Content-Language: en-US
To:     Terry Bowman <Terry.Bowman@amd.com>,
        linux-watchdog@vger.kernel.org, jdelvare@suse.com,
        linux-i2c@vger.kernel.org, wsa@kernel.org,
        andy.shevchenko@gmail.com, rafael.j.wysocki@intel.com
Cc:     linux-kernel@vger.kernel.org, wim@linux-watchdog.org,
        rrichter@amd.com, thomas.lendacky@amd.com, sudheesh.mavila@amd.com,
        Nehal-bakulchandra.Shah@amd.com, Basavaraj.Natikar@amd.com,
        Shyam-sundar.S-k@amd.com, Mario.Limonciello@amd.com
References: <20220130191225.303115-1-terry.bowman@amd.com>
 <20220130191225.303115-3-terry.bowman@amd.com>
 <ecf12beb-a03b-2aec-1dc4-8183a8b6daa6@roeck-us.net>
 <c1d121f7-f482-7913-eced-4fbef962656d@amd.com>
 <e7112674-05e2-93cd-b8f9-3e31f173238d@amd.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <e7112674-05e2-93cd-b8f9-3e31f173238d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/1/22 12:32, Terry Bowman wrote:
> 
> 
> On 2/1/22 10:46, Terry Bowman wrote:
>>
>>
>> On 2/1/22 09:31, Guenter Roeck wrote:
>>> On 1/30/22 11:12, Terry Bowman wrote:
>>>> Combine MMIO base address and alternate base address detection. Combine
>>>> based on layout type. This will simplify the function by eliminating
>>>> a switch case.
>>>>
>>>> Move existing request/release code into functions. This currently only
>>>> supports port I/O request/release. The move into a separate function
>>>> will make it ready for adding MMIO region support.
>>>>
>>>> Co-developed-by: Robert Richter <rrichter@amd.com>
>>>> Signed-off-by: Robert Richter <rrichter@amd.com>
>>>> Signed-off-by: Terry Bowman <terry.bowman@amd.com>
>>>> Tested-by: Jean Delvare <jdelvare@suse.de>
>>>> Reviewed-by: Jean Delvare <jdelvare@suse.de>
>>>> ---
>>>>    drivers/watchdog/sp5100_tco.c | 155 ++++++++++++++++++----------------
>>>>    drivers/watchdog/sp5100_tco.h |   1 +
>>>>    2 files changed, 82 insertions(+), 74 deletions(-)
>>>>
>>>> diff --git a/drivers/watchdog/sp5100_tco.c b/drivers/watchdog/sp5100_tco.c
>>>> index b365bbc9ac36..16e122d5045e 100644
>>>> --- a/drivers/watchdog/sp5100_tco.c
>>>> +++ b/drivers/watchdog/sp5100_tco.c
>>>> @@ -223,6 +223,55 @@ static u32 sp5100_tco_read_pm_reg32(u8 index)
>>>>        return val;
>>>>    }
>>>>    +static u32 sp5100_tco_request_region(struct device *dev,
>>>> +                     u32 mmio_addr,
>>>> +                     const char *dev_name)
>>>> +{
>>>> +    if (!devm_request_mem_region(dev, mmio_addr, SP5100_WDT_MEM_MAP_SIZE,
>>>> +                     dev_name)) {
>>>> +        dev_dbg(dev, "MMIO address 0x%08x already in use\n", mmio_addr);
>>>> +        return 0;
>>>> +    }
>>>> +
>>>> +    return mmio_addr;
>>>> +}
>>>> +
>>>> +static u32 sp5100_tco_prepare_base(struct sp5100_tco *tco,
>>>> +                   u32 mmio_addr,
>>>> +                   u32 alt_mmio_addr,
>>>> +                   const char *dev_name)
>>>> +{
>>>> +    struct device *dev = tco->wdd.parent;
>>>> +
>>>> +    dev_dbg(dev, "Got 0x%08x from SBResource_MMIO register\n", mmio_addr);
>>>> +
>>>> +    if (!mmio_addr && !alt_mmio_addr)
>>>> +        return -ENODEV;
>>>> +
>>>> +    /* Check for MMIO address and alternate MMIO address conflicts */
>>>> +    if (mmio_addr)
>>>> +        mmio_addr = sp5100_tco_request_region(dev, mmio_addr, dev_name);
>>>> +
>>>> +    if (!mmio_addr && alt_mmio_addr)
>>>> +        mmio_addr = sp5100_tco_request_region(dev, alt_mmio_addr, dev_name);
>>>> +
>>>> +    if (!mmio_addr) {
>>>> +        dev_err(dev, "Failed to reserve MMIO or alternate MMIO region\n");
>>>> +        return -EBUSY;
>>>> +    }
>>>> +
>>>> +    tco->tcobase = devm_ioremap(dev, mmio_addr, SP5100_WDT_MEM_MAP_SIZE);
>>>> +    if (!tco->tcobase) {
>>>> +        dev_err(dev, "MMIO address 0x%08x failed mapping\n", mmio_addr);
>>>> +        devm_release_mem_region(dev, mmio_addr, SP5100_WDT_MEM_MAP_SIZE);
>>>> +        return -ENOMEM;
>>>> +    }
>>>> +
>>>> +    dev_info(dev, "Using 0x%08x for watchdog MMIO address\n", tco->tcobase);
>>>> +
>>>
>>> I know this is the same as the old code, but I think it would make sense to change
>>> this as suggested by 0-day and use %px instead.
>>>
>>> Thanks,
>>> Guenter
>>
>>
> Hi Guenter,
> 
> This line was changed in v4 and should be reverted. It should be using the mmio_addr
> physical address with '0x%08x' formatting instead of tco->tcobase. This would be:
> 
> dev_info(dev, "Using 0x%08x for watchdog MMIO address\n", mmio_addr);
> 
> The dmesg then provides:
> 
> [    5.972921] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
> [    5.978238] sp5100-tco sp5100-tco: Using 0xfeb00000 for watchdog MMIO address
> [    5.978252] sp5100-tco sp5100-tco: Watchdog hardware is disabled
> 
> Do your agree?
> 

Yes. Displaying the mapped address has zero if any value.

Guenter
