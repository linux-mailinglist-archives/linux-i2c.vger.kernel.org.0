Return-Path: <linux-i2c+bounces-7629-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FC89B2AD8
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 09:57:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 555ED1F22616
	for <lists+linux-i2c@lfdr.de>; Mon, 28 Oct 2024 08:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBD6F155C97;
	Mon, 28 Oct 2024 08:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kHNPu75E"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com [209.85.219.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47CE193060;
	Mon, 28 Oct 2024 08:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730105826; cv=none; b=YzmunXdKT+Xlr1UiEDqz1FdOUmd6dJrni9s93t/zPhIXbtSr1WBfZtHVIBqiYd6E7AjzFkE75+wOOw1hmUephToOyzU+WEdTUf+qm8oZ98t0REbmDWBj4LtAcYeAGzWnca9KsTYMIDRE5RBH327XI7khYL8SNqVwpbMApxYXpBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730105826; c=relaxed/simple;
	bh=Bcq0fO9Pxym95RWibiLq5Q1tL5fYFE8eVqoefhl/Omg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eKT38hcO9wrz3GiIiZSUCXpN01WQUzDM9h7mMjZS6UZfVDi+Iy0/hdiMSgzBSJCE//cwctNppVW4aQ/H29SZs6DQWn9dEQXJu8ZlCh8PfVes6phv6vRpCEx3v7sZyhOYnqvKuFuguJ8dzJaniLcAtoqKc6v87ImEc75x02PxCaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kHNPu75E; arc=none smtp.client-ip=209.85.219.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-e290e857d56so3670536276.1;
        Mon, 28 Oct 2024 01:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730105822; x=1730710622; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xA4cE9U51TPg8RedW2fRonR3ROLTQ7izS+w6TopxWcw=;
        b=kHNPu75E7XNc5+H9n2LMiadl9ud+iwKaQ0HSBOzBWOKzyfm5qmTJtQVFojgCn19nZ+
         X91FWxgsc3PKcIlTmCp1bv2abQ9ubYMwAJKLlomQxv6jtH1J8KUZ1H/lzx722BdQL4BJ
         vmbebm0rlhAifazASjbza8KRVmDVBtABo63Yv9i6O2Pyp9PaVxRTwC8kFSfl7VMC5X+M
         d6UFvGboSq5mWa4vLOJ7G/lvhU6oezWIUhvuZjfPMZuva3Vw55VU+yg5MmMueIFB6vNC
         owNQN/Q/PsQR5Rm2gvQDC87zOo2PiVjKGHLUghnuEqTuDJpqzEOcHCpOPl7GmNW3AFKc
         HMqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730105822; x=1730710622;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xA4cE9U51TPg8RedW2fRonR3ROLTQ7izS+w6TopxWcw=;
        b=xMKXFgnKb3JYHKjDB6oy5UnRpef9+YdeRLQe/fiva8nLxKw8LBhx0tSqXUYwRwXsW8
         5Xvj4DC3Y3/yboOgpAjh9IWP6jKwufCgpDN9jKLadxtpGJzqphVjStIJ0ii6m0BZaM5U
         RB+wLoWnzuFw3KjiqGbC816CCi+8B/8fmP6zw924k1ZRVAtBWoIeTWp9IeCsSIADDCZN
         14x3ZfEinQ0uoFOi+GK5NVIzMcqrdYM3/WND7bBWOjKGNogbHRoeF6pZu7c0lmLSvBtb
         8LaZWfvxIndhulQQ5rAbPVHZ67eJqDhLbP9BcR+ScrcELgyA4zppkzsupI3Iak2F+opK
         +rLg==
X-Forwarded-Encrypted: i=1; AJvYcCUG0at1EkgGiSQtNaGMtxDP4rGtqjBjVvVS9j3uiNHUDAhOg+mTU2bd/yaq27L/Ooh1JFO9xuwzjM1N@vger.kernel.org, AJvYcCUdzZbOjPmckXVc2uKCxVcUBDGqfPCULtgp4ssdyvfg4V2uetPiuU1coKElC2O6fm9xw6cEY0osP02tDKA=@vger.kernel.org, AJvYcCV43LBP1zW1MnF7/ctv4avirNvhg+CNIuK4XcYKL7qL/P1Gy2qyxE0vdgjNYA6r6jTxNF6kULsR53B+VkTS@vger.kernel.org, AJvYcCVAiCfcf1Qf/JWBucTTfGJaeEz9Pr38CWLzAT159B8V0vTXtie2RqXj1zWjgFJlrsCOMEbNchA58xcx@vger.kernel.org, AJvYcCVnjep+eqvGWyH1fj89i3jHtbywh3FwupQuR9KjNsXkJD+aMmBJOnjf1d/f43/X4TERusJocDhe@vger.kernel.org, AJvYcCWE5gwA/N1PEB889SuRLvK+0jhp59qnqdeQUsUS2gdT2wUCP0gUVzBEXt9y632xkGGBIYY7XOlodzOK@vger.kernel.org, AJvYcCWT0rf0M6yis1YDw+TtWVMDX8KR7n+kX11u3aApD+uIhOKk+r6wUSXaG2g4PlA+CMJOJH8xUUo0DVx7xj4MaMs=@vger.kernel.org, AJvYcCWiINHc4gS6HHTkG2SdQqhOuQ26Ggt/J8wereDtuBXLeu/cMz01H5TjX00gUW3Y26nR7ZO1s51WXIk=@vger.kernel.org, AJvYcCXCuT3qTsc8aFZz03NmG0q7UQSlBrDJIMqroirbGbtbKJB0iYpazPr5RBLWln6Jwf1RIq0rRYhPD348hA==@vger.kernel.org, AJvYcCXlROj3SYDal1BwayWYUH1xt3/g6rAC
 LGFI69E3G7md1+DhoUxgDWmBMkAMcQORlzAo0QFjmMto3I76@vger.kernel.org
X-Gm-Message-State: AOJu0YyrpFBC/aWccssHJfbzbk75hlIfkXyZXLrcek/V/1CgBLFoG1N8
	iv87tpB0p7rpXcvFqbPaCnUu6ELqg9qk/tgITRD94PHKAzu4SsyC9EjlIPD6p9B2t4MaXvYWUPz
	J0tiQD5RImczU9es9naPjWmDgQNk=
X-Google-Smtp-Source: AGHT+IE4UksOy84hxGbzbWeIH9i7eGolsfQtJRd/1c9LoziNujkHyuL7UiVtMDmnP7Rr/qQLZYMsNLGs1tvOmiZHpxM=
X-Received: by 2002:a05:6902:2b8b:b0:e29:7e0a:38f4 with SMTP id
 3f1490d57ef6-e3087c10616mr6393294276.52.1730105822487; Mon, 28 Oct 2024
 01:57:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024085922.133071-3-tmyu0@nuvoton.com>
 <CAMRc=Mc+SZN=EytxY=qA-qBEAY_F17GP-7FRE9oLojLbdUoPaQ@mail.gmail.com>
 <CAOoeyxW4=+5-QMcd_wgncFC9jgx_1Zf1Tq8RTnBvVqZ1JcUBQg@mail.gmail.com> <CAMRc=MexqwSCDrsBS0mK0fo_MCwngAH9XVgjRuDQjw0TVUBmPw@mail.gmail.com>
In-Reply-To: <CAMRc=MexqwSCDrsBS0mK0fo_MCwngAH9XVgjRuDQjw0TVUBmPw@mail.gmail.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Mon, 28 Oct 2024 16:56:51 +0800
Message-ID: <CAOoeyxXRrDuKJRMb3O2h3BF1vC=pwNN3DKfnEN9LnA+jiBCTQg@mail.gmail.com>
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

Dear Bartosz,

Thank you for your comments,

Bartosz Golaszewski <brgl@bgdev.pl> =E6=96=BC 2024=E5=B9=B410=E6=9C=8825=E6=
=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=883:47=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Fri, Oct 25, 2024 at 9:39=E2=80=AFAM =E6=B8=B8=E5=AD=90=E6=B0=91 <a028=
2524688@gmail.com> wrote:
> >
> > Sorry, resending this email in plain text format.
> >
> > Dear Bart,
> >
> > Thank you for your comments.
> >
> > Bartosz Golaszewski <brgl@bgdev.pl> =E6=96=BC 2024=E5=B9=B410=E6=9C=882=
4=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:47=E5=AF=AB=E9=81=93=EF=
=BC=9A
> > >
> > > On Thu, Oct 24, 2024 at 10:59=E2=80=AFAM Ming Yu <a0282524688@gmail.c=
om> wrote:
> > > >
> > > > This driver supports GPIO and IRQ functionality for NCT6694 MFD
> > > > device based on USB interface.
> > > >
> > > > Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> > > > ---
> > > >  MAINTAINERS                 |   1 +
> > > >  drivers/gpio/Kconfig        |  12 +
> > > >  drivers/gpio/Makefile       |   1 +
> > > >  drivers/gpio/gpio-nct6694.c | 489 ++++++++++++++++++++++++++++++++=
++++
> > > >  4 files changed, 503 insertions(+)
> > > >  create mode 100644 drivers/gpio/gpio-nct6694.c
> > > >
> > > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > > index 30157ca95cf3..2c86d5dab3f1 100644
> > > > --- a/MAINTAINERS
> > > > +++ b/MAINTAINERS
> > > > @@ -16438,6 +16438,7 @@ NUVOTON NCT6694 MFD DRIVER
> > > >  M:     Ming Yu <tmyu0@nuvoton.com>
> > > >  L:     linux-kernel@vger.kernel.org
> > > >  S:     Supported
> > > > +F:     drivers/gpio/gpio-nct6694.c
> > > >  F:     drivers/mfd/nct6694.c
> > > >  F:     include/linux/mfd/nct6694.h
> > > >
> > > > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > > > index d93cd4f722b4..aa78ad9ff4ac 100644
> > > > --- a/drivers/gpio/Kconfig
> > > > +++ b/drivers/gpio/Kconfig
> > > > @@ -1450,6 +1450,18 @@ config GPIO_MAX77650
> > > >           GPIO driver for MAX77650/77651 PMIC from Maxim Semiconduc=
tor.
> > > >           These chips have a single pin that can be configured as G=
PIO.
> > > >
> > > > +config GPIO_NCT6694
> > > > +       tristate "Nuvoton NCT6694 GPIO controller support"
> > > > +       depends on MFD_NCT6694
> > > > +       select GENERIC_IRQ_CHIP
> > > > +       select GPIOLIB_IRQCHIP
> > > > +       help
> > > > +         This driver supports 8 GPIO pins per bank that can all be=
 interrupt
> > > > +         sources.
> > > > +
> > > > +         This driver can also be built as a module. If so, the mod=
ule will be
> > > > +         called gpio-nct6694.
> > > > +
> > > >  config GPIO_PALMAS
> > > >         bool "TI PALMAS series PMICs GPIO"
> > > >         depends on MFD_PALMAS
> > > > diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> > > > index 1429e8c0229b..02c94aa28017 100644
> > > > --- a/drivers/gpio/Makefile
> > > > +++ b/drivers/gpio/Makefile
> > > > @@ -121,6 +121,7 @@ obj-$(CONFIG_GPIO_MXC)                      +=
=3D gpio-mxc.o
> > > >  obj-$(CONFIG_GPIO_MXS)                 +=3D gpio-mxs.o
> > > >  obj-$(CONFIG_GPIO_NOMADIK)             +=3D gpio-nomadik.o
> > > >  obj-$(CONFIG_GPIO_NPCM_SGPIO)          +=3D gpio-npcm-sgpio.o
> > > > +obj-$(CONFIG_GPIO_NCT6694)             +=3D gpio-nct6694.o
> > > >  obj-$(CONFIG_GPIO_OCTEON)              +=3D gpio-octeon.o
> > > >  obj-$(CONFIG_GPIO_OMAP)                        +=3D gpio-omap.o
> > > >  obj-$(CONFIG_GPIO_PALMAS)              +=3D gpio-palmas.o
> > > > diff --git a/drivers/gpio/gpio-nct6694.c b/drivers/gpio/gpio-nct669=
4.c
> > > > new file mode 100644
> > > > index 000000000000..42c0e6e76730
> > > > --- /dev/null
> > > > +++ b/drivers/gpio/gpio-nct6694.c
> > > > @@ -0,0 +1,489 @@
> > > > +// SPDX-License-Identifier: GPL-2.0
> > > > +/*
> > > > + * Nuvoton NCT6694 GPIO controller driver based on USB interface.
> > > > + *
> > > > + * Copyright (C) 2024 Nuvoton Technology Corp.
> > > > + */
> > > > +
> > > > +#include <linux/gpio.h>
> > >
> > > Don't include this header. It's documented as obsolete.
> >
> > [Ming] Okay! I'll drop it in the next patch.
> >
> > >
> > > > +#include <linux/gpio/driver.h>
> > > > +#include <linux/module.h>
> > > > +#include <linux/interrupt.h>
> > > > +#include <linux/platform_device.h>
> > > > +#include <linux/mfd/core.h>
> > > > +#include <linux/mfd/nct6694.h>
> > > > +
> > >
> > > You only use it once, drop it.
> >
> > [Ming] That line is blank, did you mean #include <linux/gpio.h>?
> >
> > >
> > > > +#define DRVNAME "nct6694-gpio"
>
> I meant this line. Just put the driver name in the driver struct
> definition directly.
>
> > > > +
> > > > +/* Host interface */
> > > > +#define REQUEST_GPIO_MOD               0xFF
> > > > +#define REQUEST_GPIO_LEN               0x01
> > > > +
> > > > +/* Report Channel */
> > > > +#define GPIO_VER_REG                   0x90
> > > > +#define GPIO_VALID_REG                 0x110
> > > > +#define GPI_DATA_REG                   0x120
> > > > +#define GPO_DIR_REG                    0x170
> > > > +#define GPO_TYPE_REG                   0x180
> > > > +#define GPO_DATA_REG                   0x190
> > > > +
> > > > +#define GPI_STS_REG                    0x130
> > > > +#define GPI_CLR_REG                    0x140
> > > > +#define GPI_FALLING_REG                        0x150
> > > > +#define GPI_RISING_REG                 0x160
> > > > +
> > >
> > > Please use the NCT6694 prefix for these defines, otherwise it's not
> > > clear whether they come from the driver or from GPIO core.
> > >
> > > []
> >
> > [Ming] Okay! I'll add the prefix to the defines in the next patch.
> >
> > >
> > > > +
> > > > +static const char * const nct6694_gpio_name[] =3D {
> > > > +       "NCT6694-GPIO0",
> > > > +       "NCT6694-GPIO1",
> > > > +       "NCT6694-GPIO2",
> > > > +       "NCT6694-GPIO3",
> > > > +       "NCT6694-GPIO4",
> > > > +       "NCT6694-GPIO5",
> > > > +       "NCT6694-GPIO6",
> > > > +       "NCT6694-GPIO7",
> > > > +       "NCT6694-GPIO8",
> > > > +       "NCT6694-GPIO9",
> > > > +       "NCT6694-GPIOA",
> > > > +       "NCT6694-GPIOB",
> > > > +       "NCT6694-GPIOC",
> > > > +       "NCT6694-GPIOD",
> > > > +       "NCT6694-GPIOE",
> > > > +       "NCT6694-GPIOF",
> > > > +};
> > >
> > > This looks like it corresponds with the MFD cells and makes me wonder=
:
> > > am I getting that wrong or do you want to register 0xf GPIO chips? Or
> > > a single GPIO chip with 0xf lines? What is the topology?
> >
> > [Ming] Yes, it corresponds to the MFD cells.
> > I would like to register 16 GPIO chips, each with 8 lines.
> > The chip has 128 pins totally, the core can check if the pin is valid t=
hrough
> > the init_valid_mask() callback.
> >
>
> Ok, that's fine but the GPIO chip names should be in the MFD driver
> only, it doesn't make sense to have them here. It's the MFD core that
> will register the GPIO platform devices.

I understand. I will remove it.

>
> No for line names - as this is a dynamic USB expander, I'd suggest to
> have them in the driver and assign to gc->names.

Could I create an array to map each of the GPIO pins?

>
> > >
> > > > +
> > > > +static int nct6694_gpio_probe(struct platform_device *pdev)
> > > > +{
> > > > +       const struct mfd_cell *cell =3D mfd_get_cell(pdev);
> > > > +       struct nct6694 *nct6694 =3D dev_get_drvdata(pdev->dev.paren=
t);
> > > > +       struct nct6694_gpio_data *data;
> > > > +       struct gpio_irq_chip *girq;
> > > > +       int ret;
> > > > +
> > > > +       data =3D devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL=
);
> > > > +       if (!data)
> > > > +               return -ENOMEM;
> > > > +
> > > > +       data->nct6694 =3D nct6694;
> > > > +       data->group =3D cell->id;
> > > > +
> > > > +       data->gpio.label                =3D nct6694_gpio_name[cell-=
>id];
> > > > +       data->gpio.direction_input      =3D nct6694_direction_input=
;
> > > > +       data->gpio.get                  =3D nct6694_get_value;
> > > > +       data->gpio.direction_output     =3D nct6694_direction_outpu=
t;
> > > > +       data->gpio.set                  =3D nct6694_set_value;
> > > > +       data->gpio.get_direction        =3D nct6694_get_direction;
> > > > +       data->gpio.set_config           =3D nct6694_set_config;
> > > > +       data->gpio.init_valid_mask      =3D nct6694_init_valid_mask=
;
> > > > +       data->gpio.base                 =3D -1;
> > > > +       data->gpio.can_sleep            =3D false;
> > > > +       data->gpio.owner                =3D THIS_MODULE;
> > > > +       data->gpio.ngpio                =3D 8;
> > > > +
> > > > +       INIT_WORK(&data->irq_work, nct6694_irq);
> > > > +       INIT_WORK(&data->irq_trig_work, nct6694_irq_trig);
> > > > +       mutex_init(&data->irq_lock);
> > > > +
> > > > +       ret =3D nct6694_register_handler(nct6694, GPIO_IRQ_STATUS,
> > > > +                                      nct6694_gpio_handler, data);
> > > > +       if (ret) {
> > > > +               dev_err(&pdev->dev, "%s:  Failed to register handle=
r: %pe\n",
> > > > +                       __func__, ERR_PTR(ret));
> > > > +               return ret;
> > > > +       }
> > > > +
> > > > +       platform_set_drvdata(pdev, data);
> > > > +
> > > > +       ret =3D nct6694_get_irq_trig(data);
> > > > +       if (ret)
> > > > +               return ret;
> > > > +
> > > > +       /* Register gpio chip to GPIO framework */
> > > > +       girq =3D &data->gpio.irq;
> > > > +       gpio_irq_chip_set_chip(girq, &nct6694_irq_chip);
> > > > +       girq->parent_handler =3D NULL;
> > > > +       girq->num_parents =3D 0;
> > > > +       girq->parents =3D NULL;
> > > > +       girq->default_type =3D IRQ_TYPE_NONE;
> > > > +       girq->handler =3D handle_level_irq;
> > > > +       girq->threaded =3D true;
> > > > +
> > > > +       ret =3D gpiochip_add_data(&data->gpio, data);
> > > > +       if (ret) {
> > > > +               dev_err(&pdev->dev, "%s: Failed to register GPIO ch=
ip: %pe",
> > > > +                       __func__, ERR_PTR(ret));
> > > > +               return ret;
> > > > +       }
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static void nct6694_gpio_remove(struct platform_device *pdev)
> > > > +{
> > > > +       struct nct6694_gpio_data *data =3D platform_get_drvdata(pde=
v);
> > > > +
> > > > +       gpiochip_remove(&data->gpio);
> > >
> > > This should be dropped in favor of using devm_gpiochip_add_data().
> > > Especially since you probably want to cancel the irq_work before
> > > removing the chip.
> >
> > [Ming] Okay! I'll change it in the next patch.
> >
> > >
> > > > +       cancel_work(&data->irq_work);
> > > > +       cancel_work(&data->irq_trig_work);
> > > > +}
> > > > +
> > > > +static struct platform_driver nct6694_gpio_driver =3D {
> > > > +       .driver =3D {
> > > > +               .name   =3D DRVNAME,
> > > > +       },
> > > > +       .probe          =3D nct6694_gpio_probe,
> > > > +       .remove         =3D nct6694_gpio_remove,
> > > > +};
> > > > +
> > > > +static int __init nct6694_init(void)
> > > > +{
> > > > +       int err;
> > > > +
> > > > +       err =3D platform_driver_register(&nct6694_gpio_driver);
> > > > +       if (!err) {
> > > > +               if (err)
> > >
> > > If err is equal to 0, check if it's not equal to zero?
> > >
> > > > +                       platform_driver_unregister(&nct6694_gpio_dr=
iver);
> > >
> > > If platform_driver_register() failed, then the device was never regis=
tered.
> > >
> > > > +       }
> > > > +
> > > > +       return err;
> > > > +}
> > > > +subsys_initcall(nct6694_init);
> > >
> > > Any reason why this must be initialized earlier? It's a USB driver af=
ter all.
> >
> > [Ming] For platform driver registration, I'll change it to
> > module_platform_driver()
> > in the next patch.
> >
>
> Thanks,
> Bartosz
>
> > >
> > > > +
> > > > +static void __exit nct6694_exit(void)
> > > > +{
> > > > +       platform_driver_unregister(&nct6694_gpio_driver);
> > > > +}
> > > > +module_exit(nct6694_exit);
> > > > +
> > > > +MODULE_DESCRIPTION("USB-GPIO controller driver for NCT6694");
> > > > +MODULE_AUTHOR("Ming Yu <tmyu0@nuvoton.com>");
> > > > +MODULE_LICENSE("GPL");
> > > > --
> > > > 2.34.1
> > > >
> > >
> > > Bart

Best regards,
Ming

