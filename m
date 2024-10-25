Return-Path: <linux-i2c+bounces-7564-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2279AFB3C
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 09:39:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7FD771C22578
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 07:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C0F1B6D08;
	Fri, 25 Oct 2024 07:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lfjfruEt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248211714B8;
	Fri, 25 Oct 2024 07:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729841945; cv=none; b=b5o3a8t8MuQTo2jhoHhkPLnblEpTMLEXYNlfgKfwWAw0wXoRVTWKMAAwksKiSQ4wcaGjyqqOmJ+3igUeJXcEM4iapUpPXJBOr/jHlNqa4PXnLQXq3geb08GnGbocvVLjrSD3ighJ9mrRzT3AZsb60vifFarlYZy44+plpBLsmYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729841945; c=relaxed/simple;
	bh=cBQxL/2Rq3Fob1hcXBLk0wujh2/MV+AyC0ao+S/xQek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UFoRF7oxB0zFMewchM4DfNR6Fo/95dzvNUUBZ7PI55YNVmE+ARKlxAT7AW/LI0ttY/Xh0sUq+jCX/Fy8ByV8wqGXwWYoMCI07XoC6gYadwYZ1VK+dGakvCL9oBsBw2NgvQM6j89e5CAO5WjOcIziFZaSPcSmFh71+CJbJnqJea8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lfjfruEt; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e291f1d659aso2084895276.3;
        Fri, 25 Oct 2024 00:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729841942; x=1730446742; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4pZDfebFFkVewdLIhSt4ZSKyPCjkQIctMcGbulG07o=;
        b=lfjfruEtt3p3EU3r4zYjSDMcJlGLChIUplUVffko6SgY+NDkF6z9+9bbPoKceZOYue
         cpW4k4ZcSeXzKp2TG53FBrWSGYMoTn3nWd+j/n1Jasni/w/nErGeM9QG7F3/quCwIsB+
         eDAbtHpF40yPYyJMiUpwJPpAkgqNFMMJHv7oTu/m9MZiSqlvQ98qCHeG3s+OkK0L8ver
         xxlB++f31Hi1QvDvPxBg7jg+l71IwGTiF34oDiqrIlNSxGaim/qzm2Z6UDKIJnFyWgg7
         6/hK4V1xpabBauiNKguUoRNfrh8VjQsFSdhuomh3giQ1mFFg12lZkgf36TBWw4gLUeVf
         5XJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729841942; x=1730446742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y4pZDfebFFkVewdLIhSt4ZSKyPCjkQIctMcGbulG07o=;
        b=w6zeSIc8XHpdBTarzJcgfCN6cxmJ/wsVFae89i3I5BP3DXUhWSREg7UGem3ofEMjpb
         Q4s2GQz+KRHCNlYOrOCCwuTwHtHUdc9+Uz7sIcPk4P9ybB5Rza14a86xBd1i8NfHUkvP
         10tdTy7mXuJhgCE5l2A/L5DulmyAq8AyFoLzO50u1NfVqpKIEfvxHblkb+xhOlrgLqEU
         vHdqOY2iRyJt/+PfVYiWyceQwaRKaLQAL1OCTJaSAjnTW6u0Cc5pUTpn5q6O3UI7bI3w
         +lOFpDyuJfc2dDIpWxekkxbCTzitQUxZW8TlTd67GV22jz63hbj8Ei26Jja3Nj6vR0V4
         kQ8A==
X-Forwarded-Encrypted: i=1; AJvYcCUc4Ndx8ucxI8dXtYsIx7gzsTH8uB/qhPuCGkYU7sgpC75d+3v0tpyCIPClpRwGAZDHrc01adfEwCtD@vger.kernel.org, AJvYcCUjxBsFhPUCzhVTYU8ZfUVYrTL95u5Wp6n0qw41GzcjqEjHI8Ize7fcMa9umuSk1q28YlAqPgXkpf3M@vger.kernel.org, AJvYcCUrsOL9nTiVW/qG/Sn6hBB8xCvtQ0In9eDf7ysZb+1VYJDJPTAOg7KR9qmTbwnObCkBDuddS+kAdYcf/L9T@vger.kernel.org, AJvYcCUwoCDux/zVulRJhzWlnA9v7VWtHKf0uO4m1xjv0cDsqdbA9U3vGPkBm3rM7LdFZTUmh90y8CIXckRb8Y0=@vger.kernel.org, AJvYcCVC71exD/69WWZKx42R1RGOuCZ8Q4gYj1MHjKKYj77j+ZGbUMFsGpVfa60Mqyb9hqiAE9FcLUbZYTE=@vger.kernel.org, AJvYcCW+e5jlk1cGAEhsNcuA3yWEPiav0ScnnP1WTgRauMhBdSxxb3WFDa8j0j1SxIxN659TnRJxlIcs@vger.kernel.org, AJvYcCWGJh0/72S59HmVahn7rpUMW0pdOn719EbN/ERATb8/9DCFJuKcqVFjCGrQIKOkUGAJIOW9WyOb40RvYQ==@vger.kernel.org, AJvYcCXR+AdpDQto4XFv6F3MtrLRWoEUaRhRRLT6kDjpncenDGQ6RF4QIhTkOS6t1rRQ+LWYX2ZtYTrGZegApm+YB8Y=@vger.kernel.org, AJvYcCXkD8f3HD4SDY1twDbYb2onuixzPz+ZHvyBgQ6eqKe9iPmE09rknLzsNRz4QbCK31wiVJZHNPyGMRA6@vger.kernel.org, AJvYcCXrgnbUEARireivYR0+nZraf5CIBOjT
 XrBRLH7tpzLX9M06GOA/cUszPmuD5dnHJXO8w0Wr4cTShhmU@vger.kernel.org
X-Gm-Message-State: AOJu0YyM96LIOPjGPtsdp7taIzdiVGI5xWEr1Mg2bRQbCKAzeG++PBef
	G1l/x3YuZTKb5MBQWYmGZrA30LlfY/JhnHIuxntmIhmd1g+3kzGz2+VvduikoGuBiJTQfbECCig
	jQMvhX0wMXDkhDN6ekl5CZnRICp8=
X-Google-Smtp-Source: AGHT+IHtWHvmcHrPJZlJuCBSGAWADRoEGByk6bKfJXEb1aOavubnGUftZvjMl5apmpl8NLLh/2FYrDvOm/NTiNWjylE=
X-Received: by 2002:a05:6902:1085:b0:e28:eb16:dd5e with SMTP id
 3f1490d57ef6-e2e3a6dd1a5mr8539029276.52.1729841942048; Fri, 25 Oct 2024
 00:39:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024085922.133071-3-tmyu0@nuvoton.com>
 <CAMRc=Mc+SZN=EytxY=qA-qBEAY_F17GP-7FRE9oLojLbdUoPaQ@mail.gmail.com>
In-Reply-To: <CAMRc=Mc+SZN=EytxY=qA-qBEAY_F17GP-7FRE9oLojLbdUoPaQ@mail.gmail.com>
From: =?UTF-8?B?5ri45a2Q5rCR?= <a0282524688@gmail.com>
Date: Fri, 25 Oct 2024 15:38:51 +0800
Message-ID: <CAOoeyxW4=+5-QMcd_wgncFC9jgx_1Zf1Tq8RTnBvVqZ1JcUBQg@mail.gmail.com>
Subject: Re: [PATCH v1 2/9] gpio: Add Nuvoton NCT6694 GPIO support
To: Bartosz Golaszewski <brgl@bgdev.pl>
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

Sorry, resending this email in plain text format.

Dear Bart,

Thank you for your comments.

Bartosz Golaszewski <brgl@bgdev.pl> =E6=96=BC 2024=E5=B9=B410=E6=9C=8824=E6=
=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:47=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, Oct 24, 2024 at 10:59=E2=80=AFAM Ming Yu <a0282524688@gmail.com> =
wrote:
> >
> > This driver supports GPIO and IRQ functionality for NCT6694 MFD
> > device based on USB interface.
> >
> > Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> > ---
> >  MAINTAINERS                 |   1 +
> >  drivers/gpio/Kconfig        |  12 +
> >  drivers/gpio/Makefile       |   1 +
> >  drivers/gpio/gpio-nct6694.c | 489 ++++++++++++++++++++++++++++++++++++
> >  4 files changed, 503 insertions(+)
> >  create mode 100644 drivers/gpio/gpio-nct6694.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 30157ca95cf3..2c86d5dab3f1 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16438,6 +16438,7 @@ NUVOTON NCT6694 MFD DRIVER
> >  M:     Ming Yu <tmyu0@nuvoton.com>
> >  L:     linux-kernel@vger.kernel.org
> >  S:     Supported
> > +F:     drivers/gpio/gpio-nct6694.c
> >  F:     drivers/mfd/nct6694.c
> >  F:     include/linux/mfd/nct6694.h
> >
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index d93cd4f722b4..aa78ad9ff4ac 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -1450,6 +1450,18 @@ config GPIO_MAX77650
> >           GPIO driver for MAX77650/77651 PMIC from Maxim Semiconductor.
> >           These chips have a single pin that can be configured as GPIO.
> >
> > +config GPIO_NCT6694
> > +       tristate "Nuvoton NCT6694 GPIO controller support"
> > +       depends on MFD_NCT6694
> > +       select GENERIC_IRQ_CHIP
> > +       select GPIOLIB_IRQCHIP
> > +       help
> > +         This driver supports 8 GPIO pins per bank that can all be int=
errupt
> > +         sources.
> > +
> > +         This driver can also be built as a module. If so, the module =
will be
> > +         called gpio-nct6694.
> > +
> >  config GPIO_PALMAS
> >         bool "TI PALMAS series PMICs GPIO"
> >         depends on MFD_PALMAS
> > diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> > index 1429e8c0229b..02c94aa28017 100644
> > --- a/drivers/gpio/Makefile
> > +++ b/drivers/gpio/Makefile
> > @@ -121,6 +121,7 @@ obj-$(CONFIG_GPIO_MXC)                      +=3D gp=
io-mxc.o
> >  obj-$(CONFIG_GPIO_MXS)                 +=3D gpio-mxs.o
> >  obj-$(CONFIG_GPIO_NOMADIK)             +=3D gpio-nomadik.o
> >  obj-$(CONFIG_GPIO_NPCM_SGPIO)          +=3D gpio-npcm-sgpio.o
> > +obj-$(CONFIG_GPIO_NCT6694)             +=3D gpio-nct6694.o
> >  obj-$(CONFIG_GPIO_OCTEON)              +=3D gpio-octeon.o
> >  obj-$(CONFIG_GPIO_OMAP)                        +=3D gpio-omap.o
> >  obj-$(CONFIG_GPIO_PALMAS)              +=3D gpio-palmas.o
> > diff --git a/drivers/gpio/gpio-nct6694.c b/drivers/gpio/gpio-nct6694.c
> > new file mode 100644
> > index 000000000000..42c0e6e76730
> > --- /dev/null
> > +++ b/drivers/gpio/gpio-nct6694.c
> > @@ -0,0 +1,489 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Nuvoton NCT6694 GPIO controller driver based on USB interface.
> > + *
> > + * Copyright (C) 2024 Nuvoton Technology Corp.
> > + */
> > +
> > +#include <linux/gpio.h>
>
> Don't include this header. It's documented as obsolete.

[Ming] Okay! I'll drop it in the next patch.

>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/module.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/mfd/nct6694.h>
> > +
>
> You only use it once, drop it.

[Ming] That line is blank, did you mean #include <linux/gpio.h>?

>
> > +#define DRVNAME "nct6694-gpio"
> > +
> > +/* Host interface */
> > +#define REQUEST_GPIO_MOD               0xFF
> > +#define REQUEST_GPIO_LEN               0x01
> > +
> > +/* Report Channel */
> > +#define GPIO_VER_REG                   0x90
> > +#define GPIO_VALID_REG                 0x110
> > +#define GPI_DATA_REG                   0x120
> > +#define GPO_DIR_REG                    0x170
> > +#define GPO_TYPE_REG                   0x180
> > +#define GPO_DATA_REG                   0x190
> > +
> > +#define GPI_STS_REG                    0x130
> > +#define GPI_CLR_REG                    0x140
> > +#define GPI_FALLING_REG                        0x150
> > +#define GPI_RISING_REG                 0x160
> > +
>
> Please use the NCT6694 prefix for these defines, otherwise it's not
> clear whether they come from the driver or from GPIO core.
>
> []

[Ming] Okay! I'll add the prefix to the defines in the next patch.

>
> > +
> > +static const char * const nct6694_gpio_name[] =3D {
> > +       "NCT6694-GPIO0",
> > +       "NCT6694-GPIO1",
> > +       "NCT6694-GPIO2",
> > +       "NCT6694-GPIO3",
> > +       "NCT6694-GPIO4",
> > +       "NCT6694-GPIO5",
> > +       "NCT6694-GPIO6",
> > +       "NCT6694-GPIO7",
> > +       "NCT6694-GPIO8",
> > +       "NCT6694-GPIO9",
> > +       "NCT6694-GPIOA",
> > +       "NCT6694-GPIOB",
> > +       "NCT6694-GPIOC",
> > +       "NCT6694-GPIOD",
> > +       "NCT6694-GPIOE",
> > +       "NCT6694-GPIOF",
> > +};
>
> This looks like it corresponds with the MFD cells and makes me wonder:
> am I getting that wrong or do you want to register 0xf GPIO chips? Or
> a single GPIO chip with 0xf lines? What is the topology?

[Ming] Yes, it corresponds to the MFD cells.
I would like to register 16 GPIO chips, each with 8 lines.
The chip has 128 pins totally, the core can check if the pin is valid throu=
gh
the init_valid_mask() callback.

>
> > +
> > +static int nct6694_gpio_probe(struct platform_device *pdev)
> > +{
> > +       const struct mfd_cell *cell =3D mfd_get_cell(pdev);
> > +       struct nct6694 *nct6694 =3D dev_get_drvdata(pdev->dev.parent);
> > +       struct nct6694_gpio_data *data;
> > +       struct gpio_irq_chip *girq;
> > +       int ret;
> > +
> > +       data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> > +       if (!data)
> > +               return -ENOMEM;
> > +
> > +       data->nct6694 =3D nct6694;
> > +       data->group =3D cell->id;
> > +
> > +       data->gpio.label                =3D nct6694_gpio_name[cell->id]=
;
> > +       data->gpio.direction_input      =3D nct6694_direction_input;
> > +       data->gpio.get                  =3D nct6694_get_value;
> > +       data->gpio.direction_output     =3D nct6694_direction_output;
> > +       data->gpio.set                  =3D nct6694_set_value;
> > +       data->gpio.get_direction        =3D nct6694_get_direction;
> > +       data->gpio.set_config           =3D nct6694_set_config;
> > +       data->gpio.init_valid_mask      =3D nct6694_init_valid_mask;
> > +       data->gpio.base                 =3D -1;
> > +       data->gpio.can_sleep            =3D false;
> > +       data->gpio.owner                =3D THIS_MODULE;
> > +       data->gpio.ngpio                =3D 8;
> > +
> > +       INIT_WORK(&data->irq_work, nct6694_irq);
> > +       INIT_WORK(&data->irq_trig_work, nct6694_irq_trig);
> > +       mutex_init(&data->irq_lock);
> > +
> > +       ret =3D nct6694_register_handler(nct6694, GPIO_IRQ_STATUS,
> > +                                      nct6694_gpio_handler, data);
> > +       if (ret) {
> > +               dev_err(&pdev->dev, "%s:  Failed to register handler: %=
pe\n",
> > +                       __func__, ERR_PTR(ret));
> > +               return ret;
> > +       }
> > +
> > +       platform_set_drvdata(pdev, data);
> > +
> > +       ret =3D nct6694_get_irq_trig(data);
> > +       if (ret)
> > +               return ret;
> > +
> > +       /* Register gpio chip to GPIO framework */
> > +       girq =3D &data->gpio.irq;
> > +       gpio_irq_chip_set_chip(girq, &nct6694_irq_chip);
> > +       girq->parent_handler =3D NULL;
> > +       girq->num_parents =3D 0;
> > +       girq->parents =3D NULL;
> > +       girq->default_type =3D IRQ_TYPE_NONE;
> > +       girq->handler =3D handle_level_irq;
> > +       girq->threaded =3D true;
> > +
> > +       ret =3D gpiochip_add_data(&data->gpio, data);
> > +       if (ret) {
> > +               dev_err(&pdev->dev, "%s: Failed to register GPIO chip: =
%pe",
> > +                       __func__, ERR_PTR(ret));
> > +               return ret;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static void nct6694_gpio_remove(struct platform_device *pdev)
> > +{
> > +       struct nct6694_gpio_data *data =3D platform_get_drvdata(pdev);
> > +
> > +       gpiochip_remove(&data->gpio);
>
> This should be dropped in favor of using devm_gpiochip_add_data().
> Especially since you probably want to cancel the irq_work before
> removing the chip.

[Ming] Okay! I'll change it in the next patch.

>
> > +       cancel_work(&data->irq_work);
> > +       cancel_work(&data->irq_trig_work);
> > +}
> > +
> > +static struct platform_driver nct6694_gpio_driver =3D {
> > +       .driver =3D {
> > +               .name   =3D DRVNAME,
> > +       },
> > +       .probe          =3D nct6694_gpio_probe,
> > +       .remove         =3D nct6694_gpio_remove,
> > +};
> > +
> > +static int __init nct6694_init(void)
> > +{
> > +       int err;
> > +
> > +       err =3D platform_driver_register(&nct6694_gpio_driver);
> > +       if (!err) {
> > +               if (err)
>
> If err is equal to 0, check if it's not equal to zero?
>
> > +                       platform_driver_unregister(&nct6694_gpio_driver=
);
>
> If platform_driver_register() failed, then the device was never registere=
d.
>
> > +       }
> > +
> > +       return err;
> > +}
> > +subsys_initcall(nct6694_init);
>
> Any reason why this must be initialized earlier? It's a USB driver after =
all.

[Ming] For platform driver registration, I'll change it to
module_platform_driver()
in the next patch.

>
> > +
> > +static void __exit nct6694_exit(void)
> > +{
> > +       platform_driver_unregister(&nct6694_gpio_driver);
> > +}
> > +module_exit(nct6694_exit);
> > +
> > +MODULE_DESCRIPTION("USB-GPIO controller driver for NCT6694");
> > +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> > +MODULE_LICENSE("GPL");
> > --
> > 2.34.1
> >
>
> Bart

