Return-Path: <linux-i2c+bounces-10730-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C58AA6C45
	for <lists+linux-i2c@lfdr.de>; Fri,  2 May 2025 10:08:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4AE5B9C0335
	for <lists+linux-i2c@lfdr.de>; Fri,  2 May 2025 08:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ACD52690F7;
	Fri,  2 May 2025 08:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tU1Qbrfh"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA5A2686A2;
	Fri,  2 May 2025 08:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746173282; cv=none; b=PAhYGDf3gt62Psl1gJpALA5BjhFBvy+54SzVwZfTmPNJWB6lwXQEBMP4os0cBdJdvPYknx8tegMNp44jRUlH4NUdkIt2raNT+oODE5Thr2vT64uCetD9ThZSO8D6rnVirumL8BLP1CezKZNtWPqldw2Q/r6Bh/7Q3tyarNDnUZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746173282; c=relaxed/simple;
	bh=HklTXZPltUxBCBjY4Xi5FkFvWcIxA/hBpduMGYDplmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YefjTX+bWCU/nFiZAdBHLgFnUTmmLDMrDtj3po9czQznHs/zwxZGBfU1joTWy1H9XzSVifbgfCa/oFgcABEHpJhfA84ZXSMtsjGF++dJw7aVmWv793vcJm8gd5y0b7AALap9OoYMZK9BqzMYepsDXR5qYwa4UGvsxXEdKdJVHT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tU1Qbrfh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 044A9C4CEE4;
	Fri,  2 May 2025 08:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746173281;
	bh=HklTXZPltUxBCBjY4Xi5FkFvWcIxA/hBpduMGYDplmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tU1QbrfhcB1uCjK5n/IhiecqACo7NAkJRcgIcWqKnuOUpm7NYqmlGfjbQcpMYJx+E
	 hhMOEfb9blUQr6lt9INZ66BOljxrmvKeL8fIjUhnjcpgFSmOV7AB/q39G+okJSuS6a
	 y/wndusPcCgmR/v4ASRAsefDCNvjGLsz4OeQTOp/Tw+PaQZwwHDBQyct/54FqLX7rd
	 9buq/G9hLnApvLK9Ct4l9Pvl4ucBPwnFYElshWaSM28EE/V/sasa3gbhGUxJXEJfzS
	 CZofeCroOMkRnV6ajSJ3N/sOs9Sv1QnT/sbRdM43kMzfrzKZU+ri3DGQNzOYrZzlEb
	 sUEZEDhoJ9/tg==
Date: Fri, 2 May 2025 09:07:54 +0100
From: Lee Jones <lee@kernel.org>
To: Ming Yu <a0282524688@gmail.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org,
	mkl@pengutronix.de, mailhol.vincent@wanadoo.fr,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, wim@linux-watchdog.org,
	linux@roeck-us.net, jdelvare@suse.com,
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-can@vger.kernel.org, netdev@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org,
	Ming Yu <tmyu0@nuvoton.com>
Subject: Re: [PATCH v10 1/7] mfd: Add core driver for Nuvoton NCT6694
Message-ID: <20250502080754.GD3865826@google.com>
References: <20250423094058.1656204-1-tmyu0@nuvoton.com>
 <20250423094058.1656204-2-tmyu0@nuvoton.com>
 <20250501122214.GK1567507@google.com>
 <CAOoeyxVL2MV83CJaYCXMiw0b5YUzk728H4B9GY1q9h_P8D43fg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOoeyxVL2MV83CJaYCXMiw0b5YUzk728H4B9GY1q9h_P8D43fg@mail.gmail.com>

On Fri, 02 May 2025, Ming Yu wrote:

> Dear Lee,
> 
> Thank you for your review. I have a few questions and would appreciate
> your advice.
> 
> Lee Jones <lee@kernel.org> 於 2025年5月1日 週四 下午8:22寫道：
> >
> > On Wed, 23 Apr 2025, a0282524688@gmail.com wrote:
> >
> > > From: Ming Yu <tmyu0@nuvoton.com>
> > >
> > > The Nuvoton NCT6694 provides an USB interface to the host to
> > > access its features.
> > >
> > > Sub-devices can use the USB functions nct6694_read_msg() and
> > > nct6694_write_msg() to issue a command. They can also request
> > > interrupt that will be called when the USB device receives its
> > > interrupt pipe.
> > >
> > > Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> > > ---
> >
> > v10 and no change log?  Please add a change log.
> >
> 
> The change log is currently available at
> https://patchwork.ozlabs.org/project/rtc-linux/cover/20250423094058.1656204-1-tmyu0@nuvoton.com/
> I will move the relevant entries into each individual patch in the
> next revision.
> 
> > >  MAINTAINERS                 |   6 +
> > >  drivers/mfd/Kconfig         |  15 ++
> > >  drivers/mfd/Makefile        |   2 +
> > >  drivers/mfd/nct6694.c       | 387 ++++++++++++++++++++++++++++++++++++
> > >  include/linux/mfd/nct6694.h | 101 ++++++++++
> > >  5 files changed, 511 insertions(+)
> > >  create mode 100644 drivers/mfd/nct6694.c
> > >  create mode 100644 include/linux/mfd/nct6694.h
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index fa1e04e87d1d..b2dfcc063f88 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -17358,6 +17358,12 @@ F:   drivers/nubus/
> > >  F:   include/linux/nubus.h
> > >  F:   include/uapi/linux/nubus.h
> > >
> > > +NUVOTON NCT6694 MFD DRIVER
> > > +M:   Ming Yu <tmyu0@nuvoton.com>
> > > +S:   Supported
> > > +F:   drivers/mfd/nct6694.c
> > > +F:   include/linux/mfd/nct6694.h
> > > +
> > >  NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
> > >  M:   Antonino Daplas <adaplas@gmail.com>
> > >  L:   linux-fbdev@vger.kernel.org
> > > diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> > > index 22b936310039..cd4d826a7fcb 100644
> > > --- a/drivers/mfd/Kconfig
> > > +++ b/drivers/mfd/Kconfig
> > > @@ -1058,6 +1058,21 @@ config MFD_MENF21BMC
> > >         This driver can also be built as a module. If so the module
> > >         will be called menf21bmc.
> > >
> > > +config MFD_NCT6694
> > > +     tristate "Nuvoton NCT6694 support"
> > > +     select MFD_CORE
> > > +     depends on USB
> > > +     help
> > > +       This enables support for the Nuvoton USB device NCT6694, which shares
> > > +       peripherals.
> > > +       The Nuvoton NCT6694 is a peripheral expander with 16 GPIO chips,
> > > +       6 I2C controllers, 2 CANfd controllers, 2 Watchdog timers, ADC,
> > > +       PWM, and RTC.
> > > +       This driver provides core APIs to access the NCT6694 hardware
> > > +       monitoring and control features.
> > > +       Additional drivers must be enabled to utilize the specific
> > > +       functionalities of the device.
> > > +
> > >  config MFD_OCELOT
> > >       tristate "Microsemi Ocelot External Control Support"
> > >       depends on SPI_MASTER
> > > diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> > > index 948cbdf42a18..471dc1f183b8 100644
> > > --- a/drivers/mfd/Makefile
> > > +++ b/drivers/mfd/Makefile
> > > @@ -120,6 +120,8 @@ obj-$(CONFIG_MFD_MC13XXX) += mc13xxx-core.o
> > >  obj-$(CONFIG_MFD_MC13XXX_SPI)        += mc13xxx-spi.o
> > >  obj-$(CONFIG_MFD_MC13XXX_I2C)        += mc13xxx-i2c.o
> > >
> > > +obj-$(CONFIG_MFD_NCT6694)    += nct6694.o
> > > +
> > >  obj-$(CONFIG_MFD_CORE)               += mfd-core.o
> > >
> > >  ocelot-soc-objs                      := ocelot-core.o ocelot-spi.o
> > > diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
> > > new file mode 100644
> > > index 000000000000..2480ca56f350
> > > --- /dev/null
> > > +++ b/drivers/mfd/nct6694.c
> > > @@ -0,0 +1,387 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (C) 2024 Nuvoton Technology Corp.
> > > + *
> > > + * Nuvoton NCT6694 core driver using USB interface to provide
> > > + * access to the NCT6694 hardware monitoring and control features.
> > > + *
> > > + * The NCT6694 is an integrated controller that provides GPIO, I2C,
> > > + * CAN, WDT, HWMON and RTC management.
> > > + *
> >
> > Superfluous blank line.
> >
> 
> Remove it in v11.
> 
> > > + */
> > > +
> > > +#include <linux/bits.h>
> > > +#include <linux/interrupt.h>
> > > +#include <linux/irq.h>
> > > +#include <linux/irqdomain.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/mfd/core.h>
> > > +#include <linux/mfd/nct6694.h>
> > > +#include <linux/module.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/usb.h>
> > > +
> > > +static const struct mfd_cell nct6694_devs[] = {
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 0),
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 1),
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 2),
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 3),
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 4),
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 5),
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 6),
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 7),
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 8),
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 9),
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 10),
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 11),
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 12),
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 13),
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 14),
> > > +     MFD_CELL_BASIC("nct6694-gpio", NULL, NULL, 0, 15),
> >
> > These are all identical.
> >
> > I thought you were going to use PLATFORM_DEVID_AUTO?  In fact, you are
> > already using PLATFORM_DEVID_AUTO since you are calling
> > mfd_add_hotplug_devices().  So you don't need this IDs.
> >
> > MFD_CELL_NAME() should do.
> >
> 
> Yes, it uses PLATFORM_DEVID_AUTO, but in my implementation, the
> sub-devices use cell->id instead of platform_device->id, so it doesn't
> affect the current behavior.
> However, if you think there's a better approach or that this should be
> changed for consistency or correctness, I'm happy to update it, please
> let me know your recommendation.
> 
> When using MFD_CELL_NAME(), the platform_device->id for the GPIO
> devices is assigned values from 1 to 16, and for the I2C devices from
> 1 to 6, but I need the ID offset to start from 0 instead.

Oh no, don't do that.  mfd_cell isn't supposed to be used outside of MFD.

Just use the platform_device id-- if you really need to start from 0.

As an aside, I'm surprised numbering starts from 1.

-- 
Lee Jones [李琼斯]

