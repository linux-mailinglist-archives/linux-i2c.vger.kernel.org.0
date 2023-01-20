Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CECB167502B
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Jan 2023 10:06:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbjATJGM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 20 Jan 2023 04:06:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbjATJGL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 20 Jan 2023 04:06:11 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3A0479EAD;
        Fri, 20 Jan 2023 01:06:09 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9251B514;
        Fri, 20 Jan 2023 10:06:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1674205567;
        bh=dkcK/6yZ0ycAlVNr0Xcy9gfSiOR/v9Xdq0blfTKBQiI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=PkPBotcuY5/bSscD764kb7YXOac9X19Rr82TFUpMhv5FqKqUslBswCH+IqPq25aLD
         lNEpesPT2ZYcVY+GL0Yig6CPMn7kMAvpJOfbn38LNJAy81n0h7L1tXNWO8rconZjY7
         BKFSPh37WIME1WFsX8ROo2ekF0/V32dVp5gJtn+k=
Date:   Fri, 20 Jan 2023 11:06:04 +0200
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
Subject: Re: [PATCH v7 6/7] media: i2c: add DS90UB913 driver
Message-ID: <Y8pZfCqiuU+HFs+v@pendragon.ideasonboard.com>
References: <20230118124031.788940-1-tomi.valkeinen@ideasonboard.com>
 <20230118124031.788940-7-tomi.valkeinen@ideasonboard.com>
 <Y8naOd/CmmlYBw2x@pendragon.ideasonboard.com>
 <076ede2c-f682-54cd-95bf-60170e2444a2@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <076ede2c-f682-54cd-95bf-60170e2444a2@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Tomi,

On Fri, Jan 20, 2023 at 09:04:39AM +0200, Tomi Valkeinen wrote:
> On 20/01/2023 02:03, Laurent Pinchart wrote:
> > On Wed, Jan 18, 2023 at 02:40:30PM +0200, Tomi Valkeinen wrote:
> >> Add driver for TI DS90UB913 FPD-Link III Serializer.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >>   drivers/media/i2c/Kconfig     |  13 +
> >>   drivers/media/i2c/Makefile    |   1 +
> >>   drivers/media/i2c/ds90ub913.c | 848 ++++++++++++++++++++++++++++++++++
> >>   3 files changed, 862 insertions(+)
> >>   create mode 100644 drivers/media/i2c/ds90ub913.c

[snip]

> >> diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
> >> new file mode 100644
> >> index 000000000000..befa78128a9a
> >> --- /dev/null
> >> +++ b/drivers/media/i2c/ds90ub913.c
> >> @@ -0,0 +1,848 @@

[snip]

> >> +static int ub913_gpio_direction_out(struct gpio_chip *gc, unsigned int offset,
> >> +				    int value)
> >> +{
> >> +	struct ub913_data *priv = gpiochip_get_data(gc);
> >> +	unsigned int reg_idx = offset / 2;
> >> +	unsigned int field_idx = offset % 2;
> >> +
> >> +	return regmap_update_bits(priv->regmap, UB913_REG_GPIO_CFG(reg_idx),
> >> +				  UB913_REG_GPIO_CFG_MASK(field_idx),
> >> +				  UB913_REG_GPIO_CFG_ENABLE(field_idx) |
> >> +					  (value ? UB913_REG_GPIO_CFG_OUT_VAL(field_idx) :
> >> +						   0));
> > 
> > I find the indentation weird, I would have written
> > 
> > 	return regmap_update_bits(priv->regmap, UB913_REG_GPIO_CFG(reg_idx),
> > 				  UB913_REG_GPIO_CFG_MASK(field_idx),
> > 				  UB913_REG_GPIO_CFG_ENABLE(field_idx) |
> > 				  (value ? UB913_REG_GPIO_CFG_OUT_VAL(field_idx) : 0));
> > 
> > Your call.
> 
> It's clang-format. I still haven't found out how to make it indent as 
> I'd like. Actually, with kernel's clang-format settings this ends up as:
> 
> return regmap_update_bits(
> 	priv->regmap, UB913_REG_GPIO_CFG(reg_idx),
> 	UB913_REG_GPIO_CFG_MASK(field_idx),
> 	UB913_REG_GPIO_CFG_ENABLE(field_idx) |
> 		(value ? UB913_REG_GPIO_CFG_OUT_VAL(field_idx) : 0));

That's horrible indeed.

> But checkpatch complains about line ending with (. Adjusting the 
> settings a bit I got it to indent as it is currently.

It's lovely when tools work together as expected, right ? :-)

> The indent after the line ending with | make sense, I think, but I don't 
> mind your formatting either.

I don't think I've seen that style before. If you prefer it, your code,
your style :-) Just be consistent through the driver in that case.

> >> +}

[snip]

-- 
Regards,

Laurent Pinchart
