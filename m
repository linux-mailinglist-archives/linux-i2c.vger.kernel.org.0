Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8AF21493341
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jan 2022 03:59:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351178AbiASC7l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jan 2022 21:59:41 -0500
Received: from out30-42.freemail.mail.aliyun.com ([115.124.30.42]:46435 "EHLO
        out30-42.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1345120AbiASC7i (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jan 2022 21:59:38 -0500
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R941e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04400;MF=guoheyi@linux.alibaba.com;NM=1;PH=DS;RN=10;SR=0;TI=SMTPD_---0V2F5eQY_1642561174;
Received: from 30.225.140.36(mailfrom:guoheyi@linux.alibaba.com fp:SMTPD_---0V2F5eQY_1642561174)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 19 Jan 2022 10:59:35 +0800
Message-ID: <0f5cd773-2d0a-b782-b967-ecbcec3de7b1@linux.alibaba.com>
Date:   Wed, 19 Jan 2022 10:59:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH] drivers/i2c-aspeed: avoid invalid memory reference after
 timeout
Content-Language: en-US
To:     Joel Stanley <joel@jms.id.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>
References: <20220109132613.122912-1-guoheyi@linux.alibaba.com>
 <ad5e5438-4a3f-2447-4af3-7caa91e7252a@linux.alibaba.com>
 <CACPK8XcYp9iAD3fjBQCax41C-1UpA+1AQW3epyEooYzNLt7R5g@mail.gmail.com>
 <e62fba0b-ebb9-934a-d7cf-6da33ecc4335@linux.alibaba.com>
 <CACPK8Xc+v132vM-ytdAUFhywFXGpPF+uPSBWi68ROf_PLD4VQQ@mail.gmail.com>
From:   Heyi Guo <guoheyi@linux.alibaba.com>
In-Reply-To: <CACPK8Xc+v132vM-ytdAUFhywFXGpPF+uPSBWi68ROf_PLD4VQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


在 2022/1/17 下午2:38, Joel Stanley 写道:
> On Fri, 14 Jan 2022 at 14:01, Heyi Guo <guoheyi@linux.alibaba.com> wrote:
>> Hi Joel,
>>
>>
>> 在 2022/1/11 下午6:51, Joel Stanley 写道:
>>> On Tue, 11 Jan 2022 at 07:52, Heyi Guo <guoheyi@linux.alibaba.com> wrote:
>>>> Hi all,
>>>>
>>>> Any comments?
>>>>
>>>> Thanks,
>>>>
>>>> Heyi
>>>>
>>>> 在 2022/1/9 下午9:26, Heyi Guo 写道:
>>>>> The memory will be freed by the caller if transfer timeout occurs,
>>>>> then it would trigger kernel panic if the peer device responds with
>>>>> something after timeout and triggers the interrupt handler of aspeed
>>>>> i2c driver.
>>>>>
>>>>> Set the msgs pointer to NULL to avoid invalid memory reference after
>>>>> timeout to fix this potential kernel panic.
>>> Thanks for the patch. How did you discover this issue? Do you have a
>>> test I can run to reproduce the crash?
>> We are using one i2c channel to communicate with another MCU by
>> implementing user space SSIF protocol, and the MCU may not respond in
>> time if it is busy. If it responds after timeout occurs, it will trigger
>> below kernel panic:
>>
> Thanks for the details. It looks like you've done some testing of
> this, which is good.
>
>> After applying this patch, we'll get below warning instead:
>>
>> "bus in unknown state. irq_status: 0x%x\n"
> Given we get to here in the irq handler, we've done these two tests:
>
>   - aspeed_i2c_is_irq_error()
>   - the state is not INACTIVE or PENDING
>
> but there's no buffer ready for us to use. So what has triggered the
> IRQ in this case? Do you have a record of the irq status bits?
>
> I am wondering if the driver should know that the transaction has
> timed out, instead of detecting this unknown state.

Yes, some drivers will try to abort the transaction before returning to 
the caller, if timeout happens.

The irq status bits are not always the same; searching from the history 
logs, I found some messages like below:

[  495.289499] aspeed-i2c-bus 1e78a680.i2c-bus: bus in unknown state. 
irq_status: 0x2
[  495.298003] aspeed-i2c-bus 1e78a680.i2c-bus: bus in unknown state. 
irq_status: 0x10

[   65.176761] aspeed-i2c-bus 1e78a680.i2c-bus: bus in unknown state. 
irq_status: 0x15

Thanks,

Heyi

>
>
>>> Can you provide a Fixes tag?
>> I think the bug was introduced by the first commit of this file :(
>>
>> f327c686d3ba44eda79a2d9e02a6a242e0b75787
>>
>>
>>> Do other i2c master drivers do this? I took a quick look at the meson
>>> driver and it doesn't appear to clear it's pointer to msgs.
>> It is hard to say. It seems other drivers have some recover scheme like
>> aborting the transfer, or loop each messages in process context and
>> don't do much in IRQ handler, which may disable interrupts or not retain
>> the buffer pointer before returning timeout.
> I think your change is okay to go in as it fixes the crash, but first
> I want to work out if there's some missing handling of a timeout
> condition that we should add as well.
>
>
>> Thanks,
>>
>> Heyi
>>
>>
>>>>> Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>
>>>>>
>>>>> -------
>>>>>
>>>>> Cc: Brendan Higgins <brendanhiggins@google.com>
>>>>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>>>>> Cc: Joel Stanley <joel@jms.id.au>
>>>>> Cc: Andrew Jeffery <andrew@aj.id.au>
>>>>> Cc: Philipp Zabel <p.zabel@pengutronix.de>
>>>>> Cc: linux-i2c@vger.kernel.org
>>>>> Cc: openbmc@lists.ozlabs.org
>>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>>> Cc: linux-aspeed@lists.ozlabs.org
>>>>> ---
>>>>>     drivers/i2c/busses/i2c-aspeed.c | 5 +++++
>>>>>     1 file changed, 5 insertions(+)
>>>>>
>>>>> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
>>>>> index 67e8b97c0c950..3ab0396168680 100644
>>>>> --- a/drivers/i2c/busses/i2c-aspeed.c
>>>>> +++ b/drivers/i2c/busses/i2c-aspeed.c
>>>>> @@ -708,6 +708,11 @@ static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
>>>>>                 spin_lock_irqsave(&bus->lock, flags);
>>>>>                 if (bus->master_state == ASPEED_I2C_MASTER_PENDING)
>>>>>                         bus->master_state = ASPEED_I2C_MASTER_INACTIVE;
>>>>> +             /*
>>>>> +              * All the buffers may be freed after returning to caller, so
>>>>> +              * set msgs to NULL to avoid memory reference after freeing.
>>>>> +              */
>>>>> +             bus->msgs = NULL;
>>>>>                 spin_unlock_irqrestore(&bus->lock, flags);
>>>>>
>>>>>                 return -ETIMEDOUT;
