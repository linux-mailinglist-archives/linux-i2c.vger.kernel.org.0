Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 450EB63BF28
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Nov 2022 12:35:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbiK2LfR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 29 Nov 2022 06:35:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232151AbiK2LfF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 29 Nov 2022 06:35:05 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D2660267D;
        Tue, 29 Nov 2022 03:35:03 -0800 (PST)
Received: from loongson.cn (unknown [112.20.109.110])
        by gateway (Coremail) with SMTP id _____8DxdPBm7oVjxgoCAA--.4897S3;
        Tue, 29 Nov 2022 19:35:02 +0800 (CST)
Received: from [0.0.0.0] (unknown [112.20.109.110])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8BxTuBi7oVjWUUeAA--.11109S3;
        Tue, 29 Nov 2022 19:35:01 +0800 (CST)
Message-ID: <ada74168-4aef-b73e-ec47-437dfcdcea77@loongson.cn>
Date:   Tue, 29 Nov 2022 19:34:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH V3 4/5] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C
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
References: <cover.1669359515.git.zhoubinbin@loongson.cn>
 <822356908305580d601e5b3e424371ed7f220b85.1669359515.git.zhoubinbin@loongson.cn>
 <Y4Cb19PM97M9HaiB@smile.fi.intel.com>
 <8b0e2e61-2e54-127e-7cb8-9e1068dbc390@loongson.cn>
 <Y4S2cnlAm3YYvZ8E@smile.fi.intel.com>
From:   Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <Y4S2cnlAm3YYvZ8E@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8BxTuBi7oVjWUUeAA--.11109S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxXry5Gry7ZryfXr1xWF1xXwb_yoWrWFWfpF
        W8Ja45KrWUXr109rnFqw15tr9IvrW8J3srJryrGF1xXrn0qrnFqrWUXr1j9F18Wr4ktr48
        Zr4DKrW5uFy5XFDanT9S1TB71UUUUjUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bDAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_JrI_Jryl8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2kK
        e7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI
        0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280
        aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2
        xFo4CEbIxvr21lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC
        6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
        026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF
        0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0x
        vE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv
        6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07jzE_NUUUUU=
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy:

在 2022/11/28 21:24, Andy Shevchenko 写道:
> On Mon, Nov 28, 2022 at 08:03:40PM +0800, Binbin Zhou wrote:
>> 在 2022/11/25 18:41, Andy Shevchenko 写道:
>>> On Fri, Nov 25, 2022 at 04:55:20PM +0800, Binbin Zhou wrote:
> ...
>
>>> Missing bits.h.
>> Is it needed? I found it already included in I2c.h.
> The rule of thumb is to include headers we are the direct user of.
> Exceptions are the headers that are guaranteed to be included by
> others. i2c.h doesn't guarantee this and many other inclusions
> while using them for itself or simply included them wrongly.
OK, I get it.
>
> ...
>
>>>> +struct ls2x_i2c_dev {
>>>> +	struct device		*dev;
>>>> +	void __iomem		*base;
>>>> +	int			irq;
>>>> +	u32			bus_clk_rate;
>>>> +	struct completion	cmd_complete;
>>>> +	struct i2c_adapter	adapter;
>>> Check if moving this to be the first field makes code generation better
>>> (bloat-o-meter is your friend).
>> vmlinux.old: original order
>>
>> vmlinux:  adapter to be the first field
>>
>> [zhoubinbin@kernelserver github]$ scripts/bloat-o-meter vmlinux.old vmlinux
>> add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-8 (-8)
>> Function                                     old     new   delta
>> ls2x_i2c_remove                               36      32      -4
>> ls2x_i2c_probe                               424     420      -4
>>
>> Total: Before=19302026, After=19302018, chg -0.00%
> Good, up to you (personally I find usually better to have embedded structures,
> which are parent objects in terms of OOP, to be first members).
>
>>>> +	unsigned int		suspended:1;
>>>> +};
>>>> +	return ls2x_i2c_send_byte(adap, LS2X_CR_STOP);
>>>> +}
> ...
>
>>>> +static int ls2x_i2c_start(struct i2c_adapter *adap, struct i2c_msg *msgs)
>>>> +{
>>>> +	struct ls2x_i2c_dev *dev = i2c_get_adapdata(adap);
>>>> +	unsigned char addr = i2c_8bit_addr_from_msg(msgs);
>>>> +
>>>> +	reinit_completion(&dev->cmd_complete);
>>>> +	addr |= (msgs->flags & I2C_M_RD) ? 1 : 0;
>>> Why is this needed?
>> In the ls2x I2C controller, the bit 0 of TXR indicates the read/write status
>> when transferring the address.
> Yes, I understand this. I don't understand why do you need this twice.

Are you saying that the "is_read" variable in ls2x_i2c_xfer_one() 
already indicates the read/write state of data transfer?

I just didn't think it was necessary to take "is_read" as an argument to 
ls2x_i2c_start() at the time, since we could get it from "msg".

Thanks.

Binbin

>
>>>> +	writeb(addr, dev->base + I2C_LS2X_TXR);
>>>> +
>>>> +	return ls2x_i2c_send_byte(adap, (LS2X_CR_START | LS2X_CR_WRITE));
>>>> +}
> ...
>
>>>> +	for (retry = 0; retry < adap->retries; retry++) {
>>>> +
>>> Unneeded blank line.
>>>
>>>> +		ret = ls2x_i2c_doxfer(adap, msgs, num);
>>>> +		if (ret != -EAGAIN)
>>>> +			return ret;
>>>> +
>>>> +		dev_dbg(dev->dev, "Retrying transmission (%d)\n", retry);
>>>> +		udelay(100);
>>>> +	}
>>> Can something from iopoll.h be utilized here?
>> I think udelay() should be suitable because it is just the time interval
>> between two retry.
> Read again my comment. Also thanks for pointing out that this is atomic. Is
> this really needs to be atomic?
>
> ...
>
>>>> +	/*
>>>> +	 * The I2C controller has a fixed I2C bus frequency by default, but to
>>>> +	 * be compatible with more client devices, we can obtain the set I2C
>>>> +	 * bus frequency from ACPI or FDT.
>>>> +	 */
>>>> +	dev->bus_clk_rate = i2c_acpi_find_bus_speed(&pdev->dev);
>>>> +	if (!dev->bus_clk_rate)
>>>> +		device_property_read_u32(&pdev->dev, "clock-frequency",
>>>> +					&dev->bus_clk_rate);
>>> This should be done via
>>>           i2c_parse_fw_timings(&pdev->dev, ...);
>>> no?
>> Yes, I get it，and the i2c_ls2x_adjust_bus_speed() function will be
>> introduced to calculate i2c bus_freq_hz.
> Yep, depends on your needs. It might be that some of the drivers are using
> the code that you may reuse (by moving to i2c-core-acpi.c).
>

