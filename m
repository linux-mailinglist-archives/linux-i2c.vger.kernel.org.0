Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E5485EAD8D
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Sep 2022 19:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbiIZRFf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Sep 2022 13:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbiIZRFJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Sep 2022 13:05:09 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0441B4DF3F;
        Mon, 26 Sep 2022 09:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664208480; x=1695744480;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=T5h9VbkrRGLeT31V2EizH13lUj2I0WcCAhoghCFpBEM=;
  b=jkDVcD1jp5ceUYjTXqcs4cpTEt3M4+vhNNCfbP8LGhQ6NU3Tq4qanh49
   wy+BNlIkv6laBfdBY+4KndNa7RlU0+oJIVgWftXC//Qf2Q/U96PKwVbCD
   Q8qPcwHa9DcJaCIzXW7SapVxhgQPmHc98CHJ0Pyqn/M1D51SQCFF4fCWk
   Jo4XGdB2k75xrjrtL/dCQXj+bmdzOgGGdbJYWUHm8ZwiHO3XRI7kuFBec
   nJA3EvZAa0rDiUidtXRnuKYs/H+v3IB/mcPWc62+VdB75Vr2A6NnTZw6w
   ZwFdR3wD+A5WTj4uvbphPs/l80FbUEfKvS+ZNZewPlcbT4Qm7BefPATwM
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="327420086"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; 
   d="scan'208";a="327420086"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2022 09:06:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10482"; a="572268753"
X-IronPort-AV: E=Sophos;i="5.93,346,1654585200"; 
   d="scan'208";a="572268753"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 26 Sep 2022 09:06:30 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1ocqcn-0081gY-0g;
        Mon, 26 Sep 2022 19:06:29 +0300
Date:   Mon, 26 Sep 2022 19:06:28 +0300
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        linux-acpi@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>,
        Jianmin Lv <lvjianmin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>
Subject: Re: [PATCH V2 3/4] i2c: Add driver for Loongson-2K/LS7A I2C
 controller
Message-ID: <YzHOBADEfJV/EOZS@smile.fi.intel.com>
References: <cover.1664193316.git.zhoubinbin@loongson.cn>
 <95903ff11e598c1888fd5183c4aed8f4c5460c68.1664193316.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95903ff11e598c1888fd5183c4aed8f4c5460c68.1664193316.git.zhoubinbin@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Sep 26, 2022 at 09:00:06PM +0800, Binbin Zhou wrote:
> This I2C module is integrated into the Loongson-2K SoC and the Loongson
> LS7A bridge chip.
> 
> Initialize the i2c controller early. This is required in order to ensure
> that core system devices such as the display controller(DC) attached via
> I2C are available early in boot.

...

> +	help
> +	  If you say yes to this option, support will be included for the
> +	  I2C interface on the Loongson's LS2K/LS7A Platform-Bridge.

What will be module name?

...

> + * Copyright (C) 2013 Loongson Technology Corporation Limited
> + * Copyright (C) 2014-2017 Lemote, Inc.

It's 2022 out of the window, are you sure this code wasn't changed
for 5 years?!

...

> +#include <linux/io.h>
> +#include <linux/err.h>
> +#include <linux/i2c.h>
> +#include <linux/acpi.h>
> +#include <linux/delay.h>
> +#include <linux/module.h>
> +#include <linux/completion.h>
> +#include <linux/platform_device.h>

Keep it sorted.

Also check the headers, the rule of thumb is to include headers you are direct
user of, excluding the ones that are guaranteed to be included by already
mentioned.

...

> +#define I2C_MAX_RETRIES		5

No namespace?

...

> +#define I2C_CLK_RATE_50M	(50 * 1000000)

HZ_PER_MHZ

...

> +#define i2c_readb(addr)		readb(dev->base + addr)
> +#define i2c_writeb(val, addr)	writeb(val, dev->base + addr)

No namespace? What is the usefulness of these macros taking into consideration
that:
 - they are macros and not inliners
 - they missed the used parameter

...

> +struct ls2x_i2c_dev {
> +	unsigned int		suspended:1;
> +	struct device		*dev;
> +	void __iomem		*base;
> +	int			irq;
> +	u32			bus_clk_rate;
> +	struct completion	cmd_complete;
> +	struct i2c_adapter	adapter;

You may save a few bytes of code if you put the first member the one that is
used a lot in the pointer arithmetics or performance-wise. You may check the
result with bloat-o-meter.

> +};

> +static void i2c_stop(struct ls2x_i2c_dev *dev)
> +{
> +again:
> +	i2c_writeb(LS2X_I2C_CMD_STOP, LS2X_I2C_CR_REG);
> +	wait_for_completion(&dev->cmd_complete);
> +
> +	i2c_readb(LS2X_I2C_SR_REG);
> +
> +	while (i2c_readb(LS2X_I2C_SR_REG) & LS2X_I2C_SR_BUSY)
> +		goto again;
> +}

Can't you refactor to avoid label?

...

> +static int ls2x_i2c_start(struct ls2x_i2c_dev *dev,
> +		     int dev_addr, int flags)
> +{
> +	int retry = I2C_MAX_RETRIES;
> +	unsigned char addr = (dev_addr & 0x7f) << 1;

> +	addr |= (flags & I2C_M_RD) ? 1 : 0;

NIH: i2c_8bit_addr_from_msg() ?

> +start:
> +	mdelay(1);
> +	i2c_writeb(addr, LS2X_I2C_TXR_REG);
> +	dev_dbg(dev->dev, "%s <line%d>: i2c device address: 0x%x\n",
> +			__func__, __LINE__, addr);

No need to have __func__, __LINE__, etc. First of all, these are available via
Dynamic Debug. Second, using those mean the lack of uniqueness of the message
test, make it more unique instead.

> +
> +	i2c_writeb((LS2X_I2C_CMD_START | LS2X_I2C_CMD_WRITE),
> +			LS2X_I2C_CR_REG);
> +	wait_for_completion(&dev->cmd_complete);
> +
> +	if (i2c_readb(LS2X_I2C_SR_REG) & LS2X_I2C_SR_NOACK) {
> +		i2c_stop(dev);
> +		while (retry--)

> +			goto start;

Try to refactor your code to avoid using too many labels here and there.

> +		dev_info(dev->dev, "There is no i2c device ack\n");
> +		return 0;
> +	}
> +
> +	return 1;
> +}

...

> +	u16 val = 0x12c;

Magic!

...

> +	i2c_writeb(val & 0xff, LS2X_I2C_PRER_LO_REG);
> +	i2c_writeb((val & 0xff00) >> 8, LS2X_I2C_PRER_HI_REG);

Redundant '& 0xff...' parts. Besides that, is there any HW limitation of using
16-bit writes?

...

> +	i2c_writeb(0xc0, LS2X_I2C_CTR_REG);

Magic!

It's enough for now, this code needs much more work, please take your time.


-- 
With Best Regards,
Andy Shevchenko


