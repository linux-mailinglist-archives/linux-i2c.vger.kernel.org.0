Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 40B63632300
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 14:03:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbiKUNDk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 08:03:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230267AbiKUNDG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 08:03:06 -0500
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF13F1704B;
        Mon, 21 Nov 2022 05:03:04 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id B09CE240008;
        Mon, 21 Nov 2022 13:02:57 +0000 (UTC)
Date:   Mon, 21 Nov 2022 14:02:56 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jean Delvare <jdelvare@suse.de>, Ajay Gupta <ajayg@nvidia.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Miguel Ojeda <ojeda@kernel.org>, linux-i2c@vger.kernel.org,
        kernel@pengutronix.de,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 353/606] media: i2c/mt9t112: Convert to i2c's .probe_new()
Message-ID: <20221121130256.hxcklmvitodck76g@uno.localdomain>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-354-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-354-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Uwe

On Fri, Nov 18, 2022 at 11:41:27PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---

Acked-by: Jacopo Mondi <jacopo@jmondi.org>


>  drivers/media/i2c/mt9t112.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/i2c/mt9t112.c b/drivers/media/i2c/mt9t112.c
> index ad564095d0cf..a82f056787b8 100644
> --- a/drivers/media/i2c/mt9t112.c
> +++ b/drivers/media/i2c/mt9t112.c
> @@ -1060,8 +1060,7 @@ static int mt9t112_camera_probe(struct i2c_client *client)
>  	return ret;
>  }
>
> -static int mt9t112_probe(struct i2c_client *client,
> -			 const struct i2c_device_id *did)
> +static int mt9t112_probe(struct i2c_client *client)
>  {
>  	struct mt9t112_priv *priv;
>  	int ret;
> @@ -1120,7 +1119,7 @@ static struct i2c_driver mt9t112_i2c_driver = {
>  	.driver = {
>  		.name = "mt9t112",
>  	},
> -	.probe    = mt9t112_probe,
> +	.probe_new = mt9t112_probe,
>  	.remove   = mt9t112_remove,
>  	.id_table = mt9t112_id,
>  };
> --
> 2.38.1
>
