Return-Path: <linux-i2c+bounces-14601-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D80CC4D3B
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 19:18:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E4B8830CBE45
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 18:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B44E33FE0A;
	Tue, 16 Dec 2025 18:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kki9OGY4"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0000933FE26;
	Tue, 16 Dec 2025 18:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765908250; cv=none; b=XRswMdKLaPQnNfBsxeP9lTYbvxK/G32IBvgGA4XeGQSqRruMf1Ds+h32umwR7h6ojMJeHser/uhzC1BlO/TTG/fqRgMyyq+Q3iq0QehzO3l8VdDZdHs6jC+buE+oVgOjgFo0+gugoujMM7kXz5DL786RCLy0WO7cSXdWArZQlgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765908250; c=relaxed/simple;
	bh=RvRpG28ucXAE5Gd9NJetRik6A/oPa2UVDViAF/WDprA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mRUXKXkYQz+C6dEjQ/70XMUn4dQ800OpFneSFpwTqykMS+Cwcw/cw0wdhqb1UvD+r75Z+uemO5QJ0no2RY+jAQqGJN6/puWRLZ/cEuZa3wSN1sRiwsRzNaUGLR5X9jKPNbFgx+n+mdUm8CJPgsfgyCjZyCr7M0Us/pu8vGGlBGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kki9OGY4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E96D6C4CEF1;
	Tue, 16 Dec 2025 18:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765908249;
	bh=RvRpG28ucXAE5Gd9NJetRik6A/oPa2UVDViAF/WDprA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kki9OGY43lNnkMURCzfx6wOkdsIbTXfMJQqvvF4UhGeZRkkD8WmN8xhIXs5acV3hi
	 VTWUft4NPIcqBZK7ehhf4KmnDh0TYFfWFxTYD6jBfVvb4JN7oGOE+0RmbjlV1kOe3n
	 3aETzSNBwQYtFgz0vrnQNi7t3a0pUIlLDdW3jVvYZOf5+UUnarj+sLiiNPPsqkNx48
	 T315Q5lhoQJAM1LvfqgyzXMsBvUWYgpEhXpy1H4Ax3NTuY8wGcfUwAEOtcb1/i02xZ
	 g7FCBMkrbziwkTfGJ8+nbezsz3NpU7zbG+evBZg1dAnRwJs+/M7y58NxQPrcsgl1BT
	 /VtGZIPkV7R9w==
Date: Tue, 16 Dec 2025 18:03:58 +0000
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
Subject: Re: [PATCH v2 11/19] dt-bindings: crypto: atmel,at91sam9g46-aes: add
 microchip,lan9691-aes
Message-ID: <20251216-angles-brigade-ce5b5dcf6b34@spud>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-11-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="X+Tu52xfvOz9pYsb"
Content-Disposition: inline
In-Reply-To: <20251215163820.1584926-11-robert.marko@sartura.hr>


--X+Tu52xfvOz9pYsb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--X+Tu52xfvOz9pYsb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUGfDgAKCRB4tDGHoIJi
0j0CAP0Z6yDpOYueDQwbmn03cWbQ4ceuYvkaBtNT/qyBP1aRsAEA2IsK+QOlN8zt
iVlnezXRNQjwudCGTMpGbqOTNEUheAY=
=NLQe
-----END PGP SIGNATURE-----

--X+Tu52xfvOz9pYsb--

