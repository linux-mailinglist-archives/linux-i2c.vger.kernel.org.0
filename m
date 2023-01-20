Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 722296750F5
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 10:25:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230104AbjATJZu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 04:25:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230131AbjATJZt (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 04:25:49 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7502A2410C;
        Fri, 20 Jan 2023 01:25:23 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4FCE8514;
        Fri, 20 Jan 2023 10:23:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674206601;
        bh=JKrD2LPmZIg8DUdu9Bi8mpb900m/t1qdRy0MhZDU7Lo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KUxUg+IB7LGF5cNxjASQgL4h+ZEpV9Mx8lIvwZAtTmYZo+QBpAXMdlwlUkApCHVoe
         ydadGthDhKGyV+yQg1XDXOfdB9wmj27ZVThY+Au53Mwa/RCSGD0qNhjAF8O/f/+Oao
         NAAlEQg+ZxtIplUUWbB7lYnSl4IbvPtHByZQW7A0=
Date:   Fri, 20 Jan 2023 11:23:18 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
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
Subject: Re: [PATCH v7 7/7] media: i2c: add DS90UB953 driver
Message-ID: <Y8pdhtG7/Y1Oetqb@pendragon.ideasonboard.com>
References: <20230118124031.788940-1-tomi.valkeinen@ideasonboard.com>
 <20230118124031.788940-8-tomi.valkeinen@ideasonboard.com>
 <Y8nhi6N2vTYJ+Vfh@pendragon.ideasonboard.com>
 <eab3c178-6a10-e949-ebbc-c45094d4b67a@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <eab3c178-6a10-e949-ebbc-c45094d4b67a@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Tomi,

On Fri, Jan 20, 2023 at 10:13:25AM +0200, Tomi Valkeinen wrote:
> On 20/01/2023 02:34, Laurent Pinchart wrote:
> > On Wed, Jan 18, 2023 at 02:40:31PM +0200, Tomi Valkeinen wrote:
> >> Add driver for TI DS90UB953 FPD-Link III Serializer.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >>   drivers/media/i2c/Kconfig     |   13 +
> >>   drivers/media/i2c/Makefile    |    1 +
> >>   drivers/media/i2c/ds90ub953.c | 1576 +++++++++++++++++++++++++++++++++
> >>   3 files changed, 1590 insertions(+)
> >>   create mode 100644 drivers/media/i2c/ds90ub953.c

[snip]

> >> diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
> >> new file mode 100644
> >> index 000000000000..ec33e16da3d1
> >> --- /dev/null
> >> +++ b/drivers/media/i2c/ds90ub953.c
> >> @@ -0,0 +1,1576 @@

[snip]

> >> +__maybe_unused static int ub953_read_ind(struct ub953_data *priv, u8 block,
> >> +					 u8 reg, u8 *val)
> > 
> > I'd still prefer dropping this function, but I won't insist.
> > 
> >> +{
> >> +	unsigned int v;
> >> +	int ret;
> >> +
> >> +	mutex_lock(&priv->reg_lock);
> >> +
> >> +	ret = _ub953_select_ind_reg_block(priv, block);
> >> +	if (ret)
> >> +		goto out;
> >> +
> >> +	ret = regmap_write(priv->regmap, UB953_REG_IND_ACC_ADDR, reg);
> >> +	if (ret) {
> >> +		dev_err(&priv->client->dev,
> >> +			"Write to IND_ACC_ADDR failed when reading %u:%x02x: %d\n",
> >> +			block, reg, ret);
> >> +		goto out;
> >> +	}
> > 
> > Would it make sense to cache the address as you do with
> > current_indirect_block, and skip this write if the address is correct
> > already ? If the device implements auto-increment of the address (I
> > haven't checked), this could save quite a few I2C writes.
> 
> Yes, there's auto increment for these indirect register accesses 
> (IA_AUTO_INC). There's also IA_READ bit, but I don't understand what it 
> does:
> 
> Indirect Access Read:
> Setting this allows generation of a read strobe to the selected register 
> block upon setting of the IND_ACC_ADDR register. In auto-increment mode, 
> read strobes are also asserted following a read of the IND_ACC_DATA 
> register. This function is only required for blocks that need to 
> pre-fetch register data.
> 
> In any case, the indirect accesses are only used when configuring the 
> TPG. I'm sure this can be optimized, but I question the need to do this 
> optimization.
> 
> The UB960 driver uses indirect accesses more often. There it might make 
> a bit more sense, although, again, I don't really see why it matters in 
> practice.
> 
> It doesn't sound like a complex optimization, so maybe it wouldn't 
> increase the chances of bugs much, but... still. Maybe something for later?

I'm fine doing this on top. As you said, it shouldn't be difficult, but
it's also not a must-have right away.

> >> +
> >> +	ret = regmap_read(priv->regmap, UB953_REG_IND_ACC_DATA, &v);
> >> +	if (ret) {
> >> +		dev_err(&priv->client->dev,
> >> +			"Write to IND_ACC_DATA failed when reading %u:%x02x: %d\n",
> >> +			block, reg, ret);
> >> +		goto out;
> >> +	}
> >> +
> >> +	*val = v;
> >> +
> >> +out:
> >> +	mutex_unlock(&priv->reg_lock);
> >> +
> >> +	return ret;
> >> +}

[snip]

-- 
Regards,

Laurent Pinchart
