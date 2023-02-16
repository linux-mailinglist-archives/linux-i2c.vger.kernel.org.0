Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96785699943
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Feb 2023 16:53:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbjBPPxb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Feb 2023 10:53:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229619AbjBPPxa (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Feb 2023 10:53:30 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CB242BECD;
        Thu, 16 Feb 2023 07:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676562809; x=1708098809;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nvFnYQhBM6AsN1aQX5eEUPIkHbXda++tJkSBfAs4g8Y=;
  b=CHmSyBh7M2bmxX3OWBKfLHAVpO2tjBYwGNy3MyDpuBjPDRhk7t35RG9V
   2KyozEr5DrpoR5BxN1mG27lphYcpHKuo2iiVlzrz8zygeHfne2AAPKDj0
   2wTTZChOCOnfv+mLpxxrZ/PvOWQvu6tizrFwJIxl+ayHnyXpw1Ej8FjHe
   Ze5/uds1x4lCccU39XTARXBd4Z2nBrMwIGWd80ia3B3ALxCii7QixvlLo
   fuYiTeFW4utkjw8BjHtcI+cxHgIPEqdV56/RZ17/IqopjocR3npTWrDuh
   oCE7Pcovbzntt9q4Prf066onVpI3+vSkkbcifSQ+Kct+fP3FxXyCHsTD/
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="331747255"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="331747255"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 07:53:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="647730615"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="647730615"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 16 Feb 2023 07:53:22 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pSgZT-007qTt-1K;
        Thu, 16 Feb 2023 17:53:19 +0200
Date:   Thu, 16 Feb 2023 17:53:19 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
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
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>
Subject: Re: [PATCH v9 0/8] i2c-atr and FPDLink
Message-ID: <Y+5Rb17FTG4IxcE0@smile.fi.intel.com>
References: <20230216140747.445477-1-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216140747.445477-1-tomi.valkeinen@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Feb 16, 2023 at 04:07:39PM +0200, Tomi Valkeinen wrote:

...

> +	if (!c2a)

I would expect here dev_warn() to let user know about "shouldn't happened, but
have happened" situation.

> +		return; /* This shouldn't happen */

...

> -	static const struct v4l2_mbus_framefmt format = {
> +	static const struct v4l2_mbus_framefmt informat = {

Naming a bit confusing. Is it "information" that cut or what?

in_format

> +	static const struct v4l2_mbus_framefmt outformat = {

out_format

...

> -out_unlock:
> +out:

Why?

...

> +/*
> + * (Possible) TODOs

TODOs:

> + *
> + * - PM for serializer and remote peripherals. We need to manage:
> + *   - VPOC
> + *     - Power domain? Regulator? Somehow any remote device should be able to
> + *       cause the VPOC to be turned on.
> + *   - Link between the deserializer and the serializer
> + *     - Related to VPOC management. We probably always want to turn on the VPOC
> + *       and then enable the link.
> + *   - Serializer's services: i2c, gpios, power
> + *     - The serializer needs to resume before the remote peripherals can
> + *       e.g. use the i2c.
> + *     - How to handle gpios? Reserving a gpio essentially keeps the provider
> + *       (serializer) always powered on.
> + * - Do we need a new bus for the FPD-Link? At the moment the serializers
> + *   are children of the same i2c-adapter where the deserializer resides.
> + * - i2c-atr could be made embeddable instead of allocatable.
> + */

...

>  struct atr_alias_table_entry {
>  	u16 alias_id;	/* Alias ID from DT */
>  
> -	bool reserved;
> +	bool in_use;
>  	u8 nport;
>  	u8 slave_id;	/* i2c client's local i2c address */
>  	u8 port_reg_idx;

Wouldn't be wiser to move boolean at the end so if any obscure
architecture/compiler makes it longer than a byte it won't increase the memory
footprint. (Actually wouldn't it be aligned to u16 followed by u8 as well as
they are different types?)

>  };

...

> +static int ub960_read16(struct ub960_data *priv, u8 reg, u16 *val)
> +{
> +	struct device *dev = &priv->client->dev;
> +	unsigned int v1, v2;
> +	int ret;
> +
> +	mutex_lock(&priv->reg_lock);
> +
> +	ret = regmap_read(priv->regmap, reg, &v1);
> +	if (ret) {
> +		dev_err(dev, "%s: cannot read register 0x%02x (%d)!\n",
> +			__func__, reg, ret);
> +		goto out_unlock;
> +	}
> +
> +	ret = regmap_read(priv->regmap, reg + 1, &v2);
> +	if (ret) {
> +		dev_err(dev, "%s: cannot read register 0x%02x (%d)!\n",
> +			__func__, reg + 1, ret);
> +		goto out_unlock;
> +	}

Wondering why bulk read can't be used against properly typed __be16 variable?

> +	*val = (v1 << 8) | v2;

+ be16_to_cpu() here.

> +out_unlock:
> +	mutex_unlock(&priv->reg_lock);
> +
> +	return ret;
> +}

...

> +static int ub960_rxport_read16(struct ub960_data *priv, u8 nport, u8 reg,
> +			       u16 *val)
>  {

Ditto.

> +}

...

>  	struct i2c_board_info ser_info = {
> -		.of_node = to_of_node(rxport->remote_fwnode),
> -		.fwnode = rxport->remote_fwnode,

> +		.of_node = to_of_node(rxport->ser.fwnode),
> +		.fwnode = rxport->ser.fwnode,

Why do you need to have both?!

>  		.platform_data = ser_pdata,
>  	};

...

> +	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {

Pre-increment is non-standard in the kernel.

> +		struct ub960_rxport *rxport = priv->rxports[nport];
> +		struct v4l2_mbus_frame_desc desc;
> +		int ret;
> +		u8 cur_vc;
> +
> +		if (!rxport)
> +			continue;
> +
> +		ret = v4l2_subdev_call(rxport->source.sd, pad, get_frame_desc,
> +				       rxport->source.pad, &desc);
> +		if (ret)
> +			return ret;
> +
> +		if (desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
> +			continue;

		cur_vc = desc.entry[0].bus.csi2.vc;

> +		for (i = 0; i < desc.num_entries; ++i) {
> +			u8 vc = desc.entry[i].bus.csi2.vc;

> +			if (i == 0) {
> +				cur_vc = vc;
> +				continue;
> +			}

This is an invariant to the loop, see above.

> +			if (vc == cur_vc)
> +				continue;
> +
> +			dev_err(&priv->client->dev,
> +				"rx%u: source with multiple virtual-channels is not supported\n",
> +				nport);
> +			return -ENODEV;
> +		}
> +	}

...

> +	for (i = 0; i < 6; ++i)
>  		ub960_read(priv, UB960_SR_FPD3_RX_ID(i), &id[i]);
>  	id[6] = 0;

Wondering if this magic can be defined.

...

> +	priv->atr.aliases = devm_kcalloc(dev, table_size,
> +					 sizeof(struct atr_alias_table_entry),

	sizeof(*priv->atr.aliases) ?

> +					 GFP_KERNEL);
> +	if (!priv->atr.aliases)
>  		return -ENOMEM;

...

>  	if (ret) {
>  		if (ret != -EINVAL) {
> -			dev_err(dev,
> -				"rx%u: failed to read 'ti,strobe-pos': %d\n",
> -				nport, ret);
> +			dev_err(dev, "rx%u: failed to read '%s': %d\n", nport,
> +				"ti,strobe-pos", ret);
>  			return ret;
>  		}
>  	} else if (strobe_pos < UB960_MIN_MANUAL_STROBE_POS ||
> @@ -3512,8 +3403,8 @@ ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
>  	ret = fwnode_property_read_u32(link_fwnode, "ti,eq-level", &eq_level);
>  	if (ret) {
>  		if (ret != -EINVAL) {
> -			dev_err(dev, "rx%u: failed to read 'ti,eq-level': %d\n",
> -				nport, ret);
> +			dev_err(dev, "rx%u: failed to read '%s': %d\n", nport,
> +				"ti,eq-level", ret);
>  			return ret;
>  		}
>  	} else if (eq_level > UB960_MAX_EQ_LEVEL) {


Seems like you may do (in both cases) similar to the above:

	var = 0;
	ret = read_u32();
	if (ret && ret != -EINVAL) {
		// error handling
	}
	if (var > limit) {
		// another error handling
	}

...

> +	static const char *vpoc_names[UB960_MAX_RX_NPORTS] = { "vpoc0", "vpoc1",
> +							       "vpoc2", "vpoc3" };

Wouldn't be better to format it as

	static const char *vpoc_names[UB960_MAX_RX_NPORTS] = {
		"vpoc0", "vpoc1", "vpoc2", "vpoc3",
	};

?

-- 
With Best Regards,
Andy Shevchenko


