Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87324630FDA
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 18:32:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234187AbiKSRcR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 12:32:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234091AbiKSRbx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 12:31:53 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C20C617589;
        Sat, 19 Nov 2022 09:31:39 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5462E749;
        Sat, 19 Nov 2022 18:31:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668879098;
        bh=8TB93WgIpAtf7DBooyWu57a5/dN7O8GVgJGifX0hUnw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=O7K+SgwRPG9GcmBge/PBta55KiYriA0x8A2A2UHSjBy9k9ytPB/icvh2f1cYafsKb
         rvJg+/If+ToTSuL8N3TNf2WjpOIX2Fxn4mgAAaAJTtBHZfD1djcTWvnFD1J11Gvfgs
         UGtrQ5BuTxKIfP8nMmVJ6QS6KD3lfyP4HQFH30nQ=
Date:   Sat, 19 Nov 2022 19:31:22 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 018/606] drm/bridge: icn6211: Convert to i2c's
 .probe_new()
Message-ID: <Y3kS6iA3oRta/IQP@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-19-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-19-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:35:52PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/chipone-icn6211.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
> index bf920c3503aa..0e37840cd7a8 100644
> --- a/drivers/gpu/drm/bridge/chipone-icn6211.c
> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
> @@ -740,8 +740,7 @@ static int chipone_dsi_probe(struct mipi_dsi_device *dsi)
>  	return ret;
>  }
>  
> -static int chipone_i2c_probe(struct i2c_client *client,
> -			     const struct i2c_device_id *id)
> +static int chipone_i2c_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	struct chipone *icn;
> @@ -796,7 +795,7 @@ static struct i2c_device_id chipone_i2c_id[] = {
>  MODULE_DEVICE_TABLE(i2c, chipone_i2c_id);
>  
>  static struct i2c_driver chipone_i2c_driver = {
> -	.probe = chipone_i2c_probe,
> +	.probe_new = chipone_i2c_probe,
>  	.id_table = chipone_i2c_id,
>  	.driver = {
>  		.name = "chipone-icn6211-i2c",
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
