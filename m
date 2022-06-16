Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0A554DFA6
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jun 2022 13:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbiFPLEb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jun 2022 07:04:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbiFPLEb (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jun 2022 07:04:31 -0400
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10D925AEC0;
        Thu, 16 Jun 2022 04:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1655377470; x=1686913470;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FcU4UT3bPxh/t4Ktq9/FrPyMu3tmK0XhE8wqjm27hhQ=;
  b=MT3VqzeFwsPY+ZrVToNHcg4O2YwpXr1OK7bXUYEfZvIZAOSvEVkxIZkW
   xdrlcW5a0rk5B3qY9CGTxYl8y3ChFECy/nT6wZmn14q3sKBw7m2Ysaxj5
   9ekOk6v0s+sj7wFlki9AAmbnjMsqQTDIfPluR6iZa/QoLZ7hIUAotr7LP
   BOPdtYhJgGnVRvDGhGQVF23DkUjK8FLDn/wqDgomhGv5JhCrT2rOk8Gch
   5FJkTsfVgv5CX97o4TeYNEqNye7Lr0i0NVekx074/bY4oQsJVZMKZHVkH
   K2N0Sloydi0AmeCAGVzvM/rdKsuj/A4PYvkhf6qQF6ZpgPehvI3wtKIgi
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="262243264"
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="262243264"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 04:04:29 -0700
X-IronPort-AV: E=Sophos;i="5.91,304,1647327600"; 
   d="scan'208";a="653115477"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2022 04:04:27 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1o1nGQ-000eDK-1J;
        Thu, 16 Jun 2022 14:02:14 +0300
Date:   Thu, 16 Jun 2022 14:02:13 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Dinh Nguyen <dinguyen@kernel.org>
Cc:     jarkko.nikula@linux.intel.com, mika.westerberg@linux.intel.com,
        robh+dt@kernel.org, krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCHv4 1/2] i2c: designware: introduce a custom scl recovery
 for SoCFPGA platforms
Message-ID: <YqsNtWhPNCvnFM1D@smile.fi.intel.com>
References: <20220615191214.826879-1-dinguyen@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220615191214.826879-1-dinguyen@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Jun 15, 2022 at 02:12:13PM -0500, Dinh Nguyen wrote:
> The I2C pins on the SoCFPGA platforms do not go through a GPIO module,
> thus cannot be recovered by the default method of by doing a GPIO access.
> Only a reset of the I2C IP block can a recovery be successful.
> 
> The assignment of the recover_bus needs to get done before the call to
> devm_gpiod_get_optional(), otherwise, the assignment is not taking place
> because of an error after returning from devm_gpiod_get_optional().

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

(yes, assuming stray change goes away)

> Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
> ---
> v4: re-arrange code per Andy Shevchenko's recommendation
> v3: simplify the function
>     update commit message
> v2: remove change to MODEL_MASK
>     s/i2c_custom_scl_recovery/i2c_socfpga_scl_recovery
> ---
>  drivers/i2c/busses/i2c-designware-core.h    |  1 +
>  drivers/i2c/busses/i2c-designware-master.c  | 50 ++++++++++++++++++---
>  drivers/i2c/busses/i2c-designware-platdrv.c |  1 +
>  3 files changed, 46 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-core.h b/drivers/i2c/busses/i2c-designware-core.h
> index 70b80e710990..7b22ec1d6a96 100644
> --- a/drivers/i2c/busses/i2c-designware-core.h
> +++ b/drivers/i2c/busses/i2c-designware-core.h
> @@ -303,6 +303,7 @@ struct dw_i2c_dev {
>  #define MODEL_MSCC_OCELOT	BIT(8)
>  #define MODEL_BAIKAL_BT1	BIT(9)
>  #define MODEL_AMD_NAVI_GPU	BIT(10)
> +#define MODEL_SOCFPGA		BIT(11)
>  #define MODEL_MASK		GENMASK(11, 8)
>  
>  /*
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index 44a94b225ed8..6b75a08a1c1f 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -813,10 +813,26 @@ static void i2c_dw_unprepare_recovery(struct i2c_adapter *adap)
>  	i2c_dw_init_master(dev);
>  }
>  
> -static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
> +static int i2c_socfpga_scl_recovery(struct i2c_adapter *adap)
> +{
> +	struct i2c_bus_recovery_info *bri = adap->bus_recovery_info;
> +
> +	bri->prepare_recovery(adap);
> +	bri->unprepare_recovery(adap);
> +
> +	return 0;
> +}
> +
> +static int i2c_dw_init_socfpga_recovery_info(struct dw_i2c_dev *dev,
> +					     struct i2c_bus_recovery_info *rinfo)
> +{
> +	rinfo->recover_bus = i2c_socfpga_scl_recovery;
> +	return 1;
> +}
> +
> +static int i2c_dw_init_generic_recovery_info(struct dw_i2c_dev *dev,
> +					     struct i2c_bus_recovery_info *rinfo)
>  {
> -	struct i2c_bus_recovery_info *rinfo = &dev->rinfo;
> -	struct i2c_adapter *adap = &dev->adapter;
>  	struct gpio_desc *gpio;
>  
>  	gpio = devm_gpiod_get_optional(dev->dev, "scl", GPIOD_OUT_HIGH);
> @@ -831,16 +847,38 @@ static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
>  	rinfo->sda_gpiod = gpio;
>  
>  	rinfo->recover_bus = i2c_generic_scl_recovery;
> -	rinfo->prepare_recovery = i2c_dw_prepare_recovery;
> -	rinfo->unprepare_recovery = i2c_dw_unprepare_recovery;
> -	adap->bus_recovery_info = rinfo;
>  
>  	dev_info(dev->dev, "running with gpio recovery mode! scl%s",
>  		 rinfo->sda_gpiod ? ",sda" : "");
>  
> +	return 1;
> +}
> +
> +static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
> +{
> +	struct i2c_bus_recovery_info *rinfo = &dev->rinfo;
> +	struct i2c_adapter *adap = &dev->adapter;
> +	int ret;
> +
> +	switch (dev->flags & MODEL_MASK) {
> +	case MODEL_SOCFPGA:
> +		ret = i2c_dw_init_socfpga_recovery_info(dev, rinfo);
> +		break;
> +	default:
> +		ret = i2c_dw_init_generic_recovery_info(dev, rinfo);
> +		break;
> +	}
> +	if (ret <= 0)
> +		return ret;
> +
> +	rinfo->prepare_recovery = i2c_dw_prepare_recovery;
> +	rinfo->unprepare_recovery = i2c_dw_unprepare_recovery;
> +	adap->bus_recovery_info = rinfo;
> +
>  	return 0;
>  }
>  
> +
>  static int amd_i2c_adap_quirk(struct dw_i2c_dev *dev)
>  {
>  	struct i2c_adapter *adap = &dev->adapter;
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index 70ade5306e45..b33e015e6732 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -153,6 +153,7 @@ static const struct of_device_id dw_i2c_of_match[] = {
>  	{ .compatible = "snps,designware-i2c", },
>  	{ .compatible = "mscc,ocelot-i2c", .data = (void *)MODEL_MSCC_OCELOT },
>  	{ .compatible = "baikal,bt1-sys-i2c", .data = (void *)MODEL_BAIKAL_BT1 },
> +	{ .compatible = "intel,socfpga-i2c", .data = (void *)MODEL_SOCFPGA },
>  	{},
>  };
>  MODULE_DEVICE_TABLE(of, dw_i2c_of_match);
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


