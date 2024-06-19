Return-Path: <linux-i2c+bounces-4116-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64CA590F585
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2024 19:54:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C45B28292B
	for <lists+linux-i2c@lfdr.de>; Wed, 19 Jun 2024 17:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C19FB156256;
	Wed, 19 Jun 2024 17:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ANVI5mqO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78BEC15665C;
	Wed, 19 Jun 2024 17:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718819632; cv=none; b=XnYU555iuxmaO7/CHv9bGAeqKSHsbaufmIUuP69OiZmoUdMYvfcXJHt2au04guPb0aW2pFRVV6REgPlZ4+/JDZgvbOtYnS28s71NC+Ir36QSN06xlNuirHE+Y28PAZ4Ixv9dp02z81cxoSqzZ488WnRFCT/UU1fegjFskqS6eGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718819632; c=relaxed/simple;
	bh=TvoeJV62zGoYqldNkeqR8u101vJVySCOKHGBfXw8UyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qAhOnzXsl4G6G302JveHx9HLJ5uZNwk5JaoAs5d98AnYPEwi2qdbuDocGQCzNdqmPnNA70V9LWM4LBe3AzggrQKxS6sdmt/FLdGkOk42klKlGQKVXV/Ojmyz9AtyOQIHuFdZltWC2iGAjd2QFyendzZCoynx7LzTM/u0/wUEwT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ANVI5mqO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A67C2BBFC;
	Wed, 19 Jun 2024 17:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718819632;
	bh=TvoeJV62zGoYqldNkeqR8u101vJVySCOKHGBfXw8UyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ANVI5mqOYkQ1NJSm8ukNcwhNp6Rlp+Mss67jzBovfIDW4mAfFwBBcn3qLv6pbirhJ
	 DhNj0Eg/u0r6zClTGWwPiPIHZrvsgFr2PN217dnfZOPtQTykJpX8aqBvBAkb0lqpI/
	 8p89VlQsJrZwPiH+mRJSvZMrQMRuJFxAR9n1hz1oU+iP9F/0Ufidl4g6SEnUL+ig4j
	 EoYHFo5Ae7EcJSze34AIrSCIYYXfwf39Urp4k1kNkFyVgbi1LUSSfqBV91umr+TlJR
	 7CJGtaHJBW/SACzyDRKlDxU0a0FzSnF4ZoDZlBiUDleQUeiCWFlosZtiepaWEvan1r
	 XL/86blOE8Apg==
Date: Wed, 19 Jun 2024 18:53:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrei Simion <andrei.simion@microchip.com>
Cc: brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, arnd@arndb.de, gregkh@linuxfoundation.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] dt-bindings: eeprom: at24: Add at24,mac02e4 and
 at24,mac02e6
Message-ID: <20240619-thee-herald-82725e1526e2@spud>
References: <20240619072231.6876-1-andrei.simion@microchip.com>
 <20240619072231.6876-4-andrei.simion@microchip.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XRg9XVxyqsfEYao/"
Content-Disposition: inline
In-Reply-To: <20240619072231.6876-4-andrei.simion@microchip.com>


--XRg9XVxyqsfEYao/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 19, 2024 at 10:22:31AM +0300, Andrei Simion wrote:
> Update regex check and add pattern to match both EEPROMs.
>=20
> Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
> ---
>  Documentation/devicetree/bindings/eeprom/at24.yaml | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documen=
tation/devicetree/bindings/eeprom/at24.yaml
> index 3c36cd0510de..46daa662f6e7 100644
> --- a/Documentation/devicetree/bindings/eeprom/at24.yaml
> +++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
> @@ -18,7 +18,7 @@ select:
>    properties:
>      compatible:
>        contains:
> -        pattern: "^atmel,(24(c|cs|mac)[0-9]+|spd)$"
> +        pattern: "^atmel,(24(c|cs|mac)[0-9]+[a-z0-9]*|spd)$"

Could we relax the pattern instead to make this bloat less? Would it be
problematic to just allow "^atmel,(24(c|cs|mac)[a-z0-9]+|spd)$"?

>    required:
>      - compatible
> =20
> @@ -37,8 +37,8 @@ properties:
>        - allOf:
>            - minItems: 1
>              items:
> -              - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas=
|rohm|st),(24(c|cs|lc|mac)[0-9]+|spd)$"
> -              - pattern: "^atmel,(24(c|cs|mac)[0-9]+|spd)$"
> +              - pattern: "^(atmel|catalyst|microchip|nxp|ramtron|renesas=
|rohm|st),(24(c|cs|lc|mac)[0-9]+[a-z0-9]*|spd)$"
> +              - pattern: "^atmel,(24(c|cs|mac)[0-9]+[a-z0-9]*|spd)$"
>            - oneOf:
>                - items:
>                    pattern: c00$
> @@ -54,6 +54,10 @@ properties:
>                    pattern: mac402$
>                - items:
>                    pattern: mac602$
> +              - items:
> +                  pattern: mac02e4$
> +              - items:
> +                  pattern: mac02e6$
>                - items:
>                    pattern: c04$
>                - items:
> --=20
> 2.34.1
>=20

--XRg9XVxyqsfEYao/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnMbKwAKCRB4tDGHoIJi
0iCkAP9hGVTL4oDlyuUZntlpLydYFouPhAKDNehu5TTD5NYgLQD/cLfwXYsG+Ocr
vzwmJSbyWHGsK9ASRHGkzes0xTyVoA0=
=K/Yu
-----END PGP SIGNATURE-----

--XRg9XVxyqsfEYao/--

