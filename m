Return-Path: <linux-i2c+bounces-14598-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 12149CC4BD9
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 18:39:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 356D830A7A21
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 17:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06DED337104;
	Tue, 16 Dec 2025 17:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KT27MiOq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939792C21FC;
	Tue, 16 Dec 2025 17:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765906603; cv=none; b=AUJ6SoOWgAd4r2NLNTG6yE+PuOrc+MU12JfpCV4fMm/n9PZVhgEAeQ/xpK/K4bvnmLDrXbH7YMSm3Hl3XR02lmjzESTq73tsHUtGdY4K8mYGaB9bbwdfxc1+/1/TZ7gND+KatSfo8TUXXem6NoiDuKVgMNU5hgRzYq2B1sZszxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765906603; c=relaxed/simple;
	bh=zOFcVEtlCCznFZ/0DXCrBRMUQm0xlBq4aQ4km3Nl4FU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YzO+6LEIdzzJkrDD8hGcsWOR+GYUqSc+x7eRN+mdOY3gJh3QOHkED4Q+4I9yuK2VnHHm1vZiVjnPZkusBjxTlxSfU2T2HrTZAQtrN3aqVY+HLVTmGsg7yRX0xUupN97DnZtgc9RPtU/WOv+tSvcrZBJYOZfw2QvPaLj2uPI01vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KT27MiOq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFE09C4CEFB;
	Tue, 16 Dec 2025 17:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765906603;
	bh=zOFcVEtlCCznFZ/0DXCrBRMUQm0xlBq4aQ4km3Nl4FU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KT27MiOqvS2CiNhpmgDh3jdyqT6cTHnyoJQ9nk5BIRxvboSECw/Z1ijC7RKKgoXAm
	 w1M8h9XfXLjn6ebs6He+wB7e5+kN1P3jGhybEp4qcYU2DkQwncORg4OS5VKfc7+Osq
	 W+a+m2b299ff7kVJbC87sjRLT4tTHPx0q3hqfGqOSiRTzIK8cy+kLwpC4b+BWMbhKF
	 ZfYvsHs4KczXTSEYfukbzklKQU3C9adSoQbyeYUhk4rxbBt2W/c9qVQZT1cq3+Y1xt
	 xFF4jO1G7ztVd+m9yugNtQoJY7KMYpsoidm4p7jdqIEktCuQpPAf1wKHw7XzFIJqH2
	 OSCSv8skG94zg==
Date: Tue, 16 Dec 2025 17:36:31 +0000
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
Subject: Re: [PATCH v2 13/19] dt-bindings: dma: atmel: add
 microchip,lan9691-dma
Message-ID: <20251216-cassette-skid-cc209a9c3ded@spud>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-13-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Pqck0FjEcpen1/ot"
Content-Disposition: inline
In-Reply-To: <20251215163820.1584926-13-robert.marko@sartura.hr>


--Pqck0FjEcpen1/ot
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 05:35:30PM +0100, Robert Marko wrote:
> Document Microchip LAN969x DMA compatible which is compatible to SAMA7G5.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml=
 b/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
> index 73fc13b902b3..b0802265cb55 100644
> --- a/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
> +++ b/Documentation/devicetree/bindings/dma/atmel,sama5d4-dma.yaml
> @@ -32,6 +32,10 @@ properties:
>                - microchip,sam9x60-dma
>                - microchip,sam9x7-dma
>            - const: atmel,sama5d4-dma

> +      - items:
> +          - enum:
> +              - microchip,lan9691-dma
> +          - const: microchip,sama7g5-dma
>        - items:
>            - const: microchip,sama7d65-dma

These two should be merged into an enum, they're both single-item falling
back to sama7g5.
pw-bot: changes-requested

>            - const: microchip,sama7g5-dma
> --=20
> 2.52.0
>=20

--Pqck0FjEcpen1/ot
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUGYnwAKCRB4tDGHoIJi
0nYCAQDU3J3Krob2l2qR5EC8gEeegRo58LGtAuvkNFTuEuSWCQEAqYzGWdeC6tir
6LKDQv0205TRThhsWgO61ffssMlQAAU=
=iMhx
-----END PGP SIGNATURE-----

--Pqck0FjEcpen1/ot--

