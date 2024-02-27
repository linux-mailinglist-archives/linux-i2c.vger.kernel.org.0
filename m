Return-Path: <linux-i2c+bounces-2031-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3724986911D
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 13:58:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BBAC6B29B19
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 12:58:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C20C13AA46;
	Tue, 27 Feb 2024 12:57:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UYD8xPb9"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD5413AA41;
	Tue, 27 Feb 2024 12:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709038676; cv=none; b=ByceTqKRSgF0Tqv+JZNLerIt4td7Q4WG3EkIPTVBKRM80j1g4igwl/sak8BzMfEjooMngWTufa+sBIyrsESMyhhlov+tfoeYjnDeNAr2t0vPdMGKOK598m6AnFfpYhey/OdyCBgY6/WpZw5WYH3NV3P7wygjzY/mKySwkvLfwMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709038676; c=relaxed/simple;
	bh=tbfKlNGs1QVBMBXcmvRcsmKNsP0qMZgurrAk/JiojBQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T22TFZWn3t+9lHNY+dXE4Q056MM9hlihov/O/kq2l2v7PNsu8BplrA6dK//5tBuL4FIXae0OXkoCOzsqZ4ZI0Tm9kGrnZ0/rwVNkuskhPMu+2ohCl5AeLbCs0ovOPvCyMwON25sDq9V7Gbe1D7MhfoPqw9SyMl6TwR/bSJTxEUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UYD8xPb9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148A0C433C7;
	Tue, 27 Feb 2024 12:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709038675;
	bh=tbfKlNGs1QVBMBXcmvRcsmKNsP0qMZgurrAk/JiojBQ=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=UYD8xPb9N7w4Vo7PedVTKTFd/tzQpeceNX0F4+/Es7UIV8aEfrjX+WhBdUTFED1L4
	 ynVxfjFL8QKIkGSKM6nOn2kTlfDWW2cpalI2qckezrxKR98GdZ/0NFH58qctQry3iG
	 0j1myIQaN9HY+88GBU8tKfPz9NmoGVBSleGFiazQtkjEExAYhXSdzAszzNGf2X+rNH
	 MWCFayiGX4i74iH+3Pbj9B3lzXQqbAaTDyy7mbnvJZ0XWeC+U7tJBAPAI3fU5JFit+
	 RWKlV0XET8FA3fIDb/5cbjbFQeClRqxiwEFRURhRe0fzx5RhsuOjhWkN6X1Le2bLI1
	 OYexDxQ2gP0yQ==
Date: Tue, 27 Feb 2024 13:57:52 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree-spec@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: dtschema: i2c: messy situation about timeouts
Message-ID: <Zd3cUKCHnn9n57pD@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree-spec@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
References: <ZdxjGwvGXlDGkYs0@shikoro>
 <c6yyhxzqfavqjphumemgjn7ick4ddjzhlxfjb6wtgsfvdetdqt@radooxy4o4mx>
 <Zd2LT-OM4KkUXCXn@ninjato>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rmZo/KOIoI01PeJJ"
Content-Disposition: inline
In-Reply-To: <Zd2LT-OM4KkUXCXn@ninjato>


--rmZo/KOIoI01PeJJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > - "i2c-scl-clk-low-timeout-us"
> > >=20
> > > The description says "Number of microseconds the clock line needs to =
be
> > > pulled down in order to force a waiting state." What does "forcing a
> > > waiting state" mean here? I don't understand this description.
> >=20
> > It comes from the specification. The clock stretching is given as
> > an interval that can be tweaked depending on the hardware.
>=20
> You mean the maximum clock stretching is tweakable? That, in deed, could
> be a binding in the future, in theory. Yet, it would need support in the
> client drivers. Like a touchscreen driver which assumes a reset after a
> certain time of inactivity.

To sum it up: a binding defining the maximum time for clock stretching
makes sense in theory. I am currently not aware of a controller where
this could be used (but I surely don't know them all). Most of them keep
SCL low as long as they are busy internally. Not tweakable. So, we defer
this until there is a usecase.

If we ever add it, the above name of the binding cannot be used anymore
because i2c-mpc used it with a different purpose. Not so bad IMO because
"scl-clk" is a pleonasm anyway. I'd suggest "i2c-scl-max-stretch-us" but
am open for suggestions then.

This one can just be deprecated, I'd say.

Happy hacking!


--rmZo/KOIoI01PeJJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXd3EwACgkQFA3kzBSg
KbYBhBAArD6p5Di885LK1miM1NVqc0cc9V7Ug9qaeGp/6uNs555QfG9iyC5Mab+S
MYcLNTA2EfKchsPFMo/+guQXIFHs5alzu2TO7bHq9IeuPMpZco4FADxM1h5mnswR
LktpTlxjXc9DFOswbGFMEuBlSCpELp529Mi4ZmYUjsDRlKP+LLofEQa3Qu5EX5S2
AemRAg0id2KQdqswNZm2PJjTvWybcoDi4ycRUxbTjy7+67CiU66UfGWhsYDxE/rn
F0TJ7GYuBOqRga7SUx5f3lfYYpwajR8X4qJms9sYdjtOtMVKRu1zVKdco8bIjlwM
vqkx6mYqnfgv1jdrABiuNqv+uii2wUKAPVcJrg07/M/9q3KCTF9ceH6Zl28y9fWH
tsiE6JNkzMLJVOcELMjSHEBJcDxW9lUPAWCo6jDNkUjqwJv4FoZn0w5Oa/Q6mzYu
QgHYs1VEffMafh1VFOpdiMrnaxUn5778gtqwzHX6lKjYjmLVyZ7LaRMI5d51r399
5vFO6HdBpxIO6TViDGMV7J5HbGAY9k5id11NRc0VE6yCyeY5F/oazHoZHgJDwHGj
aJgB5wJlmzGw/5spMz6LcXUlD3k0mJsM6uknKPKV9/ATEBzOzhuIOqrvXKXKy2nD
MtdzD1+seoT2eN8439ORxQE85lm1TQ1XLBP5G25EgOrFI+LEkkA=
=t+gF
-----END PGP SIGNATURE-----

--rmZo/KOIoI01PeJJ--

