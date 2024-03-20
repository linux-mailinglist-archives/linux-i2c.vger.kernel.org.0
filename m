Return-Path: <linux-i2c+bounces-2441-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EE3880DB8
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 09:51:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 518F81C213D1
	for <lists+linux-i2c@lfdr.de>; Wed, 20 Mar 2024 08:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 942F93D3B8;
	Wed, 20 Mar 2024 08:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WsUsxHfr"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C333D3A2;
	Wed, 20 Mar 2024 08:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710924527; cv=none; b=SfWhd/kZ3hrnIobYB5XuA8DUwjzZE2rsktpI4z9Y6UxtneNVzphTuOYLOgLZtJ8YmI3Lkud9IkokvIC9f086R5VjdFMcbK44HxN5a+7nt2S/w0lThFJxfR8rq5o8k3XiutnEcUn4OduFPvktiozMeZ+gDfi1WkgUS/Vsz0vx23Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710924527; c=relaxed/simple;
	bh=MsJ9srt0R0jo9/p+8MLEJRnYHOQ8AewGWYSuy5UdIZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hDc1M958wJdWgSpjM9Zec48941U+ld3bHv6DHBZKl047BElal2RNMi2iQyWTtQCTTm1GFAfPwtp0hb8JAbn2Vtp3XJWSbHxxPxHTtOop5theznpVMrfk2CngN4Dfw+c2uRf3GwTPdyoexj9S6SNc1Z99GDb1pyhD51HwfLw8OHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WsUsxHfr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A1EC433C7;
	Wed, 20 Mar 2024 08:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710924526;
	bh=MsJ9srt0R0jo9/p+8MLEJRnYHOQ8AewGWYSuy5UdIZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WsUsxHfrlLjmGHAgUrtuScTebQdlK7AuVa0n+mD/VxFxj30fl2qdVkZ0WlKyOGpJH
	 VO3nYz8DW7A8P29iasD6a4ek4ud4jzElwkM0oC2H2ckKnJWSVjcYxmSFhEh8Mwj2GN
	 Y3AR8oiGHOrkZ0XKF6vZe0NrB0B1tFd2mxIDPDOaE97GESDivYyr97xi90LRlfJ6nK
	 r24RnmGWTlrIcQ70OSXp7GIfhJTWDtpTpsIOVdh1nTNNmbeBbfORz5OQMZtBLdoxJG
	 BKov+rNV7jfWGj0eQLi8pEykQxr1S13SWGC5Rw/tN2Ss7+th68u1DpDhaq4fHRMviT
	 1kumgGZRMXqpg==
Date: Wed, 20 Mar 2024 09:48:43 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: peda@axentia.se, p.zabel@pengutronix.de, krzysztof.kozlowski@linaro.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] i2c: muxes: pca954x: Allow sharing reset GPIO
Message-ID: <Zfqi64ABlapvK66k@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>, peda@axentia.se,
	p.zabel@pengutronix.de, krzysztof.kozlowski@linaro.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240312201400.716009-1-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MyVoBAK5wpPESW1K"
Content-Disposition: inline
In-Reply-To: <20240312201400.716009-1-chris.packham@alliedtelesis.co.nz>


--MyVoBAK5wpPESW1K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 13, 2024 at 09:14:00AM +1300, Chris Packham wrote:
> Some hardware designs with multiple PCA954x devices use a reset GPIO
> connected to all the muxes. Support this configuration by making use of
> the reset controller framework which can deal with the shared reset
> GPIOs. Fall back to the old GPIO descriptor method if the reset
> controller framework is not enabled.
>=20
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Acked-by: Peter Rosin <peda@axentia.se>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Dependencies are upstream, so applied to for-current, thanks!


--MyVoBAK5wpPESW1K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmX6ousACgkQFA3kzBSg
KbZfkw/+K/ucx2L5qiJCpZ35yspwE6QrPn1CB1D8YrBf37PhZcVGkrBmlrOws8KF
FTneLXgMiaOezI+hMikDZz2aBiRa04p7x/pjWtPIHhbpHF8eojtpc69u3N6Rs8dp
htAxH5AxfbuMszdy9+lIVD1s1/9/XjPvkGy3HWSbssGgzbNqphWRtXqEu7oI/XgS
ZkktVdVR7BeBocQcFxPuHGufnvkBA3GTT27RJamzyHacHcvFAfnbU9h5iRHNEWOu
tf9vl9hPoHbmYt+9xV9DOSAVnuuCWkyQZFe1pWTkjK3Nh9FRtA1ACEjNG+U5UZa6
AnLGzGrBe0a9XCeVxNNzk7dUHMfSzdzGRemWnRhYSg/Y5CmJmJWY2AW3Nu7oqp1p
v0URKADT829JwFUl2z6f0iYxl7dsEbWgCGUkBrWa4WLSGsXMbRpJUYl/LiCum1Cj
kjvuM8LOoaVLBt/IUQr/E3tPTGlw85DhsOpbX29FhHLH9q6FDhvoiPcVSzPdoZT7
1MK+R/CrzWKOzXlXD5hJxvnkWdefMFyPhx5cqM4yGirpiuAWDkpauGORcQzxjJd4
M9lSoe7Cc2GzBbRW5Oj9F3fdtqStNOjnkJL0RA+Q/S8CHgp+9UzBy9/Lgo9AX4FN
JBoFg158b63KymyPzJBH2+6gpxIFUtEHeWsiIfqSvVsxhu1y/QU=
=xmSl
-----END PGP SIGNATURE-----

--MyVoBAK5wpPESW1K--

