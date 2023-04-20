Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3730C6E9FAE
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Apr 2023 01:09:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230432AbjDTXJV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 20 Apr 2023 19:09:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbjDTXJU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 20 Apr 2023 19:09:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25F1FCE;
        Thu, 20 Apr 2023 16:09:19 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B59F264CA8;
        Thu, 20 Apr 2023 23:09:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4920AC433D2;
        Thu, 20 Apr 2023 23:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682032158;
        bh=FxrO5rZzxabKe+WUZKwZXTftbSptyDD2a1PTcFIXpqY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rm3mb+qBIkDPjU8yZvNEhABqtDQXD5DxpcF9m/gz4Rdj/d72C+39W+oKJ7ypaHWjZ
         0MIJdb0Is+grrSyWqE9seNqLYQwG9wm34ViZUMBK/BK91KLNdNVIrPAtg5GrOjUYyo
         pPu4lT6wGdqmWyW9/IcUlYYTqZ+Bd32a0gt0nI+aSUUBjqCRaom8HSPUI9+21iC3oa
         91EValXAMng96arTzs9QpAuoOlcu3Gq6VBUCuP/sAorddfH7pWV/aZLgfdbrRkk+eq
         a22RzlGVCpale5i5381yoxOPrkuN9QO6fnQVYMMFBKzxA+MTH/hJQ+fQIj24L2QzLQ
         W2rGgYivlcPwA==
Date:   Fri, 21 Apr 2023 01:09:13 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v13 3/4] i2c: muxes: pca954x: Add MAX735x/MAX736x support
Message-ID: <20230420230913.hjsilgqpq27di6m3@intel.intel>
References: <20230418103430.966278-1-patrick.rudolph@9elements.com>
 <20230418103430.966278-4-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418103430.966278-4-patrick.rudolph@9elements.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Patrick,

On Tue, Apr 18, 2023 at 12:34:28PM +0200, Patrick Rudolph wrote:
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

Can you add this as a comment also in the chip_desc?

> Tested using the MAX7357.
> 
> Signed-off-by: Patrick Rudolph <patrick.rudolph@9elements.com>
> ---
>  drivers/i2c/muxes/Kconfig           |  6 +--
>  drivers/i2c/muxes/i2c-mux-pca954x.c | 60 ++++++++++++++++++++++++++++-
>  2 files changed, 62 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/muxes/Kconfig b/drivers/i2c/muxes/Kconfig
> index ea838dbae32e..db1b9057612a 100644
> --- a/drivers/i2c/muxes/Kconfig
> +++ b/drivers/i2c/muxes/Kconfig
> @@ -65,11 +65,11 @@ config I2C_MUX_PCA9541
>  	  will be called i2c-mux-pca9541.
>  
>  config I2C_MUX_PCA954x
> -	tristate "NXP PCA954x and PCA984x I2C Mux/switches"
> +	tristate "NXP PCA954x/PCA984x and Maxim MAX735x/MAX736x I2C Mux/switches"
>  	depends on GPIOLIB || COMPILE_TEST
>  	help
> -	  If you say yes here you get support for the NXP PCA954x
> -	  and PCA984x I2C mux/switch devices.
> +	  If you say yes here you get support for NXP PCA954x/PCA984x
> +	  and Maxim MAX735x/MAX736x I2C mux/switch devices.
>  
>  	  This driver can also be built as a module.  If so, the module
>  	  will be called i2c-mux-pca954x.
> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> index 0ccee2ae5720..a9195d1547f1 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> @@ -4,6 +4,7 @@
>   *
>   * Copyright (c) 2008-2009 Rodolfo Giometti <giometti@linux.it>
>   * Copyright (c) 2008-2009 Eurotech S.p.A. <info@eurotech.it>
> + * Copyright (c) 2022 9elements GmbH <patrick.rudolph@9elements.com>

2023

Otherwise, looks good,

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi

>   *
>   * This module supports the PCA954x and PCA984x series of I2C multiplexer/switch
>   * chips made by NXP Semiconductors.
> @@ -11,6 +12,12 @@
>   *	 PCA9540, PCA9542, PCA9543, PCA9544, PCA9545, PCA9546, PCA9547,
>   *	 PCA9548, PCA9846, PCA9847, PCA9848 and PCA9849.
>   *
> + * It's also compatible to Maxims MAX735x I2C switch chips, which are controlled
> + * as the NXP PCA9548 and the MAX736x chips that act like the PCA9544.
> + *
> + * This includes the:
> + *	 MAX7356, MAX7357, MAX7358, MAX7367, MAX7368 and MAX7369
> + *
>   * These chips are all controlled via the I2C bus itself, and all have a
>   * single 8-bit register. The upstream "parent" bus fans out to two,
>   * four, or eight downstream busses or channels; which of these
> @@ -51,6 +58,12 @@
>  #define PCA954X_IRQ_OFFSET 4
>  
>  enum pca_type {
> +	max_7356,
> +	max_7357,
> +	max_7358,
> +	max_7367,
> +	max_7368,
> +	max_7369,
>  	pca_9540,
>  	pca_9542,
>  	pca_9543,
> @@ -90,8 +103,41 @@ struct pca954x {
>  	raw_spinlock_t lock;
>  };
>  
> -/* Provide specs for the PCA954x types we know about */
> +/* Provide specs for the MAX735x, PCA954x and PCA984x types we know about */
>  static const struct chip_desc chips[] = {
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
>  	[pca_9540] = {
>  		.nchans = 2,
>  		.enable = 0x4,
> @@ -177,6 +223,12 @@ static const struct chip_desc chips[] = {
>  };
>  
>  static const struct i2c_device_id pca954x_id[] = {
> +	{ "max7356", max_7356 },
> +	{ "max7357", max_7357 },
> +	{ "max7358", max_7358 },
> +	{ "max7367", max_7367 },
> +	{ "max7368", max_7368 },
> +	{ "max7369", max_7369 },
>  	{ "pca9540", pca_9540 },
>  	{ "pca9542", pca_9542 },
>  	{ "pca9543", pca_9543 },
> @@ -194,6 +246,12 @@ static const struct i2c_device_id pca954x_id[] = {
>  MODULE_DEVICE_TABLE(i2c, pca954x_id);
>  
>  static const struct of_device_id pca954x_of_match[] = {
> +	{ .compatible = "maxim,max7356", .data = &chips[max_7356] },
> +	{ .compatible = "maxim,max7357", .data = &chips[max_7357] },
> +	{ .compatible = "maxim,max7358", .data = &chips[max_7358] },
> +	{ .compatible = "maxim,max7367", .data = &chips[max_7367] },
> +	{ .compatible = "maxim,max7368", .data = &chips[max_7368] },
> +	{ .compatible = "maxim,max7369", .data = &chips[max_7369] },
>  	{ .compatible = "nxp,pca9540", .data = &chips[pca_9540] },
>  	{ .compatible = "nxp,pca9542", .data = &chips[pca_9542] },
>  	{ .compatible = "nxp,pca9543", .data = &chips[pca_9543] },
> -- 
> 2.39.2
> 
