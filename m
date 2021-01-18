Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3152A2FA1E0
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 14:41:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404709AbhARNlJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 08:41:09 -0500
Received: from mga14.intel.com ([192.55.52.115]:20331 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404694AbhARNk4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 18 Jan 2021 08:40:56 -0500
IronPort-SDR: MyOVt8vuN2Z1r5s11nFmV9zQ6GQe0/IbQTXUcSYZgqZii5voPRJxSs7rBDV94nNNpmVqI0B67B
 L8lJUo4cFGUA==
X-IronPort-AV: E=McAfee;i="6000,8403,9867"; a="178025104"
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; 
   d="scan'208";a="178025104"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 05:38:45 -0800
IronPort-SDR: /Q+2HufiZGX3oBzf+0ER74lIk7mRRaoLxsaFsyb3FRbFv7qF1XOG6KEqn4EG99M8X4ATPlvp43
 de7X5IwY9YjA==
X-IronPort-AV: E=Sophos;i="5.79,356,1602572400"; 
   d="scan'208";a="402050586"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2021 05:38:40 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1l1Ukw-002BZm-Lq; Mon, 18 Jan 2021 15:39:42 +0200
Date:   Mon, 18 Jan 2021 15:39:42 +0200
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
Subject: Re: [PATCH v2 4/7] i2c: i2c-core-acpi: Add i2c_acpi_dev_name()
Message-ID: <20210118133942.GI4077@smile.fi.intel.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-5-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210118003428.568892-5-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jan 18, 2021 at 12:34:25AM +0000, Daniel Scally wrote:
> We want to refer to an i2c device by name before it has been

I²C

> created by the kernel; add a function that constructs the name
> from the acpi device instead.

acpi -> ACPI

Prefix: "i2c: core: "

With above
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes in v2:
> 
> 	- Stopped using devm_kasprintf()
> 
>  drivers/i2c/i2c-core-acpi.c | 16 ++++++++++++++++
>  include/linux/i2c.h         |  5 +++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/drivers/i2c/i2c-core-acpi.c b/drivers/i2c/i2c-core-acpi.c
> index 37c510d9347a..98c3ba9a2350 100644
> --- a/drivers/i2c/i2c-core-acpi.c
> +++ b/drivers/i2c/i2c-core-acpi.c
> @@ -497,6 +497,22 @@ struct i2c_client *i2c_acpi_new_device(struct device *dev, int index,
>  }
>  EXPORT_SYMBOL_GPL(i2c_acpi_new_device);
>  
> +/**
> + * i2c_acpi_dev_name - Construct i2c device name for devs sourced from ACPI
> + * @adev:     ACPI device to construct the name for
> + *
> + * Constructs the name of an i2c device matching the format used by
> + * i2c_dev_set_name() to allow users to refer to an i2c device by name even
> + * before they have been instantiated.
> + *
> + * The caller is responsible for freeing the returned pointer.
> + */
> +char *i2c_acpi_dev_name(struct acpi_device *adev)
> +{
> +	return kasprintf(GFP_KERNEL, I2C_DEV_NAME_FORMAT, acpi_dev_name(adev));
> +}
> +EXPORT_SYMBOL_GPL(i2c_acpi_dev_name);
> +
>  #ifdef CONFIG_ACPI_I2C_OPREGION
>  static int acpi_gsb_i2c_read_bytes(struct i2c_client *client,
>  		u8 cmd, u8 *data, u8 data_len)
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index 4d40a4b46810..b82aac05b17f 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -998,6 +998,7 @@ bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
>  u32 i2c_acpi_find_bus_speed(struct device *dev);
>  struct i2c_client *i2c_acpi_new_device(struct device *dev, int index,
>  				       struct i2c_board_info *info);
> +char *i2c_acpi_dev_name(struct acpi_device *adev);
>  struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle);
>  #else
>  static inline bool i2c_acpi_get_i2c_resource(struct acpi_resource *ares,
> @@ -1014,6 +1015,10 @@ static inline struct i2c_client *i2c_acpi_new_device(struct device *dev,
>  {
>  	return ERR_PTR(-ENODEV);
>  }
> +static inline char *i2c_acpi_dev_name(struct acpi_device *adev)
> +{
> +	return NULL;
> +}
>  static inline struct i2c_adapter *i2c_acpi_find_adapter_by_handle(acpi_handle handle)
>  {
>  	return NULL;
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


