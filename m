Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59A1F785A1F
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Aug 2023 16:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234658AbjHWONz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Aug 2023 10:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231654AbjHWONz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 23 Aug 2023 10:13:55 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 248B3E50;
        Wed, 23 Aug 2023 07:13:53 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 919F3623A1;
        Wed, 23 Aug 2023 14:13:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00B27C433C8;
        Wed, 23 Aug 2023 14:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692800031;
        bh=ydsESdqXqC8SBnUrJeZxsVY3hKglli1Mw9Xijz5i/lQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IE4MYfWvHDP5XTBulieVmpbspqSWB3xH5brTILJun34FQeNGwYCf23Cp5nrs4JqaQ
         8L6O/ndO0mHPuT6qcrdtc7kx8AVInvZ7iYlPcXCukmSEOmD3m5AxgA57SB2CqafKe4
         tIofYZVkS4+SX1EDVUS+fptIfRTapXVrzsEX4CfflXD1dglyPtt7yDaFXVVS3WUhki
         c1QCtelhMx0oMKC/XxwZcQyTD+rsh1SK0MO9RaJOZcDO3980Egp6rWJRdRgt39m1es
         6ltsHHfPWWOfTpb+wTZfoP0Xp3Ar3Zj/4z5u5HFlPOcbVStCppXcyHDUBPSBElDwFX
         P0TijJc9pT1TQ==
Date:   Wed, 23 Aug 2023 16:13:46 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>, naresh.solanki@9elements.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [v16 3/4] i2c: muxes: pca954x: Add MAX735x/MAX736x support
Message-ID: <20230823141346.76gzdto3tdsthdqm@intel.intel>
References: <20230821062027.2631725-1-patrick.rudolph@9elements.com>
 <20230821062027.2631725-4-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230821062027.2631725-4-patrick.rudolph@9elements.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Patrick,

On Mon, Aug 21, 2023 at 08:20:23AM +0200, Patrick Rudolph wrote:
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

Thanks for resending it!

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

and you also forgot:

Acked-by: Peter Rosin <peda@axentia.se>

Adding it so that both b4 and patchwork get it.

Andi

> ---
>  drivers/i2c/muxes/Kconfig           |  6 +--
>  drivers/i2c/muxes/i2c-mux-pca954x.c | 67 ++++++++++++++++++++++++++++-
>  2 files changed, 69 insertions(+), 4 deletions(-)
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
> index 0ccee2ae5720..32873df56e33 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> @@ -11,6 +11,12 @@
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
> @@ -51,6 +57,12 @@
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
> @@ -90,8 +102,49 @@ struct pca954x {
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
> +		/*
> +		 * No interrupt controller support. The interrupt
> +		 * provides information about stuck channels.
> +		 */
> +	},
> +	[max_7358] = {
> +		.nchans = 8,
> +		.muxtype = pca954x_isswi,
> +		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
> +		/*
> +		 * No interrupt controller support. The interrupt
> +		 * provides information about stuck channels.
> +		 */
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
> @@ -177,6 +230,12 @@ static const struct chip_desc chips[] = {
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
> @@ -194,6 +253,12 @@ static const struct i2c_device_id pca954x_id[] = {
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
> 2.41.0
> 
