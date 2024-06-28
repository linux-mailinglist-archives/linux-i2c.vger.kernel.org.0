Return-Path: <linux-i2c+bounces-4479-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E2891C598
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 20:23:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 151D81C23081
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Jun 2024 18:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C9EF1CD5AE;
	Fri, 28 Jun 2024 18:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZdyI0W+n"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85701C0DF0;
	Fri, 28 Jun 2024 18:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719599023; cv=none; b=XCteQ3jldpDEaxn6A+zQ+qNn6MVXjXiBQ2r/pyjnbKQFfXUHMK6ojF7M4Dve58TdeIpdHfMHHwMrxQkoxXPVMoTC9V06p6xv3fgaZ2JOGSnmnZ3JumUs66BhxNfF9z7niKviBTSOGSHfYdqRN7rL79kGZrcIDGdCiBzb9KlUuEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719599023; c=relaxed/simple;
	bh=PSU3tdTo76FLPP7xiWLKc41rwOiwu52i+9dzvpqpwII=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YITa3NWvSVBIJjjxew5TnX4sWnkMae3Eutk+9DibksXkIDizWHyu7ipLcjvDU7nqaY97yMWQ7PeKp8q9qcPfbG5/o0JjfkclRLVAI7l5PD9MZcvc39+61gDClDmXz8ALQLB1f5yjNv3BL8snxTt3kHFJizvlVcTJoo3wDoQG64I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZdyI0W+n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72894C116B1;
	Fri, 28 Jun 2024 18:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719599023;
	bh=PSU3tdTo76FLPP7xiWLKc41rwOiwu52i+9dzvpqpwII=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=ZdyI0W+nmqUJCWipPdNf4cmBtY+rypYDwx+itWdMspkZMxFXGqTXLiqwqj+P/L2HW
	 ayxR9qnJXpys3ydRLPfokVQx98MOeqM03nKa/ytsBexikuA9liqDpHV1OfVVALU+tE
	 f7Fj4nqi4PEUTPns+yPNM8egQuCOh0Ovv/wpOD+UZ/8SlcGE22Ghaiomf6798XikSx
	 0fgHRjbt7tZT77y95s6ou8xunrmc2rYTHBH4XJGA+fSkOoEi4YpexqWOIht15+aPX7
	 D00T9WThNkC2oKuTUBzvB83od0XpV7aqlLaIS7DCv64svIp/Io9uTUPLn1flWW5vhe
	 Y1c3dtBmP4QfA==
From: Mark Brown <broonie@kernel.org>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "J.M.B. Downing" <jonathan.downing@nautel.com>, 
 Vladimir Zapolskiy <vz@mleia.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Arnd Bergmann <arnd@arndb.de>, Yangtao Li <frank.li@vivo.com>, 
 Li Zetao <lizetao1@huawei.com>, Chancel Liu <chancel.liu@nxp.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Corentin Labbe <clabbe@baylibre.com>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
 linux-sound@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>
In-Reply-To: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
References: <20240627150046.258795-1-piotr.wojtaszczyk@timesys.com>
Subject: Re: (subset) [Patch v5 00/12] Add audio support for LPC32XX CPUs
Message-Id: <171959901719.141669.17001815513243855671.b4-ty@kernel.org>
Date: Fri, 28 Jun 2024 19:23:37 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14-dev-d4707

On Thu, 27 Jun 2024 17:00:18 +0200, Piotr Wojtaszczyk wrote:
> This pach set is to bring back audio to machines with a LPC32XX CPU.
> The legacy LPC32XX SoC used to have audio spport in linux 2.6.27.
> The support was dropped due to lack of interest from mainaeners.
> 
> Piotr Wojtaszczyk (12):
>   dt-bindings: dma: pl08x: Add dma-cells description
>   dt-bindings: dma: Add lpc32xx DMA mux binding
>   ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT binding
>   ARM: dts: lpc32xx: Use simple-mfd for clock control block
>   ARM: dts: lpc32xx: Add missing dma properties
>   ARM: dts: lpc32xx: Add missing i2s properties
>   clk: lpc32xx: initialize regmap using parent syscon
>   dmaengine: Add dma router for pl08x in LPC32XX SoC
>   ARM: lpc32xx: Remove pl08x platform data in favor for device tree
>   mtd: rawnand: lpx32xx: Request DMA channels using DT entries
>   ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs
>   i2x: pnx: Fix potential deadlock warning from del_timer_sync() call in
>     isr
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[03/12] ASoC: dt-bindings: lpc32xx: Add lpc32xx i2s DT binding
        commit: 752fea92d9b3e4255a2f75e7efa6fe148562ccbf
[11/12] ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs
        commit: 0959de657a10cc40b2cc41cff9169ab0e0fd4456

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


