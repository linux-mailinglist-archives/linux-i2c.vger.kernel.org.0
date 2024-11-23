Return-Path: <linux-i2c+bounces-8163-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98D6B9D6B4E
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Nov 2024 20:56:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5E58928214D
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Nov 2024 19:56:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D289C18A6BA;
	Sat, 23 Nov 2024 19:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f8I7xdrb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738BD17C2;
	Sat, 23 Nov 2024 19:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732391787; cv=none; b=R1ORmjCeZbADofhqI8UtSMs2zw2P7FoXoq7pAY4GBi6ejnt8k+5p6FP8Z/61CvWdEGmBsFFSMzZ5HCV6LHotOKTQkJfLgpXOaorQZSZgo7milH8KfMo4qGmTQ7rPEsZvH4PAUbT2K8DGTg8HfFGX16fwFCJadc6l9+d0jCVOsvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732391787; c=relaxed/simple;
	bh=2Dr+1/xy0c9O2O7Rh/iTI4pCCprRhp25smGc9hLCi6E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XXIZQVkAhIvTjtb5UKo5UNswIcfuO7qsoG8WNmeDUvdnft5dCWqYqOb633489glChEABogTaukhZz1RkyPYO5Uoq9+jGt/KZIFZ7MvCf+mZa33xpa7yXQsXvB/yQQhott4CbqfGJIwOQGQU7ya4UC5IiZfnARvKJfjmnMZcoj3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f8I7xdrb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF279C4CECD;
	Sat, 23 Nov 2024 19:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732391786;
	bh=2Dr+1/xy0c9O2O7Rh/iTI4pCCprRhp25smGc9hLCi6E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f8I7xdrb//OBg2l83AFpc7Fje5EKN7IGO7qK2tiqxk2xJ2p0GxKLoGvO4sj9+xFvF
	 qi3+hIUCibrrzVSvUNLzSyy8k0qy5s8ukt07t7Zkr4OI7kaFk0Yv98U7x7PVRTfvj2
	 w6PAkAOubeX2OYTmnsfeFj3Jx9pLp5+KICFUQvME5plZe/5qBITB89d4rThmR6d5tj
	 xnzeUvLgkdeFV9TA1PjXB0L1njrOexJh+h+FourJqSp9dYk08ICUk32IZ/EnHsvmrC
	 1Sy6XX/Q6mc4z9oR8nKsBTPMmbw1/KHCCV2AlBtHZsih0X+XPwHnZria3S1k/VVEUT
	 jgpQZHlW+00sQ==
Date: Sat, 23 Nov 2024 19:56:21 +0000
From: Conor Dooley <conor@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Cedric Encarnacion <cedricjustine.encarnacion@analog.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Radu Sabau <radu.sabau@analog.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: (pmbus/adp1050): Add bindings
 for adp1051, adp1055 and ltp8800
Message-ID: <20241123-paced-osmosis-007bf72c4b02@spud>
References: <20241120035826.3920-1-cedricjustine.encarnacion@analog.com>
 <20241120035826.3920-2-cedricjustine.encarnacion@analog.com>
 <20241120-process-hulk-ecedcbf088f7@spud>
 <e2e10b1e-cce3-409c-9327-178cbf4b0d64@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AWQlxOs3FPQWb1p8"
Content-Disposition: inline
In-Reply-To: <e2e10b1e-cce3-409c-9327-178cbf4b0d64@roeck-us.net>


--AWQlxOs3FPQWb1p8
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 10:00:19AM -0800, Guenter Roeck wrote:
> On 11/20/24 09:11, Conor Dooley wrote:
> > On Wed, Nov 20, 2024 at 11:58:25AM +0800, Cedric Encarnacion wrote:
> > > add dt-bindings for adp1051, adp1055, and ltp8800 pmbus.
> > >      ADP1051: 6 PWM for I/O Voltage, I/O Current, Temperature
> > >      ADP1055: 6 PWM for I/O Voltage, I/O Current, Power, Temperature
> > >      LTP8800-1A/-2/-4A: 150A/135A/200A DC/DC =B5Module Regulator
> > >=20
> > > Co-developed-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.c=
om>
> > > Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> > > Signed-off-by: Cedric Encarnacion <cedricjustine.encarnacion@analog.c=
om>
> >=20
> > Why did you drop my ack?
> > https://lore.kernel.org/all/20241106-linoleum-kebab-decf14f54f76@spud/
> >=20
>=20
> There:
>=20
> > +    enum:
> > +      - adi,adp1050
> > +      - adi,adp1051
> > +      - adi,adp1055
> >
>=20
> Here:
>=20
> >> +    enum:
> >> +      - adi,adp1050
> >> +      - adi,adp1051
> >> +      - adi,adp1055
> >> +      - adi,ltp8800   <--
>=20
> This is a combination of two patch series. I'd personally hesitant to car=
ry
> Acks along in such situations.

Ah, I didn't notice that. Thanks for pointing it out. Cedric, in the
future please mention things like this if you drop an ack.

--AWQlxOs3FPQWb1p8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0IzZQAKCRB4tDGHoIJi
0vhZAQDzdL7go7DxZ7U0c+qzOvYnfw4FgyQ089ccvliFWD8PsQD/ZJDSQHtnAw5R
xP46Hg3dSbXJIo2G1CZhmP0gbIAitw0=
=LmCI
-----END PGP SIGNATURE-----

--AWQlxOs3FPQWb1p8--

