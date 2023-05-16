Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD594704E37
	for <lists+linux-i2c@lfdr.de>; Tue, 16 May 2023 14:55:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232951AbjEPMy6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 May 2023 08:54:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36378 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233136AbjEPMyg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 16 May 2023 08:54:36 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3CDE619B;
        Tue, 16 May 2023 05:54:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1684241666; x=1715777666;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p0He5tvXte4d1JieMjl6lshdqriX6UhheHjawnPStNw=;
  b=mkPTIPL7qDoyTx3qt1qARcNjHKuuBs4P0JzQIb+KTS2MvtN28yhXJq8e
   17O9JlUIH2JS5W4uq/Be8PEqj7I1lsE2OrtoDOtWYs7OSyDbRplKprJhs
   o/1A/7ZYRSB3yz4W/Be+yXyzY8YTc7BqlyyHC01SM7hOsghPlOlLI3b9Z
   2ZxoAdbaFT3eWkEvPxBgdjmhbiQuD6Ai/Sj8MKvGw9vN53kmCxF+8DB8o
   qZRQG67B9IiMjOulpFPPwmHYojssLfY64upgApmimxhE1LX8Xm694CACx
   E96l3KreGakWfdzMI30ywxNLwpm5qy9V70EDfAYUEYT1VxSQatWU6s45F
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="340833564"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="340833564"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 05:54:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10711"; a="678835489"
X-IronPort-AV: E=Sophos;i="5.99,278,1677571200"; 
   d="scan'208";a="678835489"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2023 05:54:07 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
        by kekkonen.fi.intel.com (Postfix) with SMTP id A5109120279;
        Tue, 16 May 2023 15:44:34 +0300 (EEST)
Date:   Tue, 16 May 2023 12:44:34 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wolfram Sang <wsa@kernel.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v13 6/8] media: i2c: add DS90UB960 driver
Message-ID: <ZGN6sjseR/GHs2dM@kekkonen.localdomain>
References: <20230426115114.156696-1-tomi.valkeinen@ideasonboard.com>
 <20230426115114.156696-7-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230426115114.156696-7-tomi.valkeinen@ideasonboard.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Moi,

Thanks for the update.

On Wed, Apr 26, 2023 at 02:51:12PM +0300, Tomi Valkeinen wrote:
> diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> index 256d55bb2b1d..80de6c3a6492 100644
> --- a/drivers/media/i2c/Kconfig
> +++ b/drivers/media/i2c/Kconfig
> @@ -1611,4 +1611,25 @@ config VIDEO_THS7303
>  
>  endmenu
>  
> +#
> +# Video serializers and deserializers (e.g. FPD-Link)
> +#
> +
> +menu "Video serializers and deserializers"
> +
> +config VIDEO_DS90UB960
> +	tristate "TI FPD-Link III/IV Deserializers"
> +	depends on OF && I2C && VIDEO_DEV
> +	select I2C_ATR
> +	select MEDIA_CONTROLLER
> +	select OF_GPIO

I think GPIOLIB would be more appropriate. OF as such should be fine as
ACPI support probably requires something else, too.

> +	select REGMAP_I2C
> +	select V4L2_FWNODE
> +	select VIDEO_V4L2_SUBDEV_API
> +	help
> +	  Device driver for the Texas Instruments DS90UB960
> +	  FPD-Link III Deserializer and DS90UB9702 FPD-Link IV Deserializer.
> +
> +endmenu
> +

-- 
Kind regards,

Sakari Ailus
