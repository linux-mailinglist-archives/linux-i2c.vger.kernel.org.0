Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63D0A253363
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Aug 2020 17:18:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727948AbgHZPSq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Aug 2020 11:18:46 -0400
Received: from mga04.intel.com ([192.55.52.120]:10523 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727883AbgHZPSp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 26 Aug 2020 11:18:45 -0400
IronPort-SDR: sJR3OabF68OF93kicsNQIkyGv+qfkzmTQu234eocC/w8tKCQezOxiMXFnB0pdeV+TvTmaMvvgT
 P8RPsjwpJqNQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9725"; a="153731861"
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; 
   d="scan'208";a="153731861"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2020 08:18:44 -0700
IronPort-SDR: LFOOq02faltDs2sF7gkQT/rBXsdGjaw5I+KcUpzLmZZ7XJ90mijCpdb1DfxpTxWkqP1M2jymH8
 or4UJgSKhp6Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,356,1592895600"; 
   d="scan'208";a="329260583"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 26 Aug 2020 08:18:42 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kAxA5-00BatB-CF; Wed, 26 Aug 2020 18:16:29 +0300
Date:   Wed, 26 Aug 2020 18:16:29 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Jean Delvare <jdelvare@suse.de>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: do not acpi/of match device in i2c_device_probe()
Message-ID: <20200826151629.GR1891694@smile.fi.intel.com>
References: <20200826144920.110605-1-sergey.senozhatsky@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200826144920.110605-1-sergey.senozhatsky@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 26, 2020 at 11:49:20PM +0900, Sergey Senozhatsky wrote:
> i2c, apparently, can match the same device twice - the first
> time in ->match bus hook (i2c_device_match()), and the second
> one in ->probe (i2c_device_probe()) bus hook.
> 
> To make things more complicated, the second matching does not
> do exactly same checks as the first one. Namely, i2c_device_match()
> calls acpi_driver_match_device() which considers devices that
> provide of_match_table and performs of_compatible() matching for
> such devices. One important thing to note here is that ACPI
> of_compatible() matching (acpi_of_match_device()) is part of ACPI
> and does not depend on CONFIG_OF.
> 
> i2c_device_probe(), on the other hand, calls acpi_match_device()
> which does not perform of_compatible() matching, but instead
> i2c_device_probe() relies on CONFIG_OF API to perform of_match_table
> matching, IOW ->probe matching, unlike ->match matching, depends on
> CONFIG_OF. This can break i2c device probing on !CONFIG_OF systems
> if the device does not provide .id_table.
> 
>  i2c_device_probe()
>  ...
>    if (!driver->id_table &&
>        !i2c_acpi_match_device(dev->driver->acpi_match_table, client) &&
>        !i2c_of_match_device(dev->driver->of_match_table, client)) {
>        status = -ENODEV;
>        goto put_sync_adapter;
>    }
> 
> i2c_of_match_device() on !CONFIG_OF systems is always false, so we never
> perform of_match_table matching. i2c_acpi_match_device() does ACPI match
> only, no of_compatible() matching takes place, even though the device
> provides .of_match_table and ACPI is capable of matching such device.
> 
> It is not entirely clear why the device is matched again in bus
> ->probe after successful and proper matching in bus ->match. Let's
> remove ->probe matching.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
(assuming it's okay to go)

> Signed-off-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/i2c-core-base.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 5ec082e2039d..77eea5c0bc71 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -475,17 +475,6 @@ static int i2c_device_probe(struct device *dev)
>  
>  	driver = to_i2c_driver(dev->driver);
>  
> -	/*
> -	 * An I2C ID table is not mandatory, if and only if, a suitable OF
> -	 * or ACPI ID table is supplied for the probing device.
> -	 */
> -	if (!driver->id_table &&
> -	    !acpi_driver_match_device(dev, dev->driver) &&
> -	    !i2c_of_match_device(dev->driver->of_match_table, client)) {
> -		status = -ENODEV;
> -		goto put_sync_adapter;
> -	}
> -
>  	if (client->flags & I2C_CLIENT_WAKE) {
>  		int wakeirq;
>  
> -- 
> 2.28.0
> 

-- 
With Best Regards,
Andy Shevchenko


