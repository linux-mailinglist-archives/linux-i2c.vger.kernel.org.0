Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9B626322F8
	for <lists+linux-i2c@lfdr.de>; Mon, 21 Nov 2022 14:02:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbiKUNBb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 21 Nov 2022 08:01:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230099AbiKUNBM (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 21 Nov 2022 08:01:12 -0500
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D81A89BA16;
        Mon, 21 Nov 2022 05:01:10 -0800 (PST)
Received: (Authenticated sender: jacopo@jmondi.org)
        by mail.gandi.net (Postfix) with ESMTPSA id 78B9A1C0010;
        Mon, 21 Nov 2022 13:01:05 +0000 (UTC)
Date:   Mon, 21 Nov 2022 14:01:04 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 067/606] iio: adc: max9611: Convert to i2c's .probe_new()
Message-ID: <20221121130104.ftptygyvtgzxplhv@uno.localdomain>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-68-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-68-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Uwe,

On Fri, Nov 18, 2022 at 11:36:41PM +0100, Uwe Kleine-König wrote:
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
>  drivers/iio/adc/max9611.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/iio/adc/max9611.c b/drivers/iio/adc/max9611.c
> index f982f00303dc..cb7f4785423a 100644
> --- a/drivers/iio/adc/max9611.c
> +++ b/drivers/iio/adc/max9611.c
> @@ -510,8 +510,7 @@ static const struct of_device_id max9611_of_table[] = {
>  };
>
>  MODULE_DEVICE_TABLE(of, max9611_of_table);
> -static int max9611_probe(struct i2c_client *client,
> -			 const struct i2c_device_id *id)
> +static int max9611_probe(struct i2c_client *client)
>  {
>  	const char * const shunt_res_prop = "shunt-resistor-micro-ohms";
>  	struct max9611_dev *max9611;
> @@ -557,7 +556,7 @@ static struct i2c_driver max9611_driver = {
>  		   .name = DRIVER_NAME,
>  		   .of_match_table = max9611_of_table,
>  	},
> -	.probe = max9611_probe,
> +	.probe_new = max9611_probe,
>  };
>  module_i2c_driver(max9611_driver);
>
> --
> 2.38.1
>
