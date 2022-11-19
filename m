Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B264863100E
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 18:41:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235103AbiKSRls (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 12:41:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235090AbiKSRlr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 12:41:47 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEDBE19039;
        Sat, 19 Nov 2022 09:41:46 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A464D749;
        Sat, 19 Nov 2022 18:41:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668879704;
        bh=tmILVvcrsIp++jwRB0Fo8wY9/8Iov6cSsmrYrOa125E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ZI5TFASwFUYMBxhTEnFCTZxDq65nFajKo7w2NoQ/Ko6ZC6J7AZvMikOeaw/PaqWOM
         /guSY/9x96ni0s7Ht5mYTGA822xtuvGcoksvcbjN4xXY9W5fPgt5yF210cXkkBHh8Q
         tl3rtu5cMvgME3/TQ25BygQqsA7682hQCmzurIMg=
Date:   Sat, 19 Nov 2022 19:41:29 +0200
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
        Daniel Vetter <daniel@ffwll.ch>, Xin Ji <xji@analogixsemi.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Marek Vasut <marex@denx.de>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 017/606] drm/bridge: anx7625: Convert to i2c's
 .probe_new()
Message-ID: <Y3kVSfaZ9IWAFgNB@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-18-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-18-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:35:51PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/analogix/anx7625.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> index b0ff1ecb80a5..86a52c5f4fbc 100644
> --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> @@ -2562,8 +2562,7 @@ static void anx7625_runtime_disable(void *data)
>  	pm_runtime_disable(data);
>  }
>  
> -static int anx7625_i2c_probe(struct i2c_client *client,
> -			     const struct i2c_device_id *id)
> +static int anx7625_i2c_probe(struct i2c_client *client)
>  {
>  	struct anx7625_data *platform;
>  	struct anx7625_platform_data *pdata;
> @@ -2756,7 +2755,7 @@ static struct i2c_driver anx7625_driver = {
>  		.of_match_table = anx_match_table,
>  		.pm = &anx7625_pm_ops,
>  	},
> -	.probe = anx7625_i2c_probe,
> +	.probe_new = anx7625_i2c_probe,
>  	.remove = anx7625_i2c_remove,
>  
>  	.id_table = anx7625_id,
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
