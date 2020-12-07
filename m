Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C21452D1689
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Dec 2020 17:45:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbgLGQhv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Dec 2020 11:37:51 -0500
Received: from fllv0015.ext.ti.com ([198.47.19.141]:60612 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726519AbgLGQhv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Dec 2020 11:37:51 -0500
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B7GZwX1042796;
        Mon, 7 Dec 2020 10:35:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1607358958;
        bh=fWW6CWuFZDng3XQpuOdA7EkJI2MaZaeOWos/vGaNhew=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=mKX6ADblBUNutzeHDNeUaH7LJb/F2v2eR/WeGesa/PqPKnNgjd+SXf26DK7GESkwt
         5rxcUsvhHuMc+5q/VgVosV+wxsmKR6ZK6+A9zWX3pUAPJEDY+CmR/XH8DBfycqhpda
         n6F/2DVzxaP7sRNG1cZrJmt6MuFgQ0EnNCkRkBXo=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B7GZwxZ008762
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Dec 2020 10:35:58 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 7 Dec
 2020 10:35:57 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 7 Dec 2020 10:35:57 -0600
Received: from [10.250.100.73] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B7GZquT065189;
        Mon, 7 Dec 2020 10:35:54 -0600
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
From:   Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <a9cb5ba5-f3ce-3f82-15cc-30419bb70f4e@ti.com>
Date:   Mon, 7 Dec 2020 18:35:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1607326431.25719.33.camel@mhfsdcap03>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 07/12/2020 09:33, Qii Wang wrote:
> Hi:
> Thank you very much for your patience review.
> There are two main purposes of this patch:
> 1.i2c_mark_adapter_suspended&i2c_mark_adapter_resumed
> Avoid accessing the adapter while it is suspended by marking it
> suspended during suspend.  This allows the I2C core to catch this, and
> print a warning.
> https://patchwork.kernel.org/project/linux-arm-kernel/patch/20181219164827.20985-2-wsa+renesas@sang-engineering.com/
> 
> 2. IRQF_NO_SUSPEND.
> Having interrupts disabled means not only that an interrupt will not
> occur at an awkward time, but also that using any functionality that
> requires interrupts will not work. So if the driver uses an I2C bus or
> similar to tell the device to turn off, and if the I2C bus uses
> interrupts to indicate completion (which is normal), then either the
> device must be powered-off in suspend_late, so the I2C interrupt must be
> marked IRQF_NO_SUSPEND.
> https://patchwork.kernel.org/project/linux-acpi/patch/20180923135812.29574-8-hdegoede@redhat.com/
> 

Pls, do not top post.

> 
> On Thu, 2020-12-03 at 10:01 +0200, Grygorii Strashko wrote:
>>
>> On 03/12/2020 03:25, Qii Wang wrote:
>>> On Wed, 2020-12-02 at 16:35 +0100, Wolfram Sang wrote:
>>>> Hi,
>>>>
>>>>> Some i2c device driver indirectly uses I2C driver when it is now
>>>>> being suspended. The i2c devices driver is suspended during the
>>>>> NOIRQ phase and this cannot be changed due to other dependencies.
>>>>> Therefore, we also need to move the suspend handling for the I2C
>>>>> controller driver to the NOIRQ phase as well.
>>>>>
>>>>> Signed-off-by: Qii Wang <qii.wang@mediatek.com>
>>>>
>>>> Is this a bugfix and should go into 5.10? Or can it wait for 5.11?
>>>>
>>>
>>> Yes, Can you help to apply it into 5.10? Thanks
>>
>> To be honest if you still do have any i2c device which accessing i2c buss after _noirq
>> stage and your driver does not implement .master_xfer_atomic() - you definitely have a bigger problem.
>> So adding IRQF_NO_SUSPEND sound like a hack and probably works just by luck.
>>
> 
> At present, it is only a problem caused by missing interrupts,
> and .master_xfer_atomic() just a implement in polling mode. Why not set
> the interrupt to a state that can always be triggered?
> 
> 

Because you must not use any IRQ driven operations after _noirq suspend state as it might (and most probably will)
cause unpredictable behavior later  in suspend_enter():

	arch_suspend_disable_irqs();
	BUG_ON(!irqs_disabled());
^after this point any IRQ driven I2C transfer will cause IRQ to be re-enabled

if you need  turn off device from platform callbacks -  .master_xfer_atomic() has to be implemented and used.
  

-- 
Best regards,
grygorii
