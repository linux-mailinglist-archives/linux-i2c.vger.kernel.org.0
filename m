Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D2D0E662661
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jan 2023 14:02:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236830AbjAINCf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Jan 2023 08:02:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233331AbjAINCM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Jan 2023 08:02:12 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4A991758A;
        Mon,  9 Jan 2023 04:59:21 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 601AE6CF;
        Mon,  9 Jan 2023 13:59:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673269145;
        bh=b5YGXWGHoxTUNR2lz6oATrp9StnnDmiege+b+Kt/YnM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=KrH5T+bybl6PE8El4Qq1rEpTueK/bkk15n6q/dYt+2CCW0oOYqStD7LHyJcRbxi6G
         37+ZbEVMVSqdYp6qu+ZipXAK+VAB6FQ1ZIg+OKLPORNMFGVf2ZAJA/cD8WQF6/+7NP
         eAcl919tiZ4bUQDh7hlGbfP4FMT9mgdx8LhGVyPU=
Message-ID: <5173a16a-83c5-5cfe-f6ce-03e1c90e8790@ideasonboard.com>
Date:   Mon, 9 Jan 2023 14:59:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v6 7/8] media: i2c: add DS90UB913 driver
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
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
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>
References: <20230105140307.272052-1-tomi.valkeinen@ideasonboard.com>
 <20230105140307.272052-8-tomi.valkeinen@ideasonboard.com>
 <Y7pBSq49dL8Fzxsc@pendragon.ideasonboard.com>
 <Y7v1Wrma/Ev8KEzy@smile.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y7v1Wrma/Ev8KEzy@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 09/01/2023 13:07, Andy Shevchenko wrote:
> On Sun, Jan 08, 2023 at 06:06:34AM +0200, Laurent Pinchart wrote:
>> On Thu, Jan 05, 2023 at 04:03:06PM +0200, Tomi Valkeinen wrote:
> 
> ...
> 
>>> +	scnprintf(priv->gpio_chip_name, sizeof(priv->gpio_chip_name), "%s",
>>> +		  dev_name(dev));
>>
>> I think you can use strscpy().
> 
> Actually I'm not sure we even need that variable. What is the lifetime of
> the dev and gc? I believe they are the same or gc's one is shorter, hence
> dev_name() can be used directly, no?

I think this is a valid point, no need for the extra variable afaics.

> ...
> 
>>> +	gc->of_node = priv->client->dev.of_node;
> 
> We don't have of_node anymore in gc. And if the parent device is set, you can
> drop this line (it will work with older and newer kernels. Otherwise, use
> fwnode.

What do you mean "we don't have of_node anymore"?

> ...
> 
>>> +	ret = gpiochip_add_data(gc, priv);
>>> +	if (ret) {
>>> +		dev_err(dev, "Failed to add GPIOs: %d\n", ret);
> 
>>> +		return ret;
>>> +	}
>>> +
>>> +	return 0;
> 
> return ret;

I'm not a fan of that style. I like my error handling ifs to return the 
error inside the if block, and a successful function ends in a "return 0".

> ...
> 
>>> +	ep_node = of_graph_get_endpoint_by_regs(dev->of_node, 0, 0);
> 
> Why this can't be fwnode_handle from day 1?

I guess it can. It's an old driver and there has been no need to convert 
to fwnode, so we're still using OF.

>>> +	if (!ep_node) {
>>> +		dev_err(dev, "No graph endpoint\n");
>>> +		return -ENODEV;
>>> +	}
> 
> ...
> 
>>> +	ep_np = of_graph_get_endpoint_by_regs(np, 0, 0);
>>> +	if (!ep_np) {
>>> +		dev_err(dev, "OF: no endpoint\n");
>>> +		return -ENOENT;
>>> +	}
> 
> Ditto.
> 
>>> +	ret = of_property_read_u32(ep_np, "pclk-sample", &priv->pclk_polarity);
>>> +
>>> +	of_node_put(ep_np);
> 
> Ditto.
> 
> ...
> 
>>> +		return ret;
>>> +	}
>>> +
>>> +	return 0;
> 
> return ret;
> 
> ...
> 
>>> +	priv->plat_data = dev_get_platdata(&client->dev);
>>> +	if (!priv->plat_data) {
>>> +		dev_err(dev, "Platform data missing\n");
>>> +		return -ENODEV;
> 
> 	return dev_err_probe(...); ?

Isn't the idea with dev_err_probe to use it where -EPROBE_DEFER might be 
the error? That's not the case here.

Buuut reading the relevant docs a bit more shows that it's actually 
recommended to be used in this kind of cases too, so you're right.

>>> +	}
> 
> ...
> 
>>> +	priv->regmap = devm_regmap_init_i2c(client, &ub913_regmap_config);
>>> +	if (IS_ERR(priv->regmap)) {
>>> +		dev_err(dev, "Failed to init regmap\n");
>>> +		return PTR_ERR(priv->regmap);
> 
> Ditto?
>
>>> +	}
> 
> ...
> 
>>> +#ifdef CONFIG_OF
>>
>> The driver depends on CONFIG_OF so I would drop this, as well as the
>> of_match_ptr().
> 
> Even if there is no OF dependency, these ugly ifdeffery with of_match_ptr()
> are error prone (compilation wise).
> 
> ...
> 
>>> +static const struct of_device_id ub913_dt_ids[] = {
>>> +	{ .compatible = "ti,ds90ub913a-q1", },
> 
> Inner comma is not needed.

Ok.

> 
>>> +	{}
>>> +};
> 
> ...
> 
>>> +static struct i2c_driver ds90ub913_driver = {
>>> +	.probe_new	= ub913_probe,
>>> +	.remove		= ub913_remove,
>>> +	.id_table	= ub913_id,
>>> +	.driver = {
>>> +		.name	= "ds90ub913a",
> 
>>> +		.owner = THIS_MODULE,
> 
> This is something like for 5+ years is not needed, as the below macro sets it
> for you.

Ok.

>>> +		.of_match_table = of_match_ptr(ub913_dt_ids),
>>> +	},
>>> +};
> 
>>> +
> 
> Redundant blank line.
> 
>>> +module_i2c_driver(ds90ub913_driver);
> 

  Tomi

