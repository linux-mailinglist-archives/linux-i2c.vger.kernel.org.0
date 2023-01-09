Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA785662242
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jan 2023 10:59:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234418AbjAIJ7O (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 9 Jan 2023 04:59:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234714AbjAIJ6o (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 9 Jan 2023 04:58:44 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A1A2140A0;
        Mon,  9 Jan 2023 01:57:04 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6DA2E6CF;
        Mon,  9 Jan 2023 10:57:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673258222;
        bh=rfR62NKpknun6jgadtE73rwSV1lb2jWlzL1P6GLENz0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FP9wOl+4dCyIrwufbUlwlsNhx6Y8XAH0g9+JfD9ojrLdxAjPG+RSUyTw+aGPbxi9d
         1R+jUDIAOUWnd0L48Tg1udP3CZ8S3cGdcaX8hez7FVBdx5VsRkSdMIuMdup2kT4bRj
         F7ZIZHGVHvDK6zNhp3fUw8Yt9quCN2NQ4G3a0ztw=
Date:   Mon, 9 Jan 2023 11:56:58 +0200
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
Subject: Re: [PATCH v6 7/8] media: i2c: add DS90UB913 driver
Message-ID: <Y7vk6vb1vldHX4TL@pendragon.ideasonboard.com>
References: <20230105140307.272052-1-tomi.valkeinen@ideasonboard.com>
 <20230105140307.272052-8-tomi.valkeinen@ideasonboard.com>
 <Y7pBSq49dL8Fzxsc@pendragon.ideasonboard.com>
 <bff59ee7-8491-1421-0968-ad479615246c@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bff59ee7-8491-1421-0968-ad479615246c@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Tomi,

On Mon, Jan 09, 2023 at 11:40:43AM +0200, Tomi Valkeinen wrote:
> On 08/01/2023 06:06, Laurent Pinchart wrote:
> > On Thu, Jan 05, 2023 at 04:03:06PM +0200, Tomi Valkeinen wrote:
> >> Add driver for TI DS90UB913 FPD-Link III Serializer.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >>   drivers/media/i2c/Kconfig     |  13 +
> >>   drivers/media/i2c/Makefile    |   2 +-
> >>   drivers/media/i2c/ds90ub913.c | 871 ++++++++++++++++++++++++++++++++++
> >>   3 files changed, 885 insertions(+), 1 deletion(-)
> >>   create mode 100644 drivers/media/i2c/ds90ub913.c

[snip]

> >> diff --git a/drivers/media/i2c/ds90ub913.c b/drivers/media/i2c/ds90ub913.c
> >> new file mode 100644
> >> index 000000000000..0a60afb09cd3
> >> --- /dev/null
> >> +++ b/drivers/media/i2c/ds90ub913.c
> >> @@ -0,0 +1,871 @@

[snip]

> >> +static int ub913_log_status(struct v4l2_subdev *sd)
> >> +{
> >> +	struct ub913_data *priv = sd_to_ub913(sd);
> >> +	struct device *dev = &priv->client->dev;
> >> +	u8 v, v1, v2;
> >> +
> >> +	ub913_read(priv, UB913_REG_MODE_SEL, &v);
> >> +	dev_info(dev, "MODE_SEL %#x\n", v);
> > 
> > %#02x ? Same below.
> 
> Ok.
> 
> >> +
> >> +	ub913_read(priv, UB913_REG_CRC_ERRORS_LSB, &v1);
> >> +	ub913_read(priv, UB913_REG_CRC_ERRORS_MSB, &v2);
> > 
> > Looks racy, but if it's for debugging only, I suppose it's fine.
> 
> Well, nothing we can do about that in SW. In any case, I think for the 
> user the value is either "none", "just a few", "a lot", so maybe the 
> racyness doesn't matter.

It could be improved in software:


	do {
		ub913_read(priv, UB913_REG_CRC_ERRORS_MSB, &msb);
		ub913_read(priv, UB913_REG_CRC_ERRORS_LSB, &lsb);
		ub913_read(priv, UB913_REG_CRC_ERRORS_MSB, &msb2);
	} while (msb1 != msb2);

but I think it's overkill.

> >> +	dev_info(dev, "CRC errors %u\n", v1 | (v2 << 8));
> >> +
> >> +	ub913_read(priv, UB913_REG_GENERAL_STATUS, &v);
> >> +	dev_info(dev, "GENERAL_STATUS %#x\n", v);
> >> +
> >> +	ub913_read(priv, UB913_REG_PLL_OVR, &v);
> >> +	dev_info(dev, "PLL_OVR %#x\n", v);
> >> +
> >> +	/* clear CRC errors */
> >> +	ub913_read(priv, UB913_REG_GENERAL_CFG, &v);
> >> +	ub913_write(priv, UB913_REG_GENERAL_CFG, v | UB913_REG_GENERAL_CFG_CRC_ERR_RESET);
> > 
> > Line wrap.
> 
> Ok.
> 
> >> +	ub913_write(priv, UB913_REG_GENERAL_CFG, v);
> > 
> > Move this just after reading the number of CRC errors to avoid dropping
> > some errors.
> 
> Ok.
> 
> >> +
> >> +	return 0;
> >> +}

[snip]

> >> +static int ub913_probe(struct i2c_client *client)
> >> +{
> >> +	struct device *dev = &client->dev;
> >> +	struct ub913_data *priv;
> >> +	int ret;
> >> +	u8 v;
> >> +	bool mode_override;
> >> +	u8 mode;
> >> +
> >> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> >> +	if (!priv)
> >> +		return -ENOMEM;
> >> +
> >> +	priv->client = client;
> >> +
> >> +	priv->plat_data = dev_get_platdata(&client->dev);
> >> +	if (!priv->plat_data) {
> >> +		dev_err(dev, "Platform data missing\n");
> >> +		return -ENODEV;
> >> +	}
> >> +
> >> +	priv->regmap = devm_regmap_init_i2c(client, &ub913_regmap_config);
> >> +	if (IS_ERR(priv->regmap)) {
> >> +		dev_err(dev, "Failed to init regmap\n");
> >> +		return PTR_ERR(priv->regmap);
> >> +	}
> >> +
> >> +	/* ub913 can also work without ext clock, but that is not supported */
> > 
> > Maybe "not supported by the driver yet." to make it clear it could be
> > added ?
> 
> Ok.
> 
> >> +	priv->clkin = devm_clk_get(dev, "clkin");
> >> +	if (IS_ERR(priv->clkin)) {
> >> +		ret = PTR_ERR(priv->clkin);
> >> +		if (ret != -EPROBE_DEFER)
> >> +			dev_err(dev, "Cannot get CLKIN (%d)", ret);
> > 
> > Use dev_err_probe().
> 
> Ok.
> 
> >> +		return ret;
> >> +	}
> >> +
> >> +	ret = ub913_parse_dt(priv);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	ret = ub913_read(priv, UB913_REG_MODE_SEL, &v);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	if (!(v & UB913_REG_MODE_SEL_MODE_UP_TO_DATE)) {
> >> +		dev_err(dev, "Mode value not stabilized\n");
> >> +		return -ENODEV;
> >> +	}
> >> +
> >> +	mode_override = v & UB913_REG_MODE_SEL_MODE_OVERRIDE;
> >> +	mode = v & 0xf;
> > 
> > A macro for the 0xf would be nice.
> 
> Ok.
> 
> >> +
> >> +	dev_dbg(dev, "mode from %s: %#x\n",
> >> +		mode_override ? "reg" : "deserializer", mode);
> >> +
> >> +	ret = ub913_i2c_master_init(priv);
> >> +	if (ret) {
> >> +		dev_err(dev, "i2c master init failed: %d\n", ret);
> >> +		return ret;
> >> +	}
> >> +
> >> +	ret = ub913_gpiochip_probe(priv);
> >> +	if (ret) {
> >> +		dev_err(dev, "Failed to init gpiochip\n");
> >> +		return ret;
> >> +	}
> >> +
> >> +	ret = ub913_register_clkout(priv);
> >> +	if (ret) {
> >> +		dev_err(dev, "Failed to register clkout\n");
> >> +		goto err_gpiochip_remove;
> >> +	}
> >> +
> >> +	ub913_read(priv, UB913_REG_GENERAL_CFG, &v);
> >> +	v &= ~UB913_REG_GENERAL_CFG_PCLK_RISING;
> >> +	v |= priv->pclk_polarity ? UB913_REG_GENERAL_CFG_PCLK_RISING : 0;
> >> +	ub913_write(priv, UB913_REG_GENERAL_CFG, v);
> > 
> > We're completely missing power management, but I suppose that can be
> > done later.
> 
> Yes. I'm not sure how that would be implemented. The serializer and the 
> whole camera module depends on the deserializer. In most cases both the 
> power and the communication comes from the deserializer over the 
> FPD-Link cable. I'm not sure if there's much the serializer can do alone 
> wrt. the power management.
> 
> Hmm, do we need a full bus structure for the FPD-Link after all, so that 
> we get power management features? Although that would mean also the 
> other peripherals on the camera module should somehow be involved, as we 
> can't turn off the deserializer and the serializer without somehow being 
> permitted by the other peripherals (like sensor).

I suppose time will tell :-)

> > Should this be grouped with the UB913_REG_MODE_SEL check above, and
> > maybe moved to a hardware init function ?
> 
> Yes, I can try to restructure this a bit. I guess if we add a hw init 
> function, also the ub913_i2c_master_init() would be called from there.
> 
> >> +
> >> +	v4l2_i2c_subdev_init(&priv->sd, priv->client, &ub913_subdev_ops);
> >> +	priv->sd.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
> >> +	priv->sd.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
> >> +	priv->sd.entity.ops = &ub913_entity_ops;
> >> +
> >> +	priv->pads[0].flags = MEDIA_PAD_FL_SINK;
> >> +	priv->pads[1].flags = MEDIA_PAD_FL_SOURCE;
> >> +
> >> +	ret = media_entity_pads_init(&priv->sd.entity, 2, priv->pads);
> >> +	if (ret) {
> >> +		dev_err(dev, "Failed to init pads\n");
> >> +		goto err_gpiochip_remove;
> >> +	}
> >> +
> >> +	priv->tx_ep_np = of_graph_get_endpoint_by_regs(dev->of_node, 1, 0);
> >> +	if (priv->tx_ep_np)
> >> +		priv->sd.fwnode = of_fwnode_handle(priv->tx_ep_np);
> > 
> > Can we meaningfully continue with tx_ep_np is NULL, or should that be an
> > error ?
> 
> The matching part of v4l2 is not quite clear to me. I believe I took 
> this part from some other driver. The driver doesn't need the tx_ep_np, 
> afaiu this is only to help with the subdev connection matching. Is it 
> possible the matching could happen some other way than via fwnode?

In general yes, in practice we require DT so we will never match through
another mean.

> That said... We require DT, so I think that means the tx_ep_np must be 
> there. If it's not, something is wrong, and we'd better fail. So, I 
> think I can handle !tx_ep_np as an error.

Sounds good to me.

> >> +
> >> +	ret = v4l2_subdev_init_finalize(&priv->sd);
> >> +	if (ret)
> >> +		goto err_entity_cleanup;
> >> +
> >> +	ret = ub913_v4l2_notifier_register(priv);
> >> +	if (ret) {
> >> +		dev_err(dev, "v4l2 subdev notifier register failed: %d\n", ret);
> >> +		goto err_free_state;
> >> +	}
> >> +
> >> +	ret = v4l2_async_register_subdev(&priv->sd);
> >> +	if (ret) {
> >> +		dev_err(dev, "v4l2_async_register_subdev error: %d\n", ret);
> >> +		goto err_unreg_notif;
> >> +	}
> >> +
> >> +	ret = ub913_add_i2c_adapter(priv);
> >> +	if (ret) {
> >> +		dev_err(dev, "failed to add remote i2c adapter\n");
> >> +		goto err_unreg_async_subdev;
> >> +	}
> >> +
> >> +	return 0;
> >> +
> >> +err_unreg_async_subdev:
> >> +	v4l2_async_unregister_subdev(&priv->sd);
> >> +err_unreg_notif:
> >> +	ub913_v4l2_nf_unregister(priv);
> >> +err_free_state:
> > 
> > I'd name this err_subdev_cleanup.
> 
> Yep.
> 
> >> +	v4l2_subdev_cleanup(&priv->sd);
> >> +err_entity_cleanup:
> >> +	if (priv->tx_ep_np)
> >> +		of_node_put(priv->tx_ep_np);
> > 
> > of_node_put() is a no-op when called with NULL, you can drop the check.
> > Same below.
> 
> Ok.
> 
> >> +
> >> +	media_entity_cleanup(&priv->sd.entity);
> >> +err_gpiochip_remove:
> >> +	ub913_gpiochip_remove(priv);
> >> +
> >> +	return ret;
> >> +}
> >> +
> >> +static void ub913_remove(struct i2c_client *client)
> >> +{
> >> +	struct v4l2_subdev *sd = i2c_get_clientdata(client);
> >> +	struct ub913_data *priv = sd_to_ub913(sd);
> >> +
> >> +	i2c_atr_del_adapter(priv->plat_data->atr,
> >> +			    priv->plat_data->port);
> >> +
> >> +	v4l2_async_unregister_subdev(&priv->sd);
> >> +
> >> +	ub913_v4l2_nf_unregister(priv);
> >> +
> >> +	v4l2_subdev_cleanup(&priv->sd);
> >> +
> >> +	if (priv->tx_ep_np)
> >> +		of_node_put(priv->tx_ep_np);
> >> +
> >> +	media_entity_cleanup(&priv->sd.entity);
> >> +
> >> +	ub913_gpiochip_remove(priv);
> >> +}

-- 
Regards,

Laurent Pinchart
