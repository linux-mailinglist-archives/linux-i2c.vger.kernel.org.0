Return-Path: <linux-i2c+bounces-12499-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D2FB3A41D
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 17:19:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C881160CFA
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 15:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10322224AED;
	Thu, 28 Aug 2025 15:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qE6XA4CD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C1F21D590;
	Thu, 28 Aug 2025 15:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756394243; cv=none; b=ROAfU/LcFV3vhCdTdFvzTreCP5cQt2Ftc+fRFiplxJwlj/epcu9Iuhq1pd5rbYHZxPecbtNfEe3A956b/kPH3vbFxOYL6K1PMaGKLHdZXfoI6Z3p7lXQa2hOMTzuCUeFuHS+8B1GLOOL9PKxAWNjaJ1augOBEGMkO1B0eQGa7RA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756394243; c=relaxed/simple;
	bh=QTp+z+uRajdBDuAcpoGw0n+G8rhvU8VIpemDkOlduIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ODPYIeagDX1hsO5FVAFRtBfNNJ7bI2gsTulunRYOHu/QODft2LDpBZI3zTNy9+xerCgUI/udlCDAVWCn+uB7jTrBB11thSlKAHSSJMDy4CmhnB68Cl6Ea9uotrMeMltuI7xsisK+U63ECU8H1Y4p3IrdClGUfYtg5wdch3Cn5RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qE6XA4CD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4072AC4CEEB;
	Thu, 28 Aug 2025 15:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756394242;
	bh=QTp+z+uRajdBDuAcpoGw0n+G8rhvU8VIpemDkOlduIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qE6XA4CDhkxL5Uw6hrGFgnOdas9BshlLaz3lmfetFFWdOd+G5TgZqVpd6GumXiCe4
	 sFlunVEx2I0UDc9uU8bBZYuR5euA1h2JMWtig3+ba+y4CIGcpE/9VysnGfXs5A8vJG
	 7pJBQNCvb+cdUYhpCUwygyBiCd18q4g4nDam8bTXK3E2eWL+uAKuTWOXdFZ7ykMrHa
	 75jSiVqvqffTWQrGcEtCnxYXoBSB0XmWtwnlgUf/jHMg1hJmLKUsyoymWrWQGTHcL5
	 nemt2Nnap1Oe2HwxWSBALuuv2VfBV017l8LCPGsTlVrpVLc7ztkJo29etA5exelZTC
	 uXJlmMgsH8v9Q==
Date: Thu, 28 Aug 2025 17:17:19 +0200
From: Mark Brown <broonie@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Sven Peter <sven@kernel.org>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	van Spriel <arend@broadcom.com>, Lee Jones <lee@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Marc Zyngier <maz@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, iommu@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-bluetooth@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-nvme@lists.infradead.org
Subject: Re: [PATCH 31/37] spi: apple: Add "apple,t8103-spi" compatible
Message-ID: <aLBy_5f4etNR_-yX@finisterre.sirena.org.uk>
Mail-Followup-To: Janne Grunau <j@jannau.net>, Sven Peter <sven@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	van Spriel <arend@broadcom.com>, Lee Jones <lee@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>,
	Vinod Koul <vkoul@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Marc Zyngier <maz@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
	Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, iommu@lists.linux.dev,
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-bluetooth@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-nvme@lists.infradead.org
References: <20250828-dt-apple-t6020-v1-0-bb8e1b87edef@jannau.net>
 <20250828-dt-apple-t6020-v1-31-bb8e1b87edef@jannau.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Esa+13vUQ7SuPTWG"
Content-Disposition: inline
In-Reply-To: <20250828-dt-apple-t6020-v1-31-bb8e1b87edef@jannau.net>
X-Cookie: Filmed before a live audience.


--Esa+13vUQ7SuPTWG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 28, 2025 at 04:52:09PM +0200, Janne Grunau wrote:
> After discussion with the devicetree maintainers we agreed to not extend
> lists with the generic compatible "apple,spi" anymore [1]. Use
> "apple,t8103-spi" as base compatible as it is the SoC the driver and
> bindings were written for.

Acked-by: Mark Brown <broonie@kernel.org>

--Esa+13vUQ7SuPTWG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiwcvkACgkQJNaLcl1U
h9AqVQf7BqZDbnA2DN7xZOFUqdRqFAcLrSF9DTh1T4ERnMKM6SkuxeWIFGSf2GrV
GsxhjmjqzKJSx0pULptVkHDm94IY2925d6a1Sev2ru2p8hvchYWV2SAdvzARcYEO
WNXbScrpwPdoORKP+i4u3sdYFOcyTu+3NNGlnv6E6OFKiTwmcITRoFGkvT1mjDhn
ReXmFjs0wLA4ec/ILUyY0WJRPs+GJlhzi6EhXHJVpPWaOORZU3MTSL6/ZR7stPye
x1ki4jWNEnF2e/Y42pTTNfG+v/w/gvhsdECyvCrBUc5G4hJ2ubcbJnU3BlrYDB53
a+oiCl3WPUP9MiUVfC9XJ5RRbNFYTg==
=CRnS
-----END PGP SIGNATURE-----

--Esa+13vUQ7SuPTWG--

