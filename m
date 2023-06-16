Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C917973334D
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Jun 2023 16:17:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344801AbjFPORr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 16 Jun 2023 10:17:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230209AbjFPORq (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 16 Jun 2023 10:17:46 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1FC330D3;
        Fri, 16 Jun 2023 07:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686925063; x=1718461063;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KpKlD4bekCsz5EYgTX0dmlOsSqC0fimS9KdgQ94QDjw=;
  b=bhhmGGZzJDxEUzDt+cbfBHYRJOTdN64U2kDJ58ksL87sa0Gyedqe1NTy
   o9ZSd4glhGWUT7UY4xzSJ4Hg+TicxHtJ7tJcEwX2YpDaKvs1LXQ2U4565
   UJ78RqrhSMN8Ol+Y3I5ctkJ/4Y7x6NQ8MwV7U0QfDSjuIHC0GBMBvz3Rn
   B4DwXhbCi8gFdQATLGDstFVxG0zYqD2bsIEGvlszhs9PWiito3wh/sUjX
   q74WiDLSOCTMqV6kx7aEGkfMEOtMNvUuiMbNBXutktyUn1SjD0fjWIZlE
   RMCjbTh+Zj1YgKdjzaQNVHqMdZLJHWa9oQ2fAyCpH5gpXxSts27kpf72C
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="339552603"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="339552603"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 07:17:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="857395954"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="857395954"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 16 Jun 2023 07:17:31 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qAAGW-004Ikc-35;
        Fri, 16 Jun 2023 17:17:28 +0300
Date:   Fri, 16 Jun 2023 17:17:28 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>
Subject: Re: [PATCH v14 11/18] media: i2c: ds90ub9xx: Select GPIOLIB rather
 than OF_GPIO
Message-ID: <ZIxu+IvTSaFW3erU@smile.fi.intel.com>
References: <20230616135922.442979-1-tomi.valkeinen@ideasonboard.com>
 <20230616135922.442979-12-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230616135922.442979-12-tomi.valkeinen@ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Jun 16, 2023 at 04:59:15PM +0300, Tomi Valkeinen wrote:
> Select GPIOLIB rather than OF_GPIO, as the drivers use gpiolib
> functionality, but no of_gpio (directly).

This is useful change, but has to be folded in the original code.
We do not want even a trace of newly added OF_GPIO.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/media/i2c/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 8a5f09a3de6c..29fc00e30d8b 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -1622,7 +1622,7 @@ config VIDEO_DS90UB913
>  	depends on OF && I2C && VIDEO_DEV && COMMON_CLK
>  	select I2C_ATR
>  	select MEDIA_CONTROLLER
> -	select OF_GPIO
> +	select GPIOLIB
>  	select REGMAP_I2C
>  	select V4L2_FWNODE
>  	select VIDEO_V4L2_SUBDEV_API
> @@ -1635,7 +1635,7 @@ config VIDEO_DS90UB953
>  	depends on OF && I2C && VIDEO_DEV && COMMON_CLK
>  	select I2C_ATR
>  	select MEDIA_CONTROLLER
> -	select OF_GPIO
> +	select GPIOLIB
>  	select REGMAP_I2C
>  	select V4L2_FWNODE
>  	select VIDEO_V4L2_SUBDEV_API
> @@ -1648,7 +1648,7 @@ config VIDEO_DS90UB960
>  	depends on OF && I2C && VIDEO_DEV && COMMON_CLK
>  	select I2C_ATR
>  	select MEDIA_CONTROLLER
> -	select OF_GPIO
> +	select GPIOLIB
>  	select REGMAP_I2C
>  	select V4L2_FWNODE
>  	select VIDEO_V4L2_SUBDEV_API
> -- 
> 2.34.1
> 

-- 
With Best Regards,
Andy Shevchenko


