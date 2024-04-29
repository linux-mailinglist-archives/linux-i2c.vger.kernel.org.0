Return-Path: <linux-i2c+bounces-3291-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C60E48B551C
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 12:21:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80D0A282E03
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 10:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 996E43B298;
	Mon, 29 Apr 2024 10:21:22 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B96637169
	for <linux-i2c@vger.kernel.org>; Mon, 29 Apr 2024 10:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714386082; cv=none; b=AdRuCW8hUskFWpOA0Yvp4p2yqNEGF1AauPVD7PgZnDxT4oERtFPZHXgdm6IlGzA8VNi/passpaF+9p9RZB53rxu7KGQx1guLao/MXSdNTDRksaLf0Xs/ztC01AhjwGy2oN36tr2sxgfseH6+oVWienY5o85gA7tAJasg9gX4SD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714386082; c=relaxed/simple;
	bh=9zXkXARb0Y7OThiBiWvdEzXLPbICHSg8JrvKpqC7LCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dlj7sUmdLknWrsh2T4O614+lZiLv3PInWfDOsWejaXtpLgNd02jGfIeJQBkL22edcXC6ZXRXzALXme7OEQY6GGeh+cz9djHahOedMyXCtYfHB3KjCjHLXy7VCZMZp4c5xWygqDCSWZ8mb2uFAYOD5R/PlPcfvTto/aSNT5Kert0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1O8B-0005bP-Ut; Mon, 29 Apr 2024 12:21:07 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1O8A-00ExbE-2L; Mon, 29 Apr 2024 12:21:06 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1O89-00BJHy-3B;
	Mon, 29 Apr 2024 12:21:05 +0200
Date: Mon, 29 Apr 2024 12:21:05 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH RFC] i2c: Add a void pointer to i2c_device_id
Message-ID: <youkuwbynndjpcoux2zaxwjp5gquj647leub3bat37a4wtho6p@ypir6ay3vhaw>
References: <20240426213832.915485-2-u.kleine-koenig@pengutronix.de>
 <Zi9gRVVw7qbKSL5k@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yfivxb4d4fdixn6l"
Content-Disposition: inline
In-Reply-To: <Zi9gRVVw7qbKSL5k@smile.fi.intel.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--yfivxb4d4fdixn6l
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Apr 29, 2024 at 11:54:29AM +0300, Andy Shevchenko wrote:
> On Fri, Apr 26, 2024 at 11:38:33PM +0200, Uwe Kleine-K=F6nig wrote:
> > Traditionally a struct i2c_device_id has a kernel_ulong_t member to
> > store some chip variant data. Some drivers use it to store an enum,
> > others to store a pointer. In the latter case there is some ugly(?)
> > casting involved. To improve that, add a void pointer in an anonymous
> > union together with the integer driver_data.
> >=20
> > This way a i2c_device_id requires usage of a designated initializer when
> > the driver_data or data member should be initialized, but IMHO that's
> > fine and you might even consider that an advantage.
>=20
> ...
>=20
> >  static const struct i2c_device_id wlf_gf_module_id[] =3D {
> > -	{ "wlf-gf-module", 0 },
> > +	{ "wlf-gf-module", },
>=20
> In such cases the inner comma is redundant as well.

I would tend to keep the comma, but no strong opinion on my side.
If another member init is added later, the line has to be touched
anyhow, but in the layout:

	... =3D {
		{
			"wlf-gf-module",
		},
		{ }
	}

I'd keep it for sure.


> >  	{ }
> >  };
>=20
> ...
>=20
> In general idea might be okay, but I always have the same Q (do we have it
> being clarified in the documentation, btw): is an ID table the ABI or not?
> In another word, how should we treat the changes there, because ID tables
> are being used by the user space tools.

Note that the layout doesn't change and the traditional interpretation
of the data still works fine. Or do you see something that I miss?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--yfivxb4d4fdixn6l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYvdJAACgkQj4D7WH0S
/k5SrAf/UQu0T91ViSkNd60kQV/AoTviGlvx8F5UlQbv/Vqu3BH9V2qGdpKpBhZh
rp4lcTa2z6SegBoH6yctMYp9vfPWE1MB0URyTm2Hvzj9zCxOB7bu2gtuAzYeKvLG
UyAzHCqa9K+AwWgSAb/rH3aqy3pHwxL3JoB+FSgcu75SBgpPkRukZgJDrCB7gWzb
AUlb0Z3LrSjRUGSVvxxSxNy5S69CSDMQ20cvK8of7mno8uL0MYJ/RKCRfx+XGsvm
V0HZwZgSI+D/oNCIKLtB9DoH/3W9xGCZIgnfBDWbtKGizCt9A9bDujaR8cYAdGrR
dM19ko2kATgu3pL2e/Jf1ly3N97j1Q==
=eVcX
-----END PGP SIGNATURE-----

--yfivxb4d4fdixn6l--

