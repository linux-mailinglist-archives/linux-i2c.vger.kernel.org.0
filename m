Return-Path: <linux-i2c+bounces-5469-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B95955530
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Aug 2024 05:11:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE9DB1C2188D
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Aug 2024 03:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0660354648;
	Sat, 17 Aug 2024 03:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="kwQaMqBI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF64E6FD3;
	Sat, 17 Aug 2024 03:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723864296; cv=none; b=mqkZqr82oOiU3BTvI4PioJeDPlPD+b9MoQtmaBex4r8NIyQeTqJrWSAYwQppykAu6o76rHE9N4InHVj+ATVoug8p8IAAVhXN32jxnFpPv0OX3tCAkawsc+hrYTSFVRrmtrs46l7SCCSLz9rSkVIrQbT9eDc0WPKVEis2gO3INoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723864296; c=relaxed/simple;
	bh=l38IdzJYOwLZtyjjLa9m/LqkWwtiawxtuHaK2D68IlM=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=KbveEyw27+Qi9cSnJg6+s7S0fbyn6IaZ0ntuNmJPF7CXmrWcezJtE3Usz5cB1jpoGcFsw+2Ezw3gLfChJKEBMbATokZ7rROnhu/4yaqw2EgyuQhinWUteaVJWozLfIwahYfY9rFol13MV7kBPhtgQq51fx40wJpomlpQMt2GTWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=kwQaMqBI; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1723864292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=odkph5w0PVDl1mITUK856/Sf3iEO6l5n47FubRaBVgs=;
	b=kwQaMqBIuqeUpD8pGTY+4isN7YnsejsZrk80UnjrwBa4yfM0eix0SWYi9q9jZgXWZmY4Zd
	wWZveORCVtTZekiRupv8yVTqL3d32BHXbsAyI/kMzkgR4JWpE/siLGcT2Mt5yqsN0leVmG
	w4mYe0H/1XBeYls5sovwqJwxOLtOqU3xSFOPPtN8I7DCyBSXHXvlmACLVimTLvPy7P7yko
	fwb20S8gKajjtq5/fRdaQA6kUC65LUMdjAGnkQ5/OgtsrgM60u94INCthhybYegg+//ujN
	BcPscnQadpyHUYJnYlvCA+2vm0ojvV+JK1jltT06cXFKL6ZZkrs3LScAMaxF/g==
Date: Sat, 17 Aug 2024 05:11:30 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Detlev Casanova <detlev.casanova@collabora.com>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Heiko
 Stuebner <heiko@sntech.de>, Andi Shyti <andi.shyti@kernel.org>, Jonathan
 Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, Lee Jones
 <lee@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri
 Slaby <jirislaby@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Chris Morgan
 <macromorgan@hotmail.com>, Jonas Karlman <jonas@kwiboo.se>, Tim Lunn
 <tim@feathertop.org>, Muhammed Efe Cetin <efectn@protonmail.com>, Andy Yan
 <andyshrk@163.com>, Jagan Teki <jagan@edgeble.ai>, Sebastian Reichel
 <sebastian.reichel@collabora.com>, Shresth Prasad
 <shresthprasad7@gmail.com>, Ondrej Jirman <megi@xff.cz>, Weizhao Ouyang
 <weizhao.ouyang@arm.com>, Alexey Charkov <alchark@gmail.com>, Jimmy Hon
 <honyuenkwun@gmail.com>, Finley Xiao <finley.xiao@rock-chips.com>, Yifeng
 Zhao <yifeng.zhao@rock-chips.com>, Elaine Zhang <zhangqing@rock-chips.com>,
 Liang Chen <cl@rock-chips.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-i2c@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-serial@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH 09/10] arm64: dts: rockchip: Add rk3576 SoC base DT
In-Reply-To: <20240802214612.434179-10-detlev.casanova@collabora.com>
References: <20240802214612.434179-1-detlev.casanova@collabora.com>
 <20240802214612.434179-10-detlev.casanova@collabora.com>
Message-ID: <e794a247b52dd2fc10b470ed7df4d463@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Detlev,

Please see a few comments below.

On 2024-08-02 23:45, Detlev Casanova wrote:
> This device tree contains all devices necessary for booting from 
> network
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

[snip]

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> new file mode 100644
> index 0000000000000..00c4d2a153ced
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576.dtsi
> @@ -0,0 +1,1635 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2023 Rockchip Electronics Co., Ltd.
> + */
> +
> +#include <dt-bindings/clock/rockchip,rk3576-cru.h>
> +#include <dt-bindings/reset/rockchip,rk3576-cru.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/phy/phy.h>
> +#include <dt-bindings/power/rk3576-power.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/soc/rockchip,boot-mode.h>
> +
> +/ {
> +	compatible = "rockchip,rk3576";
> +
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		ethernet0 = &gmac0;
> +		ethernet1 = &gmac1;

Please remove ethernetX aliases from the SoC dtsi.  The consensus
is that those aliases need to be defined at the board level instead.

See the commit 5d90cb1edcf7 (arm64: dts: rockchip: Remove ethernet0
alias from the SoC dtsi for RK3399, 2023-12-12), for example, for
more details.

> +		gpio0 = &gpio0;
> +		gpio1 = &gpio1;
> +		gpio2 = &gpio2;
> +		gpio3 = &gpio3;
> +		gpio4 = &gpio4;
> +		i2c0 = &i2c0;
> +		i2c1 = &i2c1;
> +		i2c2 = &i2c2;
> +		i2c3 = &i2c3;
> +		i2c4 = &i2c4;
> +		i2c5 = &i2c5;
> +		i2c6 = &i2c6;
> +		i2c7 = &i2c7;
> +		i2c8 = &i2c8;
> +		i2c9 = &i2c9;
> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +		serial2 = &uart2;
> +		serial3 = &uart3;
> +		serial4 = &uart4;
> +		serial5 = &uart5;
> +		serial6 = &uart6;
> +		serial7 = &uart7;
> +		serial8 = &uart8;
> +		serial9 = &uart9;
> +		serial10 = &uart10;
> +		serial11 = &uart11;
> +		spi0 = &spi0;
> +		spi1 = &spi1;
> +		spi2 = &spi2;
> +		spi3 = &spi3;
> +		spi4 = &spi4;
> +	};
> +
> +	xin32k: clock-32k {

Please use "xin32k: clock-xin32k { ... }" instead, because that follows
the recently established revised pattern for clock names.  We should 
have
come consistency in the new SoC dtsi additions.

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +		clock-output-names = "xin32k";
> +	};
> +
> +	xin24m: clock-24m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +		clock-output-names = "xin24m";
> +	};

Please use "xin24m: clock-xin24m { ... }" instead, for the same reasons
as already described above.

> +	spll: clock-702m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <702000000>;
> +		clock-output-names = "spll";
> +	};

Perhaps using "spll: clock-spll { ... }" instead would also be a good
idea, because it would improve the overall consistency.

