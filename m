Return-Path: <linux-i2c+bounces-10728-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 480FAAA688C
	for <lists+linux-i2c@lfdr.de>; Fri,  2 May 2025 04:02:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D9971BA2FBE
	for <lists+linux-i2c@lfdr.de>; Fri,  2 May 2025 02:03:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F07815D5B6;
	Fri,  2 May 2025 02:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EU28/AWn"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2753328399;
	Fri,  2 May 2025 02:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746151360; cv=none; b=WWHmU4Ya2ri++1aXB5+praDOskV9eoccOQZghv/qPKWFCqBenm3yKfUDcwrNbj5Af3cV39JJmfkzPARUU2Ew5GFf/blVijHRj5xP7c4P0QvqYPYYQuRPlUBrd07T5cu9elvn4XGmwnMH1lWJEZdBhAxObFzmY81KBF3chrfGGOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746151360; c=relaxed/simple;
	bh=WFIslJioSfp16ua+qZTbywJ4SmclU9/IiJmNTlNX/aE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bM/V/wjJb6thOgjuJDlNV2JN2/f7fM8v3fN4p2gQ2yGhjjr4FKKzxtTYh4/wuD9bzEvvyFmiqXOHbA8MfCH7kuBLAENCzaT22vSo4cD02Gpet5qrgDAQhfJSMZwY3lPYRMNMreV3aRbkFPYYqcbUtz1qwrSIAkd+0wRO8zVbAyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EU28/AWn; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6fece18b3c8so14980967b3.3;
        Thu, 01 May 2025 19:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746151357; x=1746756157; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYO58rOsdpyI/iU2X0fDrr33AaWJrd9SHJuJ2jBf7Ig=;
        b=EU28/AWnJetBPogNkwQ9Z1DuJy4g2MJrUDsB/HKgaMoJckPjwqqjdcmwPZWTbtPIvE
         huHOdPHbCcyL0+PLFu/6PXzxP5Fur9MvZbn7jDYyc+J5QnW1FX6Q93naWvVwLmHqYAKp
         tOqm6vGASQ92cPlr7MRTOKfaTQgAXIiJzwY8QVFUCwUjSZmAVB32bAzlRmi3+lVsCF1Z
         W761IuRRtKwfj9bACbia16LdyKlqbmfnEqnwge9BPuXlSEiHBNoPJdyKUrd7qgqQJqE1
         0hMKHrWLedx3S2vPPw1yVuyuT56O1huFdkRq9u2b5hsG0nGyj6MfC03aT5FwY56R+N8u
         LGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746151357; x=1746756157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DYO58rOsdpyI/iU2X0fDrr33AaWJrd9SHJuJ2jBf7Ig=;
        b=a3mSKHSpMvv1qSmpBHLW+9dt1YlRbsyOAUmNkAfgHtw2+rvo1cD4Rljfjo9N+XUjcp
         KnMTHicTJTvoUaxbRtStQq+bOqFlMp7P/EZ686Vyvz9lXWz/dwVGdEV61T7NzDiOsDE6
         oPHNtjHolIjMCiBnyBnW5SZBa5mvUthgU/YNESJ/CEK2XGVJE6qlLV2xJWcOkltzPT3k
         U4oH+Umt+GDqLcE8H5Mv4dFlTw4eIbT/q3+XR8Px/x5KwmzxqVrRZRIQmvMGLOWandRd
         yhRJ5ymWCm4UU+GCR5TVutc9JWMnIHo/QMLJFzo3SmK80sTPzWL2WrXxVHeuxgl863yA
         ENww==
X-Forwarded-Encrypted: i=1; AJvYcCVCAdxtVpaIV6pha5FmUHmHipf+S7gT0z79vPdBHDyUdknkFAgJeVai3HCYtxitq+WcxIzCl8aNfyiEsw==@vger.kernel.org, AJvYcCVcUltEsfToMbUxMaOg4p/ceERLICuTJM/57va8B8/B9CXhpuKW9sboQu7KWJmLFpv4VZaATp82I5vS2Fc=@vger.kernel.org, AJvYcCVeY0oeXKAZw0e7M7AG4Fjpnzbhdv7XajoVX5nvbJuMro6FYWYSPrPA5ZKr4hO4LP3LPLBVU0YgCgA=@vger.kernel.org, AJvYcCVxB26LeKgbnY3bDagV0GPmrIz8V6xnzB6rFgqO83gUYso2rukB4EcUF1vLrID/jbP9JiHy0ECKGcwA@vger.kernel.org, AJvYcCXHT+bPh1rAG7B2vwQcary+sMS9Ggn+u63hndszG2LjPD1aR41teJiJwKPlNMIdcBWfjdG3euzz+PXKrt+WjeA=@vger.kernel.org, AJvYcCXPhcgmPWB8AK68aCjRRRnO/ua1k4pWoZr54K/oSInfRobae6BwkYcI/yt+OIpaXXKgwXHeUmY8r+M/@vger.kernel.org, AJvYcCXWjCmjjNxsKUQYr+pLu13jXMFYW2x3xZd5zs87Rl5GkWyJoggkzAOImwukvJp7/PE5CAmA153ypcR1@vger.kernel.org, AJvYcCXiKcNl8ojnWbq0Ri+9iMH3lY1sCjAIMqJKN9FburFdQjCwHXYjADq6cbyQCIfBinyv6IvmIsB5Kd01pAoK@vger.kernel.org, AJvYcCXpSDan4YKmykrZDoM+8v3Rgzztnd0cBJoBCIZbSp2Ew1ivKzEQVNdE39x3vMdjtRUA/Wj4YKui@vger.kernel.org
X-Gm-Message-State: AOJu0YxrA3n0kosz14aNntjtKaOpQoI0A6AeT/0X8e0QW0eL+O9wd2xr
	YkbQii0VXgCjNJmaAkRX/QFoUKQbefTiVtlCeVbQR1FQ6TcS5A06Q1guQSQ4BCphAg3r33P1s5a
	fr9cTjx3r7NTpqsBJWKN/bcM38C8=
X-Gm-Gg: ASbGncu/iCadAIpmjBYk6fz63gXgtOHWdPzzBx2pTNY6sf02KMMyWgMjoFnqJjkHFm8
	uU1+GyvNWB6kHM6d30fwgMvZFCoseb0y7Ux1YDz8b3EAt+m/7YoXyBkY65RdM9OjQPO2J1PXYkv
	5c+SMEqS8yqYviVvcKzEBR9hO6lE/O2/kkxzKbzX2FCcpsil2jIdlhAw==
X-Google-Smtp-Source: AGHT+IHr+rKKb53zVLiIgjhUTVJnJS9W1qDrbhgo4+4xB0esaIleCKAWrLmcOzH+kL0/0Yk6h/xUJTMtcjFp0KzLSQo=
X-Received: by 2002:a05:690c:45ca:b0:6f9:aecf:ab0d with SMTP id
 00721157ae682-708cedf5b0cmr21178737b3.27.1746151356806; Thu, 01 May 2025
 19:02:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423094058.1656204-1-tmyu0@nuvoton.com> <20250423094058.1656204-2-tmyu0@nuvoton.com>
 <20250501122214.GK1567507@google.com>
In-Reply-To: <20250501122214.GK1567507@google.com>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 2 May 2025 10:02:25 +0800
X-Gm-Features: ATxdqUE1o07230cp-7wqHkY2LvpWboRayXw--L2KFV94ALmJUnY7RSOaEEn5Q3c
Message-ID: <CAOoeyxVL2MV83CJaYCXMiw0b5YUzk728H4B9GY1q9h_P8D43fg@mail.gmail.com>
Subject: Re: [PATCH v10 1/7] mfd: Add core driver for Nuvoton NCT6694
To: Lee Jones <lee@kernel.org>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org, 
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org, 
	Ming Yu <tmyu0@nuvoton.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Lee,

Thank you for your review. I have a few questions and would appreciate
your advice.

Lee Jones <lee@kernel.org> =E6=96=BC 2025=E5=B9=B45=E6=9C=881=E6=97=A5 =E9=
=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=888:22=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Wed, 23 Apr 2025, a0282524688@gmail.com wrote:
>
> > From: Ming Yu <tmyu0@nuvoton.com>
> >
> > The Nuvoton NCT6694 provides an USB interface to the host to
> > access its features.
> >
> > Sub-devices can use the USB functions nct6694_read_msg() and
> > nct6694_write_msg() to issue a command. They can also request
> > interrupt that will be called when the USB device receives its
> > interrupt pipe.
> >
> > Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> > ---
>
> v10 and no change log?  Please add a change log.
>

The change log is currently available at
https://patchwork.ozlabs.org/project/rtc-linux/cover/20250423094058.1656204=
-1-tmyu0@nuvoton.com/
I will move the relevant entries into each individual patch in the
next revision.

> >  MAINTAINERS                 |   6 +
> >  drivers/mfd/Kconfig         |  15 ++
> >  drivers/mfd/Makefile        |   2 +
> >  drivers/mfd/nct6694.c       | 387 ++++++++++++++++++++++++++++++++++++
> >  include/linux/mfd/nct6694.h | 101 ++++++++++
> >  5 files changed, 511 insertions(+)
> >  create mode 100644 drivers/mfd/nct6694.c
> >  create mode 100644 include/linux/mfd/nct6694.h
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index fa1e04e87d1d..b2dfcc063f88 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -17358,6 +17358,12 @@ F:   drivers/nubus/
> >  F:   include/linux/nubus.h
> >  F:   include/uapi/linux/nubus.h
> >
> > +NUVOTON NCT6694 MFD DRIVER
> > +M:   Ming Yu <tmyu0@nuvoton.com>
> > +S:   Supported
> > +F:   drivers/mfd/nct6694.c
> > +F:   include/linux/mfd/nct6694.h
> > +
> >  NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
> >  M:   Antonino Daplas <adaplas@gmail.com>
> >  L:   linux-fbdev@vger.kernel.org
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index 22b936310039..cd4d826a7fcb 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -1058,6 +1058,21 @@ config MFD_MENF21BMC
> >         This driver can also be built as a module. If so the module
> >         will be called menf21bmc.
> >
> > +config MFD_NCT6694
> > +     tristate "Nuvoton NCT6694 support"
> > +     select MFD_CORE
> > +     depends on USB
> > +     help
> > +       This enables support for the Nuvoton USB device NCT6694, which =
shares
> > +       peripherals.
> > +       The Nuvoton NCT6694 is a peripheral expander with 16 GPIO chips=
,
> > +       6 I2C controllers, 2 CANfd controllers, 2 Watchdog timers, ADC,
> > +       PWM, and RTC.
> > +       This driver provides core APIs to access the NCT6694 hardware
> > +       monitoring and control features.
> > +       Additional drivers must be enabled to utilize the specific
> > +       functionalities of the device.
> > +
> >  config MFD_OCELOT
> >       tristate "Microsemi Ocelot External Control Support"
> >       depends on SPI_MASTER
> > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > index 948cbdf42a18..471dc1f183b8 100644
> > --- a/drivers/mfd/Makefile
> > +++ b/drivers/mfd/Makefile
> > @@ -120,6 +120,8 @@ obj-$(CONFIG_MFD_MC13XXX) +=3D mc13xxx-core.o
> >  obj-$(CONFIG_MFD_MC13XXX_SPI)        +=3D mc13xxx-spi.o
> >  obj-$(CONFIG_MFD_MC13XXX_I2C)        +=3D mc13xxx-i2c.o
> >
> > +obj-$(CONFIG_MFD_NCT6694)    +=3D nct6694.o
> > +
> >  obj-$(CONFIG_MFD_CORE)               +=3D mfd-core.o
> >
> >  ocelot-soc-objs                      :=3D ocelot-core.o ocelot-spi.o
> > diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
> > new file mode 100644
> > index 000000000000..2480ca56f350
> > --- /dev/null
> > +++ b/drivers/mfd/nct6694.c
> > @@ -0,0 +1,387 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2024 Nuvoton Technology Corp.
> > + *
> > + * Nuvoton NCT6694 core driver using USB interface to provide
> > + * access to the NCT6694 hardware monitoring and control features.
> > + *
> > + * The NCT6694 is an integrated controller that provides GPIO, I2C,
> > + * CAN, WDT, HWMON and RTC management.
> > + *
>
> Superfluous blank line.
>

Remove it in v11.

> > + */
> > +
> > +#include <linux/bits.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/irq.h>
> > +#include <linux/irqdomain.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/mfd/nct6694.h>
> > +#include <linux/module.h>
> > +#include <linux/slab.h>
> > +#include <linux/usb.h>
> > +
> > +static const struct mfd_cell nct6694_devs[] =3D {
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0),
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 1),
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 2),
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 3),
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 4),
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 5),
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 6),
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 7),
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 8),
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 9),
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 10),
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 11),
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 12),
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 13),
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 14),
> > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 15),
>
> These are all identical.
>
> I thought you were going to use PLATFORM_DEVID_AUTO?  In fact, you are
> already using PLATFORM_DEVID_AUTO since you are calling
> mfd_add_hotplug_devices().  So you don't need this IDs.
>
> MFD_CELL_NAME() should do.
>

Yes, it uses PLATFORM_DEVID_AUTO, but in my implementation, the
sub-devices use cell->id instead of platform_device->id, so it doesn't
affect the current behavior.
However, if you think there's a better approach or that this should be
changed for consistency or correctness, I'm happy to update it, please
let me know your recommendation.

When using MFD_CELL_NAME(), the platform_device->id for the GPIO
devices is assigned values from 1 to 16, and for the I2C devices from
1 to 6, but I need the ID offset to start from 0 instead.

> > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 0),
> > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 1),
> > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 2),
> > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 3),
> > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 4),
> > +     MFD_CELL_BASIC("nct6694-i2c", NULL, NULL, 0, 5),
> > +
> > +     MFD_CELL_BASIC("nct6694-canfd", NULL, NULL, 0, 0),
> > +     MFD_CELL_BASIC("nct6694-canfd", NULL, NULL, 0, 1),
> > +
> > +     MFD_CELL_BASIC("nct6694-wdt", NULL, NULL, 0, 0),
> > +     MFD_CELL_BASIC("nct6694-wdt", NULL, NULL, 0, 1),
> > +
> > +     MFD_CELL_NAME("nct6694-hwmon"),
> > +     MFD_CELL_NAME("nct6694-rtc"),
> > +};
>
> [...]
>
> > diff --git a/include/linux/mfd/nct6694.h b/include/linux/mfd/nct6694.h
> > new file mode 100644
> > index 000000000000..7a02e5b14bbb
> > --- /dev/null
> > +++ b/include/linux/mfd/nct6694.h
> > @@ -0,0 +1,101 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (C) 2024 Nuvoton Technology Corp.
> > + *
> > + * Nuvoton NCT6694 USB transaction and data structure.
> > + *
>
> Remove this line please.
>

Remove it in v11.

> > + */
> > +
> > +#ifndef __MFD_NCT6694_H
> > +#define __MFD_NCT6694_H
> > +
> > +#define NCT6694_VENDOR_ID    0x0416
> > +#define NCT6694_PRODUCT_ID   0x200B
> > +#define NCT6694_INT_IN_EP    0x81
> > +#define NCT6694_BULK_IN_EP   0x02
> > +#define NCT6694_BULK_OUT_EP  0x03
> > +
> > +#define NCT6694_HCTRL_SET    0x40
> > +#define NCT6694_HCTRL_GET    0x80
> > +
> > +#define NCT6694_URB_TIMEOUT  1000
> > +
> > +enum nct6694_irq_id {
> > +     NCT6694_IRQ_GPIO0 =3D 0,
> > +     NCT6694_IRQ_GPIO1,
> > +     NCT6694_IRQ_GPIO2,
> > +     NCT6694_IRQ_GPIO3,
> > +     NCT6694_IRQ_GPIO4,
> > +     NCT6694_IRQ_GPIO5,
> > +     NCT6694_IRQ_GPIO6,
> > +     NCT6694_IRQ_GPIO7,
> > +     NCT6694_IRQ_GPIO8,
> > +     NCT6694_IRQ_GPIO9,
> > +     NCT6694_IRQ_GPIOA,
> > +     NCT6694_IRQ_GPIOB,
> > +     NCT6694_IRQ_GPIOC,
> > +     NCT6694_IRQ_GPIOD,
> > +     NCT6694_IRQ_GPIOE,
> > +     NCT6694_IRQ_GPIOF,
> > +     NCT6694_IRQ_CAN0,
> > +     NCT6694_IRQ_CAN1,
> > +     NCT6694_IRQ_RTC,
> > +     NCT6694_NR_IRQS,
> > +};
> > +
> > +enum nct6694_response_err_status {
> > +     NCT6694_NO_ERROR =3D 0,
> > +     NCT6694_FORMAT_ERROR,
> > +     NCT6694_RESERVED1,
> > +     NCT6694_RESERVED2,
> > +     NCT6694_NOT_SUPPORT_ERROR,
> > +     NCT6694_NO_RESPONSE_ERROR,
> > +     NCT6694_TIMEOUT_ERROR,
> > +     NCT6694_PENDING,
> > +};
> > +
> > +struct __packed nct6694_cmd_header {
> > +     u8 rsv1;
> > +     u8 mod;
> > +     union __packed {
> > +             __le16 offset;
> > +             struct __packed {
> > +                     u8 cmd;
> > +                     u8 sel;
> > +             };
> > +     };
> > +     u8 hctrl;
> > +     u8 rsv2;
> > +     __le16 len;
> > +};
> > +
> > +struct __packed nct6694_response_header {
> > +     u8 sequence_id;
> > +     u8 sts;
> > +     u8 reserved[4];
> > +     __le16 len;
> > +};
> > +
> > +union __packed nct6694_usb_msg {
> > +     struct nct6694_cmd_header cmd_header;
> > +     struct nct6694_response_header response_header;
> > +};
> > +
> > +struct nct6694 {
> > +     struct device *dev;
> > +     struct irq_domain *domain;
> > +     /* Mutex to protect access to the device */
>
> Place these single line comments on the end of the line you're commenting=
.
>
> Actually, considering the nomenclature here, they're probably not
> required at all.
>

Remove these in v11.

> > +     struct mutex access_lock;
> > +     /* Mutex to protect access to the IRQ */
> > +     struct mutex irq_lock;
> > +     struct urb *int_in_urb;
> > +     struct usb_device *udev;
> > +     union nct6694_usb_msg *usb_msg;
> > +     unsigned char *int_buffer;
> > +     unsigned int irq_enable;
> > +};
> > +
> > +int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd=
_header *cmd_hd, void *buf);
> > +int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cm=
d_header *cmd_hd, void *buf);
> > +
> > +#endif
> > --
> > 2.34.1
> >
>


Best regards,
Ming

