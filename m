Return-Path: <linux-i2c+bounces-10902-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D90AAFED7
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 17:17:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E67C188BD1D
	for <lists+linux-i2c@lfdr.de>; Thu,  8 May 2025 15:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DE34283151;
	Thu,  8 May 2025 15:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GkmD0J1l"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1746283127;
	Thu,  8 May 2025 15:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746717002; cv=none; b=AtrS4CCuDtQ8vuXHkV/Y2j3sUo6C+25ljtakZEzjIS+/lQnIuQffjeMpLPTrdoQXsVhlt7pvYKqeyyD/1tvL9A3GO26ga/YiaFGzDAK//wqfi8wdC5vYQ9onHldpZmZP7HYBmLMKvRR5MMvJYmjltTOcRuLpyug0T//SLIlEOt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746717002; c=relaxed/simple;
	bh=rVR/N/7ODChG6fZhtF8ZvMaMmZ6Fx13049NqQCPPeMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NYVA/s+dFrrtML3YMLTI+/cwdIL1r8ZqOAWUODrrBCzeYTIlVcNyvWliUPbj2UBhsoCY4ydsS85Mjyalwf7O1ofcxz9EtH4nv62yduTVTovGone6ysrZ3q75UhW89PhW4MaACjRDiVzXGw8nR29KMPpQSZ88/7ELi+AgDhulth4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GkmD0J1l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22AECC4CEF0;
	Thu,  8 May 2025 15:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746717001;
	bh=rVR/N/7ODChG6fZhtF8ZvMaMmZ6Fx13049NqQCPPeMg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GkmD0J1lOEP2v5R6Gl6VpW7bpQlNU+pvI1gjVPllebBtvu3VgZcVkbVEEUACCHxKA
	 hITDaX6O72YKW7Abv8VD3qWeh0KvPv/oGLqBhNCazutTxVMaqx8kVCZmEtEO6TAfBP
	 46u+J3V7ImhbwA+1hvN7ONIeaLBJ25VEkS29d6ZOU7GG8KfRNU1MGC3Ww2ZaEFGdEx
	 eDKIrKCdFJ7FxhlrE0n5HeR31facf7qqtvPXnMMkl/8L+mzQ1cFAqsGNwsVwhqzDuJ
	 LQ/rXhCaKJqR73NioMyZwo+eCDJ1zg0u//SIEb+IvDkg21Rds8Ptm260xSuIJdS644
	 1cd60ulMzEOBQ==
Date: Thu, 8 May 2025 16:09:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com,
	ldewangan@nvidia.com, digetx@gmail.com, p.zabel@pengutronix.de,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: i2c: Specify reset as optional
Message-ID: <20250508-atrocious-till-30aad5010c3e@spud>
References: <20250506095936.10687-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iwu+DycW32HAkSb8"
Content-Disposition: inline
In-Reply-To: <20250506095936.10687-1-akhilrajeev@nvidia.com>


--iwu+DycW32HAkSb8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 06, 2025 at 03:29:33PM +0530, Akhil R wrote:
> Specify reset as optional in the description for controllers that has an
> internal software reset available

Optionality of properties is not determined by text. The property is not
marked required in the binding, and therefore is optionally on all
platforms. If some platforms require it, you should submit a patch making
it mandatory there (via the required keyword).

Cheers,
Conor.

>=20
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> ---
>  Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yam=
l b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> index b57ae6963e62..19aefc022c8b 100644
> --- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> @@ -97,7 +97,9 @@ properties:
> =20
>    resets:
>      items:
> -      - description: module reset
> +      - description: |
> +          Module reset. This property is optional for controllers in Teg=
ra194 and later
> +          chips where an internal software reset is available as an alte=
rnative.
> =20
>    reset-names:
>      items:
> --=20
> 2.43.2
>=20
>=20

--iwu+DycW32HAkSb8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaBzJRAAKCRB4tDGHoIJi
0vgnAP9UM812drDNILFwXxq22fplvS0kxJiN9gGVH+/OGyOlEQD+JBBjHC1MU1Lt
okfKuk6deNpkgC+viWGs12HgWWuu8g4=
=9QSL
-----END PGP SIGNATURE-----

--iwu+DycW32HAkSb8--

