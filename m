Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2E04DDE1A
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Mar 2022 17:15:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236966AbiCRQQv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Mar 2022 12:16:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233685AbiCRQQu (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Mar 2022 12:16:50 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 367575A0B2
        for <linux-i2c@vger.kernel.org>; Fri, 18 Mar 2022 09:15:30 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id v130-20020a1cac88000000b00389d0a5c511so6895278wme.5
        for <linux-i2c@vger.kernel.org>; Fri, 18 Mar 2022 09:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Lcg0C4WbCSwnegOj3gPrFKrb+pmIXRsphWzUmjcgDh8=;
        b=Wc9AcVsXkGm4lGKwlgfXQKLPr4Os+R6ImCHiLJ1gY46QbedjO/UoPR/sRrLMsLpkw8
         n/w+za9LV7P0Q12ixcoqHoMR8VFoXEbG9Qc3QfbNvIJOqvzVXbBgqv2Lnuwo4S51XyKG
         bVfi+jXi7jz756e39+YZuEduXBePuhjotkpktPC1MPiKbt8acVYQczGGK2dOkmd9jNG+
         VLJKAEL5NBH+4gMOJKYvbFbPyp69pAPob3T80qGkrmiLmuWVjRXate3buxciX9E/I3tR
         PI3Hn2eLbfgsPgb8F29+dF9D3o5uEzVMpdTV0Yq1cu3oUoeaf6yyYLOVVkRdeEVgg2g3
         jfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Lcg0C4WbCSwnegOj3gPrFKrb+pmIXRsphWzUmjcgDh8=;
        b=cAsG9kiPbB6rKkgE8uk6z47GXRU5l0UW5d5QCr2xnCb5e6IzfC93YB56F1cLFB2mwp
         Kp9o5DiWXx5HBevz9AUOp2BjZpi3BacSE++P0+jyhYdbJ8pZefrRVE/EtTE5EQf8T5Kh
         UNh0OGaAkOvJ7Wp70OdAl2Jkf6Rt9G4wcSiax/0OZhESZFRRgmMVgmzrVTWIhDMv3HbU
         5WArAlvD3ZbSv54wzSnLWdGV9dxGgf1IBl8PkeEB6r4hPGgc7Q9o+T/Vf+TxUqqE/3pU
         5WgCqzYanvk0X2VhIC9z4RkEUAHxcQZmc/tCs0XqpDBjaeGHYLhxqF8wugSpYXQgswA1
         fIQw==
X-Gm-Message-State: AOAM533gui3XtJ42DcAQgIHikFpRm9RrMKNTFnY5dQMgc7s6nNFvS654
        30XnEJ+UcZV2oGWctAdcsFcMQA==
X-Google-Smtp-Source: ABdhPJyszN4FecLmImArKgfh8woC6r3j7LmWXu7CNyu2HKA9oRy8RbVgfMHzUyqDVBnmoRqDtgnC9w==
X-Received: by 2002:a1c:7719:0:b0:38b:7226:d366 with SMTP id t25-20020a1c7719000000b0038b7226d366mr15338501wmi.87.1647620128630;
        Fri, 18 Mar 2022 09:15:28 -0700 (PDT)
Received: from [192.168.2.222] ([109.76.4.19])
        by smtp.gmail.com with ESMTPSA id f7-20020a0560001a8700b00203c23e55e0sm6789191wry.78.2022.03.18.09.15.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Mar 2022 09:15:28 -0700 (PDT)
Message-ID: <e17e522f-75e9-a307-b56d-9ceb5b798c45@conchuod.ie>
Date:   Fri, 18 Mar 2022 16:15:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] i2c: add support for microchip fpga i2c controllers
Content-Language: en-US
To:     Ben Dooks <ben.dooks@codethink.co.uk>,
        Conor Dooley <conor.dooley@microchip.com>, wsa@kernel.org,
        linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        daire.mcnamara@microchip.com
References: <20220315153206.833291-1-conor.dooley@microchip.com>
 <cd90c33d-d4ea-de8a-9634-24d0cd394fe1@codethink.co.uk>
From:   Conor Dooley <mail@conchuod.ie>
In-Reply-To: <cd90c33d-d4ea-de8a-9634-24d0cd394fe1@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 18/03/2022 14:56, Ben Dooks wrote:
> On 15/03/2022 15:32, Conor Dooley wrote:
>> Add Microchip CoreI2C i2c controller support. This driver supports the
>> "hard" i2c controller on the Microchip PolarFire SoC & the basic feature
>> set for "soft" i2c controller implemtations in the FPGA fabric.
>>
>> Co-developed-by: Daire McNamara <daire.mcnamara@microchip.com>
>> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
>> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
>> ---
>>   drivers/i2c/busses/Kconfig              |  11 +
>>   drivers/i2c/busses/Makefile             |   1 +
>>   drivers/i2c/busses/i2c-microchip-core.c | 487 ++++++++++++++++++++++++
>>   3 files changed, 499 insertions(+)
>>   create mode 100644 drivers/i2c/busses/i2c-microchip-core.c
>>
>> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
>> index a1bae59208e3..3d4d8e0e9de7 100644
>> --- a/drivers/i2c/busses/Kconfig
>> +++ b/drivers/i2c/busses/Kconfig
>> @@ -781,6 +781,17 @@ config I2C_MESON
>>         If you say yes to this option, support will be included for the
>>         I2C interface on the Amlogic Meson family of SoCs.
> 
> snip
> 
>> +
>> +static void mchp_corei2c_core_disable(struct mchp_corei2c_dev *idev)
>> +{
>> +    u8 ctrl = readl(idev->base + CORE_I2C_CTRL);
>> +
>> +    ctrl &= ~CTRL_ENS1;
>> +    writel(ctrl, idev->base + CORE_I2C_CTRL);
>> +}
>> +
>> +static void mchp_corei2c_core_enable(struct mchp_corei2c_dev *idev)
>> +{
>> +    u8 ctrl = readl(idev->base + CORE_I2C_CTRL);
>> +
>> +    ctrl |= CTRL_ENS1;
>> +    writel(ctrl, idev->base + CORE_I2C_CTRL);
>> +}
> 
> Not sure why you would use readl/writel with an u8, surely an
> readb/writeb be better?

Sure, can try drop it to b.

> 
> 
>> +static irqreturn_t mchp_corei2c_handle_isr(struct mchp_corei2c_dev 
>> *idev)
>> +{
>> +    u32 status = idev->isr_status;
>> +    u8 ctrl;
>> +
>> +    if (!idev->buf) {
>> +        dev_warn(idev->dev, "unexpected interrupt\n");
>> +        return IRQ_HANDLED;
>> +    }
> 
> is IRQ_HANDLED correct here?

Hmm, the dev_warn is probably incorrect too. For the mpfs, the interrupt 
line isn't shared, but the generic fabric core could be. Ill change this.

> 
>> +
>> +static int mchp_corei2c_probe(struct platform_device *pdev)
>> +{
>> +    struct mchp_corei2c_dev *idev = NULL;
>> +    struct resource *res;
>> +    int irq, ret;
>> +    u32 val;
>> +
>> +    idev = devm_kzalloc(&pdev->dev, sizeof(*idev), GFP_KERNEL);
>> +    if (!idev)
>> +        return -ENOMEM;
>> +
>> +    idev->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>> +    if (IS_ERR(idev->base))
>> +        return PTR_ERR(idev->base);
>> +
>> +    irq = platform_get_irq(pdev, 0);
>> +    if (irq < 0)
>> +        return dev_err_probe(&pdev->dev, irq,
>> +                     "missing interrupt resource\n");
>> +
>> +    idev->i2c_clk = devm_clk_get(&pdev->dev, NULL);
>> +    if (IS_ERR(idev->i2c_clk))
>> +        return dev_err_probe(&pdev->dev, PTR_ERR(idev->i2c_clk),
>> +                     "missing clock\n");
>> +
>> +    idev->dev = &pdev->dev;
>> +    init_completion(&idev->msg_complete);
>> +    spin_lock_init(&idev->lock);
>> +
>> +    val = device_property_read_u32(idev->dev, "clock-frequency",
>> +                       &idev->bus_clk_rate);
>> +    if (val) {
>> +        dev_info(&pdev->dev, "default to 100kHz\n");
>> +        idev->bus_clk_rate = 100000;
>> +    }
>> +
>> +    if (idev->bus_clk_rate > 400000)
>> +        return dev_err_probe(&pdev->dev, -EINVAL,
>> +                     "clock-frequency too high: %d\n",
>> +                     idev->bus_clk_rate);
>> +
>> +    ret = devm_request_irq(&pdev->dev, irq, mchp_corei2c_isr, 
>> IRQF_SHARED,
>> +                   pdev->name, idev);
>> +    if (ret)
>> +        return dev_err_probe(&pdev->dev, ret,
>> +                     "failed to claim irq %d\n", irq);
>> +
>> +    ret = clk_prepare_enable(idev->i2c_clk);
>> +    if (ret)
>> +        return dev_err_probe(&pdev->dev, ret,
>> +                     "failed to enable clock\n");
>> +
>> +    ret = mchp_corei2c_init(idev);
>> +    if (ret)
>> +        return dev_err_probe(&pdev->dev, ret,
>> +                     "failed to program clock divider\n");
> 
> going to leak a prepared clock from here on?

Aye, good spot. Thanks.

>> +    i2c_set_adapdata(&idev->adapter, idev);
>> +    snprintf(idev->adapter.name, sizeof(idev->adapter.name),
>> +         "Microchip I2C hw bus");
>> +    idev->adapter.owner = THIS_MODULE;
>> +    idev->adapter.algo = &mchp_corei2c_algo;
>> +    idev->adapter.dev.parent = &pdev->dev;
>> +    idev->adapter.dev.of_node = pdev->dev.of_node;
>> +
>> +    platform_set_drvdata(pdev, idev);
>> +
>> +    ret = i2c_add_adapter(&idev->adapter);
>> +    if (ret) {
>> +        clk_disable_unprepare(idev->i2c_clk);
>> +        return ret;
>> +    }
>> +
>> +    dev_info(&pdev->dev, "Microchip I2C Probe Complete\n");
> 
> not sure if necessary, doesn't the i2c core also announce?

The only thing I see on boot is this, but I'll take a look and see if I 
can do this via the core.

> 
>> +    return 0;
>> +}
>> +
>> +static int mchp_corei2c_remove(struct platform_device *pdev)
>> +{
>> +    struct mchp_corei2c_dev *idev = platform_get_drvdata(pdev);
>> +
>> +    clk_disable_unprepare(idev->i2c_clk);
>> +    i2c_del_adapter(&idev->adapter);
>> +
>> +    return 0;
>> +}
>> +
>> +static const struct of_device_id mchp_corei2c_of_match[] = {
>> +    { .compatible = "microchip,mpfs-i2c" },
>> +    { .compatible = "microchip,corei2c-rtl-v7" },
>> +    {},
>> +};
>> +MODULE_DEVICE_TABLE(of, mchp_corei2c_of_match);
>> +
>> +static struct platform_driver mchp_corei2c_driver = {
>> +    .probe = mchp_corei2c_probe,
>> +    .remove = mchp_corei2c_remove,
>> +    .driver = {
>> +        .name = "microchip-corei2c",
>> +        .of_match_table = mchp_corei2c_of_match,
>> +    },
>> +};
>> +
>> +module_platform_driver(mchp_corei2c_driver);
>> +
>> +MODULE_DESCRIPTION("Microchip CoreI2C bus driver");
>> +MODULE_AUTHOR("Daire McNamara <daire.mcnamara@microchip.com>");
>> +MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
>> +MODULE_LICENSE("GPL v2");
> 
> 
