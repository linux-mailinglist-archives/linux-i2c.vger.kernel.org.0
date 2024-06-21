Return-Path: <linux-i2c+bounces-4220-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E16C91275A
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 16:16:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE71B28853B
	for <lists+linux-i2c@lfdr.de>; Fri, 21 Jun 2024 14:16:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E5D20335;
	Fri, 21 Jun 2024 14:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o65zcFBA"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E66221C6BD;
	Fri, 21 Jun 2024 14:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718979355; cv=none; b=OBADWTchJyDtG/cwhaH5oFbdtlpGVfxaidwka3LcBTMNJSfGcKz1iQLE2gOUAdZcqZ36I25/KdUzHFf2J9QQLeVQWpKQV2SMiGcL8lxRbIWz/qS2c3HkBXEFcT1kbA1j4i0lYFc/uxDoGRbU/+fwYCzum0v+ILYY99Mskuuy7S8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718979355; c=relaxed/simple;
	bh=za2MxDAObiqIEVBJMDU7v1XvhGLJ+imINTPyDRhLpLM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TlD00Kwa8ZXfQes1v2qUqtYtWCpjdcdvNEai2kYVQ06h3f+LNZGiJOBW9yNAroZrLLoZmnODZX3WR0OdxDpWbPTbbpCz9UGEVXQVBEnQOYZCZkdLU7tU2a9FOTkf6cso9kIu8ctTIJJ4pdJW4YEdCC27zJ7WRh+XTW5AEyDaJ8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o65zcFBA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 190B2C2BBFC;
	Fri, 21 Jun 2024 14:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718979354;
	bh=za2MxDAObiqIEVBJMDU7v1XvhGLJ+imINTPyDRhLpLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o65zcFBAPk/pP5qWOg6FURU7KiNkoOXp44d9IJAvQoKz/kDJ7SnRQcThfZshFplcu
	 IKCu19V8Gu24gcjayiKe0ldOnsInho6gIxus2PtJrEcmqJW+01VSdQPRtiXt9A3xTt
	 kUhF4xLlEpnavzaUkleHsLQ+PJqWi6xUeMgOOTlghX+BBY0IYoDOYDRMAyL+PZdqr/
	 tnIba8Fbq6UjwAv/kV9rK0qC/arJovP5rCzi2mE9QJCDGbrprXWehYn0NjG0qYzV/+
	 IWmSTL8i/aNrjbr708eWkwYbAfuQwd+q+Wa9okvx2xV3pL9sNd8Xkcryuwyywn1DYF
	 9/EmFOPFdSl9A==
Date: Fri, 21 Jun 2024 15:15:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
	p.zabel@pengutronix.de, wsa+renesas@sang-engineering.com,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH 08/12] dt-bindings: i2c: renesas,riic: Document the
 R9A08G045 support
Message-ID: <20240621-tycoon-resemble-7fa4cd691939@spud>
References: <20240621112303.1607621-1-claudiu.beznea.uj@bp.renesas.com>
 <20240621112303.1607621-9-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="U91Hxo+ynXl/8kRg"
Content-Disposition: inline
In-Reply-To: <20240621112303.1607621-9-claudiu.beznea.uj@bp.renesas.com>


--U91Hxo+ynXl/8kRg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 21, 2024 at 02:22:59PM +0300, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>=20
> Document the Renesas RZ/G3S (R9A08G045) RIIC IP. This is compatible with
> the version available on Renesas RZ/V2H (R9A09G075). Most of the IP
> variants that the RIIC driver is working with supports fast mode plus.
> However, it happens that on the same SoC to have IP instatiations that
> support fast mode plus as well as IP instantiation that doesn't support
> it. For this, introduced the renesas,riic-no-fast-mode-plus property.
>=20
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/i2c/renesas,riic.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml b/Do=
cumentation/devicetree/bindings/i2c/renesas,riic.yaml
> index 91ecf17b7a81..c0964edbca69 100644
> --- a/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> +++ b/Documentation/devicetree/bindings/i2c/renesas,riic.yaml
> @@ -25,6 +25,10 @@ properties:
>                - renesas,riic-r9a07g054  # RZ/V2L
>            - const: renesas,riic-rz      # RZ/A or RZ/G2L
> =20
> +      - items:
> +          - const: renesas,riic-r9a08g045   # RZ/G3S
> +          - const: renesas,riic-r9a09g057
> +
>        - const: renesas,riic-r9a09g057   # RZ/V2H(P)
> =20
>    reg:
> @@ -66,6 +70,10 @@ properties:
>    resets:
>      maxItems: 1
> =20
> +  renesas,riic-no-fast-mode-plus:
> +    description: specifies if fast mode plus is not supported
> +    type: boolean

The correct type here is "flag", not boolean.

--U91Hxo+ynXl/8kRg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnWLFAAKCRB4tDGHoIJi
0rx4AQDK72mtMR+DQxuOqfx3EVjPx2nIzvd3VXtiSvnYAIijbgD/f67k8zd6b+w8
N4MWmgku6tXiydmX+/oiqh14LnN8zgI=
=du1X
-----END PGP SIGNATURE-----

--U91Hxo+ynXl/8kRg--

