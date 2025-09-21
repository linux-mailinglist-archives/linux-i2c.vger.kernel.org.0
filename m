Return-Path: <linux-i2c+bounces-13067-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 53906B8DF1C
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Sep 2025 18:12:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E4A8189D402
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Sep 2025 16:12:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5A072773D2;
	Sun, 21 Sep 2025 16:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k9VA4+Ov"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48053275B15;
	Sun, 21 Sep 2025 16:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758470923; cv=none; b=XPZUOraAUtJWu+rAcss5RuL8XTCy3wV9Q8EO9bZtfDcZl7Xb+eG9XwyNJaHNlh5D+jvlmvTQWtYWu5NpiuPH0wOS7xyEtWwrwk0w6KlnFVuracks1Ac/qy5kGLzNxCVwv6XYRNY9TrOrEwVhyXDwHO5lR05ygSz2H4To6W6WXik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758470923; c=relaxed/simple;
	bh=WAbk4PWWXEXWUyECLBWj+jZRHQjNujjT1F6/7IR7Wkc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Bw914eV9xNhY0DbIO7dYgnjKMbsASZAsHUNYOahoQlICDghZNAFOPK1SI7NQZtA5qFhtgX0MY3rqlYAFjoPNl6De8l+N1gsBpeMVRc3siWjKtD6Inlm9PDF5M1ih4vaZQrhOLQCY23U8+3eHN/zwKqTUE3oXvCkFzsQQ9j0tGy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k9VA4+Ov; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F8CDC4CEE7;
	Sun, 21 Sep 2025 16:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758470922;
	bh=WAbk4PWWXEXWUyECLBWj+jZRHQjNujjT1F6/7IR7Wkc=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=k9VA4+OvtF9WMxvlQ8gfo6xoYVgPhME93HuDeyjVf3VJQKg5L51KazbJGvnQm02j3
	 GEWkqrPtWUqFxr15WM4BpVIZ9dGHMDnsux1aleg52r5KyYv+LHxTGl3b169Cwpso2A
	 yUbcEIYwho2ZjYgeMp0c05LtDAyQHhYgWuVOQykRCV8P/ZAO0A2xrsHUFcZ1ZYVztd
	 hVuGVTIdguTJgiGej5woK5cjYGCQTRMU+ddYcO0s3teIMgUWENJJnMWoMVmgI+Xo//
	 WXIz1Ll5H7P+4YaCUMRhwXoBllRaGg+2qQdNCRdAyyrY7rJGZ0a5/DxMDhjkybdc75
	 H1Hi9m6Bn3eAQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250828-dt-apple-t6020-v1-26-507ba4c4b98e@jannau.net>
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net> <20250828-dt-apple-t6020-v1-26-507ba4c4b98e@jannau.net>
Subject: Re: [PATCH 26/37] dt-bindings: clock: apple,nco: Add t6020-nco compatible
From: Stephen Boyd <sboyd@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org, linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org, dmaengine@vger.kernel.org, linux-sound@vger.kernel.org, linux-spi@vger.kernel.org, linux-nvme@lists.infradead.org, Janne Grunau <j@jannau.net>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Andi Shyti <andi.shyti@kernel.org>, Christoph Hellwig <hch@lst.de>, Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Jaroslav Kysela <perex@perex.cz>, Jassi Brar <jassisinghbrar@gmail.com>, Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>, Johannes Berg <johannes@sipsolutions.net>, Keith Busch <kbusch@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Marc Zyngier <maz@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Mark Brown <broonie@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, Martin =?utf-8?q?Povi=C5=A1er?= <povik+lin@cutebit.org>, Maxime Ripard <mripard@kernel.org>, Michael Turquette <
 mturquette@baylibre.com>, Neal Gompa <neal@gompa.dev>, Rafael J. Wysocki <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Sagi Grimberg <sagi@grimberg.me>, Sasha Finkelstein <fnkl.kernel@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sven Peter <sven@kernel.org>, Takashi Iwai <tiwai@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Thomas Zimmermann <tzimmermann@suse.de>, Ulf Hansson <ulf.hansson@linaro.org>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Vinod Koul <vkoul@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Will Deacon <will@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, van Spriel <arend@broadcom.com>
Date: Sun, 21 Sep 2025 09:08:41 -0700
Message-ID: <175847092150.4354.4054733553683969208@lazor>
User-Agent: alot/0.11

Quoting Janne Grunau (2025-08-28 07:01:45)
> After discussion with the devicetree maintainers we agreed to not extend
> lists with the generic compatible "apple,nco" anymore [1]. Use
> "apple,t8103-nco" as base compatible as it is the SoC the driver and
> bindings were written for.
>=20
> The block found on Apple's M2 Pro/Max/Ultra SoCs is compatible with
> "apple,t8103-nco" so add its per-SoC compatible with the former as
> fallback used by the existing driver.
>=20
> [1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@k=
ernel.org/
>=20
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

