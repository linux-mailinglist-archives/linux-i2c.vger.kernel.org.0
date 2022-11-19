Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99D3E630FE8
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 18:34:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234697AbiKSRd7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 12:33:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234992AbiKSRdZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 12:33:25 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FC13E084;
        Sat, 19 Nov 2022 09:33:16 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C0984749;
        Sat, 19 Nov 2022 18:33:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668879195;
        bh=VDgLOR+TPIiHt/6X9LlZWhODnqBYFlbRjyka8jJDUqw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=aRaQ+sn3SAjuGkJz7Xd8ZdvP6qWasx6z8F4yKGkwwaVrOZ19ltMfBWhJLc8Z96JxQ
         ukfPeSSAIIjbIZ0TrKj6UIJ/hvRVSHWp0L6Qj7TLswhPvXK1VzaUBi+kgO9SNWccKn
         aWPrFAz/Tw/mb4mRbdsKiP6fOfxFTL32ktMMWdm4=
Date:   Sat, 19 Nov 2022 19:32:59 +0200
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
Subject: Re: [PATCH 030/606] drm/bridge: sii9234: Convert to i2c's
 .probe_new()
Message-ID: <Y3kTS3KFsaD/Aa4d@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-31-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-31-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:36:04PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/sii9234.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
> index 5b3061d4b5c3..099b510ff285 100644
> --- a/drivers/gpu/drm/bridge/sii9234.c
> +++ b/drivers/gpu/drm/bridge/sii9234.c
> @@ -886,8 +886,7 @@ static const struct drm_bridge_funcs sii9234_bridge_funcs = {
>  	.mode_valid = sii9234_mode_valid,
>  };
>  
> -static int sii9234_probe(struct i2c_client *client,
> -			 const struct i2c_device_id *id)
> +static int sii9234_probe(struct i2c_client *client)
>  {
>  	struct i2c_adapter *adapter = client->adapter;
>  	struct sii9234 *ctx;
> @@ -961,7 +960,7 @@ static struct i2c_driver sii9234_driver = {
>  		.name	= "sii9234",
>  		.of_match_table = sii9234_dt_match,
>  	},
> -	.probe = sii9234_probe,
> +	.probe_new = sii9234_probe,
>  	.remove = sii9234_remove,
>  	.id_table = sii9234_id,
>  };
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
