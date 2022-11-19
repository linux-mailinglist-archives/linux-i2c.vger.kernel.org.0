Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADD7A631022
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 18:45:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235204AbiKSRpi (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 12:45:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235230AbiKSRpd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 12:45:33 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E036C1A041;
        Sat, 19 Nov 2022 09:45:31 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A836749;
        Sat, 19 Nov 2022 18:45:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668879930;
        bh=0wFyofNw1vfVQnD7P2jzQz1i6WFlg3IkOF4i5Ft6Xuk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DkzmGMsDXbYzrsjllveXx1hrmWTkf3F6bUzj9kFGIt/BWFrjtQMMNxKcBjNWQuTS3
         aLxiDIGiXfcMgyMhYJqZGwxHbX6WXxKunqxbwXQ6v/8jRjLBLFUuVUtnG9/3qMzFpW
         lr1B+fy3TfqH5jn8tNUXfA1G/m8gcgW0QVZsCt1U=
Date:   Sat, 19 Nov 2022 19:45:14 +0200
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
Subject: Re: [PATCH 351/606] media: i2c/mt9p031: Convert to i2c's .probe_new()
Message-ID: <Y3kWKndn0sN2666P@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-352-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-352-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:41:25PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/mt9p031.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index 45f7b5e52bc3..ecee8a58d930 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -1097,9 +1097,9 @@ mt9p031_get_pdata(struct i2c_client *client)
>  	return pdata;
>  }
>  
> -static int mt9p031_probe(struct i2c_client *client,
> -			 const struct i2c_device_id *did)
> +static int mt9p031_probe(struct i2c_client *client)
>  {
> +	const struct i2c_device_id *did = i2c_client_get_device_id(client);
>  	struct mt9p031_platform_data *pdata = mt9p031_get_pdata(client);
>  	struct i2c_adapter *adapter = client->adapter;
>  	struct mt9p031 *mt9p031;
> @@ -1243,7 +1243,7 @@ static struct i2c_driver mt9p031_i2c_driver = {
>  		.of_match_table = of_match_ptr(mt9p031_of_match),
>  		.name = "mt9p031",
>  	},
> -	.probe          = mt9p031_probe,
> +	.probe_new      = mt9p031_probe,
>  	.remove         = mt9p031_remove,
>  	.id_table       = mt9p031_id,
>  };
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
