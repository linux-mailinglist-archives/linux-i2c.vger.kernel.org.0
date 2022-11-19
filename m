Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90CB2631007
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 18:39:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234759AbiKSRjh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 12:39:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234723AbiKSRjg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 12:39:36 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D9791902F;
        Sat, 19 Nov 2022 09:39:35 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61D05749;
        Sat, 19 Nov 2022 18:39:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668879573;
        bh=KLORL0n/eeuSzLDMfgx0jgrjdSgC3DFFC/4yiTROnhE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SfeAl0PWgVPzjz8cJiuwEIAVbgeaeTijrZwOPZmyYPddFO2aFui906JzJjkt6eGcd
         i6MkHUSslGrlHdS1H20eCQdEuP5qibdOa+QbLsnhtkztt77qoiHMO32bsIjRd4RAWZ
         chXaNrTR0kNN0sx0FgtVJ87LPjeNheOOinw9FyD8=
Date:   Sat, 19 Nov 2022 19:39:17 +0200
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
        Javier Martinez Canillas <javierm@redhat.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 016/606] drm/bridge/analogix/anx78xx: Convert to i2c's
 .probe_new()
Message-ID: <Y3kUxUbA6CvABcho@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-17-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-17-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:35:50PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> index 5997049fde5b..a3a38bbe2786 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
> @@ -1214,8 +1214,7 @@ static const u16 anx78xx_chipid_list[] = {
>  	0x7818,
>  };
>  
> -static int anx78xx_i2c_probe(struct i2c_client *client,
> -			     const struct i2c_device_id *id)
> +static int anx78xx_i2c_probe(struct i2c_client *client)
>  {
>  	struct anx78xx *anx78xx;
>  	struct anx78xx_platform_data *pdata;
> @@ -1390,7 +1389,7 @@ static struct i2c_driver anx78xx_driver = {
>  		   .name = "anx7814",
>  		   .of_match_table = of_match_ptr(anx78xx_match_table),
>  		  },
> -	.probe = anx78xx_i2c_probe,
> +	.probe_new = anx78xx_i2c_probe,
>  	.remove = anx78xx_i2c_remove,
>  	.id_table = anx78xx_id,
>  };
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
