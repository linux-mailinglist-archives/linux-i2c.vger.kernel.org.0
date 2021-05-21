Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EB6238C635
	for <lists+linux-i2c@lfdr.de>; Fri, 21 May 2021 14:05:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234068AbhEUMHJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 21 May 2021 08:07:09 -0400
Received: from mga18.intel.com ([134.134.136.126]:17519 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229507AbhEUMHH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 21 May 2021 08:07:07 -0400
IronPort-SDR: uBklas3PM9l57jdxKDTbyjcLj+tnLq3CJQHGya7DZ7+AplbceUfCPEbvd5cNa5C9szZDZ+R2p6
 XYztJLVwCh/Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9990"; a="188866420"
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="188866420"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2021 05:05:44 -0700
IronPort-SDR: skltu30wB3m4YBEmmxugcZS/7efbrFzfmy7vEJWDiA5Ulgds4Dh/57hl0FKBNHSYjOP8j45TdU
 cNmQBuSDYeMA==
X-IronPort-AV: E=Sophos;i="5.82,319,1613462400"; 
   d="scan'208";a="545366534"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2021 05:05:39 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lk3uJ-00Dhdw-St; Fri, 21 May 2021 15:05:35 +0300
Date:   Fri, 21 May 2021 15:05:35 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        devel@acpica.org, Len Brown <lenb@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Russell King <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Gross <mgross@linux.intel.com>,
        Robert Moore <robert.moore@intel.com>,
        Erik Kaneda <erik.kaneda@intel.com>,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v4 6/8] gpiolib: acpi: Add acpi_gpio_get_io_resource()
Message-ID: <YKeiD8LawbyhnDZn@smile.fi.intel.com>
References: <20210520140928.3252671-1-djrscally@gmail.com>
 <20210520140928.3252671-7-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210520140928.3252671-7-djrscally@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, May 20, 2021 at 03:09:26PM +0100, Daniel Scally wrote:
> Add a function to verify that a given acpi_resource represents an IO
> type GPIO resource, and return it if so.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
> Changes since v3:
> 	- Patch introduced
> 
>  drivers/gpio/gpiolib-acpi.c | 23 +++++++++++++++++++++++
>  include/linux/acpi.h        |  7 +++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
> index 684ddb35d83b..9887bb684575 100644
> --- a/drivers/gpio/gpiolib-acpi.c
> +++ b/drivers/gpio/gpiolib-acpi.c
> @@ -196,6 +196,29 @@ bool acpi_gpio_get_irq_resource(struct acpi_resource *ares,
>  }
>  EXPORT_SYMBOL_GPL(acpi_gpio_get_irq_resource);
>  
> +/**
> + * acpi_gpio_get_io_resource - Fetch details of an ACPI resource if it is a GPIO
> + *			       I/O resource or return False if not.
> + * @ares:	Pointer to the ACPI resource to fetch
> + * @agpio:	Pointer to a &struct acpi_resource_gpio to store the output pointer
> + */
> +bool acpi_gpio_get_io_resource(struct acpi_resource *ares,
> +			       struct acpi_resource_gpio **agpio)
> +{
> +	struct acpi_resource_gpio *gpio;
> +
> +	if (ares->type != ACPI_RESOURCE_TYPE_GPIO)
> +		return false;
> +
> +	gpio = &ares->data.gpio;
> +	if (gpio->connection_type != ACPI_RESOURCE_GPIO_TYPE_IO)
> +		return false;
> +
> +	*agpio = gpio;
> +	return true;
> +}
> +EXPORT_SYMBOL_GPL(acpi_gpio_get_io_resource);
> +
>  static void acpi_gpiochip_request_irq(struct acpi_gpio_chip *acpi_gpio,
>  				      struct acpi_gpio_event *event)
>  {
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 170b9bebdb2b..e8ba7063c000 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -1098,6 +1098,8 @@ void __acpi_handle_debug(struct _ddebug *descriptor, acpi_handle handle, const c
>  #if defined(CONFIG_ACPI) && defined(CONFIG_GPIOLIB)
>  bool acpi_gpio_get_irq_resource(struct acpi_resource *ares,
>  				struct acpi_resource_gpio **agpio);
> +bool acpi_gpio_get_io_resource(struct acpi_resource *ares,
> +			       struct acpi_resource_gpio **agpio);
>  int acpi_dev_gpio_irq_get_by(struct acpi_device *adev, const char *name, int index);
>  #else
>  static inline bool acpi_gpio_get_irq_resource(struct acpi_resource *ares,
> @@ -1105,6 +1107,11 @@ static inline bool acpi_gpio_get_irq_resource(struct acpi_resource *ares,
>  {
>  	return false;
>  }
> +static inline bool acpi_gpio_get_io_resource(struct acpi_resource *ares,
> +					     struct acpi_resource_gpio **agpio)
> +{
> +	return false;
> +}
>  static inline int acpi_dev_gpio_irq_get_by(struct acpi_device *adev,
>  					   const char *name, int index)
>  {
> -- 
> 2.25.1
> 

-- 
With Best Regards,
Andy Shevchenko


