Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5692A2DA124
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Dec 2020 21:11:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2502981AbgLNUJu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 14 Dec 2020 15:09:50 -0500
Received: from fllv0016.ext.ti.com ([198.47.19.142]:47208 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2502860AbgLNUJl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 14 Dec 2020 15:09:41 -0500
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BEK8L4L073067;
        Mon, 14 Dec 2020 14:08:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1607976501;
        bh=bYx/KPXoQnydtHvU0A93Ft8RQtsoKRmWYVYqEzohC3E=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=ca6cYdkcTVbnkADiNBN0eInegJ8WDq4+PFGkFWDOfk4/LXyfDKsgmkIHAkRgfcDpP
         0CJgnGqdd7ya9oPUwsDPmaq5ZAkF7MsJGCw8s4RmyZq3mfbtPoNr2EMQBOh+D2Rbuq
         ClrMKStJktpBh5LWXg0cUwUzr56JkyJM4WLnHvfU=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BEK8LOM088012
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 14 Dec 2020 14:08:21 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 14
 Dec 2020 14:08:21 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 14 Dec 2020 14:08:21 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BEK8Hgr080343;
        Mon, 14 Dec 2020 14:08:18 -0600
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
 <e83ab23b-81f2-620c-039b-9cadd84a39fa@ti.com>
 <1607935685.25719.49.camel@mhfsdcap03>
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <765c182a-5c68-b408-85ca-f757e891090e@ti.com>
Date:   Mon, 14 Dec 2020 22:08:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1607935685.25719.49.camel@mhfsdcap03>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 14/12/2020 10:48, Qii Wang wrote:
> On Thu, 2020-12-10 at 15:03 +0200, Grygorii Strashko wrote:
>>
>> On 10/12/2020 03:56, Qii Wang wrote:
>>> On Mon, 2020-12-07 at 18:35 +0200, Grygorii Strashko wrote:
>>>>
>>>>>
>>>>> On Thu, 2020-12-03 at 10:01 +0200, Grygorii Strashko wrote:
>>>>>>
>>>>>> On 03/12/2020 03:25, Qii Wang wrote:
>>>>>>> On Wed, 2020-12-02 at 16:35 +0100, Wolfram Sang wrote:
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>>> Some i2c device driver indirectly uses I2C driver when it is now
>>>>>>>>> being suspended. The i2c devices driver is suspended during the
>>>>>>>>> NOIRQ phase and this cannot be changed due to other dependencies.
>>>>>>>>> Therefore, we also need to move the suspend handling for the I2C
>>>>>>>>> controller driver to the NOIRQ phase as well.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Qii Wang <qii.wang@mediatek.com>
>>>>>>>>
>>>>>>>> Is this a bugfix and should go into 5.10? Or can it wait for 5.11?
>>>>>>>>
>>>>>>>
>>>>>>> Yes, Can you help to apply it into 5.10? Thanks
>>>>>>
>>>>>> To be honest if you still do have any i2c device which accessing i2c buss after _noirq
>>>>>> stage and your driver does not implement .master_xfer_atomic() - you definitely have a bigger problem.
>>>>>> So adding IRQF_NO_SUSPEND sound like a hack and probably works just by luck.
>>>>>>
>>>>>
>>>>> At present, it is only a problem caused by missing interrupts,
>>>>> and .master_xfer_atomic() just a implement in polling mode. Why not set
>>>>> the interrupt to a state that can always be triggered?
>>>>>
>>>>>
>>>>
>>>> Because you must not use any IRQ driven operations after _noirq suspend state as it might (and most probably will)
>>>> cause unpredictable behavior later  in suspend_enter():
>>>>
>>>> 	arch_suspend_disable_irqs();
>>>> 	BUG_ON(!irqs_disabled());
>>>> ^after this point any IRQ driven I2C transfer will cause IRQ to be re-enabled
>>>>
>>>> if you need  turn off device from platform callbacks -  .master_xfer_atomic() has to be implemented and used.
>>>>     
>>> Maybe my comment is a bit disturbing.Our purpose is not to call i2c and
>>> use interrupts after _noirq pauses.So We use
>>> i2c_mark_adapter_suspended&i2c_mark_adapter_resumed to block these i2c
>>> transfers， There will not have any IRQ driven I2C transfer after this
>>> point:
>>>           arch_suspend_disable_irqs();
>>>           BUG_ON(!irqs_disabled());
>>> But some device driver will do i2c transfer after
>>> dpm_noirq_resume_devices in dpm_resume_noirq(PMSG_RESUME) when our
>>> driver irq hasn't resume.
>>> 	void dpm_resume_noirq(pm_message_t state)
>>> 	{
>>>           	dpm_noirq_resume_devices(state);
>>
>> Just to clarify. You have resume sequence in dpm_noirq_resume_devices
>>    dpm_noirq_resume_devices -> resume I2C -> resume some device -> do i2c transfer after?
>>
> 
> Yes.

huh. First consider IRQF_EARLY_RESUME - it's better, but still will be a hack

> 
>> Is "some device" in Kernel mainline?
>>
> 
> The problematic device driver is drivers/regulator/da9211-regulator.c in
> Kernel mainline.

regulator is passive device, somebody should call it !?

And da9211-regulator IRQ handler should remain disabled till resume_device_irqs() call.

note. regulator_class implements only

static const struct dev_pm_ops __maybe_unused regulator_pm_ops = {
	.suspend	= regulator_suspend,
	.resume		= regulator_resume,
};


> 
>>>           	resume_device_irqs();
>>>           	device_wakeup_disarm_wake_irqs();
>>>           	cpuidle_resume();
>>> 	}
>>> .master_xfer_atomic() seems to be invalid for this question at this
>>> time?
>>>
>>
> 

-- 
Best regards,
grygorii
