Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 889853AB16D
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Jun 2021 12:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231685AbhFQKgR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Jun 2021 06:36:17 -0400
Received: from mga01.intel.com ([192.55.52.88]:19297 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229868AbhFQKgQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 17 Jun 2021 06:36:16 -0400
IronPort-SDR: kvk27OkmVMe4z9gCryIlw//GitpL/wgbbzivB8fAD42DNPCWMzbYGsDbkfOSJo8mdxA75zwNbk
 QRgeHz2nal/A==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="227856407"
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; 
   d="scan'208";a="227856407"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2021 03:34:08 -0700
IronPort-SDR: gaQEz+1C5Z9O+0jVedGxeikmS3cB4nRh5ll91dujU5zYz61dknsU94DiG/OCxi1XbogY4/LObE
 1ElFHWN8Bngg==
X-IronPort-AV: E=Sophos;i="5.83,280,1616482800"; 
   d="scan'208";a="404609309"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2021 03:34:02 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ltpLR-003Hf8-Im; Thu, 17 Jun 2021 13:33:57 +0300
Date:   Thu, 17 Jun 2021 13:33:57 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jamin Lin <jamin_lin@aspeedtech.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Arnd Bergmann <arnd@arndb.de>, Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Khalil Blaiech <kblaiech@mellanox.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Bence =?iso-8859-1?B?Q3Pza+Fz?= <bence98@sch.bme.hu>,
        Yicong Yang <yangyicong@hisilicon.com>,
        Mike Rapoport <rppt@kernel.org>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>,
        chiawei_wang@aspeedtech.com, troy_lee@aspeedtech.com,
        steven_lee@aspeedtech.com
Subject: Re: [PATCH 3/3] i2c:support new register set for ast2600
Message-ID: <YMslFSOrnUc5b+zP@smile.fi.intel.com>
References: <20210617094424.27123-1-jamin_lin@aspeedtech.com>
 <20210617094424.27123-4-jamin_lin@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617094424.27123-4-jamin_lin@aspeedtech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jun 17, 2021 at 05:43:40PM +0800, Jamin Lin wrote:
> Add i2c new driver to support new register set for AST2600.
> AST2600 support three modes for data transfer which are
> byte mode, buffer mode and dma mode, respectively.

DMA

> The global driver of i2c is used to set the new register
> mode and define the base clock frequency
> of baseclk_1~baseclk_4.

...

> +config I2C_NEW_ASPEED
> +	bool "Aspeed New I2C Controller"

Why can't be module?

> +	depends on ARCH_ASPEED || MACH_ASPEED_G6

COMPILE_TEST?

> +	select I2C_SMBUS

...

> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  Aspeed I2C Interrupt Controller.
> + *
> + *	Copyright (C) ASPEED Technology Inc.
> + *	Ryan Chen <ryan_chen@aspeedtech.com>

> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License version 2 as
> + *  published by the Free Software Foundation.

SPDX covers this.

> + */

...

> +#include <linux/clk.h>
> +#include <linux/irq.h>
> +#include <linux/irqchip.h>
> +#include <linux/irqchip/chained_irq.h>
> +#include <linux/irqdomain.h>
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/io.h>
> +#include <linux/reset.h>
> +#include <linux/delay.h>
> +#include <linux/clk-provider.h>
> +#include "ast2600-i2c-global.h"

> +static const struct of_device_id aspeed_i2c_ic_of_match[] = {
> +	{ .compatible = "aspeed,ast2600-i2c-global", .data = (void *)0},

> +	{ },

No need to have comma for terminator line.

> +};

No MODULE_DEVICE_TABLE()?

...

> +static const struct aspeed_i2c_base_clk i2c_base_clk[BASE_CLK_COUNT] = {
> +	/* name	target_freq */
> +	{  "base_clk0",	1000000 },	/* 1M */
> +	{  "base_clk1",	4000000 },	/* 4M */
> +	{  "base_clk2",	10000000 },	/* 10M */
> +	{  "base_clk3",	40000000 },	/* 40M */
> +};

Why it's not provided as the clock provider(s)?

...

> +static u32 aspeed_i2c_ic_get_new_clk_divider(unsigned long	base_clk, struct device_node *node)
> +{
> +	struct clk_hw_onecell_data *onecell;
> +	struct clk_hw *hw;
> +	int err;
> +	u32 clk_divider = 0;
> +	int i, j;
> +	unsigned long base_freq;

Use reversed xmas tree order for all these blocks.

The rule of thumb, btw, that any comment applies to all similar places by
default (independently on which line it was given against).

> +	onecell = kzalloc(sizeof(*onecell) +
> +			  (BASE_CLK_COUNT * sizeof(struct clk_hw *)),

Check overflow.h for useful macros.

> +			  GFP_KERNEL);

> +

Redundant blank line.

> +	if (!onecell) {

> +		pr_err("allocate clk_hw\n");

Drop all these noisy useless messages.

> +		return 0;
> +	}
> +
> +	onecell->num = BASE_CLK_COUNT;
> +
> +	pr_debug("base_clk %ld\n", base_clk);

This...

> +	for (j = 0; j < BASE_CLK_COUNT; j++) {
> +		pr_debug("target clk : %ld\n", i2c_base_clk[j].base_freq);

...and this and so on...

> +		for (i = 0; i < 0xff; i++) {
> +			/*
> +			 * i maps to div:
> +			 * 0x00: div 1
> +			 * 0x01: div 1.5
> +			 * 0x02: div 2
> +			 * 0x03: div 2.5
> +			 * 0x04: div 3
> +			 * ...
> +			 * 0xFE: div 128
> +			 * 0xFF: div 128.5
> +			 */
> +			base_freq = base_clk * 2 / (2 + i);
> +			if (base_freq <= i2c_base_clk[j].base_freq)
> +				break;
> +		}

oAre yuo sure you can't eliminate the entire for-loop? Think about it a bit,
please.

> +		pr_info("i2cg - %s : %ld\n", i2c_base_clk[j].name, base_freq);
> +		hw = clk_hw_register_fixed_rate(NULL, i2c_base_clk[j].name, NULL, 0, base_freq);
> +		if (IS_ERR(hw)) {
> +			pr_err("failed to register input clock: %ld\n", PTR_ERR(hw));
> +			break;
> +		}
> +		onecell->hws[j] = hw;

> +		clk_divider |= (i << (8 * j));

See above.

> +	}
> +
> +	err = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, onecell);
> +	if (err)
> +		pr_err("failed to add i2c base clk provider: %d\n", err);
> +
> +	return clk_divider;
> +}

...

> +static int aspeed_i2c_global_probe(struct platform_device *pdev)
> +{
> +	struct aspeed_i2c_ic *i2c_ic;
> +	struct device_node *node = pdev->dev.of_node;
> +	const struct of_device_id *match;
> +	struct clk *parent_clk;
> +	unsigned long	parent_clk_frequency;
> +	u32 clk_divider;
> +	int ret = 0;

> +	match = of_match_node(aspeed_i2c_ic_of_match, node);
> +	if (!match)
> +		return -ENOMEM;

device_get_match_data()

> +	i2c_ic = kzalloc(sizeof(*i2c_ic), GFP_KERNEL);

devm_kzalloc()

> +	if (!i2c_ic)
> +		return -ENOMEM;
> +
> +	i2c_ic->base = of_iomap(node, 0);

platform_get_resource

> +	if (!i2c_ic->base) {
> +		ret = -ENOMEM;
> +		goto err_free_ic;
> +	}

> +	i2c_ic->bus_num = (int)match->data;

Why not auto?

> +	if (i2c_ic->bus_num) {
> +		i2c_ic->parent_irq = irq_of_parse_and_map(node, 0);

platform_get_irq()

> +		if (i2c_ic->parent_irq < 0) {
> +			ret = i2c_ic->parent_irq;
> +			goto err_iounmap;
> +		}
> +	}

> +	i2c_ic->rst = devm_reset_control_get_exclusive(&pdev->dev, NULL);

> +

Redundant.

> +	if (IS_ERR(i2c_ic->rst)) {

> +		dev_dbg(&pdev->dev,
> +			"missing or invalid reset controller device tree entry");

Make it optional.

> +	} else {
> +		/* SCU I2C Reset */
> +		reset_control_assert(i2c_ic->rst);
> +		udelay(3);
> +		reset_control_deassert(i2c_ic->rst);
> +	}
> +
> +	/* ast2600 init */
> +	writel(ASPEED_I2CG_SLAVE_PKT_NAK |
> +	       ASPEED_I2CG_CTRL_NEW_REG |
> +	       ASPEED_I2CG_CTRL_NEW_CLK_DIV,
> +	       i2c_ic->base + ASPEED_I2CG_CTRL);
> +	parent_clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(parent_clk))
> +		return PTR_ERR(parent_clk);
> +	parent_clk_frequency = clk_get_rate(parent_clk);
> +	pr_debug("parent_clk_frequency %ld\n", parent_clk_frequency);
> +	clk_divider = aspeed_i2c_ic_get_new_clk_divider(parent_clk_frequency, node);
> +	writel(clk_divider, i2c_ic->base + ASPEED_I2CG_CLK_DIV_CTRL);
> +
> +	pr_info("i2c global registered\n");
> +
> +	return 0;
> +
> +err_iounmap:
> +	iounmap(i2c_ic->base);
> +err_free_ic:
> +	kfree(i2c_ic);
> +	return ret;
> +}

...

> +#ifndef AST2600_I2C_GLOBAL_H
> +#define AST2600_I2C_GLOBAL_H 1

Missed bits.h

> +#endif /* AST2600_I2C_GLOBAL_H */

...

> +/*
> + * i2c-new-aspeed.c - I2C driver for the Aspeed SoC

It's a bad idea to put file name inside the file.

> + *
> + * Copyright (C) ASPEED Technology Inc.
> + * Ryan Chen <ryan_chen@aspeedtech.com>
> + *
> + */

...

> +#define AST_I2CC_TX_DIR_MASK			(0x7 << 29)

GENMASK()

...

> +#define AST_I2CC_GET_RX_BUF_LEN(x)		(((x) >> 24) & 0x3f)
> +#define AST_I2CC_SET_RX_BUF_LEN(x)		((((x) - 1) & 0x1f) << 16)
> +#define AST_I2CC_SET_TX_BUF_LEN(x)		((((x) - 1) & 0x1f) << 8)
> +#define AST_I2CC_GET_TX_BUF_LEN(x)		((((x) >> 8) & 0x1f) + 1)

Ditto.

...

> +static struct ast_i2c_timing_table aspeed_old_i2c_timing_table[] = {

What the ... is this for?!

> +	/* Divisor : Base Clock : tCKHighMin : tCK High : tCK Low  */
> +	/* Divisor :	  [3:0] : [23: 20]   :   [19:16]:   [15:12] */
> +	{ 6, 0x00000300 | (0x0) | (0x2 << 20) | (0x2 << 16) | (0x2 << 12) },
> +	{ 7, 0x00000300 | (0x0) | (0x3 << 20) | (0x3 << 16) | (0x2 << 12) },
> +	{ 8, 0x00000300 | (0x0) | (0x3 << 20) | (0x3 << 16) | (0x3 << 12) },
> +	{ 9, 0x00000300 | (0x0) | (0x4 << 20) | (0x4 << 16) | (0x3 << 12) },
> +	{ 10, 0x00000300 | (0x0) | (0x4 << 20) | (0x4 << 16) | (0x4 << 12) },
> +	{ 11, 0x00000300 | (0x0) | (0x5 << 20) | (0x5 << 16) | (0x4 << 12) },
> +	{ 12, 0x00000300 | (0x0) | (0x5 << 20) | (0x5 << 16) | (0x5 << 12) },
> +	{ 13, 0x00000300 | (0x0) | (0x6 << 20) | (0x6 << 16) | (0x5 << 12) },
> +	{ 14, 0x00000300 | (0x0) | (0x6 << 20) | (0x6 << 16) | (0x6 << 12) },
> +	{ 15, 0x00000300 | (0x0) | (0x7 << 20) | (0x7 << 16) | (0x6 << 12) },
> +	{ 16, 0x00000300 | (0x0) | (0x7 << 20) | (0x7 << 16) | (0x7 << 12) },
> +	{ 17, 0x00000300 | (0x0) | (0x8 << 20) | (0x8 << 16) | (0x7 << 12) },
> +	{ 18, 0x00000300 | (0x0) | (0x8 << 20) | (0x8 << 16) | (0x8 << 12) },
> +	{ 19, 0x00000300 | (0x0) | (0x9 << 20) | (0x9 << 16) | (0x8 << 12) },
> +	{ 20, 0x00000300 | (0x0) | (0x9 << 20) | (0x9 << 16) | (0x9 << 12) },
> +	{ 21, 0x00000300 | (0x0) | (0xa << 20) | (0xa << 16) | (0x9 << 12) },
> +	{ 22, 0x00000300 | (0x0) | (0xa << 20) | (0xa << 16) | (0xa << 12) },
> +	{ 23, 0x00000300 | (0x0) | (0xb << 20) | (0xb << 16) | (0xa << 12) },
> +	{ 24, 0x00000300 | (0x0) | (0xb << 20) | (0xb << 16) | (0xb << 12) },
> +	{ 25, 0x00000300 | (0x0) | (0xc << 20) | (0xc << 16) | (0xb << 12) },
> +	{ 26, 0x00000300 | (0x0) | (0xc << 20) | (0xc << 16) | (0xc << 12) },
> +	{ 27, 0x00000300 | (0x0) | (0xd << 20) | (0xd << 16) | (0xc << 12) },
> +	{ 28, 0x00000300 | (0x0) | (0xd << 20) | (0xd << 16) | (0xd << 12) },
> +	{ 29, 0x00000300 | (0x0) | (0xe << 20) | (0xe << 16) | (0xd << 12) },
> +	{ 30, 0x00000300 | (0x0) | (0xe << 20) | (0xe << 16) | (0xe << 12) },
> +	{ 31, 0x00000300 | (0x0) | (0xf << 20) | (0xf << 16) | (0xe << 12) },
> +	{ 32, 0x00000300 | (0x0) | (0xf << 20) | (0xf << 16) | (0xf << 12) },
> +
> +	{ 34, 0x00000300 | (0x1) | (0x8 << 20) | (0x8 << 16) | (0x7 << 12) },
> +	{ 36, 0x00000300 | (0x1) | (0x8 << 20) | (0x8 << 16) | (0x8 << 12) },
> +	{ 38, 0x00000300 | (0x1) | (0x9 << 20) | (0x9 << 16) | (0x8 << 12) },
> +	{ 40, 0x00000300 | (0x1) | (0x9 << 20) | (0x9 << 16) | (0x9 << 12) },
> +	{ 42, 0x00000300 | (0x1) | (0xa << 20) | (0xa << 16) | (0x9 << 12) },
> +	{ 44, 0x00000300 | (0x1) | (0xa << 20) | (0xa << 16) | (0xa << 12) },
> +	{ 46, 0x00000300 | (0x1) | (0xb << 20) | (0xb << 16) | (0xa << 12) },
> +	{ 48, 0x00000300 | (0x1) | (0xb << 20) | (0xb << 16) | (0xb << 12) },
> +	{ 50, 0x00000300 | (0x1) | (0xc << 20) | (0xc << 16) | (0xb << 12) },
> +	{ 52, 0x00000300 | (0x1) | (0xc << 20) | (0xc << 16) | (0xc << 12) },
> +	{ 54, 0x00000300 | (0x1) | (0xd << 20) | (0xd << 16) | (0xc << 12) },
> +	{ 56, 0x00000300 | (0x1) | (0xd << 20) | (0xd << 16) | (0xd << 12) },
> +	{ 58, 0x00000300 | (0x1) | (0xe << 20) | (0xe << 16) | (0xd << 12) },
> +	{ 60, 0x00000300 | (0x1) | (0xe << 20) | (0xe << 16) | (0xe << 12) },
> +	{ 62, 0x00000300 | (0x1) | (0xf << 20) | (0xf << 16) | (0xe << 12) },
> +	{ 64, 0x00000300 | (0x1) | (0xf << 20) | (0xf << 16) | (0xf << 12) },
> +
> +	{ 68, 0x00000300 | (0x2) | (0x8 << 20) | (0x8 << 16) | (0x7 << 12) },
> +	{ 72, 0x00000300 | (0x2) | (0x8 << 20) | (0x8 << 16) | (0x8 << 12) },
> +	{ 76, 0x00000300 | (0x2) | (0x9 << 20) | (0x9 << 16) | (0x8 << 12) },
> +	{ 80, 0x00000300 | (0x2) | (0x9 << 20) | (0x9 << 16) | (0x9 << 12) },
> +	{ 84, 0x00000300 | (0x2) | (0xa << 20) | (0xa << 16) | (0x9 << 12) },
> +	{ 88, 0x00000300 | (0x2) | (0xa << 20) | (0xa << 16) | (0xa << 12) },
> +	{ 92, 0x00000300 | (0x2) | (0xb << 20) | (0xb << 16) | (0xa << 12) },
> +	{ 96, 0x00000300 | (0x2) | (0xb << 20) | (0xb << 16) | (0xb << 12) },
> +	{ 100, 0x00000300 | (0x2) | (0xc << 20) | (0xc << 16) | (0xb << 12) },
> +	{ 104, 0x00000300 | (0x2) | (0xc << 20) | (0xc << 16) | (0xc << 12) },
> +	{ 108, 0x00000300 | (0x2) | (0xd << 20) | (0xd << 16) | (0xc << 12) },
> +	{ 112, 0x00000300 | (0x2) | (0xd << 20) | (0xd << 16) | (0xd << 12) },
> +	{ 116, 0x00000300 | (0x2) | (0xe << 20) | (0xe << 16) | (0xd << 12) },
> +	{ 120, 0x00000300 | (0x2) | (0xe << 20) | (0xe << 16) | (0xe << 12) },
> +	{ 124, 0x00000300 | (0x2) | (0xf << 20) | (0xf << 16) | (0xe << 12) },
> +	{ 128, 0x00000300 | (0x2) | (0xf << 20) | (0xf << 16) | (0xf << 12) },
> +
> +	{ 136, 0x00000300 | (0x3) | (0x8 << 20) | (0x8 << 16) | (0x7 << 12) },
> +	{ 144, 0x00000300 | (0x3) | (0x8 << 20) | (0x8 << 16) | (0x8 << 12) },
> +	{ 152, 0x00000300 | (0x3) | (0x9 << 20) | (0x9 << 16) | (0x8 << 12) },
> +	{ 160, 0x00000300 | (0x3) | (0x9 << 20) | (0x9 << 16) | (0x9 << 12) },
> +	{ 168, 0x00000300 | (0x3) | (0xa << 20) | (0xa << 16) | (0x9 << 12) },
> +	{ 176, 0x00000300 | (0x3) | (0xa << 20) | (0xa << 16) | (0xa << 12) },
> +	{ 184, 0x00000300 | (0x3) | (0xb << 20) | (0xb << 16) | (0xa << 12) },
> +	{ 192, 0x00000300 | (0x3) | (0xb << 20) | (0xb << 16) | (0xb << 12) },
> +	{ 200, 0x00000300 | (0x3) | (0xc << 20) | (0xc << 16) | (0xb << 12) },
> +	{ 208, 0x00000300 | (0x3) | (0xc << 20) | (0xc << 16) | (0xc << 12) },
> +	{ 216, 0x00000300 | (0x3) | (0xd << 20) | (0xd << 16) | (0xc << 12) },
> +	{ 224, 0x00000300 | (0x3) | (0xd << 20) | (0xd << 16) | (0xd << 12) },
> +	{ 232, 0x00000300 | (0x3) | (0xe << 20) | (0xe << 16) | (0xd << 12) },
> +	{ 240, 0x00000300 | (0x3) | (0xe << 20) | (0xe << 16) | (0xe << 12) },
> +	{ 248, 0x00000300 | (0x3) | (0xf << 20) | (0xf << 16) | (0xe << 12) },
> +	{ 256, 0x00000300 | (0x3) | (0xf << 20) | (0xf << 16) | (0xf << 12) },
> +
> +	{ 272, 0x00000300 | (0x4) | (0x8 << 20) | (0x8 << 16) | (0x7 << 12) },
> +	{ 288, 0x00000300 | (0x4) | (0x8 << 20) | (0x8 << 16) | (0x8 << 12) },
> +	{ 304, 0x00000300 | (0x4) | (0x9 << 20) | (0x9 << 16) | (0x8 << 12) },
> +	{ 320, 0x00000300 | (0x4) | (0x9 << 20) | (0x9 << 16) | (0x9 << 12) },
> +	{ 336, 0x00000300 | (0x4) | (0xa << 20) | (0xa << 16) | (0x9 << 12) },
> +	{ 352, 0x00000300 | (0x4) | (0xa << 20) | (0xa << 16) | (0xa << 12) },
> +	{ 368, 0x00000300 | (0x4) | (0xb << 20) | (0xb << 16) | (0xa << 12) },
> +	{ 384, 0x00000300 | (0x4) | (0xb << 20) | (0xb << 16) | (0xb << 12) },
> +	{ 400, 0x00000300 | (0x4) | (0xc << 20) | (0xc << 16) | (0xb << 12) },
> +	{ 416, 0x00000300 | (0x4) | (0xc << 20) | (0xc << 16) | (0xc << 12) },
> +	{ 432, 0x00000300 | (0x4) | (0xd << 20) | (0xd << 16) | (0xc << 12) },
> +	{ 448, 0x00000300 | (0x4) | (0xd << 20) | (0xd << 16) | (0xd << 12) },
> +	{ 464, 0x00000300 | (0x4) | (0xe << 20) | (0xe << 16) | (0xd << 12) },
> +	{ 480, 0x00000300 | (0x4) | (0xe << 20) | (0xe << 16) | (0xe << 12) },
> +	{ 496, 0x00000300 | (0x4) | (0xf << 20) | (0xf << 16) | (0xe << 12) },
> +	{ 512, 0x00000300 | (0x4) | (0xf << 20) | (0xf << 16) | (0xf << 12) },
> +
> +	{ 544, 0x00000300 | (0x5) | (0x8 << 20) | (0x8 << 16) | (0x7 << 12) },
> +	{ 576, 0x00000300 | (0x5) | (0x8 << 20) | (0x8 << 16) | (0x8 << 12) },
> +	{ 608, 0x00000300 | (0x5) | (0x9 << 20) | (0x9 << 16) | (0x8 << 12) },
> +	{ 640, 0x00000300 | (0x5) | (0x9 << 20) | (0x9 << 16) | (0x9 << 12) },
> +	{ 672, 0x00000300 | (0x5) | (0xa << 20) | (0xa << 16) | (0x9 << 12) },
> +	{ 704, 0x00000300 | (0x5) | (0xa << 20) | (0xa << 16) | (0xa << 12) },
> +	{ 736, 0x00000300 | (0x5) | (0xb << 20) | (0xb << 16) | (0xa << 12) },
> +	{ 768, 0x00000300 | (0x5) | (0xb << 20) | (0xb << 16) | (0xb << 12) },
> +	{ 800, 0x00000300 | (0x5) | (0xc << 20) | (0xc << 16) | (0xb << 12) },
> +	{ 832, 0x00000300 | (0x5) | (0xc << 20) | (0xc << 16) | (0xc << 12) },
> +	{ 864, 0x00000300 | (0x5) | (0xd << 20) | (0xd << 16) | (0xc << 12) },
> +	{ 896, 0x00000300 | (0x5) | (0xd << 20) | (0xd << 16) | (0xd << 12) },
> +	{ 928, 0x00000300 | (0x5) | (0xe << 20) | (0xe << 16) | (0xd << 12) },
> +	{ 960, 0x00000300 | (0x5) | (0xe << 20) | (0xe << 16) | (0xe << 12) },
> +	{ 992, 0x00000300 | (0x5) | (0xf << 20) | (0xf << 16) | (0xe << 12) },
> +	{ 1024, 0x00000300 | (0x5) | (0xf << 20) | (0xf << 16) | (0xf << 12) },
> +
> +	{ 1088, 0x00000300 | (0x6) | (0x8 << 20) | (0x8 << 16) | (0x7 << 12) },
> +	{ 1152, 0x00000300 | (0x6) | (0x8 << 20) | (0x8 << 16) | (0x8 << 12) },
> +	{ 1216, 0x00000300 | (0x6) | (0x9 << 20) | (0x9 << 16) | (0x8 << 12) },
> +	{ 1280, 0x00000300 | (0x6) | (0x9 << 20) | (0x9 << 16) | (0x9 << 12) },
> +	{ 1344, 0x00000300 | (0x6) | (0xa << 20) | (0xa << 16) | (0x9 << 12) },
> +	{ 1408, 0x00000300 | (0x6) | (0xa << 20) | (0xa << 16) | (0xa << 12) },
> +	{ 1472, 0x00000300 | (0x6) | (0xb << 20) | (0xb << 16) | (0xa << 12) },
> +	{ 1536, 0x00000300 | (0x6) | (0xb << 20) | (0xb << 16) | (0xb << 12) },
> +	{ 1600, 0x00000300 | (0x6) | (0xc << 20) | (0xc << 16) | (0xb << 12) },
> +	{ 1664, 0x00000300 | (0x6) | (0xc << 20) | (0xc << 16) | (0xc << 12) },
> +	{ 1728, 0x00000300 | (0x6) | (0xd << 20) | (0xd << 16) | (0xc << 12) },
> +	{ 1792, 0x00000300 | (0x6) | (0xd << 20) | (0xd << 16) | (0xd << 12) },
> +	{ 1856, 0x00000300 | (0x6) | (0xe << 20) | (0xe << 16) | (0xd << 12) },
> +	{ 1920, 0x00000300 | (0x6) | (0xe << 20) | (0xe << 16) | (0xe << 12) },
> +	{ 1984, 0x00000300 | (0x6) | (0xf << 20) | (0xf << 16) | (0xe << 12) },
> +	{ 2048, 0x00000300 | (0x6) | (0xf << 20) | (0xf << 16) | (0xf << 12) },
> +
> +	{ 2176, 0x00000300 | (0x7) | (0x8 << 20) | (0x8 << 16) | (0x7 << 12) },
> +	{ 2304, 0x00000300 | (0x7) | (0x8 << 20) | (0x8 << 16) | (0x8 << 12) },
> +	{ 2432, 0x00000300 | (0x7) | (0x9 << 20) | (0x9 << 16) | (0x8 << 12) },
> +	{ 2560, 0x00000300 | (0x7) | (0x9 << 20) | (0x9 << 16) | (0x9 << 12) },
> +	{ 2688, 0x00000300 | (0x7) | (0xa << 20) | (0xa << 16) | (0x9 << 12) },
> +	{ 2816, 0x00000300 | (0x7) | (0xa << 20) | (0xa << 16) | (0xa << 12) },
> +	{ 2944, 0x00000300 | (0x7) | (0xb << 20) | (0xb << 16) | (0xa << 12) },
> +	{ 3072, 0x00000300 | (0x7) | (0xb << 20) | (0xb << 16) | (0xb << 12) },
> +};

...

> +enum xfer_mode {
> +	BYTE_MODE = 0,
> +	BUFF_MODE,
> +	DMA_MODE,

> +

Redundant blank line.

> +};

-- 
With Best Regards,
Andy Shevchenko


