Return-Path: <linux-i2c+bounces-10055-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 237F1A74453
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Mar 2025 08:23:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFC323B66CF
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Mar 2025 07:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B6372116EE;
	Fri, 28 Mar 2025 07:23:25 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4C721148E
	for <linux-i2c@vger.kernel.org>; Fri, 28 Mar 2025 07:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743146605; cv=none; b=Cqy5NEEMfMgUD11ULtATVYcAYQVblFW+D7t+oaxSULWHwDRHendFyCTOtVcQaMDj7PIPfgN894YZu2osOfyCmnVZqxdYhFVnA8OboZkFkTZJSHpC51G5GkAtMhDQich6ctNWVPfzZvBN43kdwK4Kdf9PKkpp/uTlz7kH+RGYFes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743146605; c=relaxed/simple;
	bh=JREqmQ3F44uxPOvDqNR52TR0Yop4pEtWE1iR0/YLCZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PuWIOTPhnUKg9YJ4yMlTZkcKp60LMPPOWXyOp8CeHRMMgq0F6TP+Cd/vLgE8Q/w04PDv58IGiC2rcwskYxlCf9TJJetVw7EEvnpQOafKM0M2E7P9sE59mx8Gux09zaB48nP5k4OCK32sxNi8J+0ftzGFQkeLug02HS4cGKPRM74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1ty43D-0000Nn-Lv; Fri, 28 Mar 2025 08:22:47 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1ty439-0023qP-1p;
	Fri, 28 Mar 2025 08:22:43 +0100
Received: from pengutronix.de (p5b1645f7.dip0.t-ipconnect.de [91.22.69.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 1DB853E85BD;
	Fri, 28 Mar 2025 07:22:43 +0000 (UTC)
Date: Fri, 28 Mar 2025 08:22:42 +0100
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
Message-ID: <20250328-smart-thundering-asp-2536b0-mkl@pengutronix.de>
References: <20250225081644.3524915-1-a0282524688@gmail.com>
 <20250225081644.3524915-5-a0282524688@gmail.com>
 <20250227-spicy-grebe-of-dignity-68c847-mkl@pengutronix.de>
 <CAOoeyxWSsy0Q0Y7iJE8-DZM5Yvcdto8mncFkM8X4BvVMEgfUiQ@mail.gmail.com>
 <20250317-cuttlefish-of-simple-champagne-ee666c-mkl@pengutronix.de>
 <CAOoeyxXSC3rjeB0g5BtHKvKy-Y9Dszd5X9WuHeBeH1bk39d_Eg@mail.gmail.com>
 <20250326-inventive-lavender-carp-1efca5-mkl@pengutronix.de>
 <CAOoeyxXw1x2HVXQYzxc1OuGimn7XPfCjj-aB=jAAfw733b_9OQ@mail.gmail.com>
 <20250327-awesome-mutant-cuscus-0f0314-mkl@pengutronix.de>
 <CAOoeyxWa5sB+YS6W=oG7xUeizXxigkdw3b=7w9aGftCWzWsw2A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a4tssny7k3xmom4i"
Content-Disposition: inline
In-Reply-To: <CAOoeyxWa5sB+YS6W=oG7xUeizXxigkdw3b=7w9aGftCWzWsw2A@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--a4tssny7k3xmom4i
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 4/7] can: Add Nuvoton NCT6694 CANFD support
MIME-Version: 1.0

On 28.03.2025 10:37:33, Ming Yu wrote:
> Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2025=E5=B9=B43=E6=9C=882=
7=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8B=E5=8D=883:25=E5=AF=AB=E9=81=93=EF=
=BC=9A
> >
> > On 27.03.2025 13:38:22, Ming Yu wrote:
> > > Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2025=E5=B9=B43=E6=9C=
=8827=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=881:41=E5=AF=AB=E9=81=93=
=EF=BC=9A
> > > >
> > > > > > > > > +     priv->can.clock.freq =3D can_clk;
> > > > > > > > > +     priv->can.bittiming_const =3D &nct6694_can_bittimin=
g_nominal_const;
> > > > > > > > > +     priv->can.data_bittiming_const =3D &nct6694_can_bit=
timing_data_const;
> > > > > > > > > +     priv->can.do_set_mode =3D nct6694_can_set_mode;
> > > > > > > > > +     priv->can.do_get_berr_counter =3D nct6694_can_get_b=
err_counter;
> > > > > > > > > +     priv->can.ctrlmode_supported =3D CAN_CTRLMODE_LOOPB=
ACK |
> > > > > > > > > +             CAN_CTRLMODE_LISTENONLY | CAN_CTRLMODE_BERR=
_REPORTING |
> > > > > > > > > +             CAN_CTRLMODE_FD | CAN_CTRLMODE_FD_NON_ISO;
> > > > > > > >
> > > > > > > > Does your device run in CAN-FD mode all the time? If so, pl=
ease use
> > > > > > > > can_set_static_ctrlmode() to set it after priv->can.ctrlmod=
e_supported
> > > > > > > > and remove CAN_CTRLMODE_FD from ctrlmode_supported.
> > > > > > > >
> > > > > > >
> > > > > > > Our device is designed to allow users to dynamically switch b=
etween
> > > > > > > Classical CAN and CAN-FD mode via ip link set ... fd on/off.
> > > > > > > Therefore, CAN_CTRLMODE_FD needs to remain in ctrlmode_suppor=
ted, and
> > > > > > > can_set_static_ctrlmode() is not suitable in this case.
> > > > > > > Please let me know if you have any concerns about this approa=
ch.
> > > > > >
> > > > > > Where do you evaluate if the user has configured CAN_CTRLMODE_F=
D or not?
> > > > > >
> > > > >
> > > > > Sorry, I was previously confused about our device's control mode.=
 I
> > > > > will use can_set_static_ctrlmode() to set CAN_FD mode in the next
> > > > > patch.
> > > >
> > > > Does your device support CAN-CC only mode? Does your device support=
 to
> > > > switch between CAN-CC only and CAN-FD mode?
> > > >
> > >
> > > Our device supports both CAN-CC and CAN-FD mode.
> >
> > This doesn't answer my question:
> >
> > Does your device support CAN-CC only mode?
>=20
> It can dynamically switch between CAN-CC and CAN-FD mode when
> trasmitting or receiving, depending on whether the nct6694_can_frame
> passs the flag with NCT6694_CAN_FRAME_FLAG_FD.

Ok, but what about the receive path? Does the device support CAN-CC only
mode? Will it throw an error, if it receives a CAN-FD frame?

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--a4tssny7k3xmom4i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmfmTj8ACgkQDHRl3/mQ
kZxbBggAnvTDCDToJYkOojptUT65lDvDa1RdwRbTO+7MEEyuklVxALUQJmpsq1Yw
Aw4gKcwEZE1Q3vdlXR9kF4hUCKczWT5QxeqCW9M/qEfSXgNXhX8CCHVDzl5b7Om+
kB+tiH7jitYhp2s9dK0Muj/hl4QuOL35OW0Ayn6G/Pd/fKjNJlf4to2ziatUFtk6
nWNfPrk9LhQq9B/Fy5yGxDpt7WwPU3MUMaYWHZSvSMyPawBPpj6nYtlXRn9FeVUK
EEZIiOVW/orW9H5nu5XeGXbYM5OdwNqh83rqW94yYoeyE4A+2CX9UZ+kkLpabh7v
Xz6Zr0RWQWzVT0cOQWKPGt0vY3Iw0Q==
=Op9R
-----END PGP SIGNATURE-----

--a4tssny7k3xmom4i--

