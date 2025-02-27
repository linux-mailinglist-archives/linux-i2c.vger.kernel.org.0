Return-Path: <linux-i2c+bounces-9628-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCCAA480CB
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 15:20:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7382C7A0703
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 14:19:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFFD82356B0;
	Thu, 27 Feb 2025 14:18:31 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077DC235BE8
	for <linux-i2c@vger.kernel.org>; Thu, 27 Feb 2025 14:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740665911; cv=none; b=ELclizXF8693H7dvdvnSRRYNqaktR23uAahs21yK3W7HmRPyqLfVrLMGFXlj/msCga3W6mxzICyTqI0OI72A00p1B3N36C1P6h+LlK9+Gxg+mF3k4i2Kpn4iFF6ME856FdE8IG5/AXwTVHDEzBTPUmYqkpgcbxej6fokMIey8ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740665911; c=relaxed/simple;
	bh=LxGqDDciDNPai+yMXfQ6y3up7TsSxsnZOwf8EJYTN8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SWy75Oe/lUzlDLYJu9hGmCSAhskyb5yAK7LiX/ghZvf0//bXt3i8LCh3MGF+oGNj8Blk9Q7qkmID5mFxo6NM0igPTWZaY0WSvbifkvtGyt+r7yOiapNLVvX5Yodd9XhrFojlvqL+dIjhsjPL9cQlrpKYVizTK2fYV1sSYVlXiNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tnehz-0003GQ-MD; Thu, 27 Feb 2025 15:17:51 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tnehw-0038i4-0Z;
	Thu, 27 Feb 2025 15:17:48 +0100
Received: from pengutronix.de (p5b164285.dip0.t-ipconnect.de [91.22.66.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id C00033CD6A6;
	Thu, 27 Feb 2025 14:17:47 +0000 (UTC)
Date: Thu, 27 Feb 2025 15:17:47 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Vincent Mailhol <mailhol.vincent@wanadoo.fr>
Cc: Ming Yu <a0282524688@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, linux-can@vger.kernel.org, 
	netdev@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-usb@vger.kernel.org, tmyu0@nuvoton.com, lee@kernel.org, 
	linus.walleij@linaro.org, brgl@bgdev.pl, andi.shyti@kernel.org, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com, 
	alexandre.belloni@bootlin.com
Subject: Re: [PATCH v8 4/7] can: Add Nuvoton NCT6694 CANFD support
Message-ID: <20250227-gregarious-garrulous-echidna-ca7975-mkl@pengutronix.de>
References: <20250225081644.3524915-1-a0282524688@gmail.com>
 <20250225081644.3524915-5-a0282524688@gmail.com>
 <a32b4ca1-0bcf-48e4-87ab-61fbd077a3c3@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i5nv6d7na7xl5d3b"
Content-Disposition: inline
In-Reply-To: <a32b4ca1-0bcf-48e4-87ab-61fbd077a3c3@wanadoo.fr>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--i5nv6d7na7xl5d3b
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v8 4/7] can: Add Nuvoton NCT6694 CANFD support
MIME-Version: 1.0

On 27.02.2025 11:08:50, Vincent Mailhol wrote:
> > +static int nct6694_can_stop(struct net_device *ndev)
> > +{
> > +	struct nct6694_can_priv *priv =3D netdev_priv(ndev);
> > +
> > +	priv->can.ctrlmode =3D CAN_CTRLMODE_LISTENONLY;
>=20
> Hmmm, when Marc asked you to put the device in listen only mode, I think
> he meant that you set it on the device side (i.e. flag
> NCT6694_CAN_SETTING_CTRL1_MON) and not on the driver side. If you set
> CAN_CTRLMODE_LISTENONLY flag, that will be reported in the netlink
> interface. So you should not change that flag.

ACK

> But before that, did you check the datasheet? Don't you have a device
> flag to actually turn the device off (e.g. sleep mode)?

Please test that the ifup -> ifdown -> ifup sequence works properly,
even on a busy bus and on a bus without with a 2nd CAN station that is
sending and you are the only receiver.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--i5nv6d7na7xl5d3b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmfAdAgACgkQDHRl3/mQ
kZxjHQf/cl+NPaGA6wNUTa68Le8AS6tbcg6UkzWcAd8AS8/6CWkgPeebGEbmzKvl
iENWrgc7mfiuy346ubOPufojybeeXMdOHLiwDPEkVgZegMycqUnS+2F/mTCm50fR
vf9mETJuODrqvL4I265jS9Z+SUA/R/pzTcs0pQItMSzfUwGJ5nv9JQS8mv3MOQhM
zOqyOMX1bv3+0Ov9ZTpjaV2JoOmTqpDFIYuN2DyqGl+NlJfZyHCp/Z8UJ7MyQykL
Nzk53OPw0yb1MC6RT8m5ijRnpiVzfV5Et+2/FEXSW0aE/SXBRailPfDqdEmxXFnf
f4DOoo4Z+H6xhf0L7EUZ1HcmpU+ckA==
=2o2X
-----END PGP SIGNATURE-----

--i5nv6d7na7xl5d3b--

