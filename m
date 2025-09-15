Return-Path: <linux-i2c+bounces-12953-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C8CB57893
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Sep 2025 13:38:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B898116D9DB
	for <lists+linux-i2c@lfdr.de>; Mon, 15 Sep 2025 11:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B60372FF141;
	Mon, 15 Sep 2025 11:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ero2N126"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2F7271441
	for <linux-i2c@vger.kernel.org>; Mon, 15 Sep 2025 11:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757936148; cv=none; b=U8w32QSMq84O2ilLA8ee8bZH4MIDpbC6V2g/ABgsI09fvhwKoJpz6ab/+oBlBwcLqNMi80kmgN4trs40bgQoxSh0nFD1ViER7V4muqEy+aglA5YKBXkJm1A516B6ivdHOXI4dEqEBdZ08kyhXEiR0eJ7ueTETKG3oVWtYeMvuvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757936148; c=relaxed/simple;
	bh=YbyCcDqWw6FcXwd7+WDRZZ7cNwSItb6V3Z+Dbpw0JLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tPfhDkdJ03B19hvEcYkiXuDWHgkT0gu3P/ca2m+gqo6MTuhQrs1m1TLgkLzqb9nEz+9eWQPWKZdS57NDl1liexTKoGrIGnXyrxO/hWUtMNGBtGPiIt+7Yg2mmJ1SyvUhaYIzKTCQn5cGpnXcQ/2RmSF3WWmGg0JHZp0xhc/uYeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ero2N126; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=w8OW
	2uDi6ErI3MM6zAfiPSI+Mt41RJCxxGd5LE7WsSU=; b=ero2N126KwHBQ+en+uOA
	9KGVdnzdMnPPGVTe1WCVVjYAJysCVA3rmrKCdvuxx4lbA7UqVxSEkodnWI4A5Yh3
	wM8t5bwe2xWsH51kpq/rhq1v1GD1LLyoMlEuL2k3iCnMkok//rm0/eYAD+f1Cf9q
	BthISTz2ydq6UWplrek22zYlyXtuolDg8MJxc+Dy78y1S4rubX/mp8ZPfUSocPc6
	QR4O4fWltYGT0k4y+Jz6K1RyLGYEEcXkjM5vcxegu2Zx6fHNrM2giy4/wXiYnwZU
	buM7ceNUvgGr3KWQuXR0Tu3doIhYZIuMZT4TYyiKxFFEzvQPuvBu+Ex7g0MkfW3A
	ww==
Received: (qmail 2345910 invoked from network); 15 Sep 2025 13:35:40 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Sep 2025 13:35:40 +0200
X-UD-Smtp-Session: l3s3148p1@8aotZ9U+AowgAwDPXxLYAMR913XberYj
Date: Mon, 15 Sep 2025 13:35:40 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Luca Ceresoli <luca@lucaceresoli.net>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
	Jonas =?utf-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2] i2c: muxes: Add GPIO-detected hotplug I2C
Message-ID: <aMf6DLr8pTCP8tKn@shikoro>
References: <20250915060141.12540-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MkrhhPs+peK3vGck"
Content-Disposition: inline
In-Reply-To: <20250915060141.12540-1-clamor95@gmail.com>


--MkrhhPs+peK3vGck
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 15, 2025 at 09:01:36AM +0300, Svyatoslav Ryhel wrote:
> Implement driver for hot-plugged I2C busses, where some devices on
> a bus are hot-pluggable and their presence is indicated by GPIO line.
> This feature is used by the ASUS Transformers family, by the  Microsoft
> Surface RT/2 and maybe more.
>=20
> ASUS Transformers expose i2c line via proprietary 40 pin plug and wire
> that line through optional dock accessory. Devices in the dock are
> connected to this i2c line and docks presence is detected by a dedicted
> GPIO.
>=20
> Micha=C5=82 Miros=C5=82aw (1):
>   i2c: muxes: Add GPIO-detected hotplug I2C
>=20
> Svyatoslav Ryhel (1):
>   dt-bindings: i2c: Document GPIO detected hot-plugged I2C bus
>=20
>  .../bindings/i2c/i2c-hotplug-gpio.yaml        |  65 +++++
>  drivers/i2c/muxes/Kconfig                     |  11 +
>  drivers/i2c/muxes/Makefile                    |   1 +
>  drivers/i2c/muxes/i2c-hotplug-gpio.c          | 263 ++++++++++++++++++
>  4 files changed, 340 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-hotplug-gpi=
o.yaml
>  create mode 100644 drivers/i2c/muxes/i2c-hotplug-gpio.c

Adding Herve and Luca to CC because they want to achieve the same with
their I2C bus extensions, no?


--MkrhhPs+peK3vGck
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjH+ggACgkQFA3kzBSg
KbaZGw/+J0rqDvCN0mzbRK4/L2rPwJ40Oqr9vwGBCvSQO17CpsszXK6scxjjmjzo
FAhqL2+/9vCX08INJ/SoW3J4SwUcN+7pGmtrwYe8dI4VtJi9x9OxWsqkfNH/gif2
sG9OOwVmmLSGy+OqWBqRd0WxoutA9Wb2BUV7UhbbmwEaA/yWjxyCi94zeABiHSKp
rZw7oHPinOAB4nTEL2C01mGH7LnvJNZGqcO5DYK1W+d1PhBJAaDHD7bI3bIprVVK
9oJpFUnT8EB3eik4NSveiiwm9cciUInBHGfNhZEtVepNNw3B2zJRQ2zz4RTdqVBa
vEGWa5GoQcJqyTbmpezCP/MbA3ucGLEQ4X2JAB04fHYgQnCfiVRyrRe7KN/A8ygF
fbQg/XbC0LIKxIhSUC1d1qUe/aqEHHMCUmNow0zniV6uDLkJ8jD5/OW3r/i59Fmu
nbmjpOnbNa8fi2Pkp6xXLqMqu/+HkPdleCwbe4zdenxHRAEhv5hj7HR15WjZi89K
SoTOcub5KhyajMspmDEHFL3DvxPv/8eCc1WngoLHIFJcRoyCKNENq+yX2LJ3VC1i
gWfrvcY8mElmbi2JXVsSnhD19FztnbRY0AYJgx1qn4o+ikuY/39BmVdqoH0oFuwz
3HqRCkjki5E07ZfHm0hTAtWvZQHfBhZNXcGLbW8TrB+ps4bDlgg=
=W0qL
-----END PGP SIGNATURE-----

--MkrhhPs+peK3vGck--

