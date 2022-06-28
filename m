Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 47DEF55F030
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jun 2022 23:08:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230487AbiF1VI2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jun 2022 17:08:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbiF1VI1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 28 Jun 2022 17:08:27 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C620E22B12;
        Tue, 28 Jun 2022 14:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656450506; x=1687986506;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hbAuSvqmvICPt1eUjjwOf8UfFYjtvV+WwRG6YwRZ9+0=;
  b=gSYo3aLZbmhmd6ujfvrCY68VF5GGfubdoU8+TgzJqvpAaS6gJzdP+Oa2
   r8NaPLCGTIH8C22jHxu7gsFH7Y8fpI9raYkmzYUCGeNUXn6dg0/WCcmQf
   k0NlUfIIGRQ/VlLPj5XWg5p5aj7GV0MVQEfcCnsLXHIgZF/Ol4Zndk7LV
   dVep5wcS9z6kayyuC7fedLQFDd/6gLpMKQhH5PCGXBAN7DfuPKhb0pht/
   k8TLtWCK46fPYJbljeonsenWwAhV7N2lU4bV/r8fZdfCMlZKl+DMaz81n
   IcofJf302aqKp2/epL9mb1oUfaBo/Qi6h7mTmzJYF+q+aE09I/YbHtg/h
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="264888331"
X-IronPort-AV: E=Sophos;i="5.92,229,1650956400"; 
   d="scan'208";a="264888331"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2022 14:08:26 -0700
X-IronPort-AV: E=Sophos;i="5.92,229,1650956400"; 
   d="scan'208";a="732904960"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2022 14:08:22 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1o6IRW-000x9d-Fc;
        Wed, 29 Jun 2022 00:08:18 +0300
Date:   Wed, 29 Jun 2022 00:08:18 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Phil Edworthy <phil.edworthy@renesas.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        Wolfram Sang <wsa@kernel.org>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>, Sven Peter <sven@svenpeter.dev>,
        Jan Dabros <jsd@semihalf.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Tyrone Ting <kfting@nuvoton.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] i2c: Add Renesas RZ/V2M controller
Message-ID: <YrttwplV9zEgCFji@smile.fi.intel.com>
References: <20220628194526.111501-1-phil.edworthy@renesas.com>
 <20220628194526.111501-3-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220628194526.111501-3-phil.edworthy@renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, Jun 28, 2022 at 08:45:26PM +0100, Phil Edworthy wrote:
> Yet another i2c controller from Renesas that is found on the RZ/V2M
> (r9a09g011) SoC. It can support only 100kHz and 400KHz operation.

...

> +#include <linux/of_device.h>

No user of this header.

But missed mod_devicetable.h (Okay, for I2C drivers we usually rely on i2c.h to
include it for us, but it's cleaner to include directly).

...

> +#define rzv2m_i2c_priv_to_dev(p)	((p)->adap.dev.parent)

It's longer than the actual expression. Why do you need this?!

...

> +static const struct bitrate_config bitrate_configs[] = {
> +	[RZV2M_I2C_100K] = { 47, 3450 },
> +	[RZV2M_I2C_400K] = { 52, 900},

Missed space.

> +};

...

> +	if (priv->iicb0wl > 0x3ff)

GENMASK() ?
Or (BIT(x) - 1) in case to tell that there is an HW limitation of x bits?

> +		return -EINVAL;

...

> +	if (priv->iicb0wh > 0x3ff)

Ditto.

> +		return -EINVAL;

...

> +	if (!last) {

Why not positive conditional?

> +	} else {

> +	}

...

> +static int rzv2m_i2c_send(struct rzv2m_i2c_priv *priv, struct i2c_msg *msg,
> +			  unsigned int *count)
> +{
> +	unsigned int i;
> +	int ret = 0;

Redundant assignment, you may return 0 directly.
Ditto for other similar cases in other functions.

> +	for (i = 0; i < msg->len; i++) {
> +		ret = rzv2m_i2c_write_with_ack(priv, msg->buf[i]);
> +		if (ret < 0)
> +			return ret;
> +	}
> +	*count = i;
> +
> +	return ret;
> +}

...

> +		ret = rzv2m_i2c_read_with_ACK(priv, &msg->buf[i],
> +					      ((msg->len - 1) == i));

Too many parentheses.

> +		if (ret < 0)
> +			return ret;

...

> +static int rzv2m_i2c_send_address(struct rzv2m_i2c_priv *priv,
> +				  struct i2c_msg *msg)
> +{
> +	u32 addr;
> +	int ret;
> +
> +	if (msg->flags & I2C_M_TEN) {
> +		/* 10-bit address
> +		 *   addr_1: 5'b11110 | addr[9:8] | (R/nW)
> +		 *   addr_2: addr[7:0]
> +		 */
> +		addr = 0xf0 | ((msg->addr >> 7) & 0x06);
> +		addr |= !!(msg->flags & I2C_M_RD);
> +		/* Send 1st address(extend code) */
> +		ret = rzv2m_i2c_write_with_ack(priv, addr);

	if (ret)
		return ret;

> +		if (ret == 0) {
> +			/* Send 2nd address */
> +			ret = rzv2m_i2c_write_with_ack(priv, msg->addr & 0xff);
> +		}
> +	} else {
> +		/* 7-bit address */
> +		addr = i2c_8bit_addr_from_msg(msg);
> +		ret = rzv2m_i2c_write_with_ack(priv, addr);
> +	}
> +
> +	return ret;
> +}

...

> +	ret = rzv2m_i2c_send_address(priv, msg);
> +	if (ret == 0) {

This is a bit confusing if it's only comparison with "no error code" condition.
Use if (!ret) if there is no meaning of positive value. Same applies to other
cases in the code.

> +		if (read)
> +			ret = rzv2m_i2c_receive(priv, msg, &count);
> +		else
> +			ret = rzv2m_i2c_send(priv, msg, &count);
> +
> +		if ((ret == 0) && stop)

Like here.

> +			ret = rzv2m_i2c_stop_condition(priv);
> +	}

...

> +static const struct of_device_id rzv2m_i2c_ids[] = {
> +	{ .compatible = "renesas,rzv2m-i2c", },

Inner comma is not needed.

> +	{ }
> +};

...

> +	priv->clk = devm_clk_get(dev, NULL);
> +	if (IS_ERR(priv->clk)) {
> +		dev_err_probe(dev, PTR_ERR(priv->clk), "Can't get clock\n");
> +		return PTR_ERR(priv->clk);
> +	}

Why not

	return dev_err_probe(...);

?

Ditto for the rest cases like this.

...

> +	adap->dev.of_node = dev->of_node;

device_set_node()


-- 
With Best Regards,
Andy Shevchenko


