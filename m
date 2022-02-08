Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46BF04ADBCE
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Feb 2022 15:58:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379013AbiBHO57 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Feb 2022 09:57:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378991AbiBHO56 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Feb 2022 09:57:58 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEF58C061577;
        Tue,  8 Feb 2022 06:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644332277; x=1675868277;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=epaAVu/BZF8UiZCX2b02ur3J1p5fNjEAMvw+qZXVmGM=;
  b=nFkoh4+BSAqlcsZLqrDLBEev4BogmQwesrB8Lu3+MqPnk453Z1iFtw2H
   V/cbHtpHr6hZSkvguNGoRJ2b8F0l4AtOns8LH0XW1s1rglJQ/0b4+Sznf
   C2P06SwHWAkxmo22E9KFQlxJvEZ6BvW4fF9bsLuVYUKIxUfKLQnv3WD64
   geTwR/rvjtU8Qg2e0aR8k/MkdUg+r0SQ8TZdv2c176TtgjKV0DjC8F9lc
   aTVPM8l2cIU4QfYfxNQS5cVMK93bOjFwPqPU2vCw3W9CdxmRdtHBY+8zo
   tv589PdSuOH/mDz82fvrlw0IuID4YXSebw2RblgiHtCv7BThmKtD2Ji6H
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10252"; a="312257736"
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; 
   d="scan'208";a="312257736"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2022 06:57:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,353,1635231600"; 
   d="scan'208";a="700866386"
Received: from unknown (HELO [10.237.72.51]) ([10.237.72.51])
  by orsmga005.jf.intel.com with ESMTP; 08 Feb 2022 06:57:53 -0800
Message-ID: <6f1103af-595c-ed0a-b946-97a9331ed148@linux.intel.com>
Date:   Tue, 8 Feb 2022 16:57:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.1
Subject: Re: 5.17-rc regression: rmi4 clients cannot deal with asynchronous
 suspend? (was: X1 Carbon touchpad not resumed)
Content-Language: en-US
To:     Hugh Dickins <hughd@google.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Rajat Jain <rajatja@google.com>, Wolfram Sang <wsa@kernel.org>,
        Derek Basehore <dbasehore@chromium.org>,
        Thorsten Leemhuis <regressions@leemhuis.info>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        "loic.poulain@linaro.org" <loic.poulain@linaro.org>,
        Andrew Duggan <aduggan@synaptics.com>,
        vincent.huang@tw.synaptics.com, cheiny@synaptics.com,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-input <linux-input@vger.kernel.org>
References: <89456fcd-a113-4c82-4b10-a9bcaefac68f@google.com>
 <YgF/0QGFN4SppLKg@shikoro>
 <CACK8Z6Etj-gq1VKpkUBstiXEETekPWG9p9gKBtuFaZF05pQEvQ@mail.gmail.com>
 <CACK8Z6FUsceYgBoaAtN8o4m9HpZaBZMt0Nqtvw0a1Z3EuD_nWg@mail.gmail.com>
 <YgHTYrODoo2ou49J@google.com>
 <b76771e5-b8e-54c9-2474-d5a73d236cba@google.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <b76771e5-b8e-54c9-2474-d5a73d236cba@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 2/8/22 04:50, Hugh Dickins wrote:
> On Mon, 7 Feb 2022, Dmitry Torokhov wrote:
>> On Mon, Feb 07, 2022 at 01:41:36PM -0800, Rajat Jain wrote:
>>>>>> Bisection led to 172d931910e1db800f4e71e8ed92281b6f8c6ee2
>>>>>> ("i2c: enable async suspend/resume on i2c client devices")
>>>>>> and reverting that fixes it for me.
>>>>>
>>>>> Thank you for the report plus bisection and sorry for the regression!
>>>>
>>>> +1, Thanks for the bisection, and apologies for the inconveniences.
>>>>
>>>> The problem here seems to be that for some reason, some devices (all
>>>> connected to rmi4 adapter) failed to resume, but only when
>>>> asynchronous suspend is enabled (by 172d931910e1):
>>>>
>>>> [   79.221064] rmi4_smbus 6-002c: failed to get SMBus version number!
>>>> [   79.265074] rmi4_physical rmi4-00: rmi_driver_reset_handler: Failed
>>>> to read current IRQ mask.
>>>> [   79.308330] rmi4_f01 rmi4-00.fn01: Failed to restore normal operation: -6.
>>>> [   79.308335] rmi4_f01 rmi4-00.fn01: Resume failed with code -6.
>>>> [   79.308339] rmi4_physical rmi4-00: Failed to suspend functions: -6
>>>> [   79.308342] rmi4_smbus 6-002c: Failed to resume device: -6
>>>> [   79.351967] rmi4_physical rmi4-00: Failed to read irqs, code=-6
>>>>

v5.17-rc3 on Lenovo ThinkPad X1 Carbon 8th don't even suspend due the 
same commit 172d931910e1. Sadly I tested the original patch on other 
machine(s) but not on this one with rmi4 :-(

[   39.957293] PM: suspend entry (s2idle)
[   40.938666] Filesystems sync: 0.980 seconds
[   40.942751] Freezing user space processes ... (elapsed 0.001 seconds) 
done.
[   40.945511] OOM killer disabled.
[   40.946111] Freezing remaining freezable tasks ... (elapsed 0.001 
seconds) done.
[   40.948590] printk: Suspending console(s) (use no_console_suspend to 
debug)
[   40.993123] i801_smbus 0000:00:1f.4: No response
[   40.993218] rmi4_f01 rmi4-00.fn01: Failed to write sleep mode: -6.
[   40.993232] rmi4_f01 rmi4-00.fn01: Suspend failed with code -6.
[   40.993241] rmi4_physical rmi4-00: Failed to suspend functions: -6
[   40.993404] rmi4_smbus 1-002c: Failed to suspend device: -6
[   40.993414] PM: dpm_run_callback(): rmi_smb_suspend+0x0/0x30 
[rmi_smbus] returns -6
[   40.993438] rmi4_smbus 1-002c: PM: failed to suspend async: error -6
[   41.014198] PM: Some devices failed to suspend, or early wake event 
detected
[   41.021544] i801_smbus 0000:00:1f.4: No response
[   41.021612] rmi4_f03 rmi4-00.fn03: rmi_f03_pt_write: Failed to write 
to F03 TX register (-6).
[   41.022189] i801_smbus 0000:00:1f.4: No response
[   41.022230] rmi4_f03 rmi4-00.fn03: rmi_f03_pt_write: Failed to write 
to F03 TX register (-6).
[   41.023480] i801_smbus 0000:00:1f.4: No response
[   41.023542] rmi4_physical rmi4-00: rmi_driver_clear_irq_bits: Failed 
to change enabled interrupts!
[   41.033850] i801_smbus 0000:00:1f.4: No response
[   41.034006] OOM killer enabled.
[   41.035449] i801_smbus 0000:00:1f.4: No response
[   41.035722] Restarting tasks ...
[   41.036705] rmi4_physical rmi4-00: rmi_driver_set_irq_bits: Failed to 
change enabled interrupts!
[   41.038367] done.
[   41.039003] psmouse: probe of serio2 failed with error -1
[   41.071700] PM: suspend exit

>> I wonder if we could apply a little bit more targeted patch:
>>
>> diff --git a/drivers/input/rmi4/rmi_smbus.c b/drivers/input/rmi4/rmi_smbus.c
>> index 2407ea43de59..3901d06d38ca 100644
>> --- a/drivers/input/rmi4/rmi_smbus.c
>> +++ b/drivers/input/rmi4/rmi_smbus.c
>> @@ -335,6 +335,7 @@ static int rmi_smb_probe(struct i2c_client *client,
>>   		return error;
>>   	}
>>   
>> +	device_disable_async_suspend(&client->dev);
>>   	return 0;
>>   }
>>   
>>
>> ... and if that works then we cant try to establish proper dependencies
>> via device links later.
>>
>> Hugh, could you please try this out and see if it helps?
> 
> Yes, that works nicely, thanks Dmitry.
> 
Gladly fixes the issue on ThinkPad X1 Carbon 8th too:

Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
