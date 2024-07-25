Return-Path: <linux-i2c+bounces-5070-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8020093C409
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jul 2024 16:24:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1DF63B23603
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Jul 2024 14:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C052319D074;
	Thu, 25 Jul 2024 14:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VNu6cctl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D07D1E4A1;
	Thu, 25 Jul 2024 14:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721917473; cv=none; b=m98JEoOaPncPSRVWJMd2XpFzHJ7TwpSzvqL7UEuOnBOdD/NFOXXFuOoXtjuP04jsTq/C/T4LGw8c9YP/kJ0qin+WD64CnrLZmOmaf4KGE2F7N8wO8EufFlnVJrBH+sRf9MyQXWJF4zdNdTAV59my58kKZ1Hxpk+89x+Ni9ogL4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721917473; c=relaxed/simple;
	bh=ynYqNYpFP8nF9JjVVaAwJ/O5Egn7q4qJq5uapoFKe4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JWXoY8OTIOLezvcOWI+ZdkxnnW/PgQywpj3TwRwD8FNbJhwCmy3/MFP0UJmW37iuteQ/kcgvWRB/ErfMS2mQyuRqZCXbbSNmbQhN/IJx8W/2GDWB4UjNZ2tV+lnBi3Dzkd8HnclVROejU0ljNp8i4qN4Ak4+F1I0wL0bFw3Kius=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VNu6cctl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF33BC116B1;
	Thu, 25 Jul 2024 14:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721917472;
	bh=ynYqNYpFP8nF9JjVVaAwJ/O5Egn7q4qJq5uapoFKe4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VNu6cctlLHj2aYXV6ZBGkUceYn+n2BjAE1KviFclbQlOzLXLhM4CNnyagJGrd73gk
	 bDJieBU+VL24KnRm46sgX4xUDxougT6COyS1xeqnHjrqsEwKw234TfqIszH1iu6h4l
	 y6PUbqkDxd4TXkGnGV3nAWYGWCH/50PlKKtHUJSv5OLLb94eGXWvG3S5XWfsIcYQSM
	 uZYTa/wijU4zEMZZoIT/7ylrpMSjkYFgjbRyDBi3Fpf7MOZPpmdLajTNMUZG88bZkB
	 ikOF88h2PxJeKc3lxlacuI9rfBdxTzlKtnZYzkuBpWROve/t7NwdkCXcyVcafHoZ+h
	 lc3YIt9Gz7kHw==
Date: Thu, 25 Jul 2024 15:24:28 +0100
From: Conor Dooley <conor@kernel.org>
To: pierre-henry.moussay@microchip.com
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/17] dt-bindings: i2c: microchip: corei2c: Add PIC64GX
 as compatible with driver
Message-ID: <20240725-cycling-nature-5e0157e180e3@spud>
References: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
 <20240725121609.13101-11-pierre-henry.moussay@microchip.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="T4MlqbveCHqxxDay"
Content-Disposition: inline
In-Reply-To: <20240725121609.13101-11-pierre-henry.moussay@microchip.com>


--T4MlqbveCHqxxDay
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 01:16:02PM +0100, pierre-henry.moussay@microchip.co=
m wrote:
> From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
>=20
> PIC64GX i2c is compatible with the MPFS driver

Please don't talk about drivers, bindings are for hardware.

>=20
> Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
> ---
>  Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml=
 b/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
> index afa3db726229..4ba8a27eb8e5 100644
> --- a/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
> @@ -18,6 +18,10 @@ properties:
>        - items:
>            - const: microchip,mpfs-i2c # Microchip PolarFire SoC compatib=
le SoCs
>            - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c=
 IP core
> +      - items:
> +          - const: microchip,pic64gx-i2c
> +          - const: microchip,mpfs-i2c # Microchip PolarFire SoC compatib=
le SoCs

Why is an mpfs-i2c fallback required? Can't we just fall back to the
fabric IP?

Cheers,
Conor.

> +          - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c=
 IP core
>        - const: microchip,corei2c-rtl-v7 # Microchip Fabric based i2c IP =
core
> =20
>    reg:
> --=20
> 2.30.2
>=20
>=20

--T4MlqbveCHqxxDay
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZqJgHAAKCRB4tDGHoIJi
0q+9AQD//e7E3xWxJ1vAVzogdPdHSnLZd0MfwKAmbe060kXDRwD/cc9nchqUhGni
k4EVfdxZjrYvDaqv/1fHm3dxaVTrFgQ=
=lynY
-----END PGP SIGNATURE-----

--T4MlqbveCHqxxDay--

