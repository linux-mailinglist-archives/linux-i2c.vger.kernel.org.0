Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0740B631027
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 18:46:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235234AbiKSRqH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 12:46:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235231AbiKSRqD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 12:46:03 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A90A31AD9D;
        Sat, 19 Nov 2022 09:46:01 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2AD08749;
        Sat, 19 Nov 2022 18:46:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668879960;
        bh=tGykl6Hb5bJmG6fmWkQXz3wPsGPrGYKR+rLtHBiSOTQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jQblar9yd0iUs1llzcmplQCSh0N0nlTiG2FWoQsRoqaNqAz8N/UWxL+DaGXndw9+N
         SrFFRHuZw56GiH33gXUzVTVtD/UXSOH49YTffJ2tylH7Y7mhyC6tEjjNHCVipJvvVH
         nowdt4yNCVEtaMa9ld6vW3R++u7hk8tO/C8dotsM=
Date:   Sat, 19 Nov 2022 19:45:44 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 358/606] media: i2c/ov6650: Convert to i2c's .probe_new()
Message-ID: <Y3kWSKrz70yyR35L@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-359-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-359-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:41:32PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/ov6650.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
> index 18f041e985b7..4c0ea2ae671b 100644
> --- a/drivers/media/i2c/ov6650.c
> +++ b/drivers/media/i2c/ov6650.c
> @@ -1025,8 +1025,7 @@ static const struct v4l2_subdev_internal_ops ov6650_internal_ops = {
>  /*
>   * i2c_driver function
>   */
> -static int ov6650_probe(struct i2c_client *client,
> -			const struct i2c_device_id *did)
> +static int ov6650_probe(struct i2c_client *client)
>  {
>  	struct ov6650 *priv;
>  	int ret;
> @@ -1114,7 +1113,7 @@ static struct i2c_driver ov6650_i2c_driver = {
>  	.driver = {
>  		.name = "ov6650",
>  	},
> -	.probe    = ov6650_probe,
> +	.probe_new = ov6650_probe,
>  	.remove   = ov6650_remove,
>  	.id_table = ov6650_id,
>  };
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
