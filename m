Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D624D632301
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 14:03:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229944AbiKUNDl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 08:03:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230320AbiKUNDj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 08:03:39 -0500
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9519CC54;
        Mon, 21 Nov 2022 05:03:38 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 02CB4240012;
        Mon, 21 Nov 2022 13:03:33 +0000 (UTC)
Date:   Mon, 21 Nov 2022 14:03:33 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Crt Mori <cmo@melexis.com>,
        Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 362/606] media: i2c/rj54n1cb0c: Convert to i2c's
 .probe_new()
Message-ID: <20221121130333.5mypzf67cki6f57f@uno.localdomain>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-363-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-363-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Uwe

On Fri, Nov 18, 2022 at 11:41:36PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
>
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Acked-by: Jacopo Mondi <jacopo@jmondi.org>

Thanks
  j

> ---
>  drivers/media/i2c/rj54n1cb0c.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/media/i2c/rj54n1cb0c.c b/drivers/media/i2c/rj54n1cb0c.c
> index 1c3502f34cd3..9db5473daba0 100644
> --- a/drivers/media/i2c/rj54n1cb0c.c
> +++ b/drivers/media/i2c/rj54n1cb0c.c
> @@ -1297,8 +1297,7 @@ static int rj54n1_video_probe(struct i2c_client *client,
>  	return ret;
>  }
>
> -static int rj54n1_probe(struct i2c_client *client,
> -			const struct i2c_device_id *did)
> +static int rj54n1_probe(struct i2c_client *client)
>  {
>  	struct rj54n1 *rj54n1;
>  	struct i2c_adapter *adapter = client->adapter;
> @@ -1422,7 +1421,7 @@ static struct i2c_driver rj54n1_i2c_driver = {
>  	.driver = {
>  		.name = "rj54n1cb0c",
>  	},
> -	.probe		= rj54n1_probe,
> +	.probe_new	= rj54n1_probe,
>  	.remove		= rj54n1_remove,
>  	.id_table	= rj54n1_id,
>  };
> --
> 2.38.1
>
