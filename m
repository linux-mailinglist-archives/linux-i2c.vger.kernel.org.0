Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 696462F9CDD
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 11:36:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389364AbhARK2U (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 05:28:20 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:55760 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388571AbhARJTz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jan 2021 04:19:55 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BB0AF2BB;
        Mon, 18 Jan 2021 10:19:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610961551;
        bh=gjnQsqFgxtpSq29xrtqXIVq4Xvc9Ow3B2rHgXQ+GU3o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=lYwoQ3Lh7ouSl1TmFTMKG2c4wx3waTDRv8f10AxBqjGIpJ796ly2IOzm2fvAnYDmO
         hHwEVuJD5DngMdlfvi6mFvMcWOxI85BE53JDlzDfMPsMeAxt5r/1BoGo+k1qmj3jIP
         DPG34Im8q/Jek+X88TtBRdYDlavT/vy9MRdiHNjE=
Date:   Mon, 18 Jan 2021 11:18:55 +0200
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org,
        rjw@rjwysocki.net, lenb@kernel.org, andy@kernel.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, lee.jones@linaro.org,
        hdegoede@redhat.com, mgross@linux.intel.com,
        robert.moore@intel.com, erik.kaneda@intel.com,
        sakari.ailus@linux.intel.com, andriy.shevchenko@linux.intel.com,
        kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 4/7] i2c: i2c-core-acpi: Add i2c_acpi_dev_name()
Message-ID: <YAVSf7+iTPNYf5XS@pendragon.ideasonboard.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-5-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210118003428.568892-5-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Daniel,

Thank you for the patch.

On Mon, Jan 18, 2021 at 12:34:25AM +0000, Daniel Scally wrote:
> We want to refer to an i2c device by name before it has been

s/i2c device/acpi i2c device/ ?

> created by the kernel; add a function that constructs the name
> from the acpi device instead.
> 
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

There's a real danger of a memory leak, as the function name sounds very
similar to dev_name() or acpi_dev_name() and those don't allocate
memory. I'm not sure what a better name would be, but given that this
function is only used in patch 6/7 and not in the I2C subsystem itself,
I wonder if we should inline this kasprintf() call in the caller and
drop this patch.

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

-- 
Regards,

Laurent Pinchart
