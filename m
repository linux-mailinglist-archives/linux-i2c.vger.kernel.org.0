Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B59E781D93
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Aug 2023 13:27:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230458AbjHTL1s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Aug 2023 07:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230463AbjHTL1p (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 20 Aug 2023 07:27:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71FDB10A;
        Sun, 20 Aug 2023 04:23:13 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 07E7E60C95;
        Sun, 20 Aug 2023 11:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF502C433C8;
        Sun, 20 Aug 2023 11:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692530592;
        bh=fv6Jnf4C4C6jLRYZLmCtAwdfTKtNmXWpxE2tscsXid4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=EXhoViG8aGvVvO7jkefln+vSQ3nqDk1W9hm1WW1ahfM/5jZiVYBXBFi8uyYKuxBvM
         umnShvJP7nfnolYZHogOYIkuokpMvapkXXImiZ8Qq6dxYU0mGnadUiqZtHNGp1g+ss
         p+Dj8FOOH6ZuRvErtrj3+3wckWbcsUyAvPVvLOm9kw78jiXuA7EYcejsds/leMiuvx
         PEH3bZHWiB8B2q9/5Q+ZTpSJfrubmqgu3fWpWaRBaXYCwkP74C/zuaGcyE4mHWLAH/
         ahjddURxel6VbnFfbWcCk/SNjc07KzItu93Y+ADHcNVjrvYuSwt7nQBCFk9Xhtr6Tw
         Zlj4bVMY0pJyg==
Date:   Sun, 20 Aug 2023 13:23:04 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Patrick Rudolph <patrick.rudolph@9elements.com>
Cc:     Peter Rosin <peda@axentia.se>, naresh.solanki@9elements.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 3/4] i2c: muxes: pca954x: Add MAX735x/MAX736x support
Message-ID: <20230820112304.bokph645wvqt5jfl@intel.intel>
References: <20230817071056.2125679-1-patrick.rudolph@9elements.com>
 <20230817071056.2125679-4-patrick.rudolph@9elements.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817071056.2125679-4-patrick.rudolph@9elements.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Patrick,

> diff --git a/drivers/i2c/muxes/i2c-mux-pca954x.c b/drivers/i2c/muxes/i2c-mux-pca954x.c
> index 0ccee2ae5720..968111442625 100644
> --- a/drivers/i2c/muxes/i2c-mux-pca954x.c
> +++ b/drivers/i2c/muxes/i2c-mux-pca954x.c
> @@ -4,6 +4,7 @@
>   *
>   * Copyright (c) 2008-2009 Rodolfo Giometti <giometti@linux.it>
>   * Copyright (c) 2008-2009 Eurotech S.p.A. <info@eurotech.it>
> + * Copyright (c) 2022 9elements GmbH <patrick.rudolph@9elements.com>

2023?

One question, why are you adding yourself in the copyright?

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
> @@ -90,8 +103,45 @@ struct pca954x {
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
> +		/* No interrupt controller support.
> +		   The interrupt provides information about stuck channels. */

I'm sorry, Peter already commented on this, can you please fix
the commenting?

		/*
		 * No interrupt controller support.
		 * The interrupt provides information
		 * about stuck channels.
		 */

Or

		/*
		 * No interrupt controller support. The interrupt
		 * provides information * about stuck channels.
		 */

to save one line. (I prefer the latter, your choice)

Rest looks good.

Andi

> +	},
> +	[max_7358] = {
> +		.nchans = 8,
> +		.muxtype = pca954x_isswi,
> +		.id = { .manufacturer_id = I2C_DEVICE_ID_NONE },
> +		/* No interrupt controller support.
> +		   The interrupt provides information about stuck channels. */
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
> @@ -177,6 +227,12 @@ static const struct chip_desc chips[] = {
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
> @@ -194,6 +250,12 @@ static const struct i2c_device_id pca954x_id[] = {
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
