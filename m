Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 244F8630FE1
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 18:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234809AbiKSRcs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 12:32:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234848AbiKSRcc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 12:32:32 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDB3715A07;
        Sat, 19 Nov 2022 09:32:30 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1B26749;
        Sat, 19 Nov 2022 18:32:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668879149;
        bh=+8+diQJh+LD70K5MTLeNUtS/aDsme1R5nvV6QKR/EcI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ueHtmYmQltexzcvLFxbqRiXwthcevxufvGOBpz1SNGDMqdhqrOEQdlRgg9d4eR4XE
         Ixfksp+ms/jwnW0farb0f4RXRibn4xk7z3A6g+4rScVgUxbDbf2JK8dubM2TeXCzmI
         gtAmEO9DP2SZZedcudEtr1TTobYgY2OjUboMy2ZU=
Date:   Sat, 19 Nov 2022 19:32:13 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <robert.foss@linaro.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Douglas Anderson <dianders@chromium.org>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 036/606] drm/bridge: ti-sn65dsi86: Convert to i2c's
 .probe_new()
Message-ID: <Y3kTHfyR2De/W7wu@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-37-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-37-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:36:10PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 3c3561942eb6..856d28dec4bf 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1850,8 +1850,7 @@ static int ti_sn65dsi86_parse_regulators(struct ti_sn65dsi86 *pdata)
>  				       pdata->supplies);
>  }
>  
> -static int ti_sn65dsi86_probe(struct i2c_client *client,
> -			      const struct i2c_device_id *id)
> +static int ti_sn65dsi86_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	struct ti_sn65dsi86 *pdata;
> @@ -1950,7 +1949,7 @@ static struct i2c_driver ti_sn65dsi86_driver = {
>  		.of_match_table = ti_sn65dsi86_match_table,
>  		.pm = &ti_sn65dsi86_pm_ops,
>  	},
> -	.probe = ti_sn65dsi86_probe,
> +	.probe_new = ti_sn65dsi86_probe,
>  	.id_table = ti_sn65dsi86_id,
>  };
>  
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
