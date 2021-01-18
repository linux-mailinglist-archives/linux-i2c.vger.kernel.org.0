Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5D352F9AA6
	for <lists+linux-i2c@lfdr.de>; Mon, 18 Jan 2021 08:38:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732703AbhARHik (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 18 Jan 2021 02:38:40 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:54932 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbhARHii (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 18 Jan 2021 02:38:38 -0500
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4A3AB2BB;
        Mon, 18 Jan 2021 08:37:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1610955476;
        bh=zgto1uNnvZ2GpO37f5o+w/xXmKyI+iSAGEN7OiEiaTg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=acCJ589txn50jkAr3fEASXMMzRmaZIz1oP5tPfDocMDArWr5uuIvsW/mM2T7l0oBK
         bE37I4w3alC0Zl5oS60W/sy6ImOYwbazQDV3bKTlUeeu9eOX1xKO5RjZAdsCiffrdf
         LJBngh/Psk0bcPTc+ezuVxjTaHg8YsYhnKVdhE3c=
Date:   Mon, 18 Jan 2021 09:37:40 +0200
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
Subject: Re: [PATCH v2 5/7] gpio: gpiolib-acpi: Export acpi_get_gpiod()
Message-ID: <YAU6xCZq8mRkRm6U@pendragon.ideasonboard.com>
References: <20210118003428.568892-1-djrscally@gmail.com>
 <20210118003428.568892-6-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210118003428.568892-6-djrscally@gmail.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Daniel,

Thank you for the patch.

On Mon, Jan 18, 2021 at 12:34:26AM +0000, Daniel Scally wrote:
> I need to be able to translate GPIO resources in an acpi_device's _CRS
> into gpio_descs. Those are represented in _CRS as a pathname to a GPIO
> device plus the pin's index number: this function is perfect for that
> purpose.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes in v2:
> 
> 	-None
> 
>  drivers/gpio/gpiolib-acpi.c | 3 ++-
>  include/linux/acpi.h        | 5 +++++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
> index e37a57d0a2f0..83f9f85cd0ab 100644
> --- a/drivers/gpio/gpiolib-acpi.c
> +++ b/drivers/gpio/gpiolib-acpi.c
> @@ -111,7 +111,7 @@ static int acpi_gpiochip_find(struct gpio_chip *gc, void *data)
>   * controller does not have GPIO chip registered at the moment. This is to
>   * support probe deferral.
>   */
> -static struct gpio_desc *acpi_get_gpiod(char *path, int pin)
> +struct gpio_desc *acpi_get_gpiod(char *path, int pin)
>  {
>  	struct gpio_chip *chip;
>  	acpi_handle handle;
> @@ -127,6 +127,7 @@ static struct gpio_desc *acpi_get_gpiod(char *path, int pin)
>  
>  	return gpiochip_get_desc(chip, pin);
>  }
> +EXPORT_SYMBOL_GPL(acpi_get_gpiod);
>  
>  static irqreturn_t acpi_gpio_irq_handler(int irq, void *data)
>  {
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 2630c2e953f7..5cd272326eb7 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -1066,6 +1066,7 @@ void __acpi_handle_debug(struct _ddebug *descriptor, acpi_handle handle, const c
>  bool acpi_gpio_get_irq_resource(struct acpi_resource *ares,
>  				struct acpi_resource_gpio **agpio);
>  int acpi_dev_gpio_irq_get(struct acpi_device *adev, int index);
> +struct gpio_desc *acpi_get_gpiod(char *path, int pin);
>  #else
>  static inline bool acpi_gpio_get_irq_resource(struct acpi_resource *ares,
>  					      struct acpi_resource_gpio **agpio)
> @@ -1076,6 +1077,10 @@ static inline int acpi_dev_gpio_irq_get(struct acpi_device *adev, int index)
>  {
>  	return -ENXIO;
>  }
> +struct gpio_desc *acpi_get_gpiod(char *path, int pin)
> +{
> +	return NULL;
> +}
>  #endif
>  
>  /* Device properties */

-- 
Regards,

Laurent Pinchart
