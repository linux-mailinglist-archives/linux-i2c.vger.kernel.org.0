Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5505075901
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jul 2019 22:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbfGYUj0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 25 Jul 2019 16:39:26 -0400
Received: from mga14.intel.com ([192.55.52.115]:4536 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726195AbfGYUj0 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 25 Jul 2019 16:39:26 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Jul 2019 13:39:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,308,1559545200"; 
   d="scan'208";a="369320658"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga005.fm.intel.com with ESMTP; 25 Jul 2019 13:39:24 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hqkWJ-0001YW-9A; Thu, 25 Jul 2019 23:39:23 +0300
Date:   Thu, 25 Jul 2019 23:39:23 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org,
        Dominik Brodowski <linux@dominikbrodowski.net>
Subject: Re: [PATCH] i2c: designware: make use of devm_gpiod_get_optional
Message-ID: <20190725203923.GQ9224@smile.fi.intel.com>
References: <20190725202136.19423-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190725202136.19423-1-uwe@kleine-koenig.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jul 25, 2019 at 10:21:36PM +0200, Uwe Kleine-König wrote:
> There is a semantical change: if devm_gpiod_get_optional returns -ENOSYS
> this is passed as error to the caller. This effectively reverts commit
> d1fa74520dcd ("i2c: designware: Consider SCL GPIO optional") which
> shouldn't be necessary any more since gpiod_get_optional doesn't return
> -ENOSYS any more with GPIOLIB=n.

I like this!
Thanks and take mine
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> 
> Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
> ---
>  drivers/i2c/busses/i2c-designware-master.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index d464799e40a3..867787dade43 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -657,13 +657,10 @@ static int i2c_dw_init_recovery_info(struct dw_i2c_dev *dev)
>  	struct gpio_desc *gpio;
>  	int r;
>  
> -	gpio = devm_gpiod_get(dev->dev, "scl", GPIOD_OUT_HIGH);
> -	if (IS_ERR(gpio)) {
> -		r = PTR_ERR(gpio);
> -		if (r == -ENOENT || r == -ENOSYS)
> -			return 0;
> -		return r;
> -	}
> +	gpio = devm_gpiod_get_optional(dev->dev, "scl", GPIOD_OUT_HIGH);
> +	if (IS_ERR_OR_NULL(gpio))
> +		return PTR_ERR_OR_ZERO(gpio);
> +
>  	rinfo->scl_gpiod = gpio;
>  
>  	gpio = devm_gpiod_get_optional(dev->dev, "sda", GPIOD_IN);
> -- 
> 2.20.1
> 

-- 
With Best Regards,
Andy Shevchenko


