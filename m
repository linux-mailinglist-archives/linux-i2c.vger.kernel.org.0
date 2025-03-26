Return-Path: <linux-i2c+bounces-10040-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 881F6A71DEC
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 19:01:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6CCD5188F8A9
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Mar 2025 18:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D42724C090;
	Wed, 26 Mar 2025 18:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IkZgRZm8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05201219317;
	Wed, 26 Mar 2025 18:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743012087; cv=none; b=NF/UsScT2zkREkguLIvU/WLRtljuWKzxTMq17LDYW6w3mv7z+16XMSP1XGH0MJD2NAXRlanZ9EPviNRwAM/fJlhvcTKso5QGytatj6FowRrRbkrT1JVwEoVhtiuS8TqaqeKBLrdixCNJpl3fRHbujECgcKrye5TFx9T1ZAXCM00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743012087; c=relaxed/simple;
	bh=XODh12uIsFY2/tj2p+YwbHSsmwijeYtL0jmgiLU4w9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aPqgM/h4S4Shw8kFICy3MLwbjzzqePBG+ttnHyfPqvjuCz7pmNESHnR8yBixVe5D0JVpnnRU4yVz6TFpD2cXqiL2jN5iUt4l3DmUWgYdaclnBt4IAQrVH0FIw6N6GusezWBs0Ca0EYsuqwy7TIWqZDBSRTn+KhSckXsBKM7TlRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IkZgRZm8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C5ACC4CEE2;
	Wed, 26 Mar 2025 18:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743012086;
	bh=XODh12uIsFY2/tj2p+YwbHSsmwijeYtL0jmgiLU4w9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IkZgRZm8wml2HVtC+O/eqSFAkprTGfM81nBDqexI5RRmNHZsV93BEQv1aei31/d9v
	 yvD40/G5WuakWxjh6SNpAWOBfT7mMi/PGiwFslZt0nkdIuQoTvDNCDdjzUN33fDqJP
	 xmWZYFAHMOLAKzGjFhTn91MBgA/OjohNO03bJYUoYh5RaIfpbvu3sM4BjZcJ90mm8w
	 DQX4LFBWo+2RcpJ84AJzRdv2s15r924MY5w1c8/hawE8WM4VeAj4FP7RrFuKPBtDLi
	 PTdlp77XVzoBC1vof6cGRhZONEuY+b3ANQuRQhecinu7nJ7+hIdkE64S3XbSDGOMce
	 CJl9gNAFBnQaA==
Date: Wed, 26 Mar 2025 18:01:21 +0000
From: Conor Dooley <conor@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: i2c: snps,designware-i2c: describe Renesas
 RZ/N1D variant
Message-ID: <20250326-unhidden-alfalfa-4dabbeb32c9d@spud>
References: <20250326090112.22495-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wO6ufMVLLAbN5dhW"
Content-Disposition: inline
In-Reply-To: <20250326090112.22495-2-wsa+renesas@sang-engineering.com>


--wO6ufMVLLAbN5dhW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 09:59:12AM +0100, Wolfram Sang wrote:
> So far, no differences are known, so it can fallback to the default
> compatible.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>=20
> If everyone is OK with this patch, does anyone mind if I shortcut it
> into the v6.15 mergewindow? It is just a documentation update and would
> simplify upstreaming the I2C chain for this board. One dependency less.
>=20
>  .../devicetree/bindings/i2c/snps,designware-i2c.yaml         | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.ya=
ml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> index e5d05263c45a..87eea87bdd52 100644
> --- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> @@ -27,6 +27,11 @@ properties:
>      oneOf:
>        - description: Generic Synopsys DesignWare I2C controller
>          const: snps,designware-i2c
> +      - description: Renesas RZ/N1D I2C controller
> +        items:
> +          - const: renesas,r9a06g032-i2c
> +          - const: renesas,rzn1-i2c

I don't really understand the rzn1/r9a06g032 difference here. Why are
both needed?

> +          - const: snps,designware-i2c
>        - description: Microsemi Ocelot SoCs I2C controller
>          items:
>            - const: mscc,ocelot-i2c
> --=20
> 2.47.2
>=20

--wO6ufMVLLAbN5dhW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ+RA8QAKCRB4tDGHoIJi
0v4QAP9DXKKZysCWunErwZHjrYGbQOXK48O3PgUAkjZ0t1lEAQD+LT9ExzPmd1LA
AitpOoskg8ey9MBhSCaIF8WG99anfwQ=
=VqwC
-----END PGP SIGNATURE-----

--wO6ufMVLLAbN5dhW--

