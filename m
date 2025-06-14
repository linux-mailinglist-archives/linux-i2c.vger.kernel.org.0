Return-Path: <linux-i2c+bounces-11469-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32715AD9C66
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Jun 2025 13:13:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5529117AD29
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Jun 2025 11:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ACD925C6F3;
	Sat, 14 Jun 2025 11:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mwTsZuIC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0C5256C80;
	Sat, 14 Jun 2025 11:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749899577; cv=none; b=ott/Xal8dRLaHeYQeEB+cOi8kzlc9WwRs9ab0q4uySZ2MkuVZwy7jIPOKMHsVeJLBa9q17VQ60XoOX7CBlscxmLqHxjGg4zBC2HvIjxRwe9EUgEudhlAVpdaBDpB6tfDzjHe04HYeuSOjHHV9fjUFH/8GtsNr3PrvlfTiFMzWl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749899577; c=relaxed/simple;
	bh=di0vudlUJl9ldcR9UsjTlgPrj2pTt9RZvG4yRZnfheA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=o9Zo3LeOrM2ak7cXcK+jOuaGugYgbfKFpbM5HA6nedqgF72QJusSIBQpvRKpdEk7yafK0zSSig8Egv90hks3TZ3SN+PJDWanx9aiv/HF/ID0WFFWJIlh/xMRAGbSB/D357eh+zdgOAqfocKPUr2T2ZlbPTN8GsbCXY89mbqv3/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mwTsZuIC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 418A2C4CEEB;
	Sat, 14 Jun 2025 11:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749899576;
	bh=di0vudlUJl9ldcR9UsjTlgPrj2pTt9RZvG4yRZnfheA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=mwTsZuIC6mohekKQprEBnkvZFbg92Z06uo552hFeIUoZyeB6wGwsTy8jD0fJX7msn
	 2s6MZ0AItWNvctoyqvv0KmmLPg5V0W41DI3KPxQ9rkye+yWJkpGg8QgKoAw8NnFttS
	 yP0l8dDZ4Y7KxtGgN+T+lraguvPIIqekJ8Ie065J7Ft8XcdGDHcnuw8SdnEWTMm7Uk
	 E6u8wEjwCDP0TAh8AfPEOyjtB4erytWA6n17GqUUPseVF/dL+WuPhaMIGyQ41T6y4z
	 2hxc0PadsQyJHQIComuYupkWskeCohqOujwB0O9ldMhQTiJbI+2UQkX+phnzaZ80RI
	 3HWemMiHHJzaQ==
From: Mark Brown <broonie@kernel.org>
To: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Srinivas Kandagatla <srini@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Joerg Roedel <joro@8bytes.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Vinod Koul <vkoul@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Arnd Bergmann <arnd@arndb.de>, 
 Sven Peter <sven@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-i2c@vger.kernel.org, iommu@lists.linux.dev, 
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-sound@vger.kernel.org
In-Reply-To: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
Subject: Re: (subset) [PATCH 00/11] Drop default ARCH_APPLE from Kconfig
 and use defconfig instead
Message-Id: <174989957100.19870.13761538351492320924.b4-ty@kernel.org>
Date: Sat, 14 Jun 2025 12:12:51 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c25d1

On Thu, 12 Jun 2025 21:11:24 +0000, Sven Peter wrote:
> When support for Apple Silicon was originally upstreamed we somehow
> started using `default ARCH_APPLE` for most drivers. arm64 defconfig
> also contains ARCH_APPLE=y such that this will turn into `default y`
> there by default which is neither what we want nor how this is usually
> done.
> Let's fix all that by dropping the default everywhere and adding the
> drivers to defconfig as modules instead of built-ins.
> None of these patches depend on each other so we can just take them all
> independently through the respective subsystem trees.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[10/11] ASoC: apple: mca: Drop default ARCH_APPLE in Kconfig
        commit: f59427932885f9b47b22b532b079478905b9ad08

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


