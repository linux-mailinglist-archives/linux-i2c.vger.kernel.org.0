Return-Path: <linux-i2c+bounces-14597-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9F3CC4B5D
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 18:35:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 823573035037
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 17:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2661F339856;
	Tue, 16 Dec 2025 17:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CdS8jxld"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3756931A067;
	Tue, 16 Dec 2025 17:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765906504; cv=none; b=Y63wUW52d//tk/7f5av2zSk/MoaAXufwIczncxOLa5Ok9HZhbJr5PN7EHK3CyRxa+8to/i/AIipgghRPA5hqymGxrz9P8FHgvhi8Zvo0G/dSyhs39d2FZlAaoAbW+arZO7gwOhRwVuOyuJN1tjXywwSs8x66+33rynqZ5fejV/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765906504; c=relaxed/simple;
	bh=QvzlESZq5Ox4oz6zfYxUF717Nl6o9EGuR3z7k8kx+xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H6uwMsUUz1svaJNPiiOj+V5DMkT9mN5uhN3zHPH6FDq3NDquQkoVVlTVR55ZE1vYp6qzXwqsgBJ7JV8Fya1AieER0F8uMyXGE4/RA84zM8lP+gmwSAbQfGSlnhqCPkhuE/laLSL0ShHWc0J8rwQKiWlGAXpkUcUenoD+21R4l0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CdS8jxld; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D415C4CEF1;
	Tue, 16 Dec 2025 17:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765906503;
	bh=QvzlESZq5Ox4oz6zfYxUF717Nl6o9EGuR3z7k8kx+xo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CdS8jxldodntEx14t1RgFhidxoUDrHkt3jK1rT7oH37MuxaqDvvobXt8vYMsjUB7H
	 4xhdWZQlElB9KJm3dOzQmUvtSLqtJOwYQ0ggNjCsKIpBC1vvVTXUBVO7DwIckLigOD
	 4tXCrhigYO6DCgchUTHGN/ZfEd7/kLZyQ+ek9IWjZfJaOSeSTqwQR+zRv/xzEGVylC
	 cBCqKfhS6wC1Q0Pb98CiK34GVwQeeW6bQZlVJl/Id0VDTUlxOrrVZ4+ck3KYhtwoLz
	 +SpoPYs++PohpNLc0olocMWI3TSWdaNdm6onarrIKBYBW1HoH3oJ94Y70EgbtLA7Rx
	 Yf1rMP9EpDxmg==
Date: Tue, 16 Dec 2025 17:34:51 +0000
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
Subject: Re: [PATCH v2 14/19] dt-bindings: net: mscc-miim: add
 microchip,lan9691-miim
Message-ID: <20251216-platform-shine-8408b4491a6b@spud>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-14-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fcS29bQr3G4T0hja"
Content-Disposition: inline
In-Reply-To: <20251215163820.1584926-14-robert.marko@sartura.hr>


--fcS29bQr3G4T0hja
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 15, 2025 at 05:35:31PM +0100, Robert Marko wrote:
> Document Microchip LAN969x MIIM compatible.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--fcS29bQr3G4T0hja
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUGYOgAKCRB4tDGHoIJi
0gZ5AP4v9obwSNGwjyCWnRmdnhtu/hjYpHzZ81adJ6pprXXheAD/dOfcHlQTz63M
TVWTFt+rDEFbQsNhCcNKABmIkWsGIgU=
=DjyR
-----END PGP SIGNATURE-----

--fcS29bQr3G4T0hja--

