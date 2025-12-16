Return-Path: <linux-i2c+bounces-14600-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C0DECCC4D5F
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 19:19:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D186130386BA
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Dec 2025 18:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C551933E375;
	Tue, 16 Dec 2025 18:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sGZhLxNX"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3911632ABFE;
	Tue, 16 Dec 2025 18:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765908229; cv=none; b=ZD2/mMcOhQEXTqljtBbctW2gQMxOvcfbtM1JL4hp/+G85pS1q5QXIwKlbo1Fs1RA2H0EB5cWRScEiPZlkhKzuYu9vKYHkTMu9TONdgguZAWi7l7O20W8nPXEZ9Y0aTcxFDERcmjb112Sq/gg6pblZz9/KsVqplDwp+T1M3P20fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765908229; c=relaxed/simple;
	bh=uw9UEE73Oa47vY+WaW3IP3rQLFkIq6VPLGolGwYjMaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lyA04XMTHVam5inUs08KEqyZlY4Yc74usXVkWl85gQqlSf2LhYOCFMwAihmRu4kI19C0SgT2jmxUZrvuLpDB0j0GRAMkEnYFSQdlRnl9iO32zOAlFq9Q0yt7SRDxnhjLDz3vEPECZzH8Iwmx33Qigd4fSCD8q0wCmi1NncvqFrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sGZhLxNX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B7ACC4CEF1;
	Tue, 16 Dec 2025 18:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765908228;
	bh=uw9UEE73Oa47vY+WaW3IP3rQLFkIq6VPLGolGwYjMaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sGZhLxNX9Ydu6dthlTe18VJTZkswMmwuPGkq35ZKGKMYjSInCx4uEalEGIllueAnW
	 eO5fnqFPsYKuEVuv/Rn9h3kFNzG45YYo5pb2hnG7qMf7awzTl4cpM++VOaTlpr631r
	 TJWa7f5mb+zU81nvDWJ3SZrnJZ/pPEQ6sNRmrqThtnHD9KmFK2NbUAA6YVSx5f/ATa
	 KLD3CbsOBnNuDQqgE2YzKrodUkyxap82DZfBii0zXy6YHmdgnwyEAd+ucX8eGKR65c
	 Y29DZ/Ar1sex+yf3CrCXybPb+WEZOi5bQvnGSV1tXXda8CKbnRiWczD02rnzrsVsJK
	 BB3sxiayVAXPw==
Date: Tue, 16 Dec 2025 18:03:37 +0000
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
Subject: Re: [PATCH v2 12/19] dt-bindings: crypto: atmel,at91sam9g46-sha: add
 microchip,lan9691-sha
Message-ID: <20251216-cozily-taking-b35950730d69@spud>
References: <20251215163820.1584926-1-robert.marko@sartura.hr>
 <20251215163820.1584926-12-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RCIzIz+3EuWNz1kl"
Content-Disposition: inline
In-Reply-To: <20251215163820.1584926-12-robert.marko@sartura.hr>


--RCIzIz+3EuWNz1kl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--RCIzIz+3EuWNz1kl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaUGe+QAKCRB4tDGHoIJi
0oFzAQCd0B8fI/kWrW+YgnhlZzsAK++wCY88Dj3KIOSLAh08lQEAz65r/pWKhVdX
rH7pB3H/kWDCyp5zEG3tgkZnZbZRrQg=
=1r2y
-----END PGP SIGNATURE-----

--RCIzIz+3EuWNz1kl--

