Return-Path: <linux-i2c+bounces-11306-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA3BAD236C
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 18:10:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E6EE7A1675
	for <lists+linux-i2c@lfdr.de>; Mon,  9 Jun 2025 16:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E5C821883F;
	Mon,  9 Jun 2025 16:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oej+R9SF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE84021578D;
	Mon,  9 Jun 2025 16:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749485399; cv=none; b=ZdoLx5jErG976ke0KLIQltoCS8hPYW8MWNjFztxo4mbIthAs4+mOHHQ1CFxjRwbaPxtNGLhXgm+UtasHm3C2lakx/bgxhaDz/2WOgzoUGYwq7haxXj8StaZNErJT+qKHDmVr33KODEh330hox2ucoVKhlMRP+X0lDmOwF0eyQTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749485399; c=relaxed/simple;
	bh=kmFmCzVsy/gyj97Pr6VaI8EqizWU2cS57ZLTXgVpEss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qkXfKERzvVZciRrKFO4ma4SvlXVhMwZvaT+4/+gdb3L77ul76DZyYyrNM7NcmGH6wqz36LkWHVBSVg6HRJqpzlNN2Z9VYL5AgfUy2aBOlEpdg3s00DW90Z4C8H8GQrh0FQbgg3/NentuaiDX/DTNBwhzwVLLzW/SH1DP8NL7ZiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oej+R9SF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD1A6C4CEEB;
	Mon,  9 Jun 2025 16:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749485398;
	bh=kmFmCzVsy/gyj97Pr6VaI8EqizWU2cS57ZLTXgVpEss=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oej+R9SFWkXPJUvsFtD4/DgLhl32kMK6KHcSRy6d2eX3940/USEvuVl6jPIjTezS5
	 oAES2mM/uK8dDB3Ebb5MxzMeGTzWKbhZgoHP1qRjpNx7wAa8PrmhzLi3KHbYU1gcYL
	 ds73qkFepgvRzh4pEo0BR66RzcJQI2vjyuCUyDtBQeKn3s6A3apqCfSD10INhVYRns
	 SuoYzPK7AJdFbYtEzAVTSydSx0mco46BX4MgD6ccn5L+J2ocSPPzeiXOS1CdRJrd1w
	 nUbebwwDDlzyT9r/Fi0+6gEgdvuh210uVp4lKwtDvS0Cg1WGMINyHGNaYsRuRcqEUT
	 EYatDTACot52g==
Date: Mon, 9 Jun 2025 17:09:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: akhilrajeev@nvidia.com, andi.shyti@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, thierry.reding@gmail.com,
	jonathanh@nvidia.com, ldewangan@nvidia.com, digetx@gmail.com,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] dt-bindings: i2c: nvidia,tegra20-i2c: Document
 Tegra264 I2C
Message-ID: <20250609-sizzle-shush-b2eb1443b3f7@spud>
References: <20250609093420.3050641-1-kkartik@nvidia.com>
 <20250609093420.3050641-2-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4x5fXavticha1vvc"
Content-Disposition: inline
In-Reply-To: <20250609093420.3050641-2-kkartik@nvidia.com>


--4x5fXavticha1vvc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 09, 2025 at 03:04:16PM +0530, Kartik Rajput wrote:
> iTegra264 has 17 generic I2C controllers, two of which are in always-on
> partition of the SoC. In addition to the features supported by Tegra194
> it also supports a SW mutex register to allow sharing the same I2C
> instance across multiple firmware.
>=20
> Document compatible string "nvidia,tegra264-i2c" for Tegra264 I2C.
>=20
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
> v2 -> v3:
> 	* Add constraints for "nvidia,tegra264-i2c".
> v1 -> v2:
> 	* Fixed typos.
> ---
>  .../devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml        | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yam=
l b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> index 6b6f6762d122..f0693b872cb6 100644
> --- a/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/nvidia,tegra20-i2c.yaml
> @@ -80,6 +80,12 @@ properties:
>            support for 64 KiB transactions whereas earlier chips supporte=
d no
>            more than 4 KiB per transactions.
>          const: nvidia,tegra194-i2c
> +      - description:
> +          Tegra264 has 17 generic I2C controllers, two of which are in t=
he AON
> +          (always-on) partition of the SoC. In addition to the features =
=66rom
> +          Tegra194, a SW mutex register is added to support use of the s=
ame I2C
> +          instance across multiple firmwares.
> +        const: nvidia,tegra264-i2c
> =20
>    reg:
>      maxItems: 1
> @@ -186,6 +192,7 @@ allOf:
>              contains:
>                enum:
>                  - nvidia,tegra194-i2c
> +                - nvidia,tegra264-i2c
>      then:
>        required:
>          - resets
> --=20
> 2.43.0
>=20

--4x5fXavticha1vvc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEcHUQAKCRB4tDGHoIJi
0mdCAP4iLXTNnbOYBpoSgowvw8EqxS5ptJogfQWY80AoHT4X0QEA/nKxuUPaDW0O
VU5NdknzzO4hkP54Ep+tJSTUt98rPgc=
=Ba+U
-----END PGP SIGNATURE-----

--4x5fXavticha1vvc--

