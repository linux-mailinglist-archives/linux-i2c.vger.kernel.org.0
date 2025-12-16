Return-Path: <linux-i2c+bounces-14595-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1749FCC4B75
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 18:35:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CF683037521
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 17:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729363346A8;
	Tue, 16 Dec 2025 17:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PIDE2PX2"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75044334361;
	Tue, 16 Dec 2025 17:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765906439; cv=none; b=sU0T5JrEIOR3PSyTyLG4B10w12jnT3pJm7HuwJPQZawXYacyoe4gT4M0hGZqy//exHyRL7oJ2NTh+meGmYpH1inLMkZ1FsCME8VSjARRqukJBE3RVeOozmTyMmnDePiOPdXk4LhM/K3jSwEuML3F62WW1ngorNu8+eHZdIuXcbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765906439; c=relaxed/simple;
	bh=zkMa+ox20IqXsT9lp4toHGBK7+h1bUmSrDWer2x1uGs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hqIPk9mjZIGuS6C+xJIgxSque8yg9OWPHEbxpY/tqpWVvPtTbrLSO4F5xDbKVQPeUmlbGTZT1WAiIK/mHg8nnDFM7fEG0r80KUwmI4nN4sBBCeJxIZhpkqDxkBUDy8FtuKb5y4GOfUwkipZG69zCEUMOFG7+bYTVp6MSxBtEF0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PIDE2PX2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B140C4CEF1;
	Tue, 16 Dec 2025 17:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765906439;
	bh=zkMa+ox20IqXsT9lp4toHGBK7+h1bUmSrDWer2x1uGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PIDE2PX2/CyG3F6c3tg8JVn2j8sTnxSDdTl8GhHxs7b7Q8WiSaex1ywmyAJZ/1Zzs
	 fix4q1Rq42Ilo1yDHi+jpVfsNAG1RSMXMMVocTqise6CG0alxypLgmR+UQz0nA0Org
	 6EDC+SBu50uQ04ac3mm7GydgKRajWUiX1r2N5m7BLaW6sK2vN7HH9TbipP9swJSZtC
	 LdRexRVKIsY1kIQcoD/DaO7Cb6HBdHFEV7FI/hZkJOlM+TTyAVhZ4ZZf8rt2IEVhFr
	 3BcWp0xHomlaj6H1S8JqywNvqqamXG0kIXmuL8r5wLMIxAfaL9U93zkDTIyx7rhaS0
	 gOY3A7F1Hs7LA==
Date: Tue, 16 Dec 2025 17:33:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
	linux@roeck-us.net, andi.shyti@kernel.org, lee@kernel.org,
	andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, linusw@kernel.org, olivia@selenic.com,
	radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com,
	gregkh@linuxfoundation.org, jirislaby@kernel.org,
	mturquette@baylibre.com, sboyd@kernel.org, richardcochran@gmail.com,
	wsa+renesas@sang-engineering.com, romain.sioen@microchip.com,
	Ryan.Wanner@microchip.com, lars.povlsen@microchip.com,
	tudor.ambarus@linaro.org, charan.pedumuru@microchip.com,
	kavyasree.kotagiri@microchip.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
	netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-clk@vger.kernel.org,
	mwalle@kernel.org, luka.perkov@sartura.hr
Subject: Re: [PATCH v2 16/19] dt-bindings: pinctrl: pinctrl-microchip-sgpio:
 add LAN969x
Message-ID: <20251216-payback-ceremony-cfb7adad8ef1@spud>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-16-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tfGUo7oADX5yhLyW"
Content-Disposition: inline
In-Reply-To: <20251215163820.1584926-16-robert.marko@sartura.hr>


--tfGUo7oADX5yhLyW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 05:35:33PM +0100, Robert Marko wrote:
> Document LAN969x compatibles for SGPIO.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  .../pinctrl/microchip,sparx5-sgpio.yaml       | 20 ++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-s=
gpio.yaml b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpi=
o.yaml
> index fa47732d7cef..9fbbafcdc063 100644
> --- a/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.ya=
ml
> +++ b/Documentation/devicetree/bindings/pinctrl/microchip,sparx5-sgpio.ya=
ml
> @@ -21,10 +21,15 @@ properties:
>      pattern: '^gpio@[0-9a-f]+$'
> =20
>    compatible:
> -    enum:
> -      - microchip,sparx5-sgpio
> -      - mscc,ocelot-sgpio
> -      - mscc,luton-sgpio
> +    oneOf:
> +      - enum:
> +          - microchip,sparx5-sgpio
> +          - mscc,ocelot-sgpio
> +          - mscc,luton-sgpio
> +      - items:
> +          - enum:
> +              - microchip,lan9691-sgpio
> +          - const: microchip,sparx5-sgpio
> =20
>    '#address-cells':
>      const: 1
> @@ -80,7 +85,12 @@ patternProperties:
>      type: object
>      properties:
>        compatible:
> -        const: microchip,sparx5-sgpio-bank

This should just be able to become "compatible: contains: const: microchip,=
sparx5-sgpio-bank.
pw-bot: changes-requested

> +        oneOf:
> +          - items:
> +              - enum:
> +                  - microchip,lan9691-sgpio-bank
> +              - const: microchip,sparx5-sgpio-bank
> +          - const: microchip,sparx5-sgpio-bank
> =20
>        reg:
>          description: |
> --=20
> 2.52.0
>=20

--tfGUo7oADX5yhLyW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUGX+wAKCRB4tDGHoIJi
0oZNAP9/2JaNZeG8Du3nY8OrniWvhpkl1VpOTa/YESMSh9pRbAD+PQxdpnbeGMU+
sGFCiXfLhdEnLHE5M1Fr1heOs+Wx2QE=
=vGNk
-----END PGP SIGNATURE-----

--tfGUo7oADX5yhLyW--

