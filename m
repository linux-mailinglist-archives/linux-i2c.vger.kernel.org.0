Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E87464E9BC
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Dec 2022 11:47:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230439AbiLPKru (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Dec 2022 05:47:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230442AbiLPKr3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Dec 2022 05:47:29 -0500
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6730F55A8A;
        Fri, 16 Dec 2022 02:47:15 -0800 (PST)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
        by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BGAEEST002020;
        Fri, 16 Dec 2022 04:47:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=PODMain02222019;
 bh=L7TqojmH57yVaoBNbgtdNCxPUO1686U1uxPugPR9CfE=;
 b=kQraJRi/aDFFVWAvuRxzVEG7RPc01RDOzS5PDJm0e73Fv3mmBTlEVXa9LQwP8HRNGD7Z
 cDIs79ph5PpAmaJOXVQUB6eujS0FZ1cTU8sqh1W2iL+ki+Y8X5bWVYSaZCF8+2Qmhm+a
 usXXk8Y8u6vENKn6QlKkLvr+/KNyBxwIKnVjpJzHQF5vF701S9plMQo+lLgzNtaGyH3N
 UnwOyPSWZEFHl17fBPEF5CigEk4xXWhjq4Zh/BJdDdfmzQfdVdA4ApxHBsKbwA5ZIihS
 R9heOu6L25q2VWSPOG5fmm/aSHec3H13aPhdGCTksHPFAvzugKF6tW83HBxFB9DZgY0h dA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
        by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3mf6rwasds-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 16 Dec 2022 04:47:03 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Fri, 16 Dec
 2022 04:47:01 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via Frontend
 Transport; Fri, 16 Dec 2022 04:47:01 -0600
Received: from [198.90.251.111] (edi-sw-dsktp-006.ad.cirrus.com [198.90.251.111])
        by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CFDBB11CC;
        Fri, 16 Dec 2022 10:47:00 +0000 (UTC)
Message-ID: <ae7080ca-d1e6-879f-9b0d-7b99842111e4@opensource.cirrus.com>
Date:   Fri, 16 Dec 2022 10:47:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] i2c: designware: Fix unbalanced suspended flag
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>,
        <mika.westerberg@linux.intel.com>, <jsd@semihalf.com>,
        <wsa@kernel.org>
CC:     <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>
References: <20221213144524.368297-1-rf@opensource.cirrus.com>
 <8cf30cb2-6dec-b21b-ba15-f21490546426@redhat.com>
 <a467bab2-c3b0-0515-cb4a-66711b972115@linux.intel.com>
 <249c1aa2-07a1-3e25-b5d6-929da32c47d3@redhat.com>
From:   Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <249c1aa2-07a1-3e25-b5d6-929da32c47d3@redhat.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VIOZG5L0bLt5rrnSC5Kc5aySxqz80zLr
X-Proofpoint-ORIG-GUID: VIOZG5L0bLt5rrnSC5Kc5aySxqz80zLr
X-Proofpoint-Spam-Reason: safe
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 15/12/2022 19:26, Hans de Goede wrote:
> Hi,
> 
> On 12/15/22 16:09, Jarkko Nikula wrote:
>> Hi
>>
>> On 12/14/22 13:28, Hans de Goede wrote:
>>> Hi Richard,
>>>
>>> On 12/13/22 15:45, Richard Fitzgerald wrote:
>>>> Ensure that i2c_mark_adapter_suspended() is always balanced by a call to
>>>> i2c_mark_adapter_resumed().
>>>>
>>>> dw_i2c_plat_resume() must always be called, so that
>>>> i2c_mark_adapter_resumed() is called. This is not compatible with
>>>> DPM_FLAG_MAY_SKIP_RESUME.
>>>>
>>>> The pairing of pm_runtime_force_suspend() and pm_runtime_force_resume()
>>>> can replace this. If nothing is using the driver, and it is not currently
>>>> suspended, it will be put into runtime-suspend and will be left in
>>>> runtime-suspend during the system resume.
>>>>
>>>> pm_runtime_force_suspend() is not compatible with DPM_FLAG_SMART_SUSPEND
>>>> so this must also be removed. DPM_FLAG_SMART_SUSPEND will set the device
>>>> back to pm_runtime_active() during resume_noirq if it cannot skip resume.
>>>> This would lead to the inconsistent state where the driver runtime_suspend
>>>> has been called (by force_suspend()) but it is marked active (by PM core).
>>>>
>>>> The unbalanced suspended flag was introduced by
>>>> commit c57813b8b288 ("i2c: designware: Lock the adapter while setting the
>>>> suspended flag")
>>>>
>>>> Before that commit, the system and runtime PM used the same functions. The
>>>> DPM_FLAG_MAY_SKIP_RESUME was used to skip the system resume if the driver
>>>> had been in runtime-suspend. If system resume was skipped, the suspended
>>>> flag would be cleared by the next runtime resume. The check of the
>>>> suspended flag was _after_ the call to pm_runtime_get_sync() in
>>>> i2c_dw_xfer(). So either a system resume or a runtime resume would clear
>>>> the flag before it was checked.
>>>>
>>>> Having introduced the unbalanced suspended flag with that commit, a further
>>>> commit 80704a84a9f8 ("i2c: designware: Use the
>>>> i2c_mark_adapter_suspended/resumed() helpers")
>>>>
>>>> changed from using a local suspended flag to using the
>>>> i2c_mark_adapter_suspended/resumed() functions. These use a flag that is
>>>> checked by I2C core code before issuing the transfer to the bus driver, so
>>>> there was no opportunity for the bus driver to runtime resume itself before
>>>> the flag check.
>>>>
>>>> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>>>> Fixes: c57813b8b288 ("i2c: designware: Lock the adapter while setting the suspended flag")
>>>
>>> Thank you. I like the new approach in this version.
>>>
>>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>>
>> I noticed a resume regression with this patch but not all machines and only when resuming from s2idle. After resume all devices on those machines are in D0 even their runtime state show they are suspended. Works with v6.1.
>>
>> - Baytrail based MRD7 with one I2C bus shared with PUNIT
>>
>> After boot. All ok (5th bus is shared with PUNIT and not power managed)
>>
>> cat /sys/bus/platform/devices/80860F41\:0*/power/runtime_status
>> suspended
>> suspended
>> suspended
>> suspended
>> active
>>
>> cat /sys/bus/platform/devices/80860F41\:0*/firmware_node/power_state
>> D3hot
>> D3hot
>> D3hot
>> D3hot
>> D0
>>
>> After suspend-to-idle (s2idle) resume cycle. Devices stay in D0
>>
>> cat /sys/bus/platform/devices/80860F41\:0*/power/runtime_status
>> suspended
>> suspended
>> suspended
>> suspended
>> active
>>
>> cat /sys/bus/platform/devices/80860F41\:0*/firmware_node/power_state
>> D0
>> D0
>> D0
>> D0
>> D0
> 
> Ah yes this makes sense. We leave the device runtime-suspended,
> but since the system-level resume handler does run, the ACPI
> pm domain resume handler also has ran before calling the
> driver level callback and the acpi pm domain handler will have
> put the device in D0 before calling the driver level
> resume handler.
> 
> So now the device actually is in D0 while the pm-core
> thinks it is left in runtime-suspended state, so it
> will not runtime suspend it later, as would happen when
> not using force_runtime-suspend + force-runtime-resume (*).
> 
> So yeah this is not going to work. I think instead we need
> to go back to v1 together with the changes which I proposed
> for v1. As I mentioned when reviewing v1, v1 is not prefect,
> but it really is an ok solution to this.
> 

Ok, I'll send a new version of V1 with your changes.

> Regards,
> 
> Hans
> 
> 
> *) which does not actually always runtime resume despite
> its name
> 
> 
> 
