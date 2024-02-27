Return-Path: <linux-i2c+bounces-2020-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABD78687BB
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 04:20:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F83AB26DB4
	for <lists+linux-i2c@lfdr.de>; Tue, 27 Feb 2024 03:20:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 136AB200D5;
	Tue, 27 Feb 2024 03:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GGZalQiN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82DE1B7E9;
	Tue, 27 Feb 2024 03:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709004031; cv=none; b=IxOTh+BGCwLXRjyeSUUJ+fwuC9FS+tvqptP0Z0GB66+ezn9s+klu1NofDh7doMEljRFM7pxAg7rb655uPrPDDKw5iQHFpq9E9pAUTYBRg8d5zsZGzlcmqMYhBzRG6YvGqIQmOvS+wXVGrN4ISPHCSi3eS1OtpWsTIvkrJ2J1rXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709004031; c=relaxed/simple;
	bh=aEWeFJ2eAgzcvr+OaHdaIiM7TBOw2JHpdO912FAxBrQ=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=HiDNt3fnVXuGP2LZk9qZX6eq0d0c0aHWyi4s/80M34OXbJbLQ0J+BReyCNw8eAKY9rCvr6VjJ7pN8M4WAekOtB54cMsOofMp24ivlAhmBNBf5UmI1QFYq+WU5u3l5DwZNV0a4VpiDqu6rL8hyOpmG68YqCbm5Pz0yNEydiltP6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GGZalQiN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 601C6C433F1;
	Tue, 27 Feb 2024 03:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709004030;
	bh=aEWeFJ2eAgzcvr+OaHdaIiM7TBOw2JHpdO912FAxBrQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=GGZalQiNOWNgvr31MEFJ81Scx/q8IuKaZAqiPFZE+SD8pSdQWwG3CioqZpDlRQUAD
	 jKvVifURv7BOpc25WdOU3fYy6BfTMtetonGpoamgfDO3hXxtvjNyuDx94vkioJxfvV
	 MubNjVgf5u85jr4mrAuCzosl1CeEkeDYgrDKshVma4vowdYyZfX9/uNolq5oS00HY6
	 VdQ/8vtg8n+7bDwLjb5y8Yg2i9Qutge32EjMjVf5A2q9l0zWeu9yL5HgzRZ4UWdsvX
	 1U/1FgMqGQhy/VrktEoQPhkUCFsQrCXfoN9l9KW3KzU1jxRXAX9mECe7VQa53IR0gn
	 sUUzlKI2AvVrA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3DB28D88FB2;
	Tue, 27 Feb 2024 03:20:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 00/39] Add support for sam9x7 SoC family
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <170900403024.25082.9031028983461362329.git-patchwork-notify@kernel.org>
Date: Tue, 27 Feb 2024 03:20:30 +0000
References: <20240223171342.669133-1-varshini.rajendran@microchip.com>
In-Reply-To: <20240223171342.669133-1-varshini.rajendran@microchip.com>
To: Varshini Rajendran <varshini.rajendran@microchip.com>
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 mturquette@baylibre.com, sboyd@kernel.org, herbert@gondor.apana.org.au,
 davem@davemloft.net, andi.shyti@kernel.org, tglx@linutronix.de,
 tudor.ambarus@linaro.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linus.walleij@linaro.org, sre@kernel.org, u.kleine-koenig@pengutronix.de,
 p.zabel@pengutronix.de, olivia@selenic.com, radu_nicolae.pirea@upb.ro,
 richard.genoud@gmail.com, gregkh@linuxfoundation.org, jirislaby@kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org, wim@linux-watchdog.org,
 linux@roeck-us.net, linux@armlinux.org.uk, andrei.simion@microchip.com,
 mihai.sain@microchip.com, andre.przywara@arm.com, neil.armstrong@linaro.org,
 tony@atomide.com, durai.manickamkr@microchip.com, geert+renesas@glider.be,
 arnd@arndb.de, Jason@zx2c4.com, rdunlap@infradead.org, rientjes@google.com,
 vbabka@suse.cz, mripard@kernel.org, codrin.ciubotariu@microchip.com,
 eugen.hristev@collabora.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-mtd@lists.infradead.org,
 netdev@vger.kernel.org, linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-watchdog@vger.kernel.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Fri, 23 Feb 2024 22:43:42 +0530 you wrote:
> This patch series adds support for the new SoC family - sam9x7.
>  - The device tree, configs and drivers are added
>  - Clock driver for sam9x7 is added
>  - Support for basic peripherals is added
>  - Target board SAM9X75 Curiosity is added
> 
>  Changes in v4:
> 
> [...]

Here is the summary with links:
  - [v4,01/39] dt-bindings: net: cdns,macb: add sam9x7 ethernet interface
    https://git.kernel.org/netdev/net-next/c/5c237967e632

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



