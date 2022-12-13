Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D999A64B7ED
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Dec 2022 15:58:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235511AbiLMO6R (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 13 Dec 2022 09:58:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236021AbiLMO6R (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 13 Dec 2022 09:58:17 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C91F2209BC;
        Tue, 13 Dec 2022 06:58:15 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="319289491"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; 
   d="scan'208";a="319289491"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2022 06:58:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10559"; a="598822601"
X-IronPort-AV: E=Sophos;i="5.96,241,1665471600"; 
   d="scan'208";a="598822601"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 13 Dec 2022 06:58:10 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1p56jN-009KZE-2N;
        Tue, 13 Dec 2022 16:58:05 +0200
Date:   Tue, 13 Dec 2022 16:58:05 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, loongarch@lists.linux.dev,
        devicetree@vger.kernel.org, Huacai Chen <chenhuacai@loongson.cn>,
        WANG Xuerui <kernel@xen0n.name>, Arnd Bergmann <arnd@arndb.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jianmin Lv <lvjianmin@loongson.cn>
Subject: Re: [PATCH V6 3/4] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C
 controller
Message-ID: <Y5iS/ReDrO3B4Ksl@smile.fi.intel.com>
References: <cover.1670897253.git.zhoubinbin@loongson.cn>
 <bf55d05a50dc1e9453d124033ff368e9500ed4ed.1670897253.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bf55d05a50dc1e9453d124033ff368e9500ed4ed.1670897253.git.zhoubinbin@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Dec 13, 2022 at 04:26:57PM +0800, Binbin Zhou wrote:
> This I2C module is integrated into the Loongson-2K SoCs and Loongson
> LS7A bridge chip.

...

> +// SPDX-License-Identifier: GPL-2.0

GPL-2.0-only

> +/*
> + * Loongson-2K/Loongson LS7A I2C master mode driver
> + *
> + * Copyright (C) 2013 Loongson Technology Corporation Limited.
> + * Copyright (C) 2014-2017 Lemote, Inc.
> + * Copyright (C) 2018-2022 Loongson Technology Corporation Limited.
> + *
> + * Originally written by liushaozong

> + *

No need to have this blank line.

> + * Rewritten for mainline by Binbin Zhou <zhoubinbin@loongson.cn>
> + */

...

> +#include <linux/bits.h>
> +#include <linux/completion.h>
> +#include <linux/device.h>
> +#include <linux/i2c.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/platform_device.h>

+ property.h at least for dev_fwnode().

> +#include <linux/units.h>

...

> +#define I2C_LS2X_PRER_LO	0x0 /* Freq Division Low Byte Register */
> +#define I2C_LS2X_PRER_HI	0x1 /* Freq Division High Byte Register */

_HI is not used, can we just drop the suffix?

...

> +struct ls2x_i2c_priv {

> +	struct i2c_adapter	adapter;

> +	struct device		*dev;

In some cases you are using adapter.dev, in some this one.
Also isn't it the dev is the same as adapter.dev.parent?

Hence, why do you need this one?

> +	void __iomem		*base;
> +	struct i2c_timings	i2c_t;
> +	struct completion	cmd_complete;
> +};

...

> +	return ls2x_i2c_send_byte(adap, (LS2X_CR_START | LS2X_CR_WRITE));

Too many parentheses.

...

> +static int ls2x_i2c_xfer_one(struct i2c_adapter *adap,
> +			     struct i2c_msg *msg, bool stop)
> +{
> +	int ret;
> +	bool is_read = msg->flags & I2C_M_RD;
> +
> +	/* Contains steps to send start condition and address */
> +	ret = ls2x_i2c_start(adap, msg);
> +	if (ret)
> +		return ret;
> +
> +	if (is_read)
> +		ret = ls2x_i2c_rx(adap, msg->buf, msg->len);
> +	else
> +		ret = ls2x_i2c_tx(adap, msg->buf, msg->len);
> +
> +	/* could not acquire bus. bail out without STOP */
> +	if (ret == -EAGAIN)
> +		return ret;

So, if ret is *not* 0 and *not* --EAGAIN, why don't we bail out here? It needs
at least a comment.

> +	if (stop)
> +		ret = ls2x_i2c_stop(adap);
> +
> +	return ret;
> +}

...

> +static int ls2x_i2c_master_xfer(struct i2c_adapter *adap,
> +				struct i2c_msg *msgs, int num)
> +{
> +	int ret;
> +	struct i2c_msg *msg, *emsg = msgs + num;
> +
> +	for (msg = msgs; msg < emsg; msg++) {
> +		/* Emit STOP if it is the last message or I2C_M_STOP is set */

> +		bool stop = (msg + 1 == emsg) || (msg->flags & I2C_M_STOP);

I'm wondering if we can always set the _STOP bit in the flags of the last
message before entering this loop. In such case you can reduce to one part
and supply as a parameter directly.

> +
> +		ret = ls2x_i2c_xfer_one(adap, msg, stop);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return num;
> +}

...

> +	/* Calculate and set LS2X I2C frequency */
> +	writel(LS2X_I2C_PCLK_FREQ / (5 * t->bus_freq_hz) - 1,
> +	       priv->base + I2C_LS2X_PRER_LO);

writel()?! Shouldn't be writew()?

...

> +	r = devm_request_irq(dev, irq, ls2x_i2c_isr,
> +			     IRQF_SHARED, "ls2x-i2c", priv);

There is a room on the previous line for at least one more argument.

> +	if (r < 0)
> +		return dev_err_probe(dev, r, "Unable to request irq %d\n", irq);

...

> +subsys_initcall(ls2x_i2c_init_driver);

Non-standard init calls should be commented.

-- 
With Best Regards,
Andy Shevchenko


