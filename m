Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7195F4B4509
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Feb 2022 09:57:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242536AbiBNI5z (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Feb 2022 03:57:55 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:52788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242396AbiBNI5y (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Feb 2022 03:57:54 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0B85B5F8FD
        for <linux-i2c@vger.kernel.org>; Mon, 14 Feb 2022 00:57:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644829066;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gPLN3t4GWJps2sZsL0ZhCY1w6K+/NAS9stc8kPi4Oek=;
        b=MBDsZDMWjuuGgJr+T46Jn5qlP5fUGEmMXk80VtzUFQ2vgTLoHJjtawMQ6yWazdGv6L2tn1
        AJe9SXn7asX4Xth5WyF7RDc7yKNkb2hkQouL212WsXIZE43oU9A5ttnQgaDG/cfhDs+G6E
        a4b7kbjoKtb8tRoK/qtJJ1jigy8XuOI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-RFNED4UtPdizA0aWeyhqlw-1; Mon, 14 Feb 2022 03:57:44 -0500
X-MC-Unique: RFNED4UtPdizA0aWeyhqlw-1
Received: by mail-ed1-f69.google.com with SMTP id j10-20020a05640211ca00b004090fd8a936so5213533edw.23
        for <linux-i2c@vger.kernel.org>; Mon, 14 Feb 2022 00:57:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gPLN3t4GWJps2sZsL0ZhCY1w6K+/NAS9stc8kPi4Oek=;
        b=MeKmMFGGoihVPq0fsLpRWw7fAifLyHieCDUjWrrI9svQi6qfGKKt+lkWYnn55qXhh2
         vDVfCvD+G2J5+PKmqqrQGR/JIJDaNt6+1X2MGHIM6C456I4qjaHAEZapfZL2t4FTod9j
         4llGfpz9u5qHhFPPzo5dbbZWXs8HcE1QAo2Ckxbw39zz/XNxm80lBt5M0mR6wwMoHG9B
         h5sSwxz7xbN3EHxmjsjlnKZ1saS0/6jFgOtpVRhnyGHHEiwBi07rZhtSXvImsFaN+g0c
         IKcQ3sfc8eCkToFmFIbJLwRnm/TtyX4RiWmBEW2JcfEPxEDAD4lFhQLy2WgZU4N8TjXw
         wM3w==
X-Gm-Message-State: AOAM530ttkn8OQEpVFSb6VoLEb6M3ajYzIoSCp74dZ4ZL//peSDMw/xL
        U5AUXZJrGC2B1H8clncy2W9qmN3O6vfONlfV+fXA6zcyZQWykLAFZKZB/WrHArsN+mj8kjat7AV
        tQP0Kn26F3Cwc5f9lg9dt
X-Received: by 2002:a17:906:77dc:: with SMTP id m28mr9013485ejn.408.1644829063558;
        Mon, 14 Feb 2022 00:57:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjS9aD+wgiwQ1+avbzTa5afMyTz2iecOKyu2RrkVXSIv61V5fBbqcBKSfY3T6qc3X8yzdjoA==
X-Received: by 2002:a17:906:77dc:: with SMTP id m28mr9013471ejn.408.1644829063285;
        Mon, 14 Feb 2022 00:57:43 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id p16sm4987870ejn.54.2022.02.14.00.57.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Feb 2022 00:57:42 -0800 (PST)
Message-ID: <302db75c-8f5a-13af-42e7-6a47863ccefd@redhat.com>
Date:   Mon, 14 Feb 2022 09:57:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: 5.17-rc regression: rmi4 clients cannot deal with asynchronous
 suspend? (was: X1 Carbon touchpad not resumed)
Content-Language: en-US
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     Hugh Dickins <hughd@google.com>, Rajat Jain <rajatja@google.com>,
        Wolfram Sang <wsa@kernel.org>,
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
 <6f1103af-595c-ed0a-b946-97a9331ed148@linux.intel.com>
 <Ygm+5rS7Cxeea5Dp@google.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Ygm+5rS7Cxeea5Dp@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi All,

On 2/14/22 03:31, Dmitry Torokhov wrote:
> Hi Hugh, Jarkko,
> 
> On Tue, Feb 08, 2022 at 04:57:53PM +0200, Jarkko Nikula wrote:
>> Hi
>>
>> On 2/8/22 04:50, Hugh Dickins wrote:
>>> On Mon, 7 Feb 2022, Dmitry Torokhov wrote:
>>>> On Mon, Feb 07, 2022 at 01:41:36PM -0800, Rajat Jain wrote:
>>>>>>>> Bisection led to 172d931910e1db800f4e71e8ed92281b6f8c6ee2
>>>>>>>> ("i2c: enable async suspend/resume on i2c client devices")
>>>>>>>> and reverting that fixes it for me.
>>>>>>>
>>>>>>> Thank you for the report plus bisection and sorry for the regression!
>>>>>>
>>>>>> +1, Thanks for the bisection, and apologies for the inconveniences.
>>>>>>
>>>>>> The problem here seems to be that for some reason, some devices (all
>>>>>> connected to rmi4 adapter) failed to resume, but only when
>>>>>> asynchronous suspend is enabled (by 172d931910e1):
>>>>>>
>>>>>> [   79.221064] rmi4_smbus 6-002c: failed to get SMBus version number!
>>>>>> [   79.265074] rmi4_physical rmi4-00: rmi_driver_reset_handler: Failed
>>>>>> to read current IRQ mask.
>>>>>> [   79.308330] rmi4_f01 rmi4-00.fn01: Failed to restore normal operation: -6.
>>>>>> [   79.308335] rmi4_f01 rmi4-00.fn01: Resume failed with code -6.
>>>>>> [   79.308339] rmi4_physical rmi4-00: Failed to suspend functions: -6
>>>>>> [   79.308342] rmi4_smbus 6-002c: Failed to resume device: -6
>>>>>> [   79.351967] rmi4_physical rmi4-00: Failed to read irqs, code=-6
>>>>>>
>>
>> v5.17-rc3 on Lenovo ThinkPad X1 Carbon 8th don't even suspend due the same
>> commit 172d931910e1. Sadly I tested the original patch on other machine(s)
>> but not on this one with rmi4 :-(
>>
>> [   39.957293] PM: suspend entry (s2idle)
>> [   40.938666] Filesystems sync: 0.980 seconds
>> [   40.942751] Freezing user space processes ... (elapsed 0.001 seconds)
>> done.
>> [   40.945511] OOM killer disabled.
>> [   40.946111] Freezing remaining freezable tasks ... (elapsed 0.001
>> seconds) done.
>> [   40.948590] printk: Suspending console(s) (use no_console_suspend to
>> debug)
>> [   40.993123] i801_smbus 0000:00:1f.4: No response
>> [   40.993218] rmi4_f01 rmi4-00.fn01: Failed to write sleep mode: -6.
>> [   40.993232] rmi4_f01 rmi4-00.fn01: Suspend failed with code -6.
>> [   40.993241] rmi4_physical rmi4-00: Failed to suspend functions: -6
>> [   40.993404] rmi4_smbus 1-002c: Failed to suspend device: -6
>> [   40.993414] PM: dpm_run_callback(): rmi_smb_suspend+0x0/0x30 [rmi_smbus]
>> returns -6
>> [   40.993438] rmi4_smbus 1-002c: PM: failed to suspend async: error -6
>> [   41.014198] PM: Some devices failed to suspend, or early wake event
>> detected
>> [   41.021544] i801_smbus 0000:00:1f.4: No response
>> [   41.021612] rmi4_f03 rmi4-00.fn03: rmi_f03_pt_write: Failed to write to
>> F03 TX register (-6).
>> [   41.022189] i801_smbus 0000:00:1f.4: No response
>> [   41.022230] rmi4_f03 rmi4-00.fn03: rmi_f03_pt_write: Failed to write to
>> F03 TX register (-6).
>> [   41.023480] i801_smbus 0000:00:1f.4: No response
>> [   41.023542] rmi4_physical rmi4-00: rmi_driver_clear_irq_bits: Failed to
>> change enabled interrupts!
>> [   41.033850] i801_smbus 0000:00:1f.4: No response
>> [   41.034006] OOM killer enabled.
>> [   41.035449] i801_smbus 0000:00:1f.4: No response
>> [   41.035722] Restarting tasks ...
>> [   41.036705] rmi4_physical rmi4-00: rmi_driver_set_irq_bits: Failed to
>> change enabled interrupts!
>> [   41.038367] done.
>> [   41.039003] psmouse: probe of serio2 failed with error -1
>> [   41.071700] PM: suspend exit
> 
> Sorry for the delay, but I wonder if you could try the patch below and
> tell me if that also fixes the issue for you?
> 
> Also adding Hans as to make sure changes to psmouse_smbus make sense to
> him.

I'm not really familiar with the whole psmouse intertouch code. I've added Benjamin
Tissoires to the Cc who knows this code a lot better then I do.

Regards,

Hans



> diff --git a/drivers/input/mouse/psmouse-smbus.c b/drivers/input/mouse/psmouse-smbus.c
> index a472489ccbad..164f6c757f6b 100644
> --- a/drivers/input/mouse/psmouse-smbus.c
> +++ b/drivers/input/mouse/psmouse-smbus.c
> @@ -75,6 +75,8 @@ static void psmouse_smbus_detach_i2c_client(struct i2c_client *client)
>  				    "Marking SMBus companion %s as gone\n",
>  				    dev_name(&smbdev->client->dev));
>  			smbdev->dead = true;
> +			device_link_remove(&smbdev->client->dev,
> +					   &smbdev->psmouse->ps2dev.serio->dev);
>  			serio_rescan(smbdev->psmouse->ps2dev.serio);
>  		} else {
>  			list_del(&smbdev->node);
> @@ -174,6 +176,8 @@ static void psmouse_smbus_disconnect(struct psmouse *psmouse)
>  		kfree(smbdev);
>  	} else {
>  		smbdev->dead = true;
> +		device_link_remove(&smbdev->client->dev,
> +				   &psmouse->ps2dev.serio->dev);
>  		psmouse_dbg(smbdev->psmouse,
>  			    "posting removal request for SMBus companion %s\n",
>  			    dev_name(&smbdev->client->dev));
> @@ -270,6 +274,12 @@ int psmouse_smbus_init(struct psmouse *psmouse,
>  
>  	if (smbdev->client) {
>  		/* We have our companion device */
> +		if (!device_link_add(&smbdev->client->dev,
> +				     &psmouse->ps2dev.serio->dev,
> +				     DL_FLAG_STATELESS))
> +			psmouse_warn(psmouse,
> +				     "failed to set up link with iSMBus companion %s\n",
> +				     dev_name(&smbdev->client->dev));
>  		return 0;
>  	}
>  
> 

