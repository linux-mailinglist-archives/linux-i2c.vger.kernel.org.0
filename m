Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B447263A7F9
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Nov 2022 13:11:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231696AbiK1MLI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 28 Nov 2022 07:11:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231698AbiK1MKv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 28 Nov 2022 07:10:51 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5FF8E220E3;
        Mon, 28 Nov 2022 04:04:38 -0800 (PST)
Received: from loongson.cn (unknown [112.20.109.110])
        by gateway (Coremail) with SMTP id _____8DxOemeo4RjoKwBAA--.864S3;
        Mon, 28 Nov 2022 20:03:42 +0800 (CST)
Received: from [0.0.0.0] (unknown [112.20.109.110])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8CxXuCco4Rj+k0dAA--.8254S3;
        Mon, 28 Nov 2022 20:03:41 +0800 (CST)
Message-ID: <8b0e2e61-2e54-127e-7cb8-9e1068dbc390@loongson.cn>
Date:   Mon, 28 Nov 2022 20:03:40 +0800
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
From:   Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <Y4Cb19PM97M9HaiB@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxXuCco4Rj+k0dAA--.8254S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoW3Jr1xXrW5Xw15Cr4kKr1UGFg_yoW3JFyUpF
        WkJFy5KFW8Xr10grnrXr1YyFy2qrZ3Jw1xtFWrKFy29r90vwn2vFWrWr1Y9r1kWrWkC3yx
        Aw4qgr45u3yFgFJanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bqxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAa
        w2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
        I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2
        jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62
        AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCa
        FVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
        IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI
        42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
        IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280
        aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8uc_3UUUUU==
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy:

Firstly, thanks for your careful review.

在 2022/11/25 18:41, Andy Shevchenko 写道:
> On Fri, Nov 25, 2022 at 04:55:20PM +0800, Binbin Zhou wrote:
>> This I2C module is integrated into the Loongson-2K SoCs and Loongson
>> LS7A bridge chip.
> ...
>
> Missing bits.h.

Is it needed? I found it already included in I2c.h.

>
>> +#include <linux/completion.h>
>> +#include <linux/delay.h>
>> +#include <linux/device.h>
>> +#include <linux/i2c.h>
>> +#include <linux/init.h>
>> +#include <linux/interrupt.h>
>> +#include <linux/io.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/of_device.h>
> There is no user of this header.
> Why?
>
>> +#include <linux/platform_device.h>
> ...
>
>> +/* LS2X I2C clock frequency 50M */
>> +#define HZ_PER_MHZ		(50 * 1000000)
> units.h ?
I misunderstood your previous comment, and  the HZ_PER_MHZ in units.h 
will be used.
>
> ...
>
>> +struct ls2x_i2c_dev {
>> +	struct device		*dev;
>> +	void __iomem		*base;
>> +	int			irq;
>> +	u32			bus_clk_rate;
>> +	struct completion	cmd_complete;
>> +	struct i2c_adapter	adapter;
> Check if moving this to be the first field makes code generation better
> (bloat-o-meter is your friend).

vmlinux.old: original order

vmlinux:  adapter to be the first field

[zhoubinbin@kernelserver github]$ scripts/bloat-o-meter vmlinux.old vmlinux
add/remove: 0/0 grow/shrink: 0/2 up/down: 0/-8 (-8)
Function                                     old     new   delta
ls2x_i2c_remove                               36      32      -4
ls2x_i2c_probe                               424     420      -4

Total: Before=19302026, After=19302018, chg -0.00%


>
>> +	unsigned int		suspended:1;
>> +};
>> +	return ls2x_i2c_send_byte(adap, LS2X_CR_STOP);
>> +}
> ...
>
>> +static int ls2x_i2c_start(struct i2c_adapter *adap, struct i2c_msg *msgs)
>> +{
>> +	struct ls2x_i2c_dev *dev = i2c_get_adapdata(adap);
>> +	unsigned char addr = i2c_8bit_addr_from_msg(msgs);
>> +
>> +	reinit_completion(&dev->cmd_complete);
>> +	addr |= (msgs->flags & I2C_M_RD) ? 1 : 0;
> Why is this needed?
In the ls2x I2C controller, the bit 0 of TXR indicates the read/write 
status when transferring the address.
>
>> +	writeb(addr, dev->base + I2C_LS2X_TXR);
>> +
>> +	return ls2x_i2c_send_byte(adap, (LS2X_CR_START | LS2X_CR_WRITE));
>> +}
> ...
>
>> +	while (len--) {
>> +		if (len == 0)
>> +			cmd |= LS2X_CR_ACK;
>> +
>> +		writeb(cmd, dev->base + I2C_LS2X_CR);
> Can be written as
>
> 		writeb(cmd | (len ? 0 : LS2X_CR_ACK), dev->base + I2C_LS2X_CR);
>
> but it's up to you.
>
>> +		time_left = wait_for_completion_timeout(&dev->cmd_complete,
>> +							adap->timeout);
>> +		if (unlikely(!time_left)) {
>> +			dev_err(dev->dev, "transaction timeout\n");
>> +			return -ETIMEDOUT;
>> +		}
>> +
>> +		*buf++ = readb(dev->base + I2C_LS2X_RXR);
>> +	}
> ...
>
>> +	for (retry = 0; retry < adap->retries; retry++) {
>> +
> Unneeded blank line.
>
>> +		ret = ls2x_i2c_doxfer(adap, msgs, num);
>> +		if (ret != -EAGAIN)
>> +			return ret;
>> +
>> +		dev_dbg(dev->dev, "Retrying transmission (%d)\n", retry);
>> +		udelay(100);
>> +	}
> Can something from iopoll.h be utilized here?
I think udelay() should be suitable because it is just the time interval 
between two retry.
>
> ...
>
>> +	if (iflag & LS2X_SR_IF) {
>> +		writeb(LS2X_CR_IACK, dev->base + I2C_LS2X_CR);
>> +		complete(&dev->cmd_complete);
>> +	} else
>> +		return IRQ_NONE;
>
> Use usual pattern: checking for error condition first.
>
> 	if (!(iflag & LS2X_SR_IF))
> 		return IRQ_NONE;
>
> 	writeb(LS2X_CR_IACK, dev->base + I2C_LS2X_CR);
> 	complete(&dev->cmd_complete);
>
>> +	return IRQ_HANDLED;
> ...
>
>> +	writeb((val & 0xff00) >> 8, dev->base + I2C_LS2X_PRER_HI);
>
> What ' & 0xff00' part is for?
Emm... I'll use  writel(val, priv->base + I2C_LS2X_PRER_LO); instead.
> ...
>
>> +	dev = devm_kzalloc(&pdev->dev,
>> +			sizeof(struct ls2x_i2c_dev), GFP_KERNEL);
> sizeof(*dev) and make it one line.
>
>> +	if (unlikely(!dev))
> Why unlikely()?
>
>> +		return -ENOMEM;
> ...
>
>> +	dev->irq = platform_get_irq(pdev, 0);
>> +	if (unlikely(dev->irq <= 0))
> Why 'unlikely()'? Why == 0 is here?
>
>> +		return -ENODEV;
> ...
>
>> +	r = devm_request_irq(&pdev->dev, dev->irq, ls2x_i2c_isr,
>> +			      IRQF_SHARED, "ls2x-i2c", dev);
>> +	if (unlikely(r)) {
> Why 'unlikely()'? You must explain all likely() / unlikely() use in the code.
These 'unlikely()' may not be quite right, at that time I just thought 
these anomalies were infrequent.
>
>> +		dev_err(dev->dev, "failure requesting irq %i\n", dev->irq);
>> +		return r;
> 	return dev_err_probe(...);
>
>> +	}
> ...
>
>> +	/*
>> +	 * The I2C controller has a fixed I2C bus frequency by default, but to
>> +	 * be compatible with more client devices, we can obtain the set I2C
>> +	 * bus frequency from ACPI or FDT.
>> +	 */
>> +	dev->bus_clk_rate = i2c_acpi_find_bus_speed(&pdev->dev);
>> +	if (!dev->bus_clk_rate)
>> +		device_property_read_u32(&pdev->dev, "clock-frequency",
>> +					&dev->bus_clk_rate);
> This should be done via
>
>          i2c_parse_fw_timings(&pdev->dev, ...);
>
> no?

Yes, I get it，and the i2c_ls2x_adjust_bus_speed() function will be 
introduced to calculate i2c bus_freq_hz.

>
> ...
>
>> +	adap->dev.of_node = pdev->dev.of_node;
>> +	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
> device_set_node()
>
> ...
>
>> +	/* i2c device drivers may be active on return from add_adapter() */
>> +	r = i2c_add_adapter(adap);
>> +	if (r) {
>> +		dev_err(dev->dev, "failure adding adapter\n");
>> +		return r;
> 	return dev_err_probe(...);
>
>> +	}
> ...
>
>> +static int __maybe_unused ls2x_i2c_suspend_noirq(struct device *dev)
> No __maybe_unused, use proper PM macros and definitions.
> (look for pm_ptr() / pm_sleep_ptr() and corresponding defines)
>
>> +{
>> +	struct platform_device *pdev = to_platform_device(dev);
>> +	struct ls2x_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
>> +
>> +	i2c_dev->suspended = 1;
>> +
>> +	return 0;
>> +}
>> +
>> +static int __maybe_unused ls2x_i2c_resume(struct device *dev)
>> +{
>> +	struct platform_device *pdev = to_platform_device(dev);
>> +	struct ls2x_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
>> +
>> +	i2c_dev->suspended = 0;
>> +	ls2x_i2c_reginit(i2c_dev);
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct dev_pm_ops ls2x_i2c_dev_pm_ops = {
>> +	SET_SYSTEM_SLEEP_PM_OPS(ls2x_i2c_suspend_noirq, ls2x_i2c_resume)
>> +};
> As per above.

The pm_sleep_ptr(&ls2x_i2c_dev_pm_ops) will be used in ls2x_i2c_driver 
and drop __maybe_unused.

Binbin

> ...
>
>> +static const struct of_device_id ls2x_i2c_id_table[] = {
>> +	{ .compatible = "loongson,ls2k-i2c" },
>> +	{ .compatible = "loongson,ls7a-i2c" },
>> +	{ /* sentinel */ },
> No comma for terminator entry.
>
>> +};
> ...
>
>> +	{ "LOON0004", 0 },
> ', 0' is redundant.
>
> ...
>
>> +static struct platform_driver ls2x_i2c_driver = {
>> +	.probe		= ls2x_i2c_probe,
>> +	.remove		= ls2x_i2c_remove,
>> +	.driver		= {
>> +		.name	= "ls2x-i2c",
>> +		.owner	= THIS_MODULE,
> Why?
>
>> +		.pm	= &ls2x_i2c_dev_pm_ops,
>> +		.of_match_table = ls2x_i2c_id_table,
>> +		.acpi_match_table = ls2x_i2c_acpi_match,
>> +	},
>> +};

