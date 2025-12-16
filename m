Return-Path: <linux-i2c+bounces-14602-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6676ACC4E3D
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 19:31:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BF61D3092C94
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 18:28:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B1E2344042;
	Tue, 16 Dec 2025 18:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uTlF7+lQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CDD9343D95;
	Tue, 16 Dec 2025 18:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765908307; cv=none; b=X14S5JqYlwe4hWIrKDX7zLzuX6/u9431J/xUaOP/qv9DhEbntJsYdrQ2M6mQfaJzo/dgRf+SMMu252hIz2yY/dZW659yUckQGVq1maeihK0dXwDUh5ZIu3RCvWPzhYwNHGL5alS0QCwMdXzrBoy37A44dr9JQx7aX/iwb/aCbhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765908307; c=relaxed/simple;
	bh=5veEkm+kqqQamSozZaPoLS3DvMZj21rJy1kucnd4rGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=khBmQzBx6LDwf601WPtUswJA/e+MaojGym/UKBUhV/mi4y7UG3g1rJfQJ4Fyr0Wx9iUH7thsA1FSlXr4TvSvdj9s+FXC4i95DsgXpxnNBgi0BkcqVMJHqWJx9QOnNsb3Zgbl4DuIRJnvOeAnIvwoxH/pWRlFE65crQkH21wO+tU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uTlF7+lQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C4BC4CEFB;
	Tue, 16 Dec 2025 18:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765908306;
	bh=5veEkm+kqqQamSozZaPoLS3DvMZj21rJy1kucnd4rGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uTlF7+lQywCRfDeyUsnXT+TpUaTna4YyNmFyhcEg01OSxDx/6U9J2bMGqlVf716My
	 eIEL32KGdZDryK0+BnqxrEfJb7pZg3XR8pIegu9vBTmnmxNo3u/1bFQyM6uxbVsy9B
	 Kehfccf0hcDtJxcYqw8P9zaar5jRgcd7RFG6ZWEEQfxmOx+BJjAwSpiY6N4NUhz7CY
	 JyLA+Urym+5ozJFUIechZdP0HVtS6C8TFlb8+fSdjYx6Ae9IVJc0zO39H1XKraQb0d
	 Xr4ycah1Hr962qd36AKQP8KbBki91toKWq95cYMvtGOUcvHDqLuocuX/59/tLNLkdc
	 vFUExjHAntidg==
Date: Tue, 16 Dec 2025 18:04:54 +0000
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
Subject: Re: [PATCH v2 10/19] dt-bindings: rng: atmel,at91-trng: add
 microchip,lan9691-trng
Message-ID: <20251216-dispersed-repaint-2d8af6a2e558@spud>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-10-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RiLWnDFliH+kmfL3"
Content-Disposition: inline
In-Reply-To: <20251215163820.1584926-10-robert.marko@sartura.hr>


--RiLWnDFliH+kmfL3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--RiLWnDFliH+kmfL3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUGfRgAKCRB4tDGHoIJi
0n5xAP0UsqB9PDAePLuEqSI3MWEQYw9DpyxsU2EOsJuuxvvp7QD9Eiw9HMYjpTpE
5KFP5lqzQvMbG79YE2u4UFIwhX1ujQk=
=lVE5
-----END PGP SIGNATURE-----

--RiLWnDFliH+kmfL3--

