Return-Path: <linux-i2c+bounces-8739-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 889A59FD16F
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 08:39:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E1F63A0633
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 07:39:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC8814A62A;
	Fri, 27 Dec 2024 07:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aTuE13RY"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37781474A7;
	Fri, 27 Dec 2024 07:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735285136; cv=none; b=DCKxCx0RTFPYUF7PQk1TXhRFgLfE63TmGGWWd/zu+vvYnl9moU06xP1TcEgsvtPytS3cqvt5FDkqviPvQlYkxM782t9kqK072cSfpYyQvlTvTkFWzXgZvBd8Z8vtc6B+SKpOgn147726k6f9ouCO3Ukd4066QqM5fRF33OjrH3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735285136; c=relaxed/simple;
	bh=Wf+SvqNi6slsfwtp9CR+b3C0cjM1BKcBVm093pQ2syc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pRrxx5VDFIoJzyeI7JA/eqOOdRGnFP4Fx24UF9/GEWn6uMRrVkU1RtSCgO7Btb/E69kTlCVdD5thKswR53WAj810f1glIgzLvQeYUERE49JMpipzEGIcWSXGHqj2QX67wM7t6LbuQ3ITH4wbN/5jBjScwJU0n1RSSAb9Q+q61RA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aTuE13RY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E6D2C4CED3;
	Fri, 27 Dec 2024 07:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735285136;
	bh=Wf+SvqNi6slsfwtp9CR+b3C0cjM1BKcBVm093pQ2syc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aTuE13RYXpFbp4ATHOcud1qoWz6gazgLh6G7+g6K+m+MYZPlTmlVRioMn0km9mkEE
	 nnTTjnBXZJevN4SHX8nPschH5OjNfKocnRCSFM9T8KfGnWGkIXoZljNeczyVXhfrx1
	 4BNhx+ANKF+gAznsdRteWmHrJJHiGVK6UDkVMsbK3RCzUiOLDiC6akwNed3GJjIbe/
	 0ik79J2Z8Ye9WlYsQNJfZ0hF9PF84uZjnNMtpTuI4RgbKUM0h6TZ6SgiULSqNfU7tX
	 IS5ZupcP/HvUDTuTG6HDZbZoFJSnMfh91qi+HIUmZhi6NOdjhwR245l5M6wLVCG3nM
	 iZrIdyQYy8NzQ==
Date: Fri, 27 Dec 2024 08:38:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	Simon Xue <xxm@rock-chips.com>, Guenter Roeck <linux@roeck-us.net>, 
	Mark Brown <broonie@kernel.org>, Chris Morgan <macromorgan@hotmail.com>, 
	Frank Wang <frank.wang@rock-chips.com>, Jamie Iles <jamie@jamieiles.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, 
	Johan Jonker <jbx6244@gmail.com>, David Airlie <airlied@gmail.com>, 
	dri-devel@lists.freedesktop.org, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	linux-i2c@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>, 
	Simona Vetter <simona@ffwll.ch>, Elaine Zhang <zhangqing@rock-chips.com>, 
	Conor Dooley <conor+dt@kernel.org>, Finley Xiao <finley.xiao@rock-chips.com>, 
	Maxime Ripard <mripard@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	FUKAUMI Naoki <naoki@radxa.com>, linux-pwm@vger.kernel.org, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andy Yan <andyshrk@163.com>, linux-serial@vger.kernel.org, 
	Michael Riesch <michael.riesch@wolfvision.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, devicetree@vger.kernel.org, 
	Diederik de Haas <didi.debian@cknow.org>, linux-watchdog@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Lee Jones <lee@kernel.org>, Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Shresth Prasad <shresthprasad7@gmail.com>, 
	Tim Lunn <tim@feathertop.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, linux-arm-kernel@lists.infradead.org, 
	Ulf Hansson <ulf.hansson@linaro.org>, Jisheng Zhang <jszhang@kernel.org>, 
	Dragan Simic <dsimic@manjaro.org>, Detlev Casanova <detlev.casanova@collabora.com>, 
	linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-usb@vger.kernel.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: Re: [PATCH v2 00/17] rockchip: Add rk3562 support
Message-ID: <sasnc2ocxnlfp4kprsobu5gkajjb5wdxhld73bg6xocgb3foah@yjmphtvpmyff>
References: <20241224094920.3821861-1-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241224094920.3821861-1-kever.yang@rock-chips.com>

On Tue, Dec 24, 2024 at 05:49:03PM +0800, Kever Yang wrote:
> 
> This patch set adds rk3562 SoC and its evb support.
> 
> Split out patches belong to different subsystem.
> 
> Test with GMAC, USB, PCIe, EMMC, SD Card.
> 
> This patch set is base on the patche set for rk3576 evb1 support.
> 
> Changes in v2:
> - Update in sort order
> - remove grf in cru
> - Update some properties order
> 
> Finley Xiao (2):
>   arm64: dts: rockchip: add core dtsi for RK3562 Soc
>   arm64: dts: rockchip: Add RK3562 evb2 devicetree
> 
> Kever Yang (15):
>   dt-bindings: PCI: dwc: rockchip: Add rk3562 support
>   dt-bindings: mmc: Add support for rk3562 eMMC
>   dt-bindings: mmc: rockchip-dw-mshc: Add rk3562 compatible string
>   dt-bindings: power: rockchip: Add bindings for rk3562
>   dt-bindings: i2c: i2c-rk3x: Add rk3562 compatible
>   dt-bindings: gpu: Add rockchip,rk3562-mali compatible
>   dt-bindings: watchdog: Add rk3562 compatible
>   dt-bindings: spi: Add rockchip,rk3562-spi compatible
>   dt-bindings: serial: snps-dw-apb-uart: Add support for rk3562
>   dt-bindings: usb: dwc3: add compatible for rk3562
>   dt-bindings: pwm: rockchip: Add rockchip,rk3562-pwm
>   dt-bindings: rockchip: pmu: Add rk3562 compatible
>   dt-bindings: soc: rockchip: Add rk3562 syscon compatibles
>   dt-bindings: arm: rockchip: Add rk3562 evb2 board
>   dt-bindings: mfd: syscon: Add rk3562 QoS register compatible

You squezzed here like 12 different subsystems. Some of these changes
suggest missing drivers.

Please read basic upstreaming guide, some previous discussions and get
internal rock-chips help so we want repeat basics over and over.

Bindings are with drivers. Send them to respective subsystems.

Best regards,
Krzysztof


