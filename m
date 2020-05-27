Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF64E1E4471
	for <lists+linux-i2c@lfdr.de>; Wed, 27 May 2020 15:51:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388865AbgE0Nva (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 27 May 2020 09:51:30 -0400
Received: from mga04.intel.com ([192.55.52.120]:49507 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388516AbgE0Nv2 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 27 May 2020 09:51:28 -0400
IronPort-SDR: IKo8haopAWSBl9I1yCtpdlb8BI4qZQbMyoNgczX8WMpN+XeuvlHCdyTvw/TZmRFzfeUmzyOC6Y
 uO76M7f0yFoA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 06:51:28 -0700
IronPort-SDR: NNzNVuxnsYgjq0//FrIlgA2Ubaekv0qkfg27wRfeu27gjGG5QHBtb0zZbvLGFggWcMukhQXXLU
 sgaB3Jr9XmgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,441,1583222400"; 
   d="scan'208";a="266840260"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga003.jf.intel.com with ESMTP; 27 May 2020 06:51:25 -0700
Received: from andy by smile with local (Exim 4.93)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jdwSt-009Eo4-V3; Wed, 27 May 2020 16:51:27 +0300
Date:   Wed, 27 May 2020 16:51:27 +0300
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
Subject: Re: [PATCH v4 09/11] i2c: designware: Retrieve quirk flags as early
 as possible
Message-ID: <20200527135127.GA1634618@smile.fi.intel.com>
References: <20200527120111.5781-1-Sergey.Semin@baikalelectronics.ru>
 <20200527120111.5781-10-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527120111.5781-10-Sergey.Semin@baikalelectronics.ru>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 27, 2020 at 03:01:09PM +0300, Serge Semin wrote:
> Some platforms might need to activate the driver quirks at a very early
> probe stage. For instance, Baikal-T1 System I2C doesn't need to map the
> registers space as ones belong to the system controller. Instead it will
> request the syscon regmap from the parental DT node. In order to be able
> to do so let's retrieve the model flags right after the DW I2C private
> data is created.

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
> ---
>  drivers/i2c/busses/i2c-designware-platdrv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index ca057aa9eac4..ad292de2d260 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -124,6 +124,8 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
>  	if (!dev)
>  		return -ENOMEM;
>  
> +	dev->flags |= (uintptr_t)device_get_match_data(&pdev->dev);
> +
>  	dev->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(dev->base))
>  		return PTR_ERR(dev->base);
> @@ -146,8 +148,6 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
>  
>  	i2c_dw_acpi_adjust_bus_speed(&pdev->dev);
>  
> -	dev->flags |= (uintptr_t)device_get_match_data(&pdev->dev);
> -
>  	if (pdev->dev.of_node)
>  		dw_i2c_of_configure(pdev);
>  
> -- 
> 2.26.2
> 

-- 
With Best Regards,
Andy Shevchenko


