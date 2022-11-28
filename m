Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 008D663A911
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Nov 2022 14:13:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231367AbiK1NNX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Nov 2022 08:13:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230249AbiK1NNJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Nov 2022 08:13:09 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E314E1DA45;
        Mon, 28 Nov 2022 05:13:06 -0800 (PST)
Received: from loongson.cn (unknown [117.133.84.114])
        by gateway (Coremail) with SMTP id _____8Axz+vhs4RjWbIBAA--.4064S3;
        Mon, 28 Nov 2022 21:13:05 +0800 (CST)
Received: from [192.168.1.7] (unknown [117.133.84.114])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxj+Des4RjAlwdAA--.8462S3;
        Mon, 28 Nov 2022 21:13:04 +0800 (CST)
Message-ID: <f401b35d-f775-9a06-bec6-983d33ddb249@loongson.cn>
Date:   Mon, 28 Nov 2022 21:13:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 1/2] i2c: loongson: add bus driver for the loongson i2c
 controller
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>,
        William Zhang <william.zhang@broadcom.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Jan Dabros <jsd@semihalf.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221117075938.23379-1-zhuyinbo@loongson.cn>
 <Y3X0bJxOQIpP6MZv@smile.fi.intel.com>
From:   Yinbo Zhu <zhuyinbo@loongson.cn>
In-Reply-To: <Y3X0bJxOQIpP6MZv@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Bxj+Des4RjAlwdAA--.8462S3
X-CM-SenderInfo: 52kx5xhqerqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBjvJXoWxKryrWF1fKw4xXF13uFyrCrg_yoW7ZrW7pF
        WrJFW3KF4qqr1j9r929Fn09F43Arn7Jry7KrySqFy7CF90ywn7WF4FkFZ5Cr4DZws5Gr42
        va1UZrW3urZIvaDanT9S1TB71UUUUb7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bqxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AKwVWUXVWUAwA2ocxC64
        kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28E
        F7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0ow
        A2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxdM2kKe7AKxVWUtVW8ZwAS0I0E0xvYzxvE
        52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I
        80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCj
        c4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21lc7CjxVAaw2AFwI
        0_Jw0_GFyl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWrMxC20s026xCaFVCj
        c4AY6r1j6r4UMxCIbckI1I0E14v26r1q6r43MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxV
        Cjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY
        6xIIjxv20xvE14v26ryj6F1UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcV
        CF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26F4j6r4UJwCI42IY6I8E87Iv
        6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU0TrW5UUUUU==
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


在 2022/11/17 16:44, Andy Shevchenko 写道:
> On Thu, Nov 17, 2022 at 03:59:37PM +0800, Yinbo Zhu wrote:
>> This bus driver supports the Loongson i2c hardware controller in the
>> Loongson platforms and supports to use DTS and ACPI framework to
>> register i2c adapter device resources.
>>
>> The Loongson i2c controller supports operating frequencty is 50MHZ
>> and supports the maximum transmission rate is 400kbps.
> ...
>
>> +#include <linux/acpi.h>
> Besides missed of.h (but do not add it) this one has no users (see below how).
> What you _might_ need is to have property.h to be included (seems no need).

The i2c.h had included of.h/acpi.h/property.h, and remove acpi.h

  head file.

>
>> +#include <linux/module.h>
>> +#include <linux/delay.h>
>> +#include <linux/i2c.h>
>> +#include <linux/err.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/completion.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/clk.h>
>> +#include <linux/io.h>
>> +#include <linux/slab.h>
> Can you keep it ordered?
>
> ...
>
>> +#define CTR_EN				0x80
>> +#define CTR_IEN				0x40
> BIT() ?
> (don't forget to add bits.h for that)
>
> ...
>
>> +#define CR_START			0x81
>> +#define CR_STOP				0x41
>> +#define CR_READ				0x21
>> +#define CR_WRITE			0x11
> Sounds to me like a BIT() + one specific bit to be set which should be defined
> separately.

>> +#define CR_ACK				0x8
>> +#define CR_IACK				0x1
>> +
>> +#define SR_NOACK			0x80
>> +#define SR_BUSY				0x40
>> +#define SR_AL				0x20
>> +#define SR_SLAVE_ADDRESSED		0x10
>> +#define SR_SLAVE_RW			0x8
>> +#define SR_TIP				0x2
>> +#define SR_IF				0x1
> All above seems like candidates for BIT()
>
> ...
>
>> +#define i2c_readb(addr)			readb(dev->base + addr)
>> +#define i2c_writeb(val, addr)		writeb(val, dev->base + addr)
> These are rather bad macros than useful.
> Instead, you have to pass a dev parameter and even better to have them
> as static inline helpers.
>
> Also you may consider using regmap MMIO APIs.
>
> ...
>
>> +static bool repeated_start = 1;
>> +module_param(repeated_start, bool, 0600);
>> +MODULE_PARM_DESC(repeated_start,
>> +		"Compatible with devices that support repeated start");
> We discourage people to have new module parameters in the new code. Why this
> can't be altered at run-time?
>
> ...
>> +struct loongson_i2c_dev {
>> +	spinlock_t		lock;
> Haven't checkpatch complained that lock is not documented?
>
>> +	unsigned int		suspended:1;
>> +	struct device		*dev;
>> +	void __iomem		*base;
>> +	int			irq;
>> +	u32			speed_hz;
>> +	struct completion	cmd_complete;
>> +	struct resource		*ioarea;
>> +	struct i2c_adapter	adapter;
> Also consider to check what is better to have as the first field in this data
> structure. Depending on performance and code size you may choose which one can
> go with no-op pointer arithmetics.
>
>  From code size perspective you can check with bloat-o-meter.
>
>> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
>> +	struct i2c_client	*slave;
>> +	enum loongson_i2c_slave_state	slave_state;
>> +#endif
>> +};
> ...
>
>> +static int loongson_i2c_start(
>> +		struct loongson_i2c_dev *dev, int dev_addr, int flags)
> Broken indentation.
>
>> +{
>> +	unsigned long time_left;
>> +	int retry = 5;
>> +	unsigned char addr = (dev_addr & 0x7f) << 1;
> Don't we have specific macro or helper for this?
>
>> +	addr |= (flags & I2C_M_RD) ? 1 : 0;
>> +
>> +start:
>> +	mdelay(1);
> Why?
This is a workaroud.
>
>> +	i2c_writeb(addr, LOONGSON_I2C_TXR_REG);
>> +	i2c_writeb((CR_START | CR_WRITE), LOONGSON_I2C_CR_REG);
>> +	time_left = wait_for_completion_timeout(
>> +		&dev->cmd_complete,
>> +		(&dev->adapter)->timeout);
> Broken indentation, too many parentheses (use . when it's appropriate).
> Check your entire code for these.
>
>> +	if (!time_left)
>> +		return -ETIMEDOUT;
>> +
>> +	if (i2c_readb(LOONGSON_I2C_SR_REG) & SR_NOACK) {
>> +		if (loongson_i2c_stop(dev) < 0)
>> +			return -1;
>> +
>> +		while (retry--)
>> +			goto start;
> These labels here and there make code hard to understand. Try to refactor them,
> so they will be easier to follow.
>
>> +		return 0;
>> +	}
>> +	return 1;
> What does this mean? Don't you need a specific definition, since it's not an
> error code?
>
>> +}
> ...
>
>> +	i2c_writeb(i2c_readb(LOONGSON_I2C_CR_REG) |
>> +					0x01, LOONGSON_I2C_CR_REG);
>> +	i2c_writeb(i2c_readb(LOONGSON_I2C_CTR_REG) & ~0x80,
>> +					LOONGSON_I2C_CTR_REG);
>> +	i2c_writeb(prer_val & 0xFF, LOONGSON_I2C_PRER_LO_REG);
>> +	i2c_writeb((prer_val & 0xFF00) >> 8, LOONGSON_I2C_PRER_HI_REG);
>> +	i2c_writeb(i2c_readb(LOONGSON_I2C_CTR_REG) |
>> +					0xe0, LOONGSON_I2C_CTR_REG);
> Try to avoid magic numbers. Utilize GENMASK() when it's appropriate
> (here it seems you have redundant '& 0xff{00}' stuff).
>
> ...
>
> It's already a lot of remarks and comments. This patch needs more work.
> I stopped here, only a couple additional remarks below as promised above.
>
> ...
>
>> +	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
> device_set_node()
>
> ...

>> +err_iounmap:
>> +	iounmap(dev->base);
>> +err_request_irq:
>> +err_free_mem:
>> +	platform_set_drvdata(pdev, NULL);
>> +	kfree(dev);
>> +err_release_region:
>> +	release_mem_region(mem->start, resource_size(mem));
>> +
>> +	return r;
> Can you utilize devm_*() / pcim_*() APIs? Why not?
>
> ...
>
>> +		.of_match_table = of_match_ptr(loongson_i2c_id_table),
>> +		.acpi_match_table = ACPI_PTR(loongson_i2c_acpi_match),
> No of_match_ptr(), no ACPI_PTR(). You probably haven't compiled your code in
> different configuration with `make W=1 ...`.

Hi Andy,


Thanks your advice,

I had adopt it in v2 patch.

>

