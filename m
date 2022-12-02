Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D31DE63FEBA
	for <lists+linux-i2c@lfdr.de>; Fri,  2 Dec 2022 04:22:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231475AbiLBDW1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Dec 2022 22:22:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230163AbiLBDWY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 1 Dec 2022 22:22:24 -0500
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9B07AD78E4;
        Thu,  1 Dec 2022 19:22:22 -0800 (PST)
Received: from loongson.cn (unknown [112.20.109.110])
        by gateway (Coremail) with SMTP id _____8Cx7+ttb4lj3rUCAA--.6515S3;
        Fri, 02 Dec 2022 11:22:21 +0800 (CST)
Received: from [0.0.0.0] (unknown [112.20.109.110])
        by localhost.localdomain (Coremail) with SMTP id AQAAf8Cxb+Jrb4ljcAwkAA--.23837S3;
        Fri, 02 Dec 2022 11:22:20 +0800 (CST)
Message-ID: <f0060385-644a-847e-48cf-865c12b96473@loongson.cn>
Date:   Fri, 2 Dec 2022 11:22:19 +0800
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
In-Reply-To: <Y4e/6KewuHjAluSZ@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cxb+Jrb4ljcAwkAA--.23837S3
X-CM-SenderInfo: p2kr3uplqex0o6or00hjvr0hdfq/
X-Coremail-Antispam: 1Uk129KBjvJXoWxJF43KrW7Xw4UJr48Jw1fWFg_yoWrtryDpF
        W8JFyrKryqqr10gw4kAr1DCFy2vrZ3Jw4jqa1rZ3WxZr1qkr1Ivr4Iqr1j9r48WFW8Jr48
        Ar4jyry5ur90qFJanT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
        qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
        bqxYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s
        1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xv
        wVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwA2z4
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

Hi Andy:

在 2022/12/1 04:41, Andy Shevchenko 写道:
> On Wed, Nov 30, 2022 at 01:56:20PM +0800, Binbin Zhou wrote:
>> This I2C module is integrated into the Loongson-2K SoCs and Loongson
>> LS7A bridge chip.
> Looks like some of my comments were not addressed. Are you sure
> you have read the previous reviews carefully?
>
> ...
>
>> +static int ls2x_i2c_xfer(struct i2c_adapter *adap,
>> +			struct i2c_msg *msgs, int num)
>> +{
>> +	int ret, retry;
>> +	struct ls2x_i2c_priv *priv = i2c_get_adapdata(adap);
>> +
>> +	for (retry = 0; retry < adap->retries; retry++) {
>> +		ret = ls2x_i2c_doxfer(adap, msgs, num);
>> +		if (ret != -EAGAIN)
>> +			return ret;
>> +
>> +		dev_dbg(priv->dev, "Retrying transmission (%d)\n", retry);
>> +		udelay(100);
> Why atomic? This long (esp. atomic) delay must be explained.

The modification records for this part of the source code are no longer 
traceable.

Communicating with colleagues offline, I learned that this part of the 
code first appeared on Linux 2.6.36, which was done to circumvent the 
problem of probable failure to scan the device for i2c devices on some 
boards.

How about I add a comment here to explain the reason for this?


>> +	}
>> +
>> +	return -EREMOTEIO;
>> +}
> ...
>
>> +static void ls2x_i2c_reginit(struct ls2x_i2c_priv *priv)
>> +{
>> +	u8 data;
>> +
>> +	/* Enable operations about frequency divider register */
>> +	data = readb(priv->base + I2C_LS2X_CTR);
>> +	writeb(data & ~0x80, priv->base + I2C_LS2X_CTR);
> Magic number.
>
>> +	ls2x_i2c_adjust_bus_speed(priv);
>> +
>> +	/* Set to normal I2C operating mode and enable interrupts */
>> +	data = readb(priv->base + I2C_LS2X_CTR);
>> +	writeb(data | 0xe0, priv->base + I2C_LS2X_CTR);
> Ditto.

OK.. I will use the macro to define the corresponding bit.

@@ -48,6 +48,11 @@
  #define LS2X_SR_TIP            BIT(1)
  #define LS2X_SR_IF             BIT(0)

+/* Control Register Bit */
+#define LS2X_CTR_EN             BIT(7) /* 0: Frequency setting operation */
+#define LS2X_CTR_IEN            BIT(6) /* Enable i2c interrupt */
+#define LS2X_CTR_MST            BIT(5) /* 0 = Slave 1 = Master */
+
  #define LS2X_I2C_MAX_RETRIES   5

  struct ls2x_i2c_priv {
@@ -266,13 +271,14 @@ static void ls2x_i2c_reginit(struct ls2x_i2c_priv 
*priv)

         /* Enable operations about frequency divider register */
         data = readb(priv->base + I2C_LS2X_CTR);
-       writeb(data & ~0x80, priv->base + I2C_LS2X_CTR);
+       writeb(data & ~LS2X_CTR_EN, priv->base + I2C_LS2X_CTR);

         ls2x_i2c_adjust_bus_speed(priv);

         /* Set to normal I2C operating mode and enable interrupts */
         data = readb(priv->base + I2C_LS2X_CTR);
-       writeb(data | 0xe0, priv->base + I2C_LS2X_CTR);
+       writeb(data | LS2X_CTR_EN | LS2X_CTR_IEN | LS2X_CTR_MST,
+                       priv->base + I2C_LS2X_CTR);


>> +}
> ...
>
>> +	r = devm_request_irq(dev, irq, ls2x_i2c_irq_handler,
>> +				IRQF_SHARED, "ls2x-i2c", priv);
> Indentation.

Do you mean  "IRQF_SHARE"  should be aligned to "dev"  ?


>> +	if (r < 0)
>> +		return dev_err_probe(dev, r, "Unable to request irq %d\n", irq);
> ...
>
>> +	adap->dev.of_node = pdev->dev.of_node;
> Why is this needed?
>
>> +	device_set_node(&adap->dev, dev_fwnode(dev));
> ...
>
>> +	/* i2c device drivers may be active on return from add_adapter() */
>> +	r = i2c_add_adapter(adap);
> Why not use devm_ variant of this?
>
>> +	if (r)
>> +		return dev_err_probe(dev, r, "Failure adding adapter\n");
> ...
>
>> +static int ls2x_i2c_suspend(struct device *dev)
>> +{
>> +	struct platform_device *pdev = to_platform_device(dev);
>> +	struct ls2x_i2c_priv *priv = platform_get_drvdata(pdev);
> Can't you use dev_get_drvdata() directly? Why?
>
>> +
>> +	priv->suspended = 1;
>> +
>> +	return 0;
>> +}
>> +
>> +static int ls2x_i2c_resume(struct device *dev)
>> +{
>> +	struct platform_device *pdev = to_platform_device(dev);
>> +	struct ls2x_i2c_priv *priv = platform_get_drvdata(pdev);
> Ditto.
>
>> +	priv->suspended = 0;
>> +	ls2x_i2c_reginit(priv);
>> +
>> +	return 0;
>> +}
> ...
>
>> +static const struct dev_pm_ops ls2x_i2c_pm_ops = {
>> +	SET_SYSTEM_SLEEP_PM_OPS(ls2x_i2c_suspend, ls2x_i2c_resume)
>> +};
> Use corresponding DEFINE_ macro.

ok.

I will use

"static DEFINE_SIMPLE_DEV_PM_OPS(ls2x_i2c_pm_ops, ls2x_i2c_suspend, 
ls2x_i2c_resume);"  corresponding to  ".pm     = pm_ptr(&ls2x_i2c_pm_ops),"


Thanks.

Binbin

