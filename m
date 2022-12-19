Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B728D650C61
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Dec 2022 14:04:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231531AbiLSNEZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Dec 2022 08:04:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231158AbiLSNEY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Dec 2022 08:04:24 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84E911151;
        Mon, 19 Dec 2022 05:04:23 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="299019040"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; 
   d="scan'208";a="299019040"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2022 05:04:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="774922088"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; 
   d="scan'208";a="774922088"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 19 Dec 2022 05:04:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1p7FoM-00CISa-1q;
        Mon, 19 Dec 2022 15:04:06 +0200
Date:   Mon, 19 Dec 2022 15:04:06 +0200
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
Subject: Re: [PATCH V7 3/4] i2c: ls2x: Add driver for Loongson-2K/LS7A I2C
 controller
Message-ID: <Y6BhRsPAU30Dqbdv@smile.fi.intel.com>
References: <cover.1671451604.git.zhoubinbin@loongson.cn>
 <d44eb07245020431f98fd08e0c05b6926fb31b24.1671451604.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d44eb07245020431f98fd08e0c05b6926fb31b24.1671451604.git.zhoubinbin@loongson.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Dec 19, 2022 at 08:28:33PM +0800, Binbin Zhou wrote:
> This I2C module is integrated into the Loongson-2K SoCs and Loongson
> LS7A bridge chip.

Almost there, see my comments below (note, you have ~1w of time before this
can be applied anyway, so take you time for carefully addressing comments,
(re-)testing, etc.).

...

> @@ -888,6 +888,17 @@ config I2C_OWL
>  	  Say Y here if you want to use the I2C bus controller on
>  	  the Actions Semiconductor Owl SoC's.
>  
> +config I2C_LS2X

I believe in Latin alphabet L goes before O...

> +	tristate "Loongson LS2X I2C adapter"
> +	depends on MACH_LOONGSON64 || COMPILE_TEST
> +	help
> +	  If you say yes to this option, support will be included for the
> +	  I2C interface on the Loongson-2K SoCs and Loongson LS7A bridge
> +	  chip.
> +
> +	  This driver can also be built as a module. If so, the module
> +	  will be called i2c-ls2x.
> +
>  config I2C_PASEMI
>  	tristate "PA Semi SMBus interface"
>  	depends on PPC_PASEMI && PCI

...

>  obj-$(CONFIG_I2C_MXS)		+= i2c-mxs.o
>  obj-$(CONFIG_I2C_NOMADIK)	+= i2c-nomadik.o
>  obj-$(CONFIG_I2C_NPCM)		+= i2c-npcm7xx.o
> +obj-$(CONFIG_I2C_LS2X)		+= i2c-ls2x.o

...and even before n and m.

>  obj-$(CONFIG_I2C_OCORES)	+= i2c-ocores.o
>  obj-$(CONFIG_I2C_OMAP)		+= i2c-omap.o
>  obj-$(CONFIG_I2C_OWL)		+= i2c-owl.o

...

> +static int ls2x_i2c_xfer_one(struct i2c_adapter *adap,
> +			     struct i2c_msg *msg, bool stop)
> +{
> +	int ret;
> +	bool is_read = msg->flags & I2C_M_RD;
> +	struct ls2x_i2c_priv *priv = i2c_get_adapdata(adap);
> +
> +	/* Contains steps to send start condition and address */
> +	ret = ls2x_i2c_start(adap, msg);
> +	if (!ret) {
> +		if (is_read)
> +			ret = ls2x_i2c_rx(adap, msg->buf, msg->len);
> +		else
> +			ret = ls2x_i2c_tx(adap, msg->buf, msg->len);

> +		if (!ret && stop)
> +			ret = ls2x_i2c_stop(adap);

So, we will send stop here...

> +	}

> +	if (ret == -ENXIO)
> +		ls2x_i2c_stop(adap);

...and if it fails, we send it again here. Is it okay?

> +	else if (ret < 0)
> +		ls2x_i2c_init(priv);
> +
> +	return ret;
> +}

...

> +		ret = ls2x_i2c_xfer_one(adap, msg, msg == (emsg - 1));

Too many parentheses, isn't it?

> +		if (ret)
> +			return ret;

...

> +	r = devm_request_irq(dev, irq, ls2x_i2c_isr, IRQF_SHARED, "ls2x-i2c",
> +			     priv);

Everywhere else you use 'ret', why is 'r' here?

> +	if (r < 0)
> +		return dev_err_probe(dev, r, "Unable to request irq %d\n", irq);

-- 
With Best Regards,
Andy Shevchenko


