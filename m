Return-Path: <linux-i2c+bounces-3621-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FFA8CC418
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2024 17:31:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 162FF283ADA
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2024 15:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1F567D3F6;
	Wed, 22 May 2024 15:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1K9lEPi8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0E523BE
	for <linux-i2c@vger.kernel.org>; Wed, 22 May 2024 15:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716391876; cv=none; b=dkKK7BcFOQQsSqN5L9drxAlyHaQk91FvW4prSOOjlT9VQ1jB4Ws5Ts32IUKxiEvfzWAnzimUHeRhs12Edo1DSECsynbq/UbKMgRvtwIX5GAH4dTZgWDVGSKE+GCQ9e1DjdoLBJpmPgj5JVnI0DcRITqQ4UVNBNJ8t5XEQHE8sqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716391876; c=relaxed/simple;
	bh=PU+YmqLzYETGJGFn79c2Z1loJZLiyZP5IYZLO9nGQ9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lS5ViqvYVUPqhnPdADaUuENLZpswgUPC6pmhv8wW+uzGN6aL02ySTZAX87a2kdza7uwz/r1qUwQudqe+gZ8apO5jZRk9OXrG1Uc5oNYDCZ9vK1UxIKKat+QNM9QAb2efbxr1FjN68kix3v2OkgPGC9yXWJvmzpis0djYPCO+BAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1K9lEPi8; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51f0602bc58so1158882e87.0
        for <linux-i2c@vger.kernel.org>; Wed, 22 May 2024 08:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716391873; x=1716996673; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=slutjm6zgaahZUqfw+b5wQ2HxWFn7emeiKG+nANla5Q=;
        b=1K9lEPi8DI7PH9E8alLQkG1O9n9RA8AYqYH/Tc+TQoi5ZP4Yn5VOv1Moi1lwWzjKDz
         zpEdcRNZm3XC80HP3g/yGZmF4MeqB4JXioTrTWJsIi5irgX0sBNJXH6kJyHy6qvUN3Yj
         QShli/Xt27t9dP3djptcWf0pTKCxkPUqbTDcqVv64B5B/v9nS/m2X1Z6BPHXEMpP7kN0
         GFw4s6KXC5Cy7O/MF/ysJ6CA0Ub1pMf+eJVi2Up5+1f5HGe6Zk9yocx94cyJoWrsbgMP
         HWkA+fAoc0a6jjc3eKEvKgQUHaG99lDebmDCQL4hh1+OoGPK9WTcy0I6/qX/EIv6FwxZ
         rJgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716391873; x=1716996673;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=slutjm6zgaahZUqfw+b5wQ2HxWFn7emeiKG+nANla5Q=;
        b=PCCIHRswersnzIC3t5nQNdqTlOfrjBZTz6Qz5PYGd7OUEDRvfifhEsfQthkjNGIMrL
         ZsVI3ChtqyKQ8i62kdYX9AImfgqnmBjICznkUO1SvUYu1bezlv74oufHtCs4mdpIr851
         85EiGD3jLPsQrFPSGDcnfJVBL7WhaQrYsncDcA7Aq19le915oeJRDbYvIUJGR9IPn2/h
         hYAVqcAY1U2fKwWwBlcowdK+6GhkGGTl71ETWQead2UfLjudnyXvy/rTPwkkkwH2m5ev
         k2ixD/L7AZRoo9xjFfL4ijrIDfgS04S+ga9TCdEhiRIiEJSqf3dxdtvSN1YuP4JYRqxe
         gMmA==
X-Forwarded-Encrypted: i=1; AJvYcCVOYhQ6L8P42mJ2+bK8kh6QVOWMCvZ+jXzAMEqCC+4+p7atvaN7TnzrAsLlQBp4me529V3Q04pJdgh1jpnyHyLrji80datA3L/R
X-Gm-Message-State: AOJu0YzbFViW0OXuO2T+QCvK24jHInqsvoLf4BYAxXYvk8oV99vwPm6D
	5R6kN1jNHEphj3jSZikvhZ4CWhAGECnUNMRME5jCjJ0l5MHlqQ5lQmBO+x99SeoPdjlfTa6pWh0
	0UMzF7gU/GxrRTk3mTI2NpmznnklWLKLV3KVVgg==
X-Google-Smtp-Source: AGHT+IF3Aai/pUFT0+rTo97oCUzgfRD+nH/WiVrbppq97Ck6FW+mMJMeOM7cvgHbVEroR2GoIURrnVTKnxaLx8n2E9g=
X-Received: by 2002:ac2:5f58:0:b0:522:33ff:af94 with SMTP id
 2adb3069b0e04-52407ac0e31mr3248959e87.18.1716391872396; Wed, 22 May 2024
 08:31:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240517-a2b-v1-0-b8647554c67b@bang-olufsen.dk> <20240517-a2b-v1-6-b8647554c67b@bang-olufsen.dk>
In-Reply-To: <20240517-a2b-v1-6-b8647554c67b@bang-olufsen.dk>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 May 2024 17:31:01 +0200
Message-ID: <CAMRc=MfCLpYSs+0+ACsvfQvRnC+zLf36njYFVfU1pykiR3LcWw@mail.gmail.com>
Subject: Re: [PATCH 06/13] gpio: add AD24xx GPIO driver
To: =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alvin@pqrs.dk>
Cc: Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>, Saravana Kannan <saravanak@google.com>, 
	Emil Svendsen <emas@bang-olufsen.dk>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2024 at 2:58=E2=80=AFPM Alvin =C5=A0ipraga <alvin@pqrs.dk> =
wrote:
>
> From: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
>
> This driver adds GPIO function support for AD24xx A2B transceiver chips.
> When a GPIO is requested, the relevant pin is automatically muxed to
> GPIO mode. The device tree property gpio-reserved-ranges can be used to
> protect certain pins which are reserved for other functionality such as
> I2S/TDM data.
>
> Signed-off-by: Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
> ---
>  drivers/a2b/Kconfig        |   1 +
>  drivers/gpio/Kconfig       |   6 +
>  drivers/gpio/Makefile      |   1 +
>  drivers/gpio/gpio-ad24xx.c | 302 +++++++++++++++++++++++++++++++++++++++=
++++++
>  4 files changed, 310 insertions(+)
>
> diff --git a/drivers/a2b/Kconfig b/drivers/a2b/Kconfig
> index 1f6d836463f3..8c894579e2fc 100644
> --- a/drivers/a2b/Kconfig
> +++ b/drivers/a2b/Kconfig
> @@ -32,6 +32,7 @@ config A2B_AD24XX_I2C
>  config A2B_AD24XX_NODE
>         tristate "Analog Devices Inc. AD24xx node support"
>         select REGMAP_A2B
> +       imply GPIO_AD24XX
>         help
>           Say Y here to enable support for AD24xx A2B transceiver nodes. =
This
>           applies to both main nodes and subordinate nodes. Supported mod=
els
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 3dbddec07028..72bd0d88d6b3 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1241,6 +1241,12 @@ config GPIO_ALTERA_A10SR
>           includes reads of pushbuttons and DIP switches as well
>           as writes to LEDs.
>
> +config GPIO_AD24XX
> +       tristate "Analog Devies Inc. AD24xx GPIO support"
> +       depends on A2B_AD24XX_NODE
> +       help
> +         Say Y here to enable GPIO support for AD24xx A2B transceivers.
> +
>  config GPIO_ARIZONA
>         tristate "Wolfson Microelectronics Arizona class devices"
>         depends on MFD_ARIZONA
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index e2a53013780e..f625bb140143 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -24,6 +24,7 @@ obj-$(CONFIG_GPIO_104_IDI_48)         +=3D gpio-104-idi=
-48.o
>  obj-$(CONFIG_GPIO_104_IDIO_16)         +=3D gpio-104-idio-16.o
>  obj-$(CONFIG_GPIO_74X164)              +=3D gpio-74x164.o
>  obj-$(CONFIG_GPIO_74XX_MMIO)           +=3D gpio-74xx-mmio.o
> +obj-$(CONFIG_GPIO_AD24XX)              +=3D gpio-ad24xx.o
>  obj-$(CONFIG_GPIO_ADNP)                        +=3D gpio-adnp.o
>  obj-$(CONFIG_GPIO_ADP5520)             +=3D gpio-adp5520.o
>  obj-$(CONFIG_GPIO_AGGREGATOR)          +=3D gpio-aggregator.o
> diff --git a/drivers/gpio/gpio-ad24xx.c b/drivers/gpio/gpio-ad24xx.c
> new file mode 100644
> index 000000000000..097ea9e2d629
> --- /dev/null
> +++ b/drivers/gpio/gpio-ad24xx.c
> @@ -0,0 +1,302 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * AD24xx GPIO driver
> + *
> + * Copyright (c) 2023-2024 Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>
> + */
> +
> +#include <linux/a2b/a2b.h>
> +#include <linux/a2b/ad24xx.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/of_irq.h>
> +#include <linux/regmap.h>
> +
> +struct ad24xx_gpio {
> +       struct device *dev;

You only use this once to emit a log message. You should probably drop
it and use the parent pointer in gpio_chip.

Otherwise looks pretty good to me.

With the above addressed:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Bart

> +       struct a2b_func *func;
> +       struct a2b_node *node;
> +       struct regmap *regmap;
> +       int irqs[AD24XX_MAX_GPIOS];
> +       struct gpio_chip gpio_chip;
> +       struct irq_chip irq_chip;
> +       struct mutex mutex;
> +       unsigned int irq_invert : AD24XX_MAX_GPIOS;
> +       unsigned int irq_enable : AD24XX_MAX_GPIOS;
> +};
> +
> +static int ad24xx_gpio_get_direction(struct gpio_chip *gc, unsigned int =
offset)
> +{
> +       struct ad24xx_gpio *adg =3D gpiochip_get_data(gc);
> +       unsigned int val;
> +       int ret;
> +
> +       ret =3D regmap_read(adg->regmap, A2B_GPIOOEN, &val);
> +       if (ret)
> +               return ret;
> +
> +       if (val & BIT(offset))
> +               return 0; /* output */
> +
> +       return 1; /* input */
> +}
> +
> +static int ad24xx_gpio_get(struct gpio_chip *gc, unsigned int offset)
> +{
> +       struct ad24xx_gpio *adg =3D gpiochip_get_data(gc);
> +       unsigned int val;
> +       int ret;
> +
> +       ret =3D regmap_read(adg->regmap, A2B_GPIOIN, &val);
> +       if (ret)
> +               return ret;
> +
> +       if (val & BIT(offset))
> +               return 1; /* high */
> +
> +       return 0; /* low */
> +}
> +
> +static void ad24xx_gpio_set(struct gpio_chip *gc, unsigned int offset,
> +                           int value)
> +{
> +       struct ad24xx_gpio *adg =3D gpiochip_get_data(gc);
> +       unsigned int reg =3D value ? A2B_GPIODATSET : A2B_GPIODATCLR;
> +
> +       regmap_write(adg->regmap, reg, BIT(offset));
> +}
> +
> +static int ad24xx_gpio_set_direction(struct ad24xx_gpio *adg,
> +                                    unsigned int offset,
> +                                    unsigned int direction)
> +{
> +       unsigned int mask =3D BIT(offset);
> +       unsigned int ival =3D direction ? BIT(offset) : 0;
> +       int ret;
> +
> +       ret =3D regmap_update_bits(adg->regmap, A2B_GPIOIEN, mask, ival);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D regmap_update_bits(adg->regmap, A2B_GPIOOEN, mask, ~ival)=
;
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static int ad24xx_gpio_direction_input(struct gpio_chip *gc,
> +                                      unsigned int offset)
> +{
> +       struct ad24xx_gpio *adg =3D gpiochip_get_data(gc);
> +
> +       return ad24xx_gpio_set_direction(adg, offset, 1);
> +}
> +
> +static int ad24xx_gpio_direction_output(struct gpio_chip *gc,
> +                                       unsigned int offset, int value)
> +{
> +       struct ad24xx_gpio *adg =3D gpiochip_get_data(gc);
> +
> +       /* For atomicity, write the output value before setting the direc=
tion */
> +       ad24xx_gpio_set(gc, offset, value);
> +
> +       return ad24xx_gpio_set_direction(adg, offset, 0);
> +}
> +
> +static int ad24xx_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
> +                                            unsigned int child,
> +                                            unsigned int child_type,
> +                                            unsigned int *parent,
> +                                            unsigned int *parent_type)
> +{
> +       *parent =3D child;
> +       return 0;
> +}
> +
> +static void ad24xx_gpio_irq_mask(struct irq_data *d)
> +{
> +       struct gpio_chip *gpio_chip =3D irq_data_get_irq_chip_data(d);
> +       struct ad24xx_gpio *adg =3D gpiochip_get_data(gpio_chip);
> +       irq_hw_number_t hwirq =3D irqd_to_hwirq(d);
> +
> +       adg->irq_enable &=3D ~BIT(hwirq);
> +       gpiochip_disable_irq(gpio_chip, hwirq);
> +}
> +
> +static void ad24xx_gpio_irq_unmask(struct irq_data *d)
> +{
> +       struct gpio_chip *gpio_chip =3D irq_data_get_irq_chip_data(d);
> +       struct ad24xx_gpio *adg =3D gpiochip_get_data(gpio_chip);
> +       irq_hw_number_t hwirq =3D irqd_to_hwirq(d);
> +
> +       gpiochip_disable_irq(gpio_chip, hwirq);
> +       adg->irq_enable |=3D BIT(hwirq);
> +}
> +
> +static int ad24xx_gpio_irq_set_type(struct irq_data *d, unsigned int typ=
e)
> +{
> +       struct gpio_chip *gpio_chip =3D irq_data_get_irq_chip_data(d);
> +       struct ad24xx_gpio *adg =3D gpiochip_get_data(gpio_chip);
> +       irq_hw_number_t hwirq =3D irqd_to_hwirq(d);
> +
> +       switch (type) {
> +       case IRQ_TYPE_EDGE_RISING:
> +               adg->irq_invert &=3D ~BIT(hwirq);
> +               break;
> +       case IRQ_TYPE_EDGE_FALLING:
> +               adg->irq_invert |=3D BIT(hwirq);
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static void ad24xx_gpio_irq_bus_lock(struct irq_data *d)
> +{
> +       struct gpio_chip *gpio_chip =3D irq_data_get_irq_chip_data(d);
> +       struct ad24xx_gpio *adg =3D gpiochip_get_data(gpio_chip);
> +
> +       mutex_lock(&adg->mutex);
> +}
> +
> +static void ad24xx_gpio_irq_bus_sync_unlock(struct irq_data *d)
> +{
> +       struct gpio_chip *gpio_chip =3D irq_data_get_irq_chip_data(d);
> +       struct ad24xx_gpio *adg =3D gpiochip_get_data(gpio_chip);
> +       int ret;
> +
> +       ret =3D regmap_write(adg->regmap, A2B_PINTINV, adg->irq_invert);
> +       if (ret)
> +               goto out;
> +
> +       ret =3D regmap_write(adg->regmap, A2B_PINTEN, adg->irq_enable);
> +       if (ret)
> +               goto out;
> +
> +out:
> +       mutex_unlock(&adg->mutex);
> +
> +       if (ret)
> +               dev_err(adg->dev,
> +                       "failed to update interrupt configuration: %d\n",=
 ret);
> +}
> +
> +static const struct irq_chip ad24xx_gpio_irq_chip =3D {
> +       .name =3D "ad24xx-gpio",
> +       .flags =3D IRQCHIP_IMMUTABLE,
> +       .irq_mask =3D ad24xx_gpio_irq_mask,
> +       .irq_unmask =3D ad24xx_gpio_irq_unmask,
> +       .irq_set_type =3D ad24xx_gpio_irq_set_type,
> +       .irq_bus_lock =3D ad24xx_gpio_irq_bus_lock,
> +       .irq_bus_sync_unlock =3D ad24xx_gpio_irq_bus_sync_unlock,
> +       GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};
> +
> +static const struct regmap_config ad24xx_gpio_regmap_config =3D {
> +       .reg_bits =3D 8,
> +       .val_bits =3D 8,
> +};
> +
> +static int ad24xx_gpio_probe(struct device *dev)
> +{
> +       struct a2b_func *func =3D to_a2b_func(dev);
> +       struct a2b_node *node =3D func->node;
> +       struct fwnode_handle *fwnode =3D of_node_to_fwnode(dev->of_node);
> +       struct gpio_chip *gpio_chip;
> +       struct gpio_irq_chip *irq_chip;
> +       struct irq_domain *parent_domain;
> +       struct ad24xx_gpio *adg;
> +       struct device_node *np;
> +       int ret;
> +
> +       adg =3D devm_kzalloc(dev, sizeof(*adg), GFP_KERNEL);
> +       if (!adg)
> +               return -ENOMEM;
> +
> +       adg->regmap =3D
> +               devm_regmap_init_a2b_func(func, &ad24xx_gpio_regmap_confi=
g);
> +       if (IS_ERR(adg->regmap))
> +               return PTR_ERR(adg->regmap);
> +
> +       adg->dev =3D dev;
> +       adg->func =3D func;
> +       adg->node =3D node;
> +       mutex_init(&adg->mutex);
> +
> +       np =3D of_irq_find_parent(dev->of_node);
> +       if (!np)
> +               return -ENOENT;
> +
> +       parent_domain =3D irq_find_host(np);
> +       of_node_put(np);
> +       if (!parent_domain)
> +               return -ENOENT;
> +
> +       gpio_chip =3D &adg->gpio_chip;
> +       gpio_chip->label =3D dev_name(dev);
> +       gpio_chip->parent =3D dev;
> +       gpio_chip->fwnode =3D fwnode;
> +       gpio_chip->owner =3D THIS_MODULE;
> +       gpio_chip->get_direction =3D ad24xx_gpio_get_direction;
> +       gpio_chip->direction_input =3D ad24xx_gpio_direction_input;
> +       gpio_chip->direction_output =3D ad24xx_gpio_direction_output;
> +       gpio_chip->get =3D ad24xx_gpio_get;
> +       gpio_chip->set =3D ad24xx_gpio_set;
> +       gpio_chip->base =3D -1;
> +       gpio_chip->ngpio =3D node->chip_info->max_gpios;
> +       gpio_chip->can_sleep =3D true;
> +
> +       irq_chip =3D &gpio_chip->irq;
> +       gpio_irq_chip_set_chip(irq_chip, &ad24xx_gpio_irq_chip);
> +       irq_chip->fwnode =3D fwnode;
> +       irq_chip->parent_domain =3D parent_domain;
> +       irq_chip->child_to_parent_hwirq =3D ad24xx_gpio_child_to_parent_h=
wirq;
> +       irq_chip->handler =3D handle_bad_irq;
> +       irq_chip->default_type =3D IRQ_TYPE_NONE;
> +
> +       /* Initialize all GPIOs as inputs for high impedance state */
> +       ret =3D regmap_write(adg->regmap, A2B_GPIOIEN, 0xFF);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D devm_gpiochip_add_data(dev, gpio_chip, adg);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +static const struct of_device_id ad24xx_gpio_of_match_table[] =3D {
> +       { .compatible =3D "adi,ad2401-gpio" },
> +       { .compatible =3D "adi,ad2402-gpio" },
> +       { .compatible =3D "adi,ad2403-gpio" },
> +       { .compatible =3D "adi,ad2410-gpio" },
> +       { .compatible =3D "adi,ad2420-gpio" },
> +       { .compatible =3D "adi,ad2421-gpio" },
> +       { .compatible =3D "adi,ad2422-gpio" },
> +       { .compatible =3D "adi,ad2425-gpio" },
> +       { .compatible =3D "adi,ad2426-gpio" },
> +       { .compatible =3D "adi,ad2427-gpio" },
> +       { .compatible =3D "adi,ad2428-gpio" },
> +       { .compatible =3D "adi,ad2429-gpio" },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, ad24xx_gpio_of_match_table);
> +
> +static struct a2b_driver ad24xx_gpio_driver =3D {
> +       .driver =3D {
> +               .name =3D "ad24xx-gpio",
> +               .of_match_table =3D ad24xx_gpio_of_match_table,
> +               .probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +       },
> +       .probe =3D ad24xx_gpio_probe,
> +};
> +module_a2b_driver(ad24xx_gpio_driver);
> +
> +MODULE_AUTHOR("Alvin =C5=A0ipraga <alsi@bang-olufsen.dk>");
> +MODULE_DESCRIPTION("AD24xx GPIO driver");
> +MODULE_LICENSE("GPL");
>
> --
> 2.44.0
>

