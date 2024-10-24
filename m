Return-Path: <linux-i2c+bounces-7534-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 758B69AE15D
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 11:48:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 63A38B2151A
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 09:47:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2FCA1B6CE2;
	Thu, 24 Oct 2024 09:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Dz30bllZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6131741D9
	for <linux-i2c@vger.kernel.org>; Thu, 24 Oct 2024 09:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729763271; cv=none; b=FntaJwQAL8WDGVVxk5Te/nBj5PvkVL1ckJEp2yoZBWytpHbH1KpVUoLO2tqLXgEtGgyPKpN8Nw1reHcblK6JTAQvgi45eofwFiakcSUslNy2xx6bZghIB8lhSqHblLgbgrMZ8+b+TrQ2mIYOSKxRdt8o4FjFP41e84HSmiKkjNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729763271; c=relaxed/simple;
	bh=6oZISG8zyOtWCv3Xk/jvqSSwQW1cfD2LoGxyXi6vTwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KP5wfX1l3UsbmPfOMH47hVOauz/px0uLVMjph84itKjgrJ4gN0HqoJiwXqBM6JhgNJqlLmSedD1lfbyfNyezkjcy9Y2AfEwNZO/+sijs421rR/Z/O4ia4HXtogoqHFY2rlAUdlO+RRgOvLdy+KSgPI97TLAJ8jTxaUOWTcLc8Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Dz30bllZ; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-539f8490856so605345e87.2
        for <linux-i2c@vger.kernel.org>; Thu, 24 Oct 2024 02:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1729763267; x=1730368067; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vfv6ibufZ+CwrpcqLdBrsrQ/W9gQaceAobDNplXh7i0=;
        b=Dz30bllZ46xfmjHsyBnRQ/Hsj0atcO52eIbyzx2rrsTKJPRdTg+Ec+LbVfUZVNxdmo
         yXQeVX18Y6wTCQKdpJdZY9szhhliTd5XPJYVzEn4at4qSeRiFNDhY8qncfpaUhIt5kk0
         o4/0D2kYj+qLEZeFFFkEJRiADyXhJRJI7cr9egDEZW4FagwzO97yIrIyDcIvSxXMUuHO
         NNfdUfpyuyTSa+sRUrB9HHMWWrUx1XgQGr3wg3XgwCsXnD2c5RGVpu0OOFUonzqfr4lP
         5+MJA7IEr6GJA3e3M+y90KCqPu6HA38iOtfOtQ1pkqAK0cCp9LG0zjI2N8/ss4x9CAIw
         i6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729763267; x=1730368067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vfv6ibufZ+CwrpcqLdBrsrQ/W9gQaceAobDNplXh7i0=;
        b=h+CRhThpXf/niFOt7Vmo/5RVHsqNy1kR0yuClwWiKkxDjEbnG2CiiKEzZFVLr03lW2
         IvhU4v1eKBLC9w/Mrj2Mrj2XXD+kUI0iSkBpue43KHbsfxvw/g7jqYAopHzzq1jLV7D1
         aUW3soiIZqtVkqS24MZG9p01qTqOr1cW/cqnOn+A90n2LGPufV+eOJYOc9vM8FaevxLo
         UY1DohwZcJsZZDvXyRTTE+3+Yi/6QGGUMDVN9m698Use5fCtpsTb2GRyr4e277UWg5Nt
         ltKvSYn20iLoMvhO6MtVGWVSMTbBUVEGsQGm1pjDm9GE38dC2X5FKRqQ4zs5XLLS9Lsv
         l1TA==
X-Forwarded-Encrypted: i=1; AJvYcCVxzBBOnOHFXen7yIhkOUYi7AV37SOg6xPYgTYD3z7YFX/X6ieITR7khCFxWD5CUp9Sw5loDz3KKOI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9qHHVggJffj06AyQLkWsQLrWY6KvgVwHGa95Yd7KQWs0Csm3x
	v5g1U6cFkVQ32kPMScN4+ya4qQeXLpCma7mCfgcIdgCMWYCbsiJog2jJmdteCn6+5vdBTXXYb+m
	2MQHdwShRUR6HmBUuo6ddVmqWzmc+EFJHb0ereQ==
X-Google-Smtp-Source: AGHT+IEWBEehWTnq4Rbixjghfb8o2yvBF/xxe7NK2SwSHJgjYLywf14gzBfaH+tfcPlaC6bw5yJWICqXJ+gwpbBN2SY=
X-Received: by 2002:a05:6512:2810:b0:539:f763:789d with SMTP id
 2adb3069b0e04-53b1a36c638mr3298988e87.43.1729763266315; Thu, 24 Oct 2024
 02:47:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024085922.133071-3-tmyu0@nuvoton.com>
In-Reply-To: <20241024085922.133071-3-tmyu0@nuvoton.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Oct 2024 11:47:34 +0200
Message-ID: <CAMRc=Mc+SZN=EytxY=qA-qBEAY_F17GP-7FRE9oLojLbdUoPaQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/9] gpio: Add Nuvoton NCT6694 GPIO support
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, jic23@kernel.org, lars@metafoo.de, 
	ukleinek@kernel.org, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 24, 2024 at 10:59=E2=80=AFAM Ming Yu <a0282524688@gmail.com> wr=
ote:
>
> This driver supports GPIO and IRQ functionality for NCT6694 MFD
> device based on USB interface.
>
> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> ---
>  MAINTAINERS                 |   1 +
>  drivers/gpio/Kconfig        |  12 +
>  drivers/gpio/Makefile       |   1 +
>  drivers/gpio/gpio-nct6694.c | 489 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 503 insertions(+)
>  create mode 100644 drivers/gpio/gpio-nct6694.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 30157ca95cf3..2c86d5dab3f1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16438,6 +16438,7 @@ NUVOTON NCT6694 MFD DRIVER
>  M:     Ming Yu <tmyu0@nuvoton.com>
>  L:     linux-kernel@vger.kernel.org
>  S:     Supported
> +F:     drivers/gpio/gpio-nct6694.c
>  F:     drivers/mfd/nct6694.c
>  F:     include/linux/mfd/nct6694.h
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index d93cd4f722b4..aa78ad9ff4ac 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1450,6 +1450,18 @@ config GPIO_MAX77650
>           GPIO driver for MAX77650/77651 PMIC from Maxim Semiconductor.
>           These chips have a single pin that can be configured as GPIO.
>
> +config GPIO_NCT6694
> +       tristate "Nuvoton NCT6694 GPIO controller support"
> +       depends on MFD_NCT6694
> +       select GENERIC_IRQ_CHIP
> +       select GPIOLIB_IRQCHIP
> +       help
> +         This driver supports 8 GPIO pins per bank that can all be inter=
rupt
> +         sources.
> +
> +         This driver can also be built as a module. If so, the module wi=
ll be
> +         called gpio-nct6694.
> +
>  config GPIO_PALMAS
>         bool "TI PALMAS series PMICs GPIO"
>         depends on MFD_PALMAS
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 1429e8c0229b..02c94aa28017 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -121,6 +121,7 @@ obj-$(CONFIG_GPIO_MXC)                      +=3D gpio=
-mxc.o
>  obj-$(CONFIG_GPIO_MXS)                 +=3D gpio-mxs.o
>  obj-$(CONFIG_GPIO_NOMADIK)             +=3D gpio-nomadik.o
>  obj-$(CONFIG_GPIO_NPCM_SGPIO)          +=3D gpio-npcm-sgpio.o
> +obj-$(CONFIG_GPIO_NCT6694)             +=3D gpio-nct6694.o
>  obj-$(CONFIG_GPIO_OCTEON)              +=3D gpio-octeon.o
>  obj-$(CONFIG_GPIO_OMAP)                        +=3D gpio-omap.o
>  obj-$(CONFIG_GPIO_PALMAS)              +=3D gpio-palmas.o
> diff --git a/drivers/gpio/gpio-nct6694.c b/drivers/gpio/gpio-nct6694.c
> new file mode 100644
> index 000000000000..42c0e6e76730
> --- /dev/null
> +++ b/drivers/gpio/gpio-nct6694.c
> @@ -0,0 +1,489 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Nuvoton NCT6694 GPIO controller driver based on USB interface.
> + *
> + * Copyright (C) 2024 Nuvoton Technology Corp.
> + */
> +
> +#include <linux/gpio.h>

Don't include this header. It's documented as obsolete.

> +#include <linux/gpio/driver.h>
> +#include <linux/module.h>
> +#include <linux/interrupt.h>
> +#include <linux/platform_device.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/nct6694.h>
> +

You only use it once, drop it.

> +#define DRVNAME "nct6694-gpio"
> +
> +/* Host interface */
> +#define REQUEST_GPIO_MOD               0xFF
> +#define REQUEST_GPIO_LEN               0x01
> +
> +/* Report Channel */
> +#define GPIO_VER_REG                   0x90
> +#define GPIO_VALID_REG                 0x110
> +#define GPI_DATA_REG                   0x120
> +#define GPO_DIR_REG                    0x170
> +#define GPO_TYPE_REG                   0x180
> +#define GPO_DATA_REG                   0x190
> +
> +#define GPI_STS_REG                    0x130
> +#define GPI_CLR_REG                    0x140
> +#define GPI_FALLING_REG                        0x150
> +#define GPI_RISING_REG                 0x160
> +

Please use the NCT6694 prefix for these defines, otherwise it's not
clear whether they come from the driver or from GPIO core.

[]

> +
> +static const char * const nct6694_gpio_name[] =3D {
> +       "NCT6694-GPIO0",
> +       "NCT6694-GPIO1",
> +       "NCT6694-GPIO2",
> +       "NCT6694-GPIO3",
> +       "NCT6694-GPIO4",
> +       "NCT6694-GPIO5",
> +       "NCT6694-GPIO6",
> +       "NCT6694-GPIO7",
> +       "NCT6694-GPIO8",
> +       "NCT6694-GPIO9",
> +       "NCT6694-GPIOA",
> +       "NCT6694-GPIOB",
> +       "NCT6694-GPIOC",
> +       "NCT6694-GPIOD",
> +       "NCT6694-GPIOE",
> +       "NCT6694-GPIOF",
> +};

This looks like it corresponds with the MFD cells and makes me wonder:
am I getting that wrong or do you want to register 0xf GPIO chips? Or
a single GPIO chip with 0xf lines? What is the topology?

> +
> +static int nct6694_gpio_probe(struct platform_device *pdev)
> +{
> +       const struct mfd_cell *cell =3D mfd_get_cell(pdev);
> +       struct nct6694 *nct6694 =3D dev_get_drvdata(pdev->dev.parent);
> +       struct nct6694_gpio_data *data;
> +       struct gpio_irq_chip *girq;
> +       int ret;
> +
> +       data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       data->nct6694 =3D nct6694;
> +       data->group =3D cell->id;
> +
> +       data->gpio.label                =3D nct6694_gpio_name[cell->id];
> +       data->gpio.direction_input      =3D nct6694_direction_input;
> +       data->gpio.get                  =3D nct6694_get_value;
> +       data->gpio.direction_output     =3D nct6694_direction_output;
> +       data->gpio.set                  =3D nct6694_set_value;
> +       data->gpio.get_direction        =3D nct6694_get_direction;
> +       data->gpio.set_config           =3D nct6694_set_config;
> +       data->gpio.init_valid_mask      =3D nct6694_init_valid_mask;
> +       data->gpio.base                 =3D -1;
> +       data->gpio.can_sleep            =3D false;
> +       data->gpio.owner                =3D THIS_MODULE;
> +       data->gpio.ngpio                =3D 8;
> +
> +       INIT_WORK(&data->irq_work, nct6694_irq);
> +       INIT_WORK(&data->irq_trig_work, nct6694_irq_trig);
> +       mutex_init(&data->irq_lock);
> +
> +       ret =3D nct6694_register_handler(nct6694, GPIO_IRQ_STATUS,
> +                                      nct6694_gpio_handler, data);
> +       if (ret) {
> +               dev_err(&pdev->dev, "%s:  Failed to register handler: %pe=
\n",
> +                       __func__, ERR_PTR(ret));
> +               return ret;
> +       }
> +
> +       platform_set_drvdata(pdev, data);
> +
> +       ret =3D nct6694_get_irq_trig(data);
> +       if (ret)
> +               return ret;
> +
> +       /* Register gpio chip to GPIO framework */
> +       girq =3D &data->gpio.irq;
> +       gpio_irq_chip_set_chip(girq, &nct6694_irq_chip);
> +       girq->parent_handler =3D NULL;
> +       girq->num_parents =3D 0;
> +       girq->parents =3D NULL;
> +       girq->default_type =3D IRQ_TYPE_NONE;
> +       girq->handler =3D handle_level_irq;
> +       girq->threaded =3D true;
> +
> +       ret =3D gpiochip_add_data(&data->gpio, data);
> +       if (ret) {
> +               dev_err(&pdev->dev, "%s: Failed to register GPIO chip: %p=
e",
> +                       __func__, ERR_PTR(ret));
> +               return ret;
> +       }
> +
> +       return 0;
> +}
> +
> +static void nct6694_gpio_remove(struct platform_device *pdev)
> +{
> +       struct nct6694_gpio_data *data =3D platform_get_drvdata(pdev);
> +
> +       gpiochip_remove(&data->gpio);

This should be dropped in favor of using devm_gpiochip_add_data().
Especially since you probably want to cancel the irq_work before
removing the chip.

> +       cancel_work(&data->irq_work);
> +       cancel_work(&data->irq_trig_work);
> +}
> +
> +static struct platform_driver nct6694_gpio_driver =3D {
> +       .driver =3D {
> +               .name   =3D DRVNAME,
> +       },
> +       .probe          =3D nct6694_gpio_probe,
> +       .remove         =3D nct6694_gpio_remove,
> +};
> +
> +static int __init nct6694_init(void)
> +{
> +       int err;
> +
> +       err =3D platform_driver_register(&nct6694_gpio_driver);
> +       if (!err) {
> +               if (err)

If err is equal to 0, check if it's not equal to zero?

> +                       platform_driver_unregister(&nct6694_gpio_driver);

If platform_driver_register() failed, then the device was never registered.

> +       }
> +
> +       return err;
> +}
> +subsys_initcall(nct6694_init);

Any reason why this must be initialized earlier? It's a USB driver after al=
l.

> +
> +static void __exit nct6694_exit(void)
> +{
> +       platform_driver_unregister(&nct6694_gpio_driver);
> +}
> +module_exit(nct6694_exit);
> +
> +MODULE_DESCRIPTION("USB-GPIO controller driver for NCT6694");
> +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> +MODULE_LICENSE("GPL");
> --
> 2.34.1
>

Bart

