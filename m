Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF59664825B
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Dec 2022 13:29:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbiLIM3W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Dec 2022 07:29:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbiLIM3V (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Dec 2022 07:29:21 -0500
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2CB063B81;
        Fri,  9 Dec 2022 04:29:19 -0800 (PST)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
        by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B97omfg026821;
        Fri, 9 Dec 2022 06:29:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=bXBIFc2KBz1UGHSeQtliNK6GduA3gerKItLdDIfuIYM=;
 b=GIIzC8yOy8k4IvDH2BiWTX5id9N5elFI42pmgc4FVXb3pQgixYJZPsbAUM65pH+XDLHS
 rW/5di8b9UygsTU9NU98mDA3Dyy7LZ7lDEKmqK7CtfQW96+7p9WfO1QXmgoP4eBpISqH
 IxIqmqxvezdWtIUpgfOIjc5gjBBm02+pFMde2w5yybeUbXDvgl2NnW0mYgujSeI9rFBN
 WMuOIOXnpppiX+SPi4BWk118l541D6q5P3caLMFg+VkMR66uyKa6ry7NEbWlPJt8V09z
 eOayZ8uCSHPe/NatouEAqMcIbiqQkhH2uitB1Ma+BWgJHSfitQfgBh1LUBwTAxffumNR zA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3matyutgsp-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 09 Dec 2022 06:29:06 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Fri, 9 Dec
 2022 06:29:05 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.20 via Frontend Transport; Fri, 9 Dec 2022 06:29:05 -0600
Received: from [198.61.65.44] (EDIN4L06LR3.ad.cirrus.com [198.61.65.44])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B0A47B0E;
        Fri,  9 Dec 2022 12:29:04 +0000 (UTC)
Message-ID: <81575055-ebf2-ea05-67fc-5b294423532d@opensource.cirrus.com>
Date:   Fri, 9 Dec 2022 12:29:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] i2c: designware: Fix unbalanced suspended flag
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>, <wsa@kernel.org>,
        <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
References: <20221209114034.18025-1-rf@opensource.cirrus.com>
 <e9d113fb-5cd1-d93d-3d8f-fa9c1e55a8e2@redhat.com>
From:   Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <e9d113fb-5cd1-d93d-3d8f-fa9c1e55a8e2@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gCcespAIHO90OGQqQmaLriuYIvTBHkD5
X-Proofpoint-GUID: gCcespAIHO90OGQqQmaLriuYIvTBHkD5
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 9/12/22 12:15, Hans de Goede wrote:
> Hi Richard,
> 
> On 12/9/22 12:40, Richard Fitzgerald wrote:
>> Ensure that i2c_mark_adapter_suspended() is always balanced by a call to
>> i2c_mark_adapter_resumed().
>>
>> Don't set DPM_FLAG_MAY_SKIP_RESUME to skip system early_resume stage if the
>> driver was runtime-suspended. Instead, always call dw_i2c_plat_resume() and
>> use pm_runtime_suspended() to determine whether we need to power up the
>> hardware.
>>
>> The unbalanced suspended flag was introduced by
>> commit c57813b8b288 ("i2c: designware: Lock the adapter while setting the
>> suspended flag")
>>
>> Before that commit, the system and runtime PM used the same functions. The
>> DPM_FLAG_MAY_SKIP_RESUME was used to skip the system resume if the driver
>> had been in runtime-suspend. If system resume was skipped, the suspended
>> flag would be cleared by the next runtime resume. The check of the
>> suspended flag was _after_ the call to pm_runtime_get_sync() in
>> i2c_dw_xfer(). So either a system resume or a runtime resume would clear
>> the flag before it was checked.
>>
>> Having introduced the unbalanced suspended flag with that commit, a further
>> commit 80704a84a9f8
>> ("i2c: designware: Use the i2c_mark_adapter_suspended/resumed() helpers")
>>
>> changed from using a local suspended flag to using the
>> i2c_mark_adapter_suspended/resumed() functions. These use a flag that is
>> checked by I2C core code before issuing the transfer to the bus driver, so
>> there was no opportunity for the bus driver to runtime resume itself before
>> the flag check.
>>
>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>> Fixes: c57813b8b288 ("i2c: designware: Lock the adapter while setting the suspended flag")
> 
> It is not entirely clear to me where the unbalance you claim to see comes
> from? When runtime-suspended SMART_SUSPEND should keep it suspended at which point
> the system suspend callback will never run ?

system suspend callback is called, which calls
i2c_mark_adapter_suspended().

system resume is NOT called so i2c_mark_adapter_resumed() is NOT called.

A subsequent audio playback using an I2C audio amp then does a
runtime resume but the amp driver then gets a "Transfer while suspended"
error when it tried to access the part over I2C during its own
runtime resume.

Tested on Aaeon UpXstreme WHL (Intel Whiskylake chipset)

Looking in __device_suspend_late() (drivers/base/power/main.c) there
are cases which will skip the SMART_SUSPEND check.

> 
> Are you sure that you are not maybe seeing a suspend/resume ordering issue?
> 
> Did you add printk messages to the suspend/resume callbacks of
> i2c-designware-platdrv.c which show the system suspend callback
> being called but not the system resume one ?
> 

Yes, that's what I did.
system suspend callback is called. System resume callback isn't.

> I guess that is possible with DPM_FLAG_MAY_SKIP_RESUME, but
> since we also use SMART_SUSPEND I would expect the system-suspend
> callback to also always be skipped for runtime-suspended controllers.
> 
> 
> 
> 
> 
> 
> 
>> ---
>> Apologies if you get this message multiple times. I'm having trouble
>> with my SMTP server.
>> ---
>>   drivers/i2c/busses/i2c-designware-platdrv.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
>> index ba043b547393..d805b8c7e797 100644
>> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
>> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
>> @@ -351,13 +351,11 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
>>   
>>   	if (dev->flags & ACCESS_NO_IRQ_SUSPEND) {
>>   		dev_pm_set_driver_flags(&pdev->dev,
>> -					DPM_FLAG_SMART_PREPARE |
>> -					DPM_FLAG_MAY_SKIP_RESUME);
>> +					DPM_FLAG_SMART_PREPARE);
>>   	} else {
>>   		dev_pm_set_driver_flags(&pdev->dev,
>>   					DPM_FLAG_SMART_PREPARE |
>> -					DPM_FLAG_SMART_SUSPEND |
>> -					DPM_FLAG_MAY_SKIP_RESUME);
>> +					DPM_FLAG_SMART_SUSPEND);
>>   	}
>>   
>>   	device_enable_async_suspend(&pdev->dev);
>> @@ -475,7 +473,9 @@ static int __maybe_unused dw_i2c_plat_resume(struct device *dev)
>>   {
>>   	struct dw_i2c_dev *i_dev = dev_get_drvdata(dev);
>>   
>> -	dw_i2c_plat_runtime_resume(dev);
>> +	if (!pm_runtime_suspended(dev))
>> +		dw_i2c_plat_runtime_resume(dev);
>> +
> 
> I'm afraid that this is always going to run now, before this callback gets
> called drivers/base/power/main.c: device_resume_noirq() does:
> 
>          skip_resume = dev_pm_skip_resume(dev);
> 
>          if (skip_resume)
>                  pm_runtime_set_suspended(dev);
>          else if (dev_pm_skip_suspend(dev))
>                  pm_runtime_set_active(dev);
> 
> Where skip_resume now is false since you dropped the
> DPM_FLAG_MAY_SKIP_RESUME flag and dev_pm_skip_suspend(dev)
> will return true (see below) for runtime-suspended controllers,
> so they will be marked active here. and then your
> !pm_runtime_suspended(dev) will always be false.
> 
> Did you add a printk to both the if + else paths
> and have you ever seen the controller not get
> resumed with this test added ?
> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> bool dev_pm_skip_suspend(struct device *dev)
> {
>          return dev_pm_test_driver_flags(dev, DPM_FLAG_SMART_SUSPEND) &&
>                  pm_runtime_status_suspended(dev);
> }
> 
> 
> 
> 
>>   	i2c_mark_adapter_resumed(&i_dev->adapter);
>>   
>>   	return 0;
> 
