Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6BB0C631015
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 18:42:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231865AbiKSRml (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 12:42:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231626AbiKSRmk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 12:42:40 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6389B19031;
        Sat, 19 Nov 2022 09:42:39 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E3397749;
        Sat, 19 Nov 2022 18:42:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668879758;
        bh=6U9SKVW3dW2sUrLfE6gFa0+CZDhHgR3gC5nTa3bjVfQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AXCXsooFKEjdKTWGSXHMSz6hLWIQSSIpNeNd1l7JikeQq57nACVXKtCUt0L7YWwQ0
         LGeJx+AWr4MSUqgYFybS99E10C0Fnm6I3D00nvG+zAs0oBUs1a950HPLX2/0y24aAz
         DOcjdguGzKJ7YXMz68wmVph2dt8Lvc6eU7cazXiI=
Date:   Sat, 19 Nov 2022 19:42:22 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Antoniu Miclaus <antoniu.miclaus@analog.com>,
        Jose Cazarin <joseespiriki@gmail.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 092/606] iio: dac: ti-dac5571: Convert to i2c's
 .probe_new()
Message-ID: <Y3kVfm0zPb2E4VnG@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-93-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-93-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:37:06PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/iio/dac/ti-dac5571.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iio/dac/ti-dac5571.c b/drivers/iio/dac/ti-dac5571.c
> index 3210e3098f9a..40191947fea3 100644
> --- a/drivers/iio/dac/ti-dac5571.c
> +++ b/drivers/iio/dac/ti-dac5571.c
> @@ -306,9 +306,9 @@ static const struct iio_info dac5571_info = {
>  	.write_raw_get_fmt = dac5571_write_raw_get_fmt,
>  };
>  
> -static int dac5571_probe(struct i2c_client *client,
> -			 const struct i2c_device_id *id)
> +static int dac5571_probe(struct i2c_client *client)
>  {
> +	const struct i2c_device_id *id = i2c_client_get_device_id(client);
>  	struct device *dev = &client->dev;
>  	const struct dac5571_spec *spec;
>  	struct dac5571_data *data;
> @@ -426,7 +426,7 @@ static struct i2c_driver dac5571_driver = {
>  		   .name = "ti-dac5571",
>  		   .of_match_table = dac5571_of_id,
>  	},
> -	.probe	  = dac5571_probe,
> +	.probe_new = dac5571_probe,
>  	.remove   = dac5571_remove,
>  	.id_table = dac5571_id,
>  };
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
