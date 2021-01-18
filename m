Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 308CA2F9A7F
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 08:29:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731693AbhARH3d (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 02:29:33 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:54846 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731575AbhARH3c (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jan 2021 02:29:32 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 395052BB;
        Mon, 18 Jan 2021 08:28:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610954930;
        bh=Su3cmeJCvkiGuj2PUqtqE6C9sQyXxCvlY69KEZiSRYU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wg1tieb+IQUAwTxtlMHUV6XfjnMdE8JXudX+AqpM/Zfvtn3WHH43M2PF8DDpWe4lf
         be1xTmi+X8C3Acqtvh+5bD0CAgZv/TCX4u+jhqVtTeX2VpKr4N7mkdRrL/ZNhtzFCH
         y/fcQ+wTksZ2ZhtzFElD/APYP12ObRR3G3N8/jlk=
Date:   Mon, 18 Jan 2021 09:28:34 +0200
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
Subject: Re: [PATCH v2 3/7] i2c: i2c-core-base: Use format macro in
 i2c_dev_set_name()
Message-ID: <YAU4ol/X3QF2eS9/@pendragon.ideasonboard.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-4-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210118003428.568892-4-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Daniel,

Thank you for the patch.

On Mon, Jan 18, 2021 at 12:34:24AM +0000, Daniel Scally wrote:
> Some places in the kernel allow users to map resources to a device
> using device name (for example, gpiod_lookup_table). Currently
> this involves waiting for the i2c_client to have been registered so we
> can use dev_name(&client->dev). We want to add a function to allow users
> to refer to an i2c device by name before it has been instantiated, so
> create a macro for the format that's accessible outside the i2c layer
> and use it in i2c_dev_set_name()
> 
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>

I'd change the subject line to say "Add a format macro for I2C device
names", as that's the most important part of the patch. Apart from that,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

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

-- 
Regards,

Laurent Pinchart
