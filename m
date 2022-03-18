Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 578E04DDC4A
	for <lists+linux-i2c@lfdr.de>; Fri, 18 Mar 2022 15:57:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237267AbiCRO6t (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 18 Mar 2022 10:58:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237758AbiCRO6B (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 18 Mar 2022 10:58:01 -0400
Received: from imap2.colo.codethink.co.uk (imap2.colo.codethink.co.uk [78.40.148.184])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A5FE111DE9;
        Fri, 18 Mar 2022 07:56:42 -0700 (PDT)
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net ([86.15.83.122] helo=[192.168.0.21])
        by imap2.colo.codethink.co.uk with esmtpsa  (Exim 4.92 #3 (Debian))
        id 1nVE1r-0000kv-ND; Fri, 18 Mar 2022 14:56:35 +0000
Message-ID: <cd90c33d-d4ea-de8a-9634-24d0cd394fe1@codethink.co.uk>
Date:   Fri, 18 Mar 2022 14:56:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] i2c: add support for microchip fpga i2c controllers
Content-Language: en-GB
To:     Conor Dooley <conor.dooley@microchip.com>, wsa@kernel.org,
        linux-i2c@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        daire.mcnamara@microchip.com
References: <20220315153206.833291-1-conor.dooley@microchip.com>
From:   Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20220315153206.833291-1-conor.dooley@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 15/03/2022 15:32, Conor Dooley wrote:
> Add Microchip CoreI2C i2c controller support. This driver supports the
> "hard" i2c controller on the Microchip PolarFire SoC & the basic feature
> set for "soft" i2c controller implemtations in the FPGA fabric.
> 
> Co-developed-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>   drivers/i2c/busses/Kconfig              |  11 +
>   drivers/i2c/busses/Makefile             |   1 +
>   drivers/i2c/busses/i2c-microchip-core.c | 487 ++++++++++++++++++++++++
>   3 files changed, 499 insertions(+)
>   create mode 100644 drivers/i2c/busses/i2c-microchip-core.c
> 
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index a1bae59208e3..3d4d8e0e9de7 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -781,6 +781,17 @@ config I2C_MESON
>   	  If you say yes to this option, support will be included for the
>   	  I2C interface on the Amlogic Meson family of SoCs.
>   

snip

> +
> +static void mchp_corei2c_core_disable(struct mchp_corei2c_dev *idev)
> +{
> +	u8 ctrl = readl(idev->base + CORE_I2C_CTRL);
> +
> +	ctrl &= ~CTRL_ENS1;
> +	writel(ctrl, idev->base + CORE_I2C_CTRL);
> +}
> +
> +static void mchp_corei2c_core_enable(struct mchp_corei2c_dev *idev)
> +{
> +	u8 ctrl = readl(idev->base + CORE_I2C_CTRL);
> +
> +	ctrl |= CTRL_ENS1;
> +	writel(ctrl, idev->base + CORE_I2C_CTRL);
> +}

Not sure why you would use readl/writel with an u8, surely an
readb/writeb be better?


> +static irqreturn_t mchp_corei2c_handle_isr(struct mchp_corei2c_dev *idev)
> +{
> +	u32 status = idev->isr_status;
> +	u8 ctrl;
> +
> +	if (!idev->buf) {
> +		dev_warn(idev->dev, "unexpected interrupt\n");
> +		return IRQ_HANDLED;
> +	}

is IRQ_HANDLED correct here?

> +
> +static int mchp_corei2c_probe(struct platform_device *pdev)
> +{
> +	struct mchp_corei2c_dev *idev = NULL;
> +	struct resource *res;
> +	int irq, ret;
> +	u32 val;
> +
> +	idev = devm_kzalloc(&pdev->dev, sizeof(*idev), GFP_KERNEL);
> +	if (!idev)
> +		return -ENOMEM;
> +
> +	idev->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(idev->base))
> +		return PTR_ERR(idev->base);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return dev_err_probe(&pdev->dev, irq,
> +				     "missing interrupt resource\n");
> +
> +	idev->i2c_clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(idev->i2c_clk))
> +		return dev_err_probe(&pdev->dev, PTR_ERR(idev->i2c_clk),
> +				     "missing clock\n");
> +
> +	idev->dev = &pdev->dev;
> +	init_completion(&idev->msg_complete);
> +	spin_lock_init(&idev->lock);
> +
> +	val = device_property_read_u32(idev->dev, "clock-frequency",
> +				       &idev->bus_clk_rate);
> +	if (val) {
> +		dev_info(&pdev->dev, "default to 100kHz\n");
> +		idev->bus_clk_rate = 100000;
> +	}
> +
> +	if (idev->bus_clk_rate > 400000)
> +		return dev_err_probe(&pdev->dev, -EINVAL,
> +				     "clock-frequency too high: %d\n",
> +				     idev->bus_clk_rate);
> +
> +	ret = devm_request_irq(&pdev->dev, irq, mchp_corei2c_isr, IRQF_SHARED,
> +			       pdev->name, idev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to claim irq %d\n", irq);
> +
> +	ret = clk_prepare_enable(idev->i2c_clk);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to enable clock\n");
> +
> +	ret = mchp_corei2c_init(idev);
> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret,
> +				     "failed to program clock divider\n");

going to leak a prepared clock from here on?

> +	i2c_set_adapdata(&idev->adapter, idev);
> +	snprintf(idev->adapter.name, sizeof(idev->adapter.name),
> +		 "Microchip I2C hw bus");
> +	idev->adapter.owner = THIS_MODULE;
> +	idev->adapter.algo = &mchp_corei2c_algo;
> +	idev->adapter.dev.parent = &pdev->dev;
> +	idev->adapter.dev.of_node = pdev->dev.of_node;
> +
> +	platform_set_drvdata(pdev, idev);
> +
> +	ret = i2c_add_adapter(&idev->adapter);
> +	if (ret) {
> +		clk_disable_unprepare(idev->i2c_clk);
> +		return ret;
> +	}
> +
> +	dev_info(&pdev->dev, "Microchip I2C Probe Complete\n");

not sure if necessary, doesn't the i2c core also announce?

> +	return 0;
> +}
> +
> +static int mchp_corei2c_remove(struct platform_device *pdev)
> +{
> +	struct mchp_corei2c_dev *idev = platform_get_drvdata(pdev);
> +
> +	clk_disable_unprepare(idev->i2c_clk);
> +	i2c_del_adapter(&idev->adapter);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id mchp_corei2c_of_match[] = {
> +	{ .compatible = "microchip,mpfs-i2c" },
> +	{ .compatible = "microchip,corei2c-rtl-v7" },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mchp_corei2c_of_match);
> +
> +static struct platform_driver mchp_corei2c_driver = {
> +	.probe = mchp_corei2c_probe,
> +	.remove = mchp_corei2c_remove,
> +	.driver = {
> +		.name = "microchip-corei2c",
> +		.of_match_table = mchp_corei2c_of_match,
> +	},
> +};
> +
> +module_platform_driver(mchp_corei2c_driver);
> +
> +MODULE_DESCRIPTION("Microchip CoreI2C bus driver");
> +MODULE_AUTHOR("Daire McNamara <daire.mcnamara@microchip.com>");
> +MODULE_AUTHOR("Conor Dooley <conor.dooley@microchip.com>");
> +MODULE_LICENSE("GPL v2");


-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html
