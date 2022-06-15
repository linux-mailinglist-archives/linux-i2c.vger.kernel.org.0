Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A67C554C5BB
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Jun 2022 12:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344730AbiFOKTD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Jun 2022 06:19:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbiFOKTB (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 15 Jun 2022 06:19:01 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A0266429;
        Wed, 15 Jun 2022 03:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655288340; x=1686824340;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Fh8trV0hdIp/yCRR7UrJ8pnXnHW7iI9bN7gg83pe9U8=;
  b=cYoUYy3OwisdCEkIBAMOIeuP/bJAhwT/9HPzu17lEaq1jQLqc/1gX9NT
   VgirEe6RuWsYXWuSJu4b5TIQFio1SYZYFmrChOlsUxMk/sSSlJModWsXC
   Q2/ZsjMDLimkx4JWuTnjL2BOeCHwMzUIjMa0akEx9xzlTRuO76BKgrzAK
   qgBTYGhi8LO8TcLel7lRmN3AjvDguEZo20fO+mOY5Yy97rXpzXUQVUGMZ
   i5v6Ig5kdIs0zDNAeZrDatqAApA/HGim9QXfDnK/qTeL6BlGfRZuZcYgS
   9zGbK8bXVYO+2PKkfP2bP4yEhXfQaWZ8xaGFu3AZhb/x09vwwsepsIZo4
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10378"; a="258760542"
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="258760542"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 03:19:00 -0700
X-IronPort-AV: E=Sophos;i="5.91,300,1647327600"; 
   d="scan'208";a="589036179"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2022 03:18:57 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1o1Q6x-000dI9-Cf;
        Wed, 15 Jun 2022 13:18:55 +0300
Date:   Wed, 15 Jun 2022 13:18:55 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dinh Nguyen <dinguyen@kernel.org>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        robh+dt@kernel.org, krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCHv3 1/2] i2c: designware: introduce a custom scl recovery
 for SoCFPGA platforms
Message-ID: <YqmyD2w5iriUYpQf@smile.fi.intel.com>
References: <20220613210032.773826-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220613210032.773826-1-dinguyen@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 13, 2022 at 04:00:31PM -0500, Dinh Nguyen wrote:
> The I2C pins on the SoCFPGA platforms do not go through a GPIO module,
> thus cannot be recovered by the default method of by doing a GPIO access.
> Only a reset of the I2C IP block can a recovery be successful.
> 
> The assignment of the recover_bus needs to get done before the call to
> devm_gpiod_get_optional(), otherwise, the assignment is not taking place
> because of an error after returning from devm_gpiod_get_optional().

Thanks for an update!
My comments below.

...

> +static int i2c_socfpga_scl_recovery(struct i2c_adapter *adap)
> +{
> +	i2c_dw_prepare_recovery(adap);
> +	i2c_dw_unprepare_recovery(adap);

Can we use

	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;

	bri->prepare_recovery(adap);
	bri->unprepare_recovery(adap);

> +	return 0;
> +}

instead and...

...

>  static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
>  {
>  	struct i2c_bus_recovery_info *rinfo = &dev->rinfo;
>  	struct i2c_adapter *adap = &dev->adapter;
>  	struct gpio_desc *gpio;
>  
> +	if ((dev->flags & MODEL_MASK) == MODEL_SOCFPGA) {
> +		rinfo->recover_bus = i2c_socfpga_scl_recovery;
> +		adap->bus_recovery_info = rinfo;
> +	}
> +
>  	gpio = devm_gpiod_get_optional(dev->dev, "scl", GPIOD_OUT_HIGH);
>  	if (IS_ERR_OR_NULL(gpio))
>  		return PTR_ERR_OR_ZERO(gpio);

...this one to be transformed like (in a preparatory patch and in this one):

static int i2c_dw_init_socfpga_recovery_info(struct dw_i2c_dev *dev,
					     struct i2c_bus_recovery_info *rinfo)
{
	rinfo->recover_bus = i2c_socfpga_scl_recovery;
	return 0;
}

static int i2c_dw_init_generic_recovery_info(struct dw_i2c_dev *dev,
					     struct i2c_bus_recovery_info *rinfo)
{
	struct i2c_adapter *adap = &dev->adapter;
	struct gpio_desc *gpio;

	gpio = devm_gpiod_get_optional(dev->dev, "scl", GPIOD_OUT_HIGH);
	if (IS_ERR_OR_NULL(gpio))
		return PTR_ERR_OR_ZERO(gpio);

	rinfo->scl_gpiod = gpio;

	gpio = devm_gpiod_get_optional(dev->dev, "sda", GPIOD_IN);
	if (IS_ERR(gpio))
		return PTR_ERR(gpio);
	rinfo->sda_gpiod = gpio;

	rinfo->recover_bus = i2c_generic_scl_recovery;

	dev_info(dev->dev, "running with gpio recovery mode! scl%s",
		 rinfo->sda_gpiod ? ",sda" : "");

	return 0;
}

static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
{
	struct i2c_bus_recovery_info *rinfo = &dev->rinfo;
	struct i2c_adapter *adap = &dev->adapter;
	int ret;

	switch (dev->flags & MODEL_MASK) {
	case MODEL_SOCFPGA:
		ret = i2c_dw_init_socfpga_recovery_info(dev, rinfo);
		break;
	default:
		ret = i2c_dw_init_generic_recovery_info(dev, rinfo);
		break;
	}
	if (ret)
		return ret;

	rinfo->prepare_recovery = i2c_dw_prepare_recovery;
	rinfo->unprepare_recovery = i2c_dw_unprepare_recovery;
	adap->bus_recovery_info = rinfo;

	return 0;
}

-- 
With Best Regards,
Andy Shevchenko


