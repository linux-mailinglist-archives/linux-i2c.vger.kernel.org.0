Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9835E77DA
	for <lists+linux-i2c@lfdr.de>; Fri, 23 Sep 2022 12:02:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231501AbiIWKCK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 23 Sep 2022 06:02:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231818AbiIWKBr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 23 Sep 2022 06:01:47 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C453F12FF11;
        Fri, 23 Sep 2022 03:01:41 -0700 (PDT)
Received: from [192.168.100.120] (unknown [112.20.112.163])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Dxvmv6gy1jSZ0gAA--.45506S3;
        Fri, 23 Sep 2022 18:01:32 +0800 (CST)
Message-ID: <73a11791-997b-c2d7-fa0c-3d0431293dae@loongson.cn>
Date:   Fri, 23 Sep 2022 18:01:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 2/5] i2c: gpio: Add support on ACPI-based system
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        linux-acpi@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>
References: <cover.1663835855.git.zhoubinbin@loongson.cn>
 <74988d34ceae9bf239c138a558778cd999beb77c.1663835855.git.zhoubinbin@loongson.cn>
 <YyxUjuP1TxEzoxvG@black.fi.intel.com>
From:   Binbin Zhou <zhoubinbin@loongson.cn>
In-Reply-To: <YyxUjuP1TxEzoxvG@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dxvmv6gy1jSZ0gAA--.45506S3
X-Coremail-Antispam: 1UD129KBjvJXoWxCr48Ar15Kr4UXFyxZrWxtFb_yoW5KF4rpF
        Z0kFZ8KF4DWF12gr12qr1kua4fKw4Iq3yxKr4xJ348uw1qqrn5ur1fGFyY9F1kAFy8CF1j
        v3WUtrW3uFsrZrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUvFb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwV
        C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxk0xIA0c2IEe2xFo4CEbIxvr21l
        c2xSY4AK67AK6r4DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
        0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
        tVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
        CY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
        wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvj
        xU2X_-DUUUU
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Mika：

在 2022/9/22 20:26, Mika Westerberg 写道:
> Hi,
> 
> On Thu, Sep 22, 2022 at 07:39:55PM +0800, Binbin Zhou wrote:
>> Add support for the ACPI-based device registration so that the driver
>> can be also enabled through ACPI table.
>>
>> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
>> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>
>> ---
>>   drivers/i2c/busses/i2c-gpio.c | 41 ++++++++++++++++++++++++++++++++++-
>>   1 file changed, 40 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-gpio.c b/drivers/i2c/busses/i2c-gpio.c
>> index b1985c1667e1..ccea37e755e6 100644
>> --- a/drivers/i2c/busses/i2c-gpio.c
>> +++ b/drivers/i2c/busses/i2c-gpio.c
>> @@ -13,6 +13,7 @@
>>   #include <linux/init.h>
>>   #include <linux/interrupt.h>
>>   #include <linux/module.h>
>> +#include <linux/acpi.h>
>>   #include <linux/of.h>
>>   #include <linux/platform_data/i2c-gpio.h>
>>   #include <linux/platform_device.h>
>> @@ -318,6 +319,24 @@ static void of_i2c_gpio_get_props(struct device_node *np,
>>   		of_property_read_bool(np, "i2c-gpio,scl-output-only");
>>   }
>>   
>> +static void acpi_i2c_gpio_get_props(struct device *dev,
>> +				  struct i2c_gpio_platform_data *pdata)
>> +{
>> +	u32 reg;
>> +
>> +	device_property_read_u32(dev, "delay-us", &pdata->udelay);
>> +
>> +	if (!device_property_read_u32(dev, "timeout-ms", &reg))
>> +		pdata->timeout = msecs_to_jiffies(reg);
>> +
>> +	pdata->sda_is_open_drain =
>> +		device_property_read_bool(dev, "sda-open-drain");
>> +	pdata->scl_is_open_drain =
>> +		device_property_read_bool(dev, "scl-open-drain");
>> +	pdata->scl_is_output_only =
>> +		device_property_read_bool(dev, "scl-output-only");
>> +}
> 
> I think this would work with the DT description too as it is using
> device_property_xxx() so I wonder if you can just do:
> 
> 	i2c_gpio_get_props(dev, pdata);
> 
> instead of
> 
>   	if (np) {
>   		of_i2c_gpio_get_props(np, pdata);
> 	} else if (ACPI_COMPANION(dev)) {
> 		acpi_i2c_gpio_get_props(dev, pdata);
> 
Sorry, I don't quite understand how to do a unified api.

We get the corresponding value by matching the propname, but obviously 
the propnames related in the two ways are different.

e.g. "delay-us"(ACPI) vs "i2c-gpio, delay-us"(FDT)

I think the judgment of "if..else.." is indispensable.

thanks.

Binbin

>> +
>>   static struct gpio_desc *i2c_gpio_get_desc(struct device *dev,
>>   					   const char *con_id,
>>   					   unsigned int index,
>> @@ -363,6 +382,8 @@ static int i2c_gpio_probe(struct platform_device *pdev)
>>   	struct device *dev = &pdev->dev;
>>   	struct device_node *np = dev->of_node;
>>   	enum gpiod_flags gflags;
>> +	acpi_status status;
>> +	unsigned long long id;
>>   	int ret;
>>   
>>   	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>> @@ -375,6 +396,8 @@ static int i2c_gpio_probe(struct platform_device *pdev)
>>   
>>   	if (np) {
>>   		of_i2c_gpio_get_props(np, pdata);
>> +	} else if (ACPI_COMPANION(dev)) {
>> +		acpi_i2c_gpio_get_props(dev, pdata);
>>   	} else {
>>   		/*
>>   		 * If all platform data settings are zero it is OK
>> @@ -445,7 +468,14 @@ static int i2c_gpio_probe(struct platform_device *pdev)
>>   	adap->dev.parent = dev;
>>   	adap->dev.of_node = np;
>>   
>> -	adap->nr = pdev->id;
>> +	if (ACPI_COMPANION(dev)) {
>> +		status = acpi_evaluate_integer(ACPI_HANDLE(dev),
>> +						"_UID", NULL, &id);
>> +		if (ACPI_SUCCESS(status) && (id >= 0))
>> +			adap->nr = id;
> 
> Unrelated change? And if not then same comment about why you need the
> static number in the first place ;-)

