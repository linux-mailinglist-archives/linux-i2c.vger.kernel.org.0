Return-Path: <linux-i2c+bounces-1955-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D42F08621D7
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Feb 2024 02:19:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6353AB231FB
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Feb 2024 01:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78897475;
	Sat, 24 Feb 2024 01:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ff/ekrVk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7579F23BF;
	Sat, 24 Feb 2024 01:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708737553; cv=none; b=e7378TQsdXd1L6BUxPy62hU37FMkHsrV+sn/NCr9JeZBOCl3zWs4SBtxJczkefvKOS7S2d1xbonxItQYlyG9WPi4vNEwMGicoT3p7tT0KZB/9akoEZ5YJqr4RDN6yUF6FgnoMkFm6H7uBFhNhbfWvhrvKA1lK+KYYX79aLOSN5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708737553; c=relaxed/simple;
	bh=0W8qjJDpYcgYroDsZAHS1ygwFOJj7ZrezH6oMeip5ik=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Iwd8YPN/o0YuuBIpQjzcHLXtDfkR+tePZNQDip86CpbBpF7CaGHo09oTkQektsAjM3ldm3qRb4FOehMgtvqwRr8R8SGar3qyQ5Muoxl2nDLTaLD5HMlqicP8TuN73nxkj9tuS7hbHKh97D5S7Hxhw9yOOJvDLaV/G2kxWMfB0g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ff/ekrVk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 506E6C433C7;
	Sat, 24 Feb 2024 01:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708737553;
	bh=0W8qjJDpYcgYroDsZAHS1ygwFOJj7ZrezH6oMeip5ik=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=Ff/ekrVkMNWJBDGkpsP/ovqQh2yy1ijB5ftoTK+/UMaqJWDxNbNOKDQ24y0qlURiT
	 N86GGDRMnW5AEO+3RHaO2XaXOYxDA4ibfnVDmk9OplY/pQbkQdRWg0E13BTRhyo/Ey
	 E7GKyzybhjWoin88WA6LDL8n39i41+9gmBImeMju6zTBmw38Z6z8mKdPpWm1Cai1Dh
	 tLR7TBInqGjbW6nemQL6B37MrpxV1aa2e6/jocEVz4mmQME8ahbk6OREfwpjeHQwqx
	 7OGusmZWog/eiFdepXGySC4Gi90Xc7Qb6ZzLMm5U/Vj7pI5DjSk+10zDXroo9bbYdH
	 4E1uvU+UVBQNg==
From: Mark Brown <broonie@kernel.org>
To: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
 conor+dt@kernel.org, nicolas.ferre@microchip.com, 
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, 
 mturquette@baylibre.com, sboyd@kernel.org, herbert@gondor.apana.org.au, 
 davem@davemloft.net, andi.shyti@kernel.org, tglx@linutronix.de, 
 tudor.ambarus@linaro.org, miquel.raynal@bootlin.com, richard@nod.at, 
 vigneshr@ti.com, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
 linus.walleij@linaro.org, sre@kernel.org, u.kleine-koenig@pengutronix.de, 
 p.zabel@pengutronix.de, olivia@selenic.com, radu_nicolae.pirea@upb.ro, 
 richard.genoud@gmail.com, gregkh@linuxfoundation.org, jirislaby@kernel.org, 
 lgirdwood@gmail.com, wim@linux-watchdog.org, linux@roeck-us.net, 
 linux@armlinux.org.uk, andrei.simion@microchip.com, 
 mihai.sain@microchip.com, andre.przywara@arm.com, neil.armstrong@linaro.org, 
 tony@atomide.com, durai.manickamkr@microchip.com, geert+renesas@glider.be, 
 arnd@arndb.de, Jason@zx2c4.com, rdunlap@infradead.org, rientjes@google.com, 
 vbabka@suse.cz, mripard@kernel.org, codrin.ciubotariu@microchip.com, 
 eugen.hristev@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org, 
 netdev@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-serial@vger.kernel.org, alsa-devel@alsa-project.org, 
 linux-sound@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Varshini Rajendran <varshini.rajendran@microchip.com>
In-Reply-To: <20240223171342.669133-1-varshini.rajendran@microchip.com>
References: <20240223171342.669133-1-varshini.rajendran@microchip.com>
Subject: Re: (subset) [PATCH v4 00/39] Add support for sam9x7 SoC family
Message-Id: <170873753899.4074329.1874365978346259745.b4-ty@kernel.org>
Date: Sat, 24 Feb 2024 01:18:58 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-0438c

On Fri, 23 Feb 2024 22:43:42 +0530, Varshini Rajendran wrote:
> This patch series adds support for the new SoC family - sam9x7.
>  - The device tree, configs and drivers are added
>  - Clock driver for sam9x7 is added
>  - Support for basic peripherals is added
>  - Target board SAM9X75 Curiosity is added
> 
>  Changes in v4:
>  --------------
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[13/39] ASoC: dt-bindings: atmel-classd: add sam9x7 compatible
        commit: 89f3180d5915d4ea40e044ee102cd5c1ec81e7ef
[17/39] ASoC: dt-bindings: microchip: add sam9x7
        commit: c06a7a8e885753a024163bbb0dfd7349e8054643

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


