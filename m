Return-Path: <linux-i2c+bounces-6093-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B00FF96AD0B
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2024 01:47:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E33741C243AB
	for <lists+linux-i2c@lfdr.de>; Tue,  3 Sep 2024 23:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E6A1D7985;
	Tue,  3 Sep 2024 23:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SlGVn1gk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F9951EBFFA;
	Tue,  3 Sep 2024 23:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725407233; cv=none; b=HVKZwr10lFcJ9S+8cBx84XVAS567S5lEgoJM8RedP4wmEvWQSLwtgx04tyxhLIcWy4VG6427jkvPr6Z1bITXasunSYAEDzuCP5QSnqiIA66uvvWQdCM+9ZrOwDsimrdOwHrJ8LZLooFCKJ7+8xaiQgtBoeMn6yqktMOutc12QH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725407233; c=relaxed/simple;
	bh=syaECrjJE2kWIzyuFy7TOxjEg6HYnVTBHVpPWpttYog=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XZMfdo78Of2wLAzrs9a72/9TosrYOf1pNWdZWK4wF4E/MDFXuh1QAS38EhWRfK7IN8tGL/c3x3RK1nvAmVZctm7IZeMtRbKR9JLkZ9x4yd5iwBdmLcDseojr6aDsJFLtfNjM/lfIDDavnaccA5YFSH0km09as/afo6drds6xQsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SlGVn1gk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 859A5C4CEC4;
	Tue,  3 Sep 2024 23:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725407233;
	bh=syaECrjJE2kWIzyuFy7TOxjEg6HYnVTBHVpPWpttYog=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=SlGVn1gk0SxFfz9vigWKHLcKXUV+23WJ7CIDd+c5uNzmpaf/aZYK6uOZS1RQPZ/tN
	 hQAVvb7MUldFyVb+I8H/aVa0F0p/oXV57TJMzSkPiXPhNsHT0VyDv7Fq2vOzlwo8sv
	 HgQqYW2QhnGvPTTSKpFWy0CzYUO4QYjBdp7CIlttpKI+eGcmKCH/HzGZl2JFbrvw4/
	 z6kd40ug/0TAokbkgyjxRGpHmB8AZaQdNHCB9WRH4Pqf+dS8ltl2Nt1Bw0ASUMYh6d
	 AczG4sJoKR9q/H1wnI3Po2kKgG9E0V/iaqkfydnJsBTHWSdVcfyvOyVeVhqXY6QOwp
	 vK/zpfWFdlylA==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Chris Morgan <macromorgan@hotmail.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Tim Lunn <tim@feathertop.org>, 
 Andy Yan <andyshrk@163.com>, Muhammed Efe Cetin <efectn@protonmail.com>, 
 Jagan Teki <jagan@edgeble.ai>, Dragan Simic <dsimic@manjaro.org>, 
 Ondrej Jirman <megi@xff.cz>, Michael Riesch <michael.riesch@wolfvision.net>, 
 Jimmy Hon <honyuenkwun@gmail.com>, Elon Zhang <zhangzj@rock-chips.com>, 
 Alexey Charkov <alchark@gmail.com>, Elaine Zhang <zhangqing@rock-chips.com>, 
 Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, Liang Chen <cl@rock-chips.com>, 
 Jamie Iles <jamie@jamieiles.com>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-watchdog@vger.kernel.org, kernel@collabora.com
In-Reply-To: <20240903152308.13565-1-detlev.casanova@collabora.com>
References: <20240903152308.13565-1-detlev.casanova@collabora.com>
Subject: Re: (subset) [PATCH v4 0/9] Add device tree for ArmSoM Sige 5
 board
Message-Id: <172540722527.175332.15576202732090473513.b4-ty@kernel.org>
Date: Wed, 04 Sep 2024 00:47:05 +0100
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-99b12

On Tue, 03 Sep 2024 11:22:30 -0400, Detlev Casanova wrote:
> Add the rk3576-armsom-sige5 device tree as well as its rk3576.dtsi base
> and pinctrl information in rk3576-pinctrl.dtsi.
> 
> The other commits add DT bindings documentation for the devices that
> already work with the current corresponding drivers.
> 
> Note that as is, the rockchip gpio driver needs the gpio nodes
> to be children of the pinctrl node, even though this is deprecated.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/spi.git for-next

Thanks!

[7/9] spi: dt-bindings: Add rockchip,rk3576-spi compatible
      commit: b0cdf9cc089525da330919d1bcd3b92655aaa621

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


