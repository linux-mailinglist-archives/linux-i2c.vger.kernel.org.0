Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8A56902FC
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Feb 2023 10:13:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbjBIJNQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Feb 2023 04:13:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjBIJNP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Feb 2023 04:13:15 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D505C44A2;
        Thu,  9 Feb 2023 01:13:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675933994; x=1707469994;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=A2Y0cFe+mGUU9UKtiWLgv0e4Ql/hERPl9lTE9VmC7Rk=;
  b=lbs1H5yivR2GEl1sXqm6iIRyGLoDpN/eT+I5Hn8ybJjJJt1MYwwQtuBC
   1VLF1uv+SB7nviJm5BIoQjWejISIhDaw75l6MSzznM9moojzxQYpsS/bQ
   QhLSA52uunrhNcAi/n8qatyJIdqF8ZlY/IyX6QzXLTuLJB9nX7HIHk6JL
   k9KNJSfkff8OY6MLY17bdoUp6YQ6RloxYrAlNHlVSG2jw/LrDkKv5y03O
   699MJkvTpFktZ0L8oyTJtQMT4dUYN5aoD4pua5M2wmqpkpISm67O+fPkB
   frUxmgCn0hsJgO1nV2QGy3AZJfnTQ9LkYyFG/+seokGdrKMF/yInc7CJh
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="330083191"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="330083191"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 01:13:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="810268103"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="810268103"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.16.144]) ([10.99.16.144])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 01:13:02 -0800
Message-ID: <eadeb808-1925-164e-3e78-0f14c4f2bdc4@linux.intel.com>
Date:   Thu, 9 Feb 2023 10:13:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC] i2c: core: Do not enable wakeup by default
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Raul Rangel <rrangel@chromium.org>, Wolfram Sang <wsa@kernel.org>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        "Limonciello, Mario" <mario.limonciello@amd.com>
References: <20230207072540.27226-1-mika.westerberg@linux.intel.com>
 <CAHQZ30Bzn1Lxy+Y2gCcFTmzWzwnxqUZAHAjSh67Pz=WweaKHkg@mail.gmail.com>
 <Y+NH9pjbFfmijHF+@black.fi.intel.com>
 <b429918f-fe63-2897-8ade-d17fe2e3646f@linux.intel.com>
 <Y+Nrhq9l6CIPjL7Z@black.fi.intel.com>
From:   =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?= 
        <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <Y+Nrhq9l6CIPjL7Z@black.fi.intel.com>
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

On 2/8/2023 10:29 AM, Mika Westerberg wrote:
> Hi,
> 
> On Wed, Feb 08, 2023 at 09:28:14AM +0100, Amadeusz Sławiński wrote:
>> On 2/8/2023 7:57 AM, Mika Westerberg wrote:
>>> Hi,
>>>
>>> On Tue, Feb 07, 2023 at 09:33:55AM -0700, Raul Rangel wrote:
>>>> Sorry, resending in plain text mode.
>>>>
>>>> On Tue, Feb 7, 2023 at 12:25 AM Mika Westerberg
>>>> <mika.westerberg@linux.intel.com> wrote:
>>>>>
>>>>> After commit b38f2d5d9615 ("i2c: acpi: Use ACPI wake capability bit to
>>>>> set wake_irq") the I2C core has been setting I2C_CLIENT_WAKE for ACPI
>>>>> devices if they announce to be wake capable in their device description.
>>>>> However, on certain systems where audio codec has been connected through
>>>>> I2C this causes system suspend to wake up immediately because power to
>>>>> the codec is turned off which pulls the interrupt line "low" triggering
>>>>> wake up.
>>>>>
>>>>> Possible reason why the interrupt is marked as wake capable is that some
>>>>> codecs apparently support "Wake on Voice" or similar functionality.
>>>>
>>>> That's generally a bug in the ACPI tables. The wake bit shouldn't be
>>>> set if the power domain for the device is powered off on suspend. The
>>>> best thing is to fix the ACPI tables, but if you can't, then you can
>>>> set the ignore_wake flag for the device:
>>>> https://github.com/torvalds/linux/blob/master/drivers/gpio/gpiolib-acpi.c#L31.
>>>> If that works we can add a quirk for the device:
>>>> https://github.com/torvalds/linux/blob/master/drivers/gpio/gpiolib-acpi.c#L1633.
>>
>> I've seen this one already and also tried to use it, but it didn't work.
>> Also when I was reading code I wasn't really convinced that it is linked to
>> i2c in any straightforward way. I mean i2c decides in different places that
>> it has wake support (I even added some prints to make sure ;). The code you
>> pointed out decides in https://github.com/torvalds/linux/blob/master/drivers/gpio/gpiolib-acpi.c#L387
>> but i2c code seems to decide in https://github.com/torvalds/linux/blob/master/drivers/i2c/i2c-core-acpi.c#L176
>> where it just checks if irq flags has wake_capable flag set. When I looked
>> at it previously I was pretty sure it comes straight from BIOS and passes
>> the quirk code you mentioned, still I may have missed something.
>>
>>>
>>> I think (hope) these systems are not yet available for public so there
>>> is a chance that the tables can still be fixed, without need to add any
>>> quirks.
>>>
>>> @Amadeusz, @Cezary, if that's the case I suggest filing a bug against
>>> the BIOS.
>>>
>>
>> Well, I tried custom DSDT and had problems, but I just remembered that I
>> probably need to pass "revision+1" in file, so kernel sees it as a newer
>> version, let me try again. Is it enough to replace "ExclusiveAndWake" with
>> "Exclusive"?
> 
> Yes, I think that should be enough.
> 

And yes, it seems to work when I bump revision. So will use it as 
workaround for now and see about fixing BIOS.

