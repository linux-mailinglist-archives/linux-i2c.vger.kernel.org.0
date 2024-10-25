Return-Path: <linux-i2c+bounces-7573-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAB69AFCA1
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 10:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 24ED3B210C9
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Oct 2024 08:34:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E42751D1E71;
	Fri, 25 Oct 2024 08:34:11 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02811B6CE4
	for <linux-i2c@vger.kernel.org>; Fri, 25 Oct 2024 08:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729845251; cv=none; b=lNsKNv4XqZ2HTogto8fJN05WBzUZ8Dps1kmdNCKcQgd1genNnH6GhjR7Uw3WfCDKpxxDdDpbMtP57D8DVNHRZNpdOxpM0wgkByP1Ejspjd5bBE5NmZnF80BKRVaFZyhSQc9uj4FM0NQcluRlrZrGLcZ/kfR6WmB74UVzyug26BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729845251; c=relaxed/simple;
	bh=N9YSX9KMs4EMi/FGose8Zz5enxtQrn/oOuSKDs2gz0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ES03b7HZWMJDBgJ+bvN5lp3e2cGkGECpiue7ml6m5WKza4w+Kh99IpbedPfAKiPUJZXRiRScs9UlR5UO696bEWPbSubwla5PJtf6uXl2GkIapCFfhmRLNXiowhNGh2tNpaimwHRcNDg+z2UtIy5Bp9qcR8L14gIEkd+qdlPAgW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1t4FlK-0007ay-2o; Fri, 25 Oct 2024 10:33:38 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1t4FlH-000Km0-0P;
	Fri, 25 Oct 2024 10:33:35 +0200
Received: from pengutronix.de (pd9e595f8.dip0.t-ipconnect.de [217.229.149.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 9F4C835E803;
	Fri, 25 Oct 2024 08:33:34 +0000 (UTC)
Date: Fri, 25 Oct 2024 10:33:34 +0200
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
Subject: Re: [PATCH v1 0/9] Add Nuvoton NCT6694 MFD devices
Message-ID: <20241025-modest-hasty-angelfish-1e9193-mkl@pengutronix.de>
References: <20241024085922.133071-1-tmyu0@nuvoton.com>
 <20241024-eminent-dancing-narwhal-8f25dd-mkl@pengutronix.de>
 <CAOoeyxV4K=jR+tofeQtsMB7+smuu+Ghas5Tqfx4JvhuVK8dXrA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mwge3767c6xu2iui"
Content-Disposition: inline
In-Reply-To: <CAOoeyxV4K=jR+tofeQtsMB7+smuu+Ghas5Tqfx4JvhuVK8dXrA@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--mwge3767c6xu2iui
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 0/9] Add Nuvoton NCT6694 MFD devices
MIME-Version: 1.0

On 25.10.2024 16:22:01, Ming Yu wrote:
> Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2024=E5=B9=B410=E6=9C=88=
24=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=887:57=E5=AF=AB=E9=81=93=EF=
=BC=9A
> > On 24.10.2024 16:59:13, Ming Yu wrote:
> > > This patch series introduces support for Nuvoton NCT6694, a peripheral
> > > expander based on USB interface. It models the chip as an MFD driver
> > > (1/9), GPIO driver(2/9), I2C Adapter driver(3/9), CANfd driver(4/9),
> > > WDT driver(5/9), HWMON driver(6/9), IIO driver(7/9), PWM driver(8/9),
> > > and RTC driver(9/9).
> > >
> > > The MFD driver implements USB device functionality to issue
> > > custom-define USB bulk pipe packets for NCT6694. Each child device can
> > > use the USB functions nct6694_read_msg() and nct6694_write_msg() to i=
ssue
> > > a command. They can also register a handler function that will be cal=
led
> > > when the USB device receives its interrupt pipe.
> >
> > What about implementing a proper IRQ demux handler instead?

> I think the currently planned IRQ process meets expectations.
> Is there anything that needs improvement?

You can register the IRQs of the MFD device with the Linux kernel. This
way the devices can request a threaded IRQ handler directly via the
kernel function, instead of registering the callback.

With a threaded IRQ handler you can directly call the
nct6694_read_msg(), nct6694_write_msg() without the need to start a
workqueue from the callback.

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--mwge3767c6xu2iui
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmcbV9oACgkQKDiiPnot
vG8jyQf7B92f0Ky8Hj3PYj0THmVCD2KKL5jNJPqmaGEYPNCv69g9R0AyA4eLf8X1
FS6KS/SDR5wAufDLlXM//4HWXyerJa+fCIiBJte2O3qK+KKxsMBkFztu3LFuIBGL
5MFlo//aAyys6LfYiEJWHreUs/PutGrzaAROk4bsZxC38RoN4Qe5dUOqUeg/6dxn
Azs1tQzB/MNhtCT7uTIlTAk1tmNfw/qB2t6iEHGmGDlFX6O7QI9gSVR9bNCWW6Z4
QECCM6/eC2TIAhljxMe+tqrrjZZkDDAuN84cFgDBB51XQuoUcRaRa83ehLnk/Hin
CTvVqBxAZwY5o0EVGjWXE45BAmjisA==
=nrcE
-----END PGP SIGNATURE-----

--mwge3767c6xu2iui--

