Return-Path: <linux-i2c+bounces-10050-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E39BA72A89
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Mar 2025 08:26:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DAEA73B8C22
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Mar 2025 07:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A9C1F417D;
	Thu, 27 Mar 2025 07:25:58 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2463C1F417B
	for <linux-i2c@vger.kernel.org>; Thu, 27 Mar 2025 07:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743060358; cv=none; b=ABFwytMnNodn22SfhX8jfhtydIp/J/ktceXeayaEjbZtM33WcL3Z33yLDDk/w16pZ6KrdyEmODiFWUYUmDF3WgV9oP7cCyk/E7tIa/VfaAnLJ+P6Foo/+FwGji7dknaBQA9QR1qGCQQSVd2+7b4KlZedr+N0foTYWrjCzvWI+go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743060358; c=relaxed/simple;
	bh=JSSGQS6tGG25ltA0Mvv5MyPkthwco/wCEhroPDJOdFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PGXBbNFeOC5gizpYKFJwPrWpVpDAGNXvLLKkmzNjk39K6rRGmWerwyup4FJCiVJFCRcBwAp0D4havuGZM/zIjID0LVDU2X9St+cdAHwtBYwa7xsbO95ApsaNFnkvb6Nx9UtqlMFQqwqj2ExtOSsJkLmeCABSEu2Jy7uOBpVzskY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1txhcD-0004yL-Vr; Thu, 27 Mar 2025 08:25:26 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1txhc9-001t0o-2e;
	Thu, 27 Mar 2025 08:25:21 +0100
Received: from pengutronix.de (p5b1645f7.dip0.t-ipconnect.de [91.22.69.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id E00643E7BAF;
	Thu, 27 Mar 2025 07:06:19 +0000 (UTC)
Date: Thu, 27 Mar 2025 08:06:13 +0100
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
Message-ID: <20250327-awesome-mutant-cuscus-0f0314-mkl@pengutronix.de>
References: <20250225081644.3524915-1-a0282524688@gmail.com>
 <20250225081644.3524915-5-a0282524688@gmail.com>
 <20250227-spicy-grebe-of-dignity-68c847-mkl@pengutronix.de>
 <CAOoeyxWSsy0Q0Y7iJE8-DZM5Yvcdto8mncFkM8X4BvVMEgfUiQ@mail.gmail.com>
 <20250317-cuttlefish-of-simple-champagne-ee666c-mkl@pengutronix.de>
 <CAOoeyxXSC3rjeB0g5BtHKvKy-Y9Dszd5X9WuHeBeH1bk39d_Eg@mail.gmail.com>
 <20250326-inventive-lavender-carp-1efca5-mkl@pengutronix.de>
 <CAOoeyxXw1x2HVXQYzxc1OuGimn7XPfCjj-aB=jAAfw733b_9OQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c65ffbddv2wxsgu3"
Content-Disposition: inline
In-Reply-To: <CAOoeyxXw1x2HVXQYzxc1OuGimn7XPfCjj-aB=jAAfw733b_9OQ@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--c65ffbddv2wxsgu3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 4/7] can: Add Nuvoton NCT6694 CANFD support
MIME-Version: 1.0

On 27.03.2025 13:38:22, Ming Yu wrote:
> Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2025=E5=B9=B43=E6=9C=882=
7=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=881:41=E5=AF=AB=E9=81=93=EF=
=BC=9A
> >
> > > > > > > +     priv->can.clock.freq =3D can_clk;
> > > > > > > +     priv->can.bittiming_const =3D &nct6694_can_bittiming_no=
minal_const;
> > > > > > > +     priv->can.data_bittiming_const =3D &nct6694_can_bittimi=
ng_data_const;
> > > > > > > +     priv->can.do_set_mode =3D nct6694_can_set_mode;
> > > > > > > +     priv->can.do_get_berr_counter =3D nct6694_can_get_berr_=
counter;
> > > > > > > +     priv->can.ctrlmode_supported =3D CAN_CTRLMODE_LOOPBACK |
> > > > > > > +             CAN_CTRLMODE_LISTENONLY | CAN_CTRLMODE_BERR_REP=
ORTING |
> > > > > > > +             CAN_CTRLMODE_FD | CAN_CTRLMODE_FD_NON_ISO;
> > > > > >
> > > > > > Does your device run in CAN-FD mode all the time? If so, please=
 use
> > > > > > can_set_static_ctrlmode() to set it after priv->can.ctrlmode_su=
pported
> > > > > > and remove CAN_CTRLMODE_FD from ctrlmode_supported.
> > > > > >
> > > > >
> > > > > Our device is designed to allow users to dynamically switch betwe=
en
> > > > > Classical CAN and CAN-FD mode via ip link set ... fd on/off.
> > > > > Therefore, CAN_CTRLMODE_FD needs to remain in ctrlmode_supported,=
 and
> > > > > can_set_static_ctrlmode() is not suitable in this case.
> > > > > Please let me know if you have any concerns about this approach.
> > > >
> > > > Where do you evaluate if the user has configured CAN_CTRLMODE_FD or=
 not?
> > > >
> > >
> > > Sorry, I was previously confused about our device's control mode. I
> > > will use can_set_static_ctrlmode() to set CAN_FD mode in the next
> > > patch.
> >
> > Does your device support CAN-CC only mode? Does your device support to
> > switch between CAN-CC only and CAN-FD mode?
> >
>=20
> Our device supports both CAN-CC and CAN-FD mode.

This doesn't answer my question:

Does your device support CAN-CC only mode?

Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--c65ffbddv2wxsgu3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmfk+OIACgkQDHRl3/mQ
kZyShwf/SEuLYWxNwEXPQAFmu0xkYcX51A4Mbmaf6/13N46iS6PA0obpQq4+AO3C
b9PQ/S6ksgL4cA7wqXcakT/lI4Q8EAhieKHkpCD63j3S82fGjVACaE+USZLhDdWV
Dv3+2yePBKFkyBQuI0LPTq0isnXsbZ2UPF/mA9amECwxoyUTFTGYLyjN5KfyLppD
UNPdQWoRXLadDDSKKQGLVD58oUO1QYaWoY/ZdTZg3EnLFLJEccmkG1+gxCuhOenM
GwjIagbJVdODncOGVoFPLa5diYu68IVwaKWPEomFwIzxi53uQKLHtGvtLTfa2pwf
5SH3X1oM60OqPxr+EKluuxWTRgN9kg==
=ctjr
-----END PGP SIGNATURE-----

--c65ffbddv2wxsgu3--

