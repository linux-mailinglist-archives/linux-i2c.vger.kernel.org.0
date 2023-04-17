Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4EB36E5112
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Apr 2023 21:38:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229602AbjDQTi4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Apr 2023 15:38:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjDQTiz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 17 Apr 2023 15:38:55 -0400
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4E5610E9
        for <linux-i2c@vger.kernel.org>; Mon, 17 Apr 2023 12:38:53 -0700 (PDT)
Received: from [192.168.1.18] ([86.243.2.178])
        by smtp.orange.fr with ESMTPA
        id oUgbpdM36TpvfoUgbptHgF; Mon, 17 Apr 2023 21:38:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=orange.fr;
        s=t20230301; t=1681760330;
        bh=h0c4v83lQQcD1VmYWqo03UppnnWxjRpj4EWZiEcADn4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To;
        b=cT+QRN3RO6O2bdeiOqogISWZEFri/DmZijiT1qTb7SQcsJ2KYLeV5EsmtVkibj+HH
         G+NiJ+zJKYCiqmQo3VtTxo6JwH6icKGMEh7OaQyHHGmrhI5OqgnsK5rZFSvznVdOK6
         CNKYY9AnUaLu8X6+xGi7iECITcNuvzqMLc3dNuK7rm9nxoHj8SHvkTa+bC7FciA+A0
         j0I10laElbuA7abYnhG/ekhravVe3H+qf/SD2H2BPWIzlzH2+bnFG86UqZYQGbe2cb
         aAVzttBFzPG8kWd/eXTSpIRPX1ImDYl9xzQxXurn/kn4SZ1py5S/2MkmRKAsUa92FR
         o+gUxBn/7LlDA==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 17 Apr 2023 21:38:50 +0200
X-ME-IP: 86.243.2.178
Message-ID: <e6acd1f5-a3d6-2b46-b098-9f7bf7570658@wanadoo.fr>
Date:   Mon, 17 Apr 2023 21:38:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v12 3/4] i2c: muxes: pca954x: Add MAX735x/MAX736x support
To:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        Peter Rosin <peda@axentia.se>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230417104801.808972-1-patrick.rudolph@9elements.com>
 <20230417104801.808972-4-patrick.rudolph@9elements.com>
Content-Language: fr
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20230417104801.808972-4-patrick.rudolph@9elements.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Le 17/04/2023 à 12:47, Patrick Rudolph a écrit :
> Add support for the following Maxim chips using the existing PCA954x
> driver:
> - MAX7356
> - MAX7357
> - MAX7358
> - MAX7367
> - MAX7368
> - MAX7369
> 
> All added Maxim chips behave like the PCA954x, where a single SMBUS byte
> write selects up to 8 channels to be bridged to the primary bus.
> 
> While the MAX7357/MAX7358 have interrupt support, they don't act as
> interrupt controller like the PCA9545 does. Thus don't enable IRQ support
> and handle them like the PCA9548.
> 
> Tested using the MAX7357.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> ---
>   drivers/i2c/muxes/Kconfig           |  6 +--
>   drivers/i2c/muxes/i2c-mux-pca954x.c | 60 ++++++++++++++++++++++++++++-
>   2 files changed, 62 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
> index ea838dbae32e..db1b9057612a 100644
> --- a/drivers/i2c/muxes/Kconfig
> +++ b/drivers/i2c/muxes/Kconfig
> @@ -65,11 +65,11 @@ config I2C_MUX_PCA9541
>   	  will be called i2c-mux-pca9541.
>   
>   config I2C_MUX_PCA954x
> -	tristate "NXP PCA954x and PCA984x I2C Mux/switches"
> +	tristate "NXP PCA954x/PCA984x and Maxim MAX735x/MAX736x I2C Mux/switches"
>   	depends on GPIOLIB || COMPILE_TEST
>   	help
> -	  If you say yes here you get support for the NXP PCA954x
> -	  and PCA984x I2C mux/switch devices.
> +	  If you say yes here you get support for NXP PCA954x/PCA984x
> +	  and Maxim MAX735x/MAX736x I2C mux/switch devices.
>   
>   	  This driver can also be built as a module.  If so, the module
>   	  will be called i2c-mux-pca954x.
> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> index 0ccee2ae5720..39f313658b18 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> @@ -4,6 +4,7 @@
>    *
>    * Copyright (c) 2008-2009 Rodolfo Giometti <giometti@linux.it>
>    * Copyright (c) 2008-2009 Eurotech S.p.A. <info@eurotech.it>
> + * Copyright (c) 2022 9elements GmbH <patrick.rudolph@9elements.com>
>    *
>    * This module supports the PCA954x and PCA984x series of I2C multiplexer/switch
>    * chips made by NXP Semiconductors.
> @@ -11,6 +12,12 @@
>    *	 PCA9540, PCA9542, PCA9543, PCA9544, PCA9545, PCA9546, PCA9547,
>    *	 PCA9548, PCA9846, PCA9847, PCA9848 and PCA9849.
>    *
> + * It's also compatible to Maxims MAX735x I2C switch chips, which are controlled
> + * as the NXP PCA9548 and the MAX736x chips that act like the PCA9544.
> + *
> + * This includes the:
> + *	 MAX7356, MAX7357, MAX7358, MAX7367, MAX7368 and MAX7369
> + *
>    * These chips are all controlled via the I2C bus itself, and all have a
>    * single 8-bit register. The upstream "parent" bus fans out to two,
>    * four, or eight downstream busses or channels; which of these
> @@ -51,6 +58,12 @@
>   #define PCA954X_IRQ_OFFSET 4
>   
>   enum pca_type {
> +	max_7367,
> +	max_7368,
> +	max_7369,
> +	max_7356,
> +	max_7357,
> +	max_7358,

Should there be another version:

Nit: any reason to have it "out-of order" (7356, ..., 7367, ...)?

>   	pca_9540,
>   	pca_9542,
>   	pca_9543,
> @@ -90,8 +103,41 @@ struct pca954x {
>   	raw_spinlock_t lock;
>   };
>   
> -/* Provide specs for the PCA954x types we know about */
> +/* Provide specs for the MAX735x, PCA954x and PCA984x types we know about */
>   static const struct chip_desc chips[] = {
> +	[max_7356] = {
> +		.nchans = 8,
> +		.muxtype = pca954x_isswi,
> +		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
> +	},
> +	[max_7357] = {
> +		.nchans = 8,
> +		.muxtype = pca954x_isswi,
> +		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
> +	},
> +	[max_7358] = {
> +		.nchans = 8,
> +		.muxtype = pca954x_isswi,
> +		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
> +	},
> +	[max_7367] = {
> +		.nchans = 4,
> +		.muxtype = pca954x_isswi,
> +		.has_irq = 1,
> +		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
> +	},
> +	[max_7368] = {
> +		.nchans = 4,
> +		.muxtype = pca954x_isswi,
> +		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
> +	},
> +	[max_7369] = {
> +		.nchans = 4,
> +		.enable = 0x4,
> +		.muxtype = pca954x_ismux,
> +		.has_irq = 1,
> +		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
> +	},
>   	[pca_9540] = {
>   		.nchans = 2,
>   		.enable = 0x4,
> @@ -177,6 +223,12 @@ static const struct chip_desc chips[] = {
>   };
>   
>   static const struct i2c_device_id pca954x_id[] = {
> +	{ "max7356", max_7356 },
> +	{ "max7357", max_7357 },
> +	{ "max7358", max_7358 },
> +	{ "max7367", max_7367 },
> +	{ "max7368", max_7368 },
> +	{ "max7369", max_7369 },
>   	{ "pca9540", pca_9540 },
>   	{ "pca9542", pca_9542 },
>   	{ "pca9543", pca_9543 },
> @@ -194,6 +246,12 @@ static const struct i2c_device_id pca954x_id[] = {
>   MODULE_DEVICE_TABLE(i2c, pca954x_id);
>   
>   static const struct of_device_id pca954x_of_match[] = {
> +	{ .compatible = "maxim,max7356", .data = &chips[max_7356] },
> +	{ .compatible = "maxim,max7357", .data = &chips[max_7357] },
> +	{ .compatible = "maxim,max7358", .data = &chips[max_7358] },
> +	{ .compatible = "maxim,max7367", .data = &chips[max_7367] },
> +	{ .compatible = "maxim,max7368", .data = &chips[max_7368] },
> +	{ .compatible = "maxim,max7369", .data = &chips[max_7369] },
>   	{ .compatible = "nxp,pca9540", .data = &chips[pca_9540] },
>   	{ .compatible = "nxp,pca9542", .data = &chips[pca_9542] },
>   	{ .compatible = "nxp,pca9543", .data = &chips[pca_9543] },

