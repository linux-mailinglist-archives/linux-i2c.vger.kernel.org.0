Return-Path: <linux-i2c+bounces-8678-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F189F9BEC
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 22:29:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CD8D188CA88
	for <lists+linux-i2c@lfdr.de>; Fri, 20 Dec 2024 21:29:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 901182253EE;
	Fri, 20 Dec 2024 21:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="k0Bxqhmc"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 305506FC5
	for <linux-i2c@vger.kernel.org>; Fri, 20 Dec 2024 21:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734730143; cv=none; b=f1xhVxNyCw4oKAeODY6RTap5+Z6Shz9bIA5BfqxrqWTPIRyASZpAUT6t4j4jmwNYPNXR2xbdDCIWEjEU6M3w4Lgp46QBXP4IdrwtpJAgF7JEryRD7uGdLGSzHReJBMUvMb3FkdYTG7dE5iPgOBzFlq4aUB23P5uNCYeYhuBRxo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734730143; c=relaxed/simple;
	bh=seOFofnrYm+R//wCE9xNGKynLggQvDXrouOyidIkuz0=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W1Gu6ySit8tLNxfmW4sCIyA0ssHkZid18M0gxNjBe3fIIep8H+76p8gFDBDbu/ra7WLNxr02fCMy2wVug0JpYMfLeWx/uEyicnyjL0fMhpEdSqvYKsCUD5jlg6BCQ22QJ4a1xL/HG7P64Qep4W1fLKBEww0W6E2SV9DYQQSDPRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=k0Bxqhmc; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=seOF
	ofnrYm+R//wCE9xNGKynLggQvDXrouOyidIkuz0=; b=k0BxqhmcePPthfZ+lQbc
	RI+gHDgdWxzNi4dc1PzMIz7WWNSAufQHzCFMaIopNTsQxPXcoZKs2YWiM/EQXnrK
	a8Vop7rMs1XvSb83FSwPq3iji6xXlWrHKmFIzdHK8wUhuk//t+Zc7n5pebWiXSDt
	yCkxZoM+p8O7n1vJbSxN+NPwTBEVTXoD8MKH4Te7qpYrZjN19iGA47FQqHH9kVsh
	Dn12J56GHJsJ/VETsorsWUtVztCv6ReNErFDPL2j0zwT1ipP0H5Ec/IkJs5xryIH
	EpiN7/ZuLazJvMrU9Lj+293SoLiawwtsSLVrtXdJaZ8K+i6yecMmR3sm+AT0QrCl
	WQ==
Received: (qmail 1128934 invoked from network); 20 Dec 2024 22:28:58 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Dec 2024 22:28:58 +0100
X-UD-Smtp-Session: l3s3148p1@bbalVbopAJwujnsY
Date: Fri, 20 Dec 2024 22:28:57 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 0/9] Add support for I2C bus recovery for riic driver
Message-ID: <Z2XhmWiocC8m3JTY@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z2Vc61czIYHHNMI_@ninjato>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="65bi7RshTj+04ftj"
Content-Disposition: inline
In-Reply-To: <Z2Vc61czIYHHNMI_@ninjato>


--65bi7RshTj+04ftj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2024 at 01:02:51PM +0100, Wolfram Sang wrote:
>=20
> > This patch series introduces support for I2C bus recovery in the RIIC
> > driver, which is utilized in RZ series SoCs. The addition of bus recove=
ry
> > functionality enhances the reliability of the I2C interface by allowing=
 it
> > to recover from error conditions that might leave the bus in an unusable
> > state.
> >=20
> > Alongside the bus recovery implementation, the series includes several
> > cleanup and improvement patches that simplify and modernize the driver
> > code. These include replacing `dev_err` calls with `dev_err_probe`,
> > consistent usage of the `BIT` and `GENMASK` macros, leveraging devres
> > helpers for reset management, and improving code readability by marking
> > static data as `const`.
>=20
> I am planning to review and test this series later today.

Thanks for this series! Regarding the cleanups, rhe driver is indeed in
a better shape afterwards. Good work. Patch 9 still needs discussion but
for patches 1-8:

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

On a RZ/G3S, doing bus scans and some transfers with checksumming.


--65bi7RshTj+04ftj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdl4ZkACgkQFA3kzBSg
Kbb5bQ/+MI5cWvKj0CmzMy3wQZfL+d7+XSQXFEOm7XtQ2H9H+cmPOIFGawYaPRvb
Wp16TefQKKM4BP/GteC4QyCMGRsieh2k9eKgKbI7HSAhYeVSkXHR//I3EYJcxeNw
McnFHD/8bKpwtPcbyXG8THhYS1f7ZhIUKkLXqT2ZITT/awXV8R4gFSLP9CFYsge2
JnVQM3+7xdA5BXgnEizbo5VWPIgfDo/2FKQMiCVh4KPlZ6pvlbuQ5i+GAYFkYyaG
QEqPFAH/1OM/fQVgGZ2Ci7W4b2+5+vi9+6A02Wx2SRBgEy4uWrcKGw60B0EQ93KG
jQex16g4FjkdoGBsO7WREkHew3MYp4Od72u98S5i7b4kmBOB0IHJ5Dcpz3hkN+xf
qh/2O71PJY/I6wjuW+Mm9s/N/hhvJKTxo32MNLFjb/9lxz7j16dZoHT240BBn4rU
Vd8tlJR8sncqMNVKNzZWnqV/69RW26QHQwteJ8ylEUP0VUPk+PuJsxY9SLTHexeN
Peq6TUvN6ZJEjmuSBaavMsmWTsEz1bUW7scSXrmMPo0DhzfDTvnq1w4DV1J1voaG
5T/41O1QCMhNWEGAAh9LrUl6didfVnlc16yLcVha8xut/SaKLyPcp2JSAYCEiPD+
6ccs0MgwJfpvwl6GqBvVX46utSYB9nynzFv96WHJDthuzIum2dI=
=CQ04
-----END PGP SIGNATURE-----

--65bi7RshTj+04ftj--

