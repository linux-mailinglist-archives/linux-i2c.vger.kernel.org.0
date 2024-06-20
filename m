Return-Path: <linux-i2c+bounces-4138-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD76910B2F
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 18:06:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C99FA1F217D8
	for <lists+linux-i2c@lfdr.de>; Thu, 20 Jun 2024 16:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB1141B14FF;
	Thu, 20 Jun 2024 16:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VPz12hTE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEBA1B14F6;
	Thu, 20 Jun 2024 16:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718899601; cv=none; b=hXkyHnT9H8L5chZd92rn/cwQGMPCn9BJWVIptFU9Oh4bHTBgoYgcRseIfJuDvtsp+AVXMR3rS2FclwhtkH9xhFLLdeIZJ5rv+aDwy+w3/NZfN0XcUy7TdBs5b9lq0yn3Q8CRl5M1euFQfS38HYynBfcpFxjaZ9gY7t4+1K/3VLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718899601; c=relaxed/simple;
	bh=LGtv35FvlZB5cEXYAShER66SaKuyixPdIhslDnimU3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ry+sV1YzsRBJ5S5BmqPowfbIlP2dZ3J2S59AD2FLC31eSEhvLFNLlsbEM641grXFmHeFPVXQuOeHcufg40q5XkH40BKp+l/sohs336Th93K9uIIxRIYhg1qMAdCm66Pr75yoRS4Jj1UgzQW037yZlE/57jWxz7tYR8S13H1Q1do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VPz12hTE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BEA2C32786;
	Thu, 20 Jun 2024 16:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718899601;
	bh=LGtv35FvlZB5cEXYAShER66SaKuyixPdIhslDnimU3s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VPz12hTETnK/PrEGksITL4CZmnHLn1Nn60h6hvQKC6HMzxtbt8pQ398l1iyRpj946
	 7l8qs1MckalfmTKkaRGyTS4gmPOYa72VFgY5endeozOaSxV/hTV4z2e+49OrI0nmio
	 JTIAOuKJXI0AdLbLgiuEFYuUu/R/Mf/kVWUq5weg8cHEHj1OmNPKp5qYuO0/8bp5nV
	 1iAwA/Tqcruvz3CbliVU0gAyN9dAhv9C8kVCearBtImJb3AFTDeN5ZrZXBZT8YjRp3
	 iudTOQgRgLkqOEt1N5VAbhiec9NtlM5T9ThkgzrYbhwxNjJjrqpqWclf7lJSwp7mbi
	 CHWpD/VEvHyBQ==
Date: Thu, 20 Jun 2024 17:06:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Sergiu Moga <sergiu.moga@microchip.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Doug Anderson <dianders@chromium.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Vignesh R <vigneshr@ti.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-tegra@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>, linux-omap@vger.kernel.org,
	Kamal Dasu <kdasu.kdev@gmail.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org
Subject: Re: [PATCH 0/7] dt-bindings: i2c: few fixes and cleanups
Message-ID: <20240620-recite-deeply-ec4aa7458d45@spud>
References: <20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OWprGERt14zJA7P2"
Content-Disposition: inline
In-Reply-To: <20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org>


--OWprGERt14zJA7P2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jun 20, 2024 at 01:34:48PM +0200, Krzysztof Kozlowski wrote:
> Few fixes for I2C controller schemas. The third patch (atmel,at91sam)
> depends on first, so I suggest not splitting this into fixes branch but
> take as is via next branch.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

--OWprGERt14zJA7P2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnRThwAKCRB4tDGHoIJi
0qmFAP4qVsTO5fhoHDH/KxLOQ9oIndV8aFx4pmYEmgmRLGL9OQEArGLygc2tOMFb
gTTMxW9UouX8OISj6ZTyIyS1QKmpIgI=
=vTRs
-----END PGP SIGNATURE-----

--OWprGERt14zJA7P2--

