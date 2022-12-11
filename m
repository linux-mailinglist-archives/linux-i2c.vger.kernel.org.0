Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 571CA649520
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Dec 2022 17:55:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbiLKQzr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Dec 2022 11:55:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230014AbiLKQzq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Dec 2022 11:55:46 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AA7BAE73;
        Sun, 11 Dec 2022 08:55:44 -0800 (PST)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 73E2A6CF;
        Sun, 11 Dec 2022 17:55:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1670777741;
        bh=LDWOw2Sq4MMvUwwej0eOVEDdbPyRwLKB+gzMBo56Qj4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vUoExSChEqnDa4coecD0xRZOS1LhwMtXyrNsuCa2Z7Kmj/JFjJQrDmy/ix474Hw6b
         rthJC7QYuf/F2VBxUeR4sCGQTnKmm4LK0M/gEyABOxQ2LpbcGuPxxU+UAVpWpaDBrB
         wQ8XlhGMULJpK2F1xqtxPX03y3F0I9OrkrEGikIM=
Date:   Sun, 11 Dec 2022 18:55:39 +0200
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
Subject: Re: [PATCH v5 1/8] i2c: core: let adapters be notified of client
 attach/detach
Message-ID: <Y5YLi2md2571NQrY@pendragon.ideasonboard.com>
References: <20221208104006.316606-1-tomi.valkeinen@ideasonboard.com>
 <20221208104006.316606-2-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20221208104006.316606-2-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Tomi and Luca,

Thank you for the patch.

On Thu, Dec 08, 2022 at 12:39:59PM +0200, Tomi Valkeinen wrote:
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

This may be a stupid question, but couldn't you instead use the
BUS_NOTIFY_ADD_DEVICE and BUS_NOTIFY_DEL_DEVICE bus notifiers ?

> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/i2c/i2c-core-base.c | 18 +++++++++++++++++-
>  include/linux/i2c.h         | 16 ++++++++++++++++
>  2 files changed, 33 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index b4edf10e8fd0..c8bc71b1db82 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -966,15 +966,23 @@ i2c_new_client_device(struct i2c_adapter *adap, struct i2c_board_info const *inf
>  		}
>  	}
>  
> +	if (adap->attach_ops &&
> +	    adap->attach_ops->attach_client &&
> +	    adap->attach_ops->attach_client(adap, info, client) != 0)
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
> +	if (adap->attach_ops && adap->attach_ops->detach_client)
> +		adap->attach_ops->detach_client(adap, client);
>  out_remove_swnode:
>  	device_remove_software_node(&client->dev);
>  out_err_put_of_node:
> @@ -996,9 +1004,17 @@ EXPORT_SYMBOL_GPL(i2c_new_client_device);
>   */
>  void i2c_unregister_device(struct i2c_client *client)
>  {
> +	struct i2c_adapter *adap;
> +
>  	if (IS_ERR_OR_NULL(client))
>  		return;
>  
> +	adap = client->adapter;
> +
> +	if (adap->attach_ops &&
> +	    adap->attach_ops->detach_client)
> +		adap->attach_ops->detach_client(adap, client);
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
