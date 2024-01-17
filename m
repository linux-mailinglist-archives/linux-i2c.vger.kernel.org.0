Return-Path: <linux-i2c+bounces-1348-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6548083005F
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jan 2024 08:12:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 15BB5B23F2C
	for <lists+linux-i2c@lfdr.de>; Wed, 17 Jan 2024 07:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192088F59;
	Wed, 17 Jan 2024 07:11:59 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3B248F47
	for <linux-i2c@vger.kernel.org>; Wed, 17 Jan 2024 07:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705475518; cv=none; b=RTT8tRzjyrFJDqYeo7mTAXLtEoJPpTA+qRNRRkYqqOoiD4Uh+gxMVi3+tUb3CaNwfgOxwLjgu6OdPqG82+5TP9zGR1dhVQzSdCOJhwxQOxq9xOgwPJgMSNAhutrV642S6gjhUe3lgWzTg1CjEecWabvAaZ0VRL68smUTvOnABYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705475518; c=relaxed/simple;
	bh=Pe/8Y5e8wjnwxOK1x/nv/CC2IZ1uQR+cdiBkKxq8rXM=;
	h=Received:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-SA-Exim-Connect-IP:X-SA-Exim-Mail-From:
	 X-SA-Exim-Scanned:X-PTX-Original-Recipient; b=ccVtdrznXwUqJLdKzruWUFFCzqamF4pYdDwlVC1245o4qNvkLlIh5eruiyfXZVsOpAn3z09xAfmLq1JlifC72wTaOp8hKXMv18RQPmz+lQ4v02QoqaOYT1pHX0Ni4kigchlP0RB+iB7C0eufNw3XYo4Ea96Lk0AXwPzlQzhO1Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rQ05H-0003ap-S1; Wed, 17 Jan 2024 08:11:35 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rQ05G-000Pil-Vi; Wed, 17 Jan 2024 08:11:34 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rQ05G-001Sjq-2q;
	Wed, 17 Jan 2024 08:11:34 +0100
Date: Wed, 17 Jan 2024 08:11:34 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, NXP Linux Team <linux-imx@nxp.com>
Subject: Re: [PATCH v8 1/1] i2c: lpi2c: use clk notifier for rate changes
Message-ID: <k3fmklckbxvv4ke6htt3r4u536mu5l3dyq63ys3tujsmk73eei@3y3ovsegskhr>
References: <20240110120556.519800-1-alexander.stein@ew.tq-group.com>
 <zac3ukluinnmybdmmkwqbq3zjlha4f5pri4zhxrfg2vfshr7ez@nc25m4uxmroc>
 <4540211.LvFx2qVVIh@steina-w>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7su3qk7xlya2eo4h"
Content-Disposition: inline
In-Reply-To: <4540211.LvFx2qVVIh@steina-w>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--7su3qk7xlya2eo4h
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Alexander,

On Wed, Jan 17, 2024 at 08:02:19AM +0100, Alexander Stein wrote:
> Am Donnerstag, 11. Januar 2024, 09:51:30 CET schrieb Uwe Kleine-K=F6nig:
> > On Wed, Jan 10, 2024 at 01:05:56PM +0100, Alexander Stein wrote:
> > > +	lpi2c_imx->clk_change_nb.notifier_call =3D lpi2c_imx_clk_change_cb;
> > > +	ret =3D devm_clk_notifier_register(&pdev->dev, lpi2c_imx->clks[0].c=
lk,
> > > +					 &lpi2c_imx->clk_change_nb);
> > > +	if (ret)
> > > +		return dev_err_probe(&pdev->dev, ret,
> > > +				     "can't register peripheral clock notifier\n");
> > > +	/*
> > > +	 * Lock the clock rate to avoid rate change between clk_get_rate() =
and
> > > +	 * atomic_set()
> > > +	 */
> > > +	ret =3D clk_rate_exclusive_get(lpi2c_imx->clks[0].clk);
> > > +	if (ret)
> > > +		return dev_err_probe(&pdev->dev, ret,
> > > +				     "can't lock I2C peripheral clock rate\n");
> > > +
> > > +	atomic_set(&lpi2c_imx->rate_per, clk_get_rate(lpi2c_imx-clks[0].clk=
));
> > > +	clk_rate_exclusive_put(lpi2c_imx->clks[0].clk);
> > > +	if (!atomic_read(&lpi2c_imx->rate_per))
> > > +		return dev_err_probe(&pdev->dev, -EINVAL,
> > > +				     "can't get I2C peripheral clock rate\n");
> > > +
> >=20
> > If the clkrate isn't expected to actually change, you can just delay the
> > call to clk_rate_exclusive_put() until driver unbind time and not
> > register a notifier at all. The result would be more lightweight, you
> > wouldn't even need an atomic variable for .rate_per.
>=20
> On imx93 I don't expect the parent clock rate to change, as each lpi2c=20
> peripheral has its own dedicated root clock.
> On imx8qxp and imx8qm lpi2c has it's own "clock tree", but these clocks a=
re=20
> managed by the system controller.
> Now idea about imx95 as this one apparently uses SCMI based clock driver.
> No idea about imx7ulp, imx8ulp and imx8dxl.

Then maybe pick the easier approach and only start with a notifier when
the need arises?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--7su3qk7xlya2eo4h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWnfaUACgkQj4D7WH0S
/k49ogf8CmOvjetSmlgCRZfTd43zbT3eB6YozAGqQhKOcafIsxOCjmYpxo9BhHLv
HUJx9WChVtqpMpOQl8yiddK/JYw1DhrxVPA1F0yZoCAN3xhQr2forIL1779KPjOB
0LZVlz+NfHwugYkIqMVgCA/pMAsUs0ZKeOx+QMdgD3WL3bQKZJAp8XgbM39bukxC
1eu4Obf7cXDHohL72af3KE4r8pT4xysJVZoyqQXRbE0fnlsSdMBo/x1KyEWVeLnI
Fjts83IukWcklsbr2et4XcLdkTg7uoMpH6NZ5ytLCEEVjHeHNBBbwtGypZDJkTgo
9tpSXRFiRVcKsosO8zecV9tVrWw4YQ==
=8uuq
-----END PGP SIGNATURE-----

--7su3qk7xlya2eo4h--

