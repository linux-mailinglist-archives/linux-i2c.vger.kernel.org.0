Return-Path: <linux-i2c+bounces-7528-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA179AE038
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 11:12:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E8A21C220EA
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 09:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A811B21A6;
	Thu, 24 Oct 2024 09:12:44 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8192B1A76CE
	for <linux-i2c@vger.kernel.org>; Thu, 24 Oct 2024 09:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729761164; cv=none; b=P750Ho532WUf+8Yr5xSbxmnozzJcThM5dEUD6D3o4bEUwiiIOMtaXNZ9gBp5grzs8Xg8W5t/ozfRnf7Q+azYb37MpmZIu3OpjqF6Wu9NJteyvWmDpw5MxRLk3Xb4/3uTbWfN3UFX3KwuBK3CD//26fxjjPXjNtvI9+JIoRmnAYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729761164; c=relaxed/simple;
	bh=qOFmV9WZ9sh/+C3fpLshCL2Kht2BK/C1cpKcjRH+csw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mg/5/scJD6ogqYb1WxRMAMNgvhOW/YnBXt71kZ7AY9ytJ8vwZq8UVJ6qvLAxNts0R340ZB37Vf3umk+VUfm5U5br0Om47MkhtuvKTNvXJ9ee19Rqfl3nt6cUP0IXdD25roOOUa5t/O2alLXQ05kYH97RX0k20SlymW2KmOUK+lY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1t3tsw-0002gF-W9; Thu, 24 Oct 2024 11:12:03 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1t3tsu-000AhL-0y;
	Thu, 24 Oct 2024 11:12:00 +0200
Received: from pengutronix.de (pd9e595f8.dip0.t-ipconnect.de [217.229.149.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 275DB35D8E6;
	Thu, 24 Oct 2024 09:03:43 +0000 (UTC)
Date: Thu, 24 Oct 2024 11:03:42 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	brgl@bgdev.pl, andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	jic23@kernel.org, lars@metafoo.de, ukleinek@kernel.org, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v1 1/9] mfd: Add core driver for Nuvoton NCT6694
Message-ID: <20241024-daffodil-raccoon-of-champagne-6f6f04-mkl@pengutronix.de>
References: <20241024085922.133071-1-tmyu0@nuvoton.com>
 <20241024085922.133071-2-tmyu0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dwvre6734ixnnoql"
Content-Disposition: inline
In-Reply-To: <20241024085922.133071-2-tmyu0@nuvoton.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--dwvre6734ixnnoql
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/9] mfd: Add core driver for Nuvoton NCT6694
MIME-Version: 1.0

On 24.10.2024 16:59:14, Ming Yu wrote:
> The Nuvoton NCT6694 is a peripheral expander with 16 GPIO chips,
> 6 I2C controllers, 2 CANfd controllers, 2 Watchdog timers, ADC,
> PWM, and RTC.
>=20
> This driver implements USB device functionality and shares the
> chip's peripherals as a child device.
>=20
> Each child device can use the USB functions nct6694_read_msg()
> and nct6694_write_msg() to issue a command. They can also register
> a handler function that will be called when the USB device receives
> its interrupt pipe.
>=20
> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> ---
>  MAINTAINERS                 |   7 +
>  drivers/mfd/Kconfig         |  10 +
>  drivers/mfd/Makefile        |   2 +
>  drivers/mfd/nct6694.c       | 394 ++++++++++++++++++++++++++++++++++++
>  include/linux/mfd/nct6694.h | 168 +++++++++++++++
>  5 files changed, 581 insertions(+)
>  create mode 100644 drivers/mfd/nct6694.c
>  create mode 100644 include/linux/mfd/nct6694.h
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e9659a5a7fb3..30157ca95cf3 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -16434,6 +16434,13 @@ F:	drivers/nubus/
>  F:	include/linux/nubus.h
>  F:	include/uapi/linux/nubus.h
> =20
> +NUVOTON NCT6694 MFD DRIVER
> +M:	Ming Yu <tmyu0@nuvoton.com>
> +L:	linux-kernel@vger.kernel.org
> +S:	Supported
> +F:	drivers/mfd/nct6694.c
> +F:	include/linux/mfd/nct6694.h
> +
>  NVIDIA (rivafb and nvidiafb) FRAMEBUFFER DRIVER
>  M:	Antonino Daplas <adaplas@gmail.com>
>  L:	linux-fbdev@vger.kernel.org
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index f9325bcce1b9..da2600958697 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -546,6 +546,16 @@ config MFD_MX25_TSADC
>  	  i.MX25 processors. They consist of a conversion queue for general
>  	  purpose ADC and a queue for Touchscreens.
> =20
> +config MFD_NCT6694
> +	tristate "Nuvoton NCT6694 support"
> +	select MFD_CORE
> +	depends on USB
> +	help
> +	  This adds support for Nuvoton USB device NCT6694 sharing peripherals
> +	  This includes the USB devcie driver and core APIs.
> +	  Additional drivers must be enabled in order to use the functionality
> +	  of the device.
> +
>  config MFD_HI6421_PMIC
>  	tristate "HiSilicon Hi6421 PMU/Codec IC"
>  	depends on OF
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 2a9f91e81af8..2cf816d67d03 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -116,6 +116,8 @@ obj-$(CONFIG_TWL6040_CORE)	+=3D twl6040.o
> =20
>  obj-$(CONFIG_MFD_MX25_TSADC)	+=3D fsl-imx25-tsadc.o
> =20
> +obj-$(CONFIG_MFD_NCT6694)	+=3D nct6694.o
> +
>  obj-$(CONFIG_MFD_MC13XXX)	+=3D mc13xxx-core.o
>  obj-$(CONFIG_MFD_MC13XXX_SPI)	+=3D mc13xxx-spi.o
>  obj-$(CONFIG_MFD_MC13XXX_I2C)	+=3D mc13xxx-i2c.o
> diff --git a/drivers/mfd/nct6694.c b/drivers/mfd/nct6694.c
> new file mode 100644
> index 000000000000..9838c7be0b98
> --- /dev/null
> +++ b/drivers/mfd/nct6694.c
> @@ -0,0 +1,394 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Nuvoton NCT6694 MFD driver based on USB interface.
> + *
> + * Copyright (C) 2024 Nuvoton Technology Corp.
> + */
> +
> +#include <linux/io.h>
> +#include <linux/usb.h>
> +#include <linux/slab.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mfd/core.h>
> +#include <linux/mfd/nct6694.h>
> +
> +#define DRVNAME "nct6694-usb_mfd"
> +
> +#define MFD_DEV_SIMPLE(_name)		\
> +{					\
> +	.name =3D NCT6694_DEV_##_name,	\
> +}					\
> +
> +#define MFD_DEV_WITH_ID(_name, _id)	\
> +{					\
> +	.name =3D NCT6694_DEV_##_name,	\
> +	.id =3D _id,			\
> +}
> +
> +/* MFD device resources */
> +static const struct mfd_cell nct6694_dev[] =3D {
> +	MFD_DEV_WITH_ID(GPIO, 0x0),
> +	MFD_DEV_WITH_ID(GPIO, 0x1),
> +	MFD_DEV_WITH_ID(GPIO, 0x2),
> +	MFD_DEV_WITH_ID(GPIO, 0x3),
> +	MFD_DEV_WITH_ID(GPIO, 0x4),
> +	MFD_DEV_WITH_ID(GPIO, 0x5),
> +	MFD_DEV_WITH_ID(GPIO, 0x6),
> +	MFD_DEV_WITH_ID(GPIO, 0x7),
> +	MFD_DEV_WITH_ID(GPIO, 0x8),
> +	MFD_DEV_WITH_ID(GPIO, 0x9),
> +	MFD_DEV_WITH_ID(GPIO, 0xA),
> +	MFD_DEV_WITH_ID(GPIO, 0xB),
> +	MFD_DEV_WITH_ID(GPIO, 0xC),
> +	MFD_DEV_WITH_ID(GPIO, 0xD),
> +	MFD_DEV_WITH_ID(GPIO, 0xE),
> +	MFD_DEV_WITH_ID(GPIO, 0xF),
> +
> +	MFD_DEV_WITH_ID(I2C, 0x0),
> +	MFD_DEV_WITH_ID(I2C, 0x1),
> +	MFD_DEV_WITH_ID(I2C, 0x2),
> +	MFD_DEV_WITH_ID(I2C, 0x3),
> +	MFD_DEV_WITH_ID(I2C, 0x4),
> +	MFD_DEV_WITH_ID(I2C, 0x5),
> +
> +	MFD_DEV_WITH_ID(CAN, 0x0),
> +	MFD_DEV_WITH_ID(CAN, 0x1),
> +
> +	MFD_DEV_WITH_ID(WDT, 0x0),
> +	MFD_DEV_WITH_ID(WDT, 0x1),
> +
> +	MFD_DEV_SIMPLE(IIO),
> +	MFD_DEV_SIMPLE(HWMON),
> +	MFD_DEV_SIMPLE(PWM),
> +	MFD_DEV_SIMPLE(RTC),
> +};
> +
> +int nct6694_register_handler(struct nct6694 *nct6694, int irq_bit,
> +			     void (*handler)(void *), void *private_data)
> +{
> +	struct nct6694_handler_entry *entry;
> +	unsigned long flags;
> +
> +	entry =3D kmalloc(sizeof(*entry), GFP_KERNEL);
> +	if (!entry)
> +		return -ENOMEM;
> +
> +	entry->irq_bit =3D irq_bit;
> +	entry->handler =3D handler;
> +	entry->private_data =3D private_data;
> +
> +	spin_lock_irqsave(&nct6694->lock, flags);
> +	list_add_tail(&entry->list, &nct6694->handler_list);
> +	spin_unlock_irqrestore(&nct6694->lock, flags);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(nct6694_register_handler);

Where's the corresponding nct6694_free_handler() function?

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--dwvre6734ixnnoql
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmcaDWsACgkQKDiiPnot
vG/14wgAgoWLTibZpUmoNvOo0qLLAlp/YFpDa4iS3anD0MVkcgJIJwOg6aHDIw+F
qp749L7WL9qp+19SQjeSUvHyDgc3Eqv4PuQae5NMAcY+KFqQcItGBFkB2j2ewhn6
JMI5tSpNKoqJUflio0P0nNHt7JRciyi6EBfiU5TvB0J2+9cf6qRHjknmIkrxROSD
OMBmGK0e0Ki8TfOnhi8PQmLbv8RhoIe7/W6qHzTsOOPZ/66fjGqDcBUC6oi+Vw7f
mOVr2zW2DJ7xr++nBsBsvCzM8YQ7NDzt3qfBIHS21WE04dOWyBQlj6n01LYL7mta
+1F9tQnxpRonNQlU1mjXj6tMn2DjUw==
=raiy
-----END PGP SIGNATURE-----

--dwvre6734ixnnoql--

