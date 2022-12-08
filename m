Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FD9D646B26
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Dec 2022 09:55:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230057AbiLHIzv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Dec 2022 03:55:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbiLHIzo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Dec 2022 03:55:44 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A0EE053EDC;
        Thu,  8 Dec 2022 00:55:42 -0800 (PST)
Received: from loongson.cn (unknown [112.20.108.31])
        by gateway (Coremail) with SMTP id _____8CxbeuNppFjcBEEAA--.9417S3;
        Thu, 08 Dec 2022 16:55:41 +0800 (CST)
Received: from [0.0.0.0] (unknown [112.20.108.31])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Cx5VaLppFjodknAA--.13869S3;
        Thu, 08 Dec 2022 16:55:40 +0800 (CST)
Message-ID: <7bc31b2d-6687-5823-6950-cdedb8105db5@loongson.cn>
Date:   Thu, 8 Dec 2022 16:55:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From:   Binbin Zhou <zhoubinbin@loongson.cn>
Subject: Re: [PATCH V5 3/4] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C
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
References: <cover.1670293176.git.zhoubinbin@loongson.cn>
 <e088e2ffaef1492adc09b7cdbde0afcea2eeb8b2.1670293176.git.zhoubinbin@loongson.cn>
 <Y49ei1fpEawXvGQB@smile.fi.intel.com>
In-Reply-To: <Y49ei1fpEawXvGQB@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx5VaLppFjodknAA--.13869S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoW3Xr4xAw1fur13KrykuFyrtFb_yoW7Ary3pa
        y8AF48KrWjqr10qr4DJr1UC347Zrs5J34UJr18Jay7A3ZxCr1vqryrXr409F48Gr4kWrsr
        Aw4Dtr15ua4YvFDanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bq8YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwA2z4
        x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAa
        w2AFwI0_JF0_Jw1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44
        I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2
        jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62
        AI1cAE67vIY487MxkF7I0En4kS14v26r126r1DMxAIw28IcxkI7VAKI48JMxC20s026xCa
        FVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r126r1DMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
        IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI
        42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
        IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280
        aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUcbAwUUUUU
X-Spam-Status: No, score=1.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_SBL_CSS,SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy:

在 2022/12/6 23:23, Andy Shevchenko 写道:
> On Tue, Dec 06, 2022 at 11:16:56AM +0800, Binbin Zhou wrote:
>> This I2C module is integrated into the Loongson-2K SoCs and Loongson
>> LS7A bridge chip.
> Much better, thanks!
>
> ...
>
>> +/*
>> + * The I2C controller has a fixed I2C bus frequency by default, but to
>> + * be compatible with more client devices, we can obtain the set I2C
>> + * bus frequency from ACPI or FDT.
>> + */
>> +static void ls2x_i2c_adjust_bus_speed(struct ls2x_i2c_priv *priv)
>> +{
>> +	u16 val = 0x12c; /* Default value of I2C divider latch register */
> Besides comment better to be placed on top of the commented line, the value
> is better to have its own definition where you place the comment and elaborate
> what it means in practice (The clock frequency is changed?  Bus speed is
> different?)

Ok, I'll put this comment on a separate line.

The LS2X I2C supports STANDARD_MODE and FAST_MODE, so the maximum bus 
frequency is 400kHz.
"0x12c" is our empirical value after experimentation and represents 33KHz.

Also, I think the better way is:

@@ -53,6 +53,15 @@
  #define LS2X_CTR_IEN           BIT(6) /* Enable i2c interrupt */
  #define LS2X_CTR_MST           BIT(5) /* 0: Slave mode 1: Master mode */

+/* The PCLK clock frequency input from the LPB bus */
+#define LS2X_I2C_PCLK_FREQ     (50 * HZ_PER_MHZ)
+/*
+ * The LS2X I2C controller supports standard mode and fast mode,
+ * so the maximum bus frequency is 400kHz.
+ * The '33KHz' is our empirical value after experimentation.
+ */
+#define LS2X_I2C_FREQ_STD      (33 * HZ_PER_KHZ)
+
  struct ls2x_i2c_priv {
         struct i2c_adapter      adapter;
         struct device           *dev;
@@ -231,17 +240,19 @@ static irqreturn_t ls2x_i2c_irq_handler(int 
this_irq, void *dev_id)
   */
  static void ls2x_i2c_adjust_bus_speed(struct ls2x_i2c_priv *priv)
  {
-       u16 val = 0x12c; /* Default value of I2C divider latch register */
         struct i2c_timings *t = &priv->i2c_t;
         u32 acpi_speed = i2c_acpi_find_bus_speed(priv->dev);

         i2c_parse_fw_timings(priv->dev, t, false);

         if (acpi_speed || t->bus_freq_hz)
-               val = 10 * HZ_PER_MHZ / max(t->bus_freq_hz, acpi_speed) - 1;
+               t->bus_freq_hz = max(t->bus_freq_hz, acpi_speed);
+       else
+               t->bus_freq_hz = LS2X_I2C_FREQ_STD;

-       /* Set LS2X I2C frequency */
-       writel(val, priv->base + I2C_LS2X_PRER_LO);
+       /* Calculate and set LS2X I2C frequency */
+       writel((LS2X_I2C_PCLK_FREQ / (5 * t->bus_freq_hz) - 1),
+              priv->base + I2C_LS2X_PRER_LO);
  }

>> +	struct i2c_timings *t = &priv->i2c_t;
>> +	u32 acpi_speed = i2c_acpi_find_bus_speed(priv->dev);
>> +
>> +	i2c_parse_fw_timings(priv->dev, t, false);
>> +
>> +	if (acpi_speed || t->bus_freq_hz)
>> +		val = 10 * HZ_PER_MHZ / max(t->bus_freq_hz, acpi_speed) - 1;
>> +
>> +	/* Set LS2X I2C frequency */
>> +	writel(val, priv->base + I2C_LS2X_PRER_LO);
>> +}
> ...
>
>> +	writeb(data | LS2X_CTR_EN | LS2X_CTR_IEN | LS2X_CTR_MST,
>> +			priv->base + I2C_LS2X_CTR);
> Wrong indentation.
>
> ...
>
>> +	r = devm_request_irq(dev, irq, ls2x_i2c_irq_handler,
>> +			     IRQF_SHARED, "ls2x-i2c", priv);
>> +	if (r < 0)
>> +		return dev_err_probe(dev, r, "Unable to request irq %d\n", irq);
> You requested IRQ without filling all data structures. Is it fine? Have you
> checked that with CONFIG_DEBUG_SHIRQ being enabled?

Sorry, I don't quite understand what you mean by "without filling all 
data structures", I need call ls2x_i2c_reginit(priv) before it ?

I see that other i2c drivers request interrupts at about the same time 
as I do.

I tested it with CONFIG_DEBUG_SHIRQ and no exceptions were reported.


> ...
>
>> +	r = devm_i2c_add_adapter(dev, adap);
>> +	if (r)
>> +		return dev_err_probe(dev, r, "Failure adding adapter\n");
>> +
>> +	return 0;
>> +}
> Looking at the above...
>
>> +static int ls2x_i2c_remove(struct platform_device *pdev)
>> +{
>> +	struct ls2x_i2c_priv *priv = platform_get_drvdata(pdev);
>> +
>> +	i2c_del_adapter(&priv->adapter);
> ...are you sure this is correct?

When we use devm_i2c_add_adapter(), the adapter will be auto deleted on 
driver detach.

So I just drop the ls2x_i2c_remove() ?

>> +	return 0;
>> +}
> ...
>
>> +static int ls2x_i2c_suspend(struct device *dev)
>> +{
>> +	struct ls2x_i2c_priv *priv = dev_get_drvdata(dev);
>> +	priv->suspended = 1;
> No protection needed?

Actually this variable is not used elsewhere, maybe it is useless, I 
will try to remove it and add some necessary actions in the 
suspend/rusume callbacks, such as disable i2c interrupts, to ensure 
integrity.


>> +	return 0;
>> +}
>> +
>> +static int ls2x_i2c_resume(struct device *dev)
>> +{
>> +	struct ls2x_i2c_priv *priv = dev_get_drvdata(dev);
>> +	priv->suspended = 0;
> Ditto.
>
>> +	ls2x_i2c_reginit(priv);
>> +	return 0;
>> +}
> ...
>
>> +MODULE_ALIAS("platform:ls2x-i2c");
> Why is this required?

I just referred to other drivers before, and now the MODULE_DEVICE_TABLE 
already creates proper alias for platform driver.

I will drop it.

Thanks.

Binbin

