Return-Path: <linux-i2c+bounces-11815-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB00AF7741
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 16:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D0701BC594B
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Jul 2025 14:22:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA5252E9EC9;
	Thu,  3 Jul 2025 14:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gOnfj6Jd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9641E19CC02;
	Thu,  3 Jul 2025 14:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751552504; cv=none; b=acxbHUsiaMzDrk3sT2kN+Pajz4PBzmukPrRfLoq2GUh9+l67jnWox+LAZJ421dI0fFblFox5f++m7PkNxTppkw4BPRNME/5bOEgPlZ8p6xYzB+5vUmFSkZHihJFhxe9QPG3/LI+zaJcZT1VGaMsMdfSB3QQYJF5zFRDZR1Hsw9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751552504; c=relaxed/simple;
	bh=8q/IVKrUxZauGxiUn174NgZfIXYmxkzaKI174acXcJY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RailLG86oRa+c4S+xVxb/k+9+7xNHKUYP6OTno7DTtdbwj7MN+ZgQ6MHyueT6RDY1cCU4RqMfLGg00bTDBS84eX6U/dSuIuv1XcV4UWiYAvwxhM7mnH8eQDKjnQ3ZNvmuuE4j+JEsRDDexcis0sVwrUcswGTxH5qDAQRCNAZ5ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gOnfj6Jd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE4AC4CEE3;
	Thu,  3 Jul 2025 14:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751552504;
	bh=8q/IVKrUxZauGxiUn174NgZfIXYmxkzaKI174acXcJY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gOnfj6JddvGC2tczpxc5Nhlp+9Z0UiFGRRU3sr4q71VnRB/GwYAQRCLZmuHr4sxxA
	 vEZU7xqhdgzNxuNCO3jBWjnpljc8VTGcskBdQEC556pU9PhKZcOTRVcBCzaMmQR+bJ
	 s9+uOMF6FGLhRLlVxnWJqQgXF4lPrSwE7sfN3zlKS0x9xMxXxyfq5b0b/Ys53xJ79N
	 3/rhDg3aIR2ZYVy29OK+y6hX9gwwhCcLOcDN1+TDIDhuxGHglj5hs8laI0aqAr8uf2
	 2UxfmVUtfg2N/objv3RDgkIZOnSwMCKi9DT6cACPvZ4UCg5vDGQ6jOT5EC7Tjapg5B
	 Nu+V/A49DF7fQ==
Date: Thu, 3 Jul 2025 15:21:36 +0100
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Robert Marko <robert.marko@sartura.hr>,
	Russell King <linux@armlinux.org.uk>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Vinod Koul <vkoul@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
	Lee Jones <lee@kernel.org>, Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Daniel Machon <daniel.machon@microchip.com>, luka.perkov@sartura.hr
Subject: Re: [PATCH v8 01/10] arm64: Add config for Microchip SoC platforms
Message-ID: <20250703-lapped-itunes-1cd711479f75@spud>
References: <20250702183856.1727275-1-robert.marko@sartura.hr>
 <20250702183856.1727275-2-robert.marko@sartura.hr>
 <ea353170-6e03-4231-afc2-3dc45253931d@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MYqRzWYWScpig/dd"
Content-Disposition: inline
In-Reply-To: <ea353170-6e03-4231-afc2-3dc45253931d@app.fastmail.com>


--MYqRzWYWScpig/dd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 02, 2025 at 09:57:10PM +0200, Arnd Bergmann wrote:
> On Wed, Jul 2, 2025, at 20:35, Robert Marko wrote:
> > Currently, Microchip SparX-5 SoC is supported and it has its own symbol.
> >
> > However, this means that new Microchip platforms that share drivers need
> > to constantly keep updating depends on various drivers.
> >
> > So, to try and reduce this lets add ARCH_MICROCHIP symbol that drivers
> > could instead depend on.
>=20
> Thanks for updating the series to my suggestion!
>=20
> > @@ -174,6 +160,27 @@ config ARCH_MESON
> >  	  This enables support for the arm64 based Amlogic SoCs
> >  	  such as the s905, S905X/D, S912, A113X/D or S905X/D2
> >=20
> > +menuconfig ARCH_MICROCHIP
> > +	bool "Microchip SoC support"
> > +
> > +if ARCH_MICROCHIP
> > +
> > +config ARCH_SPARX5
> > +	bool "Microchip Sparx5 SoC family"
>=20
> This part is the one bit I'm not sure about: The user-visible
> arm64 CONFIG_ARCH_* symbols are usually a little higher-level,
> so I don't think we want both ARCH_MICROCHIP /and/ ARCH_SPARX5
> here, or more generally speaking any of the nested ARCH_*
> symbols.
>=20
> This version of your patch is going to be slightly annoying
> to existing sparx5 users because updating an old .config
> breaks when ARCH_MICROCHIP is not enabled.
>=20
> The two options that I would prefer here are=20
>=20
> a) make ARCH_SPARX5 a hidden symbol in order to keep the
>    series bisectable, remove it entirely once all references
>    are moved over to ARCH_MICROCHIP
>=20
> b) Make ARCH_MICROCHIP a hidden symbol that is selected by
>    ARCH_SPARX5 but keep the menu unchanged.
>=20
> Let's see what the sparx5 and at91 maintainers think about
> these options.
>=20
> The other patches all look fine to me.

One more fun thing to consider is that we ended up defining
ARCH_MICROCHIP on riscv because people didn't want to have an
ARCH_MICROCHIP_POLARFIRE symbol enabling the pic64gx SoC. Therefore,
anything that relies on CONFIG_AT91 to be only selectable by users on
arm/arm64 when moved to CONFIG_ARCH_MICROCHIP (as this patch does) will
become selectable on riscv as a result.

--MYqRzWYWScpig/dd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaGaRywAKCRB4tDGHoIJi
0kalAP9rQkzuJjuFkyPd9IlOQj3R+Ld5bQNONlz6IG3u/RaW3wEA1mcw+qjQrIc8
tzY+P2Bw7n2cprxDhZQKO1xk0ihwGws=
=qB70
-----END PGP SIGNATURE-----

--MYqRzWYWScpig/dd--

