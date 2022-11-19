Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D96D63101B
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 18:45:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233499AbiKSRpB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 12:45:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234264AbiKSRo6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 12:44:58 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F9B61ADA3;
        Sat, 19 Nov 2022 09:44:57 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CE5C6749;
        Sat, 19 Nov 2022 18:44:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668879896;
        bh=7Eci60XTnzC5kwOtCAXPvtRZSj9nX7spcsdPMwrtK6E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ID4dKZOiiiXvgddCPmHQctbFZQ+elu0pJmh489dKcOnqE8esgtgOWTXm+K8cw03WI
         hLvgdD7Qv7VcUtCw3H7nlaB/pMmN27OiTE4NHAo54L5qe4ecQ+5WnXi8iz2Xc6D+92
         Mny6FCST8d/9EGu9kz+eQbTP1OJMGG3QcPo6WFtc=
Date:   Sat, 19 Nov 2022 19:44:40 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 352/606] media: i2c/mt9t001: Convert to i2c's .probe_new()
Message-ID: <Y3kWCIYGt4IR8qh0@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-353-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-353-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:41:26PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/mt9t001.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9t001.c b/drivers/media/i2c/mt9t001.c
> index d5abe4a7ef07..c635ed11388a 100644
> --- a/drivers/media/i2c/mt9t001.c
> +++ b/drivers/media/i2c/mt9t001.c
> @@ -856,8 +856,7 @@ static const struct v4l2_subdev_internal_ops mt9t001_subdev_internal_ops = {
>  	.close = mt9t001_close,
>  };
>  
> -static int mt9t001_probe(struct i2c_client *client,
> -			 const struct i2c_device_id *did)
> +static int mt9t001_probe(struct i2c_client *client)
>  {
>  	struct mt9t001_platform_data *pdata = client->dev.platform_data;
>  	struct mt9t001 *mt9t001;
> @@ -981,7 +980,7 @@ static struct i2c_driver mt9t001_driver = {
>  	.driver = {
>  		.name = "mt9t001",
>  	},
> -	.probe		= mt9t001_probe,
> +	.probe_new	= mt9t001_probe,
>  	.remove		= mt9t001_remove,
>  	.id_table	= mt9t001_id,
>  };
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
