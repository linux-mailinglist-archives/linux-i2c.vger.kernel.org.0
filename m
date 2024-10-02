Return-Path: <linux-i2c+bounces-7175-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE11398D138
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 12:29:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DAE81C21BBD
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Oct 2024 10:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15DBD1E6DC3;
	Wed,  2 Oct 2024 10:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="yB1oAT7E";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MhIpu/ca"
X-Original-To: linux-i2c@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253B12564;
	Wed,  2 Oct 2024 10:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727864982; cv=none; b=Pj3ZfSNidnOnzPbrop6/8BXktwNlIEmFYysOAifcS2d0gQJwkW5huKbrt6/x/jiD2szQ+mI2Jctqoy77f4z7GrskA/1qWneXpdSmtFET5Jxcq6cgsCNtsysuc94CyMEE42V7LXb0GQkjoPrYBPx8vY4opPuDaN3W/8N1ZnhKzPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727864982; c=relaxed/simple;
	bh=LDK9u0Rh2qGiHVfadHoNtSjm2vY0JJcNEyZQH38Ru+k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DM00VS+VeXdL+ChT61T9bKtO6/jgDqFBl5n5fDYSrx4N2gcDiso6Z7KmYGXDn4puqy5Rjpylbt3jO6i1SrpkVqaTCuNBAIEGkXCS3zXJHrEr/upegOB81Fwyi+bF0sqkbmQUfG0nWFuU8EdvqSsfRm8ViFIYBLDyqf7TDgTQQ6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=yB1oAT7E; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MhIpu/ca; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1727864979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6PJVrnVEM5cfMb5vScxdTKMt9fhDfO9Z+hAavmEhwIU=;
	b=yB1oAT7E1XlN630uOzFK88nJIYEI99pPkqNC7MzylFVOj1IHHLL4wQdAvyaZyP4PagTpOx
	bxnuVy3hPxeaRunRUQWRz7PLnx8jC0XM/QBipRCtwDXt5yk/GnTnLgawl6+Jpj357eInF4
	feHK1LkX8aAxPoSFSnq6FIiAbwkHqopcOJoxhHy670GOTPC6bBLMxPFLRA0TkjO6QuHrgM
	dnySzEfNcKCD4u6/Ie7tYBxX+e2CISpmNjazTC0R1oQIBq9Ylik81p5JcGwgXjOL58GSxN
	55PJEsrPb5JN7Vz1JoYqp0HGychuDbfIpdbgbOUe0N70jPiGXLaRsgrf6hFtoQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1727864979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6PJVrnVEM5cfMb5vScxdTKMt9fhDfO9Z+hAavmEhwIU=;
	b=MhIpu/cax/LLZ8lM46QyQvLchwXnRKNKa5cv+msYl2uLTyj87E3kBnHwolI8nutZOK39SI
	uCKJQkyTfUQG9jCQ==
To: Arturs Artamonovs via B4 Relay
 <devnull+arturs.artamonovs.analog.com@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Greg Malysa
 <greg.malysa@timesys.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Utsav Agarwal <Utsav.Agarwal@analog.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>, Andi Shyti <andi.shyti@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
 <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson
 <olof@lixom.net>, soc@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, Arturs Artamonovs
 <arturs.artamonovs@analog.com>, adsp-linux@analog.com, Arturs Artamonovs
 <Arturs.Artamonovs@analog.com>, Nathan Barrett-Morrison
 <nathan.morrison@timesys.com>
Subject: Re: [PATCH 11/21] irqchip: Add irqchip for ADI ADSP-SC5xx platform
In-Reply-To: <20240912-test-v1-11-458fa57c8ccf@analog.com>
References: <20240912-test-v1-0-458fa57c8ccf@analog.com>
 <20240912-test-v1-11-458fa57c8ccf@analog.com>
Date: Wed, 02 Oct 2024 12:29:38 +0200
Message-ID: <87ed4yyezx.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Sep 12 2024 at 19:24, Arturs Artamonovs via wrote:
> From: Arturs Artamonovs <arturs.artamonovs@analog.com>
>
> Support seting extra indepdendent interrupt on pin activity.

So the subject says it adds a new interrupt chip. Now the changelog
mumbles about support of something extra.

Please describe your changes properly and explain what this is
about. Also spell check your change log.

> +struct adsp_pint {
> +	struct irq_chip chip;
> +	void __iomem *regs;
> +	struct irq_domain *domain;
> +	unsigned int irq;

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#struct-declarations-and-initializers

And please read and follow the rest of that document too.

> + * This relies on the default configuration of the hardware, which we do not
> + * expose an interface to change.
> + */
> +int adsp_attach_pint_to_gpio(struct adsp_gpio_port *port)

Where is this function declared and where is it used?

> +static void adsp_pint_dispatch_irq(struct irq_desc *desc)
> +{
> +	struct irq_chip *chip = irq_desc_get_chip(desc);
> +	struct adsp_pint *pint = to_adsp_pint(chip);
> +	unsigned int type = irqd_get_trigger_type(&desc->irq_data);
> +	u32 pos = BIT(desc->irq_data.hwirq);
> +
> +	/* for both edge interrupt, toggle invert bit to catch next edge */
> +	if (type == IRQ_TYPE_EDGE_BOTH) {
> +		u32 invert = readl(pint->regs + ADSP_PINT_REG_INVERT_SET) & pos;
> +
> +		if (invert)
> +			writel(pos, pint->regs + ADSP_PINT_REG_INVERT_CLEAR);
> +		else
> +			writel(pos, pint->regs + ADSP_PINT_REG_INVERT_SET);

What protects pint->regs against concurrent modifications?

> +static void adsp_pint_irq_mask(struct irq_data *d)
> +{
> +	struct adsp_pint *pint = irq_data_get_irq_chip_data(d);
> +
> +	writel(BIT(d->hwirq), pint->regs + ADSP_PINT_REG_MASK_CLEAR);

Same question.

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

This should have been determined before posting, no?

> +	pint->domain = irq_domain_add_linear(np, ADSP_PINT_IRQS,
> +		&adsp_irq_domain_ops, pint);

devm_irq_domain_instantiate()

> +	if (!pint->domain) {
> +		dev_err(dev, "Could not create irq domain\n");
> +		return -EINVAL;
> +	}
> +
> +	pint->irq = platform_get_irq(pdev, 0);
> +	if (!pint->irq) {
> +		dev_err(dev, "Could not find parent interrupt for port\n");
> +		return -EINVAL;

Then this would not leak the interrupt domain. Also why is this not
checked _before_ instantiating the domain?

> +static int __init adsp_pint_init(void)
> +{
> +	return platform_driver_register(&adsp_pint_driver);
> +}
> +

Pointless new line

> +arch_initcall(adsp_pint_init);
> +
> +MODULE_DESCRIPTION("Analog Devices IRQChip driver");
> +MODULE_LICENSE("GPL v2");
> +MODULE_AUTHOR("Greg Malysa <greg.malysa@timesys.com>");
> \ No newline at end of file

This message has a meaning, no?

Thanks,

        tglx

