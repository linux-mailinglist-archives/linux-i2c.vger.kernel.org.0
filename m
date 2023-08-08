Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5842774906
	for <lists+linux-i2c@lfdr.de>; Tue,  8 Aug 2023 21:47:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231486AbjHHTrE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 8 Aug 2023 15:47:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231167AbjHHTqt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 8 Aug 2023 15:46:49 -0400
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E1FA17BB4
        for <linux-i2c@vger.kernel.org>; Tue,  8 Aug 2023 09:50:49 -0700 (PDT)
Received: from canpemm500009.china.huawei.com (unknown [172.30.72.55])
        by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RKtm873D0z1hwGK;
        Tue,  8 Aug 2023 21:08:24 +0800 (CST)
Received: from [10.67.102.169] (10.67.102.169) by
 canpemm500009.china.huawei.com (7.192.105.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 8 Aug 2023 21:11:13 +0800
CC:     <yangyicong@hisilicon.com>, <wsa@kernel.org>,
        <linux-i2c@vger.kernel.org>, <f.fangjian@huawei.com>,
        <linuxarm@huawei.com>
Subject: Re: [PATCH] i2c: hisi: Only handle the interrupt of the driver's
 transfer
To:     Andi Shyti <andi.shyti@kernel.org>
References: <20230801124625.63587-1-yangyicong@huawei.com>
 <20230801221557.74z7lorwzq5nxqam@intel.intel>
 <517658b5-4f44-7903-bb86-074c7561e0f2@huawei.com>
 <20230804233029.xgqf6zszzbqcue5o@intel.intel>
From:   Yicong Yang <yangyicong@huawei.com>
Message-ID: <d50d5d19-4f5f-8c5b-2505-1195fa314976@huawei.com>
Date:   Tue, 8 Aug 2023 21:11:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20230804233029.xgqf6zszzbqcue5o@intel.intel>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.102.169]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 canpemm500009.china.huawei.com (7.192.105.203)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 2023/8/5 7:30, Andi Shyti wrote:
> Hi Yicong,
> 
> On Wed, Aug 02, 2023 at 10:39:04AM +0800, Yicong Yang wrote:
>> On 2023/8/2 6:15, Andi Shyti wrote:
>>> Hi Yicong,
>>>
>>> On Tue, Aug 01, 2023 at 08:46:25PM +0800, Yicong Yang wrote:
>>>> From: Yicong Yang <yangyicong@hisilicon.com>
>>>>
>>>> The controller may be shared with other port, for example the firmware.
>>>> Handle the interrupt from other sources will cause crash since some
>>>> data are not initialized. So only handle the interrupt of the driver's
>>>> transfer and discard others.
>>>>
>>>> Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
>>>
>>> Is this a fix? Then, could you please add:
>>>
>>> Fixes: d62fbdb99a85 ("i2c: add support for HiSilicon I2C controller")
>>> Cc: <stable@vger.kernel.org> # v5.13+
>>>
>>> What kind of crash is this? Is it a NULL pointer dereference?
>>
>> I not quite sure this is a fix of the driver. On some use case the controller is
>> shared between the firmware and the OS and we have no synchronization method
>> from the hardware. A transfer started by the firmware cause the interrupt handled
>> by the driver and cause a NULL pointer dereference.
> 
> So that the firmware is running on a controller and memory,
> concurrently to the main CPU; which means that you are having
> some kind of bus arbitration issue with two masters on the bus.
> 

That is one case. Another case maybe the i2c rtc also locates on the same
bus and the efi-rtc will access the i2c bus.

> Anyway, if we are talking about avoiding a NULL pointer
> dereference then this is a fix and you need to add the tags
> above.
> 
> (No need to resend for this, I can do it for you if you convince
> me on the part below.)

Thanks!

> 
>>>> ---
>>>>  drivers/i2c/busses/i2c-hisi.c | 8 ++++++++
>>>>  1 file changed, 8 insertions(+)
>>>>
>>>> diff --git a/drivers/i2c/busses/i2c-hisi.c b/drivers/i2c/busses/i2c-hisi.c
>>>> index e067671b3ce2..8328da4bc3ec 100644
>>>> --- a/drivers/i2c/busses/i2c-hisi.c
>>>> +++ b/drivers/i2c/busses/i2c-hisi.c
>>>> @@ -330,6 +330,14 @@ static irqreturn_t hisi_i2c_irq(int irq, void *context)
>>>>  	struct hisi_i2c_controller *ctlr = context;
>>>>  	u32 int_stat;
>>>>  
>>>> +	/*
>>>> +	 * Don't handle the interrupt if cltr->completion is NULL. We may
>>>> +	 * reach here because the interrupt is spurious or the transfer is
>>>> +	 * started by another port rather than us.
>>>> +	 */
>>>> +	if (!ctlr->completion)
>>>> +		return IRQ_NONE;
>>>
>>> Is this the place you should really check for completion being
>>> NULL? By reading the code I don't exclude that completion at this
>>> stage might be NULL.
>>>
>>> Can it be that the real fix is this one instead:
>>
>> Maybe not. If we handle the case as late as below, we'll operate the hardware
>> which should be handled by the firmware which start the transfer. So we check
>> it as early as possible.
> 
> But if i2c_master_xfer() is not called and we receive an irq,
> most probably ctrl->completion is NULL. Right? Can this happen?
> 

Yes, this is the case.

> I can't really tell the sequence for enabling/disabling the
> interrupt in this device. They might happen in
> hisi_i2c_start_xfer() for enabling and in hisi_i2c_xfer_msg() for
> desabling at the last message; which makes the scenario above a
> bit difficult, indeed.
> 

The driver will keep the interrupt disabled if no transfer in progress.
But since the transfer is driven by the interrupt so if the firmware
start the transfer it will enable the interrupt. In such case the driver
will receive an interrupt on the Tx FIFO empty, etc and since the
transfer is not started by the driver ctlr->completion is not
initialized.

Thanks,
Yicong

> Thanks for the explanation,
> Andi
> 
>>> @@ -352,7 +352,7 @@ static irqreturn_t hisi_i2c_irq(int irq, void *context)
>>>          * Only use TRANS_CPLT to indicate the completion. On error cases we'll
>>>          * get two interrupts, INT_ERR first then TRANS_CPLT.
>>>          */
>>> -       if (int_stat & HISI_I2C_INT_TRANS_CPLT) {
>>> +       if (ctrl->completion && (int_stat & HISI_I2C_INT_TRANS_CPLT)) {
>>>                 hisi_i2c_disable_int(ctlr, HISI_I2C_INT_ALL);
>>>                 hisi_i2c_clear_int(ctlr, HISI_I2C_INT_ALL);
>>>                 complete(ctlr->completion);
>>>
>>> Anyway, this whole completion management smells a bit racy to me.
>>>
>>> Andi
>>>
>>>>  	int_stat = readl(ctlr->iobase + HISI_I2C_INT_MSTAT);
>>>>  	hisi_i2c_clear_int(ctlr, int_stat);
>>>>  	if (!(int_stat & HISI_I2C_INT_ALL))
>>>> -- 
>>>> 2.24.0
>>>>
>>> .
>>>
> .
> 
