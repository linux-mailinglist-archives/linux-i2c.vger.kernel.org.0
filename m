Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 698C563101E
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 18:45:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235187AbiKSRpS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 12:45:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235221AbiKSRpQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 12:45:16 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D51FD1A224;
        Sat, 19 Nov 2022 09:45:14 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5CBDD749;
        Sat, 19 Nov 2022 18:45:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668879913;
        bh=w/aY+2GFuCjEatd4kJyI8U3nqGhM8nWKERBEkIZptqo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Eg1H1EMhuxc0DWPrePOUUmPbka+zn9ekswFo7/C0d8m73ED1wX2UWtl0X7o59bC7+
         OhCqOhj/hbxHy7FHU6nN+pqfYDSNwe5MbDgeLkbNeVBzF8OgPUftgF/NqjUCYeVVq7
         LhzIpsxThY9c5F8BInEFfNDACy54xyZZoDEn72PU=
Date:   Sat, 19 Nov 2022 19:44:57 +0200
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
Subject: Re: [PATCH 355/606] media: i2c/mt9v032: Convert to i2c's .probe_new()
Message-ID: <Y3kWGQA2jXEUvVao@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-356-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-356-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:41:29PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/mt9v032.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9v032.c b/drivers/media/i2c/mt9v032.c
> index bc4388ccc2a8..7cfd4ebdd2e6 100644
> --- a/drivers/media/i2c/mt9v032.c
> +++ b/drivers/media/i2c/mt9v032.c
> @@ -1044,9 +1044,9 @@ mt9v032_get_pdata(struct i2c_client *client)
>  	return pdata;
>  }
>  
> -static int mt9v032_probe(struct i2c_client *client,
> -		const struct i2c_device_id *did)
> +static int mt9v032_probe(struct i2c_client *client)
>  {
> +	const struct i2c_device_id *did = i2c_client_get_device_id(client);
>  	struct mt9v032_platform_data *pdata = mt9v032_get_pdata(client);
>  	struct mt9v032 *mt9v032;
>  	unsigned int i;
> @@ -1296,7 +1296,7 @@ static struct i2c_driver mt9v032_driver = {
>  		.name = "mt9v032",
>  		.of_match_table = of_match_ptr(mt9v032_of_match),
>  	},
> -	.probe		= mt9v032_probe,
> +	.probe_new	= mt9v032_probe,
>  	.remove		= mt9v032_remove,
>  	.id_table	= mt9v032_id,
>  };
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
