Return-Path: <linux-i2c+bounces-12490-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC54B3A17F
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 16:24:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 88C561C858D7
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Aug 2025 14:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5530314A6A;
	Thu, 28 Aug 2025 14:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c9UWA7qi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388D61FA15E;
	Thu, 28 Aug 2025 14:22:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756390943; cv=none; b=Q1V3UAamdv1CHaZCGiE4EtNq6LT7aBpE0HQpejO4Ab5/gpM8pn2ShIS1c98xb9jUkK3mxi5aEmJJ8HAtHqDr2cbrnl5v6wLOQhi3n5O47BOcNzbbgw3IbihfMRNhAEc5j5vZpChyTERoZ/Nc4nKdQe/QmYIMWZG6eN3Nmv8c28A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756390943; c=relaxed/simple;
	bh=ZNUOk/U5XHkyNmed5rNpKTvmqEEuZ1Qc8KSMKTF7N2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VZIIYJHobbQ+mVvyz6LUskk8aiVbWL562wYydoFXAWxqBQCRyNHf7MqIYk2x2B+BVCaUjx0Sa6Lu8eDXQgJHASBi9QHk2xBUWYFqdsWpTYWwXksR4SUQTwB4EVUfMyobsf5rL+ecpMLQO8tr4XsUPTmzvlTfwzrB0UjUjQd9pqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c9UWA7qi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A761C4CEEB;
	Thu, 28 Aug 2025 14:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756390942;
	bh=ZNUOk/U5XHkyNmed5rNpKTvmqEEuZ1Qc8KSMKTF7N2A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c9UWA7qi1mCxALI/fcKN3YcVU6r7ymNdfLj7eTcXldzCR6zJit7gQ+5KOHpnKbm+T
	 dhbMER4Rm403oplzlUJCyXAlhkX3xFaq1m3zp+Z9K3G/gN2ZWbvRhkpuB3S+3TyY5e
	 8UpVhJuYv2NcCUbh4QCBulLMoC2/cqWBFAugEm42eA9BU7lmnYLS3eXGpiJn7eRPfP
	 l8dzuY30A7ABSOMdKTzJstpikUD3zRCs09pjYhcDbF529t5uaGmXF4NIvzBtOg2D2m
	 ZgZVZLKojrkpB3D753h4uk7Tm2EL78Zl/HK5T3rBtZ0Sm6e9CHPxpg+t5mA68wsQWV
	 sMYDhmNK+NiNQ==
Date: Thu, 28 Aug 2025 16:22:19 +0200
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
Subject: Re: [PATCH 30/37] ASoC: dt-bindings: apple,mca: Add t6020-mca
 compatible
Message-ID: <aLBmG_YKAjfhclz5@finisterre.sirena.org.uk>
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
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net>
 <20250828-dt-apple-t6020-v1-30-507ba4c4b98e@jannau.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R/s8UvYbtRjS5rew"
Content-Disposition: inline
In-Reply-To: <20250828-dt-apple-t6020-v1-30-507ba4c4b98e@jannau.net>
X-Cookie: Filmed before a live audience.


--R/s8UvYbtRjS5rew
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 28, 2025 at 04:01:49PM +0200, Janne Grunau wrote:
> After discussion with the devicetree maintainers we agreed to not extend
> lists with the generic compatible "apple,mca" anymore [1]. Use
> "apple,t8103-mca" as base compatible as it is the SoC the driver and
> bindings were written for.

Acked-by: Mark Brown <broonie@kernel.org>

--R/s8UvYbtRjS5rew
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiwZhoACgkQJNaLcl1U
h9DqSwf9Geew2GG8U08Cp3YSqes1Niq7rfNXO481mbApMr+kngCZ4cjnxRGwZ690
77xnO5uGLJkfPBt8ZHzyyJK1A/u2sE+Smbb2mXKJoSNJ6Z2Yn/4i+Ez9OZ+ZyftL
fZMNo3ol1vREKrfdKTcgL5IiDYy/VyYGS+TUTWrLjv5N+RFP8a2KZKTKKz7urWMl
JuJt4kjIjX/7qY2ZM/VHS6F/yXZ1salKEYmdRATzPA6mAXix7sPVnAsfu3kkBJ65
TZnb9NKtLK/ZB9V/X8GzXTxHuDeY9TmCpc/+eebbXeBZpOou9mTxYxpHoRAF3MXC
WEXpefNWCR7pc3QpdL7HzMvzvIT5GQ==
=4Q82
-----END PGP SIGNATURE-----

--R/s8UvYbtRjS5rew--

