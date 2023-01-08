Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9C4E66136B
	for <lists+linux-i2c@lfdr.de>; Sun,  8 Jan 2023 04:13:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231701AbjAHDN1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 7 Jan 2023 22:13:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbjAHDN0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 7 Jan 2023 22:13:26 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9E4712ABD;
        Sat,  7 Jan 2023 19:13:24 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 46B276CF;
        Sun,  8 Jan 2023 04:13:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1673147602;
        bh=KZg98FPcx+efWeCx3EHfs6odJUiLtbddY3LoABxjahk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aAFRw9g1/Kw/Q+7DfBglawegBNYZyQCKVvPq98guX0sS0dADCDNw+UG9l08oA9kVp
         FS6vjH4LrwNVc27AeRKA9PE24fl+TK/oCvI5ZjRV6ZXDbJePtIMdmcIFOpQ9m0Kxp0
         keJ2iY3M5KNnMXYiI80M5iRJWSNWRHGbT9XbvJc0=
Date:   Sun, 8 Jan 2023 05:13:18 +0200
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
        Marek Vasut <marex@denx.de>,
        Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH v6 1/8] i2c: core: let adapters be notified of client
 attach/detach
Message-ID: <Y7o0zn9WdsLr15r9@pendragon.ideasonboard.com>
References: <20230105140307.272052-1-tomi.valkeinen@ideasonboard.com>
 <20230105140307.272052-2-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230105140307.272052-2-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Tomi,

Thank you for the patch.

On Thu, Jan 05, 2023 at 04:03:00PM +0200, Tomi Valkeinen wrote:
> From: Luca Ceresoli <luca@lucaceresoli.net>
> 
> An adapter might need to know when a new device is about to be
> added. This will soon bee needed to implement an "I2C address
> translator" (ATR for short), a device that propagates I2C transactions
> with a different slave address (an "alias" address). An ATR driver
> needs to know when a slave is being added to find a suitable alias and
> program the device translation map.
> 
> Add an attach/detach callback pair to allow adapter drivers to be
> notified of clients being added and removed.

I've asked in the review of v6 if we could instead use the
BUS_NOTIFY_ADD_DEVICE and BUS_NOTIFY_DEL_DEVICE bus notifiers. There's
been a follow up discussion with Andy, but no reply from you AFAICS.
Have you given this a try ? It's not a mandatory requirement, but if it
can't be done (or shouldn't be done), I'd like to know why.

> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/i2c/i2c-core-base.c | 21 ++++++++++++++++++++-
>  include/linux/i2c.h         | 16 ++++++++++++++++
>  2 files changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 7539b0740351..8a0888ba89e5 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -916,6 +916,7 @@ int i2c_dev_irq_from_resources(const struct resource *resources,
>  struct i2c_client *
>  i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *info)
>  {
> +	const struct i2c_attach_operations *attach_ops;
>  	struct i2c_client	*client;
>  	int			status;
>  
> @@ -967,15 +968,24 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
>  		}
>  	}
>  
> +	attach_ops = adap->attach_ops;
> +
> +	if (attach_ops && attach_ops->attach_client &&
> +	    attach_ops->attach_client(adap, info, client))
> +		goto out_remove_swnode;
> +
>  	status = device_register(&client->dev);
>  	if (status)
> -		goto out_remove_swnode;
> +		goto out_detach_client;
>  
>  	dev_dbg(&adap->dev, "client [%s] registered with bus id %s\n",
>  		client->name, dev_name(&client->dev));
>  
>  	return client;
>  
> +out_detach_client:
> +	if (attach_ops && attach_ops->detach_client)
> +		attach_ops->detach_client(adap, client);
>  out_remove_swnode:
>  	device_remove_software_node(&client->dev);
>  out_err_put_of_node:
> @@ -997,9 +1007,18 @@ EXPORT_SYMBOL_GPL(i2c_new_client_device);
>   */
>  void i2c_unregister_device(struct i2c_client *client)
>  {
> +	const struct i2c_attach_operations *attach_ops;
> +	struct i2c_adapter *adap;
> +
>  	if (IS_ERR_OR_NULL(client))
>  		return;
>  
> +	adap = client->adapter;
> +	attach_ops = adap->attach_ops;
> +
> +	if (attach_ops && attach_ops->detach_client)
> +		attach_ops->detach_client(adap, client);
> +
>  	if (client->dev.of_node) {
>  		of_node_clear_flag(client->dev.of_node, OF_POPULATED);
>  		of_node_put(client->dev.of_node);
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index f7c49bbdb8a1..9a385b6de388 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -584,6 +584,21 @@ struct i2c_lock_operations {
>  	void (*unlock_bus)(struct i2c_adapter *adapter, unsigned int flags);
>  };
>  
> +/**
> + * struct i2c_attach_operations - callbacks to notify client attach/detach
> + * @attach_client: Notify of new client being attached
> + * @detach_client: Notify of new client being detached
> + *
> + * Both ops are optional.
> + */
> +struct i2c_attach_operations {
> +	int  (*attach_client)(struct i2c_adapter *adapter,
> +			      const struct i2c_board_info *info,
> +			      const struct i2c_client *client);
> +	void (*detach_client)(struct i2c_adapter *adapter,
> +			      const struct i2c_client *client);
> +};
> +
>  /**
>   * struct i2c_timings - I2C timing information
>   * @bus_freq_hz: the bus frequency in Hz
> @@ -726,6 +741,7 @@ struct i2c_adapter {
>  
>  	/* data fields that are valid for all devices	*/
>  	const struct i2c_lock_operations *lock_ops;
> +	const struct i2c_attach_operations *attach_ops;
>  	struct rt_mutex bus_lock;
>  	struct rt_mutex mux_lock;
>  

-- 
Regards,

Laurent Pinchart
