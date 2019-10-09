Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CCF03D0962
	for <lists+linux-i2c@lfdr.de>; Wed,  9 Oct 2019 10:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729457AbfJIIQx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 9 Oct 2019 04:16:53 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:33016 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbfJIIQx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 9 Oct 2019 04:16:53 -0400
Received: from pendragon.ideasonboard.com (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C16264FF;
        Wed,  9 Oct 2019 10:16:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1570609011;
        bh=dfCYYmVUWtdv4zBsKgd4ZyXxFLnPVhNwwZgG6/vSvNg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=eVlJScwCub0+GmlR5SL43r9WCQGHvo9eM6c3APruewM0PbYssfq970wql++ufnvrm
         IEgxyFr9psKDOwHspLVplOYzuPu0y7Z2YECA8WMOwNtwWgwBfXoF2kgdWWUaVSsdKz
         C1trqy9ctIwsYWPhlB9Hmh24hDRxkzWbPMSNiF9w=
Date:   Wed, 9 Oct 2019 11:16:48 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
        Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] gpu: drm: bridge: sii9234: convert to
 devm_i2c_new_dummy_device
Message-ID: <20191009081648.GC22998@pendragon.ideasonboard.com>
References: <20191008203322.3238-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20191008203322.3238-1-wsa+renesas@sang-engineering.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Wolfram,

Thank you for the patch.

On Tue, Oct 08, 2019 at 10:33:22PM +0200, Wolfram Sang wrote:
> Move from the deprecated i2c_new_dummy() to devm_i2c_new_dummy_device().
> We now get an ERRPTR which we use in error handling and we can skip
> removal of the created devices.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> Rebased to v5.4-rc2 since last time. One of the last two users of the
> old API, so please apply soon, so I can remove the old interface. Only
> build tested.
> 
>  drivers/gpu/drm/bridge/sii9234.c | 36 +++++++++++---------------------
>  1 file changed, 12 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
> index 25d4ad8c7ad6..8a6c85693a88 100644
> --- a/drivers/gpu/drm/bridge/sii9234.c
> +++ b/drivers/gpu/drm/bridge/sii9234.c
> @@ -841,39 +841,28 @@ static int sii9234_init_resources(struct sii9234 *ctx,
>  
>  	ctx->client[I2C_MHL] = client;
>  
> -	ctx->client[I2C_TPI] = i2c_new_dummy(adapter, I2C_TPI_ADDR);
> -	if (!ctx->client[I2C_TPI]) {
> +	ctx->client[I2C_TPI] = devm_i2c_new_dummy_device(&client->dev, adapter,
> +							 I2C_TPI_ADDR);
> +	if (IS_ERR(ctx->client[I2C_TPI])) {
>  		dev_err(ctx->dev, "failed to create TPI client\n");
> -		return -ENODEV;
> +		return PTR_ERR(ctx->client[I2C_TPI]);
>  	}
>  
> -	ctx->client[I2C_HDMI] = i2c_new_dummy(adapter, I2C_HDMI_ADDR);
> -	if (!ctx->client[I2C_HDMI]) {
> +	ctx->client[I2C_HDMI] = devm_i2c_new_dummy_device(&client->dev, adapter,
> +							  I2C_HDMI_ADDR);
> +	if (IS_ERR(ctx->client[I2C_HDMI])) {
>  		dev_err(ctx->dev, "failed to create HDMI RX client\n");
> -		goto fail_tpi;
> +		return PTR_ERR(ctx->client[I2C_HDMI]);
>  	}
>  
> -	ctx->client[I2C_CBUS] = i2c_new_dummy(adapter, I2C_CBUS_ADDR);
> -	if (!ctx->client[I2C_CBUS]) {
> +	ctx->client[I2C_CBUS] = devm_i2c_new_dummy_device(&client->dev, adapter,
> +							  I2C_CBUS_ADDR);
> +	if (IS_ERR(ctx->client[I2C_CBUS])) {
>  		dev_err(ctx->dev, "failed to create CBUS client\n");
> -		goto fail_hdmi;
> +		return PTR_ERR(ctx->client[I2C_CBUS]);
>  	}
>  
>  	return 0;
> -
> -fail_hdmi:
> -	i2c_unregister_device(ctx->client[I2C_HDMI]);
> -fail_tpi:
> -	i2c_unregister_device(ctx->client[I2C_TPI]);
> -
> -	return -ENODEV;
> -}
> -
> -static void sii9234_deinit_resources(struct sii9234 *ctx)
> -{
> -	i2c_unregister_device(ctx->client[I2C_CBUS]);
> -	i2c_unregister_device(ctx->client[I2C_HDMI]);
> -	i2c_unregister_device(ctx->client[I2C_TPI]);
>  }
>  
>  static inline struct sii9234 *bridge_to_sii9234(struct drm_bridge *bridge)
> @@ -950,7 +939,6 @@ static int sii9234_remove(struct i2c_client *client)
>  
>  	sii9234_cable_out(ctx);
>  	drm_bridge_remove(&ctx->bridge);
> -	sii9234_deinit_resources(ctx);
>  
>  	return 0;
>  }

-- 
Regards,

Laurent Pinchart
