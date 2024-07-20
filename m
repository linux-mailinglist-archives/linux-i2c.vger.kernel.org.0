Return-Path: <linux-i2c+bounces-5042-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 036F99380F3
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Jul 2024 13:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B2D312820B0
	for <lists+linux-i2c@lfdr.de>; Sat, 20 Jul 2024 11:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693578563E;
	Sat, 20 Jul 2024 11:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Bk0jRk5U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E47983A0D
	for <linux-i2c@vger.kernel.org>; Sat, 20 Jul 2024 11:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721474409; cv=none; b=PsooNfj+WZU3oXzM0xJU6TlqsNozVFAEJjq+bNXXxJp0JDZe9jrkXVLyCm4lyxjraHNDDXmhoT1HgNq8EBf20Ha0dwnXHtQlb7FJXNfzJPNWpmsXvvq7K4OHzOSrBv+YoH5Zxt5OrUMqao6Wrjlbt7cZ3WI9te1KmrQx/cK7nrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721474409; c=relaxed/simple;
	bh=wNVOEJA5DYv8wA2xPdwzPx/tNExmXoemr0VThd+AAAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FAhh73I5IIhWM0jsw5LICqOSylpBpvEpV34+VwPo260AT4YwqxoBuV/bJPQvJeANnDhNUtZZXte+OC/SdKcI4lB+mpK+94Gumk92XjTR6XFhsJvj+uBsdtD//Dou9kMR5W31G6yH4JTC6F22g4WqVO4EUxixFwahSmnC6nu8Ejs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Bk0jRk5U; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=wNVO
	EJA5DYv8wA2xPdwzPx/tNExmXoemr0VThd+AAAU=; b=Bk0jRk5UUn40IXL30dop
	1YBvoUAlsxvfCdJKSiFy0mpj0la5u7N03fMGMSYJbeaie+pNYWyWkNXq6lmQM9CA
	R6r6amCHO9YkU/mXflHBE8XwzDqXYpOcH2kL/Yx2luueV1dVBj0EeEZWunTzzxn3
	Xwo6KqFGFwmZIYxT11TAyjjQ79NC4Gq2UwWvfvI/gmCqKhT8m0C9EusHnjKRdR7G
	Oh0KPEAit6zNPg0WFCrJ04m5P0dzZaUpBH/+v+Ju0Lje9gkHAfP1W9myy3oRAtU9
	amnUhrBhf2nv66vf92IbaEGGXINZJWqkUx+kPRiqNyZMl/GM3UHzSGWUmaoZ1b55
	Zg==
Received: (qmail 1449825 invoked from network); 20 Jul 2024 13:20:05 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Jul 2024 13:20:05 +0200
X-UD-Smtp-Session: l3s3148p1@VIBp/qsdruQujnsv
Date: Sat, 20 Jul 2024 13:20:04 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: header: remove unneeded stuff regarding
 i2c_algorithm
Message-ID: <ZpudZDCiAhFTHuMp@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20240716083623.7737-4-wsa+renesas@sang-engineering.com>
 <20240716083623.7737-5-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7GzzAtHVAOPE2ILE"
Content-Disposition: inline
In-Reply-To: <20240716083623.7737-5-wsa+renesas@sang-engineering.com>


--7GzzAtHVAOPE2ILE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2024 at 10:36:24AM +0200, Wolfram Sang wrote:
> The forward declaration is not needed anymore. The sentence about
> "following structs" became obsolete when struct i2c_algorithm became a
> kdoc. The paragraph about return values can go because we have this
> information in kdoc already.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks!


--7GzzAtHVAOPE2ILE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmabnWQACgkQFA3kzBSg
KbZ3FA/8Dj7nGZj8h9HCJfb7Vny9F1y5fL5mTwzhgVxLrhzSCb7l4CGBbdfBvlMa
+aaN0fj4T6SQW4jLuPglaOZ+ZsSXXqXKcDqTcfnH6mm+FdmMkBdcwGYxSOgt3sbY
Wsmwayn/U+J9IG+42WXhOz8edN9VHL/ruWaojK0extfTXcjaYVIYc++WO1ALpYcN
7n0oXJ9zPkNPCxvSFM+Mohm+PZyHzr2d/EtdUHga9n5ub01LOVKWDNNqBZAMbLxQ
XalkynBvvjm950jJ068OHsnyvsehSkDy72UlvL6Q/kVzWvLt9qeSYbVjCYc3OShP
1nQAZfsr8s/p/yHpcmEVIi746e+QRD4q5CYsk7Agzd/+5jIAmiI2wd4wzMDetEW5
AvVJOyvwd2pNGEBfc6xvavz3fEbLepDX7eX02epFRIXT/ileylFOFWYdiYLLSoUt
c/J4ID61FkuS7uQjsFoRqWMW+tCb3dYGFPHSeOdmjYfgknUnc3mbU82KhFx2Pho0
fvmRW76I21sRd5AN7ov+5Ij+zmjffK3sKT3leps7jfrFgvLB9+Gy3ZMgyUm4viHG
sgPAxh9TOhZ3IP3NP9pQ5z2mYRv5RNnlk6kxnnltU1elRzlkGq2i52BP/CYG2pD0
F7MNsIUpZp8Z37JpG30g63fSOC3IZOB8sP8afWQt7wIieDaRN/A=
=QArr
-----END PGP SIGNATURE-----

--7GzzAtHVAOPE2ILE--

