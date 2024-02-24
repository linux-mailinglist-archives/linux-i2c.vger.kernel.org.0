Return-Path: <linux-i2c+bounces-1966-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6211686271A
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Feb 2024 20:50:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C50A282C57
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Feb 2024 19:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E0AC4C634;
	Sat, 24 Feb 2024 19:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEvOBS72"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1645F3F8FF;
	Sat, 24 Feb 2024 19:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708804196; cv=none; b=j1PZ9hO4Tr3ldxWn3dafWp7ZDDVal5apL03bw6yaj/MPXofBm52CGMvgRtczacXFlZ/m0WpDt7CLPvudd9xpA06eL9hBkipn/HvWrgJiQHQ+6TphPs67CukSAe5X98Pl+rYRcoX7Qn3NbOXKRXMznd31uL/UA8alvSqreSRmKBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708804196; c=relaxed/simple;
	bh=LKcf52hIT2A2+hbYa23XsdcTHFHE1z6cL1qWeBShTXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GW7srXpprj+EWCRAAKRz03TdGXs67WHbx37kGPuOIh+5/uz9q12aZKHmpixoBHqA7FG8h7AWN9nHHLtoYH9f64CoFa7oIVuM0kHrtp0GmI8f412+eT29GFkAfq2WH62o5XzZrLRhe2DkjdaaF2U5EUbPzNSE5vxR8Lg6CT1gNfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEvOBS72; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5514BC433C7;
	Sat, 24 Feb 2024 19:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708804195;
	bh=LKcf52hIT2A2+hbYa23XsdcTHFHE1z6cL1qWeBShTXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IEvOBS72ofB8ErsDuFavfypj9GgLtKxg4uLHVjGeRWB7RIavMpgiVdnmwmF5sTaAi
	 F4UWbvk2FlmcDLd3VMAJqbgIBe8bR8N5NNWWO3THBnL5vrOmoudre6b+pGu9pg9INc
	 tOc/rMwloq1GL7j1yvxc4G9WYNCuuve+9I8daBCrR7k9mEL5+zL2+Vrq9Pa8HptYgs
	 6ASfYX5mQf3yUaC5OrlQFSHfguOEPGyNneSDLHjBgTaoU5d/BA4Nggq5kV97ml0kF8
	 pE3ePmiVVlbpuMANiVKi0oO//OVuGIPeX53rheDWF0088awA6WSr3X+U0sdyk+QtY/
	 z89jTeKUBj6FQ==
Date: Sat, 24 Feb 2024 19:49:51 +0000
From: Conor Dooley <conor@kernel.org>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: andi.shyti@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 06/39] dt-bindings: i2c: at91: Add sam9x7 compatible
 string
Message-ID: <20240224-unarmored-mastiff-0b6273cb7af4@spud>
References: <20240223171342.669133-1-varshini.rajendran@microchip.com>
 <20240223172459.671832-1-varshini.rajendran@microchip.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y4MadY9+wGHU8pb3"
Content-Disposition: inline
In-Reply-To: <20240223172459.671832-1-varshini.rajendran@microchip.com>


--Y4MadY9+wGHU8pb3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 23, 2024 at 10:54:59PM +0530, Varshini Rajendran wrote:
> Add compatible string for sam9x7.
>=20
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
> Changes in v4:
> - Made sam9x7 compatible as an enum with sama7g5 compatible
> - Removed the sam9x7 compatible from allOf section as it was not needed
>   like pointed out
> ---
>  Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml=
 b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> index 6adedd3ec399..b1c13bab2472 100644
> --- a/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/atmel,at91sam-i2c.yaml
> @@ -25,7 +25,9 @@ properties:
>                - atmel,sama5d2-i2c
>                - microchip,sam9x60-i2c
>        - items:
> -          - const: microchip,sama7g5-i2c
> +          - enum:
> +              - microchip,sama7g5-i2c
> +              - microchip,sam9x7-i2c
>            - const: microchip,sam9x60-i2c
> =20
>    reg:
> --=20
> 2.25.1
>=20

--Y4MadY9+wGHU8pb3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdpIXwAKCRB4tDGHoIJi
0mDNAQDGpl3vP5UAJMTUm53Y4KrHTVIBflsOrBopc0tvkP91qwEAgmnzmONyXwY7
NchKq6c1FgxFJbFWUaUs7wQtDehlTQ0=
=xGdj
-----END PGP SIGNATURE-----

--Y4MadY9+wGHU8pb3--

