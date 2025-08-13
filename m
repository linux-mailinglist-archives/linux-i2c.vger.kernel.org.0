Return-Path: <linux-i2c+bounces-12285-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BCEB25283
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 19:52:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4223A1BC45F4
	for <lists+linux-i2c@lfdr.de>; Wed, 13 Aug 2025 17:50:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E60DF289E23;
	Wed, 13 Aug 2025 17:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="phpPg1Ex"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913F0214232;
	Wed, 13 Aug 2025 17:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755107330; cv=none; b=NwBq0ajS3kjsqqm21hWDUtfMBgNr9BKcMC7hhq3Tyl8sYTXDVbgdVS0aqwwA2Aj9B2Go/3FGEbYUwV05L3AIk5qmENpX5ViIvbDaTmMbZBaFlhDyb886ALyXFqR93TVybmuX7RV4TEMsiUeuvUy/u83R/LOI9IHilGu25M51YYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755107330; c=relaxed/simple;
	bh=PKZQpIZ4aFM4Uz6odoT3GA7xbAwznTjRoJh5bhe9kDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ImA5iovOPmm0E9x2B6wHv0If8w5ebE0HZdpDzVnEfsAP15MGqh8VuJMG5MDs5zrrM9Nck7qYMD5RczKHpH/Nn4w0AOZqjDyuOKwdHCyWcQszfziKR/F1hGxXlddOFx35EXELyLsDw8fpmaTMC2+/RBFUCBOvNaLzMkxZTDPEcLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=phpPg1Ex; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C71D5C4CEEB;
	Wed, 13 Aug 2025 17:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755107330;
	bh=PKZQpIZ4aFM4Uz6odoT3GA7xbAwznTjRoJh5bhe9kDg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=phpPg1Exg3UZg/3X5vqDi0IIoOXur7Ew7OgygBNbeyISgO0CbuT6OwqY8PLlxWnip
	 6jJ4vTHI04+L0/Lb5acfN1N/1vTw7gcYWXBIgO5u9P4EZIKN2u9VYgRiaZlkXhRkPA
	 58JuJsn1mFC7L2YHVA0Nz5ZiUveJxME/ZYAoZ/rHcJqataQANA1jVJF+uuVqNRWVWY
	 hqid1EvlgT92U+hYHlPXGBjwZtnjoUAJh4KsgCPSvicPlSEc9L+ImgCSQUCzR5+RJ3
	 reF5t+vD478IYy3pT1nnuMHxvpxZhkAYnVWgMKD2N0qa2p9WmWtQ+TDQRDPToAbSiv
	 P6V6io0ovyyAg==
Date: Wed, 13 Aug 2025 18:48:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: linux@armlinux.org.uk, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	catalin.marinas@arm.com, will@kernel.org, olivia@selenic.com,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	andi.shyti@kernel.org, lee@kernel.org, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, arnd@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
	o.rempel@pengutronix.de, daniel.machon@microchip.com,
	luka.perkov@sartura.hr
Subject: Re: [PATCH v9 6/9] spi: atmel: make it selectable for ARCH_MICROCHIP
Message-ID: <e629381c-2ad7-4693-892e-1d896db2bceb@sirena.org.uk>
References: <20250813174720.540015-1-robert.marko@sartura.hr>
 <20250813174720.540015-7-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Le9MbVgkKAcD0eI8"
Content-Disposition: inline
In-Reply-To: <20250813174720.540015-7-robert.marko@sartura.hr>
X-Cookie: Turn the other cheek.


--Le9MbVgkKAcD0eI8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 13, 2025 at 07:44:42PM +0200, Robert Marko wrote:
> LAN969x uses the Atmel SPI, so make it selectable for ARCH_MICROCHIP to
> avoid needing to update depends in future if other Microchip SoC-s use it
> as well.

Acked-by: Mark Brown <broonie@kernel.org>

--Le9MbVgkKAcD0eI8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmicz/oACgkQJNaLcl1U
h9CwBgf9FMNxW0CB5IeMi0N03NdPh3cHrdyQTVznm+0Ttm4BbWAlmjjmhfOAg8JF
OIXZnvuk0IuAXUYGKYLNVuT4kRGXqgZKY7e1WqpkhsAfEam9ECXsRxc+w45KVL2A
Yni2+VdRQ+jB9nB84kRCVLpTDfymidB9CtYv//Fuc5YKwLqXPb28HXsnvMyrAQSV
HvOsLtfR+ImALUhvmAgYLbr1nAgEwdZoEV680HNFdrFVyd6NnFJHyhSZP9br6p68
KnlRw8CzokHg6rHDkthrZsHzf4x8wPfB/+QBzuzatBkzW/Z1x8Hgec/b4UUgM0hB
Vtj4AJLk/ypd5d2EH+NEmUdcy7H/UQ==
=vPOw
-----END PGP SIGNATURE-----

--Le9MbVgkKAcD0eI8--

