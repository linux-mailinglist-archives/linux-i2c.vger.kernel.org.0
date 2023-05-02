Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98EFE6F4B68
	for <lists+linux-i2c@lfdr.de>; Tue,  2 May 2023 22:33:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229614AbjEBUdX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 2 May 2023 16:33:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229506AbjEBUdW (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 2 May 2023 16:33:22 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCB1819A2;
        Tue,  2 May 2023 13:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683059600; x=1714595600;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1FXPdk1irRsOX44r9OYmKGk0aEfOim/Li+bhY4Tx/p0=;
  b=TEvsodSaLaM+LN14ckhidXGKIFYJkAAzodVf3tcX7Y4Q8AgieDV1/dx/
   uDu0wCLpBQ5KUy8ShVgxOQ2nqQRdRZ8FgA6FFs7dnXiuP1BgpFHvsmew4
   KLtWzBzJJWtC2RBq0WEHMoEv3gT2jNS97b8vEzZkybp33wrnaQ46R9Q5B
   UO66a0My2qvtn4oS6gtcrTte4dnftoR+RQFSgC1tS+XVGvi7QeE0K759a
   FFKJyEWywPWwN0qcoA/tA5WitjN+Iglqn3lRSdQpiwkc9bCJdNKJy3JsR
   qdzB8wQaN3CzbzgrnbVePMwNqZtL3x5GGF+jo2EAmN0os0ENLuoo+nRHL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="328866785"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; 
   d="scan'208";a="328866785"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2023 13:32:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="1026223663"
X-IronPort-AV: E=Sophos;i="5.99,245,1677571200"; 
   d="scan'208";a="1026223663"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 02 May 2023 13:32:07 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ptwfM-008Dpy-13;
        Tue, 02 May 2023 23:32:04 +0300
Date:   Tue, 2 May 2023 23:32:04 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Ryan Chen <ryan_chen@aspeedtech.com>
Cc:     jk@codeconstruct.com.au,
        Brendan Higgins <brendan.higgins@linux.dev>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Joel Stanley <joel@jms.id.au>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jean Delvare <jdelvare@suse.de>,
        William Zhang <william.zhang@broadcom.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, =linux-kernel@vger.kernel.org,
        Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v11 2/2] i2c: aspeed: support ast2600 i2c new register
 mode driver
Message-ID: <ZFFzRL/+73Ftix4Q@smile.fi.intel.com>
References: <20230430041712.3247998-1-ryan_chen@aspeedtech.com>
 <20230430041712.3247998-3-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230430041712.3247998-3-ryan_chen@aspeedtech.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Apr 30, 2023 at 12:17:12PM +0800, Ryan Chen wrote:
> Add i2c new register mode driver to support AST2600 i2c
> new register mode. AST2600 i2c controller have legacy and
> new register mode. The new register mode have global register
> support 4 base clock for scl clock selection, and new clock
> divider mode. The i2c new register mode have separate register
> set to control i2c master and slave.

...

> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/io.h>
> +#include <linux/slab.h>
> +#include <linux/delay.h>
> +#include <linux/reset.h>
> +#include <linux/module.h>
> +#include <linux/interrupt.h>
> +#include <linux/completion.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/regmap.h>
> +#include <linux/of_device.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/i2c-smbus.h>

Ordered?

...

> +#define AST2600_GLOBAL_INIT				\
> +			(AST2600_I2CG_CTRL_NEW_REG |	\
> +			AST2600_I2CG_CTRL_NEW_CLK_DIV)

Make just a one TAB and put the last two lines on the single one.

...

> +#define I2CCG_DIV_CTRL 0xC6411208

Is it decimal? Is it combination of bitfields? Can you add a comment what is
this magic?

...

> +struct ast2600_i2c_timing_table {
> +	u32 divisor;
> +	u32 timing;
> +};

Is it even used?

...

> +enum xfer_mode {
> +	BYTE_MODE = 0,

Why explicit assignment?

> +	BUFF_MODE,
> +	DMA_MODE,
> +};

...

> +	base_clk1 = (i2c_bus->apb_clk * 10) / ((((clk_div_reg & 0xff) + 2) * 10) / 2);
> +	base_clk2 = (i2c_bus->apb_clk * 10) /
> +			(((((clk_div_reg >> 8) & 0xff) + 2) * 10) / 2);
> +	base_clk3 = (i2c_bus->apb_clk * 10) /
> +			(((((clk_div_reg >> 16) & 0xff) + 2) * 10) / 2);
> +	base_clk4 = (i2c_bus->apb_clk * 10) /
> +			(((((clk_div_reg >> 24) & 0xff) + 2) * 10) / 2);

The same equation is used per each byte of clk_div_reg? Can it be rewritten to
avoid this and using loop, so you will have an array of base_clk to be filled?

Don't forget to use GENMASK().

...

> +	if ((i2c_bus->apb_clk / i2c_bus->bus_frequency) <= 32) {
> +		baseclk_idx = 0;
> +		divisor = DIV_ROUND_UP(i2c_bus->apb_clk, i2c_bus->bus_frequency);
> +	} else if ((base_clk1 / i2c_bus->bus_frequency) <= 32) {
> +		baseclk_idx = 1;
> +		divisor = DIV_ROUND_UP(base_clk1, i2c_bus->bus_frequency);
> +	} else if ((base_clk2 / i2c_bus->bus_frequency) <= 32) {
> +		baseclk_idx = 2;
> +		divisor = DIV_ROUND_UP(base_clk2, i2c_bus->bus_frequency);
> +	} else if ((base_clk3 / i2c_bus->bus_frequency) <= 32) {
> +		baseclk_idx = 3;
> +		divisor = DIV_ROUND_UP(base_clk3, i2c_bus->bus_frequency);

Will be optimized with above suggestion, I believe.

> +	} else {
> +		baseclk_idx = 4;
> +		divisor = DIV_ROUND_UP(base_clk4, i2c_bus->bus_frequency);
> +		inc = 0;
> +		while ((divisor + inc) > 32) {
> +			inc |= divisor & 0x1;
> +			divisor >>= 1;
> +			baseclk_idx++;
> +		}
> +		divisor += inc;

I think the above loop can be rewritten to have better representation.

> +	}

...

> +	baseclk_idx &= 0xf;

GENMASK()?

...

> +	scl_low = ((divisor * 9) / 16) - 1;
> +	scl_low = min_t(u32, scl_low, 0xf);

This can be done in one line. Also, why not 15?

...

> +	scl_high = (divisor - scl_low - 2) & 0xf;

GENMASK()?

...

> +	data = ((scl_high - 1) << 20) | (scl_high << 16) | (scl_low << 12) | (baseclk_idx);

Too many parentheses.

...

> +	/* due to master slave is common buffer, so need force the master stop not issue */
> +	if (readl(i2c_bus->reg_base + AST2600_I2CM_CMD_STS) & 0xffff) {

GENMASK() ?

> +		writel(0, i2c_bus->reg_base + AST2600_I2CM_CMD_STS);
> +		i2c_bus->cmd_err = -EBUSY;
> +		writel(0, i2c_bus->reg_base + AST2600_I2CC_BUFF_CTRL);
> +		complete(&i2c_bus->cmd_complete);
> +	}

...

> +	/* send start */
> +	dev_dbg(i2c_bus->dev, "[%d] %sing %d byte%s %s 0x%02x\n",
> +		i2c_bus->msgs_index, msg->flags & I2C_M_RD ? "read" : "write",

str_read_write() ?

> +		msg->len, msg->len > 1 ? "s" : "",
> +		msg->flags & I2C_M_RD ? "from" : "to", msg->addr);

...

> +				for (i = 0; i < xfer_len; i++) {
> +					wbuf[i % 4] = msg->buf[i];
> +					if (i % 4 == 3)
> +						writel(*(u32 *)wbuf, i2c_bus->buf_base + i - 3);

Err.. There can be alignment issues.

> +				}
> +				if (--i % 4 != 3)
> +					writel(*(u32 *)wbuf, i2c_bus->buf_base + i - (i % 4));

The above code is ugly. Can you think about it and write in a better way?

...

> +				for (i = 0; i < xfer_len; i++) {
> +					wbuf[i % 4] = msg->buf[i2c_bus->master_xfer_cnt + i];
> +					if (i % 4 == 3)
> +						writel(*(u32 *)wbuf, i2c_bus->buf_base + i - 3);
> +				}
> +				if (--i % 4 != 3)
> +					writel(*(u32 *)wbuf, i2c_bus->buf_base + i - (i % 4));

Ditto.

...

Do you have similar code pieces? Why not doing it in a separate function with
parameters?

...

> +	return ast2600_i2c_master_irq(i2c_bus) ? IRQ_HANDLED : IRQ_NONE;

IRQ_RETVAL() ?

...

> +	writel(0xfffffff, i2c_bus->reg_base + AST2600_I2CM_ISR);

GENMASK()

...

> +	writel(0xfffffff, i2c_bus->reg_base + AST2600_I2CS_ISR);

Ditto.

> +	if (i2c_bus->mode == BYTE_MODE) {
> +		writel(0xffff, i2c_bus->reg_base + AST2600_I2CS_IER);

Ditto.

> +	} else {
> +		/* Set interrupt generation of I2C slave controller */
> +		writel(AST2600_I2CS_PKT_DONE, i2c_bus->reg_base + AST2600_I2CS_IER);
> +	}

...

> +	WARN_ON(!i2c_bus->slave);

Why?

...

> +static const struct of_device_id ast2600_i2c_bus_of_table[] = {
> +	{
> +		.compatible = "aspeed,ast2600-i2cv2",
> +	},
> +	{}
> +};

> +

Redundant blank line.

> +MODULE_DEVICE_TABLE(of, ast2600_i2c_bus_of_table);

...

> +	i2c_bus = devm_kzalloc(dev, sizeof(*i2c_bus), GFP_KERNEL);
> +	if (!i2c_bus)
> +		return dev_err_probe(dev, -ENOMEM, "no memory allocated\n");

No. We do not print error message for ENOMEM.
You homework to find why.

...

> +	if (of_property_read_bool(pdev->dev.of_node, "aspeed,enable-dma"))

device_property_read_bool() ?

> +		i2c_bus->mode = DMA_MODE;

...

> +	if (i2c_bus->mode == BUFF_MODE) {
> +		res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> +		if (res && resource_size(res) >= 2) {
> +			i2c_bus->buf_base = devm_ioremap_resource(dev, res);
> +
> +			if (!IS_ERR_OR_NULL(i2c_bus->buf_base))
> +				i2c_bus->buf_size = resource_size(res) / 2;
> +		} else {
> +			i2c_bus->mode = BYTE_MODE;
> +		}
> +	}

Can be done without additional checks and with a simple call to
devm_platform_ioremap_resource(). No?

...

> +	/* i2c timeout counter: use base clk4 1Mhz,
> +	 * per unit: 1/(1000/4096) = 4096us
> +	 */

Wrong multi-line style of the comment.

...

> +	ret = of_property_read_u32(dev->of_node,
> +				   "i2c-scl-clk-low-timeout-us",
> +				   &i2c_bus->timeout);
> +	if (!ret)
> +		i2c_bus->timeout /= 4096;

What is this and why I2C core timings (standard) can't be utilized here?

...

> +	ret = of_property_read_u32(dev->of_node, "clock-frequency", &i2c_bus->bus_frequency);
> +	if (ret < 0) {
> +		dev_warn(dev, "Could not read clock-frequency property\n");
> +		i2c_bus->bus_frequency = 100000;
> +	}

There are macro for standard speeds. Moreover, there is a function to parse
properties, no need to open code.

...

> +	i2c_bus->adap.dev.of_node = dev->of_node;

device_set_node()

...

> +	if (of_property_read_bool(dev->of_node, "smbus-alert")) {

Doesn't core have already support for this?

> +		i2c_bus->alert_enable = true;
> +		i2c_bus->ara = i2c_new_smbus_alert_device(&i2c_bus->adap, &i2c_bus->alert_data);
> +		if (!i2c_bus->ara)
> +			dev_warn(dev, "Failed to register ARA client\n");
> +
> +		writel(AST2600_I2CM_PKT_DONE | AST2600_I2CM_BUS_RECOVER | AST2600_I2CM_SMBUS_ALT,
> +		       i2c_bus->reg_base + AST2600_I2CM_IER);
> +	} else {
> +		i2c_bus->alert_enable = false;
> +		/* Set interrupt generation of I2C master controller */
> +		writel(AST2600_I2CM_PKT_DONE | AST2600_I2CM_BUS_RECOVER,
> +		       i2c_bus->reg_base + AST2600_I2CM_IER);
> +	}

...

> +	dev_info(dev, "%s [%d]: adapter [%d khz] mode [%d]\n",
> +		 dev->of_node->name, i2c_bus->adap.nr, i2c_bus->bus_frequency / 1000,
> +		 i2c_bus->mode);

Useless noise.

-- 
With Best Regards,
Andy Shevchenko


