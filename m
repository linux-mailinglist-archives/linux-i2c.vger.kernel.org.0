Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6006631011
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 18:42:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235090AbiKSRmI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 12:42:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235145AbiKSRmH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 12:42:07 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 12B4D1903B;
        Sat, 19 Nov 2022 09:42:06 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8046D749;
        Sat, 19 Nov 2022 18:42:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668879724;
        bh=Vsw7ZhU9I2vfw8KkpV/hQt1mmj1j28Cc7TsxslkjcR0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Xtn+dcYNuAbrirLULOVJlcJtM1N4m+S7MlACjHSoAk3+tVeu/f1t2CXvhAnSqq8+l
         +WPhwQzmhuWq/S54c6vgf4yjzmZlhcLQxSCE+Hof+dKDasthMpVn5/31MKcTtHVw/5
         hJlPhpFi5nGuysVVgWnkSyqQ/TwVlQTcSxL90zE0=
Date:   Sat, 19 Nov 2022 19:41:49 +0200
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
        Daniel Vetter <daniel@ffwll.ch>,
        Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
        Jeremy Kerr <jk@codeconstruct.com.au>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Jiasheng Jiang <jiasheng@iscas.ac.cn>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 014/606] drm/bridge: adv7511: Convert to i2c's
 .probe_new()
Message-ID: <Y3kVXfxsPJNkq++H@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-15-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-15-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:35:48PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index e7a6e456ed0d..ddceafa7b637 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1185,8 +1185,9 @@ static int adv7511_parse_dt(struct device_node *np,
>  	return 0;
>  }
>  
> -static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
> +static int adv7511_probe(struct i2c_client *i2c)
>  {
> +	const struct i2c_device_id *id = i2c_client_get_device_id(i2c);
>  	struct adv7511_link_config link_config;
>  	struct adv7511 *adv7511;
>  	struct device *dev = &i2c->dev;
> @@ -1392,7 +1393,7 @@ static struct i2c_driver adv7511_driver = {
>  		.of_match_table = adv7511_of_ids,
>  	},
>  	.id_table = adv7511_i2c_ids,
> -	.probe = adv7511_probe,
> +	.probe_new = adv7511_probe,
>  	.remove = adv7511_remove,
>  };
>  
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
