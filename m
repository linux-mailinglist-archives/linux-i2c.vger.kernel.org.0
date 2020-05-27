Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54A1A1E44DD
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 15:58:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389079AbgE0N6E (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 09:58:04 -0400
Received: from mga07.intel.com ([134.134.136.100]:26294 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389073AbgE0N6D (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 May 2020 09:58:03 -0400
IronPort-SDR: gIrL3P7GEFE96iy3vhq8XA+4CR7mFj2vVmApGDpe4SIh/JlQ43q/oJImQbtPMpguhQP4t7mddr
 kejcU+1CE0tg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 06:58:02 -0700
IronPort-SDR: AHI0U6LHvGJCpd2TX1iZgKjsYxbJp3IWGbpDXjgNPljDufXMuXsTpbd+wbrwWrc2oZcW/PeYSE
 vj+ye+/bgxHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,441,1583222400"; 
   d="scan'208";a="442529663"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga005.jf.intel.com with ESMTP; 27 May 2020 06:57:59 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jdwZF-009Eqw-S8; Wed, 27 May 2020 16:58:01 +0300
Date:   Wed, 27 May 2020 16:58:01 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Rob Herring <robh+dt@kernel.org>, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 10/11] i2c: designware: Move reg-space remapping into
 a dedicated function
Message-ID: <20200527135801.GB1634618@smile.fi.intel.com>
References: <20200527120111.5781-1-Sergey.Semin@baikalelectronics.ru>
 <20200527120111.5781-11-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527120111.5781-11-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 03:01:10PM +0300, Serge Semin wrote:
> This is a preparation patch before adding a quirk with custom registers
> map creation required for the Baikal-T1 System I2C support.

Looks good. Though one nit below.
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: linux-mips@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> 
> ---
> 
> Changelog v3:
> - This is a new patch, which has been created due to declining the
>   glue-layer approach.
> 
> Changelog v4:
> - Use PTR_ERR_OR_ZERO() helper in the bt1_i2c_request_regs() method.
> - Discard devm_platform_get_and_ioremap_resource() utilization.
> ---
>  drivers/i2c/busses/i2c-designware-platdrv.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index ad292de2d260..061c8d506c7c 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -108,6 +108,15 @@ static void dw_i2c_plat_pm_cleanup(struct dw_i2c_dev *dev)
>  		pm_runtime_put_noidle(dev->dev);
>  }
>  
> +static int dw_i2c_plat_request_regs(struct dw_i2c_dev *dev)
> +{
> +	struct platform_device *pdev = to_platform_device(dev->dev);
> +
> +	dev->base = devm_platform_ioremap_resource(pdev, 0);
> +
> +	return PTR_ERR_OR_ZERO(dev->base);
> +}
> +
>  static int dw_i2c_plat_probe(struct platform_device *pdev)
>  {
>  	struct dw_i2c_platform_data *pdata = dev_get_platdata(&pdev->dev);
> @@ -125,15 +134,14 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  

>  	dev->flags |= (uintptr_t)device_get_match_data(&pdev->dev);

It's related to previous patch, but I just realized that '|' is not needed
here. Care to amend in the previous patch?

> -
> -	dev->base = devm_platform_ioremap_resource(pdev, 0);
> -	if (IS_ERR(dev->base))
> -		return PTR_ERR(dev->base);
> -
>  	dev->dev = &pdev->dev;
>  	dev->irq = irq;
>  	platform_set_drvdata(pdev, dev);
>  
> +	ret = dw_i2c_plat_request_regs(dev);
> +	if (ret)
> +		return ret;
> +
>  	dev->rst = devm_reset_control_get_optional_exclusive(&pdev->dev, NULL);
>  	if (IS_ERR(dev->rst))
>  		return PTR_ERR(dev->rst);
> -- 
> 2.26.2
> 

-- 
With Best Regards,
Andy Shevchenko


