Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18DA039B954
	for <lists+linux-i2c@lfdr.de>; Fri,  4 Jun 2021 15:00:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbhFDNBu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 4 Jun 2021 09:01:50 -0400
Received: from mga09.intel.com ([134.134.136.24]:2251 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230004AbhFDNBt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 4 Jun 2021 09:01:49 -0400
IronPort-SDR: dxEaBNlq/GraAQ0w88gtMxbv0XmJeHKq/OScZamIV3AGQZ8KmdaMHHr5S43lcWcKOpi2m4cO4e
 0xpupnv3FKnQ==
X-IronPort-AV: E=McAfee;i="6200,9189,10004"; a="204262151"
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; 
   d="scan'208";a="204262151"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2021 06:00:01 -0700
IronPort-SDR: PepRvi61ClRrtWbdje6TMu8DIx4w/IYZ2HzVULGz6JGViajMkEJ8nFDoDeG6SQ3oRFBUjnif/K
 1Nfn43rfnjHg==
X-IronPort-AV: E=Sophos;i="5.83,248,1616482800"; 
   d="scan'208";a="551153872"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2021 05:59:57 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lp9QY-00HE3g-Ej; Fri, 04 Jun 2021 15:59:54 +0300
Date:   Fri, 4 Jun 2021 15:59:54 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, devel@acpica.org,
        Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Wolfram Sang <wsa@kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v5 3/6] gpiolib: acpi: Export acpi_get_gpiod()
Message-ID: <YLojymirRB5HpFQY@smile.fi.intel.com>
References: <20210603224007.120560-1-djrscally@gmail.com>
 <20210603224007.120560-4-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210603224007.120560-4-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Jun 03, 2021 at 11:40:04PM +0100, Daniel Scally wrote:
> We need to be able to translate GPIO resources in an ACPI device's _CRS
> into GPIO descriptor array. Those are represented in _CRS as a pathname
> to a GPIO device plus the pin's index number: the acpi_get_gpiod()
> function is perfect for that purpose.
> 
> As it's currently only used internally within the GPIO layer, provide and
> export a wrapper function that additionally holds a reference to the GPIO
> device.

The subject is wrong, it should be "Introduce acpi_get_and_request_gpiod()
helper" or so. I can fix when applying.

Btw, do I understand correctly that I may push GPIO ACPI patches independently
(of the ACPI changes)?

> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes since v4:
> 	- None
> 
>  drivers/gpio/gpiolib-acpi.c   | 28 ++++++++++++++++++++++++++++
>  include/linux/gpio/consumer.h |  2 ++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
> index 5b4111e4be3f..684ddb35d83b 100644
> --- a/drivers/gpio/gpiolib-acpi.c
> +++ b/drivers/gpio/gpiolib-acpi.c
> @@ -128,6 +128,34 @@ static struct gpio_desc *acpi_get_gpiod(char *path, int pin)
>  	return gpiochip_get_desc(chip, pin);
>  }
>  
> +/**
> + * acpi_get_and_request_gpiod() - Translate ACPI GPIO pin to GPIO descriptor
> + *                               and hold a refcount to the GPIO device.
> + * @path:      ACPI GPIO controller full path name, (e.g. "\\_SB.GPO1")
> + * @pin:       ACPI GPIO pin number (0-based, controller-relative)
> + * @label:     Label to pass to gpiod_request()
> + *
> + * This function is a simple pass-through to acpi_get_gpiod(), except that
> + * as it is intended for use outside of the GPIO layer (in a similar fashion to
> + * gpiod_get_index() for example) it also holds a reference to the GPIO device.
> + */
> +struct gpio_desc *acpi_get_and_request_gpiod(char *path, int pin, char *label)
> +{
> +	struct gpio_desc *gpio;
> +	int ret;
> +
> +	gpio = acpi_get_gpiod(path, pin);
> +	if (IS_ERR(gpio))
> +		return gpio;
> +
> +	ret = gpiod_request(gpio, label);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	return gpio;
> +}
> +EXPORT_SYMBOL_GPL(acpi_get_and_request_gpiod);
> +
>  static irqreturn_t acpi_gpio_irq_handler(int irq, void *data)
>  {
>  	struct acpi_gpio_event *event = data;
> diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
> index c73b25bc9213..566feb56601f 100644
> --- a/include/linux/gpio/consumer.h
> +++ b/include/linux/gpio/consumer.h
> @@ -692,6 +692,8 @@ int devm_acpi_dev_add_driver_gpios(struct device *dev,
>  				   const struct acpi_gpio_mapping *gpios);
>  void devm_acpi_dev_remove_driver_gpios(struct device *dev);
>  
> +struct gpio_desc *acpi_get_and_request_gpiod(char *path, int pin, char *label);
> +
>  #else  /* CONFIG_GPIOLIB && CONFIG_ACPI */
>  
>  struct acpi_device;
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


