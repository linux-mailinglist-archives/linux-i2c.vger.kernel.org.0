Return-Path: <linux-i2c+bounces-14894-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EADCF13AD
	for <lists+linux-i2c@lfdr.de>; Sun, 04 Jan 2026 19:56:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E7A493010A80
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Jan 2026 18:55:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6505313E27;
	Sun,  4 Jan 2026 18:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IC7pSnzE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBCE23AB90;
	Sun,  4 Jan 2026 18:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767552955; cv=none; b=GuFsJaMsGb0giLUpW9LWxb/MAH0a1E8vj2DUUwVsaEQ04+e92REqndyHMr8VRet1cn3enEB3j9g/OALU6p4xafkzZyQNYMWh9+2agMdBvFZoU2vfIaPIurKv36yQOZc9AWHLRd8SicGqxMMhsTMN/N5TvmW5bBdaLtzM9Krzmug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767552955; c=relaxed/simple;
	bh=FsmYT4J2wneLygt9k8P00NIpU5dia1i3KeDHzRjOSyc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=lgfvFDzKAZwDcGA6St5eX6bKOdP+MVwaHH4l/sOU1c4j+lYovfr10IAm2fBzlfSJXDGj4skFvmbO4ms/jifC/r8K2IUywDv9rYz89ombyIprPL4YUOeHm6TQClcHYvriVUY//tBoqPy8FCTcXiKFi935b24K72bUvr5NPGslHYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IC7pSnzE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F5FC4CEF7;
	Sun,  4 Jan 2026 18:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767552955;
	bh=FsmYT4J2wneLygt9k8P00NIpU5dia1i3KeDHzRjOSyc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=IC7pSnzEclHGwg200X/YkdBBynq7odRScUs9ppZoZpZ5+vCC75MulNZG9xoNbQ7ea
	 YHl+gfz24aU8DAk/01qqCzHWqgE5huqcVehQ7bOvjuf1C9PfOOiVV+8sKjo5PD0Ux8
	 gufnEXHEZAj84Zw7OxxJ8epEP1/fFxR6HWqDntc0r/AZVBg5anq5l1wosBra4diGjh
	 HemjiMkiYw9l4FXiTGEZzICBstLP/oFQ2Kp80I2pGwGdvs9cEXvi/gXm+jLpkn5ydQ
	 PaFF0rRXFM7FglqmFWK1tATHw28PJZH5oZFT/U/eEwxFbtqt5UsOaoH8qU0JuS60fs
	 dMLakUjvihl3Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3BC38380AA4F;
	Sun,  4 Jan 2026 18:52:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v4 00/15] Add support for Microchip LAN969x
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <176755275401.146974.3696343941489230641.git-patchwork-notify@kernel.org>
Date: Sun, 04 Jan 2026 18:52:34 +0000
References: <20251229184004.571837-1-robert.marko@sartura.hr>
In-Reply-To: <20251229184004.571837-1-robert.marko@sartura.hr>
To: Robert Marko <robert.marko@sartura.hr>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 claudiu.beznea@tuxon.dev, herbert@gondor.apana.org.au, davem@davemloft.net,
 vkoul@kernel.org, andi.shyti@kernel.org, lee@kernel.org,
 andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, linusw@kernel.org, Steen.Hegelund@microchip.com,
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com,
 olivia@selenic.com, radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, broonie@kernel.org,
 lars.povlsen@microchip.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-i2c@vger.kernel.org, netdev@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org,
 luka.perkov@sartura.hr

Hello:

This series was applied to netdev/net-next.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 29 Dec 2025 19:37:41 +0100 you wrote:
> This series adds support for the Microchip LAN969x switch SoC family.
> 
> Series is a bit long since after discussions in previous versions, it was
> recommended[1][2] to add SoC specific compatibles for device nodes so it
> includes the required bindings updates.
> 
> [1] https://lore.kernel.org/all/20251203-splendor-cubbyhole-eda2d6982b46@spud/
> [2] https://lore.kernel.org/all/173412c8-c2fb-4c38-8de7-5b1c2eebdbf9@microchip.com/
> [3] https://lore.kernel.org/all/20251203-duly-leotard-86b83bd840c6@spud/
> [4] https://lore.kernel.org/all/756ead5d-8c9b-480d-8ae5-71667575ab7c@kernel.org/
> 
> [...]

Here is the summary with links:
  - [v4,01/15] dt-bindings: usb: Add Microchip LAN969x support
    (no matching commit)
  - [v4,02/15] dt-bindings: mfd: atmel,sama5d2-flexcom: add microchip,lan9691-flexcom
    (no matching commit)
  - [v4,03/15] dt-bindings: serial: atmel,at91-usart: add microchip,lan9691-usart
    (no matching commit)
  - [v4,04/15] dt-bindings: spi: at91: add microchip,lan9691-spi
    (no matching commit)
  - [v4,05/15] dt-bindings: i2c: atmel,at91sam: add microchip,lan9691-i2c
    (no matching commit)
  - [v4,06/15] dt-bindings: rng: atmel,at91-trng: add microchip,lan9691-trng
    (no matching commit)
  - [v4,07/15] dt-bindings: crypto: atmel,at91sam9g46-aes: add microchip,lan9691-aes
    (no matching commit)
  - [v4,08/15] dt-bindings: crypto: atmel,at91sam9g46-sha: add microchip,lan9691-sha
    (no matching commit)
  - [v4,09/15] dt-bindings: dma: atmel: add microchip,lan9691-dma
    (no matching commit)
  - [v4,10/15] dt-bindings: net: mscc-miim: add microchip,lan9691-miim
    https://git.kernel.org/netdev/net-next/c/c303e8b86d9d
  - [v4,11/15] dt-bindings: pinctrl: pinctrl-microchip-sgpio: add LAN969x
    (no matching commit)
  - [v4,12/15] arm64: dts: microchip: add LAN969x clock header file
    (no matching commit)
  - [v4,13/15] arm64: dts: microchip: add LAN969x support
    (no matching commit)
  - [v4,14/15] dt-bindings: arm: AT91: document EV23X71A board
    (no matching commit)
  - [v4,15/15] arm64: dts: microchip: add EV23X71A board
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



