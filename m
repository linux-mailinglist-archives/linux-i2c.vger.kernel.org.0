Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 732D72D5B2F
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Dec 2020 14:06:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388692AbgLJNFC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 10 Dec 2020 08:05:02 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:49132 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731240AbgLJNE4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 10 Dec 2020 08:04:56 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BAD3uin051755;
        Thu, 10 Dec 2020 07:03:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1607605436;
        bh=f6EbvCETCqSbP/orqL1NF04MBD/Ro0HKcfNe82m54FY=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=QbYV18BV+ETMCAtJEOvPsyGwtNILsBN0ohNrp9nvzItvWXUpn8qsdQuMqtn6WkRQ9
         ojIJE6BqaJ+I2TPH4CVjsVFTiptSk4qutH2wLmpr4WqYttJA5gctrYzgbznrN9lUhW
         JlWUE9uaLYxpPXBDpiXaJF1lCZ6UFWIQux38b0Tg=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BAD3ufN087548
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 10 Dec 2020 07:03:56 -0600
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 10
 Dec 2020 07:03:56 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 10 Dec 2020 07:03:56 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BAD3qMV006134;
        Thu, 10 Dec 2020 07:03:53 -0600
Subject: Re: [v2] i2c: mediatek: Move suspend and resume handling to NOIRQ
 phase
To:     Qii Wang <qii.wang@mediatek.com>
CC:     Wolfram Sang <wsa@the-dreams.de>, <matthias.bgg@gmail.com>,
        <linux-i2c@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-mediatek@lists.infradead.org>,
        <srv_heupstream@mediatek.com>, <leilk.liu@mediatek.com>
References: <1605701861-30800-1-git-send-email-qii.wang@mediatek.com>
 <20201202153543.GG874@kunai> <1606958735.25719.29.camel@mhfsdcap03>
 <629d171a-0e77-3d74-ae23-e6439dcf17b7@ti.com>
 <1607326431.25719.33.camel@mhfsdcap03>
 <a9cb5ba5-f3ce-3f82-15cc-30419bb70f4e@ti.com>
 <1607565387.25719.43.camel@mhfsdcap03>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <e83ab23b-81f2-620c-039b-9cadd84a39fa@ti.com>
Date:   Thu, 10 Dec 2020 15:03:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1607565387.25719.43.camel@mhfsdcap03>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 10/12/2020 03:56, Qii Wang wrote:
> On Mon, 2020-12-07 at 18:35 +0200, Grygorii Strashko wrote:
>>
>>>
>>> On Thu, 2020-12-03 at 10:01 +0200, Grygorii Strashko wrote:
>>>>
>>>> On 03/12/2020 03:25, Qii Wang wrote:
>>>>> On Wed, 2020-12-02 at 16:35 +0100, Wolfram Sang wrote:
>>>>>> Hi,
>>>>>>
>>>>>>> Some i2c device driver indirectly uses I2C driver when it is now
>>>>>>> being suspended. The i2c devices driver is suspended during the
>>>>>>> NOIRQ phase and this cannot be changed due to other dependencies.
>>>>>>> Therefore, we also need to move the suspend handling for the I2C
>>>>>>> controller driver to the NOIRQ phase as well.
>>>>>>>
>>>>>>> Signed-off-by: Qii Wang <qii.wang@mediatek.com>
>>>>>>
>>>>>> Is this a bugfix and should go into 5.10? Or can it wait for 5.11?
>>>>>>
>>>>>
>>>>> Yes, Can you help to apply it into 5.10? Thanks
>>>>
>>>> To be honest if you still do have any i2c device which accessing i2c buss after _noirq
>>>> stage and your driver does not implement .master_xfer_atomic() - you definitely have a bigger problem.
>>>> So adding IRQF_NO_SUSPEND sound like a hack and probably works just by luck.
>>>>
>>>
>>> At present, it is only a problem caused by missing interrupts,
>>> and .master_xfer_atomic() just a implement in polling mode. Why not set
>>> the interrupt to a state that can always be triggered?
>>>
>>>
>>
>> Because you must not use any IRQ driven operations after _noirq suspend state as it might (and most probably will)
>> cause unpredictable behavior later  in suspend_enter():
>>
>> 	arch_suspend_disable_irqs();
>> 	BUG_ON(!irqs_disabled());
>> ^after this point any IRQ driven I2C transfer will cause IRQ to be re-enabled
>>
>> if you need  turn off device from platform callbacks -  .master_xfer_atomic() has to be implemented and used.
>>    
> Maybe my comment is a bit disturbing.Our purpose is not to call i2c and
> use interrupts after _noirq pauses.So We use
> i2c_mark_adapter_suspended&i2c_mark_adapter_resumed to block these i2c
> transfers， There will not have any IRQ driven I2C transfer after this
> point:
>          arch_suspend_disable_irqs();
>          BUG_ON(!irqs_disabled());
> But some device driver will do i2c transfer after
> dpm_noirq_resume_devices in dpm_resume_noirq(PMSG_RESUME) when our
> driver irq hasn't resume.
> 	void dpm_resume_noirq(pm_message_t state)
> 	{
>          	dpm_noirq_resume_devices(state);

Just to clarify. You have resume sequence in dpm_noirq_resume_devices
  dpm_noirq_resume_devices -> resume I2C -> resume some device -> do i2c transfer after?

Is "some device" in Kernel mainline?

>          	resume_device_irqs();
>          	device_wakeup_disarm_wake_irqs();
>          	cpuidle_resume();
> 	}
> .master_xfer_atomic() seems to be invalid for this question at this
> time?
> 

-- 
Best regards,
grygorii
