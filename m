Return-Path: <linux-i2c+bounces-7567-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E7B9AFBCD
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 10:01:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1310C1C2271C
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 08:01:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C5D01C2DA2;
	Fri, 25 Oct 2024 08:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bDKWiJ+g"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B59199948;
	Fri, 25 Oct 2024 08:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729843249; cv=none; b=R5CjXxag+9aHRG+gQNz9sJg7YfNN3NoxxEubR+domSaEYIMGI+h6KDVaMPXUImaKdAG0kSWGWFBSaynu7pU2aQihKYpyfNRQXO+WXID0vMXnFVzzhKHKtIQy3i3WzRA45CSag6ZqfHNum37AkvX0/8K//2Dz6ulpMEKgtCfj7vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729843249; c=relaxed/simple;
	bh=UzJ4JA6wYnNE2e2wAE1cqDvIoHwljC0uMyvbhZV8y8I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OPBDdy+XQFHSyqnx8ct613ZCRgR2A+UU9kwXqxtyKNrk7H4n2DY48HUYhwR/ZCVl/Z1i+PYPSmshHcajlwiEnzbC3qAVwg1Deukq24+YZnGbuVFWOSqwVU+grlKRzST/7k4iUlNqPMDKQOuX6Ab1+puw+dLi9TEv1yv0+86B3U8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bDKWiJ+g; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e2e32bc454fso1889454276.2;
        Fri, 25 Oct 2024 01:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729843246; x=1730448046; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xP4wphIWdaPagX33UsZlMJ6YTfEiL6bGlCgAvrq+ew=;
        b=bDKWiJ+gn0XBW9ZyEEOtUQFNMKVGeGPArKhwbuX8z6nFEn4AabdJzu55Sa70dVdk85
         ZR2QQpHwLj0XiaoH2B/YgPoYGe0MzuZcJ+9QhparEUbqrC1p+lsgpXmXHdmP5d5ho+S8
         WrY+eisf178xRxiksIEBdrm87LEdh5mcGFNLYPqiocuTCmO9BNyv9nGiyvaj9XxzGPu1
         9Iqx2Iuk5H1ApgOO97nsTgqTYJYJ+ReSuziHilzbnzDQ7Yh9z8G/CQVhzyIWZ33rryy3
         baViqGtSbE+IxCMwpVjoTdAd84pyR17lK/xYxugv1mi4pVHSvi7NPL3csKqcTQJPu0/w
         g0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729843246; x=1730448046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xP4wphIWdaPagX33UsZlMJ6YTfEiL6bGlCgAvrq+ew=;
        b=fN7dkGo6tgwEQCnxJhdEN+NqckdHAWkLo083SKD1cK+Hoxsb7nxd0DuirnNUNdBjOp
         RqH39Me5+WJT9srT9Iv6YG+JMxMtZ4zI7MTUaIqsbEESzuPc50NRrplnqZho2WARRSbi
         +z7+N7uvk5ERzaOTc8UrppxoKOeFxqG+/tB0Jn6Mmngm8rID6eP0WG0CBtYLqHLYk0nw
         TdbB61/8n6BNuaEWyfx6d3FqYEi9msr+gcQB825ZqcTDcGbn68OXpbWE5tfV9HiilWXq
         ZSAxR0Um6z+aIrru4WoLiGBMdCp4+HZ5S9aZxZHcf/1KcIMzpgc46fAwohKBozbWBNFQ
         r0vA==
X-Forwarded-Encrypted: i=1; AJvYcCV+TljSeFm6VwdTQVZc4fww12s77wjQnxtD7xgJ5ApWrsArNR0sRBLpf1LzT4p6LxHMHKtDwjgG7TXfF5eEqFk=@vger.kernel.org, AJvYcCV6uIPh/cfEljaaOsCsVkV3DeIRgZnmjk1hjzsxf0DaeHjsNBkfT4rc1Gl9XVikPwNfmcF2xwqDFxVO@vger.kernel.org, AJvYcCVIOXji2tXMJn3N/JeJ+4CopoqwFs5/YAPm3wvsf+O22qHq+RUUO26GJZci+PN22EeCUs25ubobMoaZhYZO@vger.kernel.org, AJvYcCVn0P4wbeXoUa2nGZYTECtJWQzDvO6M+xrslq+W/s+Xe8sYODz36BqJLfHtvVE5F/07KP96bY9V@vger.kernel.org, AJvYcCW1pbkoQkoRfdk44cOFhyyqXz1bGgJsyZaKHPeOCpatePmZw/fw9PfFFbJFpd0ausQGN/HzChlcNxE=@vger.kernel.org, AJvYcCWBTWwDY3pp0Cf9dCG1+iNIBR2u+AQzUf4Ir2FjKPpgeuKll+FKK8CSTnsvDvqB7Nxt6Ty64kulI4j+@vger.kernel.org, AJvYcCWK271WI3ivJddnPpFweeFWcUQUJlhhqkgeD++V5LjmM2jV05PR6p+tnwpjIB+P1r0r8PClycdxcHbs@vger.kernel.org, AJvYcCXYSOL404PiLC5EDNW6aMGDr4IO8wG1zu14MtbCOIzGjdi0r3+K6G3nhs74WqbXaInDAni81gP3yaVnEA==@vger.kernel.org, AJvYcCXaYcvQERB5ZEpQkQ6RSo74ZKlezJuuNP8UB+gAaqunEe3n3XVPcaSTpbgy5o4BJjej3zUzo2SYdHRI@vger.kernel.org, AJvYcCXnT3LCn03FlBu4BrF4qnBvZw7u1VmXEq/I
 Pmqz0dkjTrXw+X33YIW/C23BMC+Bg7VeONR/5HvulrIPLyc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzFoRjLyFjh/AiDT3cmsSulAsZDb0IamZuunb5O2T1hdPgN2qi
	qJkyCom20k2VScNfaZdVCmm1Mnf1Q2my4V8wvWMR3JBr0nNHrnaxIG+fVoUD44eVphYP3RHBppo
	skzKpnBPByOGiaip238Ft4KKFiuk=
X-Google-Smtp-Source: AGHT+IG135JrFzLujlfWufoz+Ipikom2TQ/YmGc5fQPhpTafBBZL0I0pzwrO2u4tm5krGs+xLbPkdWLxc4PyFOnUZKc=
X-Received: by 2002:a05:6902:2505:b0:e29:68db:ccc2 with SMTP id
 3f1490d57ef6-e2f2fbc0c20mr4885350276.38.1729843246281; Fri, 25 Oct 2024
 01:00:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241024085922.133071-1-tmyu0@nuvoton.com> <20241024085922.133071-2-tmyu0@nuvoton.com>
 <20241024-daffodil-raccoon-of-champagne-6f6f04-mkl@pengutronix.de>
In-Reply-To: <20241024-daffodil-raccoon-of-champagne-6f6f04-mkl@pengutronix.de>
From: Ming Yu <a0282524688@gmail.com>
Date: Fri, 25 Oct 2024 16:00:35 +0800
Message-ID: <CAOoeyxV+xFE2wjSFEdBAzV9mcUn7wf-kCJTA=FgW2thsDmwmyQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/9] mfd: Add core driver for Nuvoton NCT6694
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	jic23@kernel.org, lars@metafoo.de, ukleinek@kernel.org, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry, resending this email in plain text format.

Dear Marc,

Thank you for your comments.
I'll add the nct6694_free_handler() function in the next patch.

Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2024=E5=B9=B410=E6=9C=8824=
=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=885:12=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 24.10.2024 16:59:14, Ming Yu wrote:
> > The Nuvoton NCT6694 is a peripheral expander with 16 GPIO chips,
> > 6 I2C controllers, 2 CANfd controllers, 2 Watchdog timers, ADC,
> > PWM, and RTC.
> >
> > This driver implements USB device functionality and shares the
> > chip's peripherals as a child device.
> >
> > Each child device can use the USB functions nct6694_read_msg()
> > and nct6694_write_msg() to issue a command. They can also register
> > a handler function that will be called when the USB device receives
> > its interrupt pipe.
> >
> > Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> > ---
> >  MAINTAINERS                 |   7 +
> >  drivers/mfd/Kconfig         |  10 +
> >  drivers/mfd/Makefile        |   2 +
> >  drivers/mfd/nct6694.c       | 394 ++++++++++++++++++++++++++++++++++++
> >  include/linux/mfd/nct6694.h | 168 +++++++++++++++
> >  5 files changed, 581 insertions(+)
> >  create mode 100644 drivers/mfd/nct6694.c
> >  create mode 100644 include/linux/mfd/nct6694.h
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index e9659a5a7fb3..30157ca95cf3 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -16434,6 +16434,13 @@ F:   drivers/nubus/
> >  F:   include/linux/nubus.h
> >  F:   include/uapi/linux/nubus.h
> >
> > +NUVOTON NCT6694 MFD DRIVER
> > +M:   Ming Yu <tmyu0@nuvoton.com>
> > +L:   linux-kernel@vger.kernel.org
> > +S:   Supported
> > +F:   drivers/mfd/nct6694.c
> > +F:   include/linux/mfd/nct6694.h
> > +
> >  NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
> >  M:   Antonino Daplas <adaplas@gmail.com>
> >  L:   linux-fbdev@vger.kernel.org
> > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > index f9325bcce1b9..da2600958697 100644
> > --- a/drivers/mfd/Kconfig
> > +++ b/drivers/mfd/Kconfig
> > @@ -546,6 +546,16 @@ config MFD_MX25_TSADC
> >         i.MX25 processors. They consist of a conversion queue for gener=
al
> >         purpose ADC and a queue for Touchscreens.
> >
> > +config MFD_NCT6694
> > +     tristate "Nuvoton NCT6694 support"
> > +     select MFD_CORE
> > +     depends on USB
> > +     help
> > +       This adds support for Nuvoton USB device NCT6694 sharing periph=
erals
> > +       This includes the USB devcie driver and core APIs.
> > +       Additional drivers must be enabled in order to use the function=
ality
> > +       of the device.
> > +
> >  config MFD_HI6421_PMIC
> >       tristate "HiSilicon Hi6421 PMU/Codec IC"
> >       depends on OF
> > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > index 2a9f91e81af8..2cf816d67d03 100644
> > --- a/drivers/mfd/Makefile
> > +++ b/drivers/mfd/Makefile
> > @@ -116,6 +116,8 @@ obj-$(CONFIG_TWL6040_CORE)        +=3D twl6040.o
> >
> >  obj-$(CONFIG_MFD_MX25_TSADC) +=3D fsl-imx25-tsadc.o
> >
> > +obj-$(CONFIG_MFD_NCT6694)    +=3D nct6694.o
> > +
> >  obj-$(CONFIG_MFD_MC13XXX)    +=3D mc13xxx-core.o
> >  obj-$(CONFIG_MFD_MC13XXX_SPI)        +=3D mc13xxx-spi.o
> >  obj-$(CONFIG_MFD_MC13XXX_I2C)        +=3D mc13xxx-i2c.o
> > diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
> > new file mode 100644
> > index 000000000000..9838c7be0b98
> > --- /dev/null
> > +++ b/drivers/mfd/nct6694.c
> > @@ -0,0 +1,394 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Nuvoton NCT6694 MFD driver based on USB interface.
> > + *
> > + * Copyright (C) 2024 Nuvoton Technology Corp.
> > + */
> > +
> > +#include <linux/io.h>
> > +#include <linux/usb.h>
> > +#include <linux/slab.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/mfd/core.h>
> > +#include <linux/mfd/nct6694.h>
> > +
> > +#define DRVNAME "nct6694-usb_mfd"
> > +
> > +#define MFD_DEV_SIMPLE(_name)                \
> > +{                                    \
> > +     .name =3D NCT6694_DEV_##_name,    \
> > +}                                    \
> > +
> > +#define MFD_DEV_WITH_ID(_name, _id)  \
> > +{                                    \
> > +     .name =3D NCT6694_DEV_##_name,    \
> > +     .id =3D _id,                      \
> > +}
> > +
> > +/* MFD device resources */
> > +static const struct mfd_cell nct6694_dev[] =3D {
> > +     MFD_DEV_WITH_ID(GPIO, 0x0),
> > +     MFD_DEV_WITH_ID(GPIO, 0x1),
> > +     MFD_DEV_WITH_ID(GPIO, 0x2),
> > +     MFD_DEV_WITH_ID(GPIO, 0x3),
> > +     MFD_DEV_WITH_ID(GPIO, 0x4),
> > +     MFD_DEV_WITH_ID(GPIO, 0x5),
> > +     MFD_DEV_WITH_ID(GPIO, 0x6),
> > +     MFD_DEV_WITH_ID(GPIO, 0x7),
> > +     MFD_DEV_WITH_ID(GPIO, 0x8),
> > +     MFD_DEV_WITH_ID(GPIO, 0x9),
> > +     MFD_DEV_WITH_ID(GPIO, 0xA),
> > +     MFD_DEV_WITH_ID(GPIO, 0xB),
> > +     MFD_DEV_WITH_ID(GPIO, 0xC),
> > +     MFD_DEV_WITH_ID(GPIO, 0xD),
> > +     MFD_DEV_WITH_ID(GPIO, 0xE),
> > +     MFD_DEV_WITH_ID(GPIO, 0xF),
> > +
> > +     MFD_DEV_WITH_ID(I2C, 0x0),
> > +     MFD_DEV_WITH_ID(I2C, 0x1),
> > +     MFD_DEV_WITH_ID(I2C, 0x2),
> > +     MFD_DEV_WITH_ID(I2C, 0x3),
> > +     MFD_DEV_WITH_ID(I2C, 0x4),
> > +     MFD_DEV_WITH_ID(I2C, 0x5),
> > +
> > +     MFD_DEV_WITH_ID(CAN, 0x0),
> > +     MFD_DEV_WITH_ID(CAN, 0x1),
> > +
> > +     MFD_DEV_WITH_ID(WDT, 0x0),
> > +     MFD_DEV_WITH_ID(WDT, 0x1),
> > +
> > +     MFD_DEV_SIMPLE(IIO),
> > +     MFD_DEV_SIMPLE(HWMON),
> > +     MFD_DEV_SIMPLE(PWM),
> > +     MFD_DEV_SIMPLE(RTC),
> > +};
> > +
> > +int nct6694_register_handler(struct nct6694 *nct6694, int irq_bit,
> > +                          void (*handler)(void *), void *private_data)
> > +{
> > +     struct nct6694_handler_entry *entry;
> > +     unsigned long flags;
> > +
> > +     entry =3D kmalloc(sizeof(*entry), GFP_KERNEL);
> > +     if (!entry)
> > +             return -ENOMEM;
> > +
> > +     entry->irq_bit =3D irq_bit;
> > +     entry->handler =3D handler;
> > +     entry->private_data =3D private_data;
> > +
> > +     spin_lock_irqsave(&nct6694->lock, flags);
> > +     list_add_tail(&entry->list, &nct6694->handler_list);
> > +     spin_unlock_irqrestore(&nct6694->lock, flags);
> > +
> > +     return 0;
> > +}
> > +EXPORT_SYMBOL(nct6694_register_handler);
>
> Where's the corresponding nct6694_free_handler() function?
>
> Marc
>
> --
> Pengutronix e.K.                 | Marc Kleine-Budde          |
> Embedded Linux                   | https://www.pengutronix.de |
> Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
> Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

