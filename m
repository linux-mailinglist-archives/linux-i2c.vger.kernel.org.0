Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FEDA6623D3
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jan 2023 12:07:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234699AbjAILHS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Jan 2023 06:07:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230455AbjAILHR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Jan 2023 06:07:17 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BBC5D2FE;
        Mon,  9 Jan 2023 03:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673262436; x=1704798436;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PivH5brPCWV4adR16b5UTRwScK+2Zd+P4HCP3dlhWB4=;
  b=T2nM4If83mlWPLwdH8Ishd5MpehT5UDHG8DCxIzWpfm+GDGc+BfNjcst
   k5Af3fVJswJD/l3QIoWYpjfzXGVzPLho0soIjGfkkKnSz4XVYqYA+tgRk
   Fm5idxEwKZIcIqRzAl/fmBGafvbYD2fioLsChTAtOFaXYVjwiEW3/3CXq
   5em/k/gQZyDb9ZFBYiHwdlt+BhqyKrte8XQeNQF49ZX29YmYrRld/oc9U
   g4L8dVpkNwLm4RK7LvCjrNk1/6x/an3aNMQ4Bmqf5oaJwIaYuWE9yvIsM
   eiIiqSCbdUCBAJzcD++lKRwbwzQ/6h3zJMzTO8yd/gq2+kGUGv2S0Ir5p
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="324856032"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="324856032"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2023 03:07:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10584"; a="780652007"
X-IronPort-AV: E=Sophos;i="5.96,311,1665471600"; 
   d="scan'208";a="780652007"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 09 Jan 2023 03:07:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pEpze-006MFL-1N;
        Mon, 09 Jan 2023 13:07:06 +0200
Date:   Mon, 9 Jan 2023 13:07:06 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Shawn Tu <shawnx.tu@intel.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v6 7/8] media: i2c: add DS90UB913 driver
Message-ID: <Y7v1Wrma/Ev8KEzy@smile.fi.intel.com>
References: <20230105140307.272052-1-tomi.valkeinen@ideasonboard.com>
 <20230105140307.272052-8-tomi.valkeinen@ideasonboard.com>
 <Y7pBSq49dL8Fzxsc@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7pBSq49dL8Fzxsc@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Jan 08, 2023 at 06:06:34AM +0200, Laurent Pinchart wrote:
> On Thu, Jan 05, 2023 at 04:03:06PM +0200, Tomi Valkeinen wrote:

...

> > +	scnprintf(priv->gpio_chip_name, sizeof(priv->gpio_chip_name), "%s",
> > +		  dev_name(dev));
> 
> I think you can use strscpy().

Actually I'm not sure we even need that variable. What is the lifetime of
the dev and gc? I believe they are the same or gc's one is shorter, hence
dev_name() can be used directly, no?

...

> > +	gc->of_node = priv->client->dev.of_node;

We don't have of_node anymore in gc. And if the parent device is set, you can
drop this line (it will work with older and newer kernels. Otherwise, use
fwnode.

...

> > +	ret = gpiochip_add_data(gc, priv);
> > +	if (ret) {
> > +		dev_err(dev, "Failed to add GPIOs: %d\n", ret);

> > +		return ret;
> > +	}
> > +
> > +	return 0;

return ret;

...

> > +	ep_node = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);

Why this can't be fwnode_handle from day 1?

> > +	if (!ep_node) {
> > +		dev_err(dev, "No graph endpoint\n");
> > +		return -ENODEV;
> > +	}

...

> > +	ep_np = of_graph_get_endpoint_by_regs(np, 0, 0);
> > +	if (!ep_np) {
> > +		dev_err(dev, "OF: no endpoint\n");
> > +		return -ENOENT;
> > +	}

Ditto.

> > +	ret = of_property_read_u32(ep_np, "pclk-sample", &priv->pclk_polarity);
> > +
> > +	of_node_put(ep_np);

Ditto.

...

> > +		return ret;
> > +	}
> > +
> > +	return 0;

return ret;

...

> > +	priv->plat_data = dev_get_platdata(&client->dev);
> > +	if (!priv->plat_data) {
> > +		dev_err(dev, "Platform data missing\n");
> > +		return -ENODEV;

	return dev_err_probe(...); ?

> > +	}

...

> > +	priv->regmap = devm_regmap_init_i2c(client, &ub913_regmap_config);
> > +	if (IS_ERR(priv->regmap)) {
> > +		dev_err(dev, "Failed to init regmap\n");
> > +		return PTR_ERR(priv->regmap);

Ditto?

> > +	}

...

> > +#ifdef CONFIG_OF
> 
> The driver depends on CONFIG_OF so I would drop this, as well as the
> of_match_ptr().

Even if there is no OF dependency, these ugly ifdeffery with of_match_ptr()
are error prone (compilation wise).

...

> > +static const struct of_device_id ub913_dt_ids[] = {
> > +	{ .compatible = "ti,ds90ub913a-q1", },

Inner comma is not needed.

> > +	{}
> > +};

...

> > +static struct i2c_driver ds90ub913_driver = {
> > +	.probe_new	= ub913_probe,
> > +	.remove		= ub913_remove,
> > +	.id_table	= ub913_id,
> > +	.driver = {
> > +		.name	= "ds90ub913a",

> > +		.owner = THIS_MODULE,

This is something like for 5+ years is not needed, as the below macro sets it
for you.

> > +		.of_match_table = of_match_ptr(ub913_dt_ids),
> > +	},
> > +};

> > +

Redundant blank line.

> > +module_i2c_driver(ds90ub913_driver);

-- 
With Best Regards,
Andy Shevchenko


