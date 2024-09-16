Return-Path: <linux-i2c+bounces-6768-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B942979B9D
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 08:56:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E578D1F22C5D
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 06:56:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D365913698E;
	Mon, 16 Sep 2024 06:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxR6B8+j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E667FBD1;
	Mon, 16 Sep 2024 06:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726469789; cv=none; b=elJb3oczVJr4iN0RCBjbKxkt8BW0puV4H/dpLaNuP3F/a1Hhpe4eZ5S9k0rVGkAQjae8niiDkKWX3WVq+tRd/6cGPSNRHmAc0WBWmKjSrJK7W/Bj8t77ezr7o56O+QKl3y/vVzYyIQgD0fHnCjJLUswv85WiWmgKumLyoGN7QlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726469789; c=relaxed/simple;
	bh=HeAhPvole8DH/+pRo29sxxCAqnQMXtgQNZIdjJ/TvvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m87AjoR+Ng3wlBTldZY52GHFOpvMd8OOg6IpvYjhqaLMVvnlyDf/wMjYfR2D7e7s9Vi/dZzci25hDvfd0WTYc/WIBQ4OcwI3KQMsQ6/bC+1QsvNFIQFDrYZcPssVy06TcHBZtoAj1GcVv4/P+y/B0U4TnxhPMPZLdiaZBUP2SVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxR6B8+j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7D87C4CEC4;
	Mon, 16 Sep 2024 06:56:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726469789;
	bh=HeAhPvole8DH/+pRo29sxxCAqnQMXtgQNZIdjJ/TvvA=;
	h=Date:Subject:List-Id:To:Cc:References:From:In-Reply-To:From;
	b=hxR6B8+jUPxwStGXSyGkvnGg1ubsZW8anAXEhjA9kiuR8qJtrJ0FjmkAWX78Yhdq/
	 DaHXSzvkJgenqftZwF+CqfdviMuEVvjNS0zWGeMoqnJGr4XoUII31jApiin40x9W6/
	 XGKoGYoTzazfWUgrjNWJp0oDyYa3p0OSfp582hHsytkbCPrOFtgzOivj2nsXNUFzTR
	 jeN22e5h+lldOg1AHEEjNcaQW57mCyrX/ZCbBgAIFIIv2NYAgxMOOTncIn+L/oVabU
	 YBIIjqJ2qZVbGZKONU3NI1aMYE7HLDtq8i5fHvIEmRrzaReCTThBb3pMMoMmJVTeq9
	 8SrbW5PYOZg9A==
Message-ID: <26b53051-0502-41dd-99f4-6d2cf2eb9920@kernel.org>
Date: Mon, 16 Sep 2024 08:56:15 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/21] irqchip: Add irqchip for ADI ADSP-SC5xx platform
To: arturs.artamonovs@analog.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Greg Malysa <greg.malysa@timesys.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Utsav Agarwal <Utsav.Agarwal@analog.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>,
 Andi Shyti <andi.shyti@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Olof Johansson <olof@lixom.net>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, adsp-linux@analog.com,
 Nathan Barrett-Morrison <nathan.morrison@timesys.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
 <20240912-test-v1-11-458fa57c8ccf@analog.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240912-test-v1-11-458fa57c8ccf@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/09/2024 20:24, Arturs Artamonovs via B4 Relay wrote:
> From: Arturs Artamonovs <arturs.artamonovs@analog.com>
> 
> Support seting extra indepdendent interrupt on pin activity.
> 
> Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
> Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
> Signed-off-by: Greg Malysa <greg.malysa@timesys.com>
> ---
>  drivers/irqchip/Kconfig        |   9 ++
>  drivers/irqchip/Makefile       |   2 +
>  drivers/irqchip/irq-adi-adsp.c | 310 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 321 insertions(+)
> 
> diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
> index d078bdc48c38f13af9a129974f3b637dfee0e40f..1bc8f1bd45b3d2f69d2d0e6c8fa01b17b12ce241 100644
> --- a/drivers/irqchip/Kconfig
> +++ b/drivers/irqchip/Kconfig
> @@ -91,6 +91,15 @@ config ALPINE_MSI
>  	select PCI_MSI
>  	select GENERIC_IRQ_CHIP
>  
> +config ADI_ADSP_IRQ
> +	bool "ADI PORT PINT Driver"

What is "PORT"?
What is "PINT"?
> +	depends on OF
> +	depends on (ARCH_SC59X_64 || ARCH_SC59X)

Missing compile test.

> +	select IRQ_DOMAIN
> +	help
> +	  Say Y to enable the PORT-based PINT interrupt controller for

Expand acronyms here.

> +	  Analog Devices ADSP devices.
> +
>  config AL_FIC
>  	bool "Amazon's Annapurna Labs Fabric Interrupt Controller"
>  	depends on OF
> diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
> index 15635812b2d6605a2dd3bb0e5fb3170ab2cb0f77..258a188676fd97e713f3cebe16e3d563add095f3 100644
> --- a/drivers/irqchip/Makefile
> +++ b/drivers/irqchip/Makefile
> @@ -1,6 +1,8 @@
>  # SPDX-License-Identifier: GPL-2.0
>  obj-$(CONFIG_IRQCHIP)			+= irqchip.o
>  
> +

Why?

> +obj-$(CONFIG_ADI_ADSP_IRQ)		+= irq-adi-adsp.o
>  obj-$(CONFIG_AL_FIC)			+= irq-al-fic.o
>  obj-$(CONFIG_ALPINE_MSI)		+= irq-alpine-msi.o

...


> +
> +static int adsp_pint_irq_set_type(struct irq_data *d, unsigned int type)
> +{
> +	struct adsp_pint *pint = irq_data_get_irq_chip_data(d);
> +	unsigned int pos = BIT(d->hwirq);
> +
> +	switch (type) {
> +	case IRQ_TYPE_PROBE:
> +		type = IRQ_TYPE_EDGE_BOTH;
> +		fallthrough;
> +	case IRQ_TYPE_EDGE_BOTH:
> +		/* start by looking for rising edge */
> +		writel(pos, pint->regs + ADSP_PINT_REG_INVERT_CLEAR);
> +		writel(pos, pint->regs + ADSP_PINT_REG_EDGE_SET);
> +		return 0;
> +
> +	case IRQ_TYPE_EDGE_FALLING:
> +		writel(pos, pint->regs + ADSP_PINT_REG_INVERT_SET);
> +		writel(pos, pint->regs + ADSP_PINT_REG_EDGE_SET);
> +		return 0;
> +
> +	case IRQ_TYPE_EDGE_RISING:
> +		writel(pos, pint->regs + ADSP_PINT_REG_INVERT_CLEAR);
> +		writel(pos, pint->regs + ADSP_PINT_REG_EDGE_SET);
> +		return 0;
> +
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		writel(pos, pint->regs + ADSP_PINT_REG_INVERT_CLEAR);
> +		writel(pos, pint->regs + ADSP_PINT_REG_EDGE_CLEAR);
> +		return 0;
> +
> +	case IRQ_TYPE_LEVEL_LOW:
> +		writel(pos, pint->regs + ADSP_PINT_REG_INVERT_SET);
> +		writel(pos, pint->regs + ADSP_PINT_REG_EDGE_CLEAR);
> +		return 0;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +

Fix blank line issues everywhere.

> +}
> +
> +static int adsp_pint_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct adsp_pint *pint;
> +
> +	pint = devm_kzalloc(dev, sizeof(*pint), GFP_KERNEL);
> +	if (!pint)
> +		return -ENOMEM;
> +
> +	pint->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(pint->regs))
> +		return PTR_ERR(pint->regs);
> +
> +	pint->chip.name = "adsp-pint";
> +	pint->chip.irq_ack = adsp_pint_irq_ack;
> +	pint->chip.irq_mask = adsp_pint_irq_mask;
> +	pint->chip.irq_unmask = adsp_pint_irq_unmask;
> +	pint->chip.irq_set_type = adsp_pint_irq_set_type;
> +	// @todo potentially only SEC supports wake options, not gic
> +
> +	// @todo determine if we actually need a raw spinlock
> +
> +	pint->domain = irq_domain_add_linear(np, ADSP_PINT_IRQS,
> +		&adsp_irq_domain_ops, pint);
> +	if (!pint->domain) {
> +		dev_err(dev, "Could not create irq domain\n");
> +		return -EINVAL;
> +	}
> +
> +	pint->irq = platform_get_irq(pdev, 0);
> +	if (!pint->irq) {

That's a bug, technically. Read the doc. Why -EINVAL is a valid interrupt?

> +		dev_err(dev, "Could not find parent interrupt for port\n");
> +		return -EINVAL;
> +	}
> +
> +	irq_set_chained_handler_and_data(pint->irq, adsp_pint_irq_handler, pint);
> +	platform_set_drvdata(pdev, pint);
> +
> +	return 0;
> +}
> +
> +static void adsp_pint_remove(struct platform_device *pdev)
> +{
> +	struct adsp_pint *pint = platform_get_drvdata(pdev);
> +
> +	irq_set_chained_handler_and_data(pint->irq, NULL, NULL);
> +	irq_domain_remove(pint->domain);
> +}
> +
> +static const struct of_device_id adsp_pint_of_match[] = {
> +	{ .compatible = "adi,adsp-pint" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, adsp_pint_of_match);
> +
> +static struct platform_driver adsp_pint_driver = {
> +	.driver = {
> +		.name = "adsp-port-pint",

Bindings are always before the users.

Best regards,
Krzysztof


