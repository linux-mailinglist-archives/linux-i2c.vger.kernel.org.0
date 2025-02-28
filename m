Return-Path: <linux-i2c+bounces-9640-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AABCA4977A
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 11:34:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E6A2A3A5839
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Feb 2025 10:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6586225DD0A;
	Fri, 28 Feb 2025 10:34:54 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86A725A334
	for <linux-i2c@vger.kernel.org>; Fri, 28 Feb 2025 10:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740738894; cv=none; b=uZ8Par4MQ4Zaxw029+KoHWPJJr7QfdgSaX3AxrgeRAzq+fLtL1Eieshd6MuMLPMGLqynxHqL/OobfqYOUUa3xJ98W9krdbFCm/HNmkwdzBlPEsIn1hG/qU1z16BU/8/kMYCBMI3Lu+FGQaNZQSgxUsLndMdOrI5IR6c/HFC98yA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740738894; c=relaxed/simple;
	bh=tEvnyaMU3oSs/ueZnSN+9o+Po1ID/44xfiu3e/Usr6o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VM7cdOpeWMcAUtHF1AI/9U9/0mvLxCAAQQRtzj6NyAR4h+AW7gl7qI8HN+IcF60mzbY7Ul+K5q49Yar0kevgHg8Zc2NmMe2sKDaZLGYK+2EO4+dbNRrnnxPhediMZm+EJLutMRQwAI0TsoTxQ0Mm0nFEEy9Af0Uo+mNVdM5csOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tnxhM-0002hu-RK; Fri, 28 Feb 2025 11:34:28 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tnxhK-003HLv-02;
	Fri, 28 Feb 2025 11:34:26 +0100
Received: from pengutronix.de (p5b164285.dip0.t-ipconnect.de [91.22.66.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 9701F3CE1FD;
	Fri, 28 Feb 2025 10:34:25 +0000 (UTC)
Date: Fri, 28 Feb 2025 11:34:25 +0100
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
Message-ID: <20250228-magic-seahorse-of-abracadabra-f2a402-mkl@pengutronix.de>
References: <20250207074502.1055111-1-a0282524688@gmail.com>
 <20250207074502.1055111-5-a0282524688@gmail.com>
 <20250207-savvy-beaver-of-culture-45698d-mkl@pengutronix.de>
 <CAOoeyxWKWA=OJB_MdWPdJQDic8=AXEbJiu2qW5u=CvphyAykzQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h2qx7abh3roax2kn"
Content-Disposition: inline
In-Reply-To: <CAOoeyxWKWA=OJB_MdWPdJQDic8=AXEbJiu2qW5u=CvphyAykzQ@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--h2qx7abh3roax2kn
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 4/7] can: Add Nuvoton NCT6694 CANFD support
MIME-Version: 1.0

On 12.02.2025 10:49:43, Ming Yu wrote:
> > > +static void nct6694_can_handle_state_errors(struct net_device *ndev,=
 u8 status)
> > > +{
> > > +     struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> >
> > It seems you don't have dedicated RX and TX states, so call
> > nct6694_can_get_berr_counter() and use can_state_get_by_berr_counter()
> > to get the states. Then basically do that what what
> > mcp251xfd_handle_cerrif() does, starting with "new_state =3D max(tx_sta=
te, rx_state);"
> >
>=20
> Excuse me, do you mean that nct6694_can_handle_state_change() the flow
> should like v5?
> https://lore.kernel.org/linux-can/CAMZ6RqLHEoukxDfV33iDWXjM1baK922QnWSkOP=
01VzZ0S_9H8g@mail.gmail.com/

The handling of
CAMZ6RqLHEoukxDfV33iDWXjM1baK922QnWSkOP01VzZ0S_9H8g@mail.gmail.com in v5
was better, but there were some questions by Vincent...

So let's continue the discussion from v5 here:

> > +static void nct6694_can_handle_state_change(struct net_device *ndev,
> > +                                           u8 status)
> > +{
> > +       struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +       enum can_state new_state =3D priv->can.state;
> > +       enum can_state rx_state, tx_state;
> > +       struct can_berr_counter bec;
> > +       struct can_frame *cf;
> > +       struct sk_buff *skb;
> > +
> > +       nct6694_can_get_berr_counter(ndev, &bec);
> > +       can_state_get_by_berr_counter(ndev, &bec, &tx_state, &rx_state);
>=20
> Here, you set up tx_state and rx_state...
>=20

remove the switch (status)...

> > +       switch (status) {
> > +       case NCT6694_CAN_EVT_STS_ERROR_ACTIVE:
> > +               new_state =3D CAN_STATE_ERROR_ACTIVE;
> > +               break;
> > +       case NCT6694_CAN_EVT_STS_ERROR_PASSIVE:
> > +               new_state =3D CAN_STATE_ERROR_PASSIVE;
> > +               break;
> > +       case NCT6694_CAN_EVT_STS_BUS_OFF:
> > +               new_state =3D CAN_STATE_BUS_OFF;
> > +               break;
> > +       case NCT6694_CAN_EVT_STS_WARNING:
> > +               new_state =3D CAN_STATE_ERROR_WARNING;
> > +               break;
> > +       default:
> > +               netdev_err(ndev, "Receive unknown CAN status event.\n");
> > +               return;
> > +       }

replace it by:

	new_state =3D max(tx_state, rx_state);

> > +
> > +       /* state hasn't changed */
> > +       if (new_state =3D=3D priv->can.state)
> > +               return;
> > +
> > +       skb =3D alloc_can_err_skb(ndev, &cf);
> > +

remove this VVV
> > +       tx_state =3D bec.txerr >=3D bec.rxerr ? new_state : 0;
> > +       rx_state =3D bec.txerr <=3D bec.rxerr ? new_state : 0;
            ^^^

>=20
> ... but you never used the values returned by
> can_state_get_by_berr_counter() and just overwrote the tx and rx
> state.
>=20
> What is the logic here? Why do you need to manually adjust those two
> values? Isn't the logic in can_change_state() sufficient?
>=20
> > +       can_change_state(ndev, cf, tx_state, rx_state);
> > +
> > +       if (new_state =3D=3D CAN_STATE_BUS_OFF) {

if (priv->can.state =3D=3D CAN_STATE_BUS_OFF) {

>=20
> Same for the new_state. The function can_change_state() calculate the
> new state from tx_state and rx_state and save it under
> can_priv->state. But here, you do your own calculation.
>=20
> Only keep one of the two. If your device already tells you the state,
> then fine! Just use the information from your device and do not use
> can_change_state(). Here, you are doing double work resulting in a
> weird mix.
>

what does your device do when it goes into bus off?

> > +               can_bus_off(ndev);
> > +       } else if (skb) {
> > +               cf->can_id |=3D CAN_ERR_CNT;
> > +               cf->data[6] =3D bec.txerr;
> > +               cf->data[7] =3D bec.rxerr;
> > +       }
> > +

if (skb)

> > +       nct6694_can_rx_offload(&priv->offload, skb);
> > +}

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--h2qx7abh3roax2kn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmfBkS4ACgkQDHRl3/mQ
kZx8rAf/YwHWaPQeJt2a23AqQMCRA4js5IxIDrKEDC6om3BvkuibxwOwYh8vEl8Y
IZOCA5tIkrQvRDZxSCQBe4yb3qkd8xVWeOR02lqIz5ZmYH9TjRuF4DrxXeustZpz
ik5+osAJwCt6OaWhClj8hyGFb4koVa2usLbi71ynDPW9RfOcfHyNvkgEgqS838LV
gP14GLvw7MaoruLgV4B+hAbA56cST7RLm+F9aQehMUej1lVU7G2vQTgcDGgIyN6j
tRT7p6+EplB3uVCDU/aq3iB5hY1R6hZY1im0aYqfg1p1UzzYN4pK8Z5C63KmHfr8
3gWlCeaQJC5+CDfvtp9fm3La49zFcQ==
=3lgQ
-----END PGP SIGNATURE-----

--h2qx7abh3roax2kn--

