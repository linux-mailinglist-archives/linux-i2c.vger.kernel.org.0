Return-Path: <linux-i2c+bounces-3298-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 730038B5A9F
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 15:56:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CF931F21493
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Apr 2024 13:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363A6757E3;
	Mon, 29 Apr 2024 13:56:21 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CD0B6A8DC
	for <linux-i2c@vger.kernel.org>; Mon, 29 Apr 2024 13:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714398981; cv=none; b=HDFxASr01b2hGdjlZicuTndzaZtS4ngMImNs4t0t/YJScPkjmmT7Nqll2Voth7QMXu8Lj+iybiknPCipBH6mIftft8qH1SYli2I32eAD3LYunTCtLXi9wIc7oBEmsIFaRb4EkSwwUn2DibTcAMMzk5p28X14w17UbNFyHFiUozg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714398981; c=relaxed/simple;
	bh=XJJqLybtv4ZNsL2tQOnqLpSX+EdHqF6ImFUkTFrJaXE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AOQh+LYz1829GBoYO5DjOFatwyGxQAX43i6QgQ7pfC8BfqhOIVKwCox1Nczygivi6N1Zcc0+qCBEYFG68jo+AzZHAbMJRrcrWk8fWO3r4JiXt2pEKGAFc8o96UIKyQ+NGbs+z3v07uQfnr++ZNPtRfOVolXilWQWi4YnVr0jilQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1RU7-0001tD-C8; Mon, 29 Apr 2024 15:55:59 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1RU5-00EzUo-VH; Mon, 29 Apr 2024 15:55:57 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1s1RU5-00BTdr-2q;
	Mon, 29 Apr 2024 15:55:57 +0200
Date: Mon, 29 Apr 2024 15:55:57 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH RFC] i2c: Add a void pointer to i2c_device_id
Message-ID: <f6ddimzsqjuweaeagsmnfowcktofngjrafosab6owxj4mxkulk@2f6mg7wfdk6p>
References: <20240426213832.915485-2-u.kleine-koenig@pengutronix.de>
 <Zi9gRVVw7qbKSL5k@smile.fi.intel.com>
 <youkuwbynndjpcoux2zaxwjp5gquj647leub3bat37a4wtho6p@ypir6ay3vhaw>
 <Zi92UCnZa90DXAI9@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yplwnmmgy24mn2r3"
Content-Disposition: inline
In-Reply-To: <Zi92UCnZa90DXAI9@smile.fi.intel.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--yplwnmmgy24mn2r3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Andy,

On Mon, Apr 29, 2024 at 01:28:32PM +0300, Andy Shevchenko wrote:
> On Mon, Apr 29, 2024 at 12:21:05PM +0200, Uwe Kleine-K=F6nig wrote:
> > On Mon, Apr 29, 2024 at 11:54:29AM +0300, Andy Shevchenko wrote:
> > > On Fri, Apr 26, 2024 at 11:38:33PM +0200, Uwe Kleine-K=F6nig wrote:
>=20
> ...
>=20
> > > >  static const struct i2c_device_id wlf_gf_module_id[] =3D {
> > > > -	{ "wlf-gf-module", 0 },
> > > > +	{ "wlf-gf-module", },
> > >=20
> > > In such cases the inner comma is redundant as well.
> >=20
> > I would tend to keep the comma, but no strong opinion on my side.
>=20
> It's just a confusing leftover in my opinion.
>=20
> > If another member init is added later, the line has to be touched
> > anyhow, but in the layout:
> >=20
> > 	... =3D {
> > 		{
> > 			"wlf-gf-module",
> > 		},
> > 		{ }
> > 	}
> >=20
> > I'd keep it for sure.
>=20
> That's not what I object. Here I am 100% with you.

OK, agreed. I'm not sure yet if I prefer

	static const struct i2c_device_id wlf_gf_module_id[] =3D {
		{ "wlf-gf-module" },
		{ }
	};

or

	static const struct i2c_device_id wlf_gf_module_id[] =3D {
		{ .name =3D "wlf-gf-module" },
		{ }
	};

> > > In general idea might be okay, but I always have the same Q (do we ha=
ve it
> > > being clarified in the documentation, btw): is an ID table the ABI or=
 not?
> > > In another word, how should we treat the changes there, because ID ta=
bles
> > > are being used by the user space tools.
> >=20
> > Note that the layout doesn't change and the traditional interpretation
> > of the data still works fine. Or do you see something that I miss?
>=20
> Do we have any configurations / architectures / etc when
> sizeof(kernel_ulong_t) !=3D sizeof(void *) ? If not, we are fine.

According to https://wiki.debian.org/ArchitectureSpecificsMemo (my goto
address for such questions) we have sizeof(void *) =3D=3D sizeof(long) on
all archs. Also storing a pointer in today's struct
i2c_device_id::driver_data is so common that it should be safe to assume
that sizeof(void *) <=3D sizeof(kernel_ulong_t). And that <=3D is enough
that the union doesn't get bigger.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--yplwnmmgy24mn2r3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYvpuwACgkQj4D7WH0S
/k6DJAgAqZLAEMwQxR26phS6LkfoFWF90kQ7uLUalhP6/azWI17TvOZ8dT+wvyIs
ivFfDWWPKzm6I2oQVwxE7wjXfaywlXIPoB+3fPlwjnsXk3vkgh1Yr5riUwS/cA/D
oAxMwDqEWAR5lpJpYPtaS0ROcTQyUSwpVF3sOK0X5Nx3UPu7Bp9T6/Wy2Zx48GxH
AzrhhNj5Q0di//Bf6mI23ldI4CcPk2b1dweu/QYYIvczddF411DOQQpOMCmvegRg
BZeh2hZLOyjqIDDUIo1NYCG9s9uZ2tJ3isNeL5qa7iA9ia36CBERhTVjHlCSQksA
2RRvwiFhudWYAxMFrsc1ZOq0IfbE/w==
=78yx
-----END PGP SIGNATURE-----

--yplwnmmgy24mn2r3--

