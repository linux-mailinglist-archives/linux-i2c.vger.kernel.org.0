Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF0EE71C12
	for <lists+linux-i2c@lfdr.de>; Tue, 23 Jul 2019 17:47:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731148AbfGWPrQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 23 Jul 2019 11:47:16 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:39002 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726347AbfGWPrQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 23 Jul 2019 11:47:16 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 641C5255;
        Tue, 23 Jul 2019 17:47:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1563896833;
        bh=84CLIiZDrIOH+zCHNJA09qOhDiwdeh+LjJpftGjWsXI=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Wj54rZMe0g9K/NFpKVeZHrp0Gn6slESEuhGmwSzAjEgoS1UiaJwI2B0JaoF/x0UDg
         DfDQvRXwyEpTTS0fp8KLPK6vL6pDWsCMLH3hen5Ei/gbPbzvKdN4frgLtRbwCDQC1e
         FsxscUEX7sw2OZFB9HmF13BDoYKkJZ/jHDoJrVlM=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH] i2c: replace i2c_new_secondary_device with an ERR_PTR
 variant
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc:     Andrzej Hajda <a.hajda@samsung.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
References: <20190722172600.3452-1-wsa+renesas@sang-engineering.com>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Openpgp: preference=signencrypt
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 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
 sbsRB8KNNvVXBOVNwko86rQqF9drZuw=
Organization: Ideas on Board
Message-ID: <9b71c556-bd70-4d29-dba5-fbeaefb5f3b4@ideasonboard.com>
Date:   Tue, 23 Jul 2019 16:47:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190722172600.3452-1-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

On 22/07/2019 18:26, Wolfram Sang wrote:
> In the general move to have i2c_new_*_device functions which return
> ERR_PTR instead of NULL, this patch converts i2c_new_secondary_device().
> 
> There are only few users, so this patch converts the I2C core and all
> users in one go. The function gets renamed to i2c_new_ancillary_device()
> so out-of-tree users will get a build failure to understand they need to
> adapt their error checking code.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Kindly asking for acks/revs/tests from people knowing the modified
> drivers.

Certainly, this looks good for the adv748x.

The ADV7511, and adv7604 are not mine, but they also look fine to me.

Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>


>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 18 +++++++++---------
>  drivers/i2c/i2c-core-base.c                  | 10 +++++-----
>  drivers/media/i2c/adv748x/adv748x-core.c     |  6 +++---
>  drivers/media/i2c/adv7604.c                  | 10 +++++-----
>  include/linux/i2c.h                          |  2 +-
>  5 files changed, 23 insertions(+), 23 deletions(-)
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
> index 28a84bf9f8a9..8ed1d9b59dd2 100644
> --- a/drivers/media/i2c/adv7604.c
> +++ b/drivers/media/i2c/adv7604.c
> @@ -2878,14 +2878,14 @@ static struct i2c_client *adv76xx_dummy_client(struct v4l2_subdev *sd,
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
> @@ -3520,8 +3520,8 @@ static int adv76xx_probe(struct i2c_client *client,
>  			continue;
>  
>  		state->i2c_clients[i] = adv76xx_dummy_client(sd, i);
> -		if (!state->i2c_clients[i]) {
> -			err = -EINVAL;
> +		if (IS_ERR(state->i2c_clients[i])) {
> +			err = PTR_ERR(state->i2c_clients[i]);
>  			v4l2_err(sd, "failed to create i2c client %u\n", i);
>  			goto err_i2c;
>  		}
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
> 

-- 
Regards
--
Kieran
