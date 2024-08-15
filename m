Return-Path: <linux-i2c+bounces-5439-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8028953C8E
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 23:23:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0D31B1C22001
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 21:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAD5D14F10F;
	Thu, 15 Aug 2024 21:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ajxlJBkg"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF6614E2F5
	for <linux-i2c@vger.kernel.org>; Thu, 15 Aug 2024 21:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723757008; cv=none; b=Eh4CIs6rovSuP6qGlGgOUGolrI5cT0ZqbbW2Xksk3sYewi4TKud3KYwMJJIag2tByZ2ccWmWmYlDG8G0gKLmoSSJ/nq145kAWBqp3dJmrfEy0AFnFxJQ75Nk2kv9pEP/LW6TLpaQTaq4g2dhqecs78RTktZIIecFqgBv8MUVs0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723757008; c=relaxed/simple;
	bh=AZutF7R72Po4j2+44VUGJ+9LHI7EGoMF18OvTnTPsnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BAVimgnsZ4hM9Cazjyy7psOQl1vM4rZs5LdkztP/FD5cg6bain6/v3JY0nQFbpE0IA2oWCJmubu9CLyFQy9EvSoQbnfohB0PfFGxrNwN131tn63hKSLjbEvwoyGz2gkj0H1KgyaufJhDhsv8kai1XV4hFU4GaEUb/kNKqGiIpFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ajxlJBkg; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Ap5t
	jKSh7iN7Shzbtr7hIMYK643lh5b8iT+hRHPERbE=; b=ajxlJBkgG41zr7m9i8Ae
	c8UPGi2mBQn5e69odep+IHybseDOrta8ZCMshBPYtZIb2cc5lmd8RCrG2ck3G7px
	TXjX5oZjpSQof7Hkvno++b210BW2GAWpCzRzp6k9P8tqveZUc63oNLY2kHxahchy
	xZvVRW3iVkkkd6S1dZZK9sVbpHUqsOhmDfAYoqFnXlFP9lzVjgqM+d9nbGYfb9cY
	xthFLCxnBD/FtaCJwDoJgGwEGdU3ybkXI0fcEeqKoDQD4rS51q0O7+2g5O0P8c27
	AqbDL3KGYtSDyeEnk43ep6mtUS8YU0fwR7bp3ZpZ7fITeuQzgaSIhNjOByyJ7f0d
	5w==
Received: (qmail 2401310 invoked from network); 15 Aug 2024 23:23:16 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Aug 2024 23:23:16 +0200
X-UD-Smtp-Session: l3s3148p1@tD9rc78f+KwgAQnoAH4zAClVBN/DeGcx
Date: Thu, 15 Aug 2024 23:23:15 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree-spec@vger.kernel.org
Subject: Re: [PATCH dt-schema 0/3] schemas: i2c: fix "smbus_alert" handling
Message-ID: <Zr5xw9-dY0dXfIGt@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree-spec@vger.kernel.org
References: <20240815120935.5871-1-wsa+renesas@sang-engineering.com>
 <CAL_JsqKJRhq9UzsjqbOAam0GSkm4R7m82FZ0zzYFp-mY2HS+Yw@mail.gmail.com>
 <Zr5KnHR-Qjukqt8K@shikoro>
 <CAL_Jsq+n96kzS9gpNb23d698pi0M1unfOpi1YvSGzDB+7VrENw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BdfUThgiOmKyjVxz"
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+n96kzS9gpNb23d698pi0M1unfOpi1YvSGzDB+7VrENw@mail.gmail.com>


--BdfUThgiOmKyjVxz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >   =C3=97 Building wheel for pylibfdt (pyproject.toml) did not run succe=
ssfully.
> >   =E2=94=82 exit code: 1
> >   =E2=95=B0=E2=94=80> [14 lines of output]
> >       WARNING setuptools_scm.pyproject_reading toml section missing 'py=
project.toml does not contain a tool.setuptools_scm section'

Thanks for bearing with me. I have to admit I stopped reading after
this...

> >       Traceback (most recent call last):
> >         File "/tmp/pip-build-env-5v1x378l/normal/lib/python3.11/site-pa=
ckages/setuptools_scm/_integration/pyproject_reading.py", line 36, in read_=
pyproject
> >           section =3D defn.get("tool", {})[tool_name]
> >                     ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^

=2E.. and this ...

> >       KeyError: 'setuptools_scm'
> >       running bdist_wheel
> >       running build
> >       running build_py
> >       running build_ext
> >       building '_libfdt' extension
> >       swigging libfdt/libfdt.i to libfdt/libfdt_wrap.c
> >       swig -python -Ilibfdt -o libfdt/libfdt_wrap.c libfdt/libfdt.i
> >       error: command 'swig' failed: No such file or directory

=2E.. so I totally missed this. It is even documented in README. Sorry!

> You have to install 'swig' which is a C to python binding thing
> pylibfdt uses. You should have a distro package for it. There's also a

It works now, thank you!

> pip package 'swig' that will download and build it. There's actually a
> MR to make that a dependency I need to go look at.

Sounds like a good idea to save you from support like here ;)

I will send out v2 in a few minutes.


--BdfUThgiOmKyjVxz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma+cb8ACgkQFA3kzBSg
KbZupg//VLfUFh9phE3qIA5gFzhFHzuWus/1NFa+bSzblntkUNZK+R+gVAJzi7u/
zFR0wlyXxUvyTJvuo0boWn2V+TsXHJYGBwtMwbwCJb3B8JomY2GpOcSSy0zQ5h/L
meL3R4hpqbBUJdTA+ecEaup/IwRm495odNthFXdJjeAeAbUlJz6CZeULzvywhS0X
7TiuYV5cyI7oVDojx213gsS0Iwomx0/mOeAv+QlKOTiOHrzi9Ht1K0weXz2C4tQg
qgvIqklgFMVS2PF0r9so1m0Wkn17PFa5+SSM+trezKdbUr4YxGyBD+pEntKqCm0J
GlOAwFNneGOxjg30hVc69k3IHMis9bA8RS7HJOkGUBkWYUFkwPqTxlmLIwlNCm1h
pMsk/GMtQUWfQivHrpoMErM3RBmGjIohM/sF03Ez6tkGhM0nxRrkOD3Gbw5+CTu4
Pjrn/ZIfaELFHK11yV+Km1NBcQ5qbmMMoD5xkZ6PrMzEPmiv0yDz1/kAipqoFcNd
gg9Ze3i35ewyFxH/+tOoVSxilIUblkgO3W+NhobfU7P8vSPGB9qTqfr9Tz327YGE
TboeRu4aHCxX6gUHh6EDxaThHb9yVaWqZL6/L1M4/6UwXorN3JjqGck3fVvltR2I
ntL7YMQOL1NhnIIjntIs3DjIRNaa3+ynqon9yeNIk6rGYq0yI3k=
=bwaJ
-----END PGP SIGNATURE-----

--BdfUThgiOmKyjVxz--

