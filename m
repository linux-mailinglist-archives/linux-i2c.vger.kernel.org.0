Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5BC5639EB3
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Nov 2022 02:15:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229685AbiK1BP1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 27 Nov 2022 20:15:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbiK1BPX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 27 Nov 2022 20:15:23 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CEBD6472;
        Sun, 27 Nov 2022 17:15:21 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1A21B60F4B;
        Mon, 28 Nov 2022 01:15:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01CFDC433D6;
        Mon, 28 Nov 2022 01:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1669598120;
        bh=/Rnol2q+EPqB/pwlNw7OYMzt/EyzBj9Z7D9TcRA3sd4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XS3Ytjv821v6NHxBDyCoAjjzVY5v6WDW4tneP3NFLFqoM4xEvygSObVrnPBJGi5vC
         ziLgMaOj7KvOtLP8dfDYmJt8wiUMjsanZfz9T1T2UjUleJeXtnelQ0mcRN1rS0wPym
         Kn73HcGj9zFHskmg8ERkuE1NBHqQEzeXnZK+u4AgqxtZrMJxvg7IZB/tcDMKJ7uavM
         fPNS/OUGECUDP4afQSj5IRgwBlygrT/iYRsihYiS0+bpm9nkP5ZJxa3PubnClB79Rj
         vQqvDsGiTeug+dWwFVnEWeSMYb2wujhhV7yv8AYnV2cYszB0NHLvCBrKfO7aMrygOj
         c0I9tBhfm3Vdw==
Date:   Mon, 28 Nov 2022 03:15:15 +0200
From:   Jarkko Sakkinen <jarkko@kernel.org>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     Angel Iglesias <ang.iglesiasg@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        Grant Likely <grant.likely@linaro.org>,
        Wolfram Sang <wsa@kernel.org>, Peter Huewe <peterhuewe@gmx.de>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        linux-i2c@vger.kernel.org, kernel@pengutronix.de,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>, Jason Gunthorpe <jgg@ziepe.ca>,
        linux-integrity@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 002/606] tpm: tpm_i2c_atmel: Convert to i2c's .probe_new()
Message-ID: <Y4QLoyCfVefb6bo5@kernel.org>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-3-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-3-uwe@kleine-koenig.org>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Nov 18, 2022 at 11:35:36PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/char/tpm/tpm_i2c_atmel.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/char/tpm/tpm_i2c_atmel.c b/drivers/char/tpm/tpm_i2c_atmel.c
> index 4be3677c1463..8f77154e0550 100644
> --- a/drivers/char/tpm/tpm_i2c_atmel.c
> +++ b/drivers/char/tpm/tpm_i2c_atmel.c
> @@ -146,8 +146,7 @@ static const struct tpm_class_ops i2c_atmel = {
>  	.req_canceled = i2c_atmel_req_canceled,
>  };
>  
> -static int i2c_atmel_probe(struct i2c_client *client,
> -			   const struct i2c_device_id *id)
> +static int i2c_atmel_probe(struct i2c_client *client)
>  {
>  	struct tpm_chip *chip;
>  	struct device *dev = &client->dev;
> @@ -204,7 +203,7 @@ static SIMPLE_DEV_PM_OPS(i2c_atmel_pm_ops, tpm_pm_suspend, tpm_pm_resume);
>  
>  static struct i2c_driver i2c_atmel_driver = {
>  	.id_table = i2c_atmel_id,
> -	.probe = i2c_atmel_probe,
> +	.probe_new = i2c_atmel_probe,
>  	.remove = i2c_atmel_remove,
>  	.driver = {
>  		.name = I2C_DRIVER_NAME,
> -- 
> 2.38.1
> 

Acked-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko
