Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 70970563FE7
	for <lists+linux-i2c@lfdr.de>; Sat,  2 Jul 2022 13:52:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232235AbiGBLvs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 2 Jul 2022 07:51:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbiGBLvr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 2 Jul 2022 07:51:47 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EB7612747;
        Sat,  2 Jul 2022 04:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1656762707; x=1688298707;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DUWQkgDXSBjXInTNrTsnLHeuwATTU2HaurRnr7VRUTo=;
  b=IHrU393rk+acoa/CEbEdni6xE83Ws/lWyT/9X0n4a/6GfpQkAlXtrPP3
   2xFtvtiaGCdyBHhuZdrrkESTfWZzHkcrKW+rZI8rDKN9gA5iaXImUerli
   e7ZADf32B483k/HOA8+DeA7EAajA1vCuucDrKW9ZfiBKT7kcRGNydhrYo
   EggvcqWLTm7W/P4So25Qd4xjQGu/bURYKrvxhdOYAEcgiHkdBBsiBO+jC
   RIMwMOXC0lKp8dKjPZtHI30RjSAbnWst4geHbcSsaUljVp7L4kc7QvWHK
   V3LQ8tdRifV/6Uzgo0D0p9wg8EETdv4QUf+vNPrL7t536atz6M0VP/ryD
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10395"; a="265854144"
X-IronPort-AV: E=Sophos;i="5.92,239,1650956400"; 
   d="scan'208";a="265854144"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2022 04:51:46 -0700
X-IronPort-AV: E=Sophos;i="5.92,239,1650956400"; 
   d="scan'208";a="734337677"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2022 04:51:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1o7bf1-0013aN-06;
        Sat, 02 Jul 2022 14:51:39 +0300
Date:   Sat, 2 Jul 2022 14:51:38 +0300
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
Subject: Re: [PATCH v3 2/2] i2c: Add Renesas RZ/V2M controller
Message-ID: <YsAxSrcAk4jtRYx4@smile.fi.intel.com>
References: <20220701163916.111435-1-phil.edworthy@renesas.com>
 <20220701163916.111435-3-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220701163916.111435-3-phil.edworthy@renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jul 01, 2022 at 05:39:16PM +0100, Phil Edworthy wrote:
> Yet another i2c controller from Renesas that is found on the RZ/V2M
> (r9a09g011) SoC. It can support only 100kHz and 400KHz operation.

...

> +		/* 10-bit address
> +		 *   addr_1: 5'b11110 | addr[9:8] | (R/nW)
> +		 *   addr_2: addr[7:0]
> +		 */

/*
 * Multi-line comments should be
 * formatted like in this example.
 * (Of course use as much space up
 * to 80 as possible.)
 */

Ditto for other done in similar way, if any.

...

> +		addr = 0xf0 | ((msg->addr >> 7) & 0x06);

GENMASK() ?

...

> +	if (!ret) {
> +		if (read)
> +			ret = rzv2m_i2c_receive(priv, msg, &count);
> +		else
> +			ret = rzv2m_i2c_send(priv, msg, &count);

> +		if ((!ret) && stop)

Too many parentheses.

> +			ret = rzv2m_i2c_stop_condition(priv);
> +	}

...

> +		ret = rzv2m_i2c_master_xfer1(priv, &msgs[i], (i == (num - 1)));

Too many parentheses.

> +		if (ret < 0)
> +			goto out;

...

> +static const struct of_device_id rzv2m_i2c_ids[] = {
> +	{ .compatible = "renesas,rzv2m-i2c" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, rzv2m_i2c_ids);

This can be moved after the ->probe() closer to the actual user of the table.

...

> +	priv = devm_kzalloc(dev, sizeof(struct rzv2m_i2c_priv), GFP_KERNEL);

sizeof(*priv)

> +	if (!priv)
> +		return -ENOMEM;

...

> +static int rzv2m_i2c_suspend(struct device *dev)
> +{
> +	struct rzv2m_i2c_priv *priv = dev_get_drvdata(dev);

> +	pm_runtime_get_sync(dev);

Isn't guaranteed by the runtime PM that device is runtime powered on the system
suspend?

> +	bit_clrl(priv->base + IICB0CTL0, IICB0IICE);
> +	pm_runtime_put(dev);
> +
> +	return 0;
> +}

...

> +static int rzv2m_i2c_resume(struct device *dev)
> +{
> +	struct rzv2m_i2c_priv *priv = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = rzv2m_i2c_clock_calculate(dev, priv);
> +	if (ret < 0)
> +		return ret;
> +
> +	pm_runtime_get_sync(dev);

I'm not sure how it's suppose to work. Isn't it a no-op here?

> +	rzv2m_i2c_init(priv);
> +	pm_runtime_put(dev);
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko


