Return-Path: <linux-i2c+bounces-13956-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 800D2C2D5D8
	for <lists+linux-i2c@lfdr.de>; Mon, 03 Nov 2025 18:10:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E762B1898818
	for <lists+linux-i2c@lfdr.de>; Mon,  3 Nov 2025 17:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC98A31A547;
	Mon,  3 Nov 2025 17:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="E1Kixcgk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60B8E314B82
	for <linux-i2c@vger.kernel.org>; Mon,  3 Nov 2025 17:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762189558; cv=none; b=VLuCR3Yecv5FbaL4nMlT4i3Lc7b3n2+zXhuSC8OVOJrUJdEgXynrWbhSkKpVOkBeJhg9z5Rv9/LNYRlGSfakXVeHiqkjS+WHsSdVvbO+YijDgGZvrJlGGgEMO+K4iariOGRzw7Aqe9gvoG/fhb3vqHHP7UUazrKjCcp9W3eInoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762189558; c=relaxed/simple;
	bh=/QBjC29z1S5r0pnHvdvgfAx/Fux1ctxsWzhldWK7FHc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0PiJB9HN96Q/P/h5nsg0ngFEUh06oP8dhr8VHEwy1x5w9hQPZlma0x2LWcCPGh/VRR1dSXV1J8UuztXPH3YaE7SMgI0sm4QiLlSVeMyFYAf4d0N+VwuMb+sxunH30paYwJDILGUOKYd6regqkcO1c5NCWD0NOdD+rfqqouRzz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=E1Kixcgk; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=4NLU
	LiyxwlEpMx+oqpLMaMres1KuKBadPpoeug618kQ=; b=E1KixcgkWbmAd8BPCoJa
	aRdcL3cRTxn1BHmtGxYR7+vyC8AszA/rTiHqlyzyF41HOVyqcnfjKHfAL9hXgcjD
	qA6QTImac4cFbbzfim9DGYdUZgGD31rRHt6z1KEjOcuHYDWQtmh9fPei36BLmI5z
	/80mkQ3lKaZz1jjvwrIno+/QrsTYqwOMcR9hm8hJSQr/lgx0A0KcKC9iL+fVwkOK
	h7QIUw8NHAIvrQXhTtXmpFKUqsCklCSt5NapNiTUoKsk+XuGrD4TUCj9SlxWEBVf
	DCFvYUbiWig4qhUIZ2iQnAflcbG/4CM+ZAg9a8N1trRyWC6r+PxChFUBsDfI9irR
	sw==
Received: (qmail 2305815 invoked from network); 3 Nov 2025 18:05:50 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Nov 2025 18:05:50 +0100
X-UD-Smtp-Session: l3s3148p1@FoMvurNC7sgujnuf
Date: Mon, 3 Nov 2025 18:05:50 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Peter Rosin <peda@axentia.se>, Philipp Zabel <p.zabel@pengutronix.de>,
	Wojciech Siudy <wojciech.siudy@nokia.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: muxes: pca954x: Fix broken reset-gpio usage
Message-ID: <aQjg7uQyXMCSULy2@shikoro>
References: <20251103151905.297014-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="COypnBozY9i5ePca"
Content-Disposition: inline
In-Reply-To: <20251103151905.297014-2-krzysztof.kozlowski@linaro.org>


--COypnBozY9i5ePca
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 03, 2025 at 04:19:06PM +0100, Krzysztof Kozlowski wrote:
> Revert commit 690de2902dca ("i2c: muxes: pca954x: Use reset controller
> only") and its dependent commit 94c296776403 ("i2c: muxes: pca954x:
> Reset if (de)select fails") because the first breaks all users of the
> driver, by requiring a completely optional reset-gpio driver.  These
> commits cause that mux driver simply stops working when optional
> reset-gpio is not included, but that reset-gpio is not pulled anyhow.
>=20
> Driver cannot remove legacy reset-gpios handling.
>=20
> Fixes: 690de2902dca ("i2c: muxes: pca954x: Use reset controller only")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied to for-current, thanks!


--COypnBozY9i5ePca
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmkI4O4ACgkQFA3kzBSg
KbbbaQ//YwZQUgupA23f2EJE156lVTBGFAXjolGbvkKvurSRYJmW1zL9jHW2VPXZ
/Lkmv0Qy7rL5S/Cd0bqL7RjLGD7MwWxg4qbdSvDe6FBoqPrH2+jWMBlv0Ylep7iJ
O1FbfoAJqWDYQATbJd/N/WMYamvoOZR9DnGBSqhcpYseJTfj3vvVEmc5PRyWrU4D
hzvTed0xblwZNBUryaVl505GqGHQTrf+5t/ZUzRkuhSHyxwAMR6i0LuJsPMtDgIJ
lHoLSePSPKqz3xJNu+MzrQgMTfqdOgLln7mR7sIVrJCnxWz3ETJGhjlXMRVamFnO
UPZ3HRElqPbcFcuJh6pJNZwXOCsdj6GE3MrBno5E6Nx6vziyD42SL4Yp8S6Jdub/
fpxS9L8Em0lYxyrNytWeCUUT98hN8McsZXNb5h3YlkWQvBIBcMpxk9VIkDiS330/
X3n9mPlw9r9MHSZMmofQteT0efTQjTNLZQFnv2VuF1u4zWv9oovkJ08enLs5BgZe
3DR4uwb2S67f7X5vcnQhYYu/4KtuKCU06Q9F9Sl6JPIFWpFjIMYcgWuT1CsQjNzD
6kgcwpQzP6W7XFx+iB61IC/AnLC7kMBOUyweYPXjt5cgmdmdYwPi+t3mAQjzwr3j
zARBeAY41JaxVepLj6X8oLwrQHutH64mreytbMXMzQo3xpAz2HA=
=9j+D
-----END PGP SIGNATURE-----

--COypnBozY9i5ePca--

