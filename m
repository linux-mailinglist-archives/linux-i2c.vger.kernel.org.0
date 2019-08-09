Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E1AE881FF
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2019 20:07:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437064AbfHISG5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 9 Aug 2019 14:06:57 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:60010 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbfHISG5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 9 Aug 2019 14:06:57 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 24046CC;
        Fri,  9 Aug 2019 20:06:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1565374014;
        bh=5n9tTAf2YqrGo7SBEkeLK2nncuxWLs8hv2W+FFbOU4M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=llUvQF1nVmA1MpRNXbvQyBMSoitNbpBKqt3NemcbhjKZjV0jIChW4sdXtTKZSKDHE
         4E4nJBfkWgarb5J5MzuNRyxNN/052FSUTY8AD7/DgRe94R6AQytex2vIQ3lQV3sZA8
         i1a4IJ9H/SI/snhUVlKE44+Y7qSblWcqgO93AFhA=
Date:   Fri, 9 Aug 2019 21:06:51 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Wolfram Sang <wsa@the-dreams.de>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Subject: Re: [PATCH v2] i2c: replace i2c_new_secondary_device with an ERR_PTR
 variant
Message-ID: <20190809180651.GB5007@pendragon.ideasonboard.com>
References: <20190809154047.9897-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20190809154047.9897-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On Fri, Aug 09, 2019 at 05:40:47PM +0200, Wolfram Sang wrote:
> In the general move to have i2c_new_*_device functions which return
> ERR_PTR instead of NULL, this patch converts i2c_new_secondary_device().
> 
> There are only few users, so this patch converts the I2C core and all
> users in one go. The function gets renamed to i2c_new_ancillary_device()
> so out-of-tree users will get a build failure to understand they need to
> adapt their error checking code.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com> # adv748x
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com> # adv7511
> ---
> 
> Changes since v1:
> 
> * adv7604: use a local variable for error handling
> * adv7604: simplify unregistering dummy clients because I2C core helper
>            is NULL ptr aware

For adv7604:

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> * added tags for adv748x and adv7511
> 
> Thanks Kieran and Laurent!
> 
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 18 ++++++++--------
>  drivers/i2c/i2c-core-base.c                  | 10 ++++-----
>  drivers/media/i2c/adv748x/adv748x-core.c     |  6 +++---
>  drivers/media/i2c/adv7604.c                  | 22 +++++++++++---------
>  include/linux/i2c.h                          |  2 +-
>  5 files changed, 30 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index f6d2681f6927..9e13e466e72c 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -981,10 +981,10 @@ static int adv7511_init_cec_regmap(struct adv7511 *adv)
>  {
>  	int ret;
>  
> -	adv->i2c_cec = i2c_new_secondary_device(adv->i2c_main, "cec",
> +	adv->i2c_cec = i2c_new_ancillary_device(adv->i2c_main, "cec",
>  						ADV7511_CEC_I2C_ADDR_DEFAULT);
> -	if (!adv->i2c_cec)
> -		return -EINVAL;
> +	if (IS_ERR(adv->i2c_cec))
> +		return PTR_ERR(adv->i2c_cec);
>  	i2c_set_clientdata(adv->i2c_cec, adv);
>  
>  	adv->regmap_cec = devm_regmap_init_i2c(adv->i2c_cec,
> @@ -1165,20 +1165,20 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
>  
>  	adv7511_packet_disable(adv7511, 0xffff);
>  
> -	adv7511->i2c_edid = i2c_new_secondary_device(i2c, "edid",
> +	adv7511->i2c_edid = i2c_new_ancillary_device(i2c, "edid",
>  					ADV7511_EDID_I2C_ADDR_DEFAULT);
> -	if (!adv7511->i2c_edid) {
> -		ret = -EINVAL;
> +	if (IS_ERR(adv7511->i2c_edid)) {
> +		ret = PTR_ERR(adv7511->i2c_edid);
>  		goto uninit_regulators;
>  	}
>  
>  	regmap_write(adv7511->regmap, ADV7511_REG_EDID_I2C_ADDR,
>  		     adv7511->i2c_edid->addr << 1);
>  
> -	adv7511->i2c_packet = i2c_new_secondary_device(i2c, "packet",
> +	adv7511->i2c_packet = i2c_new_ancillary_device(i2c, "packet",
>  					ADV7511_PACKET_I2C_ADDR_DEFAULT);
> -	if (!adv7511->i2c_packet) {
> -		ret = -EINVAL;
> +	if (IS_ERR(adv7511->i2c_packet)) {
> +		ret = PTR_ERR(adv7511->i2c_packet);
>  		goto err_i2c_unregister_edid;
>  	}
>  
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index f26ed495d384..76cb91e064b8 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -966,7 +966,7 @@ struct i2c_client *devm_i2c_new_dummy_device(struct device *dev,
>  EXPORT_SYMBOL_GPL(devm_i2c_new_dummy_device);
>  
>  /**
> - * i2c_new_secondary_device - Helper to get the instantiated secondary address
> + * i2c_new_ancillary_device - Helper to get the instantiated secondary address
>   * and create the associated device
>   * @client: Handle to the primary client
>   * @name: Handle to specify which secondary address to get
> @@ -985,9 +985,9 @@ EXPORT_SYMBOL_GPL(devm_i2c_new_dummy_device);
>   * cell whose "reg-names" value matches the slave name.
>   *
>   * This returns the new i2c client, which should be saved for later use with
> - * i2c_unregister_device(); or NULL to indicate an error.
> + * i2c_unregister_device(); or an ERR_PTR to describe the error.
>   */
> -struct i2c_client *i2c_new_secondary_device(struct i2c_client *client,
> +struct i2c_client *i2c_new_ancillary_device(struct i2c_client *client,
>  						const char *name,
>  						u16 default_addr)
>  {
> @@ -1002,9 +1002,9 @@ struct i2c_client *i2c_new_secondary_device(struct i2c_client *client,
>  	}
>  
>  	dev_dbg(&client->adapter->dev, "Address for %s : 0x%x\n", name, addr);
> -	return i2c_new_dummy(client->adapter, addr);
> +	return i2c_new_dummy_device(client->adapter, addr);
>  }
> -EXPORT_SYMBOL_GPL(i2c_new_secondary_device);
> +EXPORT_SYMBOL_GPL(i2c_new_ancillary_device);
>  
>  /* ------------------------------------------------------------------------- */
>  
> diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
> index f57cd77a32fa..2567de2b0037 100644
> --- a/drivers/media/i2c/adv748x/adv748x-core.c
> +++ b/drivers/media/i2c/adv748x/adv748x-core.c
> @@ -183,14 +183,14 @@ static int adv748x_initialise_clients(struct adv748x_state *state)
>  	int ret;
>  
>  	for (i = ADV748X_PAGE_DPLL; i < ADV748X_PAGE_MAX; ++i) {
> -		state->i2c_clients[i] = i2c_new_secondary_device(
> +		state->i2c_clients[i] = i2c_new_ancillary_device(
>  				state->client,
>  				adv748x_default_addresses[i].name,
>  				adv748x_default_addresses[i].default_addr);
>  
> -		if (state->i2c_clients[i] == NULL) {
> +		if (IS_ERR(state->i2c_clients[i])) {
>  			adv_err(state, "failed to create i2c client %u\n", i);
> -			return -ENOMEM;
> +			return PTR_ERR(state->i2c_clients[i]);
>  		}
>  
>  		ret = adv748x_configure_regmap(state, i);
> diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
> index 28a84bf9f8a9..2dedd6ebb236 100644
> --- a/drivers/media/i2c/adv7604.c
> +++ b/drivers/media/i2c/adv7604.c
> @@ -2862,10 +2862,8 @@ static void adv76xx_unregister_clients(struct adv76xx_state *state)
>  {
>  	unsigned int i;
>  
> -	for (i = 1; i < ARRAY_SIZE(state->i2c_clients); ++i) {
> -		if (state->i2c_clients[i])
> -			i2c_unregister_device(state->i2c_clients[i]);
> -	}
> +	for (i = 1; i < ARRAY_SIZE(state->i2c_clients); ++i)
> +		i2c_unregister_device(state->i2c_clients[i]);
>  }
>  
>  static struct i2c_client *adv76xx_dummy_client(struct v4l2_subdev *sd,
> @@ -2878,14 +2876,14 @@ static struct i2c_client *adv76xx_dummy_client(struct v4l2_subdev *sd,
>  	struct i2c_client *new_client;
>  
>  	if (pdata && pdata->i2c_addresses[page])
> -		new_client = i2c_new_dummy(client->adapter,
> +		new_client = i2c_new_dummy_device(client->adapter,
>  					   pdata->i2c_addresses[page]);
>  	else
> -		new_client = i2c_new_secondary_device(client,
> +		new_client = i2c_new_ancillary_device(client,
>  				adv76xx_default_addresses[page].name,
>  				adv76xx_default_addresses[page].default_addr);
>  
> -	if (new_client)
> +	if (!IS_ERR(new_client))
>  		io_write(sd, io_reg, new_client->addr << 1);
>  
>  	return new_client;
> @@ -3516,15 +3514,19 @@ static int adv76xx_probe(struct i2c_client *client,
>  	}
>  
>  	for (i = 1; i < ADV76XX_PAGE_MAX; ++i) {
> +		struct i2c_client *dummy_client;
> +
>  		if (!(BIT(i) & state->info->page_mask))
>  			continue;
>  
> -		state->i2c_clients[i] = adv76xx_dummy_client(sd, i);
> -		if (!state->i2c_clients[i]) {
> -			err = -EINVAL;
> +		dummy_client = adv76xx_dummy_client(sd, i);
> +		if (IS_ERR(dummy_client)) {
> +			err = PTR_ERR(dummy_client);
>  			v4l2_err(sd, "failed to create i2c client %u\n", i);
>  			goto err_i2c;
>  		}
> +
> +		state->i2c_clients[i] = dummy_client;
>  	}
>  
>  	INIT_DELAYED_WORK(&state->delayed_work_enable_hotplug,
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index fa5552c2307b..ebbe024dd9e0 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -473,7 +473,7 @@ extern struct i2c_client *
>  devm_i2c_new_dummy_device(struct device *dev, struct i2c_adapter *adap, u16 address);
>  
>  extern struct i2c_client *
> -i2c_new_secondary_device(struct i2c_client *client,
> +i2c_new_ancillary_device(struct i2c_client *client,
>  				const char *name,
>  				u16 default_addr);
>  

-- 
Regards,

Laurent Pinchart
