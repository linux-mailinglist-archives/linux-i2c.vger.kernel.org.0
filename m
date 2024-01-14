Return-Path: <linux-i2c+bounces-1294-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D77282D004
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jan 2024 09:34:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25FF6282A36
	for <lists+linux-i2c@lfdr.de>; Sun, 14 Jan 2024 08:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BA9B1878;
	Sun, 14 Jan 2024 08:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="abAvIo5G"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A681876
	for <linux-i2c@vger.kernel.org>; Sun, 14 Jan 2024 08:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=JYdZ
	TJOgA1hh+qhARPKertZnUoZS1wEqx8XXCR7Nh7E=; b=abAvIo5GDVhVYeCW14FO
	+JtO4zzzYsGFGUrxbeTDeQjMwvWxyI9+0CfBtUpoEjJazQ0yUVp4phDFGQsSw6Jn
	LJu9H5FcPYq6iBNWYySsIq4ifLY6gMKmlEPxkhZblXqS4VnXUdOB3z3FLuBJ3GGJ
	tuYXYdsy80B9jdPh5M7qShsRe0Kt92fBIUOxI2IAJacFgpqVHrG5Kujj+RxgJ1co
	yZqO/5m23i8DSGDOz2GR0ulNqjwfHGcXiuwKwivy1vtvPbVYtjiDcVWnNz8SH1KW
	DwEpbZwJX5DxekCwP3aXx1G3vn1QITGl419J/Nm4AEv0yRXZdHGah3593FVV1zri
	cg==
Received: (qmail 1756940 invoked from network); 14 Jan 2024 09:34:06 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jan 2024 09:34:06 +0100
X-UD-Smtp-Session: l3s3148p1@5GCbwuMOeF5Qk7GI
Date: Sun, 14 Jan 2024 09:34:05 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: use proper email for my I2C work
Message-ID: <ZaOcfeFY4lgtOmn8@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20240113193942.2388-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+BUwKiRL+Rj5C8ab"
Content-Disposition: inline
In-Reply-To: <20240113193942.2388-2-wsa+renesas@sang-engineering.com>


--+BUwKiRL+Rj5C8ab
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 13, 2024 at 08:39:43PM +0100, Wolfram Sang wrote:
> Renesas is solely funding my I2C maintenance meanwhile, give them credit
> for that by using this email address.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--+BUwKiRL+Rj5C8ab
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWjnHkACgkQFA3kzBSg
KbZbEA/+IHInM7qp/6WOsRQZbfinbSstUjMaV1BuF2nKf1IXzxfabsbH5okAuh1B
8xOEMjuvtjiVd0uf89Uk3B0qgOnt9y1ydBPPUwe91h6MpC7AWpW1gGw5LLcfCX2Y
qIlXiMHPNF9A44v8mVQ1grsPVhapqfGXVRc/Cd29dcxoX4HWyyGyjh/PFuPf7sNE
ovIbDdPJ9HgIVD1pMfRhCc14YwCvCMlMWoXCxDsutOUOehsumaZid1+WP66VYU9L
+4TsFMhftSVM4EbNiCmNs//e92GTqy9XHr2m05trS05+Eejeh32xqnrAMkI8rUeS
DzxY5eKranOv+ELvE1EyBEiugcNDi7ObKig/joikimuIbEWBi86lGOrBnc1sJaqR
z3PVOJamMtRHK1dlyzBC5pkBFPu4DSl6wHJXtpsBikKyePlA5EMsDkGwujnV0ZOv
Pwf7HmIoXJc37EM1Kaljk/VTh8RqppNnonLZjU9fmzcBIjoUhbIbUO+ond8dmm0p
auwfdKvbGJ16dRwzljBLmn4rWL9z1vFQtsMHww9LY7Jlh3kk6DipWgVkzMnHeEHi
3bVtq2OIQRbdSQ33RmcyuOiGpoVwTRofDaG5gibCFUobP5vr7ZGkTl6UAiZEAiBA
32Mak9nSURykVqdR2O52nbxzLucz42YocmUWQcvPdK+T1Az++rU=
=YuLa
-----END PGP SIGNATURE-----

--+BUwKiRL+Rj5C8ab--

