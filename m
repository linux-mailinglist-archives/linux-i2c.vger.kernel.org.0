Return-Path: <linux-i2c+bounces-8111-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FBE19D48D5
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 09:28:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C62571F228E3
	for <lists+linux-i2c@lfdr.de>; Thu, 21 Nov 2024 08:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 998321CC884;
	Thu, 21 Nov 2024 08:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RYZfdrQK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92231CB53D
	for <linux-i2c@vger.kernel.org>; Thu, 21 Nov 2024 08:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732177711; cv=none; b=tKnFtHnEYka7Flg0l332dsaGl0sIIb6elv114ZBcxCwVg1ew2venHVsGez+xmtptmlTvk9bE+PAeHXbp8z7DmQvxSQ/6AKOkBOkFPXMl4gnXRwFhM4ItVCs+/aSOYHlwElra3pxAP64oviaU+rwjLfT9I8R70scoKjysEvkW5ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732177711; c=relaxed/simple;
	bh=r9jnD63KXmSpKG0NjkpLb6DKG5AgBM/Vnuxcl7VuN+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TpsfAqrQmxFs2x8sVmCTb80q3feVM1lCZBGhUn2a/9t8qoPCW3uYQRSVxHH/nfa6eELuypjYscoIpMsrIFLbafrCK6wdyyXENFytDHXxcnuzcGAejNU6L7i1EZla6IQAa47yKOE/Y/tjmJxRm9nT47dtSiAnCCLFsphNeLnAKMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RYZfdrQK; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-53da6801c6dso456749e87.0
        for <linux-i2c@vger.kernel.org>; Thu, 21 Nov 2024 00:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1732177707; x=1732782507; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LSW1C/qBVxULrCXviH7+9hgZoHfp6/Mcea/z7iEbOPs=;
        b=RYZfdrQK+SO72pxQgvzsyHK0PhPTxUYsTdb4kk15BV38woqhUl+q7uIr9DOhsRJZRU
         PGhmKZ5Fp4fLQMODJSwEz0rsrrMs0nqMouRMkLx5XHlIZ8VT8aiOsHofYJ4E2FeIYHLd
         gDf+m8NsAZ3XmgapaH83ab+4wVwk9kr1O5l20CfAuPM+ACdbrHBiNBlD4S2Hdh+2Gi23
         Om53ImouYl/x13NG1VleMFroABTlRh9El0ThdHQtCd+pQxYs12Sf1MnEZZ3ThLL240me
         ZM6dJmW5XBXrmjuhZ/hHzZu1m+AMVCLqxu8Cz6Bn1Yj4aqcxfq08ZcO7mnVpQ76mexXg
         PNIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732177707; x=1732782507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LSW1C/qBVxULrCXviH7+9hgZoHfp6/Mcea/z7iEbOPs=;
        b=xARbe081vG7RuwGan7yauLUCSlXayVe9v5EQ86a3b80F9mverKsV71ZUc+XkrqYR6C
         LPXKNMEqW7lH2k7lYjMiwWHX2lBD7jmPWvEQ4S/67z7x1QIPCQBIsL0T3q45Nv92i/R6
         uZcK8bTM4xD/VQHcfiC6OnSJ6Fe0Xvh/6FO8f5CDWuElix8Cmfp3+k1Ht3hvaBwP09Hw
         wfUkVBaEKGkAtzs3P4IvSRFh0EgEAouwtvwvYJmPfcJj63r3PDxojGBHn0KJjya08SWx
         xnoI78S/92e+KUlsGC1Mw8v+Y2pYz83mcJRfeqZZwXGXYJxJXzsIifsDAnfwQ+rrfhbX
         uWsA==
X-Forwarded-Encrypted: i=1; AJvYcCW1GSNlOgJeh1EuzQD4oL4XmKo2cV0nQWjaCD65Kh7abwaHD5+ERuUNTJ88vLHh2uOcDTpOQdqfALU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWP10K5xyDACgd1DI0QRD7L133E/MYRKcx8njvyUqO9F+hOpza
	X+r0/OyjkdZQzkA8p8gCjevk2V8Vkro37bDuApCYngPyZ+MvcUXTCj0nehc2Eul8lTCvy2CcABN
	MGQH7c7x1nGz3/SLt9Igwap6Hm90yHUTcz1CU2w==
X-Google-Smtp-Source: AGHT+IFVYVQ0/sAkjXa7aOoA5r+icUc6cST11JB7IqopuyurxquNm8L4vHNp6dLIhDGQwBvMN2yjlooU+X0I2GXNkzw=
X-Received: by 2002:a05:6512:b26:b0:539:8fcd:524 with SMTP id
 2adb3069b0e04-53dc1342915mr2878029e87.30.1732177706732; Thu, 21 Nov 2024
 00:28:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241121064046.3724726-1-tmyu0@nuvoton.com> <20241121064046.3724726-3-tmyu0@nuvoton.com>
In-Reply-To: <20241121064046.3724726-3-tmyu0@nuvoton.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 21 Nov 2024 09:28:15 +0100
Message-ID: <CAMRc=MdT_iXoRJeGFEhuCvjVXVPpJVNeddPc6pi5agTaTm+QpQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/7] gpio: Add Nuvoton NCT6694 GPIO support
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	andi.shyti@kernel.org, mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org, 
	linux@roeck-us.net, jdelvare@suse.com, alexandre.belloni@bootlin.com, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2024 at 7:41=E2=80=AFAM Ming Yu <a0282524688@gmail.com> wro=
te:
>
> This driver supports GPIO and IRQ functionality for NCT6694 MFD
> device based on USB interface.
>
> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> ---
>  MAINTAINERS                 |   1 +
>  drivers/gpio/Kconfig        |  12 +
>  drivers/gpio/Makefile       |   1 +
>  drivers/gpio/gpio-nct6694.c | 441 ++++++++++++++++++++++++++++++++++++
>  4 files changed, 455 insertions(+)
>  create mode 100644 drivers/gpio/gpio-nct6694.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 9c9a94ff8f98..6688c5c470b7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16545,6 +16545,7 @@ NUVOTON NCT6694 MFD DRIVER
>  M:     Ming Yu <tmyu0@nuvoton.com>
>  L:     linux-kernel@vger.kernel.org
>  S:     Supported
> +F:     drivers/gpio/gpio-nct6694.c
>  F:     drivers/mfd/nct6694.c
>  F:     include/linux/mfd/nct6694.h
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 56fee58e281e..7773b5326e60 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -1460,6 +1460,18 @@ config GPIO_MAX77650
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
> index af3ba4d81b58..ad80a078b27b 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -123,6 +123,7 @@ obj-$(CONFIG_GPIO_MXC)                      +=3D gpio=
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
> index 000000000000..1776200b3a04
> --- /dev/null
> +++ b/drivers/gpio/gpio-nct6694.c
> @@ -0,0 +1,441 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Nuvoton NCT6694 GPIO controller driver based on USB interface.
> + *
> + * Copyright (C) 2024 Nuvoton Technology Corp.
> + */
> +
> +#include <linux/gpio/driver.h>
> +#include <linux/interrupt.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/nct6694.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +/* Host interface */
> +#define NCT6694_GPIO_MOD       0xFF
> +#define NCT6694_GPIO_LEN       0x01
> +
> +/* Report Channel */
> +#define NCT6694_GPIO_VER       0x90
> +#define NCT6694_GPIO_VALID     0x110
> +#define NCT6694_GPI_DATA       0x120
> +#define NCT6694_GPO_DIR                0x170
> +#define NCT6694_GPO_TYPE       0x180
> +#define NCT6694_GPO_DATA       0x190
> +
> +#define NCT6694_GPI_STS                0x130
> +#define NCT6694_GPI_CLR                0x140
> +#define NCT6694_GPI_FALLING    0x150
> +#define NCT6694_GPI_RISING     0x160
> +
> +#define NCT6694_NR_GPIO                8
> +
> +struct nct6694_gpio_data {
> +       struct nct6694 *nct6694;
> +       struct gpio_chip gpio;
> +       struct mutex lock;
> +       /* Protect irq operation */
> +       struct mutex irq_lock;
> +
> +       unsigned char xmit_buf;
> +       unsigned char irq_trig_falling;
> +       unsigned char irq_trig_rising;
> +
> +       /* Current gpio group */
> +       unsigned char group;
> +
> +       /* GPIO line names */
> +       char **names;

You only use this in probe() and after assigning it to gc->names, you
never reference it again. You don't need this field here, it can be a
local variable in probe().

> +};
> +
> +static int nct6694_get_direction(struct gpio_chip *gpio, unsigned int of=
fset)
> +{
> +       struct nct6694_gpio_data *data =3D gpiochip_get_data(gpio);
> +       int ret;
> +
> +       guard(mutex)(&data->lock);
> +
> +       ret =3D nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
> +                              NCT6694_GPO_DIR + data->group,
> +                              NCT6694_GPIO_LEN, &data->xmit_buf);
> +       if (ret < 0)
> +               return ret;
> +
> +       return !(BIT(offset) & data->xmit_buf);
> +}
> +
> +static int nct6694_direction_input(struct gpio_chip *gpio, unsigned int =
offset)
> +{
> +       struct nct6694_gpio_data *data =3D gpiochip_get_data(gpio);
> +       int ret;
> +
> +       guard(mutex)(&data->lock);
> +
> +       ret =3D nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
> +                              NCT6694_GPO_DIR + data->group,
> +                              NCT6694_GPIO_LEN, &data->xmit_buf);
> +       if (ret < 0)
> +               return ret;
> +
> +       data->xmit_buf &=3D ~(1 << offset);
> +
> +       return nct6694_write_msg(data->nct6694, NCT6694_GPIO_MOD,
> +                                NCT6694_GPO_DIR + data->group,
> +                                NCT6694_GPIO_LEN, &data->xmit_buf);
> +}
> +
> +static int nct6694_direction_output(struct gpio_chip *gpio,
> +                                   unsigned int offset, int val)
> +{
> +       struct nct6694_gpio_data *data =3D gpiochip_get_data(gpio);
> +       int ret;
> +
> +       guard(mutex)(&data->lock);
> +
> +       /* Set direction to output */
> +       ret =3D nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
> +                              NCT6694_GPO_DIR + data->group,
> +                              NCT6694_GPIO_LEN, &data->xmit_buf);
> +       if (ret < 0)
> +               return ret;
> +
> +       data->xmit_buf |=3D (1 << offset);
> +       ret =3D nct6694_write_msg(data->nct6694, NCT6694_GPIO_MOD,
> +                               NCT6694_GPO_DIR + data->group,
> +                               NCT6694_GPIO_LEN, &data->xmit_buf);
> +       if (ret < 0)
> +               return ret;
> +
> +       /* Then set output level */
> +       ret =3D nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
> +                              NCT6694_GPO_DATA + data->group,
> +                              NCT6694_GPIO_LEN, &data->xmit_buf);
> +       if (ret < 0)
> +               return ret;
> +
> +       if (val)
> +               data->xmit_buf |=3D (1 << offset);
> +       else
> +               data->xmit_buf &=3D ~(1 << offset);
> +
> +       return nct6694_write_msg(data->nct6694, NCT6694_GPIO_MOD,
> +                                NCT6694_GPO_DATA + data->group,
> +                                NCT6694_GPIO_LEN, &data->xmit_buf);
> +}
> +
> +static int nct6694_get_value(struct gpio_chip *gpio, unsigned int offset=
)
> +{
> +       struct nct6694_gpio_data *data =3D gpiochip_get_data(gpio);
> +       int ret;
> +
> +       guard(mutex)(&data->lock);
> +
> +       ret =3D nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
> +                              NCT6694_GPO_DIR + data->group,
> +                              NCT6694_GPIO_LEN, &data->xmit_buf);
> +       if (ret < 0)
> +               return ret;
> +
> +       if (BIT(offset) & data->xmit_buf) {
> +               ret =3D nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
> +                                      NCT6694_GPO_DATA + data->group,
> +                                      NCT6694_GPIO_LEN, &data->xmit_buf)=
;
> +               if (ret < 0)
> +                       return ret;
> +
> +               return !!(BIT(offset) & data->xmit_buf);
> +       }
> +
> +       ret =3D nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
> +                              NCT6694_GPI_DATA + data->group,
> +                              NCT6694_GPIO_LEN, &data->xmit_buf);
> +       if (ret < 0)
> +               return ret;
> +
> +       return !!(BIT(offset) & data->xmit_buf);
> +}
> +
> +static void nct6694_set_value(struct gpio_chip *gpio, unsigned int offse=
t,
> +                             int val)
> +{
> +       struct nct6694_gpio_data *data =3D gpiochip_get_data(gpio);
> +
> +       guard(mutex)(&data->lock);
> +
> +       nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
> +                        NCT6694_GPO_DATA + data->group,
> +                        NCT6694_GPIO_LEN, &data->xmit_buf);
> +
> +       if (val)
> +               data->xmit_buf |=3D (1 << offset);
> +       else
> +               data->xmit_buf &=3D ~(1 << offset);
> +
> +       nct6694_write_msg(data->nct6694, NCT6694_GPIO_MOD,
> +                         NCT6694_GPO_DATA + data->group,
> +                         NCT6694_GPIO_LEN, &data->xmit_buf);
> +}
> +
> +static int nct6694_set_config(struct gpio_chip *gpio, unsigned int offse=
t,
> +                             unsigned long config)
> +{
> +       struct nct6694_gpio_data *data =3D gpiochip_get_data(gpio);
> +       int ret;
> +
> +       guard(mutex)(&data->lock);
> +
> +       ret =3D nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
> +                              NCT6694_GPO_TYPE + data->group,
> +                              NCT6694_GPIO_LEN, &data->xmit_buf);
> +       if (ret < 0)
> +               return ret;
> +
> +       switch (pinconf_to_config_param(config)) {
> +       case PIN_CONFIG_DRIVE_OPEN_DRAIN:
> +               data->xmit_buf |=3D (1 << offset);
> +               break;
> +       case PIN_CONFIG_DRIVE_PUSH_PULL:
> +               data->xmit_buf &=3D ~(1 << offset);
> +               break;
> +       default:
> +               return -ENOTSUPP;
> +       }
> +
> +       return nct6694_write_msg(data->nct6694, NCT6694_GPIO_MOD,
> +                                NCT6694_GPO_TYPE + data->group,
> +                                NCT6694_GPIO_LEN, &data->xmit_buf);
> +}
> +
> +static int nct6694_init_valid_mask(struct gpio_chip *gpio,
> +                                  unsigned long *valid_mask,
> +                                  unsigned int ngpios)
> +{
> +       struct nct6694_gpio_data *data =3D gpiochip_get_data(gpio);
> +       int ret;
> +
> +       guard(mutex)(&data->lock);
> +
> +       ret =3D nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
> +                              NCT6694_GPIO_VALID + data->group,
> +                              NCT6694_GPIO_LEN, &data->xmit_buf);
> +       if (ret < 0)
> +               return ret;
> +
> +       *valid_mask =3D data->xmit_buf;
> +
> +       return ret;
> +}
> +
> +static irqreturn_t nct6694_irq_handler(int irq, void *priv)
> +{
> +       struct nct6694_gpio_data *data =3D priv;
> +       unsigned char status;
> +
> +       guard(mutex)(&data->lock);
> +
> +       nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
> +                        NCT6694_GPI_STS + data->group,
> +                        NCT6694_GPIO_LEN, &data->xmit_buf);
> +
> +       status =3D data->xmit_buf;
> +
> +       while (status) {
> +               int bit =3D __ffs(status);
> +
> +               data->xmit_buf =3D BIT(bit);
> +               handle_nested_irq(irq_find_mapping(data->gpio.irq.domain,=
 bit));
> +               status &=3D ~(1 << bit);
> +               nct6694_write_msg(data->nct6694, NCT6694_GPIO_MOD,
> +                                 NCT6694_GPI_CLR + data->group,
> +                                 NCT6694_GPIO_LEN, &data->xmit_buf);
> +       }
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static int nct6694_get_irq_trig(struct nct6694_gpio_data *data)
> +{
> +       int ret;
> +
> +       guard(mutex)(&data->lock);
> +
> +       ret =3D nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
> +                              NCT6694_GPI_FALLING + data->group,
> +                              NCT6694_GPIO_LEN, &data->irq_trig_falling)=
;
> +       if (ret)
> +               return ret;
> +
> +       return nct6694_read_msg(data->nct6694, NCT6694_GPIO_MOD,
> +                               NCT6694_GPI_RISING + data->group,
> +                               NCT6694_GPIO_LEN, &data->irq_trig_rising)=
;
> +}
> +
> +static void nct6694_irq_mask(struct irq_data *d)
> +{
> +       struct gpio_chip *gpio =3D irq_data_get_irq_chip_data(d);
> +       irq_hw_number_t hwirq =3D irqd_to_hwirq(d);
> +
> +       gpiochip_disable_irq(gpio, hwirq);
> +}
> +
> +static void nct6694_irq_unmask(struct irq_data *d)
> +{
> +       struct gpio_chip *gpio =3D irq_data_get_irq_chip_data(d);
> +       irq_hw_number_t hwirq =3D irqd_to_hwirq(d);
> +
> +       gpiochip_enable_irq(gpio, hwirq);
> +}
> +
> +static int nct6694_irq_set_type(struct irq_data *d, unsigned int type)
> +{
> +       struct gpio_chip *gpio =3D irq_data_get_irq_chip_data(d);
> +       struct nct6694_gpio_data *data =3D gpiochip_get_data(gpio);
> +       irq_hw_number_t hwirq =3D irqd_to_hwirq(d);
> +
> +       guard(mutex)(&data->lock);
> +
> +       switch (type) {
> +       case IRQ_TYPE_EDGE_RISING:
> +               data->irq_trig_rising |=3D BIT(hwirq);
> +               break;
> +
> +       case IRQ_TYPE_EDGE_FALLING:
> +               data->irq_trig_falling |=3D BIT(hwirq);
> +               break;
> +
> +       case IRQ_TYPE_EDGE_BOTH:
> +               data->irq_trig_rising |=3D BIT(hwirq);
> +               data->irq_trig_falling |=3D BIT(hwirq);
> +               break;
> +
> +       default:
> +               return -ENOTSUPP;
> +       }
> +
> +       return 0;
> +}
> +
> +static void nct6694_irq_bus_lock(struct irq_data *d)
> +{
> +       struct gpio_chip *gpio =3D irq_data_get_irq_chip_data(d);
> +       struct nct6694_gpio_data *data =3D gpiochip_get_data(gpio);
> +
> +       mutex_lock(&data->irq_lock);
> +}
> +
> +static void nct6694_irq_bus_sync_unlock(struct irq_data *d)
> +{
> +       struct gpio_chip *gpio =3D irq_data_get_irq_chip_data(d);
> +       struct nct6694_gpio_data *data =3D gpiochip_get_data(gpio);
> +
> +       scoped_guard(mutex, &data->lock) {
> +               nct6694_write_msg(data->nct6694, NCT6694_GPIO_MOD,
> +                                 NCT6694_GPI_FALLING + data->group,
> +                                 NCT6694_GPIO_LEN, &data->irq_trig_falli=
ng);
> +
> +               nct6694_write_msg(data->nct6694, NCT6694_GPIO_MOD,
> +                                 NCT6694_GPI_RISING + data->group,
> +                                 NCT6694_GPIO_LEN, &data->irq_trig_risin=
g);
> +       }
> +
> +       mutex_unlock(&data->irq_lock);
> +}
> +
> +static const struct irq_chip nct6694_irq_chip =3D {
> +       .name                   =3D "nct6694-gpio",
> +       .irq_mask               =3D nct6694_irq_mask,
> +       .irq_unmask             =3D nct6694_irq_unmask,
> +       .irq_set_type           =3D nct6694_irq_set_type,
> +       .irq_bus_lock           =3D nct6694_irq_bus_lock,
> +       .irq_bus_sync_unlock    =3D nct6694_irq_bus_sync_unlock,
> +       .flags                  =3D IRQCHIP_IMMUTABLE,
> +       GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};
> +
> +static int nct6694_gpio_probe(struct platform_device *pdev)
> +{
> +       const struct mfd_cell *cell =3D mfd_get_cell(pdev);
> +       struct device *dev =3D &pdev->dev;
> +       struct nct6694 *nct6694 =3D dev_get_drvdata(pdev->dev.parent);
> +       struct nct6694_gpio_data *data;
> +       struct gpio_irq_chip *girq;
> +       int ret, irq, i;
> +
> +       irq =3D irq_create_mapping(nct6694->domain,
> +                                NCT6694_IRQ_GPIO0 + cell->id);
> +       if (!irq)
> +               return -EINVAL;
> +
> +       data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       data->names =3D devm_kzalloc(dev, sizeof(char *) * NCT6694_NR_GPI=
O,

devm_kcalloc()?

> +                                  GFP_KERNEL);
> +       if (!data->names)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < NCT6694_NR_GPIO; i++) {
> +               data->names[i] =3D devm_kasprintf(dev, GFP_KERNEL, "GPIO%=
X%d",
> +                                               cell->id, i);
> +               if (!data->names[i])
> +                       return -ENOMEM;
> +       }
> +
> +       data->nct6694 =3D nct6694;
> +       data->group =3D cell->id;
> +
> +       data->gpio.names                =3D (const char * const*)data->na=
mes;
> +       data->gpio.label                =3D pdev->name;
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
> +       data->gpio.ngpio                =3D NCT6694_NR_GPIO;
> +
> +       mutex_init(&data->irq_lock);
> +
> +       platform_set_drvdata(pdev, data);

There is no corresponding platform_get_drvdata() so you don't need this.

> +
> +       ret =3D nct6694_get_irq_trig(data);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to get irq trigger=
 type\n");
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
> +       ret =3D devm_request_threaded_irq(dev, irq, NULL, nct6694_irq_han=
dler,
> +                                       IRQF_ONESHOT | IRQF_SHARED,
> +                                       "nct6694-gpio", data);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "Failed to request irq\n")=
;
> +
> +       return devm_gpiochip_add_data(dev, &data->gpio, data);
> +}
> +
> +static struct platform_driver nct6694_gpio_driver =3D {
> +       .driver =3D {
> +               .name   =3D "nct6694-gpio",
> +       },
> +       .probe          =3D nct6694_gpio_probe,
> +};
> +
> +module_platform_driver(nct6694_gpio_driver);
> +
> +MODULE_DESCRIPTION("USB-GPIO controller driver for NCT6694");
> +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> +MODULE_LICENSE("GPL");

It's an MFD device, don't you need a MODULE_ALIAS() for this module to load=
?

Bart

> --
> 2.34.1
>

