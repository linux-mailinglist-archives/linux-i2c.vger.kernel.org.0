Return-Path: <linux-i2c+bounces-5310-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B3FD694F154
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 17:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3EBC2B21FEC
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 15:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B68317E8EA;
	Mon, 12 Aug 2024 15:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AAIzYEwF"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CBA29CA;
	Mon, 12 Aug 2024 15:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723475374; cv=none; b=Wj6QmZGfCSkYDN1TSffD1dtS0NyaMW+NqwkqNvZxqH0485ovlxc9JgM2yFxU/tWKbi0K7/RneyPL0XUMRj6kfY9Uzi14RVZkTzgZQun2CWIylh1BnfA8geURhnpv3/0AyG8XFz39M+eNFhcf87e5i570lTT0VDY2+30nPKlJK98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723475374; c=relaxed/simple;
	bh=deWuRDJPCT5foWSV44HA7CYL8GYl7vdMf1Zpapv5XKo=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=rbGlj56bEHeKm+2PNyoqvxuDxrvUEk1OuCO5mHAVx6uPumvVOg+3Hlhnre7BYQzXreuds0dhe3ShOws9ZmTkbhd8gxY2PRqNsglP9x6oLHO0b1GHy/umrlP4uTXyoRZSo/B62ceCDGNwuc17zo7hr81MKHnnSh3ZYzwaqjkxUvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AAIzYEwF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DED03C32782;
	Mon, 12 Aug 2024 15:09:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723475374;
	bh=deWuRDJPCT5foWSV44HA7CYL8GYl7vdMf1Zpapv5XKo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=AAIzYEwFnviJyUy/yD9Tw3CxmOF45cdw3/aF/vhW8GEyHCcIZBPuhVpzhJXB2Vsta
	 9XbecjNGYw8q5pyqkdiR3ucGZ0wUSLmQLR69dC+IMBMIaJHxFWOFaSvQRCKISrrtNQ
	 xiIlnoL2pBFsWohKL16xDtEf7nB8i+Qkac53bhyaER4+qi9z3bfP1iJuJ4KbTRRdDx
	 o7M8/+jU1G1NxD4lZ/34RxQenx3jaw3jyLlkfk5KZshHzXL8eefGnXzUuhjsGCfO0A
	 J41i+sV0lntGANeqwnlMfv6xWzFy68z0av4EJq8pqDIaWGwI6T/PWBh0Ew2Kov3uV4
	 TnKaogwXhIdqQ==
Date: Mon, 12 Aug 2024 09:09:32 -0600
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
Cc: Thomas Gleixner <tglx@linutronix.de>, 
 Alexey Charkov <alchark@gmail.com>, linux-iio@vger.kernel.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 linux-serial@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-i2c@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Dragan Simic <dsimic@manjaro.org>, Jagan Teki <jagan@edgeble.ai>, 
 Yifeng Zhao <yifeng.zhao@rock-chips.com>, Tim Lunn <tim@feathertop.org>, 
 Elaine Zhang <zhangqing@rock-chips.com>, Andi Shyti <andi.shyti@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Heiko Stuebner <heiko@sntech.de>, Jonathan Cameron <jic23@kernel.org>, 
 Muhammed Efe Cetin <efectn@protonmail.com>, devicetree@vger.kernel.org, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Shresth Prasad <shresthprasad7@gmail.com>, linux-kernel@vger.kernel.org, 
 Ondrej Jirman <megi@xff.cz>, Liang Chen <cl@rock-chips.com>, 
 Weizhao Ouyang <weizhao.ouyang@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
 Jimmy Hon <honyuenkwun@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, linux-rockchip@lists.infradead.org, 
 Chris Morgan <macromorgan@hotmail.com>, Andy Yan <andyshrk@163.com>, 
 Lee Jones <lee@kernel.org>
In-Reply-To: <20240802214612.434179-10-detlev.casanova@collabora.com>
References: <20240802214612.434179-1-detlev.casanova@collabora.com>
 <20240802214612.434179-10-detlev.casanova@collabora.com>
Message-Id: <172347513683.603014.1210944906291860196.robh@kernel.org>
Subject: Re: [PATCH 09/10] arm64: dts: rockchip: Add rk3576 SoC base DT


On Fri, 02 Aug 2024 17:45:36 -0400, Detlev Casanova wrote:
> This device tree contains all devices necessary for booting from network
> or SD Card.
> 
> It supports CPU, CRU, PM domains, dma, interrupts, timers, UART and
> SDHCI (everything necessary to boot Linux on this system on chip) as
> well as Ethernet, I2C, SPI and OTP.
> 
> Also add the necessary DT bindings for the SoC.
> 
> Signed-off-by: Liang Chen <cl@rock-chips.com>
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Signed-off-by: Yifeng Zhao <yifeng.zhao@rock-chips.com>
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> [rebase, squash and reword commit message]
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../boot/dts/rockchip/rk3576-pinctrl.dtsi     | 5775 +++++++++++++++++
>  arch/arm64/boot/dts/rockchip/rk3576.dtsi      | 1635 +++++
>  2 files changed, 7410 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3576.dtsi
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


New warnings running 'make CHECK_DTBS=y rockchip/rk3576-armsom-sige5.dtb' for 20240802214612.434179-10-detlev.casanova@collabora.com:

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






