Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C5A35673EC0
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jan 2023 17:27:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229689AbjASQ1y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 19 Jan 2023 11:27:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbjASQ1l (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 19 Jan 2023 11:27:41 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F733241D9;
        Thu, 19 Jan 2023 08:27:37 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 750E17EC;
        Thu, 19 Jan 2023 17:27:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674145655;
        bh=o9BiE7TBqZp0Hc/8ywqR39pj3oIuZr3rF5GoaR0hT2M=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=dCChR7CrT/ZMjoNd84dAx03DLLigcEJ/trmS3qA9ttPlV7v/E7i4GAG+rTICLCLek
         fW1hrGXt1OeAdIi3xkerpylH6genhDBMCJaSWIqI+OHz2aD8jcHmjGy4pg3XyHtVFS
         1pJlsuG0cWaMq1PVuc62WOtw9g8PPjRZm5zL05dY=
Message-ID: <aba49d82-c76f-7ff2-751c-d1be7b8f3bca@ideasonboard.com>
Date:   Thu, 19 Jan 2023 18:27:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v7 5/7] media: i2c: add DS90UB960 driver
Content-Language: en-US
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
        Marek Vasut <marex@denx.de>
References: <20230118124031.788940-1-tomi.valkeinen@ideasonboard.com>
 <20230118124031.788940-6-tomi.valkeinen@ideasonboard.com>
 <Y8gUuqLBXsXQoNUC@smile.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y8gUuqLBXsXQoNUC@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Andy,

Thanks for the thorough review!

On 18/01/2023 17:48, Andy Shevchenko wrote:
> On Wed, Jan 18, 2023 at 02:40:29PM +0200, Tomi Valkeinen wrote:
>> Add driver for TI DS90UB960 FPD-Link III Deserializer.
> 
> ...
> 
>> +#define UB960_MIN_AEQ_STROBE_POS -7
> 
> I believe it might need parentheses due to theoretical possibilities to be used
> in the expression.

Hmm, for my education, in which kind of expressions this could cause an 
issue?

> ...
> 
>> +#define UB960_MIN_MANUAL_STROBE_POS -(7 + 6)
> 
> Ditto.
> 
> ...
> 
>> +	ret = regmap_read(priv->regmap, reg, &v);
>> +	if (ret)
>> +		dev_err(dev, "%s: cannot read register 0x%02x (%d)!\n",
>> +			__func__, reg, ret);
> 
> Not sure how this messages are useful and esp. parameters, since regmap has
> already trace events. Maybe it's possible to narrow regmap traces to the
> dedicated functions?

I have found the error prints useful on multiple occasions. If something 
goes wrong, I'd rather see it immediately. And isn't tracing and error 
printing quite different things? What is your concern here, or rather, 
what would you suggest instead of the above?

>> +	else
>> +		*val = v;
> 
> ...
> 
>> +	if (priv->current_read_rxport == nport &&
>> +	    priv->current_write_rxport_mask == BIT(nport))
>> +		return 0;
>> +
>> +	ret = regmap_write(priv->regmap, UB960_SR_FPD3_PORT_SEL,
>> +			   (nport << 4) | (1 << nport));
> 
> Any reason why not BIT() here, while above and below it's being used?

No reason.

>> +	if (ret) {
>> +		dev_err(dev, "%s: cannot select rxport %d (%d)!\n", __func__,
>> +			nport, ret);
>> +		return ret;
>> +	}
> 
>> +	priv->current_read_rxport = nport;
>> +	priv->current_write_rxport_mask = BIT(nport);
>> +
>> +	return 0;
>> +}
> 
> ...
> 
>> +static int _ub960_csiport_select(struct ub960_data *priv, u8 nport)
>> +{
> 
> Same comment as above.
> 
>> +}
> 
> ...
> 
>> +out:
> 
> out_unlock: ?

I'll change it, but often if there's only one label, I think just 
err/out is fine.

>> +	mutex_unlock(&priv->reg_lock);
>> +
>> +	return ret;
> 
> Also in some cases you are using 'else' (as 'if (ret) ... else') in some goto
> approach. Can it be unified?

Sure.

> ...
> 
>> +	v &= ~mask;
>> +	v |= val;
> 
> Usual pattern we use is
> 
> 	v = (v & ~mask) | (val & mask);
> 
> But can you use regmap_update_bits()? And why not?

I don't see why not. No idea why I open-coded it.

> ...
> 
>> +	ret = fwnode_property_count_u32(ep_fwnode, "data-lanes");
>> +	if (ret <= 0) {
>> +		dev_err(dev, "tx%u: failed to parse 'data-lanes': %d\n", nport,
>> +			ret);
> 
> Message is not consistent with the case ret == 0.

Yep.

>> +		goto err_free_txport;
>> +	}
> 
> ...
> 
>> +	if (ret != 1) {
>> +		dev_err(dev,
>> +			"tx%u: 'link-frequencies' must contain a single frequency: %d\n",
>> +			nport, ret);
>> +		goto err_free_txport;
>> +	}
> 
> Shouldn't be here.
> As Rob Herring told at least once that driver must not replace DT validator.

Ok. Hmm, looks like link-frequencies is not even in the binding doc. 
I'll add it.

> ...
> 
>> +	if (priv->tx_data_rate != 1600000000 &&
>> +	    priv->tx_data_rate != 1200000000 &&
>> +	    priv->tx_data_rate != 800000000 &&
>> +	    priv->tx_data_rate != 400000000) {
>> +		dev_err(dev, "tx%u: invalid 'link-frequencies' value\n", nport);
>> +		return -EINVAL;
>> +	}
> 
> Ditto.

Is that an important thing to restrict in the DT? I'd rather handle 
these in the driver. There may well be HW revisions/versions or tricks 
not documented in the public docs to use other data rates. And, while 
this is not quite clear to me, the input refclk might also affect the 
exact data rate.

With a quick glance, I don't see any other binding defining the data 
rates. I didn't see any of them even limiting the number of items.

> ...
> 
>> +	dev_dbg(dev, "tx%u: nominal data rate: %u", nport, priv->tx_data_rate);
> 
> All these kind of debugging are needed for production?

Production meaning upstream kernel? Hard to say. I find all kinds of 
debugging prints useful.

> ...
> 
>> +static void ub960_csi_handle_events(struct ub960_data *priv, u8 nport)
>> +{
>> +	struct device *dev = &priv->client->dev;
>> +	u8 csi_tx_isr;
>> +	int ret;
> 
>> +	ret = ub960_csiport_read(priv, nport, UB960_TR_CSI_TX_ISR, &csi_tx_isr);
>> +
> 
> Redundant blank line.

Yep.

>> +	if (!ret) {
> 
> What's wrong with the positive and traditional check, i.e.
> 
> 	if (ret)
> 		return;
> 
> ?

Nothing, just a different style. I can change it.

>> +		if (csi_tx_isr & UB960_TR_CSI_TX_ISR_IS_CSI_SYNC_ERROR)
>> +			dev_warn(dev, "TX%u: CSI_SYNC_ERROR\n", nport);
>> +
>> +		if (csi_tx_isr & UB960_TR_CSI_TX_ISR_IS_CSI_PASS_ERROR)
>> +			dev_warn(dev, "TX%u: CSI_PASS_ERROR\n", nport);
>> +	}
>> +}
> 
> ...
> 
>> +/* -----------------------------------------------------------------------------
>> + * RX ports
>> + */
> 
> Multi-line comment is not in the style.

True. Interesting that checkpatch didn't complain.

> ...
> 
>> +	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
> 
> Post-increment is good enough, no? Ditto for other places.

Sure. Pre-increment is good enough too, right? It's a simpler operation, 
although obviously they both compile into the same code. I usually use 
pre-increment when there's no particular reason to pick either one, 
although it also depends on how it looks.

> Esp. taking into account that some of them are using actually
> post-inc. Why this difference?

Possibly a different person has written that particular piece of code, 
or maybe a copy paste from somewhere.

I'm personally fine with seeing both post and pre increments in code.

>> +		struct ub960_rxport *rxport = priv->rxports[nport];
>> +
>> +		if (!rxport || !rxport->vpoc)
>> +			continue;
>> +
>> +		ret = regulator_enable(rxport->vpoc);
>> +		if (ret)
>> +			goto err_disable_vpocs;
>> +	}
> 
> ...
> 
>> +err_disable_vpocs:
>> +	for (; nport > 0; --nport) {
> 
> 	while (nport--) {

Yes, that's better.

>> +		struct ub960_rxport *rxport = priv->rxports[nport - 1];
>> +
>> +		if (!rxport || !rxport->vpoc)
>> +			continue;
>> +
>> +		regulator_disable(rxport->vpoc);
>> +	}
> 
> ...
> 
>> +	if (WARN_ON(strobe_pos < UB960_MIN_MANUAL_STROBE_POS ||
>> +		    strobe_pos > UB960_MAX_MANUAL_STROBE_POS))
>> +		return;
> 
> Always be careful about WARN*() APIs because with a little trick they may
> become equivalent to BUG() which is a beast that nobody likes. I.o.w.
> you have to have justify why this is needed and can't be replaced with
> dev_*() or analogue.
> 
> Same for the other places with WARN*().

Valid point. I think most of them here are in cases that really 
shouldn't happen. But if they do happen, I'd like to see a big loud 
shout about it. The above is not a best example of this, and I think I 
can just drop the above warns, but, e.g. handling the default case for 
"switch (rxport->rx_mode)" (which shouldn't happen), I'd prefer to have 
a big yell in place rather than return silently or print a "normal" 
error print.

Obviously WARN is not a good one if it can be toggled to become a BUG.

So... I think I'll just drop most of them and probably convert the rest 
(two, actually) to dev_errs.

> ...
> 
>> +	if (strobe_pos < -7)
>> +		clk_delay = abs(strobe_pos) - 6;
>> +	else if (strobe_pos > 7)
>> +		data_delay = strobe_pos - 6;
>> +	else if (strobe_pos < 0)
>> +		clk_delay = abs(strobe_pos) | UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
>> +	else if (strobe_pos > 0)
>> +		data_delay = strobe_pos | UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;
> 
> I'm wondering if clamp_t()/clamp_val() can be utilised here... And maybe in other
> places in the driver.

Hmm, I'm not sure how.

> ...
> 
>> +	ub960_write(priv, UB960_XR_SFILTER_CFG,
> 
>> +		    ((u8)strobe_min << UB960_XR_SFILTER_CFG_SFILTER_MIN_SHIFT) |
>> +		    ((u8)strobe_max << UB960_XR_SFILTER_CFG_SFILTER_MAX_SHIFT));
> 
> Why castings are needed?

I don't think they strictly are, but it highlights that the variables, 
which are signed, are now >= 0, and are used as unsigned.

> ...
> 
>> +	*eq_level = (v & 0x7) + ((v >> 3) & 0x7);
> 
> GENMASK()?

I'll add defines for these bit fields.

> 
>> +	if (eq_level <= 7) {
>> +		eq_stage_1_select_value = eq_level;
>> +		eq_stage_2_select_value = 0;
>> +	} else {
>> +		eq_stage_1_select_value = 7;
>> +		eq_stage_2_select_value = eq_level - 7;
> 
> A lot of magic 7 in the code. Are they all of the same semantic? Are they can
> be converted to use a macro (including respective MIN/MAX macros)?

It's related to how the value has to be encoded into the register. We 
keep the equalization level in a simple variable, but need to write it 
like this into the register. I'm not sure what I would call the magic 7 
here.

Then for the strobe position, we use a logical signed value between -7 
and 7, so we have to +7 when writing that to a register. Except when 
using a manual strobe position, where the range is -13 to 13 (7+6, 
that's the 6 in ub960_rxport_set_strobe_pos()).

It's rather confusing, in my opinion, but I think defines may just make 
this more confusing. The magic numbers used should always be very close 
to the registers in question, so if you know how the HW works wrt. 
strobe & eq, they should be "clear". I'll try to come up with defines 
that make this clearer, but no promises.

> ...
> 
>> +	WARN_ON(eq_stage_1_select_value > 7);
>> +	WARN_ON(eq_stage_2_select_value > 7);
> 
> Why WARN()?

I'll drop. I think these were development time helpers long time back.

> ...
> 
>> +	ub960_rxport_read(priv, nport, UB960_RR_AEQ_BYPASS, &v);
>> +
>> +	v &= ~(UB960_RR_AEQ_BYPASS_EQ_STAGE1_VALUE_MASK |
>> +	       UB960_RR_AEQ_BYPASS_EQ_STAGE2_VALUE_MASK);
>> +	v |= eq_stage_1_select_value << UB960_RR_AEQ_BYPASS_EQ_STAGE1_VALUE_SHIFT;
>> +	v |= eq_stage_2_select_value << UB960_RR_AEQ_BYPASS_EQ_STAGE2_VALUE_SHIFT;
>> +	v |= UB960_RR_AEQ_BYPASS_ENABLE; /* Enable AEQ Bypass */
>> +
>> +	ub960_rxport_write(priv, nport, UB960_RR_AEQ_BYPASS, v);
> 
> Can't you provide ub960_rxport_update_bits() ?

I could, but I think it's worse:

ub960_rxport_update_bits(priv, nport, UB960_RR_AEQ_BYPASS,
	UB960_RR_AEQ_BYPASS_EQ_STAGE1_VALUE_MASK |
		UB960_RR_AEQ_BYPASS_EQ_STAGE2_VALUE_MASK |
		UB960_RR_AEQ_BYPASS_ENABLE,
	(eq_stage_1_select_value
	 << UB960_RR_AEQ_BYPASS_EQ_STAGE1_VALUE_SHIFT) |
		(eq_stage_2_select_value
		 << UB960_RR_AEQ_BYPASS_EQ_STAGE2_VALUE_SHIFT) |
		UB960_RR_AEQ_BYPASS_ENABLE /* Enable AEQ Bypass */
);

Indenting it differently, I think it's still worse:

ub960_rxport_update_bits(priv, nport, UB960_RR_AEQ_BYPASS,
	UB960_RR_AEQ_BYPASS_EQ_STAGE1_VALUE_MASK |
	UB960_RR_AEQ_BYPASS_EQ_STAGE2_VALUE_MASK |
	UB960_RR_AEQ_BYPASS_ENABLE,
	(eq_stage_1_select_value << UB960_RR_AEQ_BYPASS_EQ_STAGE1_VALUE_SHIFT) |
	(eq_stage_2_select_value << UB960_RR_AEQ_BYPASS_EQ_STAGE2_VALUE_SHIFT) |
	UB960_RR_AEQ_BYPASS_ENABLE /* Enable AEQ Bypass */
);

> ...
> 
>> +	ret = ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_HI, &v1);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_LO, &v2);
>> +	if (ret)
>> +		return ret;
> 
> Can this be read at once as BE16/LE16 value?
> Or if the stream of bytes, you can use le/be16_to_cpu().

I'm not sure, possibly. But is it worth it? I'd need to add new helper 
functions to read such a value.

>> +	parity_errors = (v1 << 8) | v2;
> 
> ...
> 
>> +	errors = (rx_port_sts1 & 0x2c) || (rx_port_sts2 & 0x20) ||
>> +		 (bcc_sts & 0x3f) || (csi_rx_sts & 0xf) || csi_err_cnt ||
> 
> BIT()? GENMASK()?

I'll add defines for the error masks (those are bit masks of error bits 
in the registers).

> At bare minimum this needs a good comment to explain all these magics.
> 
>> +		 parity_errors;
> 
> ...
> 
>> +	*ok = !errors;
> 
> How this is different to the something like returning 1 here (and 0 above)?
> You may save some code by dropping redundant parameter.

Return value 1 means there was an error when reading the register 
values. 0 means we read the values, and "ok" contains a summary (ok or 
not) of the link's status.

>> +	return 0;
> 
> ...
> 
>> +	while (time_before(jiffies, timeout)) {
>> +		missing = 0;
>> +
>> +		for_each_set_bit(nport, &port_mask,
>> +				 priv->hw_data->num_rxports) {
>> +			struct ub960_rxport *rxport = priv->rxports[nport];
>> +			bool ok;
>> +
>> +			if (!rxport)
>> +				continue;
>> +
>> +			ret = ub960_rxport_link_ok(priv, nport, &ok);
>> +			if (ret)
>> +				return ret;
>> +
>> +			if (!ok || !(link_ok_mask & BIT(nport)))
>> +				missing++;
>> +
>> +			if (ok)
>> +				link_ok_mask |= BIT(nport);
>> +			else
>> +				link_ok_mask &= ~BIT(nport);
>> +		}
>> +
>> +		loops++;
>> +
>> +		if (missing == 0)
>> +			break;
>> +
>> +		msleep(50);
>> +	}
> 
> You can wrap the body into readx_poll_timeout() from iopoll.h.

Hmm... How would I do that? With some kind of helper structs to wrap the 
input and output parameters? Sounds very messy, but maybe I'm missing 
something.

> ...
> 
>> +		ub960_rxport_read(priv, nport, UB960_RR_RX_FREQ_HIGH, &v1);
>> +		ub960_rxport_read(priv, nport, UB960_RR_RX_FREQ_LOW, &v2);
> 
> Same Q, can these be unified to some kind of bulk read?

Perhaps, but again, I don't see the value for creating a bulk read 
helper function for these few cases.

> ...
> 
>> +		dev_dbg(dev, "\trx%u: locked, SP: %d, EQ: %u, freq %u Hz\n",
>> +			nport, strobe_pos, eq_level,
>> +			v1 * 1000000 + v2 * 1000000 / 256);
> 
> Even this will be simpler with above suggestion.

Hmm... How is that?

> ...
> 
>> +static int ub960_rxport_add_serializers(struct ub960_data *priv)
>> +{
>> +	unsigned int nport;
>> +	int ret;
>> +
>> +	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {
> 
> Post-inc?

I still like pre-inc =).

I see there's a mix os post and pre incs in the code. I'll align those 
when I encounter them, but I don't think it's worth the effort to 
methodically go through all of them to change them use the same style.

>> +		struct ub960_rxport *rxport = priv->rxports[nport];
>> +
>> +		if (!rxport)
>> +			continue;
>> +
>> +		ret = ub960_rxport_add_serializer(priv, nport);
>> +		if (ret)
>> +			goto err_remove_sers;
>> +	}
>> +
>> +	return 0;
>> +
>> +err_remove_sers:
>> +	for (; nport > 0; --nport) {
> 
> 	while(nport--)
> 
> (and drop those -1:s below)

Yes, that cleans this up nicely.

>> +		struct ub960_rxport *rxport = priv->rxports[nport - 1];
>> +
>> +		if (!rxport)
>> +			continue;
>> +
>> +		rxport = priv->rxports[nport - 1];
>> +		if (!rxport)
>> +			continue;
>> +
>> +		ub960_rxport_remove_serializer(priv, nport - 1);
>> +	}
>> +
>> +	return ret;
>> +}
> 
> ...
> 
>> +	if (priv->tx_data_rate == 1600000000)
> 
> Easy to make a mistake, perhaps something from units.h / time.h can be used?

Hmm, time.h? What's in there.

I don't like the HZ_PER_MHZ too much. But I'll add this, which I 
recently added to a Renesas driver:

#define MHZ(v) ((u32)((v) * 1000000U))

I like it, as e.g. MHZ(1.6) works and (I think) is quite clear. Here 
it's MHZ(1600), of course.

>> +		csi_ctl |= UB960_TR_CSI_CTL_CSI_CAL_EN;
> 
> ...
> 
>> +	switch (priv->tx_data_rate) {
>> +	case 1600000000:
>> +	default:
>> +		speed_select = 0;
>> +		pll_div = 0x10;
>> +		break;
>> +	case 1200000000:
>> +		speed_select = 1;
>> +		break;
>> +	case 800000000:
>> +		speed_select = 2;
>> +		pll_div = 0x10;
>> +		break;
>> +	case 400000000:
>> +		speed_select = 3;
>> +		pll_div = 0x10;
>> +		break;
>> +	}
> 
> Ditto, but maybe defines for them?
> 
> ...
> 
>> +	switch (rxport->rx_mode) {
>> +	default:
>> +		WARN_ON(true);
>> +		fallthrough;
> 
> Maybe you can drop default completely and rely on compiler to produce a
> warning?

I've dropped the default, but I had to add cases for the RAW12 modes 
(which are not supported at the moment).

>> +	case RXPORT_MODE_RAW10:
>> +		/*
>> +		 * RAW10_8BIT_CTL = 0b11 : 8-bit processing using lower 8 bits
>> +		 * 0b10 : 8-bit processing using upper 8 bits
>> +		 */
>> +		ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG2,
>> +					 0x3 << 6, 0x2 << 6);
>> +
>> +		break;
>> +
>> +	case RXPORT_MODE_CSI2_SYNC:
>> +	case RXPORT_MODE_CSI2_ASYNC:
>> +
>> +		break;
>> +	}
> 
> ...
> 
>> +	u8 cur_vc[UB960_MAX_TX_NPORTS] = { 0 };
> 
> 0 is not needed.

Yep.

> ...
> 
>> +	for (i = 0; i < routing->num_routes; ++i) {
>> +		struct v4l2_subdev_route *route = &routing->routes[i];
>> +		unsigned int rx, tx;
>> +
>> +		rx = ub960_pad_to_port(priv, route->sink_pad);
> 
>> +
> 
> Redundant blank line.

Yep.

>> +		if (BIT(rx) & handled_mask)
>> +			continue;
>> +
>> +		tx = ub960_pad_to_port(priv, route->source_pad);
>> +
>> +		vc[rx] = cur_vc[tx]++;
>> +		handled_mask |= BIT(rx);
>> +	}
> 
> ...
> 
>> +		if (rx_data[nport].tx_port == 1)
>> +			fwd_ctl |= BIT(nport); /* forward to TX1 */
>> +		else
>> +			fwd_ctl &= ~BIT(nport); /* forward to TX0 */
> 
> This and many other similar places can be replaced by __assign_bit()
> if the lvalue is type of unsigned long or can be made that type.

It is u8, as it is written to a 8 bit register. It could be made 
unsigned long, but... I'd rather use u8 when we are dealing with 8 bits 
of data.

> ...
> 
>> +static void ub960_update_streaming_status(struct ub960_data *priv)
>> +{
>> +	unsigned int i;
> 
>> +	bool streaming = false;
> 
> Redundant
> >> +	for (i = 0; i < UB960_MAX_NPORTS; ++i) {
>> +		if (priv->stream_enable_mask[i]) {
>> +			streaming = true;
>> +			break;
>> +		}
>> +	}
> 
>> +	priv->streaming = streaming;
> 
> 	priv->streaming = i < UB960_MAX_NPORTS;

Yes, that's a bit simpler.

>> +}
> 
> ...
> 
>> +				for (; nport > 0; --nport) {
> 
> 				while (nport--)

Yep.

>> +					if (pad_stream_masks[nport - 1] == 0)
>> +						continue;
>> +
>> +					ub960_disable_streams(
>> +						sd, state,
>> +						priv->hw_data->num_rxports +
>> +							nport - 1,
>> +						pad_stream_masks[nport - 1]);
>> +				}
> 
> ...
> 
>> +	char id[7];
> 
> u8?
> 
>> +	for (unsigned int i = 0; i < 6; ++i)
>> +		ub960_read(priv, UB960_SR_FPD3_RX_ID(i), &id[i]);
>> +	id[6] = 0;
> 
> If it's only for printing, the 0 is not needed...
> 
>> +	dev_info(dev, "ID '%s'\n", id);
> 
> ...as you may put it as
> 
> 	dev_info(dev, "ID: '%.*s'\n", (int)sizeof(id), id);
> 
> (I wrote from the top of my head, maybe not compilable as is).

And you think that is clearer? =) I have to disagree.

> ...
> 
>> +static irqreturn_t ub960_handle_events(int irq, void *arg)
>> +{
>> +	struct ub960_data *priv = arg;
>> +	unsigned int i;
>> +	u8 int_sts;
>> +	int ret;
> 
>> +	ret = ub960_read(priv, UB960_SR_INTERRUPT_STS, &int_sts);
> 
>> +
> 
> Redundant blank line. I guess you may decrease your code by ~2.5% by removing
> such unneeded blank lines here and there.

I only found a few of these, which I have fixed.

>> +	if (!ret && int_sts) {
> 
> 	if (ret)
> 		return ...
> 
> 	if (!int_sts)
> 		return IRQ_NONE; // No?

Yes, I think that's correct. I wonder what to return in the (ret) case. 
Probably also IRQ_NONE, as we don't know if the interrupt was for us.

>> +		u8 fwd_sts;
>> +
>> +		dev_dbg(&priv->client->dev, "INTERRUPT_STS %x\n", int_sts);
>> +
>> +		ub960_read(priv, UB960_SR_FWD_STS, &fwd_sts);
>> +
>> +		dev_dbg(&priv->client->dev, "FWD_STS %#02x\n", fwd_sts);
>> +
>> +		for (i = 0; i < priv->hw_data->num_txports; ++i) {
>> +			if (int_sts & UB960_SR_INTERRUPT_STS_IS_CSI_TX(i))
>> +				ub960_csi_handle_events(priv, i);
>> +		}
>> +
>> +		for (i = 0; i < priv->hw_data->num_rxports; i++) {
>> +			if (!priv->rxports[i])
>> +				continue;
>> +
>> +			if (int_sts & UB960_SR_INTERRUPT_STS_IS_RX(i))
>> +				ub960_rxport_handle_events(priv, i);
>> +		}
>> +	}
> 
>> +	return IRQ_HANDLED;
>> +}
> 
> ...
> 
>> +	if (cdr_mode > RXPORT_CDR_LAST) {
>> +		dev_err(dev, "rx%u: bad 'ti,cdr-mode' %u\n", nport, cdr_mode);
>> +		return -EINVAL;
>> +	}
> 
> No DT validation if it's not used in (memory) allocation.

I'm not quite fine with dropping all these DT checks. If the user 
happens to provide a DT with illegal values, the end results can be odd 
and the reason quite difficult to figure out. Isn't it much better to 
have a few extra checks in the driver?

> ...
> 
>> +	ret = fwnode_property_read_u32(link_fwnode, "ti,strobe-pos",
>> +				       &strobe_pos);
>> +	if (ret) {
>> +		if (ret != -EINVAL) {
>> +			dev_err(dev,
>> +				"rx%u: failed to read 'ti,strobe-pos': %d\n",
>> +				nport, ret);
>> +			return ret;
>> +		}
>> +	} else if (strobe_pos < UB960_MIN_MANUAL_STROBE_POS ||
>> +		   strobe_pos > UB960_MAX_MANUAL_STROBE_POS) {
>> +		dev_err(dev, "rx%u: illegal 'strobe-pos' value: %d\n", nport,
>> +			strobe_pos);
>> +	} else {
>> +		// NOTE: ignored unless global manual strobe pos is set
> 
> Style?

Oops...

>> +		rxport->eq.strobe_pos = strobe_pos;
>> +		if (!priv->strobe.manual)
>> +			dev_warn(dev,
>> +				 "rx%u: 'ti,strobe-pos' ignored as 'ti,manual-strobe' not set\n",
>> +				 nport);
>> +	}
> 
> This and below looks a bit different to the above in the same function. Perhaps
> these can be refactored to be less LoCs.

Hmm what did you have in mind?

>> +	ret = fwnode_property_read_u32(link_fwnode, "ti,eq-level", &eq_level);
>> +	if (ret) {
>> +		if (ret != -EINVAL) {
>> +			dev_err(dev, "rx%u: failed to read 'ti,eq-level': %d\n",
>> +				nport, ret);
>> +			return ret;
>> +		}
>> +	} else if (eq_level > UB960_MAX_EQ_LEVEL) {
>> +		dev_err(dev, "rx%u: illegal 'ti,eq-level' value: %d\n", nport,
>> +			eq_level);
>> +	} else {
>> +		rxport->eq.manual_eq = true;
>> +		rxport->eq.manual.eq_level = eq_level;
>> +	}
>> +
>> +	ret = fwnode_property_read_u32(link_fwnode, "i2c-alias",
>> +				       &ser_i2c_alias);
>> +	if (ret) {
>> +		dev_err(dev, "rx%u: failed to read 'i2c-alias': %d\n", nport,
>> +			ret);
>> +		return ret;
>> +	}
> 
> ...
> 
>> +static struct fwnode_handle *
>> +ub960_fwnode_get_link_by_regs(struct fwnode_handle *links_fwnode,
>> +			      unsigned int nport)
>> +{
>> +	struct fwnode_handle *link_fwnode;
>> +	int ret;
>> +
>> +	fwnode_for_each_child_node(links_fwnode, link_fwnode) {
>> +		u32 link_num;
>> +
>> +		if (strncmp(fwnode_get_name(link_fwnode), "link@", 5) != 0)
>> +			continue;
> 
> str_has_prefix()

I knew there must be a function for this, but didn't find it =).

>> +
>> +		ret = fwnode_property_read_u32(link_fwnode, "reg", &link_num);
>> +		if (ret)
> 
> Refcount imbalance.

Yep.

>> +			return NULL;
>> +
>> +		if (nport == link_num) {
>> +			fwnode_handle_put(link_fwnode);
>> +			return link_fwnode;
>> +		}
>> +	}
>> +
>> +	return NULL;
>> +}
> 
> ...
> 
>> +		asd = v4l2_async_nf_add_fwnode(&priv->notifier,
>> +					       rxport->source_ep_fwnode,
>> +					       struct ub960_asd);
>> +		if (IS_ERR(asd)) {
>> +			dev_err(dev, "Failed to add subdev for source %u: %ld",
> 
> %pe ?

Yep.

>> +				i, PTR_ERR(asd));
>> +			v4l2_async_nf_cleanup(&priv->notifier);
>> +			return PTR_ERR(asd);
>> +		}
> 
> ...
> 
>> +err_pd_gpio:
>> +	if (priv->pd_gpio)
> 
> Dup test.

What do you mean dup? You mean gpiod_set_value_cansleep can be called 
with gpio = NULL? The docs don't say this, but I guess that is the case.

>> +		gpiod_set_value_cansleep(priv->pd_gpio, 1);
> 
> ...
> 
>> +	if (priv->pd_gpio)
>> +		gpiod_set_value_cansleep(priv->pd_gpio, 1);
> 
> Ditto.
> 
> ...
> 
>> +	priv->hw_data = of_device_get_match_data(dev);
> 
> Why of_ out of the blue?!

Hmm... How do I get the data in a generic way? I'll have to study this a 
bit.

>> +	if (!priv->hw_data)
>> +		return -ENODEV;
> 
> ...
> 
>> +	priv->current_indirect_target = 0xff;
>> +	priv->current_read_rxport = 0xff;
>> +	priv->current_write_rxport_mask = 0xff;
>> +	priv->current_read_csiport = 0xff;
>> +	priv->current_write_csiport_mask = 0xff;
> 
> GENMASK()

These are not masks, but invalid values. We set these to an invalid 
value (0xff) so that when a reg access function next time checks if we 
are already targeting, e.g. a particular rxport, it will always opt to 
select the rxport by writing to the approriate registers.

> ...
> 
>> +	ub960_rxport_wait_locks(priv, 0xf, NULL);
> 
> Ditto?

Yep.

> ...
> 
>> +static const struct i2c_device_id ub960_id[] = {
>> +	{ "ds90ub960-q1", 0 },
>> +	{ "ds90ub9702-q1", 0 },
> 
> Why driver data is different to OF case?

I have just never used these so I've missed it. As I said, I need to 
look at this and figure out how to get the data correctly in all the cases.

>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(i2c, ub960_id);
>> +
>> +static const struct of_device_id ub960_dt_ids[] = {
>> +	{ .compatible = "ti,ds90ub960-q1", .data = &ds90ub960_hw },
>> +	{ .compatible = "ti,ds90ub9702-q1", .data = &ds90ub9702_hw },
>> +	{}
>> +};
>> +MODULE_DEVICE_TABLE(of, ub960_dt_ids);
> 
>> +static struct i2c_driver ds90ub960_driver = {
>> +	.probe_new	= ub960_probe,
>> +	.remove		= ub960_remove,
>> +	.id_table	= ub960_id,
>> +	.driver = {
>> +		.name	= "ds90ub960",
> 
>> +		.owner = THIS_MODULE,
> 
> Set by macro from the beginning of its, macro, existence.

Ok.

>> +		.of_match_table = ub960_dt_ids,
>> +	},
>> +};
> 
> ...
> 
>> +struct ds90ub9xx_platform_data {
>> +	u32 port;
>> +	struct i2c_atr *atr;
>> +	unsigned long bc_rate;
> 
> Not sure why we need this to be public except, probably, atr...

The port and atr are used by the serializers, for atr. The bc_rate is 
used by the serializers to figure out the clocking (they may use the 
FPD-Link's frequency internally).

  Tomi

