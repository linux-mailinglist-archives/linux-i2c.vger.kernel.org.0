Return-Path: <linux-i2c+bounces-9625-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93665A47FEF
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 14:51:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85D503B69BA
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Feb 2025 13:48:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63937231C87;
	Thu, 27 Feb 2025 13:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u7PEQG2j"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8D723024D;
	Thu, 27 Feb 2025 13:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740664104; cv=none; b=GVzhsVCbEhYvgPMYTvvYKfqfNQbeJM9gXcG7l12ePwjm32M2ryDtyzMX4Y5zK8fo4nhzeL3RUrKPrisc4kNPdxQOYVB18bbg0PYCFcDaLzBi/8UPT3Q0Go1TLFfgL5J+fuaKMzU6J+M5yOevhwl50voAigF+SRpy9H8zXlTo2rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740664104; c=relaxed/simple;
	bh=+0o56Rl9c9XlxO66ciG8cF7751qtwRokbDOXu3oKKI4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FMFKyocHrZSA/TlKZnIb1X6A/TMi9N72lH4SDCKr0X1bCQ9bRXaqP+vqJFFSNOgakaqqzfJtpSNC4vXHeX+UMliVpgXdUTTIMcG9/x89fjLp8Yuz1BAaN5Q78qwrfrWim6cKeGuXMIAaAJ3N7uclDuMSaxvK+lNQ0x/WI3dUwzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u7PEQG2j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E80BC4CEDD;
	Thu, 27 Feb 2025 13:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740664103;
	bh=+0o56Rl9c9XlxO66ciG8cF7751qtwRokbDOXu3oKKI4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=u7PEQG2j83U1EUgccAsv7ZZeyzoXGP5E3eyEnhw4NoElI1P1PQduAFpk3Aw26XQga
	 MU1FsSM2xWeVk3888IvozG2rU0czOy6ksHQKL+ms88vEKd69Oz3Wn/JfI5RXTFTwNk
	 wfGNc/kEM3DNOFtXZ34ZRYeTDGKQ9rq2QA/8JJ070MZrbICKSyOueWiZTR8CewZk/4
	 YNa2OgN5lkcQjeMyprtE571tUFUuQFiRLywSCD55mJu1bl6w3MNEN7o1f2vw9759LK
	 TWM2LHQPLAcDuMVzwA6GP/6GMrZpDf8H3uZGfG3Gq2L3gj60l5E8fYaRb6MO8wqJWV
	 z16TlfgV2NvRQ==
From: Mark Brown <broonie@kernel.org>
To: heiko@sntech.de, Kever Yang <kever.yang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, Simon Xue <xxm@rock-chips.com>, 
 Guenter Roeck <linux@roeck-us.net>, linux-usb@vger.kernel.org, 
 Chris Morgan <macromorgan@hotmail.com>, 
 Frank Wang <frank.wang@rock-chips.com>, Jamie Iles <jamie@jamieiles.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
 Jonas Karlman <jonas@kwiboo.se>, Johan Jonker <jbx6244@gmail.com>, 
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org, 
 linux-i2c@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>, 
 Simona Vetter <simona@ffwll.ch>, Elaine Zhang <zhangqing@rock-chips.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 FUKAUMI Naoki <naoki@radxa.com>, linux-pwm@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-serial@vger.kernel.org, 
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ulf.hansson@linaro.org, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Detlev Casanova <detlev.casanova@collabora.com>, 
 Andi Shyti <andi.shyti@kernel.org>, devicetree@vger.kernel.org, 
 Diederik de Haas <didi.debian@cknow.org>, linux-watchdog@vger.kernel.org, 
 Rob Herring <robh@kernel.org>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Shresth Prasad <shresthprasad7@gmail.com>, Tim Lunn <tim@feathertop.org>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 linux-arm-kernel@lists.infradead.org, Jisheng Zhang <jszhang@kernel.org>, 
 Dragan Simic <dsimic@manjaro.org>, linux-mmc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
In-Reply-To: <20250227111913.2344207-1-kever.yang@rock-chips.com>
References: <20250227111913.2344207-1-kever.yang@rock-chips.com>
Subject: Re: (subset) [PATCH v3 00/15] rockchip: Add rk3562 SoC and evb
 support
Message-Id: <174066409262.43847.18143301735398340521.b4-ty@kernel.org>
Date: Thu, 27 Feb 2025 13:48:12 +0000
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-1b0d6

On Thu, 27 Feb 2025 19:18:58 +0800, Kever Yang wrote:
> This patch set adds rk3562 SoC and its evb support.
> 
> I have split out patches need driver change for different subsystem.
> And all the modules with dt-binding document update in this patch set
> do not need any driver change. I put them together to make it clear we
> have a new SoC and board to use the new compatible. Please pick up the
> patch for your subsystem, or please let me know if the patch has to
> send separate.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[07/15] dt-bindings: spi: Add rk3562 support
        commit: 825687c1662c53ecda991adf0ecfd8dd3d864043

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


