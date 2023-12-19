Return-Path: <linux-i2c+bounces-875-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07600818D27
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 18:00:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AF79A1F258D3
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 17:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F1A92136B;
	Tue, 19 Dec 2023 17:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fNA/2XfC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA86E2111E;
	Tue, 19 Dec 2023 17:00:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0AB2C433C7;
	Tue, 19 Dec 2023 17:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703005237;
	bh=wyqFdouZB+qXcm0yj3BUpbhi3BSiihaMQOaN1xGJxSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fNA/2XfCztH582aCt1XpqXYTF8m9kLLaaYwaIzQKdfmBhvyT3MhNKdu7SysKxkFWS
	 cC++R6pZyFnJmR5gNgLTX+mq2TPu/hofvuYjRdOdZFSoW4dPik4IRSRhAxVmCt/TTJ
	 ROMN/w7ig/4RfDJxBnT+ZXbSrZn6mzoAOU7u01C/61gz1U2Ry8soZJAgvZbcaPtdb8
	 hTOJtmxTPlxDNJi78RcX0Jchm/Mtu99j6LtAyuFBDK+e+xzdn0RjAdzJOn0P0P5Xij
	 8ZPXcSDLy45yVM/8t9hm+2aabjo33HdYqjTrh/SV+Dc/FjSwGm7TXC77JZ5/RDMP2r
	 9/K9TMPxZSpgA==
Date: Tue, 19 Dec 2023 18:00:34 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Chanho Park <chanho61.park@samsung.com>
Subject: Re: [PATCH v4 0/3] Add atomic transfers to s3c24xx i2c driver
Message-ID: <ZYHMMqYOUnJymKe+@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Chanho Park <chanho61.park@samsung.com>
References: <CGME20231108164403eucas1p17da17aee0bae5723e78e6a2e2b76c828@eucas1p1.samsung.com>
 <20231108164354.712406-1-m.szyprowski@samsung.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oXFm3BITv7V4Qs7B"
Content-Disposition: inline
In-Reply-To: <20231108164354.712406-1-m.szyprowski@samsung.com>


--oXFm3BITv7V4Qs7B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 08, 2023 at 05:43:51PM +0100, Marek Szyprowski wrote:
> Dear All,
>=20
> This patchset adds support for atomic transfers, which has been added to
> the i2c core recently by the commit 63b96983a5dd ("i2c: core: introduce
> callbacks for atomic transfers") to hide warnings observed during system
> reboot and power-off. Almost everything needed for that was already in
> the driver as so called polling mode. Unfortunately, that polling mode
> has been tested only with single message, write transfers so far and it
> turned out that it doesn't work well with read and multi-message
> transfers, so first it had to be fixed.
>=20
> Best regards,
> Marek Szyprowski
>=20
>=20
> Changelog:
> v4:
> - added a comment about the delay value
>=20
> v3:
> - fixed style issue pointed by Andi, extended commit message
>=20
> v2:
> - updated and extended commit messages
>=20
>=20
> Patch summary:
>=20
> Marek Szyprowski (3):
>   i2c: s3c24xx: fix read transfers in polling mode
>   i2c: s3c24xx: fix transferring more than one message in polling mode
>   i2c: s3c24xx: add support for atomic transfers
>=20

Applied to for-next, thanks!


--oXFm3BITv7V4Qs7B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWBzDEACgkQFA3kzBSg
KbZoKg/9GaU/YW2XQbMpXHfUN/reSrfAlfPdze5MSxI2iLUAtrWlvwLPaHaGxWoU
zLf3uXtDUhdHVQVEo4MJ+sAwcSyCD0WWQIPJv9OSUSdwV+vV5cRbldIGN72ALV7R
4YIC0rk4b7Br5oGQqs8nPuVgv5U321ZF8xxJrA0Fq09yKf75L+o/SYHMSN+0ODHo
UZTiFDnx4gcSTvZcRaERVgfS5pg3hX+CtmR0uon9LsgREOBbbTbGLhrNptvXI4xL
WToNIzbvCR+Q46dm+1N2go/3GWiXgvosRqSnWPu1/bEdUVcFAtBCLpsZ0qVm5PJS
3E761gwH9hqKp9gzfozlir3bA6+PCLn/Np9jHEAxgZnpTGHHEShtYLTOr/WDXMVR
i6CwIveFwh9yC1SkVFMhATUCj/MdgqRPv7iaA5g2oLzolC2GQOSWFrS+0p/uJAG1
jDsILQ50Ocgl3+jYOCX11k3B+ORjumAsFog0j/zKjR2Uayo9crHVcs4bCFuQd4SF
AutUv8+SXjsWrysnnMpa8Fq4MmNmh+XvQVlD2ekUBQZVatfnMMzAsJFzJRo2lCIz
WSz+SCHV/AuSvDyZJ8RIiAfX9GmU2J7hUqiVMQl20u+ByA9z2Szdf2zmO5aFFqm+
cRiPUjzcHGCaIQn8MohqxXtq+FmkZ5ORezcCsK9KuR4oNK1VKPk=
=hQ8T
-----END PGP SIGNATURE-----

--oXFm3BITv7V4Qs7B--

