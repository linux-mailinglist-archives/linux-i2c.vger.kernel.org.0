Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7051D46108B
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Nov 2021 09:51:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242530AbhK2Iyu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 29 Nov 2021 03:54:50 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:40922
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243678AbhK2Iwt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 29 Nov 2021 03:52:49 -0500
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 43F9C40A00
        for <linux-i2c@vger.kernel.org>; Mon, 29 Nov 2021 08:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638175771;
        bh=7nEjPvTDQEfY5mZYJtglfa59N8Yj/omdJxmTIOTreCo=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=gd8KbijmgpQ27ieVsvKIBRZX0ryUH8cauaC6CFQF53C2z6vC4x8u350oWJM0xiRep
         EAfEaVHIeFcQ6+BlOxRxI4rVK5Fj+QfBax+KODTIyvzu+57Wbra0MkwgUpNHo976hD
         1Ybog+9bu6Bl1RWqzSrg5RMSooodIqz68GmXOBfzVqyh0t2esvM7/iTVfQwgQl3JPW
         WcUfqG887bYOFQ+mT70qrF2tmyrmiWSI7s12+frTxD6BoUADz+nd1Rdejtz7m6cWay
         qmo0DzfInrdctgoaAJjDgS/qDD1wUsD4rQ3jFUzKX88zzNw6sq21HJ+UQaD+syK4+I
         J1HECUGcrKXqQ==
Received: by mail-lf1-f70.google.com with SMTP id 24-20020ac25f58000000b0041799ebf529so5493718lfz.1
        for <linux-i2c@vger.kernel.org>; Mon, 29 Nov 2021 00:49:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7nEjPvTDQEfY5mZYJtglfa59N8Yj/omdJxmTIOTreCo=;
        b=hG8eugsLAKV7AU9XCh9Ax2mL2o3tv6E+vueYU0Ml8r7U716Ch5CH6l0MpFhGiCIyGL
         5tZhmexQ3olVIqzflZW06Tyu6ep2pdz+tAMP8DIjJD06Igiy02FofjdzLTSAQMRpMCsO
         F3QoQaHpdjdxujXFgZJus6WUJ0ge4XKt1+OJHZSS9GxjmJ0i3VAQTvzjikdvaJEsolgj
         oxJ3N5S3RfvSnj3oqyaHsmBNEGhXJmdZTi7BjLYMjU2YTRZVM3LbHHx0YZ+No9NqbLhT
         U3pwXnJxA9j3RIgmJfEzVI3fYJvSYb/oF06OgjvrM3Gjp77+O1xJ39AjclDrIYYQyXYw
         OQHg==
X-Gm-Message-State: AOAM530lFR4963Y4QUsRuIRlOiqdjJtc88ajOggBv/M8wiqdM0hL0Tm+
        85Ga1AabWrGyOsbwx8r1ZPArAnhsLcVlIFbNen7Mov0avo9n1ZFuX8maid9s3t3DKxJkUOY8J4A
        cp81DeTNfwTGPbQ+/sqek+YicelBsAgTwOq14Qg==
X-Received: by 2002:ac2:4d29:: with SMTP id h9mr46682471lfk.633.1638175770233;
        Mon, 29 Nov 2021 00:49:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzE9LyxbljzEGBzL+EObwvtjS/b3x08ndNZWzdeUwxrzt8gLR4oaIc/qAMnlM9Cjzkai3+MCg==
X-Received: by 2002:ac2:4d29:: with SMTP id h9mr46682452lfk.633.1638175770012;
        Mon, 29 Nov 2021 00:49:30 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id x199sm1264377lff.284.2021.11.29.00.49.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Nov 2021 00:49:29 -0800 (PST)
Message-ID: <26fffd4f-4d40-1cdd-0210-1ae02146d50c@canonical.com>
Date:   Mon, 29 Nov 2021 09:49:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 3/8] soc: samsung: Add USIv2 driver
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-i2c@vger.kernel.org
References: <20211127223253.19098-1-semen.protsenko@linaro.org>
 <20211127223253.19098-4-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211127223253.19098-4-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 27/11/2021 23:32, Sam Protsenko wrote:
> USIv2 IP-core is found on modern ARM64 Exynos SoCs (like Exynos850) and
> provides selectable serial protocol (one of: UART, SPI, I2C). USIv2
> registers usually reside in the same register map as a particular
> underlying protocol it implements, but have some particular offset. E.g.
> on Exynos850 the USI_UART has 0x13820000 base address, where UART
> registers have 0x00..0x40 offsets, and USI registers have 0xc0..0xdc
> offsets. Desired protocol can be chosen via SW_CONF register from System
> Register block of the same domain as USI.
> 
> Before starting to use a particular protocol, USIv2 must be configured
> properly:
>   1. Select protocol to be used via System Register
>   2. Clear "reset" flag in USI_CON
>   3. Configure HWACG behavior (e.g. for UART Rx the HWACG must be
>      disabled, so that the IP clock is not gated automatically); this is
>      done using USI_OPTION register
>   4. Keep both USI clocks (PCLK and IPCLK) running during USI registers
>      modification
> 
> This driver implements above behavior. Of course, USIv2 driver should be
> probed before UART/I2C/SPI drivers. It can be achived by embedding
> UART/I2C/SPI nodes inside of USI node (in Device Tree); driver then
> walks underlying nodes and instantiates those. Driver also handles USI
> configuration on PM resume, as register contents can be lost during CPU
> suspend.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/soc/samsung/Kconfig         |  14 ++
>  drivers/soc/samsung/Makefile        |   2 +
>  drivers/soc/samsung/exynos-usi-v2.c | 242 ++++++++++++++++++++++++++++

You used everywhere v2 naming, but I actually hope this driver will be
able to support also v1 and vx of USI. IOW, I expect to have only one
USI driver, so please drop everywhere v2 (bindings, symbols, Kconfig,
functions) except the compatible.

>  3 files changed, 258 insertions(+)
>  create mode 100644 drivers/soc/samsung/exynos-usi-v2.c
> 
> diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
> index e2cedef1e8d1..b168973c887f 100644
> --- a/drivers/soc/samsung/Kconfig
> +++ b/drivers/soc/samsung/Kconfig
> @@ -23,6 +23,20 @@ config EXYNOS_CHIPID
>  	  Support for Samsung Exynos SoC ChipID and Adaptive Supply Voltage.
>  	  This driver can also be built as module (exynos_chipid).
>  
> +config EXYNOS_USI_V2
> +	tristate "Exynos USIv2 (Universal Serial Interface) driver"
> +	default ARCH_EXYNOS && ARM64
> +	depends on ARCH_EXYNOS || COMPILE_TEST
> +	select MFD_SYSCON
> +	help
> +	  Enable support for USIv2 block. USI (Universal Serial Interface) is an
> +	  IP-core found in modern Samsung Exynos SoCs, like Exynos850 and
> +	  ExynosAutoV0. USI block can be configured to provide one of the
> +	  following serial protocols: UART, SPI or High Speed I2C.
> +
> +	  This driver allows one to configure USI for desired protocol, which
> +	  is usually done in USI node in Device Tree.
> +
>  config EXYNOS_PMU
>  	bool "Exynos PMU controller driver" if COMPILE_TEST
>  	depends on ARCH_EXYNOS || ((ARM || ARM64) && COMPILE_TEST)
> diff --git a/drivers/soc/samsung/Makefile b/drivers/soc/samsung/Makefile
> index 2ae4bea804cf..0b746b2fd78f 100644
> --- a/drivers/soc/samsung/Makefile
> +++ b/drivers/soc/samsung/Makefile
> @@ -4,6 +4,8 @@ obj-$(CONFIG_EXYNOS_ASV_ARM)	+= exynos5422-asv.o
>  obj-$(CONFIG_EXYNOS_CHIPID)	+= exynos_chipid.o
>  exynos_chipid-y			+= exynos-chipid.o exynos-asv.o
>  
> +obj-$(CONFIG_EXYNOS_USI_V2)	+= exynos-usi-v2.o
> +
>  obj-$(CONFIG_EXYNOS_PMU)	+= exynos-pmu.o
>  
>  obj-$(CONFIG_EXYNOS_PMU_ARM_DRIVERS)	+= exynos3250-pmu.o exynos4-pmu.o \
> diff --git a/drivers/soc/samsung/exynos-usi-v2.c b/drivers/soc/samsung/exynos-usi-v2.c
> new file mode 100644
> index 000000000000..5a315890e4ec
> --- /dev/null
> +++ b/drivers/soc/samsung/exynos-usi-v2.c
> @@ -0,0 +1,242 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2021 Linaro Ltd.
> + * Author: Sam Protsenko <semen.protsenko@linaro.org>
> + *
> + * Samsung Exynos USI v2 driver (Universal Serial Interface).
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>
> +
> +#include <dt-bindings/soc/samsung,exynos-usi-v2.h>
> +
> +/* System Register: SW_CONF register bits */
> +#define SW_CONF_UART		BIT(0)
> +#define SW_CONF_SPI		BIT(1)
> +#define SW_CONF_I2C		BIT(2)
> +#define SW_CONF_MASK		(SW_CONF_UART | SW_CONF_SPI | SW_CONF_I2C)
> +
> +/* USI register offsets */
> +#define USI_CON			0x04
> +#define USI_OPTION		0x08
> +
> +/* USI register bits */
> +#define USI_CON_RESET		BIT(0)
> +#define USI_OPTION_CLKREQ_ON	BIT(1)
> +#define USI_OPTION_CLKSTOP_ON	BIT(2)
> +
> +struct usi_v2_mode {

Everywhere here:
s/usi_v2/exynos_usi/

> +	const char *name;		/* mode name */
> +	unsigned int val;		/* mode register value */
> +};
> +
> +struct usi_v2 {
> +	struct device *dev;> +	void __iomem *regs;		/* USI register map */
> +	struct clk *pclk;		/* USI bus clock */
> +	struct clk *ipclk;		/* USI operating clock */
> +
> +	size_t mode;			/* current USI SW_CONF mode index */
> +	bool clkreq_on;			/* always provide clock to IP */
> +
> +	/* System Register */
> +	struct regmap *sysreg;		/* System Register map */
> +	unsigned int sw_conf;		/* SW_CONF register offset in sysreg */
> +};
> +
> +static const struct usi_v2_mode usi_v2_modes[] = {
> +	[USI_V2_UART] =	{ .name = "uart", .val = SW_CONF_UART },
> +	[USI_V2_SPI] =	{ .name = "spi",  .val = SW_CONF_SPI },
> +	[USI_V2_I2C] =	{ .name = "i2c",  .val = SW_CONF_I2C },
> +};
> +
> +/**
> + * usi_v2_set_sw_conf - Set USI block configuration mode
> + * @usi: USI driver object
> + * @mode: Mode index
> + *
> + * Select underlying serial protocol (UART/SPI/I2C) in USI IP-core.
> + *
> + * Return: 0 on success, or negative error code on failure.
> + */
> +static int usi_v2_set_sw_conf(struct usi_v2 *usi, size_t mode)
> +{
> +	unsigned int val;
> +	int ret;
> +
> +	if (mode >= ARRAY_SIZE(usi_v2_modes))
> +		return -EINVAL;
> +
> +	val = usi_v2_modes[mode].val;
> +	ret = regmap_update_bits(usi->sysreg, usi->sw_conf, SW_CONF_MASK, val);
> +	if (ret)
> +		return ret;
> +
> +	usi->mode = mode;
> +	dev_dbg(usi->dev, "USIv2 protocol: %s\n", usi_v2_modes[usi->mode].name);
> +
> +	return 0;
> +}
> +
> +/**
> + * usi_v2_enable - Initialize USI block
> + * @usi: USI driver object
> + *
> + * USI IP-core start state is "reset" (on startup and after CPU resume). This
> + * routine enables USI block by clearing the reset flag. It also configures
> + * HWACG behavior (needed e.g. for UART Rx). It should be performed before
> + * underlying protocol becomes functional.
> + *
> + * Both 'pclk' and 'ipclk' clocks should be enabled when running this function.
> + */
> +static void usi_v2_enable(const struct usi_v2 *usi)
> +{
> +	u32 val;
> +
> +	/* Enable USI block */
> +	val = readl(usi->regs + USI_CON);
> +	val &= ~USI_CON_RESET;
> +	writel(val, usi->regs + USI_CON);
> +	udelay(1);
> +
> +	/* Continuously provide the clock to USI IP w/o gating */
> +	if (usi->clkreq_on) {
> +		val = readl(usi->regs + USI_OPTION);
> +		val &= ~USI_OPTION_CLKSTOP_ON;
> +		val |= USI_OPTION_CLKREQ_ON;
> +		writel(val, usi->regs + USI_OPTION);
> +	}
> +}
> +
> +static int usi_v2_configure(struct usi_v2 *usi)
> +{
> +	int ret;
> +
> +	ret = clk_prepare_enable(usi->pclk);
> +	if (ret)
> +		return ret;
> +
> +	ret = clk_prepare_enable(usi->ipclk);
> +	if (ret)
> +		goto err_pclk;
> +
> +	ret = usi_v2_set_sw_conf(usi, usi->mode);
> +	if (ret)
> +		goto err_ipclk;
> +
> +	usi_v2_enable(usi);
> +
> +err_ipclk:
> +	clk_disable_unprepare(usi->ipclk);
> +err_pclk:
> +	clk_disable_unprepare(usi->pclk);
> +	return ret;
> +}
> +
> +static int usi_v2_parse_dt(struct device_node *np, struct usi_v2 *usi)
> +{
> +	int ret;
> +	u32 mode;
> +
> +	ret = of_property_read_u32(np, "samsung,mode", &mode);
> +	if (ret)
> +		return ret;
> +	usi->mode = mode;

Parse and validate mode here, instead of usi_v2_set_sw_conf(). We expect
DT to be correct, so if it is not, then there is no point to probe the
device.

Best regards,
Krzysztof
