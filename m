Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8F8269A5DA
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Feb 2023 07:57:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229513AbjBQG5m (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Feb 2023 01:57:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjBQG5l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 17 Feb 2023 01:57:41 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3911893C5;
        Thu, 16 Feb 2023 22:57:39 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 473252D8;
        Fri, 17 Feb 2023 07:57:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676617056;
        bh=cppCOQZKoeslhFwvQz/NppDJENZu7/1sL8a90IxssXc=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=dYDGBY0xX5bDJ//gXOYrkwHYDjUjVRUt3JoiVtnFm7Dzl0x5y2gPtKDzrJeFkjcbe
         dFPrDOvK42er9dXWJSHccW114Eci5Ajzf4AQxoJmuf0qYaQvvlHpBo7PYNVVIxL30w
         Colok0VN53FrAA5iFYIfEtsCjF/8M32D6smuA4rA=
Message-ID: <e4141652-53c0-fce1-dac7-5da5368e2240@ideasonboard.com>
Date:   Fri, 17 Feb 2023 08:57:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v9 0/8] i2c-atr and FPDLink
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
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
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>
References: <20230216140747.445477-1-tomi.valkeinen@ideasonboard.com>
 <Y+5Rb17FTG4IxcE0@smile.fi.intel.com>
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y+5Rb17FTG4IxcE0@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 16/02/2023 17:53, Andy Shevchenko wrote:
> On Thu, Feb 16, 2023 at 04:07:39PM +0200, Tomi Valkeinen wrote:
> 
> ...
> 
>> +	if (!c2a)
> 
> I would expect here dev_warn() to let user know about "shouldn't happened, but
> have happened" situation.

Sure, I'll add.

>> +		return; /* This shouldn't happen */
> 
> ...
> 
>> -	static const struct v4l2_mbus_framefmt format = {
>> +	static const struct v4l2_mbus_framefmt informat = {
> 
> Naming a bit confusing. Is it "information" that cut or what?
> 
> in_format

Indeed, that's better.

>> +	static const struct v4l2_mbus_framefmt outformat = {
> 
> out_format
> 
> ...
> 
>> -out_unlock:
>> +out:
> 
> Why?

I think this was a mistake, I'll change it back.

> ...
> 
>> +/*
>> + * (Possible) TODOs
> 
> TODOs:

Ok...

>> + *
>> + * - PM for serializer and remote peripherals. We need to manage:
>> + *   - VPOC
>> + *     - Power domain? Regulator? Somehow any remote device should be able to
>> + *       cause the VPOC to be turned on.
>> + *   - Link between the deserializer and the serializer
>> + *     - Related to VPOC management. We probably always want to turn on the VPOC
>> + *       and then enable the link.
>> + *   - Serializer's services: i2c, gpios, power
>> + *     - The serializer needs to resume before the remote peripherals can
>> + *       e.g. use the i2c.
>> + *     - How to handle gpios? Reserving a gpio essentially keeps the provider
>> + *       (serializer) always powered on.
>> + * - Do we need a new bus for the FPD-Link? At the moment the serializers
>> + *   are children of the same i2c-adapter where the deserializer resides.
>> + * - i2c-atr could be made embeddable instead of allocatable.
>> + */
> 
> ...
> 
>>   struct atr_alias_table_entry {
>>   	u16 alias_id;	/* Alias ID from DT */
>>   
>> -	bool reserved;
>> +	bool in_use;
>>   	u8 nport;
>>   	u8 slave_id;	/* i2c client's local i2c address */
>>   	u8 port_reg_idx;
> 
> Wouldn't be wiser to move boolean at the end so if any obscure
> architecture/compiler makes it longer than a byte it won't increase the memory
> footprint. (Actually wouldn't it be aligned to u16 followed by u8 as well as
> they are different types?)

Sure, I can move it.

>>   };
> 
> ...
> 
>> +static int ub960_read16(struct ub960_data *priv, u8 reg, u16 *val)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	unsigned int v1, v2;
>> +	int ret;
>> +
>> +	mutex_lock(&priv->reg_lock);
>> +
>> +	ret = regmap_read(priv->regmap, reg, &v1);
>> +	if (ret) {
>> +		dev_err(dev, "%s: cannot read register 0x%02x (%d)!\n",
>> +			__func__, reg, ret);
>> +		goto out_unlock;
>> +	}
>> +
>> +	ret = regmap_read(priv->regmap, reg + 1, &v2);
>> +	if (ret) {
>> +		dev_err(dev, "%s: cannot read register 0x%02x (%d)!\n",
>> +			__func__, reg + 1, ret);
>> +		goto out_unlock;
>> +	}
> 
> Wondering why bulk read can't be used against properly typed __be16 variable?

I'll do that.

>> +	*val = (v1 << 8) | v2;
> 
> + be16_to_cpu() here.

Yep.

>> +out_unlock:
>> +	mutex_unlock(&priv->reg_lock);
>> +
>> +	return ret;
>> +}
> 
> ...
> 
>> +static int ub960_rxport_read16(struct ub960_data *priv, u8 nport, u8 reg,
>> +			       u16 *val)
>>   {
> 
> Ditto.
> 
>> +}
> 
> ...
> 
>>   	struct i2c_board_info ser_info = {
>> -		.of_node = to_of_node(rxport->remote_fwnode),
>> -		.fwnode = rxport->remote_fwnode,
> 
>> +		.of_node = to_of_node(rxport->ser.fwnode),
>> +		.fwnode = rxport->ser.fwnode,
> 
> Why do you need to have both?!

I didn't debug it, but having only fwnode there will break the probing 
(no match).

>>   		.platform_data = ser_pdata,
>>   	};
> 
> ...
> 
>> +	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
> 
> Pre-increment is non-standard in the kernel.
> 
>> +		struct ub960_rxport *rxport = priv->rxports[nport];
>> +		struct v4l2_mbus_frame_desc desc;
>> +		int ret;
>> +		u8 cur_vc;
>> +
>> +		if (!rxport)
>> +			continue;
>> +
>> +		ret = v4l2_subdev_call(rxport->source.sd, pad, get_frame_desc,
>> +				       rxport->source.pad, &desc);
>> +		if (ret)
>> +			return ret;
>> +
>> +		if (desc.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
>> +			continue;
> 
> 		cur_vc = desc.entry[0].bus.csi2.vc;
> 
>> +		for (i = 0; i < desc.num_entries; ++i) {
>> +			u8 vc = desc.entry[i].bus.csi2.vc;
> 
>> +			if (i == 0) {
>> +				cur_vc = vc;
>> +				continue;
>> +			}
> 
> This is an invariant to the loop, see above.

Well, the current code handles the case of num_entries == 0. I can 
change it as you suggest, and first check if num_entries == 0 and also 
start the loop from 1.

>> +			if (vc == cur_vc)
>> +				continue;
>> +
>> +			dev_err(&priv->client->dev,
>> +				"rx%u: source with multiple virtual-channels is not supported\n",
>> +				nport);
>> +			return -ENODEV;
>> +		}
>> +	}
> 
> ...
> 
>> +	for (i = 0; i < 6; ++i)
>>   		ub960_read(priv, UB960_SR_FPD3_RX_ID(i), &id[i]);
>>   	id[6] = 0;
> 
> Wondering if this magic can be defined.

The number of ID registers? Yes, I can add a define.

> ...
> 
>> +	priv->atr.aliases = devm_kcalloc(dev, table_size,
>> +					 sizeof(struct atr_alias_table_entry),
> 
> 	sizeof(*priv->atr.aliases) ?

Sure.

>> +					 GFP_KERNEL);
>> +	if (!priv->atr.aliases)
>>   		return -ENOMEM;
> 
> ...
> 
>>   	if (ret) {
>>   		if (ret != -EINVAL) {
>> -			dev_err(dev,
>> -				"rx%u: failed to read 'ti,strobe-pos': %d\n",
>> -				nport, ret);
>> +			dev_err(dev, "rx%u: failed to read '%s': %d\n", nport,
>> +				"ti,strobe-pos", ret);
>>   			return ret;
>>   		}
>>   	} else if (strobe_pos < UB960_MIN_MANUAL_STROBE_POS ||
>> @@ -3512,8 +3403,8 @@ ub960_parse_dt_rxport_link_properties(struct ub960_data *priv,
>>   	ret = fwnode_property_read_u32(link_fwnode, "ti,eq-level", &eq_level);
>>   	if (ret) {
>>   		if (ret != -EINVAL) {
>> -			dev_err(dev, "rx%u: failed to read 'ti,eq-level': %d\n",
>> -				nport, ret);
>> +			dev_err(dev, "rx%u: failed to read '%s': %d\n", nport,
>> +				"ti,eq-level", ret);
>>   			return ret;
>>   		}
>>   	} else if (eq_level > UB960_MAX_EQ_LEVEL) {
> 

Hmm, I noticed this one (and the one above) was missing return -EINVAL.

> Seems like you may do (in both cases) similar to the above:
> 
> 	var = 0;
> 	ret = read_u32();
> 	if (ret && ret != -EINVAL) {
> 		// error handling
> 	}
> 	if (var > limit) {
> 		// another error handling
> 	}

That's not the same. You'd also need to do:

if (!ret) {
	// handle the retrieved value
}

which, I think, is not any clearer (perhaps more unclear).

What I could do is:

if (ret) {
	if (ret != -EINVAL) {
		dev_err(dev, "rx%u: failed to read '%s': %d\n", nport,
			"ti,eq-level", ret);
		return ret;
	}
} else {
	if (eq_level > UB960_MAX_EQ_LEVEL) {
		dev_err(dev, "rx%u: illegal 'ti,eq-level' value: %d\n",
			nport, eq_level);
		return -EINVAL;
	}

	rxport->eq.manual_eq = true;
	rxport->eq.manual.eq_level = eq_level;
}

Maybe the above style makes it clearer, as it clearly splits the "don't 
have value" and "have value" branches.

> ...
> 
>> +	static const char *vpoc_names[UB960_MAX_RX_NPORTS] = { "vpoc0", "vpoc1",
>> +							       "vpoc2", "vpoc3" };
> 
> Wouldn't be better to format it as
> 
> 	static const char *vpoc_names[UB960_MAX_RX_NPORTS] = {
> 		"vpoc0", "vpoc1", "vpoc2", "vpoc3",
> 	};
> 
> ?

Clang-format disagrees, but I agree with you ;).

  Tomi

