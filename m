Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F23B65644A
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Dec 2022 18:01:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbiLZRBT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 26 Dec 2022 12:01:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiLZRBS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 26 Dec 2022 12:01:18 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 45600C2B;
        Mon, 26 Dec 2022 09:01:17 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2A2A0A1C;
        Mon, 26 Dec 2022 18:01:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1672074075;
        bh=irlftFZ6CQR1KhY24DKXhiPsC4bMOa8WIpYTJayoAko=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=UwbNYJNX9mUQw62WXtxT7GocsxtkWmIttmo9rMCNgN3YbY3abYEM8CZb2E9XpkLFi
         M6C7YpKJs/gWFrjk137hF75hdYg4j37D0bBoObHOdyuGj1sGMlaXO/nuv2bdnZzbED
         Mk3La9FZVU1h65y+mCwkLyzsX17UDfYvazEcJTus=
Date:   Mon, 26 Dec 2022 19:01:11 +0200
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
Subject: Re: [PATCH v5 7/8] media: i2c: add DS90UB913 driver
Message-ID: <Y6nTV16me9aQL3iT@pendragon.ideasonboard.com>
References: <20221208104006.316606-1-tomi.valkeinen@ideasonboard.com>
 <20221208104006.316606-8-tomi.valkeinen@ideasonboard.com>
 <Y5YiazDtaxtLJyL0@pendragon.ideasonboard.com>
 <4d349785-ca37-d930-db3c-2581bba9fde0@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4d349785-ca37-d930-db3c-2581bba9fde0@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Tomi,

On Wed, Dec 14, 2022 at 08:29:48AM +0200, Tomi Valkeinen wrote:
> On 11/12/2022 20:33, Laurent Pinchart wrote:
> > On Thu, Dec 08, 2022 at 12:40:05PM +0200, Tomi Valkeinen wrote:
> >> Add driver for TI DS90UB913 FPDLink-3 Serializer.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >>   drivers/media/i2c/Kconfig     |  13 +
> >>   drivers/media/i2c/Makefile    |   2 +-
> >>   drivers/media/i2c/ds90ub913.c | 892 ++++++++++++++++++++++++++++++++++
> >>   3 files changed, 906 insertions(+), 1 deletion(-)
> >>   create mode 100644 drivers/media/i2c/ds90ub913.c

[snip]

> >> diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
> >> new file mode 100644
> >> index 000000000000..6001a622e622
> >> --- /dev/null
> >> +++ b/drivers/media/i2c/ds90ub913.c
> >> @@ -0,0 +1,892 @@

[snip]

> >> +static int ub913_notify_bound(struct v4l2_async_notifier *notifier,
> >> +			      struct v4l2_subdev *source_subdev,
> >> +			      struct v4l2_async_subdev *asd)
> >> +{
> >> +	struct ub913_data *priv = sd_to_ub913(notifier->sd);
> >> +	struct device *dev = &priv->client->dev;
> >> +	unsigned int src_pad;
> >> +	int ret;
> >> +
> >> +	dev_dbg(dev, "Bind %s\n", source_subdev->name);
> > 
> > I'd drop this message.
> 
> Why is that? Do we get this easily from the v4l2 core? These debug 
> prints in the bind/unbind process have been valuable for me.

Because debug messages are not meant to be a tracing infrastructure, and
because, if we want to keep this message, it would be best handled in
the v4l2-async core instead of being duplicated across drivers. Same for
the messages at the end of the function.

> >> +
> >> +	ret = media_entity_get_fwnode_pad(&source_subdev->entity,
> >> +					  source_subdev->fwnode,
> >> +					  MEDIA_PAD_FL_SOURCE);
> >> +	if (ret < 0) {
> >> +		dev_err(dev, "Failed to find pad for %s\n",
> >> +			source_subdev->name);
> >> +		return ret;
> >> +	}
> >> +
> >> +	priv->source_sd = source_subdev;
> >> +	src_pad = ret;
> >> +
> >> +	ret = media_create_pad_link(&source_subdev->entity, src_pad,
> >> +				    &priv->sd.entity, 0,
> > 
> > 				    &priv->sd.entity, UB913_PAD_SINK,
> 
> Yep.
> 
> >> +				    MEDIA_LNK_FL_ENABLED |
> >> +				    MEDIA_LNK_FL_IMMUTABLE);
> >> +	if (ret) {
> >> +		dev_err(dev, "Unable to link %s:%u -> %s:0\n",
> >> +			source_subdev->name, src_pad, priv->sd.name);
> >> +		return ret;
> >> +	}
> >> +
> >> +	dev_dbg(dev, "Bound %s:%u\n", source_subdev->name, src_pad);
> >> +
> >> +	dev_dbg(dev, "All subdevs bound\n");
> > 
> > I'd drop this message.
> > 
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static void ub913_notify_unbind(struct v4l2_async_notifier *notifier,
> >> +				struct v4l2_subdev *source_subdev,
> >> +				struct v4l2_async_subdev *asd)
> >> +{
> >> +	struct ub913_data *priv = sd_to_ub913(notifier->sd);
> >> +	struct device *dev = &priv->client->dev;
> >> +
> >> +	dev_dbg(dev, "Unbind %s\n", source_subdev->name);
> >> +}
> > 
> > This is a no-op so you can drop it.
> 
> This has been useful for development, but, yes, perhaps it's time to 
> drop it.
> 
> >> +
> >> +static const struct v4l2_async_notifier_operations ub913_notify_ops = {
> >> +	.bound = ub913_notify_bound,
> >> +	.unbind = ub913_notify_unbind,
> >> +};

[snip]

-- 
Regards,

Laurent Pinchart
