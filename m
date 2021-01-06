Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E20172EC0D5
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Jan 2021 17:04:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbhAFQEQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 Jan 2021 11:04:16 -0500
Received: from mx2.suse.de ([195.135.220.15]:38510 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726589AbhAFQEP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 Jan 2021 11:04:15 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 34134AD8C;
        Wed,  6 Jan 2021 16:03:34 +0000 (UTC)
Date:   Wed, 6 Jan 2021 17:03:33 +0100
From:   Jean Delvare <jdelvare@suse.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v1 3/3] i2c: i801: Refactor mux code since
 platform_device_unregister() is NULL aware
Message-ID: <20210106170333.2c90a7c3@endymion>
In-Reply-To: <20201228200618.58716-3-andriy.shevchenko@linux.intel.com>
References: <20201228200618.58716-1-andriy.shevchenko@linux.intel.com>
        <20201228200618.58716-3-andriy.shevchenko@linux.intel.com>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, 28 Dec 2020 22:06:18 +0200, Andy Shevchenko wrote:
> platform_device_unregister() is NULL-aware and thus doesn't required a
> duplication check in i801_del_mux(). Besides that it's also error pointer
> aware, and we may drop unneeded assignment in i801_add_mux() followed by
> conversion to PTR_ERR_OR_ZERO() for the returned value.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/i2c/busses/i2c-i801.c | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-i801.c b/drivers/i2c/busses/i2c-i801.c
> index 7c2569a18f8c..1400a8716388 100644
> --- a/drivers/i2c/busses/i2c-i801.c
> +++ b/drivers/i2c/busses/i2c-i801.c
> @@ -1433,7 +1433,7 @@ static int i801_add_mux(struct i801_priv *priv)
>  	const struct i801_mux_config *mux_config;
>  	struct i2c_mux_gpio_platform_data gpio_data;
>  	struct gpiod_lookup_table *lookup;
> -	int err, i;
> +	int i;
>  
>  	if (!priv->mux_drvdata)
>  		return 0;
> @@ -1473,20 +1473,16 @@ static int i801_add_mux(struct i801_priv *priv)
>  				PLATFORM_DEVID_NONE, &gpio_data,
>  				sizeof(struct i2c_mux_gpio_platform_data));
>  	if (IS_ERR(priv->mux_pdev)) {
> -		err = PTR_ERR(priv->mux_pdev);
>  		gpiod_remove_lookup_table(lookup);
> -		priv->mux_pdev = NULL;
>  		dev_err(dev, "Failed to register i2c-mux-gpio device\n");
> -		return err;
>  	}
>  
> -	return 0;
> +	return PTR_ERR_OR_ZERO(priv->mux_pdev);
>  }
>  
>  static void i801_del_mux(struct i801_priv *priv)
>  {
> -	if (priv->mux_pdev)
> -		platform_device_unregister(priv->mux_pdev);
> +	platform_device_unregister(priv->mux_pdev);
>  	gpiod_remove_lookup_table(priv->lookup);
>  }
>  

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
