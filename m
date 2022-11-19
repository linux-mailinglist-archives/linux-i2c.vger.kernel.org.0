Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB50630D53
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Nov 2022 09:42:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231598AbiKSImJ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Sat, 19 Nov 2022 03:42:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiKSImI (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Nov 2022 03:42:08 -0500
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4DAC79351;
        Sat, 19 Nov 2022 00:42:05 -0800 (PST)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
        by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <heiko@sntech.de>)
        id 1owJQD-00077J-K4; Sat, 19 Nov 2022 09:41:57 +0100
From:   Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <uwe@kleine-koenig.org>
Cc:     linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-input@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 228/606] Input: auo-pixcir-ts - Convert to i2c's .probe_new()
Date:   Sat, 19 Nov 2022 09:41:56 +0100
Message-ID: <6247861.DvuYhMxLoT@diego>
In-Reply-To: <20221118224540.619276-229-uwe@kleine-koenig.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org> <20221118224540.619276-229-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_PASS,
        T_SPF_HELO_TEMPERROR autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am Freitag, 18. November 2022, 23:39:22 CET schrieb Uwe Kleine-König:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/input/touchscreen/auo-pixcir-ts.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/input/touchscreen/auo-pixcir-ts.c b/drivers/input/touchscreen/auo-pixcir-ts.c
> index 2deae5a6823a..a4a1d58aeeac 100644
> --- a/drivers/input/touchscreen/auo-pixcir-ts.c
> +++ b/drivers/input/touchscreen/auo-pixcir-ts.c
> @@ -482,8 +482,7 @@ static void auo_pixcir_reset(void *data)
>  	gpiod_set_value_cansleep(ts->gpio_rst, 1);
>  }
>  
> -static int auo_pixcir_probe(struct i2c_client *client,
> -			    const struct i2c_device_id *id)
> +static int auo_pixcir_probe(struct i2c_client *client)
>  {
>  	struct auo_pixcir_ts *ts;
>  	struct input_dev *input_dev;
> @@ -637,7 +636,7 @@ static struct i2c_driver auo_pixcir_driver = {
>  		.pm	= &auo_pixcir_pm_ops,
>  		.of_match_table	= of_match_ptr(auo_pixcir_ts_dt_idtable),
>  	},
> -	.probe		= auo_pixcir_probe,
> +	.probe_new	= auo_pixcir_probe,
>  	.id_table	= auo_pixcir_idtable,
>  };
>  
> 




