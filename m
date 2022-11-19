Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 23B94630FF0
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 18:34:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234932AbiKSRej (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 12:34:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234978AbiKSReT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 12:34:19 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6ECE1168;
        Sat, 19 Nov 2022 09:34:17 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 37282749;
        Sat, 19 Nov 2022 18:34:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668879256;
        bh=7tHvRVrH8z3LVgZXdtz7Q2QO8efFirX0nMfC9WpLVyg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qusWdgmc6Z0RBi3FhNfKuV4YBnhEJNf1Grkf3xIZc1EjfHb0SYZXcO1b6xDU1tHgo
         ePR4v4RmHpBee/98hhPBSd6BZ3IjRtkev0jrwDM/cGUO1xd9C74rsmCTr4s0ZtkF63
         Au+2wa6aaObFVCOzgNXdiWZPYp4g6r9VsBOfloek=
Date:   Sat, 19 Nov 2022 19:34:00 +0200
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
Subject: Re: [PATCH 034/606] drm/bridge/tc358775: Convert to i2c's
 .probe_new()
Message-ID: <Y3kTiLEAGRFuckxI@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-35-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-35-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:36:08PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/tc358775.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
> index 3ceb0e9f9bdc..91b5e1207c47 100644
> --- a/drivers/gpu/drm/bridge/tc358775.c
> +++ b/drivers/gpu/drm/bridge/tc358775.c
> @@ -637,7 +637,7 @@ static int tc_attach_host(struct tc_data *tc)
>  	return 0;
>  }
>  
> -static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
> +static int tc_probe(struct i2c_client *client)
>  {
>  	struct device *dev = &client->dev;
>  	struct tc_data *tc;
> @@ -729,7 +729,7 @@ static struct i2c_driver tc358775_driver = {
>  		.of_match_table = tc358775_of_ids,
>  	},
>  	.id_table = tc358775_i2c_ids,
> -	.probe = tc_probe,
> +	.probe_new = tc_probe,
>  	.remove	= tc_remove,
>  };
>  module_i2c_driver(tc358775_driver);
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
