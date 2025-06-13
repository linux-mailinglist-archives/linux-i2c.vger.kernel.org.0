Return-Path: <linux-i2c+bounces-11424-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E52AD8B48
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 13:53:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3289175027
	for <lists+linux-i2c@lfdr.de>; Fri, 13 Jun 2025 11:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED6242E88BB;
	Fri, 13 Jun 2025 11:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RdiGAmfm"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0502D23A7;
	Fri, 13 Jun 2025 11:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749815210; cv=none; b=ZYqdNnnSusJdDmxVecdDg7CsV2ysd21S86A4JgDPD/wsvhLi5Ky/YqRlIrqBYgwWZN7XNG6Tmmdhh7ks8J4PmCjrF8zlt7Whk6k1wDxwmXEsLPpnM+Pszj0eM/CyCuZSp3LOAi8/ijTTqNeO23V7TdU23uhQdiy6OqESmmTVVqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749815210; c=relaxed/simple;
	bh=vv4Pqa/1FuG6Cl4k7KZAwhVvN32B2mS5wcZejBitBwk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pIqY4KxynPoXu+vMzDMc48ztVmnDHVT5wQBkGawecXAZU/hS3X8i6b0dfbw5BqmhyvDS0KZiHsA1cR3gBY3VmHoo10LtS/A2QEGheN+UHSggtMthoUw2pFBFaazicovm6IcXRLR5fzdFIkyagjVHEjl1O8VxmKpXIXKQOycweLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RdiGAmfm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A25EC4CEE3;
	Fri, 13 Jun 2025 11:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749815210;
	bh=vv4Pqa/1FuG6Cl4k7KZAwhVvN32B2mS5wcZejBitBwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RdiGAmfm65ZeFbeMGTwHL6UxyRQdfgTfZIYn6LqmM7ff73kMv3j2uqU1Z0yObT1y3
	 dqbPkCK863lyBfheR394/wz+8ZFvIScrvTq9gcoP2CNHX0IvUqvTvAWLIuwaKD2H2V
	 +LxU6tVRQFG8Yf9uR2ldtlvYSe9fP5GKbXlmYv+Ikzmq3+ClVkd0HUc4n33oVpTa3x
	 Y2TBpSg6P/9kshW/HOO3qWhYOlT99gdWY/twzR3i4XrGIap8vpc59pXZQ6jcLznmcb
	 rZ1ygISFoPB6Qqyxf7B5MAfCPZVjw9lcvnXwOZnEvTqK+G+N7TlkaRvnTL0Zt0shqy
	 dAJ2r+qMjI/6g==
Date: Fri, 13 Jun 2025 12:46:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: catalin.marinas@arm.com, will@kernel.org, olivia@selenic.com,
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
	andi.shyti@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, kernel@pengutronix.de,
	ore@pengutronix.de, luka.perkov@sartura.hr, arnd@arndb.de,
	daniel.machon@microchip.com
Subject: Re: [PATCH v7 2/6] spi: atmel: make it selectable for ARCH_LAN969X
Message-ID: <51dba7b7-d4fb-46bf-892e-a9634cb91659@sirena.org.uk>
References: <20250613114148.1943267-1-robert.marko@sartura.hr>
 <20250613114148.1943267-3-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="liIKPqX/LlpnoGyN"
Content-Disposition: inline
In-Reply-To: <20250613114148.1943267-3-robert.marko@sartura.hr>
X-Cookie: Use extra care when cleaning on stairs.


--liIKPqX/LlpnoGyN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 01:39:37PM +0200, Robert Marko wrote:
> LAN969x uses the Atmel SPI, so make it selectable for ARCH_LAN969X.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Acked-by: Mark Brown <broonie@kernel.org>

--liIKPqX/LlpnoGyN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhMD6IACgkQJNaLcl1U
h9A2Tgf/S6jX4OTt8qMSDrYcgp49BzBMvfKq3YWuJ3TFTWtu27WywUPhj8oa42gc
CzCOluHc+ctjn36Z6ENUygx8Sf9f2wO3QKsekaC5m301aySloWnBNCNh1CTWoKWa
pcfCXorRLKUmIgyjTB9QnmFTebtF76O2QJYsosZAZX4E0h3fTyP2/O6eJuNshznh
uW1yFBG7eO96O5ZigTfvCchi4CPiV2Eq44+35WRc/FkxiSyRMCCXpK/t1U8RFgEy
M+DhG9KsPmk8y11dExnW+9rmYy8IY/FTxQwP4DWGTeacxTjwkUhvAacfOsXB6pB+
aocL1gPyEZX8iTv2UnOf81f1YoBl0A==
=og7b
-----END PGP SIGNATURE-----

--liIKPqX/LlpnoGyN--

