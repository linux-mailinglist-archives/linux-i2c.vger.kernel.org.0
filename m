Return-Path: <linux-i2c+bounces-9855-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BADA64711
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 10:22:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0BE7F189392A
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Mar 2025 09:22:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEE8B221D8B;
	Mon, 17 Mar 2025 09:22:18 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17141221F14
	for <linux-i2c@vger.kernel.org>; Mon, 17 Mar 2025 09:22:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742203338; cv=none; b=f1znqnawBTaNXLKCXYzV07QBrFYBzke+gxxgsh/m6ByZpZcRrsJNChETiNjATLTnAq44n3ByioYX+suXfkfBPj/3GU43bRGYSXTWmOLU7cIp0QvGfrb99MWsny9SDLy9WVAVSD3kR8+6ZuoeayP4aTLHaEPk9YB/eq/S24VXmf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742203338; c=relaxed/simple;
	bh=RCXMiTQVBNYBPJfpmsdm6M3UyDf5ie66TGTqQRiknF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ilwLfXjXrim0Xi4hbpN079OKS9VT5hp/RSbfWjqnUgkTbiWOKpBU3HVtrsXyIOCT7n9m2IDiFuC827AqaJ5LvCSIJLEEacjjaHvoCYtPALrvPmNLDzq7PENUDqi41iF4PrkZRDeduaVFVG7WmMgM7s0JnMUCewvG4mAKkXoLemQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tu6fD-0006qI-Un; Mon, 17 Mar 2025 10:21:39 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tu6f8-000Dix-1r;
	Mon, 17 Mar 2025 10:21:35 +0100
Received: from pengutronix.de (p5b1645f7.dip0.t-ipconnect.de [91.22.69.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 1974B3DD0DA;
	Mon, 17 Mar 2025 09:13:43 +0000 (UTC)
Date: Mon, 17 Mar 2025 10:13:42 +0100
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
Subject: Re: [PATCH v8 4/7] can: Add Nuvoton NCT6694 CANFD support
Message-ID: <20250317-cuttlefish-of-simple-champagne-ee666c-mkl@pengutronix.de>
References: <20250225081644.3524915-1-a0282524688@gmail.com>
 <20250225081644.3524915-5-a0282524688@gmail.com>
 <20250227-spicy-grebe-of-dignity-68c847-mkl@pengutronix.de>
 <CAOoeyxWSsy0Q0Y7iJE8-DZM5Yvcdto8mncFkM8X4BvVMEgfUiQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="23gmkzuie32cja6b"
Content-Disposition: inline
In-Reply-To: <CAOoeyxWSsy0Q0Y7iJE8-DZM5Yvcdto8mncFkM8X4BvVMEgfUiQ@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--23gmkzuie32cja6b
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 4/7] can: Add Nuvoton NCT6694 CANFD support
MIME-Version: 1.0

On 17.03.2025 10:24:11, Ming Yu wrote:
[...]
> > > +     priv->can.clock.freq =3D can_clk;
> > > +     priv->can.bittiming_const =3D &nct6694_can_bittiming_nominal_co=
nst;
> > > +     priv->can.data_bittiming_const =3D &nct6694_can_bittiming_data_=
const;
> > > +     priv->can.do_set_mode =3D nct6694_can_set_mode;
> > > +     priv->can.do_get_berr_counter =3D nct6694_can_get_berr_counter;
> > > +     priv->can.ctrlmode_supported =3D CAN_CTRLMODE_LOOPBACK |
> > > +             CAN_CTRLMODE_LISTENONLY | CAN_CTRLMODE_BERR_REPORTING |
> > > +             CAN_CTRLMODE_FD | CAN_CTRLMODE_FD_NON_ISO;
> >
> > Does your device run in CAN-FD mode all the time? If so, please use
> > can_set_static_ctrlmode() to set it after priv->can.ctrlmode_supported
> > and remove CAN_CTRLMODE_FD from ctrlmode_supported.
> >
>=20
> Our device is designed to allow users to dynamically switch between
> Classical CAN and CAN-FD mode via ip link set ... fd on/off.
> Therefore, CAN_CTRLMODE_FD needs to remain in ctrlmode_supported, and
> can_set_static_ctrlmode() is not suitable in this case.
> Please let me know if you have any concerns about this approach.

Where do you evaluate if the user has configured CAN_CTRLMODE_FD or not?

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--23gmkzuie32cja6b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmfX58MACgkQDHRl3/mQ
kZwFAQf9GoWsVJLES07w392fRsnC/rJTEBHJ+gWGk0Zaqdl7cUlNxdf7ITy2fLQT
jVyEF5A8MMT/txn8IyEHDiz1XQ5ptSoQZCQZzZSCAyTF/t4c5MFH9QyKlhvzocSY
xEg4egeM/22pi+2Y+H7Ft6ueQ2gJUgtMnTVpEefren3c+dgDVAOu9gfJGh2XikpF
Iq6S4h/5UXf60oM/NNhtp/ApUqbcAzfVll1i2C6RhEDVM1jw6CF8qZ5lRMUCAGO5
ZGcps/NHX9dD4Z9bz5EKQ0vp04JBZC5mxEegZN72Mlj4NAPBYklROlG4qPBc6Qvn
ly1l8zW07HNRO/FpuxTOgjisVpV65A==
=jXP5
-----END PGP SIGNATURE-----

--23gmkzuie32cja6b--

