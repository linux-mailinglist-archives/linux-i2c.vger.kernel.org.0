Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AEDF630FE4
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 18:33:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234462AbiKSRdS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 12:33:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234755AbiKSRc4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 12:32:56 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D27017068;
        Sat, 19 Nov 2022 09:32:55 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CA941997;
        Sat, 19 Nov 2022 18:32:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668879174;
        bh=vCSnsXti52M8cQmWHjjQRkKkW0Zzm1RY+fm63qKhsco=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=vxTHDQNK+bnLKLtYTIk4nm5wW22of5CElmcUf5+bXlq+TQmruBW2WcyHVQwgQdUMU
         Q1iazqftnVCfEVUUJUo3UIYjYku5LxmgVk5+padIPwXsjjc5CcxIj8gK7gKfA29SZY
         z0pkR1j8obNwCABYL7e5fPusefvDmAvsgkz1Wado=
Date:   Sat, 19 Nov 2022 19:32:38 +0200
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
Subject: Re: [PATCH 027/606] drm/bridge: nxp-ptn3460: Convert to i2c's
 .probe_new()
Message-ID: <Y3kTNrvjnUjqM8CS@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-28-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-28-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:36:01PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/nxp-ptn3460.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
> index 0851101a8c72..cd292a2f894c 100644
> --- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
> +++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
> @@ -257,8 +257,7 @@ static const struct drm_bridge_funcs ptn3460_bridge_funcs = {
>  	.get_edid = ptn3460_get_edid,
>  };
>  
> -static int ptn3460_probe(struct i2c_client *client,
> -				const struct i2c_device_id *id)
> +static int ptn3460_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	struct ptn3460_bridge *ptn_bridge;
> @@ -336,7 +335,7 @@ MODULE_DEVICE_TABLE(of, ptn3460_match);
>  
>  static struct i2c_driver ptn3460_driver = {
>  	.id_table	= ptn3460_i2c_table,
> -	.probe		= ptn3460_probe,
> +	.probe_new	= ptn3460_probe,
>  	.remove		= ptn3460_remove,
>  	.driver		= {
>  		.name	= "nxp,ptn3460",
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
