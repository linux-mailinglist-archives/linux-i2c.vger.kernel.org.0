Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFE8A2FA00F
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 13:40:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404140AbhARMkf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 07:40:35 -0500
Received: from mga12.intel.com ([192.55.52.136]:25171 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404134AbhARMk3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 Jan 2021 07:40:29 -0500
IronPort-SDR: MRx95v8s+VqhFX3Pd4CWSsBOzZFfoMRD7HhvjYzcbU1EV8kcS74IRS9f7KpzoC8NTlbFrHtfib
 viJT3+CymR/A==
X-IronPort-AV: E=McAfee;i="6000,8403,9867"; a="157977409"
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; 
   d="scan'208";a="157977409"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 04:38:43 -0800
IronPort-SDR: WMRsZG1MOufHvxOoZIIgcqAuj1XaPWgqLN7+7YCCwfZF8XPmtUTbFJb5X8yV9VJQ6s/PPMdjJc
 Vq/KEtLrm6Tw==
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; 
   d="scan'208";a="466359027"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 04:38:38 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l1Toq-00285s-4i; Mon, 18 Jan 2021 14:39:40 +0200
Date:   Mon, 18 Jan 2021 14:39:40 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org,
        rjw@rjwysocki.net, lenb@kernel.org, andy@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org,
        hdegoede@redhat.com, mgross@linux.intel.com,
        robert.moore@intel.com, erik.kaneda@intel.com,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 3/7] i2c: i2c-core-base: Use format macro in
 i2c_dev_set_name()
Message-ID: <20210118123940.GG4077@smile.fi.intel.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-4-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210118003428.568892-4-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 18, 2021 at 12:34:24AM +0000, Daniel Scally wrote:
> Some places in the kernel allow users to map resources to a device
> using device name (for example, gpiod_lookup_table). Currently

"...in the struct gpiod_lookup_table)." ?

> this involves waiting for the i2c_client to have been registered so we

I²C client ?

> can use dev_name(&client->dev). We want to add a function to allow users
> to refer to an i2c device by name before it has been instantiated, so

I²C device ?

> create a macro for the format that's accessible outside the i2c layer

I²C layer ?

> and use it in i2c_dev_set_name()

Period at the end.

For the record, I do not like wrapping below to 80 limit and agree with
Wolfram.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> 	- Used format macro in i2c_dev_set_name() instead of sub func
> 
>  drivers/i2c/i2c-core-base.c | 4 ++--
>  include/linux/i2c.h         | 3 +++
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 63ebf722a424..547b8926cac8 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -811,12 +811,12 @@ static void i2c_dev_set_name(struct i2c_adapter *adap,
>  	struct acpi_device *adev = ACPI_COMPANION(&client->dev);
>  
>  	if (info && info->dev_name) {
> -		dev_set_name(&client->dev, "i2c-%s", info->dev_name);
> +		dev_set_name(&client->dev, I2C_DEV_NAME_FORMAT, info->dev_name);
>  		return;
>  	}
>  
>  	if (adev) {
> -		dev_set_name(&client->dev, "i2c-%s", acpi_dev_name(adev));
> +		dev_set_name(&client->dev, I2C_DEV_NAME_FORMAT, acpi_dev_name(adev));
>  		return;
>  	}
>  
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 56622658b215..4d40a4b46810 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -39,6 +39,9 @@ enum i2c_slave_event;
>  typedef int (*i2c_slave_cb_t)(struct i2c_client *client,
>  			      enum i2c_slave_event event, u8 *val);
>  
> +/* I2C Device Name Format - to maintain consistency outside the i2c layer */
> +#define I2C_DEV_NAME_FORMAT		"i2c-%s"
> +
>  /* I2C Frequency Modes */
>  #define I2C_MAX_STANDARD_MODE_FREQ	100000
>  #define I2C_MAX_FAST_MODE_FREQ		400000
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


