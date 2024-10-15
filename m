Return-Path: <linux-i2c+bounces-7381-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D63299E2AC
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 11:22:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 219FF2830C4
	for <lists+linux-i2c@lfdr.de>; Tue, 15 Oct 2024 09:22:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F35951DAC99;
	Tue, 15 Oct 2024 09:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DaiM59KA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6D51D9A76
	for <linux-i2c@vger.kernel.org>; Tue, 15 Oct 2024 09:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728984126; cv=none; b=l5wVsXZbcwSVxU3YQPOSHvjPI6kKT3jIPliW+18RiherSVvDpg4H4ZRghuWNLSoYj9OG3adof2s3wDHlJhQMNcAuG4SKXVnnag+DgeV3HRPgOZthOouuuhIiEFtoX13yPa40n/Zag4E8uFoNor0d2oxsBAXMxY2yTZTq/yCSD2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728984126; c=relaxed/simple;
	bh=6+gmtYw45aqHn+y+b2wThFOrNk2glrL/25OmMya8cBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tvHvgoiQYxC88nh3Grv+ACIuFmxH0IcFt1oQrR1iE+2/IUr1VlvYS1jlu6tvqN/pak2HBb23u2qojcU9fvZdzmNrAR3NKSPM3nMTLHVM90NRLpvv+iTe9noX4KG3Q59RCWhziEvd/OCOzQpBoWg0OHDxK/Y0W4ej7RPTmxmaIrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DaiM59KA; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=iQHq
	zbKxqUoCmjQH95lvBtyd+w6FkD7yAoIG21ZXiMw=; b=DaiM59KAEjZbv29Gxft6
	Utxa9lBXNLCsXY7cE0TJ38tgHg9fRCuYiPxu5jD9DBybnORQPZSJvof5CwUbEBXh
	czK286oetIvsd2GaNVHl6VaOXI24nfKDX7jFEVG//sfZ9MkmLbhmqQpE0eHI/y7M
	fA3qLsT+VSCBaBZcY1U2J70GkCodKk4TOQuihthE/VsHxqA65Kqyci7xDSlH+g31
	duMDcDhuz/jM5fxNgSYuJH3bUNk927Rggnu3LdIrhVFbKwcSNaO9a5PISElG3SHm
	J62dgh/YI4SsCJDVAheEm7QlO65pdGQ2f3HxiHBQ5mRCWKO9SLQTnT4t/oR1FV0t
	ug==
Received: (qmail 2654849 invoked from network); 15 Oct 2024 11:22:03 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Oct 2024 11:22:03 +0200
X-UD-Smtp-Session: l3s3148p1@bZV1fIAkdpEgAwDPXyR3ALZ8hQlyja84
Date: Tue, 15 Oct 2024 11:21:57 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Troy Mitchell <troymitchell988@gmail.com>, andi.shyti@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] i2c: spacemit: add support for SpacemiT K1 SoC
Message-ID: <Zw40NajLjMa_AnY4@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Troy Mitchell <troymitchell988@gmail.com>, andi.shyti@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20241015075134.1449458-1-TroyMitchell988@gmail.com>
 <20241015075134.1449458-3-TroyMitchell988@gmail.com>
 <eb4112aa-21d0-4537-a18c-940d8832711a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J9OO5FzHaRoktCip"
Content-Disposition: inline
In-Reply-To: <eb4112aa-21d0-4537-a18c-940d8832711a@kernel.org>


--J9OO5FzHaRoktCip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +static inline u32 spacemit_i2c_read_reg(struct spacemit_i2c_dev *i2c, =
int reg)
> > +{
> > +	return readl(i2c->base + reg);
>=20
> So basically short and obvious code like this:
>=20
> 	readl(i2c->base + reg);
>=20
> you replace with:
>=20
> 	spacemit_i2c_read_reg(i2c, reg)
>=20
> how is this helpful?

I always have the same question when I see this. However, I don't blame
Troy. We have quite some occurances of this in the kernel, so I wouldn't
be surprised if people think this is a kernel-style-pattern :/


--J9OO5FzHaRoktCip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmcONDUACgkQFA3kzBSg
KbaeSg//dFtNaRJ0AHNqbcfBgNb+AqFiu4SRst/KrQ8catyR3apD1Ul3c3tituAq
w3J/27NuNHDz5FUOz35CryCtOh8Ox6KUz/uUd5dACYc+PQmat65fvRVR5rZjKuCr
OKRDcXqblMwmwILkGIiEUdIvMDtIr8p8BPR8EHvdDaPRxb7hQGdZmaZSqnv0WxB0
VSF017hg1JoFz8HpdOIdAZ+3qZXxsLlyMhHC26LFUbeAw4EkPlLyAntGj1f0uTgS
TdPpqcoT3I5CUKv6Wao0v49VD3urDOWF5kVRdlcnNdVjAoPeKtC2gn3ZA8bTOaYF
QDh2oPT3CJ32nwRoKiEj0C0wvvz3+IjfYAVGeAlghKI4J1uwyZjo1PatoN2hp3Wl
mpzVOADN944TWyE7mIjKtew7PRaJsdQ0W3rkpd4Qe/pANCigAZP38r1luicvlH/r
EnT2eycO5pTbQhB4VnwTTi9P3ZIL+Yb/oD8jfTejcizGqOs9X8YTUcSwAFNj765p
WXovX5sOBxHTXiJ0kJzfUtHgUnIezgbIa76xRVeKYFRvFLkqeR3nXFo/GCUH9YVI
uu4lBNtZthxwYxA0NORLr97zLyCUzqAg0MoCP7AGcbr0dF9wT3j9PpmBgxn6wDio
itmfHg2Mt/HqXX7idDfB3KiQpGE1Yufvt22n3jI/qLo4eaKkwL8=
=cdl7
-----END PGP SIGNATURE-----

--J9OO5FzHaRoktCip--

