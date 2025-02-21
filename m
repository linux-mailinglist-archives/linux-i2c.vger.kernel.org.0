Return-Path: <linux-i2c+bounces-9519-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D84A3EDF2
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2025 09:09:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86F4B70136F
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Feb 2025 08:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 370D61FBCAD;
	Fri, 21 Feb 2025 08:09:27 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF651D7E2F
	for <linux-i2c@vger.kernel.org>; Fri, 21 Feb 2025 08:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740125367; cv=none; b=QFTy+gbw0EWiBld09ZUF9spCZR9UadVQR7FQkZOE++tzhQ0cSYWHSRjV9E7wKRy/BovX740Vt+Um018P8rKhgO37SYZDdABGwYFpr4E8Valfyuv+vyG/hef80sCsX2p5KSDPqBM73kGDS/0diJhuKggltYHPZG2zxxoJb8WiEtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740125367; c=relaxed/simple;
	bh=W2+lqFB3yvUvKTgq6OrbULXW2hoBiT0kzSTRg8T/j5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hx3tigus6Eo5QhjJwYS9oi/CYbROnWbONmMa9wbNKomq5yBVcaIXdN6wWT+wsK9WlxJvo3ofh/Gnt1Inq+YEiivJuvMdy5iNVk4m8l49s57UT9prDEa99BvTdE3rSijXcPIBDo8xJCpjLeAvScuzndajtpyVIxA1ZtS6emIE7PU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tlO5e-0007gh-LR; Fri, 21 Feb 2025 09:08:54 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tlO5b-0024OL-2S;
	Fri, 21 Feb 2025 09:08:51 +0100
Received: from pengutronix.de (p5b164285.dip0.t-ipconnect.de [91.22.66.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 585363C8315;
	Fri, 21 Feb 2025 08:08:51 +0000 (UTC)
Date: Fri, 21 Feb 2025 09:08:51 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ming Yu <a0282524688@gmail.com>
Cc: tmyu0@nuvoton.com, lee@kernel.org, linus.walleij@linaro.org, 
	brgl@bgdev.pl, andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v7 4/7] can: Add Nuvoton NCT6694 CANFD support
Message-ID: <20250221-light-neat-doberman-1166a5-mkl@pengutronix.de>
References: <20250207074502.1055111-1-a0282524688@gmail.com>
 <20250207074502.1055111-5-a0282524688@gmail.com>
 <20250207-savvy-beaver-of-culture-45698d-mkl@pengutronix.de>
 <CAOoeyxX4guHzUap1ieQ_L3PrvpBAYbMiQKrb6ko=MGsF5RcXLg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tjblaazmatqfq76v"
Content-Disposition: inline
In-Reply-To: <CAOoeyxX4guHzUap1ieQ_L3PrvpBAYbMiQKrb6ko=MGsF5RcXLg@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--tjblaazmatqfq76v
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 4/7] can: Add Nuvoton NCT6694 CANFD support
MIME-Version: 1.0

On 21.02.2025 16:01:07, Ming Yu wrote:
> Hi Marc,
>=20
> Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2025=E5=B9=B42=E6=9C=887=
=E6=97=A5 =E9=80=B1=E4=BA=94 =E4=B8=8B=E5=8D=888:15=E5=AF=AB=E9=81=93=EF=BC=
=9A
> >
> > > +static irqreturn_t nct6694_can_irq(int irq, void *data)
> > > +{
> > > +     struct net_device *ndev =3D data;
> > > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > > +     struct nct6694_can_event *evt =3D priv->event;
> > > +     struct nct6694_cmd_header cmd_hd =3D {
> > > +             .mod =3D NCT6694_CAN_MOD,
> > > +             .cmd =3D NCT6694_CAN_EVENT,
> > > +             .sel =3D NCT6694_CAN_EVENT_SEL(priv->can_idx, NCT6694_C=
AN_EVENT_MASK),
> > > +             .len =3D cpu_to_le16(sizeof(priv->event))
> > > +     };
> > > +     irqreturn_t handled =3D IRQ_NONE;
> > > +     int can_idx =3D priv->can_idx;
> > > +     int ret;
> >
> > it would make sense to have a event pointer here instead of the can_idx?
> >
> >         const struct nct6694_can_event *event =3D &priv->event[priv->ca=
n_idx];
> >
> The CAN Event command always returns 16bytes: the first 8 bytes
> correspond to the CAN0 event, and the last 8 bytes correspond to the
> CAN1 event. Therefore, the event pointer here refers to both event
> buffers.

Yes, but in the following code uses "priv->event[can_idx]" several
times, this is why I proposed to have a dedicated "struct
nct6694_can_event *event" variable.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--tjblaazmatqfq76v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAme4NJAACgkQDHRl3/mQ
kZwgawgAqcasz/q2z0wDldtBADvSGWJpZYReThQnX06QjplHpEQwiaalyPWXJBK0
IRkuBRHEj0mNahTZgsl731lg+Y+kz3DxS7QBVJIIKvuq4MebGerv+g96FJHQ/HPE
6m7vE/Y46rSC5PJQpZgxL3K0V/L8NmFxDCMQjYOFaXvHvwG+4bgPi4vCmCElJYRn
iOMtP7NhVwmP9c1YcFlraOBQ2exHFPrOnHA2J9myAewvFnXqLZRJDNQrEohPm7ZJ
jlHgOB7cJYCzL8wed06r9RxSq6ZPHF3tPxCL6n5nVKgmxwTOdW2S8Mk1Z4LANrjY
bjwfdAqvpMPU/EQQkTxSxIadWDQSWQ==
=aqP2
-----END PGP SIGNATURE-----

--tjblaazmatqfq76v--

