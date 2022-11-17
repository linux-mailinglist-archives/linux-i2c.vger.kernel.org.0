Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D510162D554
	for <lists+linux-i2c@lfdr.de>; Thu, 17 Nov 2022 09:45:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239066AbiKQIpM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 17 Nov 2022 03:45:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbiKQIoz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 17 Nov 2022 03:44:55 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 609F1B70;
        Thu, 17 Nov 2022 00:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668674676; x=1700210676;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MlvO6L86IgZ7+LV5I3eTA7zgakYhx8hFG8h8LUIUasY=;
  b=e9UVhJfWkBKZRks+P2+l9JUZXkNEF+mMlHzN7Jbx06/t8uD0MVUOCXrK
   q/y9+QhELeuTG0yCL+TUIeS7HqDZ9EW6vaa1r3Rsk/+Pqm/RuHG2wP9aX
   0XJrJ1vlkMuwwnYGYGdz+Rh8kvSsQKFFRm0mhLoH8xbwv126qQDEEnmTx
   Zu7z8cwUjA89aSPvqkIWjr51tkK7zH1NR+d8R61ZsbwguxlTOKY6DG5TP
   IuL30M5WVCl+eR+mo4zLH0g/gItN2zyrAqJQSq6IivcdrDOe11VfgO5LO
   YFKz2NQnhd7HTy15LUUl1jk9Q1eAS1E0eBqFKnvHd/S+qFsqXYxQ+iIX/
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="312809873"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="312809873"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2022 00:44:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10533"; a="639725322"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; 
   d="scan'208";a="639725322"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 17 Nov 2022 00:44:31 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1ovaVZ-00DV49-0H;
        Thu, 17 Nov 2022 10:44:29 +0200
Date:   Thu, 17 Nov 2022 10:44:28 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Yinbo Zhu <zhuyinbo@loongson.cn>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Jean Delvare <jdelvare@suse.de>,
        William Zhang <william.zhang@broadcom.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Jan Dabros <jsd@semihalf.com>,
        Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] i2c: loongson: add bus driver for the loongson
 i2c controller
Message-ID: <Y3X0bJxOQIpP6MZv@smile.fi.intel.com>
References: <20221117075938.23379-1-zhuyinbo@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221117075938.23379-1-zhuyinbo@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Nov 17, 2022 at 03:59:37PM +0800, Yinbo Zhu wrote:
> This bus driver supports the Loongson i2c hardware controller in the
> Loongson platforms and supports to use DTS and ACPI framework to
> register i2c adapter device resources.
> 
> The Loongson i2c controller supports operating frequencty is 50MHZ
> and supports the maximum transmission rate is 400kbps.

...

> +#include <linux/acpi.h>

Besides missed of.h (but do not add it) this one has no users (see below how).
What you _might_ need is to have property.h to be included (seems no need).

> +#include <linux/module.h>
> +#include <linux/delay.h>
> +#include <linux/i2c.h>
> +#include <linux/err.h>
> +#include <linux/interrupt.h>
> +#include <linux/completion.h>
> +#include <linux/platform_device.h>
> +#include <linux/clk.h>
> +#include <linux/io.h>
> +#include <linux/slab.h>

Can you keep it ordered?

...

> +#define CTR_EN				0x80
> +#define CTR_IEN				0x40

BIT() ?
(don't forget to add bits.h for that)

...

> +#define CR_START			0x81
> +#define CR_STOP				0x41
> +#define CR_READ				0x21
> +#define CR_WRITE			0x11

Sounds to me like a BIT() + one specific bit to be set which should be defined
separately.

> +#define CR_ACK				0x8
> +#define CR_IACK				0x1
> +
> +#define SR_NOACK			0x80
> +#define SR_BUSY				0x40
> +#define SR_AL				0x20
> +#define SR_SLAVE_ADDRESSED		0x10
> +#define SR_SLAVE_RW			0x8
> +#define SR_TIP				0x2
> +#define SR_IF				0x1

All above seems like candidates for BIT()

...

> +#define i2c_readb(addr)			readb(dev->base + addr)
> +#define i2c_writeb(val, addr)		writeb(val, dev->base + addr)

These are rather bad macros than useful.
Instead, you have to pass a dev parameter and even better to have them
as static inline helpers.

Also you may consider using regmap MMIO APIs.

...

> +static bool repeated_start = 1;
> +module_param(repeated_start, bool, 0600);
> +MODULE_PARM_DESC(repeated_start,
> +		"Compatible with devices that support repeated start");

We discourage people to have new module parameters in the new code. Why this
can't be altered at run-time?

...

> +struct loongson_i2c_dev {
> +	spinlock_t		lock;

Haven't checkpatch complained that lock is not documented?

> +	unsigned int		suspended:1;
> +	struct device		*dev;
> +	void __iomem		*base;
> +	int			irq;
> +	u32			speed_hz;
> +	struct completion	cmd_complete;
> +	struct resource		*ioarea;

> +	struct i2c_adapter	adapter;

Also consider to check what is better to have as the first field in this data
structure. Depending on performance and code size you may choose which one can
go with no-op pointer arithmetics.

From code size perspective you can check with bloat-o-meter.

> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	struct i2c_client	*slave;
> +	enum loongson_i2c_slave_state	slave_state;
> +#endif
> +};

...

> +static int loongson_i2c_start(
> +		struct loongson_i2c_dev *dev, int dev_addr, int flags)

Broken indentation.

> +{
> +	unsigned long time_left;
> +	int retry = 5;

> +	unsigned char addr = (dev_addr & 0x7f) << 1;

Don't we have specific macro or helper for this?

> +	addr |= (flags & I2C_M_RD) ? 1 : 0;
> +
> +start:

> +	mdelay(1);

Why?

> +	i2c_writeb(addr, LOONGSON_I2C_TXR_REG);
> +	i2c_writeb((CR_START | CR_WRITE), LOONGSON_I2C_CR_REG);

> +	time_left = wait_for_completion_timeout(
> +		&dev->cmd_complete,
> +		(&dev->adapter)->timeout);

Broken indentation, too many parentheses (use . when it's appropriate).
Check your entire code for these.

> +	if (!time_left)
> +		return -ETIMEDOUT;
> +
> +	if (i2c_readb(LOONGSON_I2C_SR_REG) & SR_NOACK) {
> +		if (loongson_i2c_stop(dev) < 0)
> +			return -1;
> +
> +		while (retry--)

> +			goto start;

These labels here and there make code hard to understand. Try to refactor them,
so they will be easier to follow.

> +		return 0;
> +	}

> +	return 1;

What does this mean? Don't you need a specific definition, since it's not an
error code?

> +}

...

> +	i2c_writeb(i2c_readb(LOONGSON_I2C_CR_REG) |
> +					0x01, LOONGSON_I2C_CR_REG);
> +	i2c_writeb(i2c_readb(LOONGSON_I2C_CTR_REG) & ~0x80,
> +					LOONGSON_I2C_CTR_REG);
> +	i2c_writeb(prer_val & 0xFF, LOONGSON_I2C_PRER_LO_REG);
> +	i2c_writeb((prer_val & 0xFF00) >> 8, LOONGSON_I2C_PRER_HI_REG);
> +	i2c_writeb(i2c_readb(LOONGSON_I2C_CTR_REG) |
> +					0xe0, LOONGSON_I2C_CTR_REG);

Try to avoid magic numbers. Utilize GENMASK() when it's appropriate
(here it seems you have redundant '& 0xff{00}' stuff).

...

It's already a lot of remarks and comments. This patch needs more work.
I stopped here, only a couple additional remarks below as promised above.

...

> +	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));

device_set_node()

...

> +err_iounmap:
> +	iounmap(dev->base);
> +err_request_irq:
> +err_free_mem:
> +	platform_set_drvdata(pdev, NULL);
> +	kfree(dev);
> +err_release_region:
> +	release_mem_region(mem->start, resource_size(mem));
> +
> +	return r;

Can you utilize devm_*() / pcim_*() APIs? Why not?

...

> +		.of_match_table = of_match_ptr(loongson_i2c_id_table),
> +		.acpi_match_table = ACPI_PTR(loongson_i2c_acpi_match),

No of_match_ptr(), no ACPI_PTR(). You probably haven't compiled your code in
different configuration with `make W=1 ...`.

-- 
With Best Regards,
Andy Shevchenko


