Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B27E672210
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Jan 2023 16:50:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231360AbjARPut (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Jan 2023 10:50:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbjARPuF (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 18 Jan 2023 10:50:05 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BD8230B30;
        Wed, 18 Jan 2023 07:48:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674056904; x=1705592904;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZWbnUn4B5fBSva7vE2raTJIlzw4OCgDgJjhoZ2y7df4=;
  b=Vtn3VVeojmCdl+zFQc++sLB4k1gRl1G7477EVCHyiK43oFoTIjJyaNXy
   CFT3SYHHXuOyxQ6HKKsLsQWV7bMSvMsEW7U0Zocj1DlC01pMcPXT6RAyt
   Td+zSo6ZTa22wWDQz8XOP2wsZtkM+S8E0vMEWm9lmcYDOmoSKQxl8n8nb
   IAwURfpnrAWdeNYwfO0ByrC8o/WyFnu1BdU0Dysz0GAAN/M8UxDCG0EWz
   gZ27rKSRZ3XNZUMYZ6J8fgXaCfNhuWkHkx3swO0RQljibgchGgdlkzX7n
   ctf8/h/L6TjjpccLiulpJ+ayXHQVghTWP0ofnyRV92AVxChEY2Pcg0yHM
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="325066300"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="325066300"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 07:48:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="728252551"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="728252551"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 18 Jan 2023 07:48:13 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1pIAfa-00BFcJ-21;
        Wed, 18 Jan 2023 17:48:10 +0200
Date:   Wed, 18 Jan 2023 17:48:10 +0200
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
Message-ID: <Y8gUuqLBXsXQoNUC@smile.fi.intel.com>
References: <20230118124031.788940-1-tomi.valkeinen@ideasonboard.com>
 <20230118124031.788940-6-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118124031.788940-6-tomi.valkeinen@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jan 18, 2023 at 02:40:29PM +0200, Tomi Valkeinen wrote:
> Add driver for TI DS90UB960 FPD-Link III Deserializer.

...

> +#define UB960_MIN_AEQ_STROBE_POS -7

I believe it might need parentheses due to theoretical possibilities to be used
in the expression.

...

> +#define UB960_MIN_MANUAL_STROBE_POS -(7 + 6)

Ditto.

...

> +	ret = regmap_read(priv->regmap, reg, &v);
> +	if (ret)
> +		dev_err(dev, "%s: cannot read register 0x%02x (%d)!\n",
> +			__func__, reg, ret);

Not sure how this messages are useful and esp. parameters, since regmap has
already trace events. Maybe it's possible to narrow regmap traces to the
dedicated functions?

> +	else
> +		*val = v;

...

> +	if (priv->current_read_rxport == nport &&
> +	    priv->current_write_rxport_mask == BIT(nport))
> +		return 0;
> +
> +	ret = regmap_write(priv->regmap, UB960_SR_FPD3_PORT_SEL,
> +			   (nport << 4) | (1 << nport));

Any reason why not BIT() here, while above and below it's being used?

> +	if (ret) {
> +		dev_err(dev, "%s: cannot select rxport %d (%d)!\n", __func__,
> +			nport, ret);
> +		return ret;
> +	}

> +	priv->current_read_rxport = nport;
> +	priv->current_write_rxport_mask = BIT(nport);
> +
> +	return 0;
> +}

...

> +static int _ub960_csiport_select(struct ub960_data *priv, u8 nport)
> +{

Same comment as above.

> +}

...

> +out:

out_unlock: ?

> +	mutex_unlock(&priv->reg_lock);
> +
> +	return ret;

Also in some cases you are using 'else' (as 'if (ret) ... else') in some goto
approach. Can it be unified?

...

> +	v &= ~mask;
> +	v |= val;

Usual pattern we use is

	v = (v & ~mask) | (val & mask);

But can you use regmap_update_bits()? And why not?

...

> +	ret = fwnode_property_count_u32(ep_fwnode, "data-lanes");
> +	if (ret <= 0) {
> +		dev_err(dev, "tx%u: failed to parse 'data-lanes': %d\n", nport,
> +			ret);

Message is not consistent with the case ret == 0.

> +		goto err_free_txport;
> +	}

...

> +	if (ret != 1) {
> +		dev_err(dev,
> +			"tx%u: 'link-frequencies' must contain a single frequency: %d\n",
> +			nport, ret);
> +		goto err_free_txport;
> +	}

Shouldn't be here.
As Rob Herring told at least once that driver must not replace DT validator.

...

> +	if (priv->tx_data_rate != 1600000000 &&
> +	    priv->tx_data_rate != 1200000000 &&
> +	    priv->tx_data_rate != 800000000 &&
> +	    priv->tx_data_rate != 400000000) {
> +		dev_err(dev, "tx%u: invalid 'link-frequencies' value\n", nport);
> +		return -EINVAL;
> +	}

Ditto.

...

> +	dev_dbg(dev, "tx%u: nominal data rate: %u", nport, priv->tx_data_rate);

All these kind of debugging are needed for production?

...

> +static void ub960_csi_handle_events(struct ub960_data *priv, u8 nport)
> +{
> +	struct device *dev = &priv->client->dev;
> +	u8 csi_tx_isr;
> +	int ret;

> +	ret = ub960_csiport_read(priv, nport, UB960_TR_CSI_TX_ISR, &csi_tx_isr);
> +

Redundant blank line.

> +	if (!ret) {

What's wrong with the positive and traditional check, i.e.

	if (ret)
		return;

?

> +		if (csi_tx_isr & UB960_TR_CSI_TX_ISR_IS_CSI_SYNC_ERROR)
> +			dev_warn(dev, "TX%u: CSI_SYNC_ERROR\n", nport);
> +
> +		if (csi_tx_isr & UB960_TR_CSI_TX_ISR_IS_CSI_PASS_ERROR)
> +			dev_warn(dev, "TX%u: CSI_PASS_ERROR\n", nport);
> +	}
> +}

...

> +/* -----------------------------------------------------------------------------
> + * RX ports
> + */

Multi-line comment is not in the style.

...

> +	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {

Post-increment is good enough, no? Ditto for other places.
Esp. taking into account that some of them are using actually
post-inc. Why this difference?

> +		struct ub960_rxport *rxport = priv->rxports[nport];
> +
> +		if (!rxport || !rxport->vpoc)
> +			continue;
> +
> +		ret = regulator_enable(rxport->vpoc);
> +		if (ret)
> +			goto err_disable_vpocs;
> +	}

...

> +err_disable_vpocs:
> +	for (; nport > 0; --nport) {

	while (nport--) {

> +		struct ub960_rxport *rxport = priv->rxports[nport - 1];
> +
> +		if (!rxport || !rxport->vpoc)
> +			continue;
> +
> +		regulator_disable(rxport->vpoc);
> +	}

...

> +	if (WARN_ON(strobe_pos < UB960_MIN_MANUAL_STROBE_POS ||
> +		    strobe_pos > UB960_MAX_MANUAL_STROBE_POS))
> +		return;

Always be careful about WARN*() APIs because with a little trick they may
become equivalent to BUG() which is a beast that nobody likes. I.o.w.
you have to have justify why this is needed and can't be replaced with
dev_*() or analogue.

Same for the other places with WARN*().

...

> +	if (strobe_pos < -7)
> +		clk_delay = abs(strobe_pos) - 6;
> +	else if (strobe_pos > 7)
> +		data_delay = strobe_pos - 6;
> +	else if (strobe_pos < 0)
> +		clk_delay = abs(strobe_pos) | UB960_IR_RX_ANA_STROBE_SET_CLK_NO_EXTRA_DELAY;
> +	else if (strobe_pos > 0)
> +		data_delay = strobe_pos | UB960_IR_RX_ANA_STROBE_SET_DATA_NO_EXTRA_DELAY;

I'm wondering if clamp_t()/clamp_val() can be utilised here... And maybe in other
places in the driver.

...

> +	ub960_write(priv, UB960_XR_SFILTER_CFG,

> +		    ((u8)strobe_min << UB960_XR_SFILTER_CFG_SFILTER_MIN_SHIFT) |
> +		    ((u8)strobe_max << UB960_XR_SFILTER_CFG_SFILTER_MAX_SHIFT));

Why castings are needed?

...

> +	*eq_level = (v & 0x7) + ((v >> 3) & 0x7);

GENMASK()?


> +	if (eq_level <= 7) {
> +		eq_stage_1_select_value = eq_level;
> +		eq_stage_2_select_value = 0;
> +	} else {
> +		eq_stage_1_select_value = 7;
> +		eq_stage_2_select_value = eq_level - 7;

A lot of magic 7 in the code. Are they all of the same semantic? Are they can
be converted to use a macro (including respective MIN/MAX macros)?

...

> +	WARN_ON(eq_stage_1_select_value > 7);
> +	WARN_ON(eq_stage_2_select_value > 7);

Why WARN()?

...

> +	ub960_rxport_read(priv, nport, UB960_RR_AEQ_BYPASS, &v);
> +
> +	v &= ~(UB960_RR_AEQ_BYPASS_EQ_STAGE1_VALUE_MASK |
> +	       UB960_RR_AEQ_BYPASS_EQ_STAGE2_VALUE_MASK);
> +	v |= eq_stage_1_select_value << UB960_RR_AEQ_BYPASS_EQ_STAGE1_VALUE_SHIFT;
> +	v |= eq_stage_2_select_value << UB960_RR_AEQ_BYPASS_EQ_STAGE2_VALUE_SHIFT;
> +	v |= UB960_RR_AEQ_BYPASS_ENABLE; /* Enable AEQ Bypass */
> +
> +	ub960_rxport_write(priv, nport, UB960_RR_AEQ_BYPASS, v);

Can't you provide ub960_rxport_update_bits() ?

...

> +	ret = ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_HI, &v1);
> +	if (ret)
> +		return ret;
> +
> +	ret = ub960_rxport_read(priv, nport, UB960_RR_RX_PAR_ERR_LO, &v2);
> +	if (ret)
> +		return ret;

Can this be read at once as BE16/LE16 value?
Or if the stream of bytes, you can use le/be16_to_cpu().

> +	parity_errors = (v1 << 8) | v2;

...

> +	errors = (rx_port_sts1 & 0x2c) || (rx_port_sts2 & 0x20) ||
> +		 (bcc_sts & 0x3f) || (csi_rx_sts & 0xf) || csi_err_cnt ||

BIT()? GENMASK()?

At bare minimum this needs a good comment to explain all these magics.

> +		 parity_errors;

...

> +	*ok = !errors;

How this is different to the something like returning 1 here (and 0 above)?
You may save some code by dropping redundant parameter.

> +	return 0;

...

> +	while (time_before(jiffies, timeout)) {
> +		missing = 0;
> +
> +		for_each_set_bit(nport, &port_mask,
> +				 priv->hw_data->num_rxports) {
> +			struct ub960_rxport *rxport = priv->rxports[nport];
> +			bool ok;
> +
> +			if (!rxport)
> +				continue;
> +
> +			ret = ub960_rxport_link_ok(priv, nport, &ok);
> +			if (ret)
> +				return ret;
> +
> +			if (!ok || !(link_ok_mask & BIT(nport)))
> +				missing++;
> +
> +			if (ok)
> +				link_ok_mask |= BIT(nport);
> +			else
> +				link_ok_mask &= ~BIT(nport);
> +		}
> +
> +		loops++;
> +
> +		if (missing == 0)
> +			break;
> +
> +		msleep(50);
> +	}

You can wrap the body into readx_poll_timeout() from iopoll.h.

...

> +		ub960_rxport_read(priv, nport, UB960_RR_RX_FREQ_HIGH, &v1);
> +		ub960_rxport_read(priv, nport, UB960_RR_RX_FREQ_LOW, &v2);

Same Q, can these be unified to some kind of bulk read?

...

> +		dev_dbg(dev, "\trx%u: locked, SP: %d, EQ: %u, freq %u Hz\n",
> +			nport, strobe_pos, eq_level,
> +			v1 * 1000000 + v2 * 1000000 / 256);

Even this will be simpler with above suggestion.

...

> +static int ub960_rxport_add_serializers(struct ub960_data *priv)
> +{
> +	unsigned int nport;
> +	int ret;
> +
> +	for (nport = 0; nport < priv->hw_data->num_rxports; ++nport) {

Post-inc?

> +		struct ub960_rxport *rxport = priv->rxports[nport];
> +
> +		if (!rxport)
> +			continue;
> +
> +		ret = ub960_rxport_add_serializer(priv, nport);
> +		if (ret)
> +			goto err_remove_sers;
> +	}
> +
> +	return 0;
> +
> +err_remove_sers:
> +	for (; nport > 0; --nport) {

	while(nport--)

(and drop those -1:s below)

> +		struct ub960_rxport *rxport = priv->rxports[nport - 1];
> +
> +		if (!rxport)
> +			continue;
> +
> +		rxport = priv->rxports[nport - 1];
> +		if (!rxport)
> +			continue;
> +
> +		ub960_rxport_remove_serializer(priv, nport - 1);
> +	}
> +
> +	return ret;
> +}

...

> +	if (priv->tx_data_rate == 1600000000)

Easy to make a mistake, perhaps something from units.h / time.h can be used?

> +		csi_ctl |= UB960_TR_CSI_CTL_CSI_CAL_EN;

...

> +	switch (priv->tx_data_rate) {
> +	case 1600000000:
> +	default:
> +		speed_select = 0;
> +		pll_div = 0x10;
> +		break;
> +	case 1200000000:
> +		speed_select = 1;
> +		break;
> +	case 800000000:
> +		speed_select = 2;
> +		pll_div = 0x10;
> +		break;
> +	case 400000000:
> +		speed_select = 3;
> +		pll_div = 0x10;
> +		break;
> +	}

Ditto, but maybe defines for them?

...

> +	switch (rxport->rx_mode) {
> +	default:
> +		WARN_ON(true);
> +		fallthrough;

Maybe you can drop default completely and rely on compiler to produce a
warning?

> +	case RXPORT_MODE_RAW10:
> +		/*
> +		 * RAW10_8BIT_CTL = 0b11 : 8-bit processing using lower 8 bits
> +		 * 0b10 : 8-bit processing using upper 8 bits
> +		 */
> +		ub960_rxport_update_bits(priv, nport, UB960_RR_PORT_CONFIG2,
> +					 0x3 << 6, 0x2 << 6);
> +
> +		break;
> +
> +	case RXPORT_MODE_CSI2_SYNC:
> +	case RXPORT_MODE_CSI2_ASYNC:
> +
> +		break;
> +	}

...

> +	u8 cur_vc[UB960_MAX_TX_NPORTS] = { 0 };

0 is not needed.

...

> +	for (i = 0; i < routing->num_routes; ++i) {
> +		struct v4l2_subdev_route *route = &routing->routes[i];
> +		unsigned int rx, tx;
> +
> +		rx = ub960_pad_to_port(priv, route->sink_pad);

> +

Redundant blank line.

> +		if (BIT(rx) & handled_mask)
> +			continue;
> +
> +		tx = ub960_pad_to_port(priv, route->source_pad);
> +
> +		vc[rx] = cur_vc[tx]++;
> +		handled_mask |= BIT(rx);
> +	}

...

> +		if (rx_data[nport].tx_port == 1)
> +			fwd_ctl |= BIT(nport); /* forward to TX1 */
> +		else
> +			fwd_ctl &= ~BIT(nport); /* forward to TX0 */

This and many other similar places can be replaced by __assign_bit()
if the lvalue is type of unsigned long or can be made that type.

...

> +static void ub960_update_streaming_status(struct ub960_data *priv)
> +{
> +	unsigned int i;

> +	bool streaming = false;

Redundant

> +	for (i = 0; i < UB960_MAX_NPORTS; ++i) {
> +		if (priv->stream_enable_mask[i]) {
> +			streaming = true;
> +			break;
> +		}
> +	}

> +	priv->streaming = streaming;

	priv->streaming = i < UB960_MAX_NPORTS;

> +}

...

> +				for (; nport > 0; --nport) {

				while (nport--)

> +					if (pad_stream_masks[nport - 1] == 0)
> +						continue;
> +
> +					ub960_disable_streams(
> +						sd, state,
> +						priv->hw_data->num_rxports +
> +							nport - 1,
> +						pad_stream_masks[nport - 1]);
> +				}

...

> +	char id[7];

u8?

> +	for (unsigned int i = 0; i < 6; ++i)
> +		ub960_read(priv, UB960_SR_FPD3_RX_ID(i), &id[i]);
> +	id[6] = 0;

If it's only for printing, the 0 is not needed...

> +	dev_info(dev, "ID '%s'\n", id);

...as you may put it as

	dev_info(dev, "ID: '%.*s'\n", (int)sizeof(id), id);

(I wrote from the top of my head, maybe not compilable as is).

...

> +static irqreturn_t ub960_handle_events(int irq, void *arg)
> +{
> +	struct ub960_data *priv = arg;
> +	unsigned int i;
> +	u8 int_sts;
> +	int ret;

> +	ret = ub960_read(priv, UB960_SR_INTERRUPT_STS, &int_sts);

> +

Redundant blank line. I guess you may decrease your code by ~2.5% by removing
such unneeded blank lines here and there.

> +	if (!ret && int_sts) {

	if (ret)
		return ...

	if (!int_sts)
		return IRQ_NONE; // No?

> +		u8 fwd_sts;
> +
> +		dev_dbg(&priv->client->dev, "INTERRUPT_STS %x\n", int_sts);
> +
> +		ub960_read(priv, UB960_SR_FWD_STS, &fwd_sts);
> +
> +		dev_dbg(&priv->client->dev, "FWD_STS %#02x\n", fwd_sts);
> +
> +		for (i = 0; i < priv->hw_data->num_txports; ++i) {
> +			if (int_sts & UB960_SR_INTERRUPT_STS_IS_CSI_TX(i))
> +				ub960_csi_handle_events(priv, i);
> +		}
> +
> +		for (i = 0; i < priv->hw_data->num_rxports; i++) {
> +			if (!priv->rxports[i])
> +				continue;
> +
> +			if (int_sts & UB960_SR_INTERRUPT_STS_IS_RX(i))
> +				ub960_rxport_handle_events(priv, i);
> +		}
> +	}

> +	return IRQ_HANDLED;
> +}

...

> +	if (cdr_mode > RXPORT_CDR_LAST) {
> +		dev_err(dev, "rx%u: bad 'ti,cdr-mode' %u\n", nport, cdr_mode);
> +		return -EINVAL;
> +	}

No DT validation if it's not used in (memory) allocation.

...

> +	ret = fwnode_property_read_u32(link_fwnode, "ti,strobe-pos",
> +				       &strobe_pos);
> +	if (ret) {
> +		if (ret != -EINVAL) {
> +			dev_err(dev,
> +				"rx%u: failed to read 'ti,strobe-pos': %d\n",
> +				nport, ret);
> +			return ret;
> +		}
> +	} else if (strobe_pos < UB960_MIN_MANUAL_STROBE_POS ||
> +		   strobe_pos > UB960_MAX_MANUAL_STROBE_POS) {
> +		dev_err(dev, "rx%u: illegal 'strobe-pos' value: %d\n", nport,
> +			strobe_pos);
> +	} else {
> +		// NOTE: ignored unless global manual strobe pos is set

Style?

> +		rxport->eq.strobe_pos = strobe_pos;
> +		if (!priv->strobe.manual)
> +			dev_warn(dev,
> +				 "rx%u: 'ti,strobe-pos' ignored as 'ti,manual-strobe' not set\n",
> +				 nport);
> +	}

This and below looks a bit different to the above in the same function. Perhaps
these can be refactored to be less LoCs.

> +	ret = fwnode_property_read_u32(link_fwnode, "ti,eq-level", &eq_level);
> +	if (ret) {
> +		if (ret != -EINVAL) {
> +			dev_err(dev, "rx%u: failed to read 'ti,eq-level': %d\n",
> +				nport, ret);
> +			return ret;
> +		}
> +	} else if (eq_level > UB960_MAX_EQ_LEVEL) {
> +		dev_err(dev, "rx%u: illegal 'ti,eq-level' value: %d\n", nport,
> +			eq_level);
> +	} else {
> +		rxport->eq.manual_eq = true;
> +		rxport->eq.manual.eq_level = eq_level;
> +	}
> +
> +	ret = fwnode_property_read_u32(link_fwnode, "i2c-alias",
> +				       &ser_i2c_alias);
> +	if (ret) {
> +		dev_err(dev, "rx%u: failed to read 'i2c-alias': %d\n", nport,
> +			ret);
> +		return ret;
> +	}

...

> +static struct fwnode_handle *
> +ub960_fwnode_get_link_by_regs(struct fwnode_handle *links_fwnode,
> +			      unsigned int nport)
> +{
> +	struct fwnode_handle *link_fwnode;
> +	int ret;
> +
> +	fwnode_for_each_child_node(links_fwnode, link_fwnode) {
> +		u32 link_num;
> +
> +		if (strncmp(fwnode_get_name(link_fwnode), "link@", 5) != 0)
> +			continue;

str_has_prefix()

> +
> +		ret = fwnode_property_read_u32(link_fwnode, "reg", &link_num);
> +		if (ret)

Refcount imbalance.

> +			return NULL;
> +
> +		if (nport == link_num) {
> +			fwnode_handle_put(link_fwnode);
> +			return link_fwnode;
> +		}
> +	}
> +
> +	return NULL;
> +}

...

> +		asd = v4l2_async_nf_add_fwnode(&priv->notifier,
> +					       rxport->source_ep_fwnode,
> +					       struct ub960_asd);
> +		if (IS_ERR(asd)) {
> +			dev_err(dev, "Failed to add subdev for source %u: %ld",

%pe ?

> +				i, PTR_ERR(asd));
> +			v4l2_async_nf_cleanup(&priv->notifier);
> +			return PTR_ERR(asd);
> +		}

...

> +err_pd_gpio:
> +	if (priv->pd_gpio)

Dup test.

> +		gpiod_set_value_cansleep(priv->pd_gpio, 1);

...

> +	if (priv->pd_gpio)
> +		gpiod_set_value_cansleep(priv->pd_gpio, 1);

Ditto.

...

> +	priv->hw_data = of_device_get_match_data(dev);

Why of_ out of the blue?!

> +	if (!priv->hw_data)
> +		return -ENODEV;

...

> +	priv->current_indirect_target = 0xff;
> +	priv->current_read_rxport = 0xff;
> +	priv->current_write_rxport_mask = 0xff;
> +	priv->current_read_csiport = 0xff;
> +	priv->current_write_csiport_mask = 0xff;

GENMASK()

...

> +	ub960_rxport_wait_locks(priv, 0xf, NULL);

Ditto?

...

> +static const struct i2c_device_id ub960_id[] = {
> +	{ "ds90ub960-q1", 0 },
> +	{ "ds90ub9702-q1", 0 },

Why driver data is different to OF case?

> +	{}
> +};
> +MODULE_DEVICE_TABLE(i2c, ub960_id);
> +
> +static const struct of_device_id ub960_dt_ids[] = {
> +	{ .compatible = "ti,ds90ub960-q1", .data = &ds90ub960_hw },
> +	{ .compatible = "ti,ds90ub9702-q1", .data = &ds90ub9702_hw },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, ub960_dt_ids);

> +static struct i2c_driver ds90ub960_driver = {
> +	.probe_new	= ub960_probe,
> +	.remove		= ub960_remove,
> +	.id_table	= ub960_id,
> +	.driver = {
> +		.name	= "ds90ub960",

> +		.owner = THIS_MODULE,

Set by macro from the beginning of its, macro, existence.

> +		.of_match_table = ub960_dt_ids,
> +	},
> +};

...

> +struct ds90ub9xx_platform_data {
> +	u32 port;
> +	struct i2c_atr *atr;
> +	unsigned long bc_rate;

Not sure why we need this to be public except, probably, atr...

-- 
With Best Regards,
Andy Shevchenko


