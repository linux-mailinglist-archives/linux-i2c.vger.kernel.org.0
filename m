Return-Path: <linux-i2c+bounces-10247-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3009DA838E3
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Apr 2025 08:05:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7D6328C11CE
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Apr 2025 06:05:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39155201261;
	Thu, 10 Apr 2025 06:05:13 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56CA31FBCAA
	for <linux-i2c@vger.kernel.org>; Thu, 10 Apr 2025 06:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744265113; cv=none; b=pKGCtjfKbo8bOi4gWQ6b0+QitUye3+PyYGR8cvTVvVnFchoSj69/1fqkIHkCbQhRalFCkTdtNJNUwu2aHdIab4mYW4acCbYTbcu17VGyBjiUBSS20PLm44wJ/pntUF+UqqXFvzfyyQNroS0T0m61KAwwZ5H/uzDjB4ppWv8H0cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744265113; c=relaxed/simple;
	bh=q/kBApj8o1DODVLckuFXHWT1k9Qcxm273pF1C9ox4ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQIGIw65ktsGr8p8MWs1dsNb6gCla5r4Rg8aFojtFUZ5h5rGptbP+zycWEajEXO96MAd5hXKKi9ExJ7WQzoMk3MAQHYk8ehGejCAm0iSB1Kwr1CgcTbLhy6/0xjFfGVdk0/fXZ6reAODr7OPFmEvKs0/mw8/fJT5HMCWDpMsglM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1u2l1d-0004XD-C7; Thu, 10 Apr 2025 08:04:33 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1u2l1Z-004Dlj-2z;
	Thu, 10 Apr 2025 08:04:29 +0200
Received: from pengutronix.de (p5b1645f7.dip0.t-ipconnect.de [91.22.69.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 75A153F4AE6;
	Thu, 10 Apr 2025 06:04:29 +0000 (UTC)
Date: Thu, 10 Apr 2025 08:04:26 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Ming Yu <a0282524688@gmail.com>
Cc: lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andi.shyti@kernel.org, mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, netdev@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-usb@vger.kernel.org, Ming Yu <tmyu0@nuvoton.com>
Subject: Re: [PATCH v9 4/7] can: Add Nuvoton NCT6694 CANFD support
Message-ID: <20250410-artichoke-swan-of-abracadabra-33c1dc-mkl@pengutronix.de>
References: <20250409082752.3697532-1-tmyu0@nuvoton.com>
 <20250409082752.3697532-5-tmyu0@nuvoton.com>
 <20250409-cooperative-elastic-pillbug-672a03-mkl@pengutronix.de>
 <CAOoeyxULns52vAwzsLoXB+BwT+CN+VGBwqrg61pjKJH8bTD5bw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6ebpqmmsutfol6xr"
Content-Disposition: inline
In-Reply-To: <CAOoeyxULns52vAwzsLoXB+BwT+CN+VGBwqrg61pjKJH8bTD5bw@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--6ebpqmmsutfol6xr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v9 4/7] can: Add Nuvoton NCT6694 CANFD support
MIME-Version: 1.0

On 10.04.2025 10:40:34, Ming Yu wrote:
> Dear Marc,
>=20
> Thank you for reviewing.
>=20
> Marc Kleine-Budde <mkl@pengutronix.de> =E6=96=BC 2025=E5=B9=B44=E6=9C=889=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:21=E5=AF=AB=E9=81=93=EF=BC=
=9A
> ...
> > > +static void nct6694_canfd_handle_state_change(struct net_device *nde=
v, u8 status)
> > > +{
> > > +     struct nct6694_canfd_priv *priv =3D netdev_priv(ndev);
> > > +     enum can_state new_state, rx_state, tx_state;
> > > +     struct can_berr_counter bec;
> > > +     struct can_frame *cf;
> > > +     struct sk_buff *skb;
> > > +
> > > +     nct6694_canfd_get_berr_counter(ndev, &bec);
> > > +     can_state_get_by_berr_counter(ndev, &bec, &tx_state, &rx_state);
> > > +
> > > +     new_state =3D max(tx_state, rx_state);
> > > +
> > > +     /* state hasn't changed */
> > > +     if (new_state =3D=3D priv->can.state)
> > > +             return;
> > > +
> > > +     skb =3D alloc_can_err_skb(ndev, &cf);
> > > +
> > > +     can_change_state(ndev, cf, tx_state, rx_state);
> > > +
> > > +     if (new_state =3D=3D CAN_STATE_BUS_OFF) {
> > > +             can_bus_off(ndev);
> >
> > What does your device do when it goes into bus off? Does it recover its=
elf?
> >
>=20
> No, the device does not support automatic bus-off recovery. It
> requires an explicit CAN Setting and Initialization(CMD0) command to
> re-initialize the controller after entering bus-off state.

Ok

[...]

> > > +static int nct6694_canfd_start(struct net_device *ndev)
> > > +{
> > > +     struct nct6694_canfd_priv *priv =3D netdev_priv(ndev);
> > > +     const struct can_bittiming *d_bt =3D &priv->can.data_bittiming;
> > > +     const struct can_bittiming *n_bt =3D &priv->can.bittiming;
> > > +     struct nct6694_canfd_setting *setting __free(kfree) =3D NULL;
> > > +     const struct nct6694_cmd_header cmd_hd =3D {
> > > +             .mod =3D NCT6694_CANFD_MOD,
> > > +             .cmd =3D NCT6694_CANFD_SETTING,
> > > +             .sel =3D ndev->dev_port,
> > > +             .len =3D cpu_to_le16(sizeof(*setting))
> > > +     };
> > > +     int ret;
> > > +
> > > +     setting =3D kzalloc(sizeof(*setting), GFP_KERNEL);
> > > +     if (!setting)
> > > +             return -ENOMEM;
> > > +
> > > +     setting->nbr =3D cpu_to_le32(n_bt->bitrate);
> > > +     setting->dbr =3D cpu_to_le32(d_bt->bitrate);
> > > +
> > > +     if (priv->can.ctrlmode & CAN_CTRLMODE_LISTENONLY)
> > > +             setting->ctrl1 |=3D cpu_to_le16(NCT6694_CANFD_SETTING_C=
TRL1_MON);
> > > +
> > > +     if (priv->can.ctrlmode & CAN_CTRLMODE_FD_NON_ISO)
> > > +             setting->ctrl1 |=3D cpu_to_le16(NCT6694_CANFD_SETTING_C=
TRL1_NISO);
> > > +
> > > +     if (priv->can.ctrlmode & CAN_CTRLMODE_LOOPBACK)
> > > +             setting->ctrl1 |=3D cpu_to_le16(NCT6694_CANFD_SETTING_C=
TRL1_LBCK);
> > > +
> > > +     setting->nbtp =3D cpu_to_le32(FIELD_PREP(NCT6694_CANFD_SETTING_=
NBTP_NSJW,
> > > +                                            n_bt->sjw - 1) |
> > > +                                 FIELD_PREP(NCT6694_CANFD_SETTING_NB=
TP_NBRP,
> > > +                                            n_bt->brp - 1) |
> > > +                                 FIELD_PREP(NCT6694_CANFD_SETTING_NB=
TP_NTSEG2,
> > > +                                            n_bt->phase_seg2 - 1) |
> > > +                                 FIELD_PREP(NCT6694_CANFD_SETTING_NB=
TP_NTSEG1,
> > > +                                            n_bt->prop_seg + n_bt->p=
hase_seg1 - 1));
> > > +
> > > +     setting->dbtp =3D cpu_to_le32(FIELD_PREP(NCT6694_CANFD_SETTING_=
DBTP_DSJW,
> > > +                                            d_bt->sjw - 1) |
> > > +                                 FIELD_PREP(NCT6694_CANFD_SETTING_DB=
TP_DBRP,
> > > +                                            d_bt->brp - 1) |
> > > +                                 FIELD_PREP(NCT6694_CANFD_SETTING_DB=
TP_DTSEG2,
> > > +                                            d_bt->phase_seg2 - 1) |
> > > +                                 FIELD_PREP(NCT6694_CANFD_SETTING_DB=
TP_DTSEG1,
> > > +                                            d_bt->prop_seg + d_bt->p=
hase_seg1 - 1));
> >
> > What does your device do, if you set the bitrates _and_ the bit timing
> > parameters? They are redundant.
>=20
> The firmware calculates the default bit timing parameters when it
> receives the bitrates, and then overwrites them if it later receives
> explicit bit timing parameters.
>=20
> To avoid confusion and ensure consistent behavior, I will remove the
> bitrate setting logic in next patch. Instead, the bit timing will be
> determined solely based on the provided bit timing parameters.

Sounds good.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--6ebpqmmsutfol6xr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmf3X2cACgkQDHRl3/mQ
kZy+Bwf/cD7PcXTrBFCGsudbvqhERiXg3j4fGxKlZVoNrTxY13w0WWxCpMBfL9lZ
k+VJ+pxjPqL64WK5QAAem80jd8Pc+BqG+jdZIMEfTfYXvArLqzvnlfC16d6OoKmS
cZCI+XAbNQMFCkOSLNa3tS6jA5/rwlsy+mV7CMLeOphSUl+sTbW2PlIiPJIQQXzG
9Y1kcIlI1HLOTj2ilQ/8xgx+cNGh561Erou4H0fnNyoi4nuvlNcglfNm/m4B2DiQ
oybJYK34/vHSiz361rkyU32z6TNcW5PaR7FwDGM/pMScYdQOnZSgOhuIBrl71etT
/MLF7/H4MWskq7PZ97+8f+THFvhH2g==
=67Py
-----END PGP SIGNATURE-----

--6ebpqmmsutfol6xr--

