Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D1B4E630FDE
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 18:32:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233485AbiKSRcd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 12:32:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234843AbiKSRcM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 12:32:12 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7B2817063;
        Sat, 19 Nov 2022 09:32:11 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 64D99749;
        Sat, 19 Nov 2022 18:32:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668879130;
        bh=jUNlhbtAmBCo3WSrJ05Ql8p8uJj3KXKKDHveVbtyPoY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lGtopmRf0xfqqInvuNWq7Mm4rIG9EsuczeVHxAs34qeydUmT3lQbnfUbDqIm1JxJ6
         9834nQL95f5TFyExc93nluI3j7yurfPdjC2RpimboGSd4q1UBLpNNgOd3Yyr+iSRSb
         ZQaBwiAOVn3bew/dHTEgFwU22faVllz0GS6LVFWs=
Date:   Sat, 19 Nov 2022 19:31:54 +0200
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
Subject: Re: [PATCH 029/606] drm/bridge: sii902x: Convert to i2c's
 .probe_new()
Message-ID: <Y3kTCi4qVO8hl/lR@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-30-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-30-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:36:03PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/sii902x.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index 878fb7d3732b..ea590db41970 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -1066,8 +1066,7 @@ static int sii902x_init(struct sii902x *sii902x)
>  	return i2c_mux_add_adapter(sii902x->i2cmux, 0, 0, 0);
>  }
>  
> -static int sii902x_probe(struct i2c_client *client,
> -			 const struct i2c_device_id *id)
> +static int sii902x_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	struct device_node *endpoint;
> @@ -1169,7 +1168,7 @@ static const struct i2c_device_id sii902x_i2c_ids[] = {
>  MODULE_DEVICE_TABLE(i2c, sii902x_i2c_ids);
>  
>  static struct i2c_driver sii902x_driver = {
> -	.probe = sii902x_probe,
> +	.probe_new = sii902x_probe,
>  	.remove = sii902x_remove,
>  	.driver = {
>  		.name = "sii902x",
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
