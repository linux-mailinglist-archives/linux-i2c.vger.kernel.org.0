Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5DFD630FF5
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 18:35:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234179AbiKSRfB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Nov 2022 12:35:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235192AbiKSRej (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 12:34:39 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63EC1C29;
        Sat, 19 Nov 2022 09:34:37 -0800 (PST)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E2B71749;
        Sat, 19 Nov 2022 18:34:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1668879276;
        bh=00f5eVhJt99Pw1DKlvCUegQOUshzgfx+1nNmj7RLqys=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=NmEWjl3fD54fFlPMK5WWxrya5y6DenxeYxIkevTT6x9BdAMFaF6OT6ONNH2UT90MM
         GAXfyNDe9CAJsJKwla9KiczQqlHdOkWFpaeggwy89B/SA2HSjTNY2gjqnwJ0snX5uC
         qqxPgPWinJ91d60W9pzSuycweL4+z8FfgIicZNYw=
Date:   Sat, 19 Nov 2022 19:34:20 +0200
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
Subject: Re: [PATCH 028/606] drm/bridge: parade-ps8622: Convert to i2c's
 .probe_new()
Message-ID: <Y3kTnO5C/ilRa1uw@pendragon.ideasonboard.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-29-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-29-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:36:02PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> ---
>  drivers/gpu/drm/bridge/parade-ps8622.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/parade-ps8622.c b/drivers/gpu/drm/bridge/parade-ps8622.c
> index 309de802863d..530ee6a19e7e 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8622.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8622.c
> @@ -442,9 +442,9 @@ static const struct of_device_id ps8622_devices[] = {
>  };
>  MODULE_DEVICE_TABLE(of, ps8622_devices);
>  
> -static int ps8622_probe(struct i2c_client *client,
> -					const struct i2c_device_id *id)
> +static int ps8622_probe(struct i2c_client *client)
>  {
> +	const struct i2c_device_id *id = i2c_client_get_device_id(client);
>  	struct device *dev = &client->dev;
>  	struct ps8622_bridge *ps8622;
>  	struct drm_bridge *panel_bridge;
> @@ -538,7 +538,7 @@ MODULE_DEVICE_TABLE(i2c, ps8622_i2c_table);
>  
>  static struct i2c_driver ps8622_driver = {
>  	.id_table	= ps8622_i2c_table,
> -	.probe		= ps8622_probe,
> +	.probe_new	= ps8622_probe,
>  	.remove		= ps8622_remove,
>  	.driver		= {
>  		.name	= "ps8622",
> -- 
> 2.38.1
> 

-- 
Regards,

Laurent Pinchart
