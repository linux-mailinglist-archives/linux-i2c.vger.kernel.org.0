Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E711630FFA
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 18:35:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234876AbiKSRfZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 12:35:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235047AbiKSRfS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 12:35:18 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C05114D13;
        Sat, 19 Nov 2022 09:35:17 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 20B51749;
        Sat, 19 Nov 2022 18:35:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668879316;
        bh=gNZd6oRdjSF8gl1qxb0SKHdE0YdULnw0sFu+xuUXOu8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=agMGW9TeKWyqcIA+8ErB6thVoPN2X+MoLY11tdk2DRN+DyLioHaOEARXNPMseOrKY
         98sjQbE6aG3WbhnBH0Pw94c2oExDnhSMnQWg8Bpyg2blwFG1rO4n+MvBTOVc7csHSp
         OdcA1+Y7qt5J2VCbdmgCQDWCNScu7ObcCenSc7X4=
Date:   Sat, 19 Nov 2022 19:35:00 +0200
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
Subject: Re: [PATCH 037/606] drm/bridge: tfp410: Convert to i2c's .probe_new()
Message-ID: <Y3kTxA+4gUo4x3FC@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-38-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-38-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:36:11PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/ti-tfp410.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
> index b9635abbad16..6db69df0e18b 100644
> --- a/drivers/gpu/drm/bridge/ti-tfp410.c
> +++ b/drivers/gpu/drm/bridge/ti-tfp410.c
> @@ -379,8 +379,7 @@ static struct platform_driver tfp410_platform_driver = {
>  
>  #if IS_ENABLED(CONFIG_I2C)
>  /* There is currently no i2c functionality. */
> -static int tfp410_i2c_probe(struct i2c_client *client,
> -			    const struct i2c_device_id *id)
> +static int tfp410_i2c_probe(struct i2c_client *client)
>  {
>  	int reg;
>  
> @@ -411,7 +410,7 @@ static struct i2c_driver tfp410_i2c_driver = {
>  		.of_match_table = of_match_ptr(tfp410_match),
>  	},
>  	.id_table	= tfp410_i2c_ids,
> -	.probe		= tfp410_i2c_probe,
> +	.probe_new	= tfp410_i2c_probe,
>  	.remove		= tfp410_i2c_remove,
>  };
>  #endif /* IS_ENABLED(CONFIG_I2C) */
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
