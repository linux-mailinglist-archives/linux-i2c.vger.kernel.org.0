Return-Path: <linux-i2c+bounces-13066-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 544A1B8DEE4
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Sep 2025 18:11:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 17CA8189D431
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Sep 2025 16:12:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1B5271443;
	Sun, 21 Sep 2025 16:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TZO+l66m"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7883E211A09;
	Sun, 21 Sep 2025 16:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758470915; cv=none; b=TUR4mQ25/crnJCRFRxYThsb+kw+DRuOscwQm6m34iaGdWZP05Ta/k0RpAfLrzw91Moe3PuEexV6GKJFB2FcmbRqpEkMgNqGCnq7kMcsdjLqYGDOqyKgCqWfe5Fg9X9ktsDQKGxzlxlC1IPNUQCOVaAbPSmGW+VtBPFyojqpftok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758470915; c=relaxed/simple;
	bh=bjgVhndVUFUWDh9Kli3/1k8OQLzpscDz8f8evH9FF0I=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=SUBbS1jSwfyriM91Lz5Wzgg24GvQD0V5daITiu14nox10ibNV/2TRlr4ncBG/UEnAqH9XSEGMJR1AfNqV1+esyrqR7IIjAagFGmsC3EzYK5xmduuRQFU5kFePf/eNPl3MuW6jWDadsDAI4tumV0hdZzW8I5ICvDf+XlH023yrZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TZO+l66m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEED8C4CEE7;
	Sun, 21 Sep 2025 16:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758470915;
	bh=bjgVhndVUFUWDh9Kli3/1k8OQLzpscDz8f8evH9FF0I=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=TZO+l66md5y3YCmXc+ANR/7ZQQnj+9xH3xUYAKm16jr1VgmO7nbmA17BrgK/cp/1I
	 ErAp9eU0l0ULWifGJSR8G6K31HdIhbPHRzPZCzoYVkURF0xm+t9Lp0IEZSKtUhv5To
	 NZu/9IYg7jMI23EOHyqP+9Yf1aKiJVOzv4il1R+7W1e64H8azKP5cKmPz00VBgcjHS
	 PM9ECn8MePHnkI7w4wRHfNxe5xMJ2h3rKfz6GeQ9giQ6ATo5gVf/vbqE+0BUftKaap
	 6gENrL80OHsZU6jBLMOv2yTsyFq8PwSbbvOqjz6w5EsEXkHMQfXyVbT4c+pXfINbKa
	 C6DAc9QudVGqg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250828-dt-apple-t6020-v1-25-507ba4c4b98e@jannau.net>
References: <20250828-dt-apple-t6020-v1-0-507ba4c4b98e@jannau.net> <20250828-dt-apple-t6020-v1-25-507ba4c4b98e@jannau.net>
Subject: Re: [PATCH 25/37] clk: clk-apple-nco: Add "apple,t8103-nco" compatible
From: Stephen Boyd <sboyd@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, iommu@lists.linux.dev, linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-bluetooth@vger.kernel.org, linux-wireless@vger.kernel.org, linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-clk@vger.kernel.org, dmaengine@vger.kernel.org, linux-sound@vger.kernel.org, linux-spi@vger.kernel.org, linux-nvme@lists.infradead.org, Janne Grunau <j@jannau.net>
To: Alyssa Rosenzweig <alyssa@rosenzweig.io>, Andi Shyti <andi.shyti@kernel.org>, Christoph Hellwig <hch@lst.de>, Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, Guenter Roeck <linux@roeck-us.net>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, Jaroslav Kysela <perex@perex.cz>, Jassi Brar <jassisinghbrar@gmail.com>, Jens Axboe <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>, Johannes Berg <johannes@sipsolutions.net>, Keith Busch <kbusch@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Marc Zyngier <maz@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, Mark Brown <broonie@kernel.org>, Mark Kettenis <kettenis@openbsd.org>, Martin =?utf-8?q?Povi=C5=A1er?= <povik+lin@cutebit.org>, Maxime Ripard <mripard@kernel.org>, Michael Turquette <
 mturquette@baylibre.com>, Neal Gompa <neal@gompa.dev>, Rafael J. Wysocki <rafael@kernel.org>, Rob Herring <robh@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Sagi Grimberg <sagi@grimberg.me>, Sasha Finkelstein <fnkl.kernel@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sven Peter <sven@kernel.org>, Takashi Iwai <tiwai@suse.com>, Thomas Gleixner <tglx@linutronix.de>, Thomas Zimmermann <tzimmermann@suse.de>, Ulf Hansson <ulf.hansson@linaro.org>, Uwe =?utf-8?q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, Vinod Koul <vkoul@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, Will Deacon <will@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, van Spriel <arend@broadcom.com>
Date: Sun, 21 Sep 2025 09:08:33 -0700
Message-ID: <175847091343.4354.2623772725149192827@lazor>
User-Agent: alot/0.11

Quoting Janne Grunau (2025-08-28 07:01:44)
> After discussion with the devicetree maintainers we agreed to not extend
> lists with the generic compatible "apple,nco" anymore [1]. Use
> "apple,t8103-nco" as base compatible as it is the SoC the driver and
> bindings were written for.
>=20
> [1]: https://lore.kernel.org/asahi/12ab93b7-1fc2-4ce0-926e-c8141cfe81bf@k=
ernel.org/
>=20
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>

