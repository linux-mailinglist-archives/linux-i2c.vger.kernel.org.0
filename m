Return-Path: <linux-i2c+bounces-2050-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE6A86B3D2
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Feb 2024 16:54:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4250D1F2D7E7
	for <lists+linux-i2c@lfdr.de>; Wed, 28 Feb 2024 15:54:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E1D215D5D0;
	Wed, 28 Feb 2024 15:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fH/VpNsC"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDCE615CD6E;
	Wed, 28 Feb 2024 15:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709135630; cv=none; b=Rc0iRWJ8YCDxdaHLxX9hgYK8K709KlFkfOAISTfaQjH7oN0+j8Ij4fEv1EilEi6MSwi4eAwJTo7vzhjbjwYAn5/h2Z9unKzPvj8adcZHinh4IYDYY5ItE9k3IfBE6lPv5WCfIYGIvsaoZWw0fzwfPXH1SqQepR4YS1/KJpNy6T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709135630; c=relaxed/simple;
	bh=vxRLRVprDDB/c/3M41BNMbhxG1UwYXmCdbjUbmB3KKE=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=N9Wr/wmzXUbn8xDF9Uds8NtC7iTGnjmBuOuTOtXQX0ugoeRjV7PBjhdjyNXpsuLa91uqToBkLDkAqehOi2OFTWKgSPvRZ2mtn/PRVqb4oU54k7tLY/DgghAzgw0VwOZFXs+MSs489mwhE8zxum4BwtJzHm4oo/Q3KyVWaaGHA7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fH/VpNsC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C4CC433F1;
	Wed, 28 Feb 2024 15:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709135629;
	bh=vxRLRVprDDB/c/3M41BNMbhxG1UwYXmCdbjUbmB3KKE=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=fH/VpNsCC6yrehn5cwmf2mjsgU1Ga7kLFvddPlrtSi5Jr4CqpQYnnimGO6HSWNh3O
	 P1sksEi+taf0EXpKgvTWOTnRbkQja9l+bSOOMPcaOGxOgSq88KAUk6A8OE94ZgekUk
	 PKdQLGs/2dsH+cPT3ecRVpohSJXMsiWDkMudBu1wj0oL9BuvtO87S4FKrMnmaXAGxp
	 SG4Uzyv1B5O67FmVmHVGx4IRrSCy5EQ9LvQB1aqs1ZQfSHMSBrY3mVj+nFOJNScIHn
	 h/H6FZUVqL4iXcGgFr9D757QehRG1OTvDYME//d5Zi8AqSrdF6Nofkun3/EW0W2f+w
	 hJcYB3olR0OOg==
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
Message-Id: <170913561744.333382.15677696645878162142.b4-ty@kernel.org>
Date: Wed, 28 Feb 2024 15:53:37 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-a684c

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

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[16/39] spi: dt-bindings: atmel,at91rm9200-spi: remove 9x60 compatible from list
        commit: 666db8fd4265f938795004838d2a9335ce7b9da1

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


