Return-Path: <linux-i2c+bounces-7543-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8369AE873
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 16:24:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70B141F22262
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2024 14:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F191FC7C5;
	Thu, 24 Oct 2024 14:18:31 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749421FBF65
	for <linux-i2c@vger.kernel.org>; Thu, 24 Oct 2024 14:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729779511; cv=none; b=Ooi/CVH3LH4pAPBqTdH9yYJU4ygkCeBfYNj+dkY/VUBiUNTwA3T+oBgawHX0I7d0dk8gbEEFTral/Fyx6JTgb/QkuKV4M3aNnPOOZO++YJKryrDn1i3x6TeAcN1FxlLdMMbcKNoNG+Dpv3Jrbu/DiCPFm2b2wt0jpDEpL/JmnWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729779511; c=relaxed/simple;
	bh=nr1BFMUqpOOZTknszusigTrqeLkm84oMDbFg8eVnqyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oxFuPGjbWHVGbMIDoDIC6wrbHoJNgLtZ3HjfjZYenGbZ/977EYuEzHTP6ekYB4bmobYyDb3qvoNw/vmPiy++Ngis4SGYs72AgKCQMEImzTwJy/2UU5hbO41FMK9Dss9MidfE0QxGfOs+TXleINPEUs4bw3lQvmg1+NqSpw5pIG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1t3yex-0003ep-6Q; Thu, 24 Oct 2024 16:17:55 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1t3yeu-000DEg-2T;
	Thu, 24 Oct 2024 16:17:52 +0200
Received: from pengutronix.de (pd9e595f8.dip0.t-ipconnect.de [217.229.149.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 4E0EB35DCD7;
	Thu, 24 Oct 2024 14:17:52 +0000 (UTC)
Date: Thu, 24 Oct 2024 16:17:51 +0200
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
Subject: Re: [PATCH v1 4/9] can: Add Nuvoton NCT6694 CAN support
Message-ID: <20241024-poetic-offbeat-alligator-d6b9fe-mkl@pengutronix.de>
References: <20241024085922.133071-1-tmyu0@nuvoton.com>
 <20241024085922.133071-5-tmyu0@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gd3ti3yld7agool5"
Content-Disposition: inline
In-Reply-To: <20241024085922.133071-5-tmyu0@nuvoton.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--gd3ti3yld7agool5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 4/9] can: Add Nuvoton NCT6694 CAN support
MIME-Version: 1.0

On 24.10.2024 16:59:17, Ming Yu wrote:
> This driver supports Socket CANfd functionality for NCT6694 MFD
> device based on USB interface.
>=20
> Signed-off-by: Ming Yu <tmyu0@nuvoton.com>
> ---
>  MAINTAINERS                     |   1 +
>  drivers/net/can/Kconfig         |  10 +
>  drivers/net/can/Makefile        |   1 +
>  drivers/net/can/nct6694_canfd.c | 843 ++++++++++++++++++++++++++++++++

FTBFS:

| make[5]: *** No rule to make target 'drivers/net/can/nct6604_canfd.o', ne=
eded by 'drivers/net/can/'.  Stop.

[...]

> diff --git a/drivers/net/can/Makefile b/drivers/net/can/Makefile
> index a71db2cfe990..825c011aead5 100644
> --- a/drivers/net/can/Makefile
> +++ b/drivers/net/can/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_CAN_JANZ_ICAN3)	+=3D janz-ican3.o
>  obj-$(CONFIG_CAN_KVASER_PCIEFD)	+=3D kvaser_pciefd.o
>  obj-$(CONFIG_CAN_MSCAN)		+=3D mscan/
>  obj-$(CONFIG_CAN_M_CAN)		+=3D m_can/
> +obj-$(CONFIG_CAN_NCT6694)	+=3D nct6604_canfd.o
                                   ^^^^^^^^^^^^^^^
>  obj-$(CONFIG_CAN_PEAK_PCIEFD)	+=3D peak_canfd/
>  obj-$(CONFIG_CAN_SJA1000)	+=3D sja1000/
>  obj-$(CONFIG_CAN_SUN4I)		+=3D sun4i_can.o
> diff --git a/drivers/net/can/nct6694_canfd.c b/drivers/net/can/nct6694_ca=
nfd.c
> new file mode 100644
> index 000000000000..d873a9fd656d
> --- /dev/null
> +++ b/drivers/net/can/nct6694_canfd.c
                        ^^^^^^^^^^^^^^^

This doesn't compile :(

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--gd3ti3yld7agool5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmcaVwwACgkQKDiiPnot
vG+eWQf/b18jVZRlBPO4peY++zek7fG2mvAETij44FJ1yoEkgaRkIs8jB3bsyp3g
22pVm7/JdA27DOoyj2m9ptUut353vjv3XKSNsDvnfqaswliao/aivl+A7CENuu47
JwoeiRDKZhYo+9XE5ljEch75VSvYBnYJJoBLWNuR9bA/ZqiYDjOpr24sErJFwH9T
IhdgB1wBCe+VCzRIrJxTrzeIQ4bItA1D5ZHMugRhPQcS/qkk5zZeemv5OUiRkCCP
kO3qZDX0zU+cuHyV+e3OlXS4Ebhad/Z0e7jr1N11Ses+gi/6kWCDTuv4p/wFTZXG
8tbRDZS0/A/FLwF3XyY+rRJ5N/UwHA==
=Zy3R
-----END PGP SIGNATURE-----

--gd3ti3yld7agool5--

