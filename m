Return-Path: <linux-i2c+bounces-14606-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 402A0CC4EE5
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 19:39:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F8903051175
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 18:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB3B33CE83;
	Tue, 16 Dec 2025 18:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eWKlZqzU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60ECE8634C;
	Tue, 16 Dec 2025 18:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765910292; cv=none; b=Ikm65lej3kTTVHtaha1cc64FSYc1OodqGzfHSk0x+4egVZLQzT7YsUdX7+7KGxA1P0lSq4ytXkfP64oqRojBBbWkMCWL6CgZOGAMFCM2kLy9oNjjuCAmPudY7FoVD+M8CCE8HBNFi38bU3V8YvE+Hwq7iw+yMzuDTOXP+JYCaro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765910292; c=relaxed/simple;
	bh=uUu6H5TYAhD221JmNAoBMSiDEB9CQuEi4+EAEOm/oMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TgFF86nC0r2KG7kJWRBbSan5pkrnwCGH8nju+hZq13b66EPgknMgYsMOxKzlKDd2IHkC+VcjV/8kolsiH8jAHBZl38TTWH38gDR+OXgrZIkbo/P/9gwIYoBkcxGA9qoWh1ylKDLWztFdHCa1Pfj6K5IQ1kY+kSyDWwitUizQfKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eWKlZqzU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073EFC4CEFB;
	Tue, 16 Dec 2025 18:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765910291;
	bh=uUu6H5TYAhD221JmNAoBMSiDEB9CQuEi4+EAEOm/oMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eWKlZqzUJnT2BfO9u3DodIh4+Wj1NVasmxtxn1ivfXxFfaAzXVe1bFTOXFUIKQe71
	 VB6VqPjTAneOcWmZ3napgB1N3NLQLu4i3tvaqbPOthdDABHOr0WKI63MKoLfSdtc7M
	 1TEnnHtzsaXe6M1aFpkDmMjLq+d4rAafLAkJzEm8Fwv1Z/VezYQEqoyfycVEsSOJ8M
	 tQwuoIj5p/+V1nRvBL+adGM1cH0uej5DlH/Uujoz+sy8hN8xVb1X0gLEQaJ/H5wNCn
	 eTaHYtJPJHX/LObWi9uFOscvXUjaHDOg/LUPkPvEKUTS2IOyMSlpLAAeUiZZBlFZC1
	 y9pH2riWjd+OA==
Date: Tue, 16 Dec 2025 18:38:00 +0000
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
Subject: Re: [PATCH v2 06/19] dt-bindings: mfd: atmel,sama5d2-flexcom: add
 microchip,lan9691-flexcom
Message-ID: <20251216-fantastic-ignore-d1e06f5b222b@spud>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-6-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9ZFytLnJNcL8quyY"
Content-Disposition: inline
In-Reply-To: <20251215163820.1584926-6-robert.marko@sartura.hr>


--9ZFytLnJNcL8quyY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 05:35:23PM +0100, Robert Marko wrote:
> Add binding documentation for Microchip LAN969x.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--9ZFytLnJNcL8quyY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUGnCAAKCRB4tDGHoIJi
0rulAQCH83EvFae7mxsfxlbl4ZzO5pUzpCq1+qXYzRQa3cWmMAD5AYxP7uMKIeQ5
x+oTNJr64FUUjUes0W6yjNhHEwSXxgc=
=UM+s
-----END PGP SIGNATURE-----

--9ZFytLnJNcL8quyY--

