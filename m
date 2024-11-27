Return-Path: <linux-i2c+bounces-8237-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 420419DA369
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2024 08:59:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0865328302D
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Nov 2024 07:59:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDAC61547FB;
	Wed, 27 Nov 2024 07:59:02 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E75314E2C2
	for <linux-i2c@vger.kernel.org>; Wed, 27 Nov 2024 07:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732694342; cv=none; b=TECn8SvYu//xzmaPg0wIrnB5UeUrjjf7KBcQ4RSE5CcYVg7lFOKcKu1l9037ZYSobouffuyxbB2+OjGMiFrp2bGW4/D1xHglUZvxzl8O4EcCjP6zv8IpjqcDC5EpnsSqSHt6PQWTlqIlWVYazisvBhwhQyocyU+ASYH72E9sKI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732694342; c=relaxed/simple;
	bh=ksZ0wZ8geOb/vvM5E2Zu1KEmiLZQ29CuzEySdiiaDkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/A/tY+jTtFvpvWwAL9tgF3dqqQKDUbzIShELgELRZnGJEVWyiTOayyQFF/PPcT/8oU/7VHtlc+Ty5vy9s2xFlDXRmrXZhx8LD3P8UjuaE5bhZsniL31PKdlY3W45xpBibTXrhfcaepest0FJ4qvJ6TB+dnqDQRL35ZFULjSHTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tGCwk-000639-Aa; Wed, 27 Nov 2024 08:58:50 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tGCwj-000ODy-0m;
	Wed, 27 Nov 2024 08:58:50 +0100
Received: from pengutronix.de (pd9e59fec.dip0.t-ipconnect.de [217.229.159.236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id A655F37E1A3;
	Wed, 27 Nov 2024 07:58:49 +0000 (UTC)
Date: Wed, 27 Nov 2024 08:58:49 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Carlos Song <carlos.song@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, 
	"o.rempel@pengutronix.de" <o.rempel@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"andi.shyti@kernel.org" <andi.shyti@kernel.org>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: RE: [EXT] Re: [PATCH v3] i2c: imx: support DMA defer probing
Message-ID: <20241127-analytic-azure-hamster-727fd8-mkl@pengutronix.de>
References: <20241127074458.2102112-1-carlos.song@nxp.com>
 <20241127-ninja-dormouse-of-bloom-8ee494-mkl@pengutronix.de>
 <AM0PR0402MB3937614F4866F4F15D2FDA21E8282@AM0PR0402MB3937.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="elw43wbzngdfoidk"
Content-Disposition: inline
In-Reply-To: <AM0PR0402MB3937614F4866F4F15D2FDA21E8282@AM0PR0402MB3937.eurprd04.prod.outlook.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--elw43wbzngdfoidk
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: RE: [EXT] Re: [PATCH v3] i2c: imx: support DMA defer probing
MIME-Version: 1.0

On 27.11.2024 07:48:13, Carlos Song wrote:
> > >  static void i2c_imx_dma_callback(void *arg) @@ -1803,6 +1804,23 @@
> > > static int i2c_imx_probe(struct platform_device *pdev)
> > >  	if (ret =3D=3D -EPROBE_DEFER)
> > >  		goto clk_notifier_unregister;
> > >
> > > +	/*
> > > +	 * Init DMA config if supported, -ENODEV means DMA not enabled at
> > > +	 * this platform, that is not a real error, so just remind "only
> > > +	 * PIO mode is used". If DMA is enabled, but meet error when request
> > > +	 * DMA channel, error should be showed in probe error log. PIO mode
> > > +	 * should be available regardless of DMA.
> > > +	 */
> > > +	ret =3D i2c_imx_dma_request(i2c_imx, phy_addr);
> > > +	if (ret) {
> > > +		if (ret =3D=3D -EPROBE_DEFER)
> > > +			goto clk_notifier_unregister;
> > > +		else if (ret =3D=3D -ENODEV)
> > > +			dev_info(&pdev->dev, "Only use PIO mode\n");
> >=20
> > On a system without DMA configured, with this patch we now get this info
> > message that wasn't there before. I think this might annoy some people,=
 so you
> > should remove it.
> >=20
>=20
> :-) hhh, get it.

Some things look reasonable when discussing the patch, but when you
see the new, cleaned-up version, you immediately realize that this is
going to annoy people :)

> How about change to dev_dbg?

Good idea.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--elw43wbzngdfoidk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEUEC6huC2BN0pvD5fKDiiPnotvG8FAmdG0TYACgkQKDiiPnot
vG+KkQf/Q+u30VAGEE7GQ8pY0YCDMlgwq9Lrph+jmHFG1nrNAnOc525i9+1N5Q5/
HR1cWXxUV/yHkt6tkmKlbmGTv5V4FtLOM1QFq4RDCYql8alygNNcN2v4ZUZg3827
el4CHe85/9/Ra2xln9yJ6WIrw7Lhn0Zh0CdpH97hYqmR0WHrpTecWFHbXNGIVieL
85DPurmsXB7lVCfi7sa4V0NjZtts+bkDeDEVnO30j3SAkOtf3KUMtpNWAIGUmRvk
uhdwGfpKbt4sYrmumv05Oly4FzQC8pGf1PAvpDxrlxTbvaHVnkjxvxQ86BbdWOIP
zdkYoGoEU24Eq3WBH+hUS1LjNmKcRQ==
=dQGb
-----END PGP SIGNATURE-----

--elw43wbzngdfoidk--

