Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21E2C630FAF
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 18:23:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233499AbiKSRXU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 12:23:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230398AbiKSRXT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 12:23:19 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5DE321208E;
        Sat, 19 Nov 2022 09:23:18 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 76FC4749;
        Sat, 19 Nov 2022 18:23:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668878596;
        bh=yKjqlouakS4ZziOyomg5hVmvoPadAxmtK7XqQoUHbtY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qoTNmJehnuoK5I5UmqSNgivm03UxiVAo5ttq0IoZx6/9hV9/8xd/HeDm0h2WE8b2x
         WHqPlwsZ26QSUKk3VUy//3Uk/iAFCZjy3bYTkAVqrpgvG2s2XAhk2H7jlvl4x8hqlF
         nj5BFB0x6o77oXkOrQcwidWM2zyLyrh+kHlZsyrg=
Date:   Sat, 19 Nov 2022 19:23:00 +0200
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
        <u.kleine-koenig@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 019/606] drm/bridge: chrontel-ch7033: Convert to i2c's
 .probe_new()
Message-ID: <Y3kQ9NoW21l/LhlZ@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-20-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-20-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:35:53PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/chrontel-ch7033.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
> index b94f39a86846..339b759e4c81 100644
> --- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
> +++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
> @@ -528,8 +528,7 @@ static const struct regmap_config ch7033_regmap_config = {
>  	.max_register = 0x7f,
>  };
>  
> -static int ch7033_probe(struct i2c_client *client,
> -			const struct i2c_device_id *id)
> +static int ch7033_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	struct ch7033_priv *priv;
> @@ -604,7 +603,7 @@ static const struct i2c_device_id ch7033_ids[] = {
>  MODULE_DEVICE_TABLE(i2c, ch7033_ids);
>  
>  static struct i2c_driver ch7033_driver = {
> -	.probe = ch7033_probe,
> +	.probe_new = ch7033_probe,
>  	.remove = ch7033_remove,
>  	.driver = {
>  		.name = "ch7033",

-- 
Regards,

Laurent Pinchart
