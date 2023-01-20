Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEDE7675A64
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 17:47:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230429AbjATQrP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 11:47:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229840AbjATQrO (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 11:47:14 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59950CDF5;
        Fri, 20 Jan 2023 08:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674233232; x=1705769232;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E+S5dYOs7O14d/eAGbQrXtEnqveih+tcbQ4ZfC2HFUY=;
  b=cmY/qklubrIEfsaWUxhU5jZCtV4Q6vjRhi6Y5q4EQdGYD2/XkQK30j0q
   ZEegmRHwa3NEptScEoPCwP5wuQ8mnD3pbwHQke6MX1hf2mxVaVGXd6/k2
   /JTpjvwK+BSVAzhhMeTXTgDjKFMnWvykfnya7lk/dmKsOINw5itxBiH9A
   UG12stpx99GziSTOuTfxmXHoGKhOG6srJ8zGfSneTRawfUMFFR/rJz5pn
   Ru1XhvIE0RTwFgabNOdysbAXQBEWtptTJt9b3DMYqRdVBowd1WOKYtpUw
   Gf1RQx/+ToJHnaJEziOFt7BjlEl7Pr4IwUx7NvRceyCAW87us4w8NAj4M
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="325659381"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="325659381"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 08:47:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="768738758"
X-IronPort-AV: E=Sophos;i="5.97,232,1669104000"; 
   d="scan'208";a="768738758"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2023 08:47:06 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pIuXf-00CJnn-1P;
        Fri, 20 Jan 2023 18:47:03 +0200
Date:   Fri, 20 Jan 2023 18:47:03 +0200
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
        Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v7 5/7] media: i2c: add DS90UB960 driver
Message-ID: <Y8rFh6zO7Hp9mLxE@smile.fi.intel.com>
References: <20230118124031.788940-1-tomi.valkeinen@ideasonboard.com>
 <20230118124031.788940-6-tomi.valkeinen@ideasonboard.com>
 <Y8gUuqLBXsXQoNUC@smile.fi.intel.com>
 <aba49d82-c76f-7ff2-751c-d1be7b8f3bca@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aba49d82-c76f-7ff2-751c-d1be7b8f3bca@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jan 19, 2023 at 06:27:31PM +0200, Tomi Valkeinen wrote:
> On 18/01/2023 17:48, Andy Shevchenko wrote:
> > On Wed, Jan 18, 2023 at 02:40:29PM +0200, Tomi Valkeinen wrote:
> > > Add driver for TI DS90UB960 FPD-Link III Deserializer.

...

> > > +#define UB960_MIN_AEQ_STROBE_POS -7
> > 
> > I believe it might need parentheses due to theoretical possibilities to be used
> > in the expression.
> 
> Hmm, for my education, in which kind of expressions this could cause an
> issue?

To mine as well, surprised by 'foo = foo - - - -7;' being compilable.
But according to the Operator Precedence it's fine.

...

> Is that an important thing to restrict in the DT?

I believe so. It's a part of the idea behind YAML schema to make it possible
to validate for all possible scenarios. AFAIU that's how they can actually
see if firmware doesn't have any bugs in the description (read: DT).

> I'd rather handle these in
> the driver. There may well be HW revisions/versions or tricks not documented
> in the public docs to use other data rates. And, while this is not quite
> clear to me, the input refclk might also affect the exact data rate.
> 
> With a quick glance, I don't see any other binding defining the data rates.
> I didn't see any of them even limiting the number of items.

Then I suggest to have Rob's Ack on this. If he is fine, I'll keep that
in mind.

...

> > > +	if (!ret) {
> > 
> > What's wrong with the positive and traditional check, i.e.
> > 
> > 	if (ret)
> > 		return;
> > 
> > ?
> 
> Nothing, just a different style. I can change it.

The benefit is a decreased level of the indentation.

> > > +		if (csi_tx_isr & UB960_TR_CSI_TX_ISR_IS_CSI_SYNC_ERROR)
> > > +			dev_warn(dev, "TX%u: CSI_SYNC_ERROR\n", nport);
> > > +
> > > +		if (csi_tx_isr & UB960_TR_CSI_TX_ISR_IS_CSI_PASS_ERROR)
> > > +			dev_warn(dev, "TX%u: CSI_PASS_ERROR\n", nport);
> > > +	}

...

> > > +/* -----------------------------------------------------------------------------
> > > + * RX ports
> > > + */
> > 
> > Multi-line comment is not in the style.
> 
> True. Interesting that checkpatch didn't complain.

Because this format is the official for net subsystem.

...

> > > +	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
> > 
> > Post-increment is good enough, no? Ditto for other places.
> 
> Sure. Pre-increment is good enough too, right? It's a simpler operation,
> although obviously they both compile into the same code. I usually use
> pre-increment when there's no particular reason to pick either one, although
> it also depends on how it looks.

Then be consistent, use it everywhere.

> > Esp. taking into account that some of them are using actually
> > post-inc. Why this difference?
> 
> Possibly a different person has written that particular piece of code, or
> maybe a copy paste from somewhere.
> 
> I'm personally fine with seeing both post and pre increments in code.

I'm not :-), if it's not required by the code. Pre-increment always puzzles
me: Is here anything I have to pay an additional attention to?

> > > +		struct ub960_rxport *rxport = priv->rxports[nport];
> > > +
> > > +		if (!rxport || !rxport->vpoc)
> > > +			continue;
> > > +
> > > +		ret = regulator_enable(rxport->vpoc);
> > > +		if (ret)
> > > +			goto err_disable_vpocs;
> > > +	}

...

> > > +	if (WARN_ON(strobe_pos < UB960_MIN_MANUAL_STROBE_POS ||
> > > +		    strobe_pos > UB960_MAX_MANUAL_STROBE_POS))
> > > +		return;
> > 
> > Always be careful about WARN*() APIs because with a little trick they may
> > become equivalent to BUG() which is a beast that nobody likes. I.o.w.
> > you have to have justify why this is needed and can't be replaced with
> > dev_*() or analogue.
> > 
> > Same for the other places with WARN*().
> 
> Valid point. I think most of them here are in cases that really shouldn't
> happen. But if they do happen, I'd like to see a big loud shout about it.

...if you have time to catch it. Read about "panic_on_warn".

> The above is not a best example of this, and I think I can just drop the
> above warns, but, e.g. handling the default case for "switch
> (rxport->rx_mode)" (which shouldn't happen), I'd prefer to have a big yell
> in place rather than return silently or print a "normal" error print.
> 
> Obviously WARN is not a good one if it can be toggled to become a BUG.
> 
> So... I think I'll just drop most of them and probably convert the rest
> (two, actually) to dev_errs.

...

> > > +	if (strobe_pos < -7)
> > > +		clk_delay = abs(strobe_pos) - 6;
> > > +	else if (strobe_pos > 7)
> > > +		data_delay = strobe_pos - 6;
> > > +	else if (strobe_pos < 0)
> > > +		clk_delay = abs(strobe_pos) | UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
> > > +	else if (strobe_pos > 0)
> > > +		data_delay = strobe_pos | UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
> > 
> > I'm wondering if clamp_t()/clamp_val() can be utilised here... And maybe in other
> > places in the driver.
> 
> Hmm, I'm not sure how.

I can't suggest you, because it's magic to me what is going on, e.g. for
the strobe_pos < -7 case, and why abs(strobe_pos) - 6 wouldn't overflow
the bit field or whatever that uses it.

...

> > > +	if (eq_level <= 7) {
> > > +		eq_stage_1_select_value = eq_level;
> > > +		eq_stage_2_select_value = 0;
> > > +	} else {
> > > +		eq_stage_1_select_value = 7;
> > > +		eq_stage_2_select_value = eq_level - 7;
> > 
> > A lot of magic 7 in the code. Are they all of the same semantic? Are they can
> > be converted to use a macro (including respective MIN/MAX macros)?
> 
> It's related to how the value has to be encoded into the register. We keep
> the equalization level in a simple variable, but need to write it like this
> into the register. I'm not sure what I would call the magic 7 here.
> 
> Then for the strobe position, we use a logical signed value between -7 and
> 7, so we have to +7 when writing that to a register. Except when using a
> manual strobe position, where the range is -13 to 13 (7+6, that's the 6 in
> ub960_rxport_set_strobe_pos()).
> 
> It's rather confusing, in my opinion, but I think defines may just make this
> more confusing. The magic numbers used should always be very close to the
> registers in question, so if you know how the HW works wrt. strobe & eq,
> they should be "clear". I'll try to come up with defines that make this
> clearer, but no promises.

Obviously I disagree on the fact that it's more confusing. Consider that 7
and 7. How do I know that their semantics is the same or different? With
the name assigned it's differentiated by the name used.

...

> > > +	ub960_rxport_read(priv, nport, UB960_RR_AEQ_BYPASS, &v);
> > > +
> > > +	v &= ~(UB960_RR_AEQ_BYPASS_EQ_STAGE1_VALUE_MASK |
> > > +	       UB960_RR_AEQ_BYPASS_EQ_STAGE2_VALUE_MASK);
> > > +	v |= eq_stage_1_select_value << UB960_RR_AEQ_BYPASS_EQ_STAGE1_VALUE_SHIFT;
> > > +	v |= eq_stage_2_select_value << UB960_RR_AEQ_BYPASS_EQ_STAGE2_VALUE_SHIFT;
> > > +	v |= UB960_RR_AEQ_BYPASS_ENABLE; /* Enable AEQ Bypass */
> > > +
> > > +	ub960_rxport_write(priv, nport, UB960_RR_AEQ_BYPASS, v);
> > 
> > Can't you provide ub960_rxport_update_bits() ?
> 
> I could, but I think it's worse:
> 
> ub960_rxport_update_bits(priv, nport, UB960_RR_AEQ_BYPASS,
> 	UB960_RR_AEQ_BYPASS_EQ_STAGE1_VALUE_MASK |
> 		UB960_RR_AEQ_BYPASS_EQ_STAGE2_VALUE_MASK |
> 		UB960_RR_AEQ_BYPASS_ENABLE,
> 	(eq_stage_1_select_value
> 	 << UB960_RR_AEQ_BYPASS_EQ_STAGE1_VALUE_SHIFT) |
> 		(eq_stage_2_select_value
> 		 << UB960_RR_AEQ_BYPASS_EQ_STAGE2_VALUE_SHIFT) |
> 		UB960_RR_AEQ_BYPASS_ENABLE /* Enable AEQ Bypass */
> );
> 
> Indenting it differently, I think it's still worse:
> 
> ub960_rxport_update_bits(priv, nport, UB960_RR_AEQ_BYPASS,
> 	UB960_RR_AEQ_BYPASS_EQ_STAGE1_VALUE_MASK |
> 	UB960_RR_AEQ_BYPASS_EQ_STAGE2_VALUE_MASK |
> 	UB960_RR_AEQ_BYPASS_ENABLE,
> 	(eq_stage_1_select_value << UB960_RR_AEQ_BYPASS_EQ_STAGE1_VALUE_SHIFT) |
> 	(eq_stage_2_select_value << UB960_RR_AEQ_BYPASS_EQ_STAGE2_VALUE_SHIFT) |
> 	UB960_RR_AEQ_BYPASS_ENABLE /* Enable AEQ Bypass */
> );

You can always use temporary variables to make code better to read.
But it's up to you. Usually the R-M-W <--> vs. U is about locking or
serialisation and handling it in a separate code is better.

...

> > > +	ret = ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_HI, &v1);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_LO, &v2);
> > > +	if (ret)
> > > +		return ret;
> > 
> > Can this be read at once as BE16/LE16 value?
> > Or if the stream of bytes, you can use le/be16_to_cpu().
> 
> I'm not sure, possibly. But is it worth it? I'd need to add new helper
> functions to read such a value.

I think it worth it to show exactly what is provided by the hardware
and how we handle it (endianess wise).

> > > +	parity_errors = (v1 << 8) | v2;

...

> > > +	*ok = !errors;
> > 
> > How this is different to the something like returning 1 here (and 0 above)?
> > You may save some code by dropping redundant parameter.
> 
> Return value 1 means there was an error when reading the register values. 0
> means we read the values, and "ok" contains a summary (ok or not) of the
> link's status.

I was expecting that error is negative, no?

> > > +	return 0;

...

> > > +	while (time_before(jiffies, timeout)) {
> > > +		missing = 0;
> > > +
> > > +		for_each_set_bit(nport, &port_mask,
> > > +				 priv->hw_data->num_rxports) {
> > > +			struct ub960_rxport *rxport = priv->rxports[nport];
> > > +			bool ok;
> > > +
> > > +			if (!rxport)
> > > +				continue;
> > > +
> > > +			ret = ub960_rxport_link_ok(priv, nport, &ok);
> > > +			if (ret)
> > > +				return ret;
> > > +
> > > +			if (!ok || !(link_ok_mask & BIT(nport)))
> > > +				missing++;
> > > +
> > > +			if (ok)
> > > +				link_ok_mask |= BIT(nport);
> > > +			else
> > > +				link_ok_mask &= ~BIT(nport);
> > > +		}
> > > +
> > > +		loops++;
> > > +
> > > +		if (missing == 0)
> > > +			break;
> > > +
> > > +		msleep(50);
> > > +	}
> > 
> > You can wrap the body into readx_poll_timeout() from iopoll.h.
> 
> Hmm... How would I do that? With some kind of helper structs to wrap the
> input and output parameters? Sounds very messy, but maybe I'm missing
> something.

It's me who added extra 'x', what I meant is read_poll_timeout(). It
accepts variadic arguments, i.o.w. any function with any arguments can
be provided.

...

> > > +		ub960_rxport_read(priv, nport, UB960_RR_RX_FREQ_HIGH, &v1);
> > > +		ub960_rxport_read(priv, nport, UB960_RR_RX_FREQ_LOW, &v2);
> > 
> > Same Q, can these be unified to some kind of bulk read?
> 
> Perhaps, but again, I don't see the value for creating a bulk read helper
> function for these few cases.

OK.

...

> > > +		dev_dbg(dev, "\trx%u: locked, SP: %d, EQ: %u, freq %u Hz\n",
> > > +			nport, strobe_pos, eq_level,
> > > +			v1 * 1000000 + v2 * 1000000 / 256);
> > 
> > Even this will be simpler with above suggestion.
> 
> Hmm... How is that?

		dev_dbg(dev, "\trx%u: locked, SP: %d, EQ: %u, freq %u Hz\n",
			nport, strobe_pos, eq_level, v * 1000000 / 256);

See?

...

> > > +	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
> > 
> > Post-inc?
> 
> I still like pre-inc =).
> 
> I see there's a mix os post and pre incs in the code. I'll align those when
> I encounter them, but I don't think it's worth the effort to methodically go
> through all of them to change them use the same style.

Kernel uses post-inc is an idiom for loops:

$ git grep -n -w '[_a-z0-9]\+++' | wc -l
148693

$ git grep -n -w ' ++[a-z0-9_]\+' | wc -l
8701

So, non-standard pattern needs to be explained.

> > > +	}

...

> > > +	for (unsigned int i = 0; i < 6; ++i)
> > > +		ub960_read(priv, UB960_SR_FPD3_RX_ID(i), &id[i]);
> > > +	id[6] = 0;
> > 
> > If it's only for printing, the 0 is not needed...
> > 
> > > +	dev_info(dev, "ID '%s'\n", id);
> > 
> > ...as you may put it as
> > 
> > 	dev_info(dev, "ID: '%.*s'\n", (int)sizeof(id), id);
> > 
> > (I wrote from the top of my head, maybe not compilable as is).
> 
> And you think that is clearer? =)

To me, yes. Maybe because I'm familiar with that.

> I have to disagree.

Your right :-)

...

> I'm not quite fine with dropping all these DT checks. If the user happens to
> provide a DT with illegal values, the end results can be odd and the reason
> quite difficult to figure out. Isn't it much better to have a few extra
> checks in the driver?

As I said above, ask Rob, if he is fine with that I will have no objections.

...

> > > +		rxport->eq.strobe_pos = strobe_pos;
> > > +		if (!priv->strobe.manual)
> > > +			dev_warn(dev,
> > > +				 "rx%u: 'ti,strobe-pos' ignored as 'ti,manual-strobe' not set\n",
> > > +				 nport);
> > > +	}
> > 
> > This and below looks a bit different to the above in the same function. Perhaps
> > these can be refactored to be less LoCs.
> 
> Hmm what did you have in mind?
> 
> > > +	ret = fwnode_property_read_u32(link_fwnode, "ti,eq-level", &eq_level);
> > > +	if (ret) {
> > > +		if (ret != -EINVAL) {
> > > +			dev_err(dev, "rx%u: failed to read 'ti,eq-level': %d\n",
> > > +				nport, ret);
> > > +			return ret;
> > > +		}

This seems like trying to handle special cases, if you want it to be optional,
why not ignoring all errors?

> > > +	} else if (eq_level > UB960_MAX_EQ_LEVEL) {
> > > +		dev_err(dev, "rx%u: illegal 'ti,eq-level' value: %d\n", nport,
> > > +			eq_level);

This part is a validation of DT again, but we discussed above this.

> > > +	} else {
> > > +		rxport->eq.manual_eq = true;
> > > +		rxport->eq.manual.eq_level = eq_level;
> > > +	}

...

> > > +err_pd_gpio:
> > > +	if (priv->pd_gpio)
> > 
> > Dup test.
> 
> What do you mean dup? You mean gpiod_set_value_cansleep can be called with
> gpio = NULL? The docs don't say this, but I guess that is the case.

Yes. This is the idea of having _optional() GPIO APIs.

> > > +		gpiod_set_value_cansleep(priv->pd_gpio, 1);

...

> > > +	if (priv->pd_gpio)
> > > +		gpiod_set_value_cansleep(priv->pd_gpio, 1);

Ditto.

...

> > > +	priv->hw_data = of_device_get_match_data(dev);
> > 
> > Why of_ out of the blue?!
> 
> Hmm... How do I get the data in a generic way? I'll have to study this a
> bit.

Just drop of_ :-)

	priv->hw_data = device_get_match_data(dev);

> > > +	if (!priv->hw_data)
> > > +		return -ENODEV;

...

> > > +	priv->current_indirect_target = 0xff;
> > > +	priv->current_read_rxport = 0xff;
> > > +	priv->current_write_rxport_mask = 0xff;
> > > +	priv->current_read_csiport = 0xff;
> > > +	priv->current_write_csiport_mask = 0xff;
> > 
> > GENMASK()
> 
> These are not masks, but invalid values. We set these to an invalid value
> (0xff) so that when a reg access function next time checks if we are already
> targeting, e.g. a particular rxport, it will always opt to select the rxport
> by writing to the approriate registers.

Then define with respective name?

...

> > > +struct ds90ub9xx_platform_data {
> > > +	u32 port;
> > > +	struct i2c_atr *atr;
> > > +	unsigned long bc_rate;
> > 
> > Not sure why we need this to be public except, probably, atr...
> 
> The port and atr are used by the serializers, for atr. The bc_rate is used
> by the serializers to figure out the clocking (they may use the FPD-Link's
> frequency internally).

The plain numbers can be passed as device properties. That's why the question
about platform data. Platform data in general is discouraged to be used in a
new code.


-- 
With Best Regards,
Andy Shevchenko


