Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94CB1212105
	for <lists+linux-i2c@lfdr.de>; Thu,  2 Jul 2020 12:22:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728354AbgGBKWk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Jul 2020 06:22:40 -0400
Received: from mga02.intel.com ([134.134.136.20]:28946 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727921AbgGBKWj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 2 Jul 2020 06:22:39 -0400
IronPort-SDR: dsPbSql/bl7ovclrbH0fR67Eg6Ftj9j4Ou09eoffC/yZP9NgoDHiIP0sJaA78u74TMiY+skW9a
 WTZ2LF0wb/jg==
X-IronPort-AV: E=McAfee;i="6000,8403,9669"; a="135145707"
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; 
   d="scan'208";a="135145707"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2020 03:22:37 -0700
IronPort-SDR: lmbUQJU0DJo2wuEKqO0vUMPiDNNAexulGJc+oSPgo0ui52mcoR0yMDmhg1HWous4a+zz6ERGWc
 NCI83yhGW0tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,304,1589266800"; 
   d="scan'208";a="481648277"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga006.fm.intel.com with ESMTP; 02 Jul 2020 03:22:36 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1jqwMX-00HBXS-6k; Thu, 02 Jul 2020 13:22:37 +0300
Date:   Thu, 2 Jul 2020 13:22:37 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Ricardo Ribalda <ribalda@kernel.org>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v4] i2c: designware: platdrv: Set class based on DMI
Message-ID: <20200702102237.GS3703480@smile.fi.intel.com>
References: <20200702101028.2088666-1-ribalda@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200702101028.2088666-1-ribalda@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jul 02, 2020 at 12:10:28PM +0200, Ricardo Ribalda wrote:
> Current AMD's zen-based APUs use this core for some of its i2c-buses.
> 
> With this patch we re-enable autodetection of hwmon-alike devices, so
> lm-sensors will be able to work automatically.
> 
> It does not affect the boot-time of embedded devices, as the class is
> set based on the DMI information.

Thanks for an update, my comments below. Either Wolfram (if he is okay with
that), or you can address them.

After addressing,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> DMI is probed only on Qtechnology QT5222 Industrial Camera Platform

Still missed period at the end.

> DocLink: https://qtec.com/camera-technology-camera-platforms/
> Fixes: 3eddad96c439 ("i2c: designware: reverts "i2c: designware: Add support for AMD I2C controller"")
> Signed-off-by: Ricardo Ribalda <ribalda@kernel.org>
> ---
> v2: Comments by Andy Shevchenko <andriy.shevchenko@linux.intel.com>
>   - dmi -> DMI
>   - Doclink
>   - CodeStyle
>   (I do not know what you meant by redundant in the dmi match list ...)
> 
> 
>  drivers/i2c/busses/i2c-designware-platdrv.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/busses/i2c-designware-platdrv.c
> index c2efaaaac252..630e28ef2412 100644
> --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> @@ -12,6 +12,7 @@
>  #include <linux/clk-provider.h>
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> +#include <linux/dmi.h>
>  #include <linux/err.h>
>  #include <linux/errno.h>
>  #include <linux/i2c.h>
> @@ -191,6 +192,18 @@ static int dw_i2c_plat_request_regs(struct dw_i2c_dev *dev)
>  	return ret;
>  }
>  
> +static const struct dmi_system_id dw_i2c_hwmon_class_dmi[] = {
> +	{
> +		.ident = "Qtechnology QT5222",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Qtechnology"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "QT5222"),
> +		},
> +	},

> +

Still not needed blank line.

> +	{ } /* terminate list */
> +};
> +
>  static int dw_i2c_plat_probe(struct platform_device *pdev)
>  {
>  	struct dw_i2c_platform_data *pdata = dev_get_platdata(&pdev->dev);
> @@ -267,7 +280,8 @@ static int dw_i2c_plat_probe(struct platform_device *pdev)
>  
>  	adap = &dev->adapter;
>  	adap->owner = THIS_MODULE;
> -	adap->class = I2C_CLASS_DEPRECATED;
> +	adap->class = dmi_check_system(dw_i2c_hwmon_class_dmi) ?
> +					I2C_CLASS_HWMON : I2C_CLASS_DEPRECATED;
>  	ACPI_COMPANION_SET(&adap->dev, ACPI_COMPANION(&pdev->dev));
>  	adap->dev.of_node = pdev->dev.of_node;
>  	adap->nr = -1;
> -- 
> 2.27.0
> 

-- 
With Best Regards,
Andy Shevchenko


