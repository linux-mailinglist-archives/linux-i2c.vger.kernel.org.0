Return-Path: <linux-i2c+bounces-6760-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C271979B46
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 08:43:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F38C52827C6
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 06:43:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306D76F2F8;
	Mon, 16 Sep 2024 06:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jBcQuqoW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C80242D047;
	Mon, 16 Sep 2024 06:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726468981; cv=none; b=GdYBJ/w51HHTP9cQobmP1KLPEZ7ZiF06yqczaM3YY7+FwtYo2mKURWSTfEomRHS/bjYgHL1WKhFqsZSE852bVixgVlkgzw6hGpnLPjRMqeAzM+47p0yH6r+QLX2TkB+Z5Dket9m/259S8TEn2UKCiFagUoBBhyTI6qSeNYh4zHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726468981; c=relaxed/simple;
	bh=OmX5pnqSk5xn2FT2uV4tUDS/NR4GnT2nDAGOL0sZ8bY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Eoou6nfCmBve8PYaLUh5AUjEj1KNB8BvbSWQgqFL4J8yhOtG5DsxZP8JtyPUxQL125liCKW1P7HSzlsoW0+w5h/YbcXDGoecDJxP8X02rC97APApT/rbljCiiBojU/g4dWo4RQIvPRY7D8887INP5YCa5VahiUvdXFXhlIuq8AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jBcQuqoW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE381C4CEC4;
	Mon, 16 Sep 2024 06:42:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726468980;
	bh=OmX5pnqSk5xn2FT2uV4tUDS/NR4GnT2nDAGOL0sZ8bY=;
	h=Date:Subject:List-Id:To:Cc:References:From:In-Reply-To:From;
	b=jBcQuqoWELc8wRQZshhci3qJkHS7gcocJ0ATNHNHO5wj6NPYAFLKB6//JGETQU0bf
	 jE+IinGeDCnMue9SCTH2k+KUVrEWfQbXfkKQRW/caR7joCrlflivBcEgT1pueoHoxF
	 Ka7w79CAZbA12P53jP9y9gEjTAlPrbJxowcPM6UaAlkxwfBCOYZS02fqfTHLKOvafI
	 2PCRvCeR41mwdA+DYl3W7eYVJSSXQ4CD2N1qnWs0S8Pbqu5dhUzkTFUgiFx1HgIIJc
	 KCR5wS9eieen/87mzXpFBVXVBPpvEH8ZGSVJRq+r2sHkz47fQ5/Bt21c7xfBBi0SAZ
	 lCHFhM72MpCUw==
Message-ID: <3815d07a-ae29-404f-a624-4b18c84aa02e@kernel.org>
Date: Mon, 16 Sep 2024 08:42:50 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/21] arm64: Add ADI ADSP-SC598 SoC
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
 <20240912-test-v1-1-458fa57c8ccf@analog.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240912-test-v1-1-458fa57c8ccf@analog.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/09/2024 20:24, Arturs Artamonovs via B4 Relay wrote:
> From: Arturs Artamonovs <arturs.artamonovs@analog.com>
> 
> Add ADSP-SC598 platform.
> 
> Signed-off-by: Arturs Artamonovs <Arturs.Artamonovs@analog.com>
> Co-developed-by: Utsav Agarwal <Utsav.Agarwal@analog.com>
> Signed-off-by: Utsav Agarwal <Utsav.Agarwal@analog.com>
> Co-developed-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> Signed-off-by: Nathan Barrett-Morrison <nathan.morrison@timesys.com>
> Co-developed-by: Greg Malysa <greg.malysa@timesys.com>
> Signed-off-by: Greg Malysa <greg.malysa@timesys.com>
> ---
>  arch/arm64/Kconfig.platforms           |  13 ++
>  drivers/soc/Makefile                   |   1 +
>  drivers/soc/adi/Makefile               |   5 +
>  drivers/soc/adi/system.c               | 257 +++++++++++++++++++++++++++++++++
>  include/linux/soc/adi/adsp-gpio-port.h |  85 +++++++++++
>  include/linux/soc/adi/cpu.h            | 107 ++++++++++++++
>  include/linux/soc/adi/rcu.h            |  55 +++++++
>  include/linux/soc/adi/sc59x.h          | 147 +++++++++++++++++++
>  include/linux/soc/adi/system_config.h  |  65 +++++++++
>  9 files changed, 735 insertions(+)
> 
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 6c6d11536b42ec6e878db8d355c17994c2500d7b..b9ea22ecddfcbff98486a314143e52934f26df44 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -292,6 +292,19 @@ config ARCH_ROCKCHIP
>  	  This enables support for the ARMv8 based Rockchip chipsets,
>  	  like the RK3368.
>  
> +config ARCH_SC59X_64
> +	bool "ADI 64-bit SC59X Platforms"
> +	select TIMER_OF
> +	select GPIOLIB
> +	select PINCTRL
> +	select COMMON_CLK_ADI_SC598
> +	select PINCTRL_ADSP
> +	select ADI_ADSP_IRQ
> +	select COUNTER
> +	help
> +		This enables support for Analog Devices Incorporated's
> +		Family of ARM64 DSP processors

Messed indentation.

> +


> +
> +static int regmap_system_write(void *context, unsigned int reg,
> +		unsigned int val)
> +{
> +	struct adi_system_context *ctx = context;
> +	struct adi_system_register *sreg = radix_tree_lookup(&ctx->tree, reg);
> +
> +	if (!sreg)
> +		return -EIO;
> +
> +	if (sreg->is_bits) {
> +		return regmap_update_bits(ctx->regmap, sreg->offset,
> +				sreg->mask,
> +			(val << sreg->shift) & sreg->mask);
> +	}
> +
> +	return regmap_write(ctx->regmap, sreg->offset, val);
> +}
> +
> +static struct adi_system_context *create_context
> +(struct adi_system_config *config)

That's wrong wrapping. Wrapping happens after return type in such cases.

> +{
> +	struct regmap *regmap = config->mmio_regmap;
> +	struct adi_system_context *ctx;
> +	size_t i;
> +	int ret;
> +
> +	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ctx->regmap = regmap;
> +	INIT_RADIX_TREE(&ctx->tree, GFP_KERNEL);
> +
> +	for (i = 0; i < config->len; ++i) {
> +		struct adi_system_register *sreg = &config->registers[i];
> +
> +		ret = radix_tree_insert(&ctx->tree, sreg->id, sreg);
> +		if (ret)
> +			return ERR_PTR(ret);
> +	}
> +
> +	config->config.max_register = config->max_register;
> +	config->config.reg_bits = 8 * sizeof(uint32_t);
> +	config->config.val_bits = 8 * sizeof(uint32_t);
> +	config->config.reg_stride = 1;
> +
> +	return ctx;
> +}
> +
> +static void regmap_system_free_context(void *context)
> +{
> +	struct adi_system_context *ctx = context;
> +	unsigned int i;
> +
> +	for (i = 0; i < ctx->config->len; ++i)
> +		radix_tree_delete(&ctx->tree,
> +				ctx->config->registers[i].id);
> +
> +	kfree(ctx);
> +}
> +
> +static const struct regmap_bus regmap_system_bus = {
> +	.fast_io = true,
> +	.reg_write = regmap_system_write,
> +	.reg_read = regmap_system_read,
> +	.free_context = regmap_system_free_context,
> +	.val_format_endian_default = REGMAP_ENDIAN_LITTLE,
> +};
> +
> +static struct regmap *__devm_regmap_init_adi_system_config(struct device *dev,
> +	struct adi_system_config *config,
> +	struct lock_class_key *lock_key, const char *lock_name)
> +{
> +	struct adi_system_context *ctx = create_context(config);
> +
> +	if (IS_ERR(ctx))
> +		return ERR_PTR(PTR_ERR(ctx));
> +
> +	return __devm_regmap_init(dev, &regmap_system_bus, ctx,
> +			&config->config,
> +		lock_key, lock_name);
> +}
> +
> +static DEFINE_SPINLOCK(adi_system_config_lock);
> +static LIST_HEAD(adi_system_config_list);
> +
> +static int adi_system_config_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct adi_system_config *config = &adi_pads_config;
> +	struct device_node *np = dev->of_node;
> +	struct regmap *regmap_mmio;
> +	struct regmap *regmap_system;
> +	struct resource *res;
> +	void __iomem *base;
> +	unsigned long flags;
> +
> +	struct regmap_config mmio_config = {
> +		.reg_bits = 8 * sizeof(uint32_t),
> +		.val_bits = 8 * sizeof(uint32_t),
> +		.reg_stride = sizeof(uint32_t),
> +	};
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +
> +	base = devm_ioremap(dev, res->start, resource_size(res));
> +	if (IS_ERR(base))
> +		return PTR_ERR(base);
> +
> +	mmio_config.name = dev_name(dev);
> +	mmio_config.max_register = resource_size(res) - sizeof(uint32_t);
> +
> +	regmap_mmio = devm_regmap_init_mmio(dev, base, &mmio_config);
> +	if (IS_ERR(regmap_mmio)) {
> +		dev_err(dev, "mmio regmap initialization failed\n");
> +		return PTR_ERR(regmap_mmio);
> +	}
> +
> +	config->mmio_regmap = regmap_mmio;
> +	regmap_system = devm_regmap_init_adi_system_config(dev, config);
> +	if (IS_ERR(regmap_system)) {
> +		dev_err(dev, "system config regmap initialization failed\n");
> +		return PTR_ERR(regmap_system);
> +	}
> +
> +	config->np = np;
> +	config->system_regmap = regmap_system;
> +	platform_set_drvdata(pdev, config);
> +
> +	spin_lock_irqsave(&adi_system_config_lock, flags);
> +	list_add_tail(&config->list, &adi_system_config_list);
> +	spin_unlock_irqrestore(&adi_system_config_lock, flags);
> +	return 0;
> +}
> +
> +static void adi_system_config_remove(struct platform_device *pdev)
> +{
> +	struct adi_system_config *config = platform_get_drvdata(pdev);
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&adi_system_config_lock, flags);
> +	list_del(&config->list);
> +	spin_unlock_irqrestore(&adi_system_config_lock, flags);
> +}
> +
> +/*
> + * PADs configuration registers are required to configure peripherals,
> + * and by extension the system. Hence the driver focuses on driving them while
> + * also setting up the remaining system.
> + */
> +static const struct of_device_id pads_dt_ids[] = {
> +	{ .compatible = "adi,pads-peripheral-config", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, pads_dt_ids);
> +
> +static struct platform_driver pads_driver = {
> +	.driver = {
> +		.name = "adi-system-config",
> +		.of_match_table = pads_dt_ids,
> +	},
> +	.probe = adi_system_config_probe,
> +	.remove = adi_system_config_remove,
> +};
> +module_platform_driver(pads_driver);
> +
> +MODULE_AUTHOR("Greg Malysa <greg.malysa@timesys.com>");
> +MODULE_DESCRIPTION("ADI ADSP PADS CFG-based System Configuration Driver");
> +MODULE_LICENSE("GPL v2");
> \ No newline at end of file

You need to fix such errors.

> diff --git a/include/linux/soc/adi/adsp-gpio-port.h b/include/linux/soc/adi/adsp-gpio-port.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..6466ded03ec6092149a2abfc56a305f9124ac695
> --- /dev/null
> +++ b/include/linux/soc/adi/adsp-gpio-port.h
> @@ -0,0 +1,85 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2022-2024 - Analog Devices Inc.
> + */
> +
> +#ifndef GPIO_ADI_ADSP_PORT_H
> +#define GPIO_ADI_ADSP_PORT_H
> +
> +#include <linux/gpio/driver.h>
> +
> +/* Number of GPIOs per port instance */
> +#define ADSP_PORT_NGPIO 16

Hm? No, you cannot have GPIO driver in linux/soc...

> +
> +/* PORT memory layout */
> +#define ADSP_PORT_REG_FER		0x00
> +#define ADSP_PORT_REG_FER_SET		0x04
> +#define ADSP_PORT_REG_FER_CLEAR		0x08
> +#define ADSP_PORT_REG_DATA		0x0c
> +#define ADSP_PORT_REG_DATA_SET		0x10
> +#define ADSP_PORT_REG_DATA_CLEAR	0x14
> +#define ADSP_PORT_REG_DIR		0x18
> +#define ADSP_PORT_REG_DIR_SET		0x1c
> +#define ADSP_PORT_REG_DIR_CLEAR		0x20
> +#define ADSP_PORT_REG_INEN		0x24
> +#define ADSP_PORT_REG_INEN_SET		0x28
> +#define ADSP_PORT_REG_INEN_CLEAR	0x2c
> +#define ADSP_PORT_REG_PORT_MUX		0x30
> +#define ADSP_PORT_REG_DATA_TGL		0x34
> +#define ADSP_PORT_REG_POLAR		0x38
> +#define ADSP_PORT_REG_POLAR_SET		0x3c
> +#define ADSP_PORT_REG_POLAR_CLEAR	0x40
> +#define ADSP_PORT_REG_LOCK		0x44
> +#define ADSP_PORT_REG_TRIG_TGL		0x48
> +
> +/*
> + * One gpio instance per PORT instance in the hardware, provides the per-PORT
> + * interface to the hardware. Referenced in GPIO and PINCTRL drivers
> + */
> +struct adsp_gpio_port {
> +	struct device *dev;
> +	void __iomem *regs;
> +	struct gpio_chip gpio;
> +	struct irq_domain *irq_domain;
> +	uint32_t irq_offset;
> +	uint32_t open_drain;
> +	spinlock_t lock;
> +};
> +
> +/* may need lock depending on register */
> +static inline uint32_t __adsp_gpio_readl(struct adsp_gpio_port *port,
> +				    size_t offset)
> +{
> +	return readl(port->regs + offset);
> +}
> +
> +/* may need lock depending on register */

What does it mean?

> +static inline void __adsp_gpio_writel(struct adsp_gpio_port *port, uint32_t val,
> +				      size_t offset)
> +{
> +	writel(val, port->regs + offset);

Not useful wrapper. Makes code bigger.


> +}
> +
> +/* may need lock depending on register */
> +static inline u16 __adsp_gpio_readw(struct adsp_gpio_port *port,
> +				    size_t offset)
> +{
> +	return readw(port->regs + offset);
> +}
> +
> +/* may need lock depending on register */
> +static inline void __adsp_gpio_writew(struct adsp_gpio_port *port, u16 val,
> +				      size_t offset)
> +{
> +	writew(val, port->regs + offset);
> +}
> +
> +static inline struct adsp_gpio_port *to_adsp_gpio_port(struct gpio_chip
> +						       *chip)
> +{
> +	return container_of(chip, struct adsp_gpio_port, gpio);
> +}
> +
> +int adsp_attach_pint_to_gpio(struct adsp_gpio_port *port);
> +
> +#endif
> diff --git a/include/linux/soc/adi/cpu.h b/include/linux/soc/adi/cpu.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..0ddb30619b423ce70e9b8018ed6404cfd4ef6039
> --- /dev/null
> +++ b/include/linux/soc/adi/cpu.h
> @@ -0,0 +1,107 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2022-2024 - Analog Devices Inc.
> + */
> +
> +#ifndef __MACH_CPU_H
> +#define __MACH_CPU_H

That's not an accurate header guard.

> +
> +#define SYS_L2_START		0x20080000
> +#define SYS_SRAM_BASE		(0x20080000 + SZ_16K)
> +
> +#define SYS_SRAM_SIZE		(SZ_16K + SZ_32K * 3)
> +#define SYS_SRAM_ICC_SIZE	SZ_4K
> +#define SYS_MMR_BASE		0x31000000
> +#define SYS_MMR_SIZE		SZ_1M
> +#define SYS_SMC_BANK1		0x44000000
> +
> +#define SC59X_GIC_PORT0		0x310B2000
> +#define SC59X_GIC_PORT1		0x310B4000
> +
> +/*
> + * Timer Configuration Register Bits
> + */
> +#define TIMER_EMU_RUN		0x8000
> +#define TIMER_BPER_EN		0x4000
> +#define TIMER_BWID_EN		0x2000
> +#define TIMER_BDLY_EN		0x1000
> +#define TIMER_OUT_DIS		0x0800
> +#define TIMER_TIN_SEL		0x0400
> +#define TIMER_CLK_SEL		0x0300
> +#define TIMER_CLK_SCLK		0x0000
> +#define TIMER_CLK_ALT_CLK0	0x0100
> +#define TIMER_CLK_ALT_CLK1	0x0300
> +#define TIMER_PULSE_HI		0x0080
> +#define TIMER_SLAVE_TRIG	0x0040
> +#define TIMER_IRQ_MODE		0x0030
> +#define TIMER_IRQ_ACT_EDGE	0x0000
> +#define TIMER_IRQ_DLY		0x0010
> +#define TIMER_IRQ_WID_DLY	0x0020
> +#define TIMER_IRQ_PER		0x0030
> +#define TIMER_MODE		0x000f
> +#define TIMER_MODE_WDOG_P	0x0008
> +#define TIMER_MODE_WDOG_W	0x0009
> +#define TIMER_MODE_PWM_CONT	0x000c
> +#define TIMER_MODE_PWM		0x000d
> +#define TIMER_MODE_WDTH		0x000a
> +#define TIMER_MODE_WDTH_D	0x000b
> +#define TIMER_MODE_EXT_CLK	0x000e
> +#define TIMER_MODE_PININT	0x000f
> +
> +#define __BFP(m) u16 m; u16 __pad_##m
> +
> +struct gptimer3 {
> +	__BFP(config);
> +	uint32_t counter;
> +	uint32_t period;
> +	uint32_t width;
> +	uint32_t delay;
> +};
> +
> +struct sc5xx_gptimer {
> +	int id;
> +	int irq;
> +	int reserved;
> +	int int_enable;
> +	void __iomem *io_base;
> +	void __iomem *cgu0_ctl;
> +	unsigned long isr_count;
> +	struct platform_device *pdev;
> +	struct list_head node;
> +};
> +
> +struct gptimer3_group_regs {
> +	__BFP(run);
> +	__BFP(enable);
> +	__BFP(disable);
> +	__BFP(stop_cfg);
> +	__BFP(stop_cfg_set);
> +	__BFP(stop_cfg_clr);
> +	__BFP(data_imsk);
> +	__BFP(stat_imsk);
> +	__BFP(tr_msk);
> +	__BFP(tr_ie);
> +	__BFP(data_ilat);
> +	__BFP(stat_ilat);
> +	__BFP(err_status);
> +	__BFP(bcast_per);
> +	__BFP(bcast_wid);
> +	__BFP(bcast_dly);
> +};
> +
> +/* The actual gptimer API */
> +struct sc5xx_gptimer *gptimer_request(int id);
> +int gptimer_free(struct sc5xx_gptimer *timer);
> +void set_gptimer_pwidth(struct sc5xx_gptimer *timer, uint32_t width);
> +void set_gptimer_period(struct sc5xx_gptimer *timer, uint32_t period);
> +uint32_t get_gptimer_count(struct sc5xx_gptimer *timer);
> +void set_gptimer_config(struct sc5xx_gptimer *timer, uint16_t config);
> +void enable_gptimers(uint16_t mask);
> +void disable_gptimers(uint16_t mask);
> +void map_gptimers(void);
> +uint16_t get_gptimer_status(void);
> +void set_gptimer_status(uint16_t value);
> +void set_spu_securep_msec(uint16_t n, bool msec);
> +void platform_ipi_init(void);

All these do not exist.


Best regards,
Krzysztof


