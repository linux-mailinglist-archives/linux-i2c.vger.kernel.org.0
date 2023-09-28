Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D768D7B1F4F
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Sep 2023 16:17:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232279AbjI1ORS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Sep 2023 10:17:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231676AbjI1ORS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Sep 2023 10:17:18 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9021119D;
        Thu, 28 Sep 2023 07:17:15 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AF0CC433C7;
        Thu, 28 Sep 2023 14:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1695910635;
        bh=9ULyKkx2zLmpPV+yHL2NJSJxdy2E5G08rOyZ7AfBxUo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iWAxAx4S952hzkPzcaPUdc0EX0g1jkPOoAU7CnLTdAL5MbgDaWlvqC6w9pP+xX5Ey
         tQ8VDQuLgOTzrx6LYHyeb8OIpZ+44+52rh87CnloWXMkdpeiC2D5gP8rdg9sljEKWD
         XeK0iOUhDNlbGAdHctz/7kpfZkDvcCO0t8uDFy80=
Date:   Thu, 28 Sep 2023 16:17:05 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Wentong Wu <wentong.wu@intel.com>
Cc:     arnd@arndb.de, mka@chromium.org, oneukum@suse.com, lee@kernel.org,
        wsa@kernel.org, kfting@nuvoton.com, broonie@kernel.org,
        linus.walleij@linaro.org, hdegoede@redhat.com, maz@kernel.org,
        brgl@bgdev.pl, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
        heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
        sakari.ailus@linux.intel.com, bartosz.golaszewski@linaro.org,
        srinivas.pandruvada@intel.com, zhifeng.wang@intel.com
Subject: Re: [PATCH v19 4/4] gpio: update Intel LJCA USB GPIO driver
Message-ID: <2023092804-cider-viscosity-03b6@gregkh>
References: <1694890416-14409-1-git-send-email-wentong.wu@intel.com>
 <1694890416-14409-5-git-send-email-wentong.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1694890416-14409-5-git-send-email-wentong.wu@intel.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sun, Sep 17, 2023 at 02:53:36AM +0800, Wentong Wu wrote:
> This driver communicate with LJCA GPIO module with specific
> protocol through interfaces exported by LJCA USB driver.
> Update the driver according to LJCA USB driver's changes.
> 
> Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Tested-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpio/Kconfig     |   4 +-
>  drivers/gpio/gpio-ljca.c | 246 +++++++++++++++++++++++++++--------------------
>  2 files changed, 145 insertions(+), 105 deletions(-)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 673bafb..8d5b6c3 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1312,9 +1312,9 @@ config GPIO_KEMPLD
>  
>  config GPIO_LJCA
>  	tristate "INTEL La Jolla Cove Adapter GPIO support"
> -	depends on MFD_LJCA
> +	depends on USB_LJCA
>  	select GPIOLIB_IRQCHIP
> -	default MFD_LJCA
> +	default USB_LJCA
>  	help
>  	  Select this option to enable GPIO driver for the INTEL
>  	  La Jolla Cove Adapter (LJCA) board.
> diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
> index 87863f0..7fae26d 100644
> --- a/drivers/gpio/gpio-ljca.c
> +++ b/drivers/gpio/gpio-ljca.c
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <linux/acpi.h>
> +#include <linux/auxiliary_bus.h>
>  #include <linux/bitfield.h>
>  #include <linux/bitops.h>
>  #include <linux/dev_printk.h>
> @@ -13,19 +14,18 @@
>  #include <linux/irq.h>
>  #include <linux/kernel.h>
>  #include <linux/kref.h>
> -#include <linux/mfd/ljca.h>
>  #include <linux/module.h>
> -#include <linux/platform_device.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> +#include <linux/usb/ljca.h>
>  
>  /* GPIO commands */
> -#define LJCA_GPIO_CONFIG	1
> -#define LJCA_GPIO_READ		2
> -#define LJCA_GPIO_WRITE		3
> -#define LJCA_GPIO_INT_EVENT	4
> -#define LJCA_GPIO_INT_MASK	5
> -#define LJCA_GPIO_INT_UNMASK	6
> +#define LJCA_GPIO_CONFIG		1
> +#define LJCA_GPIO_READ			2
> +#define LJCA_GPIO_WRITE			3
> +#define LJCA_GPIO_INT_EVENT		4
> +#define LJCA_GPIO_INT_MASK		5
> +#define LJCA_GPIO_INT_UNMASK		6

Why are you changing whitespace for no good reason?

Please don't do that, it makes finding the actual changes in this driver
impossible to notice and review.



>  
>  #define LJCA_GPIO_CONF_DISABLE		BIT(0)
>  #define LJCA_GPIO_CONF_INPUT		BIT(1)
> @@ -36,45 +36,49 @@
>  #define LJCA_GPIO_CONF_INTERRUPT	BIT(6)
>  #define LJCA_GPIO_INT_TYPE		BIT(7)
>  
> -#define LJCA_GPIO_CONF_EDGE	FIELD_PREP(LJCA_GPIO_INT_TYPE, 1)
> -#define LJCA_GPIO_CONF_LEVEL	FIELD_PREP(LJCA_GPIO_INT_TYPE, 0)
> +#define LJCA_GPIO_CONF_EDGE		FIELD_PREP(LJCA_GPIO_INT_TYPE, 1)
> +#define LJCA_GPIO_CONF_LEVEL		FIELD_PREP(LJCA_GPIO_INT_TYPE, 0)
>  
>  /* Intentional overlap with PULLUP / PULLDOWN */
> -#define LJCA_GPIO_CONF_SET	BIT(3)
> -#define LJCA_GPIO_CONF_CLR	BIT(4)
> +#define LJCA_GPIO_CONF_SET		BIT(3)
> +#define LJCA_GPIO_CONF_CLR		BIT(4)
>  
> -struct gpio_op {
> +#define LJCA_GPIO_BUF_SIZE		60u

Why "u"?  What requires that?

Odd, sorry, I know people are just getting tired of the constant churn
here, but really, you know better than making changes that are not
needed, or not documented.

greg k-h
