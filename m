Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA85630FF7
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 18:35:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234488AbiKSRfT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 12:35:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235083AbiKSRe5 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 12:34:57 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4860C17E2E;
        Sat, 19 Nov 2022 09:34:56 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C82B7749;
        Sat, 19 Nov 2022 18:34:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668879295;
        bh=1g/K4Q02GnI/IYZ+h0gHHHav57k1o5cBeGx4EARI3KI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OJ1HJmIiA7HrCz6PFVgdYFbVM9QcVLos/nTXDCSmh0OPGVBwdV/jcstBUzsSCUea/
         jy4EgVYA+wWeb+tHwiQoWYto3qv+vASIDJNVNAr2UCZZl6s962jWW9dNAJEGFR1f69
         vRuR4Sigzw/1JrvLP0RvoaxzeioWnHH7EXiarPrA=
Date:   Sat, 19 Nov 2022 19:34:39 +0200
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
Subject: Re: [PATCH 025/606] drm/bridge: lt9611uxc: Convert to i2c's
 .probe_new()
Message-ID: <Y3kTr8O9GJybmnWY@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-26-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-26-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:35:59PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index fa1ee6264d92..583daacf3705 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -844,8 +844,7 @@ static const struct attribute_group *lt9611uxc_attr_groups[] = {
>  	NULL,
>  };
>  
> -static int lt9611uxc_probe(struct i2c_client *client,
> -			   const struct i2c_device_id *id)
> +static int lt9611uxc_probe(struct i2c_client *client)
>  {
>  	struct lt9611uxc *lt9611uxc;
>  	struct device *dev = &client->dev;
> @@ -1012,7 +1011,7 @@ static struct i2c_driver lt9611uxc_driver = {
>  		.of_match_table = lt9611uxc_match_table,
>  		.dev_groups = lt9611uxc_attr_groups,
>  	},
> -	.probe = lt9611uxc_probe,
> +	.probe_new = lt9611uxc_probe,
>  	.remove = lt9611uxc_remove,
>  	.id_table = lt9611uxc_id,
>  };
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
