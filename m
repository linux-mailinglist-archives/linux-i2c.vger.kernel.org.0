Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D850630FD6
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 18:31:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234895AbiKSRby (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 12:31:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234892AbiKSRbi (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 12:31:38 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A103217418;
        Sat, 19 Nov 2022 09:31:20 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 15DE1749;
        Sat, 19 Nov 2022 18:31:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668879079;
        bh=yW91zXtP9MEsIH/A1q5d7M++OzfZLIE9H/uR5h2Gjyg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WnYNUBetfY8zWWlcKgsh5UmA62Q1W9K60w+Ut0hBhtaW76R1nLiSdo9hQm581ZgB/
         NNifhN6XMeVLAVbm58rmrtsz9Y5s+9s0cplfC3X1qMtDf5QzoyiDDoTjPeoeslnIre
         tH7h/wbT6d28XeUWHJyTwIucEy1UFOqy12XL0DV8=
Date:   Sat, 19 Nov 2022 19:31:03 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Peter Senna Tschudin <peter.senna@gmail.com>,
        Martin Donnelly <martin.donnelly@ge.com>,
        Martyn Welch <martyn.welch@collabora.co.uk>,
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
Subject: Re: [PATCH 026/606] drm/bridge: megachips: Convert to i2c's
 .probe_new()
Message-ID: <Y3kS13bmm8cL8Y/x@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-27-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-27-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:36:00PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  .../gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c   | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> index 97359f807bfc..4ee4a825a936 100644
> --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> @@ -336,8 +336,7 @@ static int ge_b850v3_register(void)
>  			"ge-b850v3-lvds-dp", ge_b850v3_lvds_ptr);
>  }
>  
> -static int stdp4028_ge_b850v3_fw_probe(struct i2c_client *stdp4028_i2c,
> -				       const struct i2c_device_id *id)
> +static int stdp4028_ge_b850v3_fw_probe(struct i2c_client *stdp4028_i2c)
>  {
>  	struct device *dev = &stdp4028_i2c->dev;
>  	int ret;
> @@ -376,7 +375,7 @@ MODULE_DEVICE_TABLE(of, stdp4028_ge_b850v3_fw_match);
>  
>  static struct i2c_driver stdp4028_ge_b850v3_fw_driver = {
>  	.id_table	= stdp4028_ge_b850v3_fw_i2c_table,
> -	.probe		= stdp4028_ge_b850v3_fw_probe,
> +	.probe_new	= stdp4028_ge_b850v3_fw_probe,
>  	.remove		= stdp4028_ge_b850v3_fw_remove,
>  	.driver		= {
>  		.name		= "stdp4028-ge-b850v3-fw",
> @@ -384,8 +383,7 @@ static struct i2c_driver stdp4028_ge_b850v3_fw_driver = {
>  	},
>  };
>  
> -static int stdp2690_ge_b850v3_fw_probe(struct i2c_client *stdp2690_i2c,
> -				       const struct i2c_device_id *id)
> +static int stdp2690_ge_b850v3_fw_probe(struct i2c_client *stdp2690_i2c)
>  {
>  	struct device *dev = &stdp2690_i2c->dev;
>  	int ret;
> @@ -424,7 +422,7 @@ MODULE_DEVICE_TABLE(of, stdp2690_ge_b850v3_fw_match);
>  
>  static struct i2c_driver stdp2690_ge_b850v3_fw_driver = {
>  	.id_table	= stdp2690_ge_b850v3_fw_i2c_table,
> -	.probe		= stdp2690_ge_b850v3_fw_probe,
> +	.probe_new	= stdp2690_ge_b850v3_fw_probe,
>  	.remove		= stdp2690_ge_b850v3_fw_remove,
>  	.driver		= {
>  		.name		= "stdp2690-ge-b850v3-fw",
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
