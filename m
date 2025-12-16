Return-Path: <linux-i2c+bounces-14594-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F921CC4B38
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 18:34:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4CB63058626
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 17:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD78333720;
	Tue, 16 Dec 2025 17:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DbEEfG/e"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2FE4126C02;
	Tue, 16 Dec 2025 17:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765906379; cv=none; b=G/gkTomugjUbLdoTErAHhtDHluo0zRkcK9DkGCcdWTFmDS9nCyTHQIQtv+xrE6xjVLMEcGAzV0VPTaiAH1uqzaBwLljUIVvo0LqX+2OiDk4dvQR6bob18z5cRKNXxZ5xlzrCjjbmk0E1UkDwJA22OZK+qZc5uGccTzZqq5wvOVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765906379; c=relaxed/simple;
	bh=EcJWT/Y11hSteIxvRAaAA5sSSN1V5ZsTUetswisKyqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jCZ+MiNtVQvfr0aHeh8cDejycLX58AjV3QoP+XmAPvChXc90NszvaRawT7IItJUcX6MeGp/cPCAKMpywCJmFnl0O1GY0Iangsii9T+U7h6iVUu0DwZAgZDzUwsZ0nW0hTb93yugNjehtMUiuLv9oIDdkzyUG2cJPyD6uNNm7vvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DbEEfG/e; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7978C4CEFB;
	Tue, 16 Dec 2025 17:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765906378;
	bh=EcJWT/Y11hSteIxvRAaAA5sSSN1V5ZsTUetswisKyqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DbEEfG/e/O3e94JLIDKKtFRclstRKFq868Ts5kKH/qiJnxfvu//KLo523Dy4sZs1W
	 nUvSKbhjIutNCvLGqSFGB460cHVthqQA1Fl4KyCCcho0fcDR2a+2Iw2smemT8NcjKe
	 dIzyvyFyKSoHcNasT2BcSDbEKNXwWGsG/3y5Cm7mOYeLJJ3iOOWhXwjWcyHLoCPFOl
	 PjT3ED4oeekrBt4aSFCOHpW8X3eyCNuhb5tzqQmjn8uO+KHeC1rXUonZVUG05PVrJG
	 f7J/J/4OIpdeRNXR0AlOy+paNP99sqbSq7ecsPxtqQsb3L1M3N09K8V5j/OXxe22sA
	 s+x1uHUrDXqWQ==
Date: Tue, 16 Dec 2025 17:32:47 +0000
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
Subject: Re: [PATCH v2 18/19] dt-bindings: arm: microchip: document EV23X71A
 board
Message-ID: <20251216-endorse-password-ae692dda5a9c@spud>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-18-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eu+QXVmIK+7elvwE"
Content-Disposition: inline
In-Reply-To: <20251215163820.1584926-18-robert.marko@sartura.hr>


--eu+QXVmIK+7elvwE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 05:35:35PM +0100, Robert Marko wrote:
> Microchip EV23X71A board is an LAN9696 based evaluation board.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  Documentation/devicetree/bindings/arm/microchip.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/microchip.yaml b/Docum=
entation/devicetree/bindings/arm/microchip.yaml
> index 910ecc11d5d7..b20441edaac7 100644
> --- a/Documentation/devicetree/bindings/arm/microchip.yaml
> +++ b/Documentation/devicetree/bindings/arm/microchip.yaml
> @@ -239,6 +239,14 @@ properties:
>            - const: microchip,lan9668
>            - const: microchip,lan966
> =20
> +      - description: The LAN969x EVB (EV23X71A) is a 24x 1G + 4x 10G
> +          Ethernet development system board.
> +      - items:
> +          - enum:
> +              - microchip,ev23x71a
> +              - microchip,lan9696

This looks wrong, unless "microchip,lan9696" is a board (which I suspect
it isn't).

> +          - const: microchip,lan9691
> +
>        - description: The Sparx5 pcb125 board is a modular board,
>            which has both spi-nor and eMMC storage. The modular design
>            allows for connection of different network ports.
> --=20
> 2.52.0
>=20

--eu+QXVmIK+7elvwE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUGXvwAKCRB4tDGHoIJi
0vzsAP9o0wjRIx80sLvMsT3xQVcG7EuQTVrW1u9TApBVK+c3TwEA9h74P320YLBM
mpkWc+jP9Fiu7F/VIizZfeawyYjvOww=
=+dx2
-----END PGP SIGNATURE-----

--eu+QXVmIK+7elvwE--

