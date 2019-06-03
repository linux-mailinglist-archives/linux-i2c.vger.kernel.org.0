Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F6D532EF3
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Jun 2019 13:51:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbfFCLvI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 3 Jun 2019 07:51:08 -0400
Received: from mga12.intel.com ([192.55.52.136]:23333 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726269AbfFCLvI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 3 Jun 2019 07:51:08 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 03 Jun 2019 04:51:08 -0700
X-ExtLoop1: 1
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.157])
  by fmsmga001.fm.intel.com with SMTP; 03 Jun 2019 04:51:05 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 03 Jun 2019 14:51:04 +0300
Date:   Mon, 3 Jun 2019 14:51:04 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Peter Rosin <peda@axentia.se>, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH v2] i2c: mux/i801: Switch to use descriptor passing
Message-ID: <20190603115104.GD2781@lahna.fi.intel.com>
References: <20190530210604.25559-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190530210604.25559-1-linus.walleij@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 30, 2019 at 11:06:04PM +0200, Linus Walleij wrote:
> This switches the i801 GPIO mux to use GPIO descriptors for
> handling the GPIO lines. The previous hack which was reaching
> inside the GPIO chips etc cannot live on. We pass descriptors
> along with the GPIO mux device at creation instead.
> 
> The GPIO mux was only used by way of platform data with a
> platform device from one place in the kernel: the i801 i2c bus
> driver. Let's just associate the GPIO descriptor table with
> the actual device like everyone else and dynamically create
> a descriptor table passed along with the GPIO i2c mux.
> 
> This enables simplification of the GPIO i2c mux driver to
> use only the descriptor API and the OF probe path gets
> simplified in the process.
> 
> The i801 driver was registering the GPIO i2c mux with
> PLATFORM_DEVID_AUTO which would make it hard to predict the
> device name and assign the descriptor table properly, but
> this seems to be a mistake to begin with: all of the
> GPIO mux devices are hardcoded to look up GPIO lines from
> the "gpio_ich" GPIO chip. If there are more than one mux,
> there is certainly more than one gpio chip as well, and
> then we have more serious problems. Switch to
> PLATFORM_DEVID_NONE instead. There can be only one.
> 
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Peter Rosin <peda@axentia.se>
> Cc: Jean Delvare <jdelvare@suse.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Found some unused vars when compiling for DT, mea culpa.
> 
> Folks, you surely see what I am trying to do. Would
> appreciate help fixing any bugs (it compiles).

Heh, I think this looks good in general. I have a couple of minor
comments, though.

Also I have never used the mux part of this driver so probably can't
test this without help from someone who knows how it is supposed to
work.

> ---
>  drivers/i2c/busses/i2c-i801.c              |  31 ++++--
>  drivers/i2c/muxes/i2c-mux-gpio.c           | 113 +++++----------------
>  include/linux/platform_data/i2c-mux-gpio.h |   7 --
>  3 files changed, 53 insertions(+), 98 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 679c6c41f64b..5bf5e16df888 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -107,7 +107,7 @@
>  #include <linux/pm_runtime.h>
>  
>  #if IS_ENABLED(CONFIG_I2C_MUX_GPIO) && defined CONFIG_DMI
> -#include <linux/gpio.h>
> +#include <linux/gpio/machine.h>
>  #include <linux/platform_data/i2c-mux-gpio.h>
>  #endif
>  
> @@ -1259,6 +1259,8 @@ static int i801_add_mux(struct i801_priv *priv)
>  	const struct i801_mux_config *mux_config;
>  	struct i2c_mux_gpio_platform_data gpio_data;
>  	int err;
> +	struct gpiod_lookup_table *lookup;
> +	int i;

It looks better if you arrange these like:

  	struct i2c_mux_gpio_platform_data gpio_data;
	struct gpiod_lookup_table *lookup;
 	int err, i;

>  
>  	if (!priv->mux_drvdata)
>  		return 0;
> @@ -1270,14 +1272,31 @@ static int i801_add_mux(struct i801_priv *priv)
>  	gpio_data.values = mux_config->values;
>  	gpio_data.n_values = mux_config->n_values;
>  	gpio_data.classes = mux_config->classes;
> -	gpio_data.gpio_chip = mux_config->gpio_chip;
> -	gpio_data.gpios = mux_config->gpios;
> -	gpio_data.n_gpios = mux_config->n_gpios;
>  	gpio_data.idle = I2C_MUX_GPIO_NO_IDLE;
>  
> -	/* Register the mux device */
> +	/* Register GPIO descriptor lookup table */
> +	lookup = devm_kzalloc(dev,
> +			      struct_size(lookup, table, mux_config->n_gpios),
> +			      GFP_KERNEL);
> +	if (!lookup)
> +		return -ENOMEM;
> +	lookup->dev_id = "i2c-mux-gpio";
> +	for (i = 0; i < mux_config->n_gpios; i++) {
> +		lookup->table[i].chip_label = mux_config->gpio_chip;
> +		lookup->table[i].chip_hwnum = mux_config->gpios[i];
> +		lookup->table[i].con_id = NULL;
> +	}
> +	gpiod_add_lookup_table(lookup);

I wonder if we need to call gpiod_remove_lookup_table() in
i801_del_mux()? Also it seems to leak if the below function fails.

> +
> +	/*
> +	 * Register the mux device, we use PLATFORM_DEVID_NONE here
> +	 * because since we are referring to the GPIO chip by name we are
> +	 * anyways in deep trouble if there is more than one of these
> +	 * devices, and there should likely only be one platform controller
> +	 * hub.
> +	 */
>  	priv->mux_pdev = platform_device_register_data(dev, "i2c-mux-gpio",
> -				PLATFORM_DEVID_AUTO, &gpio_data,
> +				PLATFORM_DEVID_NONE, &gpio_data,
>  				sizeof(struct i2c_mux_gpio_platform_data));
>  	if (IS_ERR(priv->mux_pdev)) {
>  		err = PTR_ERR(priv->mux_pdev);
