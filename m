Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB6A7642181
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Dec 2022 03:24:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231255AbiLECYB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 4 Dec 2022 21:24:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231270AbiLECX7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 4 Dec 2022 21:23:59 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D1B1912093;
        Sun,  4 Dec 2022 18:23:56 -0800 (PST)
Received: from loongson.cn (unknown [112.20.109.110])
        by gateway (Coremail) with SMTP id _____8BxXes7Vo1jhi4DAA--.7608S3;
        Mon, 05 Dec 2022 10:23:55 +0800 (CST)
Received: from [0.0.0.0] (unknown [112.20.109.110])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8CxLuI4Vo1j17MlAA--.27729S3;
        Mon, 05 Dec 2022 10:23:54 +0800 (CST)
Message-ID: <1c07ce92-cd17-8d6a-05d1-d6ea8cc39b56@loongson.cn>
Date:   Mon, 5 Dec 2022 10:23:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From:   Binbin Zhou <zhoubinbin@loongson.cn>
Subject: Re: [PATCH V4 4/5] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C
 controller
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>, Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jianmin Lv <lvjianmin@loongson.cn>
References: <cover.1669777792.git.zhoubinbin@loongson.cn>
 <f6cc2dbe5cd190031ab4f772d1cf250934288546.1669777792.git.zhoubinbin@loongson.cn>
 <Y4e/6KewuHjAluSZ@smile.fi.intel.com>
 <f0060385-644a-847e-48cf-865c12b96473@loongson.cn>
 <Y4m3Ycs88nOk5zs9@smile.fi.intel.com>
In-Reply-To: <Y4m3Ycs88nOk5zs9@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxLuI4Vo1j17MlAA--.27729S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoW7KrW8JF18ur18Gw47Jw43ZFb_yoW8tFy7pF
        WfJFyYkF4kXF1I9rn2vw15u3Z0y398Jr47Zr4rGw1kCF909wn3Ar48tr1j9r1xWrWxJFW8
        ZFW5KrW5Gr95ZaDanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bqxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
        n4kS14v26r126r1DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E6x
        ACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E
        87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7I2V7IY0V
        AS07AlzVAYIcxG8wCY1x0262kKe7AKxVWUAVWUtwCF04k20xvY0x0EwIxGrwCFx2IqxVCF
        s4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI
        8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41l
        IxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIx
        AIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2
        jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU8Dl1DUUUUU==
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


在 2022/12/2 16:29, Andy Shevchenko 写道:
> On Fri, Dec 02, 2022 at 11:22:19AM +0800, Binbin Zhou wrote:
>> 在 2022/12/1 04:41, Andy Shevchenko 写道:
>>> On Wed, Nov 30, 2022 at 01:56:20PM +0800, Binbin Zhou wrote:
> ...
>
>>>> +	for (retry = 0; retry < adap->retries; retry++) {
>>>> +		ret = ls2x_i2c_doxfer(adap, msgs, num);
>>>> +		if (ret != -EAGAIN)
>>>> +			return ret;
>>>> +
>>>> +		dev_dbg(priv->dev, "Retrying transmission (%d)\n", retry);
>>>> +		udelay(100);
>>> Why atomic? This long (esp. atomic) delay must be explained.
>> The modification records for this part of the source code are no longer
>> traceable.
>>
>> Communicating with colleagues offline, I learned that this part of the code
>> first appeared on Linux 2.6.36, which was done to circumvent the problem of
>> probable failure to scan the device for i2c devices on some boards.
>>
>> How about I add a comment here to explain the reason for this?
> Yes, that's what we want, and not what you said above. I.o.w. the comment like
> "reason is unknown" is not accepted.
>
> Can you be more specific about the boards and why do you still need this delay?
>
> And also why is it atomic?


As we expected, the driver is geared towards Loongosn-2K and Loongson 
LS7A bridge chips, some of the older hardware still in use has scan 
failure issues and we expect to keep that part as compatible.

"Atomic" may not be necessary, It is expected to try a few more times 
when the scan device fails. Also, I think the corresponding part of the 
s3c2410 may have been referenced in the beginning.

I will try to drop the loop part to do the relevant i2c read/write tests.


Thanks.

Binbin

>>>> +	}
> ...
>
>>>> +	r = devm_request_irq(dev, irq, ls2x_i2c_irq_handler,
>>>> +				IRQF_SHARED, "ls2x-i2c", priv);
>>> Indentation.
>> Do you mean  "IRQF_SHARE"  should be aligned to "dev"  ?
> Yes.
>
> ...
>
>>>> +static const struct dev_pm_ops ls2x_i2c_pm_ops = {
>>>> +	SET_SYSTEM_SLEEP_PM_OPS(ls2x_i2c_suspend, ls2x_i2c_resume)
>>>> +};
>>> Use corresponding DEFINE_ macro.
>> ok.
>>
>> I will use
>>
>> "static DEFINE_SIMPLE_DEV_PM_OPS(ls2x_i2c_pm_ops, ls2x_i2c_suspend,
>> ls2x_i2c_resume);"  corresponding to  ".pm     = pm_ptr(&ls2x_i2c_pm_ops),"
> Shouldn't be pm_sleep_ptr()?
>
>

