Return-Path: <linux-i2c+bounces-14919-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 22503CF84FA
	for <lists+linux-i2c@lfdr.de>; Tue, 06 Jan 2026 13:25:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7DF18308DBF0
	for <lists+linux-i2c@lfdr.de>; Tue,  6 Jan 2026 12:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F3342F1FEA;
	Tue,  6 Jan 2026 12:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XxIX/Uc6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7714C81;
	Tue,  6 Jan 2026 12:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767702099; cv=none; b=qG+lXnY7dRA9httSw2891+hwsOtmLJJv6ifDvPL9hoYgVyvUfSOlSbj3qXFGLYap7GbdD+1/Z/maZOvngXa9nQybzvrkM3quQtDERY+MrI3B1RYQy/OFI1MXw7xMGT4cghfJciyxeIVELvBlv8xH2G4yKBINn/WRo4DgxTjOc28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767702099; c=relaxed/simple;
	bh=zKoDQhppgeJZ9g12tU8EVyMA0qPWRL9mN42OuCpgg2o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=iVPXsc+CJoh9r+1NjpphV0KlTEQGJzUwPngwxqBR61OaMDRZsjAiad9U9qNePaL3pA1tYGPpkAitUr221YDv4vC+GQt8a5yf3J7GAbkplLx3+QLtHYItSTfKrog86wRFUQFLT/5SPmukJRbPUNy9q3y6G5WKC8Lp3GqC1nHcMnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XxIX/Uc6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67B30C116C6;
	Tue,  6 Jan 2026 12:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767702099;
	bh=zKoDQhppgeJZ9g12tU8EVyMA0qPWRL9mN42OuCpgg2o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=XxIX/Uc67pW2srZGfx7L0M+e9v4WJplWlh+0kQ17cQgE3TXo+brUPnDmZLyRtoSUt
	 NS+uIwMPQZ70cpM6y22JW6jE/dRqSDBuoaKh3TDd4eQ4IT4Jx15VdWTziP2iWd7hyT
	 8OX2eLY4it+aWALZe6uARyvIyLy21rDK0Ye78wOqq/EzQrYHKYcMeEdEu4Z4w+nezL
	 tzp4dBFmmOQZQbNRn7ffWbWe0RozvMjSW0zRQdrMreHOK30MtxQyiBnLFJ206BIfbe
	 8CnAyOGc9R4FmPtyuFsNwRGbSDB0oM4sgN4C+vBUFcob0xOC+hjUtYbCLlYNR7KL28
	 4JA9Jx+fmQb/A==
From: Mark Brown <broonie@kernel.org>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
 claudiu.beznea@tuxon.dev, herbert@gondor.apana.org.au, davem@davemloft.net, 
 vkoul@kernel.org, andi.shyti@kernel.org, lee@kernel.org, 
 andrew+netdev@lunn.ch, edumazet@google.com, kuba@kernel.org, 
 pabeni@redhat.com, linusw@kernel.org, Steen.Hegelund@microchip.com, 
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com, 
 olivia@selenic.com, radu_nicolae.pirea@upb.ro, richard.genoud@bootlin.com, 
 gregkh@linuxfoundation.org, jirislaby@kernel.org, 
 lars.povlsen@microchip.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org, 
 linux-i2c@vger.kernel.org, netdev@vger.kernel.org, 
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-usb@vger.kernel.org, 
 Robert Marko <robert.marko@sartura.hr>
Cc: luka.perkov@sartura.hr
In-Reply-To: <20251229184004.571837-1-robert.marko@sartura.hr>
References: <20251229184004.571837-1-robert.marko@sartura.hr>
Subject: Re: (subset) [PATCH v4 00/15] Add support for Microchip LAN969x
Message-Id: <176770209215.32810.211066871008391751.b4-ty@kernel.org>
Date: Tue, 06 Jan 2026 12:21:32 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Mon, 29 Dec 2025 19:37:41 +0100, Robert Marko wrote:
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

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[04/15] dt-bindings: spi: at91: add microchip,lan9691-spi
        commit: 96d337436fe0921177a6090aeb5bb214753654fc

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


