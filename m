Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5457568E9E0
	for <lists+linux-i2c@lfdr.de>; Wed,  8 Feb 2023 09:28:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbjBHI2V (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 8 Feb 2023 03:28:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230073AbjBHI2V (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 8 Feb 2023 03:28:21 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72600457C7;
        Wed,  8 Feb 2023 00:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675844899; x=1707380899;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=r0prHdkASu3A/4syhSnZzC8TLnpbY5J2hKbwFQ10tDQ=;
  b=TQex7BWGmrC8TkFnU5mQlBDVqW77J/JRHxPUyKufjTyIcdBBuOp5tmuW
   akcmoghvSCOz0HHZ2oKxXSFfD99fGQnapL8FVeZMAE43B3nbhxMfkai5e
   R4sntqJ0tRDWG0/bJbULN2qEVUFLEhkArfCCt5poCHvqV4Lbz9OjCTe9p
   yzN5UkefERcQycpTIabpIMlnF2NmWnPzpw2FNd6403Ju6xMAcK1gG3vKk
   6piqSVlncL3xYN10bq8YDYSSLI1QjV78N+3MFkkFuqtmrDP4MaCZFvT2N
   Tf80LAtWIaFXDJKuMaotXH+8n1FZSx1+/PD0MXdONBX/r3x7CJlxo9L4V
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="329769125"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="329769125"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 00:28:19 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="755968798"
X-IronPort-AV: E=Sophos;i="5.97,280,1669104000"; 
   d="scan'208";a="755968798"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144]) ([10.99.16.144])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 00:28:17 -0800
Message-ID: <b429918f-fe63-2897-8ade-d17fe2e3646f@linux.intel.com>
Date:   Wed, 8 Feb 2023 09:28:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC] i2c: core: Do not enable wakeup by default
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Raul Rangel <rrangel@chromium.org>
Cc:     Wolfram Sang <wsa@kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        "Limonciello, Mario" <mario.limonciello@amd.com>
References: <20230207072540.27226-1-mika.westerberg@linux.intel.com>
 <CAHQZ30Bzn1Lxy+Y2gCcFTmzWzwnxqUZAHAjSh67Pz=WweaKHkg@mail.gmail.com>
 <Y+NH9pjbFfmijHF+@black.fi.intel.com>
From:   =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <Y+NH9pjbFfmijHF+@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2/8/2023 7:57 AM, Mika Westerberg wrote:
> Hi,
> 
> On Tue, Feb 07, 2023 at 09:33:55AM -0700, Raul Rangel wrote:
>> Sorry, resending in plain text mode.
>>
>> On Tue, Feb 7, 2023 at 12:25 AM Mika Westerberg
>> <mika.westerberg@linux.intel.com> wrote:
>>>
>>> After commit b38f2d5d9615 ("i2c: acpi: Use ACPI wake capability bit to
>>> set wake_irq") the I2C core has been setting I2C_CLIENT_WAKE for ACPI
>>> devices if they announce to be wake capable in their device description.
>>> However, on certain systems where audio codec has been connected through
>>> I2C this causes system suspend to wake up immediately because power to
>>> the codec is turned off which pulls the interrupt line "low" triggering
>>> wake up.
>>>
>>> Possible reason why the interrupt is marked as wake capable is that some
>>> codecs apparently support "Wake on Voice" or similar functionality.
>>
>> That's generally a bug in the ACPI tables. The wake bit shouldn't be
>> set if the power domain for the device is powered off on suspend. The
>> best thing is to fix the ACPI tables, but if you can't, then you can
>> set the ignore_wake flag for the device:
>> https://github.com/torvalds/linux/blob/master/drivers/gpio/gpiolib-acpi.c#L31.
>> If that works we can add a quirk for the device:
>> https://github.com/torvalds/linux/blob/master/drivers/gpio/gpiolib-acpi.c#L1633.

I've seen this one already and also tried to use it, but it didn't work. 
Also when I was reading code I wasn't really convinced that it is linked 
to i2c in any straightforward way. I mean i2c decides in different 
places that it has wake support (I even added some prints to make sure 
;). The code you pointed out decides in 
https://github.com/torvalds/linux/blob/master/drivers/gpio/gpiolib-acpi.c#L387 
but i2c code seems to decide in 
https://github.com/torvalds/linux/blob/master/drivers/i2c/i2c-core-acpi.c#L176 
where it just checks if irq flags has wake_capable flag set. When I 
looked at it previously I was pretty sure it comes straight from BIOS 
and passes the quirk code you mentioned, still I may have missed something.

> 
> I think (hope) these systems are not yet available for public so there
> is a chance that the tables can still be fixed, without need to add any
> quirks.
> 
> @Amadeusz, @Cezary, if that's the case I suggest filing a bug against
> the BIOS.
> 

Well, I tried custom DSDT and had problems, but I just remembered that I 
probably need to pass "revision+1" in file, so kernel sees it as a newer 
version, let me try again. Is it enough to replace "ExclusiveAndWake" 
with "Exclusive"?

>>> In any case, I don't think we should be enabling wakeup by default on
>>> all I2C devices that are wake capable. According to device_init_wakeup()
>>> documentation most devices should leave it disabled, with exceptions on
>>> devices such as keyboards, power buttons etc. Userspace can enable
>>> wakeup as needed by writing to device "power/wakeup" attribute.
>>
>> Enabling wake by default was an unintended side-effect. I didn't catch
>> this when I wrote the patch :/ It's been exposing all the incorrect
>> ACPI configurations for better or worse. Mario pushed a patch up
>> earlier to disable thes Wake GPIOs when using S3:
>> https://github.com/torvalds/linux/commit/d63f11c02b8d3e54bdb65d8c309f73b7f474aec4.
>> Are you having problems with S3 or S0iX?
> 
> I think this case is S0ix.

We test both cases in our setups.

> 
>>> Reported-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>>> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>>> ---
>>> Hi,
>>>
>>> Sending this as RFC because I'm not too familiar with the usage of
>>> I2C_CLIENT_WAKE and whether this is something that is expected behaviour
>>> in users of I2C devices. On ACPI side I think this is the correct thing
>>> to do at least.
>>>
>>>   drivers/i2c/i2c-core-base.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
>>> index 087e480b624c..7046549bdae7 100644
>>> --- a/drivers/i2c/i2c-core-base.c
>>> +++ b/drivers/i2c/i2c-core-base.c
>>> @@ -527,7 +527,7 @@ static int i2c_device_probe(struct device *dev)
>>>                          goto put_sync_adapter;
>>>                  }
>>>
>>> -               device_init_wakeup(&client->dev, true);
>>> +               device_init_wakeup(&client->dev, false);
>>
>> This would be a change in behavior for Device Tree. Maybe you can
>> declare a `bool enable_wake = true`, then in the ACPI branch
>> (https://github.com/torvalds/linux/blob/master/drivers/i2c/i2c-core-base.c#L495)
>> set `enable_wake = false`. This would keep wakes enabled by default on
>> device tree and disabled for ACPI. This matches the original behavior
>> before my patch.
> 
> I don't think it's a good idea to make the behaviour different. Drivers
> in general do not need to know whether the device was enumerated on ACPI
> or DT or whatnot. Same goes for users who should expect similar
> behaviour on the same device.
> 
> I wonder what is the reason why I2C bus does this for all wake capable
> devices in the first place? Typically it should be up to the user to
> enable them not the opposite.

