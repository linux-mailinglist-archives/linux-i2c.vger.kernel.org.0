Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EED205E8E58
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Sep 2022 18:06:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230401AbiIXQGF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 24 Sep 2022 12:06:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiIXQGE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 24 Sep 2022 12:06:04 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9C91476D9;
        Sat, 24 Sep 2022 09:06:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 66589B80782;
        Sat, 24 Sep 2022 16:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4570C433C1;
        Sat, 24 Sep 2022 16:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664035561;
        bh=mAzk/ABw+cRZJTpd0WAnJu1DCNRIu1ogXyUkjr1Cfjk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=X6lcMflnv09Bn8d5P02zvtu1gttvr1mtu1s2fV/+H2+q14t+GGoYWkcYyZJFGyryt
         QMVyDw7GvqdZSiGQg0ePp3uM58eIjSJzeJcB2qUMXpcXxmpm1BXpo4JIiTHuLu9Wdl
         Yq8Rr8ay5gfcOffK/5IUm2Gm/Rh7Ih4hRgKJK2gUD4cppUE5dsyFocbPFqMKN7+Xhi
         p19XLCHHTPtBFOXdtZWI9mQb9EZhwRAIdnzgF1+zhJQ30VAoU93VXoupOR6TPVR6Ol
         SA2M9I4LldsLi8Bc4xHwsHEN87njuNJOmbbo17zUGeWjSPg2j0NYoOq8fa3sElSfzF
         CYan41fUu9vYg==
Date:   Sat, 24 Sep 2022 17:06:08 +0100
From:   Jonathan Cameron <jic23@kernel.org>
To:     Matt Ranostay <matt.ranostay@konsulko.com>
Cc:     gupt21@gmail.com, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v4 3/5] iio: dac: fix future recursive dependencies
Message-ID: <20220924170608.3631a9ce@jic23-huawei>
In-Reply-To: <20220921063026.89619-4-matt.ranostay@konsulko.com>
References: <20220921063026.89619-1-matt.ranostay@konsulko.com>
        <20220921063026.89619-4-matt.ranostay@konsulko.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, 20 Sep 2022 23:30:24 -0700
Matt Ranostay <matt.ranostay@konsulko.com> wrote:

> When using 'imply IIO' for other configurations which have 'select GPIOLIB'
> the following recursive dependency is detected for AD5592R/AD5593R
> 
> Switch from 'select GPIOLIB' to 'depends on GPIOLIB' to avoid this per
> recommendation in kconfig-language.rst
> 
> drivers/gpio/Kconfig:14:error: recursive dependency detected!
> drivers/gpio/Kconfig:14:        symbol GPIOLIB is selected by AD5592R
> drivers/iio/dac/Kconfig:93:     symbol AD5592R depends on IIO
> drivers/iio/Kconfig:6:  symbol IIO is implied by HID_MCP2221
> drivers/hid/Kconfig:1227:       symbol HID_MCP2221 depends on GPIOLIB
> 
> Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
Acked-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  drivers/iio/dac/Kconfig | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
> index 80521bd28d0f..b93003e80b70 100644
> --- a/drivers/iio/dac/Kconfig
> +++ b/drivers/iio/dac/Kconfig
> @@ -92,8 +92,7 @@ config AD5592R_BASE
>  
>  config AD5592R
>  	tristate "Analog Devices AD5592R ADC/DAC driver"
> -	depends on SPI_MASTER
> -	select GPIOLIB
> +	depends on SPI_MASTER && GPIOLIB
>  	select AD5592R_BASE
>  	help
>  	  Say yes here to build support for Analog Devices AD5592R
> @@ -104,8 +103,7 @@ config AD5592R
>  
>  config AD5593R
>  	tristate "Analog Devices AD5593R ADC/DAC driver"
> -	depends on I2C
> -	select GPIOLIB
> +	depends on I2C && GPIOLIB
>  	select AD5592R_BASE
>  	help
>  	  Say yes here to build support for Analog Devices AD5593R

