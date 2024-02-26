Return-Path: <linux-i2c+bounces-1974-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF8F8671AF
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 11:44:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 17071293A9A
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Feb 2024 10:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF0C51D559;
	Mon, 26 Feb 2024 10:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OVweMSom"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22542032A
	for <linux-i2c@vger.kernel.org>; Mon, 26 Feb 2024 10:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708943795; cv=none; b=Qw2lenwJGHsjZT5HTLbjKOO3e9UazoTqszu8d6CNEjU42k+pyUWB6WaP7tAnlvyOYQfYJ4ySg31gx1T43VgBTA4lAdXC6zC+fufc9jc09MIEIKSzub2k/eVqAlctf4AZ8znP/91HXRk3T1sdlF8Ri8joy0gMWSMC1lzNFQFTLNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708943795; c=relaxed/simple;
	bh=ttOZO6LJMarFebC7zvdq5YRj6opE3LqwSOxSP0ARv+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sUAY6jVoKs65ak3TsDIVduKpSo/HNXR1yrXSfp0hlpiMUn6tt1yP6qlT+K53npQoPqZUCP+duRwTNImBzVYEJSu4+T/jTU7pk+0nBjwyhkcSyt1gsIJduRYNSwvoEe934oMApwLv8yOp6GikNQ8gQLiBkvXrbfFnIILnQRUx1rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OVweMSom; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48271C433F1;
	Mon, 26 Feb 2024 10:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708943795;
	bh=ttOZO6LJMarFebC7zvdq5YRj6opE3LqwSOxSP0ARv+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OVweMSomQVvVK22MQ8lEvawCwEYepqsbNmqCXHoAspMFO1HlNh74KfqrvHckdW+rr
	 3wj+ziEx5UUcl7pGKAqbJQJLyHwV44aEm3C9YgdyjDnTkvCwGPSqLyzannlMCh/HPC
	 /sYs/WjaBz7BzO0TR48HzuFCy61iXcEv2e+zNeXDvnscgAnFZ3xwzev1ngpy+YklTC
	 vZjcSXox9RaIFfy0MMb3JxYPr2jUd6e2X1I4nm/fSiZqgMBw5sPJS9eWS84332dpT5
	 S++6agFHlQQwDIJV2WoDJ8mzwyw6PdFdQZNCos79XrOOgodI+HYzxgmqvc86+54t87
	 U7CR3lQVb/O1w==
Date: Mon, 26 Feb 2024 11:36:30 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Jean Delvare <jdelvare@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH RFC 2/2] i2c: i801: Call i2c_register_spd for muxed child
 segments
Message-ID: <Zdxprq9jukWj0XJF@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jean Delvare <jdelvare@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <eac54582-44f6-4101-93d9-012eb4ee3241@gmail.com>
 <cf8058db-03d2-4d47-bc39-2645c3d42e10@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FiriUjKb5IkNNDLM"
Content-Disposition: inline
In-Reply-To: <cf8058db-03d2-4d47-bc39-2645c3d42e10@gmail.com>


--FiriUjKb5IkNNDLM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 22, 2024 at 11:25:43PM +0100, Heiner Kallweit wrote:
> Once the gpio mux driver binds to the "i2c-mux-gpio" platform device,
> this creates the i2c adapters for the muxed child segments.
> We can use the bus notifier mechanism to check for creation of the
> child i2d adapters, and call i2c_register_spd() for them. This allows
> to detect all DIMM's on systems with more than 8 memory slots.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Yay, this looks *much* better. Thanks for doing it! Sadly, I can also
only review, not test. Let's hope someone can step up to do the real
testing. Maybe resend it as RFT to lkml?

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--FiriUjKb5IkNNDLM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXcaa4ACgkQFA3kzBSg
KbYSiA//bPOgbUKbC56ARrS3GuFS49n/Eorh3MfTzEubI16QkS25XRy5EvQQGLVd
2HQbkNAqlRFjqe5X/SE4JCIH0iNuyLm2zeV8z/vE6UKLm8KzbCfSxOTjANksYB/+
8HP+yQJ/iHTrHzr0d5/YV7tfTi6XPgHueqamQv2xgo1ybAX5KLx3Hbjd9+jBcFUd
CE1dyGjZZY2AVl+SKTj7Ww2CHazb2zHQ7z6otvOD0UJDDzF35+qhxyDAc6wji6r/
amY/d9Sdf9O/6UUWbwwME0bfjqKhNAGLKpodLyb7rU+0v2bkbbr+vbKsHc5U+acI
fr8IhXpWzYLE0BauIgyUrsO2FpiQVpshCknAGG01A5FeN6Ba6GsgaU/cqSnXXPht
1q4va229sGOznIuLyCYg62QDPuSYxUBWJAHNbZilqlwfUHEQDqaXHSV2FId+6BNZ
+h8NCgOtSf2DxmgkTtQIneHEbuA19kWJm2aNsX09A2B5NRWgG5QSg3LE3CnnaTQj
yuUY6SOPDj2MU+Y9dnTtl4uhbKkEKISPwPCqDBWj1FknVa9H/U7R1qBEF8GC4Oiq
3nGa+2Hr5B1rcdtUUwDY6IhmTNB5f6zAFwo5JQTMEt8GGmXJ+lEy/KGdrtCHrh6X
fb36NKk3YbQl/JTjyDKwmQZ6X42qV0rA3OiKOgsqEqEL3YcyUGg=
=SVdW
-----END PGP SIGNATURE-----

--FiriUjKb5IkNNDLM--

