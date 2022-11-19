Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC3A631024
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 18:45:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235230AbiKSRpu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 12:45:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235231AbiKSRps (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 12:45:48 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 610881AD92;
        Sat, 19 Nov 2022 09:45:47 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C1B09749;
        Sat, 19 Nov 2022 18:45:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668879946;
        bh=Pub3niZDGi+TZSFRiO3u9PNhZsYR4f+5+Yth2wlyHhM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Plm5aFeDDeX98yC484lpdzNsalDG7h5piuZxCSTfwSvg7mkOI3lIEu0pF9KB582NN
         IAMFGJQh0aj/Qc0pjlFvCOmyvGTX2DWBoIjfoMjHOEzQimYdXbjMQQdw1VpsXnBaQk
         OuThf9jli9AJBOetWt7Q9NqO96k8f6lvUtiCYr2I=
Date:   Sat, 19 Nov 2022 19:45:30 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 348/606] media: i2c/ml86v7667: Convert to i2c's
 .probe_new()
Message-ID: <Y3kWOrv7AVtGNfJl@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-349-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-349-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:41:22PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/i2c/ml86v7667.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/ml86v7667.c b/drivers/media/i2c/ml86v7667.c
> index 49ec59b0ca43..dbd2f0bd3651 100644
> --- a/drivers/media/i2c/ml86v7667.c
> +++ b/drivers/media/i2c/ml86v7667.c
> @@ -359,8 +359,7 @@ static int ml86v7667_init(struct ml86v7667_priv *priv)
>  	return ret;
>  }
>  
> -static int ml86v7667_probe(struct i2c_client *client,
> -			   const struct i2c_device_id *did)
> +static int ml86v7667_probe(struct i2c_client *client)
>  {
>  	struct ml86v7667_priv *priv;
>  	int ret;
> @@ -434,7 +433,7 @@ static struct i2c_driver ml86v7667_i2c_driver = {
>  	.driver = {
>  		.name	= DRV_NAME,
>  	},
> -	.probe		= ml86v7667_probe,
> +	.probe_new	= ml86v7667_probe,
>  	.remove		= ml86v7667_remove,
>  	.id_table	= ml86v7667_id,
>  };
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
