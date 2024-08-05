Return-Path: <linux-i2c+bounces-5147-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B318947D7A
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Aug 2024 17:01:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1205F1F21DEE
	for <lists+linux-i2c@lfdr.de>; Mon,  5 Aug 2024 15:01:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A914156F4A;
	Mon,  5 Aug 2024 15:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aUNOAheP"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EDA15532E;
	Mon,  5 Aug 2024 15:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722870016; cv=none; b=I7Aw2V2ShFFcMERYANRRkMaZn4CRzCZ7DZz6cQRyS5wHAHouBTooejplonI4NRD6PAuZfcV0pAeimX3+6ciG5eUC5j/+F8s3OM5oDZ1G15DJCaEYZjd91aRod80pjoeKySJbmPMr0FmXObx8Ky9xfUKfluYcDXD6KP/+eW2XOLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722870016; c=relaxed/simple;
	bh=jIaq6vsuhkY+v59gy2RIN65uUrzZIQmOWCABGta2eFA=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=ucChEA2FvUJ89HSq8vF1VkyB/Aoe5fkDoIKniElwO6XTZ+2ZthC3L8StHmi2ZNcpxa0I/Jwt+EU6UOpCd1mZ+oroHacV0yT3qOB8hh1f0cIgHveMRIXcym7aUX3aoT0IFeYSmHYMZndV+RPCQlgEsoVKMGm/71hAsEvNdv/903c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aUNOAheP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 510FBC4AF1B;
	Mon,  5 Aug 2024 15:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722870015;
	bh=jIaq6vsuhkY+v59gy2RIN65uUrzZIQmOWCABGta2eFA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=aUNOAhePbdYRdnQ4NLgBWizO6a2ufDlEftJTpPcnoXscyuQVgQ1SgiTStmZk64xfF
	 knuG0ypn8Yq6ZrBAA+typSGh76Mx6BryZLQrhkVTqlCwOjXqLGVc+mFSytCRKx1Stb
	 Y2edYu22uNU3rbJ3dschCb+Qcu3VWLp6spk/S53ER/y9mEk8q6Cc8E+5r53kvMZss3
	 Kb7+uZSuGJzsZhK3icLmDg6gkWMZJVUScy4nyYXmpL8toq86aVoSRc4jNBfoAQLwwh
	 9kuup35jodzPQrbI2h3JvLChLYj14yirHAyjyNtvx4n8BgRo2DjUtfjMn8K/vUtvhF
	 LoqdP6PrIuj9Q==
Date: Mon, 05 Aug 2024 09:00:14 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: Elaine Zhang <zhangqing@rock-chips.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Ondrej Jirman <megi@xff.cz>, 
 Chris Morgan <macromorgan@hotmail.com>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, linux-i2c@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
 Jagan Teki <jagan@edgeble.ai>, linux-iio@vger.kernel.org, 
 Liang Chen <cl@rock-chips.com>, Thomas Gleixner <tglx@linutronix.de>, 
 linux-serial@vger.kernel.org, Finley Xiao <finley.xiao@rock-chips.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Jimmy Hon <honyuenkwun@gmail.com>, devicetree@vger.kernel.org, 
 Muhammed Efe Cetin <efectn@protonmail.com>, 
 Shresth Prasad <shresthprasad7@gmail.com>, 
 Weizhao Ouyang <weizhao.ouyang@arm.com>, Alexey Charkov <alchark@gmail.com>, 
 Tim Lunn <tim@feathertop.org>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-rockchip@lists.infradead.org, kernel@collabora.com, 
 Lars-Peter Clausen <lars@metafoo.de>, linux-kernel@vger.kernel.org, 
 Jonas Karlman <jonas@kwiboo.se>, Dragan Simic <dsimic@manjaro.org>, 
 Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
 Jonathan Cameron <jic23@kernel.org>, Andy Yan <andyshrk@163.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
In-Reply-To: <20240802214612.434179-1-detlev.casanova@collabora.com>
References: <20240802214612.434179-1-detlev.casanova@collabora.com>
Message-Id: <172286966767.2709106.17051987571770592906.robh@kernel.org>
Subject: Re: [PATCH 00/10] Add device tree for ArmSoM Sige 5 board


On Fri, 02 Aug 2024 17:45:27 -0400, Detlev Casanova wrote:
> Add the rk3576-armsom-sige5 device tree as well as its rk3576.dtsi base
> and pinctrl information in rk3576-pinctrl.dtsi.
> 
> The other commits add DT bindings documentation for the devices that
> already work with the current corresponding drivers.
> 
> The other bindings and driver implementations are in other patch sets:
> - PMIC: https://lore.kernel.org/lkml/20240802134736.283851-1-detlev.casanova@collabora.com/
> - CRU: https://lore.kernel.org/lkml/20240802214053.433493-1-detlev.casanova@collabora.com/
> - PINCTRL: https://lore.kernel.org/lkml/20240802145458.291890-1-detlev.casanova@collabora.com/
> - PM DOMAIN: https://lore.kernel.org/lkml/20240802151647.294307-1-detlev.casanova@collabora.com/
> - DW-MMC: https://lore.kernel.org/lkml/20240802153609.296197-1-detlev.casanova@collabora.com/
> - GMAC: https://lore.kernel.org/lkml/20240802173918.301668-1-detlev.casanova@collabora.com/
> 
> Detlev Casanova (10):
>   dt-bindings: arm: rockchip: Add ArmSoM Sige 5
>   dt-bindings: arm: rockchip: Add rk576 compatible string to pmu.yaml
>   dt-bindings: i2c: i2c-rk3x: Add rk3576 compatible
>   dt-bindings: iio: adc: Add rockchip,rk3576-saradc string
>   dt-bindings: mfd: syscon: Add rk3576 QoS register compatible
>   dt-bindings: serial: snps-dw-apb-uart: Add Rockchip RK3576
>   dt-bindings: soc: rockchip: Add rk3576 syscon compatibles
>   dt-bindings: timer: rockchip: Add rk3576 compatible
>   arm64: dts: rockchip: Add rk3576 SoC base DT
>   arm64: dts: rockchip: Add rk3576-armsom-sige5 board
> 
>  .../devicetree/bindings/arm/rockchip.yaml     |    5 +
>  .../devicetree/bindings/arm/rockchip/pmu.yaml |    2 +
>  .../devicetree/bindings/i2c/i2c-rk3x.yaml     |    1 +
>  .../bindings/iio/adc/rockchip-saradc.yaml     |    3 +
>  .../devicetree/bindings/mfd/syscon.yaml       |    2 +
>  .../bindings/serial/snps-dw-apb-uart.yaml     |    1 +
>  .../devicetree/bindings/soc/rockchip/grf.yaml |   16 +
>  .../bindings/timer/rockchip,rk-timer.yaml     |    1 +
>  arch/arm64/boot/dts/rockchip/Makefile         |    1 +
>  .../boot/dts/rockchip/rk3576-armsom-sige5.dts |  613 ++
>  .../boot/dts/rockchip/rk3576-pinctrl.dtsi     | 5775 +++++++++++++++++
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 1635 +++++
>  12 files changed, 8055 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3576.dtsi
> 
> --
> 2.46.0
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y rockchip/rk3576-armsom-sige5.dtb' for 20240802214612.434179-1-detlev.casanova@collabora.com:

In file included from arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts:14:
arch/arm64/boot/dts/rockchip/rk3576.dtsi:6:10: fatal error: dt-bindings/clock/rockchip,rk3576-cru.h: No such file or directory
    6 | #include <dt-bindings/clock/rockchip,rk3576-cru.h>
      |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[3]: *** [scripts/Makefile.lib:434: arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb] Error 1
make[2]: *** [scripts/Makefile.build:485: arch/arm64/boot/dts/rockchip] Error 2
make[2]: Target 'arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dtb' not remade because of errors.
make[1]: *** [/home/rob/proj/linux-dt-testing/Makefile:1389: rockchip/rk3576-armsom-sige5.dtb] Error 2
make: *** [Makefile:224: __sub-make] Error 2
make: Target 'rockchip/rk3576-armsom-sige5.dtb' not remade because of errors.






